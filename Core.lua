
local addonName, addon = ...

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("ZONE_CHANGED")
frame:RegisterEvent("ZONE_CHANGED_INDOORS")

local isInitialized = false

local function OnEvent(self, event, arg1, ...)
    if event == "ADDON_LOADED" then
        if arg1 == addonName then
            addon.InitDatabase()
            if addon.InitOptionsPanel then
                addon.InitOptionsPanel()
            end
        end
    elseif event == "PLAYER_LOGIN" then
        if not isInitialized then
            addon.InitDatabase()
            if addon.InitOptionsPanel then
                addon.InitOptionsPanel()
            end
            isInitialized = true
        end
    elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" or event == "ZONE_CHANGED" or event == "ZONE_CHANGED_INDOORS" then
        if isInitialized and addon.GraphicsManager then
            addon.GraphicsManager.OnZoneChanged()
        end
    end
end

frame:SetScript("OnEvent", OnEvent)

SLASH_UWOWEA_ADVANCED_SETTINGS1 = "/uas"
SLASH_UWOWEA_ADVANCED_SETTINGS2 = "/uwas"
SLASH_UWOWEA_ADVANCED_SETTINGS3 = "/advancedsettings"

SlashCmdList["UWOWEA_ADVANCED_SETTINGS"] = function(msg)
    local cmd = msg and msg:trim():lower() or ""
    if cmd == "status" then
        local detected = addon.GraphicsManager and addon.GraphicsManager.DetectCurrentZoneType() or "Unknown"
        local active = addon.GraphicsManager and addon.GraphicsManager.GetActiveProfileKey() or "Unknown"
        local mapID = Core and Core.Map and Core.Map:GetBestMapForUnit("player")
        local mapName = "Unknown"
        if mapID and Core and Core.Map then
            ---@type Core.MapInfo|nil
            local mapInfo = Core.Map:GetMapInfo(mapID)
            if mapInfo then
                mapName = string.format("%s (ID: %d, Type: %s, City: %s)", mapInfo.name or "N/A", mapInfo.mapID or 0, tostring(mapInfo.mapType), tostring(mapInfo:IsCity()))
            end
        end
        print("|cff00ff00[Uwowea Settings]|r Current map: " .. mapName)
        print("|cff00ff00[Uwowea Settings]|r Detected zone type: |cffffd100" .. detected .. "|r, Active profile: |cffffd100" .. active .. "|r")
    elseif cmd == "apply" then
        if addon.GraphicsManager then
            addon.GraphicsManager.ForceRefresh()
            print("|cff00ff00[Uwowea Settings]|r Graphics profile re-applied.")
        end
    else
        if Settings and Settings.OpenToCategory and addon.mainCategoryID then
            Settings.OpenToCategory(addon.mainCategoryID)
        elseif Settings and Settings.OpenToCategory then
            Settings.OpenToCategory(addon.L.TITLE)
        else
            print("|cff00ff00[Uwowea Settings]|r Use /uas status or /uas apply")
        end
    end
end

