local addonName, addon = ...

local GraphicsManager = {}
addon.GraphicsManager = GraphicsManager

local lastAppliedProfileKey = nil
local lastAppliedQuality = nil

local function SetGraphicCVar(cvarName, value)
    if value == nil then return end
    local strVal
    if type(value) == "boolean" then
        strVal = value and "1" or "0"
    elseif type(value) == "number" then
        if math.floor(value) == value then
            strVal = tostring(math.floor(value))
        else
            strVal = string.format("%.2f", value)
        end
    else
        strVal = tostring(value)
    end
    if C_CVar and C_CVar.SetCVar then
        pcall(C_CVar.SetCVar, cvarName, strVal)
    elseif SetCVar then
        pcall(SetCVar, cvarName, strVal)
    end
end

function GraphicsManager.GetCVarValue(cvarName, defaultVal)
    local val
    if C_CVar and C_CVar.GetCVar then
        val = C_CVar.GetCVar(cvarName)
    elseif GetCVar then
        val = GetCVar(cvarName)
    end
    if val ~= nil and val ~= "" then
        local num = tonumber(val)
        return num or val
    end
    return defaultVal
end

function GraphicsManager.DetectCurrentZoneType()
    if not Core or not Core.Map then
        return "World"
    end

    local inInstance, instanceType = IsInInstance()
    if inInstance then
        if instanceType == "raid" then
            return "Raid"
        elseif instanceType == "party" then
            return "Dungeon"
        elseif instanceType == "scenario" then
            return "Scenario"
        end
    end

    local mapID = Core.Map:GetBestMapForUnit("player")
    if mapID then
        local mapInfo = Core.Map:GetMapInfo(mapID)
        if mapInfo then
            if mapInfo:IsRaid() then
                return "Raid"
            elseif mapInfo:IsScenario() then
                return "Scenario"
            elseif mapInfo:IsDungeon() then
                return "Dungeon"
            elseif mapInfo:IsCity() then
                return "City"
            elseif mapInfo:IsCosmic() then
                return "Cosmic"
            elseif mapInfo:IsOrphan() then
                return "Orphan"
            end
        end
    end

    return "World"
end

function GraphicsManager.GetActiveProfileKey()
    local detected = GraphicsManager.DetectCurrentZoneType()
    local db = addon.db
    if not db or not db.profiles then
        return detected
    end

    local profile = db.profiles[detected]
    if profile and profile.enabled then
        return detected
    end

    return "World"
end

function GraphicsManager.SaveCurrentWorldState()
    local db = addon.db
    if not db or not db.profiles or not db.profiles.World then return end
    local world = db.profiles.World
    world.graphicsQuality = GraphicsManager.GetCVarValue("graphicsQuality", world.graphicsQuality or 7)
    for _, item in ipairs(addon.GRAPHICS_DROPDOWNS) do
        world[item.cvar] = GraphicsManager.GetCVarValue(item.cvar, world[item.cvar] or item.default)
    end
    for _, item in ipairs(addon.DISTANCE_SLIDERS) do
        world[item.cvar] = GraphicsManager.GetCVarValue(item.cvar, world[item.cvar] or item.default)
    end
    for key, item in pairs(addon.ADVANCED_OPTIONS) do
        local val = GraphicsManager.GetCVarValue(item.cvar, world[key] or item.default)
        if item.type == "checkbox" then
            world[key] = (tonumber(val) == 1) or (val == true) or (val == "1")
        else
            world[key] = val
        end
    end
end

function GraphicsManager.RestoreWorldState()
    local db = addon.db
    if not db or not db.profiles or not db.profiles.World then return end
    local world = db.profiles.World
    SetGraphicCVar("graphicsQuality", world.graphicsQuality or 7)
    if world.customDetails then
        for _, item in ipairs(addon.GRAPHICS_DROPDOWNS) do
            if world[item.cvar] ~= nil then
                SetGraphicCVar(item.cvar, world[item.cvar])
            end
        end
        for _, item in ipairs(addon.DISTANCE_SLIDERS) do
            if world[item.cvar] ~= nil then
                SetGraphicCVar(item.cvar, world[item.cvar])
            end
        end
    end
    GraphicsManager.ApplyProfileAdvanced(world, false)
