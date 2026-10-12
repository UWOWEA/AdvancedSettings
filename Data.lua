local addonName, addon = ...

addon.ZONE_TYPES = {
    "World",
    "Raid",
    "Dungeon",
    "City",
    "Scenario",
    "Cosmic",
    "Orphan",
}

---Gets localized text from Blizzard global string or addon fallback
---@param globalKey? string
---@param fallbackKey? string
---@return string
function addon.GetText(globalKey, fallbackKey)
    if globalKey and _G[globalKey] and _G[globalKey] ~= "" then
        return _G[globalKey]
    end
    if fallbackKey and addon.L and addon.L[fallbackKey] then
        return addon.L[fallbackKey]
    end
    return fallbackKey or globalKey or ""
end

addon.GRAPHICS_DROPDOWNS = {
    -- Left column
    {
        cvar = "graphicsShadowQuality",
        raidCVar = "raidGraphicsShadowQuality",
        nameGlobal = "SHADOW_QUALITY",
        nameFallback = "SHADOW_QUALITY",
        tooltipGlobal = "OPTION_TOOLTIP_SHADOW_QUALITY",
        tooltipFallback = "SHADOW_QUALITY_DESC",
        column = "left",
        default = 3,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW", tooltipGlobal = "VIDEO_OPTIONS_SHADOW_QUALITY_LOW" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_FAIR", textFallback = "OPT_FAIR", tooltipGlobal = "VIDEO_OPTIONS_SHADOW_QUALITY_FAIR" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM", tooltipGlobal = "VIDEO_OPTIONS_SHADOW_QUALITY_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH", tooltipGlobal = "VIDEO_OPTIONS_SHADOW_QUALITY_HIGH" },
            { value = 4, textGlobal = "VIDEO_OPTIONS_ULTRA", textFallback = "OPT_ULTRA", tooltipGlobal = "VIDEO_OPTIONS_SHADOW_QUALITY_ULTRA" },
            { value = 5, textGlobal = "VIDEO_OPTIONS_ULTRA_HIGH", textFallback = "OPT_ULTRA_HIGH", tooltipGlobal = "VIDEO_OPTIONS_SHADOW_QUALITY_ULTRA_HIGH" },
        },
    },
    {
        cvar = "graphicsLiquidDetail",
        raidCVar = "raidGraphicsLiquidDetail",
        nameGlobal = "LIQUID_DETAIL",
        nameFallback = "LIQUID_DETAIL",
        tooltipGlobal = "OPTION_TOOLTIP_LIQUID_DETAIL",
        tooltipFallback = "LIQUID_DETAIL_DESC",
        column = "left",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW", tooltipGlobal = "VIDEO_OPTIONS_LIQUID_DETAIL_LOW" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_FAIR", textFallback = "OPT_FAIR", tooltipGlobal = "VIDEO_OPTIONS_LIQUID_DETAIL_FAIR" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM", tooltipGlobal = "VIDEO_OPTIONS_LIQUID_DETAIL_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_ULTRA", textFallback = "OPT_ULTRA", tooltipGlobal = "VIDEO_OPTIONS_LIQUID_DETAIL_ULTRA" },
        },
    },
    {
        cvar = "graphicsParticleDensity",
        raidCVar = "raidGraphicsParticleDensity",
        nameGlobal = "PARTICLE_DENSITY",
        nameFallback = "PARTICLE_DENSITY",
        tooltipGlobal = "OPTION_TOOLTIP_PARTICLE_DENSITY",
        tooltipFallback = "PARTICLE_DENSITY_DESC",
        column = "left",
        default = 3,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_FAIR", textFallback = "OPT_FAIR" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM" },
            { value = 4, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
            { value = 5, textGlobal = "VIDEO_OPTIONS_ULTRA", textFallback = "OPT_ULTRA" },
        },
    },
    {
        cvar = "graphicsSSAO",
        raidCVar = "raidGraphicsSSAO",
        nameGlobal = "SSAO_LABEL",
        nameFallback = "SSAO",
        tooltipGlobal = "OPTION_TOOLTIP_SSAO",
        tooltipFallback = "SSAO_DESC",
        column = "left",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
            { value = 4, textGlobal = "VIDEO_OPTIONS_ULTRA", textFallback = "OPT_ULTRA" },
        },
    },
    {
        cvar = "graphicsDepthEffects",
        raidCVar = "raidGraphicsDepthEffects",
        nameGlobal = "DEPTH_EFFECTS",
        nameFallback = "DEPTH_EFFECTS",
        tooltipGlobal = "OPTION_TOOLTIP_DEPTH_EFFECTS",
        tooltipFallback = "DEPTH_EFFECTS_DESC",
        column = "left",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED", tooltipGlobal = "VIDEO_OPTIONS_DEPTH_EFFECTS_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW", tooltipGlobal = "VIDEO_OPTIONS_DEPTH_EFFECTS_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM", tooltipGlobal = "VIDEO_OPTIONS_DEPTH_EFFECTS_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH", tooltipGlobal = "VIDEO_OPTIONS_DEPTH_EFFECTS_HIGH" },
        },
    },
    {
        cvar = "graphicsComputeEffects",
        raidCVar = "raidGraphicsComputeEffects",
        nameGlobal = "COMPUTE_EFFECTS",
        nameFallback = "COMPUTE_EFFECTS",
        tooltipGlobal = "OPTION_TOOLTIP_COMPUTE_EFFECTS",
        tooltipFallback = "COMPUTE_EFFECTS_DESC",
        column = "left",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED", tooltipGlobal = "VIDEO_OPTIONS_COMPUTE_EFFECTS_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW", tooltipGlobal = "VIDEO_OPTIONS_COMPUTE_EFFECTS_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM", tooltipGlobal = "VIDEO_OPTIONS_COMPUTE_EFFECTS_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH", tooltipGlobal = "VIDEO_OPTIONS_COMPUTE_EFFECTS_HIGH" },
            { value = 4, textGlobal = "VIDEO_OPTIONS_ULTRA", textFallback = "OPT_ULTRA", tooltipGlobal = "VIDEO_OPTIONS_COMPUTE_EFFECTS_ULTRA" },
        },
    },
    {
        cvar = "graphicsOutlineMode",
        raidCVar = "raidGraphicsOutlineMode",
        nameGlobal = "OUTLINE_MODE",
        nameFallback = "OUTLINE_MODE",
        tooltipGlobal = "OPTION_TOOLTIP_OUTLINE_MODE",
        tooltipFallback = "OUTLINE_MODE_DESC",
        column = "left",
        default = 1,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
        },
    },

    -- Right column
    {
        cvar = "graphicsTextureResolution",
        raidCVar = "raidGraphicsTextureResolution",
        nameGlobal = "TEXTURE_DETAIL",
        nameFallback = "TEXTURE_RESOLUTION",
        tooltipGlobal = "OPTION_TOOLTIP_TEXTURE_DETAIL",
        tooltipFallback = "TEXTURE_RESOLUTION_DESC",
        column = "right",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_FAIR", textFallback = "OPT_FAIR" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
        },
    },
    {
        cvar = "graphicsSpellDensity",
        raidCVar = "raidGraphicsSpellDensity",
        nameGlobal = "SPELL_DENSITY",
        nameFallback = "SPELL_DENSITY",
        tooltipGlobal = "OPTION_TOOLTIP_SPELL_DENSITY",
        tooltipFallback = "SPELL_DENSITY_DESC",
        column = "right",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_SFX_DENSITY_MIN", textFallback = "OPT_SPELL_ESSENTIAL", tooltipGlobal = "VIDEO_OPTIONS_SFX_DENSITY_MIN_TOOLTIP" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_SFX_DENSITY_REDUCED", textFallback = "OPT_SPELL_PARTIAL", tooltipGlobal = "VIDEO_OPTIONS_SFX_DENSITY_REDUCED_TOOLTIP" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_SFX_DENSITY_FULL", textFallback = "OPT_SPELL_ALL", tooltipGlobal = "VIDEO_OPTIONS_SFX_DENSITY_FULL_TOOLTIP" },
        },
    },
    {
        cvar = "graphicsProjectedTextures",
        raidCVar = "raidGraphicsProjectedTextures",
        nameGlobal = "PROJECTED_TEXTURES",
        nameFallback = "PROJECTED_TEXTURES",
        tooltipGlobal = "OPTION_TOOLTIP_PROJECTED_TEXTURES",
        tooltipFallback = "PROJECTED_TEXTURES_DESC",
        column = "right",
        default = 1,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_ENABLED", textFallback = "OPT_ENABLED" },
        },
    },
}

