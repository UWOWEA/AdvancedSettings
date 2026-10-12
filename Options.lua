local addonName, addon = ...
local UI = _G["UI"]

local mainCategory = nil
addon.registeredSettings = addon.registeredSettings or {}
addon.categoryByZone = addon.categoryByZone or {}

local function RegisterSetting(varKey, setting)
    if setting then
        addon.registeredSettings[varKey] = setting
    end
    return setting
end

local function UpdateSettingControl(varKey, value)
    local setting = (addon.registeredSettings and addon.registeredSettings[varKey])
        or (Settings and Settings.GetSetting and Settings.GetSetting(varKey))
    if setting then
        if setting.SetValue then
            pcall(setting.SetValue, setting, value, true)
        end
        if setting.NotifyUpdate then
            pcall(setting.NotifyUpdate, setting)
        end
    end
end

local function RefreshCurrentCategoryView()
    if SettingsPanel and SettingsPanel.IsShown and SettingsPanel:IsShown() then
        local currentCat = SettingsPanel.GetCurrentCategory and SettingsPanel:GetCurrentCategory()
        if currentCat then
            if SettingsPanel.DisplayCategory then
                pcall(SettingsPanel.DisplayCategory, SettingsPanel, currentCat)
            elseif SettingsPanel.SelectCategory then
                pcall(SettingsPanel.SelectCategory, SettingsPanel, currentCat, true)
            end
        end
    end
end

---Applies the "3 Kings + 1 Prince" preset to a given zone profile and immediately refreshes UI controls
---@param zoneType string
function addon.ApplyThreeKingsPreset(zoneType)
    local db = addon.db
    local profile = db and db.profiles and db.profiles[zoneType]
    if not profile then return end

    local isWorld = (zoneType == "World")
    local isRaid = (zoneType == "Raid")

    -- 1. Explicitly update profile values
    profile.customDetails = true
    profile.graphicsViewDistance = 7
    profile.graphicsEnvironmentDetail = 1
    profile.graphicsGroundClutter = 1
    profile.graphicsParticleDensity = 4
    profile.raidGraphicsParticleDensity = 4
    profile.graphicsShadowQuality = 0
    profile.graphicsLiquidDetail = 0
    profile.graphicsSSAO = 0
    profile.raidGraphicsSSAO = 0
    profile.graphicsDepthEffects = 0
    profile.graphicsComputeEffects = 0
    profile.graphicsTextureResolution = 2
    profile.graphicsSpellDensity = 1
    profile.graphicsProjectedTextures = 1

    -- 2. Update setting controls to notify Blizzard UI widgets
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_CUSTOM_DETAILS", profile.customDetails)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsViewDistance", profile.graphicsViewDistance)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsEnvironmentDetail", profile.graphicsEnvironmentDetail7)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsGroundClutter", profile.graphicsGroundClutter)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsParticleDensity", profile.graphicsParticleDensity)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_raidGraphicsParticleDensity", profile.raidGraphicsParticleDensity)

    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsShadowQuality", profile.graphicsShadowQuality)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsLiquidDetail", profile.graphicsLiquidDetail)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsSSAO", profile.graphicsSSAO)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_raidGraphicsSSAO", profile.raidGraphicsSSAO)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsDepthEffects", profile.graphicsDepthEffects)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsComputeEffects", profile.graphicsComputeEffects)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsTextureResolution", profile.graphicsTextureResolution)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsSpellDensity", profile.graphicsSpellDensity)
    UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_graphicsProjectedTextures", profile.graphicsProjectedTextures)

    -- 3. Set CVars directly if World or Raid
    if isWorld or isRaid then
        local pvd = isRaid and "raidGraphicsViewDistance" or "graphicsViewDistance"
        local ped = isRaid and "raidGraphicsEnvironmentDetail" or "graphicsEnvironmentDetail"
        local pgc = isRaid and "raidGraphicsGroundClutter" or "graphicsGroundClutter"
        local ppd = isRaid and "raidGraphicsParticleDensity" or "graphicsParticleDensity"
        SetCVar(pvd, "7")
        SetCVar(ped, "7")
        SetCVar(pgc, "1")
        SetCVar(ppd, "1")
    end

    -- 4. Apply to engine if active
    if addon.GraphicsManager.GetActiveProfileKey() == zoneType then
        addon.GraphicsManager.ForceRefresh()
    end

    -- 5. Immediately redisplay whatever category is open on screen so all sliders move visually
    RefreshCurrentCategoryView()

    local zoneLabel = addon.GetText(nil, "ZONE_" .. string.upper(zoneType)) or zoneType
    print(string.format(addon.GetText(nil, "THREE_KINGS_APPLIED"), zoneLabel))