end

function GraphicsManager.ApplyProfileAdvanced(profile, isRaid)
    if not profile then return end

    for key, item in pairs(addon.ADVANCED_OPTIONS) do
        local val = profile[key]
        if val ~= nil then
            local cvar = (isRaid and item.raidCVar) or item.cvar
            if item.type == "checkbox" then
                SetGraphicCVar(cvar, val and 1 or 0)
            else
                SetGraphicCVar(cvar, val)
            end
        end
    end
end

function GraphicsManager.ApplyRaidSettings()
    local db = addon.db
    local raidProfile = db and db.profiles and db.profiles.Raid
    if raidProfile and raidProfile.enabled then
        SetGraphicCVar("RAIDsettingsEnabled", 1)
        SetGraphicCVar("RAIDgraphicsQuality", raidProfile.graphicsQuality or 4)
        if raidProfile.customDetails then
            for _, item in ipairs(addon.GRAPHICS_DROPDOWNS) do
                if raidProfile[item.cvar] ~= nil then
                    SetGraphicCVar(item.raidCVar, raidProfile[item.cvar])
                end
            end
            for _, item in ipairs(addon.DISTANCE_SLIDERS) do
                if raidProfile[item.cvar] ~= nil then
                    SetGraphicCVar(item.raidCVar, raidProfile[item.cvar])
                end
            end
        end
    else
        SetGraphicCVar("RAIDsettingsEnabled", 0)
    end
    if raidProfile and raidProfile.customAdvanced then
        GraphicsManager.ApplyProfileAdvanced(raidProfile, true)
    elseif db and db.profiles and db.profiles.World and db.profiles.World.customAdvanced then
        GraphicsManager.ApplyProfileAdvanced(db.profiles.World, true)
    end
end

function GraphicsManager.ApplyProfile(profileKey, force)
    local db = addon.db
    if not db or not db.autoSwitchEnabled then
        return
    end

    local targetKey = profileKey or GraphicsManager.GetActiveProfileKey()
    local profile = db.profiles and db.profiles[targetKey]
    if not profile then
        return
    end

    if not force and lastAppliedProfileKey == targetKey and lastAppliedQuality == profile.graphicsQuality and not profile.customDetails then
        return
    end

    if targetKey == "Raid" then
        GraphicsManager.ApplyRaidSettings()
    elseif targetKey == "World" then
        GraphicsManager.RestoreWorldState()
    else
        -- Entering custom zone (City, Dungeon, Scenario, Cosmic, Orphan)
        if lastAppliedProfileKey == "World" or lastAppliedProfileKey == nil then
            GraphicsManager.SaveCurrentWorldState()
        end

        SetGraphicCVar("graphicsQuality", profile.graphicsQuality)

        if profile.customDetails then
            for _, item in ipairs(addon.GRAPHICS_DROPDOWNS) do
                local val = profile[item.cvar]
                if val ~= nil then
                    SetGraphicCVar(item.cvar, val)
                end
            end
            for _, item in ipairs(addon.DISTANCE_SLIDERS) do
                local val = profile[item.cvar]
                if val ~= nil then
                    SetGraphicCVar(item.cvar, val)
                end
            end
        end

        if profile.customAdvanced then
            GraphicsManager.ApplyProfileAdvanced(profile)
        elseif db.profiles and db.profiles.World and db.profiles.World.customAdvanced then
            -- Fall back to World advanced settings if profile does not customize advanced
            GraphicsManager.ApplyProfileAdvanced(db.profiles.World)
        end
    end

    if db.notifyInChat and (lastAppliedProfileKey ~= targetKey or force) then
        local L = addon.L
        local zoneLabel = addon.GetText(nil, "ZONE_" .. string.upper(targetKey)) or targetKey
        print(string.format(L.PROFILE_SWITCHED, zoneLabel, profile.graphicsQuality))
    end

    lastAppliedProfileKey = targetKey
    lastAppliedQuality = profile.graphicsQuality
end

function GraphicsManager.OnZoneChanged()
    GraphicsManager.ApplyProfile(nil, false)
end

function GraphicsManager.ForceRefresh()
    GraphicsManager.ApplyProfile(nil, true)
end