addon.DISTANCE_SLIDERS = {
    {
        cvar = "graphicsViewDistance",
        raidCVar = "raidGraphicsViewDistance",
        nameGlobal = "FARCLIP",
        nameFallback = "VIEW_DISTANCE",
        tooltipGlobal = "OPTION_TOOLTIP_FARCLIP",
        tooltipFallback = "VIEW_DISTANCE_DESC",
        min = 1,
        max = 10,
        step = 1,
        default = 7,
    },
    {
        cvar = "graphicsEnvironmentDetail",
        raidCVar = "raidGraphicsEnvironmentDetail",
        nameGlobal = "ENVIRONMENT_DETAIL",
        nameFallback = "ENVIRONMENT_DETAIL",
        tooltipGlobal = "OPTION_TOOLTIP_ENVIRONMENT_DETAIL",
        tooltipFallback = "ENVIRONMENT_DETAIL_DESC",
        min = 1,
        max = 10,
        step = 1,
        default = 7,
    },
    {
        cvar = "graphicsGroundClutter",
        raidCVar = "raidGraphicsGroundClutter",
        nameGlobal = "GROUND_CLUTTER",
        nameFallback = "GROUND_CLUTTER",
        tooltipGlobal = "OPTION_TOOLTIP_GROUND_CLUTTER",
        tooltipFallback = "GROUND_CLUTTER_DESC",
        min = 1,
        max = 10,
        step = 1,
        default = 7,
    },
}