end

---Builds the graphics options for a specific zone profile
---@param parentCategory table
---@param zoneType string
local function BuildZoneProfileControls(parentCategory, zoneType)
    addon.categoryByZone[zoneType] = parentCategory
    local L = addon.L
    local db = addon.db
    local profile = db.profiles[zoneType]
    local isWorld = (zoneType == "World")
    local isRaid = (zoneType == "Raid")
    local GraphicsManager = addon.GraphicsManager

    -- 1. Profile Enable checkbox
    if isRaid then
        -- Raid uses native in-game RAIDsettingsEnabled
        RegisterSetting(
            "UWOWEA_ADV_RAID_ENABLED",
            UI.Widgets.Settings:CreateCheckbox(
                parentCategory,
                "UWOWEA_ADV_RAID_ENABLED",
                addon.GetText("RAID_SETTINGS_ENABLED", "PROFILE_ENABLED"),
                true,
                function()
                    local cvarVal = GraphicsManager.GetCVarValue("RAIDsettingsEnabled", profile.enabled and 1 or 0)
                    return tonumber(cvarVal) == 1
                end,
                function(value)
                    profile.enabled = value
                    SetCVar("RAIDsettingsEnabled", value and "1" or "0")
                    if GraphicsManager.GetActiveProfileKey() == "Raid" then
                        GraphicsManager.ForceRefresh()
                    end
                end,
                addon.GetText(nil, "RAID_ENABLED_DESC")
            )
        )
    elseif not isWorld then
        -- Custom zones (City, Dungeon, Scenario, Cosmic, Orphan)
        RegisterSetting(
            "UWOWEA_ADV_" .. zoneType .. "_ENABLED",
            UI.Widgets.Settings:CreateCheckbox(
                parentCategory,
                "UWOWEA_ADV_" .. zoneType .. "_ENABLED",
                addon.GetText(nil, "PROFILE_ENABLED"),
                profile.enabled ~= false,
                function() return profile.enabled end,
                function(value)
                    profile.enabled = value
                    if GraphicsManager.DetectCurrentZoneType() == zoneType then
                        GraphicsManager.ForceRefresh()
                    end
                end,
                addon.GetText(nil, "PROFILE_ENABLED_DESC")
            )
        )
    end

    -- 2. "3 Kings + 1 Prince" Bottleneck Preset button
    UI.Widgets.Settings:CreateButton(
        parentCategory,
        addon.GetText(nil, "THREE_KINGS_TITLE"),
        addon.GetText(nil, "THREE_KINGS_BTN"),
        function()
            addon.ApplyThreeKingsPreset(zoneType)
        end,
        addon.GetText(nil, "THREE_KINGS_DESC")
    )

    -- 3. Overall Quality Slider (1 to 10)
    local qualityLabel = isWorld and addon.GetText("BASE_GRAPHICS_QUALITY", "GRAPHICS_QUALITY")
        or (isRaid and addon.GetText("SETTINGS_RAID_GRAPHICS_QUALITY", "GRAPHICS_QUALITY")
        or addon.GetText("GRAPHICS_QUALITY", "GRAPHICS_QUALITY"))

    local qualityTooltip = isRaid and addon.GetText("OPTION_TOOLTIP_RAID_GRAPHICS_QUALITY", "GRAPHICS_QUALITY_DESC")
        or addon.GetText("OPTION_TOOLTIP_GRAPHICS_QUALITY", "GRAPHICS_QUALITY_DESC")

    local qualityCVar = isRaid and "RAIDgraphicsQuality" or "graphicsQuality"

    RegisterSetting(
        "UWOWEA_ADV_" .. zoneType .. "_QUALITY",
        UI.Widgets.Settings:CreateSlider(
            parentCategory,
            "UWOWEA_ADV_" .. zoneType .. "_QUALITY",
            qualityLabel,
            1,
            10,
            1,
            profile.graphicsQuality or 7,
            function()
                if isWorld or isRaid then
                    local cvarVal = GraphicsManager.GetCVarValue(qualityCVar, profile.graphicsQuality or 7)
                    return math.floor(tonumber(cvarVal) or profile.graphicsQuality or 7)
                end
                return profile.graphicsQuality or 7
            end,
            function(value)
                local quality = math.floor(value + 0.5)
                profile.graphicsQuality = quality

                if isWorld or isRaid then
                    SetCVar(qualityCVar, tostring(quality))
                end

                if not profile.customDetails then
                    local defaults = addon.GetPresetDefaults(quality)
                    for k, v in pairs(defaults) do
                        profile[k] = v
                        UpdateSettingControl("UWOWEA_ADV_" .. zoneType .. "_" .. k, v)
                    end
                    RefreshCurrentCategoryView()
                end

                if GraphicsManager.GetActiveProfileKey() == zoneType then
                    GraphicsManager.ForceRefresh()
                end
            end,
            qualityTooltip,
            function(val) return tostring(math.floor(val + 0.5)) end
        )
    )

    -- 3. Customize Detailed Graphics checkbox
    RegisterSetting(
        "UWOWEA_ADV_" .. zoneType .. "_CUSTOM_DETAILS",
        UI.Widgets.Settings:CreateCheckbox(
            parentCategory,
            "UWOWEA_ADV_" .. zoneType .. "_CUSTOM_DETAILS",
            addon.GetText(nil, "CUSTOM_DETAILS"),
            profile.customDetails == true,
            function() return profile.customDetails end,
            function(value)
                profile.customDetails = value
                if GraphicsManager.GetActiveProfileKey() == zoneType then
                    GraphicsManager.ForceRefresh()
                end
            end,
            addon.GetText(nil, "CUSTOM_DETAILS_DESC")
        )
    )

    -- 4. The 10 Dropdowns (Left & Right columns)
    for _, item in ipairs(addon.GRAPHICS_DROPDOWNS) do
        local cvarToUse = isRaid and item.raidCVar or item.cvar
        local name = addon.GetText(item.nameGlobal, item.nameFallback)
        local tooltip = addon.GetText(item.tooltipGlobal, item.tooltipFallback)

        local optionsList = {}
        for _, opt in ipairs(item.options) do
            table.insert(optionsList, {
                value = opt.value,
                text = addon.GetText(opt.textGlobal, opt.textFallback),
                tooltip = opt.tooltipGlobal and addon.GetText(opt.tooltipGlobal, nil) or nil,
            })
        end

        RegisterSetting(
            "UWOWEA_ADV_" .. zoneType .. "_" .. item.cvar,
            UI.Widgets.Settings:CreateDropdown(
                parentCategory,
                "UWOWEA_ADV_" .. zoneType .. "_" .. item.cvar,
                name,
                profile[item.cvar] or item.default,
                function()
                    if isWorld or isRaid then
                        local cvarVal = GraphicsManager.GetCVarValue(cvarToUse, profile[item.cvar] or item.default)
                        return tonumber(cvarVal) or profile[item.cvar] or item.default
                    end
                    return profile[item.cvar] or item.default
                end,
                function(value)
                    local numVal = tonumber(value) or 0
                    profile[item.cvar] = numVal

                    if isWorld or isRaid then
                        SetCVar(cvarToUse, tostring(numVal))
                    end

                    if profile.customDetails and GraphicsManager.GetActiveProfileKey() == zoneType then
                        GraphicsManager.ForceRefresh()
                    end
                end,
                optionsList,
                tooltip
            )
        )
    end

    -- 5. The 3 Distance Sliders
    for _, item in ipairs(addon.DISTANCE_SLIDERS) do
        local cvarToUse = isRaid and item.raidCVar or item.cvar
        local name = addon.GetText(item.nameGlobal, item.nameFallback)
        local tooltip = addon.GetText(item.tooltipGlobal, item.tooltipFallback)

        RegisterSetting(
            "UWOWEA_ADV_" .. zoneType .. "_" .. item.cvar,
            UI.Widgets.Settings:CreateSlider(
                parentCategory,
                "UWOWEA_ADV_" .. zoneType .. "_" .. item.cvar,
                name,
                item.min,
                item.max,
                item.step,
                profile[item.cvar] or item.default,
                function()
                    if isWorld or isRaid then
                        local cvarVal = GraphicsManager.GetCVarValue(cvarToUse, profile[item.cvar] or item.default)
                        return tonumber(cvarVal) or profile[item.cvar] or item.default
                    end
                    return profile[item.cvar] or item.default
                end,
                function(value)
                    local numVal = math.floor(value + 0.5)
                    profile[item.cvar] = numVal

                    if isWorld or isRaid then
                        SetCVar(cvarToUse, tostring(numVal))
                    end

                    if profile.customDetails and GraphicsManager.GetActiveProfileKey() == zoneType then
                        GraphicsManager.ForceRefresh()
                    end
                end,
                tooltip,
                function(val) return tostring(math.floor(val + 0.5)) end
            )
        )
    end

    -- 6. Customize Advanced Graphics checkbox
    RegisterSetting(
        "UWOWEA_ADV_" .. zoneType .. "_CUSTOM_ADVANCED",
        UI.Widgets.Settings:CreateCheckbox(
            parentCategory,
            "UWOWEA_ADV_" .. zoneType .. "_CUSTOM_ADVANCED",
            addon.GetText(nil, "CUSTOM_ADVANCED"),
            profile.customAdvanced == true,
            function() return profile.customAdvanced end,
            function(value)
                profile.customAdvanced = value
                if GraphicsManager.GetActiveProfileKey() == zoneType then
                    GraphicsManager.ForceRefresh()
                end
            end,
            addon.GetText(nil, "CUSTOM_ADVANCED_DESC")
        )
    )

    -- 7. Advanced Options (Checkboxes, Dropdowns, Sliders)
    for _, optKey in ipairs(addon.ADVANCED_ITEMS_ORDER) do
        local item = addon.ADVANCED_OPTIONS[optKey]
        if item then
            local name = addon.GetText(item.nameGlobal, item.nameFallback)
            local tooltip = addon.GetText(item.tooltipGlobal, item.tooltipFallback)
            local cvarToUse = (isRaid and item.raidCVar) or item.cvar

            if item.type == "checkbox" then
                RegisterSetting(
                    "UWOWEA_ADV_" .. zoneType .. "_" .. optKey,
                    UI.Widgets.Settings:CreateCheckbox(
                        parentCategory,
                        "UWOWEA_ADV_" .. zoneType .. "_" .. optKey,
                        name,
                        profile[optKey] == true,
                        function()
                            if isWorld or (isRaid and item.raidCVar) then
                                local cvarVal = GraphicsManager.GetCVarValue(cvarToUse, profile[optKey] and 1 or 0)
                                return tonumber(cvarVal) == 1
                            end
                            return profile[optKey] == true
                        end,
                        function(value)
                            profile[optKey] = value
                            if isWorld or (isRaid and item.raidCVar) then
                                SetCVar(cvarToUse, value and "1" or "0")
                            end
                            if profile.customAdvanced and GraphicsManager.GetActiveProfileKey() == zoneType then
                                GraphicsManager.ForceRefresh()
                            end
                        end,
                        tooltip
                    )
                )
            elseif item.type == "dropdown" then
                local optionsList = {}
                for _, opt in ipairs(item.options) do
                    table.insert(optionsList, {
                        value = opt.value,
                        text = addon.GetText(opt.textGlobal, opt.textFallback),
                        tooltip = opt.tooltipGlobal and addon.GetText(opt.tooltipGlobal, nil) or nil,
                    })
                end

                RegisterSetting(
                    "UWOWEA_ADV_" .. zoneType .. "_" .. optKey,
                    UI.Widgets.Settings:CreateDropdown(
                        parentCategory,
                        "UWOWEA_ADV_" .. zoneType .. "_" .. optKey,
                        name,
                        profile[optKey] or item.default,
                        function()
                            if isWorld or (isRaid and item.raidCVar) then
                                local cvarVal = GraphicsManager.GetCVarValue(cvarToUse, profile[optKey] or item.default)
                                return tonumber(cvarVal) or profile[optKey] or item.default
                            end
                            return profile[optKey] or item.default
                        end,
                        function(value)
                            local numVal = tonumber(value) or item.default
                            profile[optKey] = numVal
                            if isWorld or (isRaid and item.raidCVar) then
                                SetCVar(cvarToUse, tostring(numVal))
                            end
                            if profile.customAdvanced and GraphicsManager.GetActiveProfileKey() == zoneType then
                                GraphicsManager.ForceRefresh()
                            end
                        end,
                        optionsList,
                        tooltip
                    )
                )
            elseif item.type == "slider" then
                RegisterSetting(
                    "UWOWEA_ADV_" .. zoneType .. "_" .. optKey,
                    UI.Widgets.Settings:CreateSlider(
                        parentCategory,
                        "UWOWEA_ADV_" .. zoneType .. "_" .. optKey,
                        name,
                        item.min,
                        item.max,
                        item.step,
                        profile[optKey] or item.default,
                        function()
                            if isWorld or (isRaid and item.raidCVar) then
                                local cvarVal = GraphicsManager.GetCVarValue(cvarToUse, profile[optKey] or item.default)
                                return tonumber(cvarVal) or profile[optKey] or item.default
                            end
                            return profile[optKey] or item.default
                        end,
                        function(value)
                            local val
                            if item.step < 1 then
                                val = math.floor(value / item.step + 0.5) * item.step
                                val = tonumber(string.format("%.2f", val))
                            else
                                val = math.floor(value + 0.5)
                            end
                            profile[optKey] = val
                            if isWorld or (isRaid and item.raidCVar) then
                                local strVal
                                if item.step < 1 then
                                    strVal = string.format("%.2f", val)
                                else
                                    strVal = tostring(math.floor(val))
                                end
                                SetCVar(cvarToUse, strVal)
                            end
                            if profile.customAdvanced and GraphicsManager.GetActiveProfileKey() == zoneType then
                                GraphicsManager.ForceRefresh()
                            end
                        end,
                        tooltip,
                        item.formatter or function(val) return tostring(math.floor(val + 0.5)) end
                    )
                )
            end
        end
    end