addon.ADVANCED_ITEMS_ORDER = {
    -- Display & Latency
    "renderScale",
    "vsync",
    "tripleBuffering",
    "LowLatencyMode",
    "gxMaxFrameLatency",
    "antiAliasing",
    "msaaQuality",
    "msaaAlphaTest",

    -- Advanced Graphics & Lighting
    "textureFiltering",
    "lightMode",
    "shadowrt",
    "shadowSoft",
    "sunShafts",
    "refraction",
    "resampleQuality",
    "vrsValar",
    "physicsLevel",

    -- CPU: Draw Calls, LOD & Culling
    "doodadLodDist",
    "AnimDoodadLodDist",
    "wmoLodDist",
    "lodObjectMinSize",
    "entityLodDist",

    -- CPU: Nameplates & Combat UI
    "nameplateMaxDist",
    "nameplateMotion",

    -- CPU: Audio Mixer & DSP
    "soundChannels",
    "soundDSP",

    -- Spell Clutter & Effects
    "spellClutter",

    -- FPS Limits
    "useMaxFPS",
    "maxFPS",
    "useMaxFPSBk",
    "maxFPSBk",
    "useTargetFPS",
    "targetFPS",

    -- Post Processing & Colors
    "ResampleSharpness",
    "Contrast",
    "Brightness",
    "Gamma",

    -- Hidden Bottleneck & Performance CVars
    "VolumeFogLevel",
    "groundEffectDist",
    "groundEffectDensity",
    "weatherDensity",
    "reflectionMode",
    "rippleDetail",
    "ffxGlow",
    "ffxDeath",
    "ffxNether",
}

addon.ADVANCED_OPTIONS = {
    -- Boolean checkboxes
    tripleBuffering = {
        cvar = "gxTripleBuffer",
        nameGlobal = "TRIPLE_BUFFER",
        nameFallback = "TRIPLE_BUFFERING",
        tooltipGlobal = "OPTION_TOOLTIP_TRIPLE_BUFFER",
        tooltipFallback = "TRIPLE_BUFFERING_DESC",
        type = "checkbox",
        default = false,
    },
    useMaxFPS = {
        cvar = "useMaxFPS",
        nameGlobal = "MAXFPS_CHECK",
        nameFallback = "MAX_FPS_ENABLE",
        tooltipGlobal = "OPTION_MAXFPS_CHECK",
        tooltipFallback = "MAX_FPS_ENABLE_DESC",
        type = "checkbox",
        default = false,
    },
    useMaxFPSBk = {
        cvar = "useMaxFPSBk",
        nameGlobal = "MAXFPSBK_CHECK",
        nameFallback = "MAX_FPS_BK_ENABLE",
        tooltipGlobal = "OPTION_MAXFPSBK_CHECK",
        tooltipFallback = "MAX_FPS_BK_ENABLE_DESC",
        type = "checkbox",
        default = false,
    },
    useTargetFPS = {
        cvar = "useTargetFPS",
        nameGlobal = "TARGETFPS",
        nameFallback = "TARGET_FPS_ENABLE",
        tooltipGlobal = "OPTION_TARGETFPS_CHECK",
        tooltipFallback = "TARGET_FPS_ENABLE_DESC",
        type = "checkbox",
        default = false,
    },

    -- Dropdowns
    textureFiltering = {
        cvar = "textureFilteringMode",
        nameGlobal = "ANISOTROPIC",
        nameFallback = "TEXTURE_FILTERING",
        tooltipGlobal = "OPTION_TOOLTIP_ANISOTROPIC",
        tooltipFallback = "TEXTURE_FILTERING_DESC",
        type = "dropdown",
        default = 5,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_BILINEAR", textFallback = "OPT_FILTER_BILINEAR" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_TRILINEAR", textFallback = "OPT_FILTER_TRILINEAR" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_2XANISOTROPIC", textFallback = "OPT_FILTER_2X" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_4XANISOTROPIC", textFallback = "OPT_FILTER_4X" },
            { value = 4, textGlobal = "VIDEO_OPTIONS_8XANISOTROPIC", textFallback = "OPT_FILTER_8X" },
            { value = 5, textGlobal = "VIDEO_OPTIONS_16XANISOTROPIC", textFallback = "OPT_FILTER_16X" },
        },
    },
    shadowrt = {
        cvar = "shadowrt",
        nameGlobal = "RT_SHADOW_QUALITY",
        nameFallback = "RAY_TRACED_SHADOWS",
        tooltipGlobal = "OPTION_TOOLTIP_RT_SHADOW_QUALITY",
        tooltipFallback = "RAY_TRACED_SHADOWS_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_FAIR", textFallback = "OPT_FAIR", tooltipGlobal = "VIDEO_OPTIONS_RT_SHADOW_QUALITY_FAIR" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM", tooltipGlobal = "VIDEO_OPTIONS_RT_SHADOW_QUALITY_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH", tooltipGlobal = "VIDEO_OPTIONS_RT_SHADOW_QUALITY_HIGH" },
        },
    },
    resampleQuality = {
        cvar = "ResampleQuality",
        nameGlobal = "RESAMPLE_QUALITY",
        nameFallback = "RESAMPLE_QUALITY",
        tooltipGlobal = "OPTION_TOOLTIP_RESAMPLE_QUALITY",
        tooltipFallback = "RESAMPLE_QUALITY_DESC",
        type = "dropdown",
        default = 1,
        options = {
            { value = 0, textGlobal = "RESAMPLE_QUALITY_POINT", textFallback = "OPT_RESAMPLE_POINT" },
            { value = 1, textGlobal = "RESAMPLE_QUALITY_BILINEAR", textFallback = "OPT_RESAMPLE_BILINEAR" },
            { value = 2, textGlobal = "RESAMPLE_QUALITY_BICUBIC", textFallback = "OPT_RESAMPLE_BICUBIC" },
            { value = 3, textGlobal = "RESAMPLE_QUALITY_FSR", textFallback = "OPT_RESAMPLE_FSR" },
        },
    },
    vrsValar = {
        cvar = "vrsValar",
        nameGlobal = "VRS_MODE",
        nameFallback = "VRS_MODE",
        tooltipGlobal = "OPTION_TOOLTIP_VRS_MODE",
        tooltipFallback = "VRS_MODE_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_STANDARD", textFallback = "OPT_VRS_STANDARD", tooltipGlobal = "OPTION_TOOLTIP_VRS_STANDARD" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_AGGRESSIVE", textFallback = "OPT_VRS_AGGRESSIVE", tooltipGlobal = "OPTION_TOOLTIP_VRS_AGGRESSIVE" },
        },
    },
    physicsLevel = {
        cvar = "physicsLevel",
        nameGlobal = "PHYSICS_INTERACTION",
        nameFallback = "PHYSICS_INTERACTIONS",
        tooltipGlobal = "OPTION_PHYSICS_OPTIONS",
        tooltipFallback = "PHYSICS_INTERACTIONS_DESC",
        type = "dropdown",
        default = 1,
        options = {
            { value = 0, textGlobal = "NO_ENVIRONMENT_INTERACTION", textFallback = "OPT_PHYSICS_NONE" },
            { value = 1, textGlobal = "PLAYER_ONLY_INTERACTION", textFallback = "OPT_PHYSICS_PLAYER" },
            { value = 2, textGlobal = "PLAYER_AND_NPC_INTERACTION", textFallback = "OPT_PHYSICS_ALL" },
        },
    },

    -- Sliders
    maxFPS = {
        cvar = "maxFPS",
        nameGlobal = "MAXFPS",
        nameFallback = "MAX_FPS_ENABLE",
        tooltipGlobal = "OPTION_MAXFPS_CHECK",
        tooltipFallback = "MAX_FPS_ENABLE_DESC",
        type = "slider",
        min = 8,
        max = 200,
        step = 1,
        default = 120,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " FPS" end,
    },
    maxFPSBk = {
        cvar = "maxFPSBk",
        nameGlobal = "MAXFPSBK",
        nameFallback = "MAX_FPS_BK_ENABLE",
        tooltipGlobal = "OPTION_MAXFPSBK_CHECK",
        tooltipFallback = "MAX_FPS_BK_ENABLE_DESC",
        type = "slider",
        min = 8,
        max = 200,
        step = 1,
        default = 30,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " FPS" end,
    },
    targetFPS = {
        cvar = "targetFPS",
        nameGlobal = "TARGETFPS",
        nameFallback = "TARGET_FPS_ENABLE",
        tooltipGlobal = "OPTION_TARGETFPS_CHECK",
        tooltipFallback = "TARGET_FPS_ENABLE_DESC",
        type = "slider",
        min = 8,
        max = 200,
        step = 1,
        default = 60,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " FPS" end,
    },
    ResampleSharpness = {
        cvar = "ResampleSharpness",
        nameGlobal = "RESAMPLE_SHARPNESS",
        nameFallback = "RESAMPLE_SHARPNESS",
        tooltipGlobal = "OPTION_TOOLTIP_SHARPNESS",
        tooltipFallback = "RESAMPLE_SHARPNESS_DESC",
        type = "slider",
        min = 0,
        max = 2,
        step = 0.1,
        default = 0.2,
        formatter = function(val) return string.format("%.1f", val) end,
    },
    Contrast = {
        cvar = "Contrast",
        nameGlobal = "OPTION_CONTRAST",
        nameFallback = "CONTRAST",
        tooltipGlobal = "OPTION_TOOLTIP_CONTRAST",
        tooltipFallback = "CONTRAST_DESC",
        type = "slider",
        min = 0,
        max = 100,
        step = 1,
        default = 50,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. "%" end,
    },
    Brightness = {
        cvar = "Brightness",
        nameGlobal = "OPTIONS_BRIGHTNESS",
        nameFallback = "BRIGHTNESS",
        tooltipGlobal = "OPTION_TOOLTIP_BRIGHTNESS",
        tooltipFallback = "BRIGHTNESS_DESC",
        type = "slider",
        min = 0,
        max = 100,
        step = 1,
        default = 50,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. "%" end,
    },
    Gamma = {
        cvar = "Gamma",
        nameGlobal = "GAMMA",
        nameFallback = "GAMMA",
        tooltipGlobal = "OPTION_TOOLTIP_GAMMA",
        tooltipFallback = "GAMMA_DESC",
        type = "slider",
        min = 0.3,
        max = 2.8,
        step = 0.1,
        default = 1.0,
        formatter = function(val) return string.format("%.1f", val) end,
    },

    -- Display & Bottleneck Settings
    renderScale = {
        cvar = "RenderScale",
        nameFallback = "RENDER_SCALE",
        tooltipFallback = "RENDER_SCALE_DESC",
        type = "slider",
        min = 0.33,
        max = 2.0,
        step = 0.01,
        default = 1.0,
        formatter = function(val) return tostring(math.floor(val * 100 + 0.5)) .. "%" end,
    },
    vsync = {
        cvar = "vsync",
        nameGlobal = "VERTICAL_SYNC",
        nameFallback = "VERTICAL_SYNC",
        tooltipGlobal = "OPTION_TOOLTIP_VERTICAL_SYNC",
        tooltipFallback = "VERTICAL_SYNC_DESC",
        type = "checkbox",
        default = false,
    },
    LowLatencyMode = {
        cvar = "LowLatencyMode",
        nameGlobal = "LOW_LATENCY_MODE",
        nameFallback = "LOW_LATENCY_MODE",
        tooltipGlobal = "OPTION_TOOLTIP_LOW_LATENCY_MODE",
        tooltipFallback = "LOW_LATENCY_MODE_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_BUILTIN", textFallback = "OPT_LOW_LATENCY_BUILTIN" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_NVIDIA_REFLEX", textFallback = "OPT_LOW_LATENCY_REFLEX" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_NVIDIA_REFLEX_BOOST", textFallback = "OPT_LOW_LATENCY_BOOST" },
            { value = 4, textGlobal = "VIDEO_OPTIONS_INTEL_XELL", textFallback = "OPT_LOW_LATENCY_XELL" },
        },
    },
    antiAliasing = {
        cvar = "ffxAntiAliasingMode",
        nameGlobal = "ANTIALIASING",
        nameFallback = "ANTI_ALIASING",
        tooltipGlobal = "OPTION_TOOLTIP_ANTIALIASING",
        tooltipFallback = "ANTI_ALIASING_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_NONE", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "ANTIALIASING_FXAA_LOW", textFallback = "OPT_AA_FXAA_LOW" },
            { value = 2, textGlobal = "ANTIALIASING_FXAA_HIGH", textFallback = "OPT_AA_FXAA_HIGH" },
            { value = 3, textGlobal = "ANTIALIASING_CMAA", textFallback = "OPT_AA_CMAA" },
            { value = 4, textGlobal = "ANTIALIASING_CMAA2", textFallback = "OPT_AA_CMAA2" },
        },
    },
    msaaQuality = {
        cvar = "MSAAQuality",
        nameGlobal = "MSAA_LABEL",
        nameFallback = "MSAA_QUALITY",
        tooltipGlobal = "OPTION_TOOLTIP_ANTIALIASING_MSAA",
        tooltipFallback = "MSAA_QUALITY_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_NONE", textFallback = "OPT_DISABLED" },
            { value = 1, textFallback = "OPT_MSAA_2X" },
            { value = 2, textFallback = "OPT_MSAA_4X" },
            { value = 3, textFallback = "OPT_MSAA_8X" },
        },
    },
    msaaAlphaTest = {
        cvar = "msaaAlphaTest",
        nameGlobal = "MULTISAMPLE_ALPHA_TEST",
        nameFallback = "MSAA_ALPHA_TEST",
        tooltipGlobal = "OPTION_TOOLTIP_MULTISAMPLE_ALPHA_TEST",
        tooltipFallback = "MSAA_ALPHA_TEST_DESC",
        type = "checkbox",
        default = false,
    },

    -- Hidden Bottleneck & Performance CVars
    VolumeFogLevel = {
        cvar = "VolumeFogLevel",
        nameFallback = "VOLUMETRIC_FOG",
        tooltipFallback = "VOLUMETRIC_FOG_DESC",
        type = "dropdown",
        default = 1,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_FAIR", textFallback = "OPT_FAIR" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
        },
    },
    groundEffectDist = {
        cvar = "groundEffectDist",
        nameFallback = "GROUND_EFFECT_DIST",
        tooltipFallback = "GROUND_EFFECT_DIST_DESC",
        type = "slider",
        min = 40,
        max = 500,
        step = 10,
        default = 140,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " yd" end,
    },
    groundEffectDensity = {
        cvar = "groundEffectDensity",
        nameFallback = "GROUND_EFFECT_DENSITY",
        tooltipFallback = "GROUND_EFFECT_DENSITY_DESC",
        type = "slider",
        min = 16,
        max = 256,
        step = 16,
        default = 64,
        formatter = function(val) return tostring(math.floor(val + 0.5)) end,
    },
    weatherDensity = {
        cvar = "weatherDensity",
        raidCVar = "RAIDweatherDensity",
        nameFallback = "WEATHER_DENSITY",
        tooltipFallback = "WEATHER_DENSITY_DESC",
        type = "dropdown",
        default = 1,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_MEDIUM", textFallback = "OPT_MEDIUM" },
            { value = 3, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
        },
    },
    reflectionMode = {
        cvar = "reflectionMode",
        nameFallback = "WATER_REFLECTION_MODE",
        tooltipFallback = "WATER_REFLECTION_MODE_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_REFL_NONE" },
            { value = 1, textFallback = "OPT_REFL_TERRAIN" },
            { value = 2, textFallback = "OPT_REFL_ALL" },
        },
    },
    rippleDetail = {
        cvar = "rippleDetail",
        nameFallback = "WATER_RIPPLE_DETAIL",
        tooltipFallback = "WATER_RIPPLE_DETAIL_DESC",
        type = "dropdown",
        default = 0,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
        },
    },
    shadowSoft = {
        cvar = "shadowSoft",
        nameFallback = "SHADOW_SOFT",
        tooltipFallback = "SHADOW_SOFT_DESC",
        type = "checkbox",
        default = false,
    },
    ffxGlow = {
        cvar = "ffxGlow",
        nameFallback = "FFX_GLOW",
        tooltipFallback = "FFX_GLOW_DESC",
        type = "checkbox",
        default = true,
    },
    ffxDeath = {
        cvar = "ffxDeath",
        nameFallback = "FFX_DEATH",
        tooltipFallback = "FFX_DEATH_DESC",
        type = "checkbox",
        default = true,
    },
    ffxNether = {
        cvar = "ffxNether",
        nameFallback = "FFX_NETHER",
        tooltipFallback = "FFX_NETHER_DESC",
        type = "checkbox",
        default = true,
    },
    entityLodDist = {
        cvar = "entityLodDist",
        nameFallback = "ENTITY_LOD_DIST",
        tooltipFallback = "ENTITY_LOD_DIST_DESC",
        type = "slider",
        min = 5,
        max = 10,
        step = 1,
        default = 7,
        formatter = function(val) return tostring(math.floor(val + 0.5)) end,
    },

    -- CPU: Audio Mixer & DSP
    soundChannels = {
        cvar = "Sound_NumChannels",
        nameFallback = "SOUND_CHANNELS",
        tooltipFallback = "SOUND_CHANNELS_DESC",
        type = "dropdown",
        default = 64,
        options = {
            { value = 16, textFallback = "OPT_CHANNELS_16" },
            { value = 32, textFallback = "OPT_CHANNELS_32" },
            { value = 48, textFallback = "OPT_CHANNELS_48" },
            { value = 64, textFallback = "OPT_CHANNELS_64" },
            { value = 128, textFallback = "OPT_CHANNELS_128" },
        },
    },
    soundDSP = {
        cvar = "Sound_EnableDSPEffects",
        nameFallback = "SOUND_DSP",
        tooltipFallback = "SOUND_DSP_DESC",
        type = "checkbox",
        default = true,
    },

    -- CPU: Draw Calls, LOD & Culling
    doodadLodDist = {
        cvar = "doodadLodDist",
        nameFallback = "DOODAD_LOD_DIST",
        tooltipFallback = "DOODAD_LOD_DIST_DESC",
        type = "slider",
        min = 50,
        max = 300,
        step = 25,
        default = 150,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " yd" end,
    },
    lodObjectMinSize = {
        cvar = "lodObjectMinSize",
        nameFallback = "LOD_OBJECT_MIN_SIZE",
        tooltipFallback = "LOD_OBJECT_MIN_SIZE_DESC",
        type = "slider",
        min = 10,
        max = 60,
        step = 5,
        default = 25,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " px" end,
    },
    wmoLodDist = {
        cvar = "wmoLodDist",
        nameFallback = "WMO_LOD_DIST",
        tooltipFallback = "WMO_LOD_DIST_DESC",
        type = "slider",
        min = 250,
        max = 1500,
        step = 50,
        default = 500,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " yd" end,
    },
    AnimDoodadLodDist = {
        cvar = "AnimDoodadLodDist",
        nameFallback = "ANIM_DOODAD_LOD_DIST",
        tooltipFallback = "ANIM_DOODAD_LOD_DIST_DESC",
        type = "slider",
        min = 20,
        max = 200,
        step = 10,
        default = 100,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " yd" end,
    },

    -- CPU: Nameplates & Combat UI
    nameplateMaxDist = {
        cvar = "nameplateMaxDistance",
        nameFallback = "NAMEPLATE_MAX_DIST",
        tooltipFallback = "NAMEPLATE_MAX_DIST_DESC",
        type = "slider",
        min = 20,
        max = 60,
        step = 5,
        default = 41,
        formatter = function(val) return tostring(math.floor(val + 0.5)) .. " yd" end,
    },
    nameplateMotion = {
        cvar = "nameplateMotion",
        nameFallback = "NAMEPLATE_MOTION",
        tooltipFallback = "NAMEPLATE_MOTION_DESC",
        type = "dropdown",
        default = 1,
        options = {
            { value = 0, textFallback = "OPT_MOTION_OVERLAPPING" },
            { value = 1, textFallback = "OPT_MOTION_STACKING" },
        },
    },

    -- Lighting & Shaders
    lightMode = {
        cvar = "lightMode",
        nameFallback = "LIGHT_MODE",
        tooltipFallback = "LIGHT_MODE_DESC",
        type = "dropdown",
        default = 2,
        options = {
            { value = 0, textFallback = "OPT_LIGHT_BASIC" },
            { value = 1, textFallback = "OPT_LIGHT_STANDARD" },
            { value = 2, textFallback = "OPT_LIGHT_DYNAMIC" },
        },
    },
    sunShafts = {
        cvar = "sunShafts",
        nameFallback = "SUN_SHAFTS",
        tooltipFallback = "SUN_SHAFTS_DESC",
        type = "dropdown",
        default = 2,
        options = {
            { value = 0, textGlobal = "VIDEO_OPTIONS_DISABLED", textFallback = "OPT_DISABLED" },
            { value = 1, textGlobal = "VIDEO_OPTIONS_LOW", textFallback = "OPT_LOW" },
            { value = 2, textGlobal = "VIDEO_OPTIONS_HIGH", textFallback = "OPT_HIGH" },
        },
    },
    refraction = {
        cvar = "refraction",
        nameFallback = "REFRACTION",
        tooltipFallback = "REFRACTION_DESC",
        type = "checkbox",
        default = true,
    },

    -- Spell Clutter Filtering
    spellClutter = {
        cvar = "spellClutter",
        raidCVar = "RAIDspellClutter",
        nameFallback = "SPELL_CLUTTER",
        tooltipFallback = "SPELL_CLUTTER_DESC",
        type = "dropdown",
        default = -1,
        options = {
            { value = -1, textFallback = "OPT_CLUTTER_AUTO" },
            { value = 0, textFallback = "OPT_CLUTTER_NONE" },
            { value = 50, textFallback = "OPT_CLUTTER_50" },
            { value = 100, textFallback = "OPT_CLUTTER_100" },
        },
    },

    -- CPU / GPU Frame Latency
    gxMaxFrameLatency = {
        cvar = "gxMaxFrameLatency",
        nameFallback = "MAX_FRAME_LATENCY",
        tooltipFallback = "MAX_FRAME_LATENCY_DESC",
        type = "dropdown",
        default = 1,
        options = {
            { value = 1, textFallback = "OPT_FRAME_LATENCY_1" },
            { value = 2, textFallback = "OPT_FRAME_LATENCY_2" },
        },
    },
}