end

local function BuildSettingsPanel()
    if not UI or not UI.Widgets or not UI.Widgets.Settings then
        return
    end

    local L = addon.L
    local db = addon.db

    -- 1. Main Category
    mainCategory = Settings.RegisterVerticalLayoutCategory(L.TITLE)
    addon.mainCategoryID = mainCategory:GetID()

    UI.Widgets.Settings:CreateCheckbox(
        mainCategory,
        "UWOWEA_ADV_AUTO_SWITCH",
        addon.GetText(nil, "ENABLE_AUTO_SWITCH"),
        true,
        function() return db.autoSwitchEnabled end,
        function(value)
            db.autoSwitchEnabled = value
            if value then
                addon.GraphicsManager.ForceRefresh()
            end
        end,
        addon.GetText(nil, "ENABLE_AUTO_SWITCH_DESC")
    )

    UI.Widgets.Settings:CreateCheckbox(
        mainCategory,
        "UWOWEA_ADV_NOTIFY_CHAT",
        addon.GetText(nil, "NOTIFY_CHAT"),
        false,
        function() return db.notifyInChat end,
        function(value)
            db.notifyInChat = value
        end,
        addon.GetText(nil, "NOTIFY_CHAT_DESC")
    )

    -- Preset button to apply 3 Kings + 1 Prince to current active profile
    UI.Widgets.Settings:CreateButton(
        mainCategory,
        addon.GetText(nil, "APPLY_TO_ACTIVE_PROFILE"),
        addon.GetText(nil, "THREE_KINGS_BTN"),
        function()
            local activeKey = addon.GraphicsManager.GetActiveProfileKey()
            addon.ApplyThreeKingsPreset(activeKey)
        end,
        addon.GetText(nil, "APPLY_TO_ACTIVE_PROFILE_DESC")
    )

    -- 2. Subcategory for each Zone Profile
    for _, zoneType in ipairs(addon.ZONE_TYPES) do
        local zoneLabel = addon.GetText(nil, "ZONE_" .. string.upper(zoneType)) or zoneType
        local subcategory = Settings.RegisterVerticalLayoutSubcategory(mainCategory, zoneLabel)
        BuildZoneProfileControls(subcategory, zoneType)
    end

    Settings.RegisterAddOnCategory(mainCategory)
end

function addon.InitOptionsPanel()
    if mainCategory then return end
    local ok, err = pcall(BuildSettingsPanel)
    if not ok then
        mainCategory = nil
        print("|cffff0000[Uwowea AdvancedSettings]|r Error initializing settings: " .. tostring(err))
    end
end