---Calculates default detail values based on overall quality preset level (1-10)
---@param qualityLevel number
---@return table<string, number>
function addon.GetPresetDefaults(qualityLevel)
    local q = math.max(1, math.min(10, math.floor(qualityLevel + 0.5)))
    local defaults = {
        graphicsViewDistance = q,
        graphicsEnvironmentDetail = q,
        graphicsGroundClutter = q,
        graphicsShadowQuality = math.min(5, math.floor((q - 1) * 0.6)),
        graphicsLiquidDetail = math.min(3, math.floor((q - 1) * 0.4)),
        graphicsParticleDensity = math.min(5, math.max(1, math.floor((q - 1) * 0.55 + 1))),
        graphicsSSAO = math.min(4, math.floor((q - 1) * 0.45)),
        graphicsDepthEffects = math.min(3, math.floor((q - 1) * 0.35)),
        graphicsComputeEffects = math.min(4, math.floor((q - 1) * 0.45)),
        graphicsOutlineMode = q >= 7 and 2 or (q >= 3 and 1 or 0),
        graphicsTextureResolution = q >= 5 and 2 or (q >= 3 and 1 or 0),
        graphicsSpellDensity = q >= 7 and 2 or (q >= 4 and 1 or 0),
        graphicsProjectedTextures = q >= 2 and 1 or 0,
    }
    return defaults
end

local DEFAULT_PROFILES = {
    World = {
        enabled = true,
        graphicsQuality = 7,
        customDetails = false,
        graphicsViewDistance = 7,
        graphicsEnvironmentDetail = 7,
        graphicsGroundClutter = 7,
        graphicsShadowQuality = 3,
        graphicsLiquidDetail = 2,
        graphicsParticleDensity = 3,
        graphicsSSAO = 2,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
    },
    Raid = {
        enabled = true,
        graphicsQuality = 4,
        customDetails = false,
        graphicsViewDistance = 4,
        graphicsEnvironmentDetail = 4,
        graphicsGroundClutter = 3,
        graphicsShadowQuality = 1,
        graphicsLiquidDetail = 1,
        graphicsParticleDensity = 2,
        graphicsSSAO = 0,
        graphicsDepthEffects = 1,
        graphicsComputeEffects = 1,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
    },
    Dungeon = {
        enabled = true,
        graphicsQuality = 6,
        customDetails = false,
        graphicsViewDistance = 6,
        graphicsEnvironmentDetail = 6,
        graphicsGroundClutter = 5,
        graphicsShadowQuality = 2,
        graphicsLiquidDetail = 2,
        graphicsParticleDensity = 3,
        graphicsSSAO = 1,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
    },
    City = {
        enabled = true,
        graphicsQuality = 5,
        customDetails = false,
        graphicsViewDistance = 5,
        graphicsEnvironmentDetail = 5,
        graphicsGroundClutter = 5,
        graphicsShadowQuality = 2,
        graphicsLiquidDetail = 2,
        graphicsParticleDensity = 3,
        graphicsSSAO = 1,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 1,
        graphicsProjectedTextures = 1,
    },
    Scenario = {
        enabled = true,
        graphicsQuality = 6,
        customDetails = false,
        graphicsViewDistance = 6,
        graphicsEnvironmentDetail = 6,
        graphicsGroundClutter = 6,
        graphicsShadowQuality = 2,
        graphicsLiquidDetail = 2,
        graphicsParticleDensity = 3,
        graphicsSSAO = 2,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
    },
    Cosmic = {
        enabled = true,
        graphicsQuality = 7,
        customDetails = false,
        graphicsViewDistance = 7,
        graphicsEnvironmentDetail = 7,
        graphicsGroundClutter = 7,
        graphicsShadowQuality = 3,
        graphicsLiquidDetail = 2,
        graphicsParticleDensity = 3,
        graphicsSSAO = 2,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
    },
    Orphan = {
        enabled = true,
        graphicsQuality = 7,
        customDetails = false,
        graphicsViewDistance = 7,
        graphicsEnvironmentDetail = 7,
        graphicsGroundClutter = 7,
        graphicsShadowQuality = 3,
        graphicsLiquidDetail = 2,
        graphicsParticleDensity = 3,
        graphicsSSAO = 2,
        graphicsDepthEffects = 2,
        graphicsComputeEffects = 2,
        graphicsOutlineMode = 1,
        graphicsTextureResolution = 2,
        graphicsSpellDensity = 2,
        graphicsProjectedTextures = 1,
    },
}

local function CopyTable(src)
    local dst = {}
    for k, v in pairs(src) do
        if type(v) == "table" then
            dst[k] = CopyTable(v)
        else
            dst[k] = v
        end
    end
    return dst
end

local DEFAULT_ADVANCED_SETTINGS = {
    customAdvanced = false,
}
for key, opt in pairs(addon.ADVANCED_OPTIONS) do
    DEFAULT_ADVANCED_SETTINGS[key] = opt.default
end

local function InitProfileDefaults(profile, defaultProfile)
    for key, val in pairs(defaultProfile) do
        if profile[key] == nil then
            profile[key] = val
        end
    end
    for advKey, advVal in pairs(DEFAULT_ADVANCED_SETTINGS) do
        if profile[advKey] == nil then
            profile[advKey] = advVal
        end
    end
end

function addon.InitDatabase()
    if not Uwowea_Acc_AdvancedSettings then
        Uwowea_Acc_AdvancedSettings = {}
    end

    local db = Uwowea_Acc_AdvancedSettings

    if db.autoSwitchEnabled == nil then
        db.autoSwitchEnabled = true
    end

    if db.notifyInChat == nil then
        db.notifyInChat = false
    end

    if not db.profiles then
        db.profiles = {}
    end

    for _, zoneType in ipairs(addon.ZONE_TYPES) do
        if not db.profiles[zoneType] then
            db.profiles[zoneType] = CopyTable(DEFAULT_PROFILES[zoneType])
            for advKey, advVal in pairs(DEFAULT_ADVANCED_SETTINGS) do
                db.profiles[zoneType][advKey] = advVal
            end
        else
            InitProfileDefaults(db.profiles[zoneType], DEFAULT_PROFILES[zoneType])
        end
    end

    addon.db = db
end
