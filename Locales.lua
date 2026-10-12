local addonName, addon = ...

local L = {
    TITLE = "Uwowea: Advanced Settings",
    SUBTITLE = "Automatic graphics switching based on zone type",

    GENERAL = "General",
    ENABLE_AUTO_SWITCH = "Enable automatic graphics switching",
    ENABLE_AUTO_SWITCH_DESC = "Automatically changes graphics preset and settings when entering different zone types.",
    NOTIFY_CHAT = "Notify in chat on profile change",
    NOTIFY_CHAT_DESC = "Prints a message in chat whenever a graphics profile is switched.",
    STATUS_HEADER = "Current Status",
    CURRENT_ZONE = "Current detected zone: |cffffd100%s|r",
    CURRENT_PROFILE = "Active graphics profile: |cff00ff00%s|r",

    ZONE_WORLD = "World (Base Game Quality)",
    ZONE_RAID = "Raid & Battleground",
    ZONE_DUNGEON = "Dungeon",
    ZONE_CITY = "City",
    ZONE_SCENARIO = "Scenario",
    ZONE_COSMIC = "Cosmic / World Map",
    ZONE_ORPHAN = "Special / Orphan Map",

    ZONE_WORLD_DESC = "Settings used when exploring open world zones. Directly synchronized with in-game Base Game Quality.",
    ZONE_RAID_DESC = "Settings used when inside Raid instances and Battlegrounds. Directly synchronized with in-game Raid graphics.",
    ZONE_DUNGEON_DESC = "Settings automatically applied inside 5-player Dungeons.",
    ZONE_CITY_DESC = "Settings automatically applied inside major cities and sanctuaries.",
    ZONE_SCENARIO_DESC = "Settings automatically applied in Scenarios and Delves.",
    ZONE_COSMIC_DESC = "Settings applied in cosmic, deep space, or special astral zones.",
    ZONE_ORPHAN_DESC = "Settings applied in isolated or orphan map regions.",

    PROFILE_ENABLED = "Enable profile for this zone type",
    PROFILE_ENABLED_DESC = "If disabled, the World profile will be used instead.",
    RAID_ENABLED_DESC = "Enable separate graphics quality settings for raids and battlegrounds.",
    GRAPHICS_QUALITY = "Overall Quality",
    GRAPHICS_QUALITY_DESC = "Adjusts overall graphics quality level from 1 (lowest) to 10 (highest).",

    CUSTOM_DETAILS = "Customize detailed graphics settings",
    CUSTOM_DETAILS_DESC = "Enable to override individual graphics CVars for this profile instead of only using the overall preset.",

    CUSTOM_ADVANCED = "Customize advanced graphics settings for this profile",
    CUSTOM_ADVANCED_DESC = "Enable to configure profile-specific framerate caps, buffering, and advanced post-processing options.",

    VIEW_DISTANCE = "View Distance",
    VIEW_DISTANCE_DESC = "Controls how far into the distance terrain, structures, and objects will render.",
    ENVIRONMENT_DETAIL = "Environment Detail",
    ENVIRONMENT_DETAIL_DESC = "Controls the rendering distance and detail of environmental objects like foliage, trees, and buildings.",
    GROUND_CLUTTER = "Ground Clutter",
    GROUND_CLUTTER_DESC = "Controls the density and draw distance of grass, pebbles, and small ground foliage.",

    SHADOW_QUALITY = "Shadow Quality",
    SHADOW_QUALITY_DESC = "Determines the sharpness, resolution, and complexity of character and environmental shadows.",
    LIQUID_DETAIL = "Liquid Detail",
    LIQUID_DETAIL_DESC = "Controls the visual appearance, wave animation, and reflections of water and other liquids.",
    PARTICLE_DENSITY = "Particle Density",
    PARTICLE_DENSITY_DESC = "Determines the amount and complexity of spell effects, smoke, fire, and weather particles.",
    SSAO = "SSAO (Ambient Occlusion)",
    SSAO_DESC = "Screen Space Ambient Occlusion adds realistic contact shadows where surfaces meet.",
    DEPTH_EFFECTS = "Depth Effects",
    DEPTH_EFFECTS_DESC = "Softens the intersection between particle effects and geometry for a smoother look.",
    COMPUTE_EFFECTS = "Compute Effects",
    COMPUTE_EFFECTS_DESC = "Enables GPU compute shaders for enhanced lighting, fog, and particle simulations.",
    OUTLINE_MODE = "Outline Mode",
    OUTLINE_MODE_DESC = "Controls highlighted outlines around targeted units, quest objectives, and interactable objects.",
    TEXTURE_RESOLUTION = "Texture Resolution",
    TEXTURE_RESOLUTION_DESC = "Controls the sharpness and resolution of textures on models, terrain, and equipment.",
    SPELL_DENSITY = "Spell Density",
    SPELL_DENSITY_DESC = "Filters visual spell effects in combat to preserve visual clarity and frame rate.",
    PROJECTED_TEXTURES = "Projected Textures",
    PROJECTED_TEXTURES_DESC = "Enables projection of spell visuals, ground decals, and combat telegraphs onto terrain.",

    ADVANCED = "Advanced Settings",
    ADVANCED_DESC = "Fine-tune framerate caps, buffering, and post-processing filters.",
    TRIPLE_BUFFERING = "Triple Buffering",
    TRIPLE_BUFFERING_DESC = "Enables triple buffering to smooth out frame rate drops when VSync is enabled.",
    TEXTURE_FILTERING = "Texture Filtering",
    TEXTURE_FILTERING_DESC = "Anisotropic filtering enhances the sharpness of textures viewed at oblique angles.",
    RAY_TRACED_SHADOWS = "Ray Traced Shadows",
    RAY_TRACED_SHADOWS_DESC = "Uses ray tracing to render realistic and accurate environmental contact shadows.",
    RESAMPLE_QUALITY = "Resample Quality",
    RESAMPLE_QUALITY_DESC = "Determines the spatial upscaling filter used when render scale differs from display resolution.",
    VRS_MODE = "VRS Mode",
    VRS_MODE_DESC = "Variable Rate Shading improves rendering performance by varying the shading rate across different screen areas.",
    PHYSICS_INTERACTIONS = "Physics Interactions",
    PHYSICS_INTERACTIONS_DESC = "Controls environmental cloth, banner, and world object physics animations and player collisions.",
    MAX_FPS_ENABLE = "Max Foreground FPS",
    MAX_FPS_ENABLE_DESC = "Limits the maximum framerate when World of Warcraft is the active window.",
    MAX_FPS_BK_ENABLE = "Max Background FPS",
    MAX_FPS_BK_ENABLE_DESC = "Limits the maximum framerate when World of Warcraft is running in the background.",
    TARGET_FPS_ENABLE = "Target FPS",
    TARGET_FPS_ENABLE_DESC = "Dynamically scales rendering resolution to maintain this frame rate.",
    RESAMPLE_SHARPNESS = "Resample Sharpness",
    RESAMPLE_SHARPNESS_DESC = "Controls image sharpness when using spatial or temporal upscalers (such as AMD FSR).",
    CONTRAST = "Contrast",
    CONTRAST_DESC = "Adjusts overall screen contrast level.",
    BRIGHTNESS = "Brightness",
    BRIGHTNESS_DESC = "Adjusts overall screen brightness level.",
    GAMMA = "Gamma",
    GAMMA_DESC = "Adjusts color gamma curves for midtone brightness.",

    OPT_DISABLED = "Disabled",
    OPT_LOW = "Low",
    OPT_FAIR = "Fair",
    OPT_MEDIUM = "Medium",
    OPT_HIGH = "High",
    OPT_ULTRA = "Ultra",
    OPT_ULTRA_HIGH = "Ultra High",
    OPT_ENABLED = "Enabled",

    OPT_SPELL_ESSENTIAL = "Essential",
    OPT_SPELL_PARTIAL = "Partial",
    OPT_SPELL_ALL = "Everything",

    OPT_RESAMPLE_POINT = "Point",
    OPT_RESAMPLE_BILINEAR = "Bilinear",
    OPT_RESAMPLE_BICUBIC = "Bicubic",
    OPT_RESAMPLE_FSR = "AMD FSR 1.0",

    OPT_FILTER_BILINEAR = "Bilinear",
    OPT_FILTER_TRILINEAR = "Trilinear",
    OPT_FILTER_2X = "2x Anisotropic",
    OPT_FILTER_4X = "4x Anisotropic",
    OPT_FILTER_8X = "8x Anisotropic",
    OPT_FILTER_16X = "16x Anisotropic",

    OPT_VRS_STANDARD = "Standard",
    OPT_VRS_AGGRESSIVE = "Aggressive",

    OPT_PHYSICS_NONE = "None",
    OPT_PHYSICS_PLAYER = "Player Only",
    OPT_PHYSICS_ALL = "Player and NPC",

    -- 3 Kings + 1 Prince
    THREE_KINGS_TITLE = "3 Kings + 1 Prince (Bottleneck Preset)",
    THREE_KINGS_BTN = "Apply 3 Kings + 1 Prince",
    THREE_KINGS_DESC = "Optimizes the 3 primary CPU draw-call settings plus spell particles for maximum framerate: View Distance (7), Environment Detail (7), Ground Clutter (1), and Particle Density (Fair/1). Drastically alleviates CPU and GPU bottlenecks in demanding content.",
    THREE_KINGS_APPLIED = "|cff00ff00[Uwowea Settings]|r Profile '|cffffd100%s|r' set to 3 Kings + 1 Prince (VD: %d, ED: %d, GC: %d, Particles: %d).",
    APPLY_TO_ACTIVE_PROFILE = "Apply 3 Kings + 1 Prince to Active Profile",
    APPLY_TO_ACTIVE_PROFILE_DESC = "Quickly applies the 3 Kings + 1 Prince bottleneck preset directly to the currently active profile.",

    -- Bottleneck / Display settings
    RENDER_SCALE = "Render Scale",
    RENDER_SCALE_DESC = "Controls 3D rendering resolution relative to monitor resolution. Lowering this drastically reduces GPU bottleneck.",
    VERTICAL_SYNC = "Vertical Sync (VSync)",
    VERTICAL_SYNC_DESC = "Synchronizes frame rate with monitor refresh rate. Disable to minimize input latency.",
    LOW_LATENCY_MODE = "Low Latency Mode",
    LOW_LATENCY_MODE_DESC = "Reduces system input latency by synchronizing frame delivery between CPU and GPU (e.g. NVIDIA Reflex, Intel XeLL).",
    ANTI_ALIASING = "Anti-Aliasing",
    ANTI_ALIASING_DESC = "Smoothing methods to reduce jagged edges on 3D geometry.",
    MSAA_QUALITY = "Multisample Anti-Aliasing (MSAA)",
    MSAA_QUALITY_DESC = "Hardware multisampling anti-aliasing. Higher values significantly increase GPU memory and fill-rate load.",
    MSAA_ALPHA_TEST = "MSAA Alpha-Test",
    MSAA_ALPHA_TEST_DESC = "Enables anti-aliasing on alpha-tested transparent textures such as foliage and fences.",

    -- Hidden bottleneck CVars
    VOLUMETRIC_FOG = "Volumetric Fog",
    VOLUMETRIC_FOG_DESC = "Quality of 3D volumetric atmospheric fog. Disabling gives a massive GPU boost in modern expansion zones.",
    GROUND_EFFECT_DIST = "Ground Clutter Draw Distance",
    GROUND_EFFECT_DIST_DESC = "Distance in yards at which grass and small ground clutter render. Lower values dramatically relieve CPU draw-call bottlenecks.",
    GROUND_EFFECT_DENSITY = "Ground Clutter Density Multiplier",
    GROUND_EFFECT_DENSITY_DESC = "Controls the exact density of clutter objects on the terrain.",
    WEATHER_DENSITY = "Weather Particle Density",
    WEATHER_DENSITY_DESC = "Controls rain, snow, and storm particle intensity. Turning off eliminates severe FPS drops in stormy zones.",
    WATER_REFLECTION_MODE = "Water Reflection Mode",
    WATER_REFLECTION_MODE_DESC = "Controls reflection rendering on water. Disabling removes the costly second render pass.",
    WATER_RIPPLE_DETAIL = "Water Ripple Detail",
    WATER_RIPPLE_DETAIL_DESC = "Controls water wave simulation physics and surface ripples.",
    SHADOW_SOFT = "Soft Shadows Filter",
    SHADOW_SOFT_DESC = "Blurs shadow edges for a softer look. Disabling saves GPU shader time.",
    FFX_GLOW = "Full Screen Glow (Bloom)",
    FFX_GLOW_DESC = "Post-processing bloom/glow. Disabling removes visual blur, sharpens the image, and boosts FPS in raids.",
    FFX_DEATH = "Death Effect Filter",
    FFX_DEATH_DESC = "Grayscale post-processing filter when dead. Disabling keeps normal colors and framerate.",
    FFX_NETHER = "Nether Distortion Filter",
    FFX_NETHER_DESC = "Screen distortion effect when invisible or in void/nether phase.",
    ENTITY_LOD_DIST = "Entity Draw Distance",
    ENTITY_LOD_DIST_DESC = "Draw distance for creature and player 3D character models.",

    -- New Bottleneck / CPU & GPU CVars
    SOUND_CHANNELS = "Sound Channels (CPU Audio Mixer)",
    SOUND_CHANNELS_DESC = "Number of sound channels processed on the CPU. High values (64-128) cause severe CPU audio mixer spikes during 20-30 player combat. Lowering to 32-48 stabilizes CPU frametimes.",
    SOUND_DSP = "Sound DSP Effects (Reverb)",
    SOUND_DSP_DESC = "Enables environmental reverb and echo DSP filtering on CPU. Disabling removes audio processing overhead in dungeons and caves.",
    DOODAD_LOD_DIST = "Doodad Draw Distance (Props LOD)",
    DOODAD_LOD_DIST_DESC = "Distance at which small world clutter objects (torches, fences, crates, flags) render. Reducing this drastically drops CPU draw calls in cities and complex raids.",
    LOD_OBJECT_MIN_SIZE = "Object Culling Pixel Size",
    LOD_OBJECT_MIN_SIZE_DESC = "Minimum on-screen pixel size before small 3D objects are culled from rendering. Increasing this aggressively prunes distant clutter on the CPU before passing to GPU.",
    WMO_LOD_DIST = "Building Structure LOD Distance (WMO)",
    WMO_LOD_DIST_DESC = "Draw distance for major building meshes and castle interiors. Lower values reduce geometry load and CPU memory traffic.",
    ANIM_DOODAD_LOD_DIST = "Animated Clutter Distance",
    ANIM_DOODAD_LOD_DIST_DESC = "Distance at which trees, flags, and vegetation play vertex swaying animations. Reducing this stops CPU bone/animation matrix updates for distant props.",
    NAMEPLATE_MAX_DIST = "Nameplate Max Distance",
    NAMEPLATE_MAX_DIST_DESC = "Maximum range to display enemy nameplates. In large pulls, 60yd nameplate calculations and UI frame scripts heavily stall the CPU main thread. Reducing to 35-41yd dramatically improves minimum FPS.",
    NAMEPLATE_MOTION = "Nameplate Motion Type",
    NAMEPLATE_MOTION_DESC = "Overlapping nameplates do not calculate physics collision on the CPU every frame, preventing severe frame drops in 10+ target pulls compared to Stacking.",
    LIGHT_MODE = "Lighting Complexity",
    LIGHT_MODE_DESC = "Controls lighting calculation model. Dynamic Lights (Mode 2) cast dynamic per-pixel lights from spells onto surfaces, adding massive CPU draw calls in raids. Mode 1 or 0 provides major CPU relief.",
    SPELL_CLUTTER = "Spell Clutter Filtering",
    SPELL_CLUTTER_DESC = "Dynamically filters out non-essential ally spell effects when player density increases. Higher values or Auto (-1) clean up screen clutter and reduce spell render overhead.",
    SUN_SHAFTS = "Sunshafts (God Rays)",
    SUN_SHAFTS_DESC = "Atmospheric light rays piercing tree canopies and geometry. Disabling eliminates a secondary shadow map rendering pass.",
    REFRACTION = "Refraction & Heat Distortion",
    REFRACTION_DESC = "Refractive distortion on water surfaces and fire heat waves. Disabling saves an off-screen GPU distortion pass.",
    MAX_FRAME_LATENCY = "Max Frame Latency (CPU Queue)",
    MAX_FRAME_LATENCY_DESC = "Number of frames the CPU can prepare ahead of the GPU. 1 frame ensures lowest mouse input latency. 2 frames smooths out frametime spikes if the GPU is maxed out.",

    OPT_CHANNELS_16 = "16 Channels",
    OPT_CHANNELS_32 = "32 Channels (Light)",
    OPT_CHANNELS_48 = "48 Channels (Balanced)",
    OPT_CHANNELS_64 = "64 Channels (Default)",
    OPT_CHANNELS_128 = "128 Channels (Heavy)",

    OPT_MOTION_OVERLAPPING = "Overlapping (Low CPU)",
    OPT_MOTION_STACKING = "Stacking (High CPU)",

    OPT_LIGHT_BASIC = "Basic Lighting",
    OPT_LIGHT_STANDARD = "Standard Lighting",
    OPT_LIGHT_DYNAMIC = "Dynamic Lights (Heavy)",

    OPT_CLUTTER_AUTO = "Automatic",
    OPT_CLUTTER_NONE = "No Reduction",
    OPT_CLUTTER_50 = "Moderate Reduction",
    OPT_CLUTTER_100 = "Maximum Reduction",

    OPT_FRAME_LATENCY_1 = "1 Frame (Lowest Latency)",
    OPT_FRAME_LATENCY_2 = "2 Frames (Smoother FPS)",

    OPT_LOW_LATENCY_BUILTIN = "Built-in",
    OPT_LOW_LATENCY_REFLEX = "NVIDIA Reflex",
    OPT_LOW_LATENCY_BOOST = "NVIDIA Reflex + Boost",
    OPT_LOW_LATENCY_XELL = "Intel XeLL",

    OPT_AA_FXAA_LOW = "FXAA Low",
    OPT_AA_FXAA_HIGH = "FXAA High",
    OPT_AA_CMAA = "CMAA",
    OPT_AA_CMAA2 = "CMAA2",

    OPT_MSAA_2X = "2x MSAA",
    OPT_MSAA_4X = "4x MSAA",
    OPT_MSAA_8X = "8x MSAA",

    OPT_REFL_NONE = "Disabled",
    OPT_REFL_TERRAIN = "Terrain Only",
    OPT_REFL_ALL = "All (Full Reflections)",

    PROFILE_SWITCHED = "|cff00ff00[Uwowea Settings]|r Switched graphics profile to: |cffffd100%s|r (Preset %d)",
}

local clientLocale = GetLocale and GetLocale() or "enUS"
if clientLocale == "csCZ" then
    -- Čeština
    L.TITLE = "Uwowea: Pokročilá nastavení"
    L.SUBTITLE = "Automatická změna grafiky podle typu zóny"
    L.GENERAL = "Obecné"
    L.ENABLE_AUTO_SWITCH = "Povolit automatickou změnu grafiky"
    L.ENABLE_AUTO_SWITCH_DESC = "Automaticky přepíná profil grafiky při vstupu do různých typů zón."
    L.NOTIFY_CHAT = "Upozornit v chatu při změně profilu"
    L.NOTIFY_CHAT_DESC = "Vypíše zprávu do chatu při každé změně grafického profilu."
    L.STATUS_HEADER = "Aktuální stav"
    L.CURRENT_ZONE = "Aktuální detekovaná zóna: |cffffd100%s|r"
    L.CURRENT_PROFILE = "Aktivní grafický profil: |cff00ff00%s|r"

    L.ZONE_WORLD = "Svět (Základní grafika)"
    L.ZONE_RAID = "Raid a Bojiště"
    L.ZONE_DUNGEON = "Dungeon"
    L.ZONE_CITY = "Město"
    L.ZONE_SCENARIO = "Scénář a Delves"
    L.ZONE_COSMIC = "Vesmír / Kosmická mapa"
    L.ZONE_ORPHAN = "Speciální / Orphan mapa"

    L.ZONE_WORLD_DESC = "Nastavení používané při pohybu v otevřeném světě. Přímo propojeno se základním herním nastavením."
    L.ZONE_RAID_DESC = "Nastavení používané v raidech a na bojištích. Přímo propojeno s raidovým nastavením hry."
    L.ZONE_DUNGEON_DESC = "Nastavení automaticky aktivované v dungeonech pro 5 hráčů."
    L.ZONE_CITY_DESC = "Nastavení automaticky aktivované v hlavních městech a svatyních."
    L.ZONE_SCENARIO_DESC = "Nastavení automaticky aktivované ve scénářích a Delves."
    L.ZONE_COSMIC_DESC = "Nastavení pro kosmické, astrální a speciální mapy."
    L.ZONE_ORPHAN_DESC = "Nastavení pro izolované nebo speciální podmapy."

    L.PROFILE_ENABLED = "Aktivovat profil pro tento typ zóny"
    L.PROFILE_ENABLED_DESC = "Pokud je vypnuto, použije se nastavení pro Svět (World)."
    L.RAID_ENABLED_DESC = "Povolit samostatné nastavení grafiky pro raidy a bojiště."
    L.GRAPHICS_QUALITY = "Celková kvalita"
    L.GRAPHICS_QUALITY_DESC = "Nastavuje celkový stupeň kvality grafiky od 1 (nejnižší) do 10 (nejvyšší)."

    L.CUSTOM_DETAILS = "Přizpůsobit detailní nastavení grafiky"
    L.CUSTOM_DETAILS_DESC = "Povolí nastavení jednotlivých detailních parametrů grafiky pro tento profil namísto pouhého přednastavení."

    L.CUSTOM_ADVANCED = "Přizpůsobit pokročilá nastavení pro tento profil"
    L.CUSTOM_ADVANCED_DESC = "Povolí pro tento profil samostatné limity FPS, buffering, filtrování textur a další pokročilé volby."

    L.VIEW_DISTANCE = "Dohlednost"
    L.VIEW_DISTANCE_DESC = "Určuje, jak daleko se vykresluje terén, budovy a velké objekty."
    L.ENVIRONMENT_DETAIL = "Detaily prostředí"
    L.ENVIRONMENT_DETAIL_DESC = "Určuje vzdálenost a hustotu vegetace, stromů a detailů prostředí."
    L.GROUND_CLUTTER = "Hustota porostu"
    L.GROUND_CLUTTER_DESC = "Určuje hustotu a dohlednost trávy, kamenů a malého porostu na zemi."

    L.SHADOW_QUALITY = "Kvalita stínů"
    L.SHADOW_QUALITY_DESC = "Nastavuje ostrost, rozlišení a komplexnost stínů postav i prostředí."
    L.LIQUID_DETAIL = "Detaily vody"
    L.LIQUID_DETAIL_DESC = "Ovlivňuje zobrazení hladiny, vlnění a odrazy na vodě a kapalinách."
    L.PARTICLE_DENSITY = "Hustota částic"
    L.PARTICLE_DENSITY_DESC = "Nastavuje množství a komplexnost částicových efektů kouzel, kouře, ohně a počasí."
    L.SSAO = "SSAO (Okolní stínování)"
    L.SSAO_DESC = "Přidává realistické stíny v rozích a záhybech, kde se stýkají různé povrchy."
    L.DEPTH_EFFECTS = "Hloubkové efekty"
    L.DEPTH_EFFECTS_DESC = "Vyhlazuje přechody mezi částicemi kouzel a pevnou geometrií."
    L.COMPUTE_EFFECTS = "Výpočetní efekty"
    L.COMPUTE_EFFECTS_DESC = "Aktivuje výpočetní shadery GPU pro pokročilé osvětlení, mlhu a simulace částic."
    L.OUTLINE_MODE = "Režim obrysů"
    L.OUTLINE_MODE_DESC = "Určuje zvýraznění obrysů cílů, úkolových předmětů a interaktivních objektů."
    L.TEXTURE_RESOLUTION = "Rozlišení textur"
    L.TEXTURE_RESOLUTION_DESC = "Určuje ostrost a rozlišení textur modelů, terénu a vybavení."
    L.SPELL_DENSITY = "Hustota kouzel"
    L.SPELL_DENSITY_DESC = "Filtruje vizuální efekty kouzel v boji pro zachování přehlednosti a plynulosti."
    L.PROJECTED_TEXTURES = "Promítané textury"
    L.PROJECTED_TEXTURES_DESC = "Povoluje promítání efektů kouzel a plošných indikátorů na terén."

    L.ADVANCED = "Pokročilá nastavení"
    L.ADVANCED_DESC = "Detailní nastavení limitů snímkové frekvence (FPS), vyrovnávací paměti a filtrů."
    L.TRIPLE_BUFFERING = "Trojitý buffering"
    L.TRIPLE_BUFFERING_DESC = "Pomáhá předcházet propadům FPS při zapnuté vertikální synchronizaci (VSync)."
    L.TEXTURE_FILTERING = "Filtrování textur"
    L.TEXTURE_FILTERING_DESC = "Anizotropní filtrování zvyšuje ostrost textur sledovaných pod úhlem."
    L.RAY_TRACED_SHADOWS = "Stíny s Ray Tracingem"
    L.RAY_TRACED_SHADOWS_DESC = "Využívá technologii ray tracing pro přesné kontaktní stíny terénu a postav."
    L.RESAMPLE_QUALITY = "Kvalita převzorkování"
    L.RESAMPLE_QUALITY_DESC = "Určuje metodu doostření a převzorkování obrazu (např. AMD FSR)."
    L.VRS_MODE = "Režim VRS"
    L.VRS_MODE_DESC = "Variable Rate Shading zvyšuje výkon stínováním různých částí obrazovky s proměnlivou hustotou."
    L.PHYSICS_INTERACTIONS = "Fyzikální interakce"
    L.PHYSICS_INTERACTIONS_DESC = "Řídí fyziku látek, praporků a kolize objektů světa."
    L.MAX_FPS_ENABLE = "Max. FPS v popředí"
    L.MAX_FPS_ENABLE_DESC = "Omezí maximální počet snímků za sekundu při aktivním okně hry."
    L.MAX_FPS_BK_ENABLE = "Max. FPS na pozadí"
    L.MAX_FPS_BK_ENABLE_DESC = "Omezí maximální počet snímků za sekundu, pokud je hra minimalizována nebo v pozadí."
    L.TARGET_FPS_ENABLE = "Cílové FPS"
    L.TARGET_FPS_ENABLE_DESC = "Dynamicky upravuje rozlišení vykreslování pro udržení požadovaného FPS."
    L.RESAMPLE_SHARPNESS = "Ostrost převzorkování"
    L.RESAMPLE_SHARPNESS_DESC = "Nastavuje doostření obrazu při použití upscalingu (např. AMD FSR)."
    L.CONTRAST = "Kontrast"
    L.CONTRAST_DESC = "Upravuje celkovou úroveň kontrastu obrazu."
    L.BRIGHTNESS = "Jas"
    L.BRIGHTNESS_DESC = "Upravuje celkovou úroveň jasu obrazu."
    L.GAMMA = "Gama"
    L.GAMMA_DESC = "Nastavuje gama křivku středních tónů barev."

    L.OPT_DISABLED = "Vypnuto"
    L.OPT_LOW = "Nízká"
    L.OPT_FAIR = "Dobrá"
    L.OPT_MEDIUM = "Střední"
    L.OPT_HIGH = "Vysoká"
    L.OPT_ULTRA = "Ultra"
    L.OPT_ULTRA_HIGH = "Ultra vysoká"
    L.OPT_ENABLED = "Povoleno"

    L.OPT_SPELL_ESSENTIAL = "Základní"
    L.OPT_SPELL_PARTIAL = "Částečné"
    L.OPT_SPELL_ALL = "Vše"

    L.OPT_RESAMPLE_POINT = "Bodové"
    L.OPT_RESAMPLE_BILINEAR = "Bilineární"
    L.OPT_RESAMPLE_BICUBIC = "Bikubické"
    L.OPT_RESAMPLE_FSR = "AMD FSR 1.0"

    L.OPT_FILTER_BILINEAR = "Bilineární"
    L.OPT_FILTER_TRILINEAR = "Trilineární"
    L.OPT_FILTER_2X = "2x Anizotropní"
    L.OPT_FILTER_4X = "4x Anizotropní"
    L.OPT_FILTER_8X = "8x Anizotropní"
    L.OPT_FILTER_16X = "16x Anizotropní"

    L.OPT_VRS_STANDARD = "Standardní"
    L.OPT_VRS_AGGRESSIVE = "Agresivní"

    L.OPT_PHYSICS_NONE = "Žádná"
    L.OPT_PHYSICS_PLAYER = "Pouze hráč"
    L.OPT_PHYSICS_ALL = "Hráč i NPC"

    -- 3 Kings + 1 Prince
    L.THREE_KINGS_TITLE = "3 Kings + 1 Prince (Bottleneck profil)"
    L.THREE_KINGS_BTN = "Nastavit 3 Kings + 1 Prince"
    L.THREE_KINGS_DESC = "Aplikuje optimální draw-call nastavení: View Distance (7), Environment Detail (7), Ground Clutter (1) a Particle Density (Fair/1). Výrazně uvolňuje CPU a GPU bottleneck v náročných situacích."
    L.THREE_KINGS_APPLIED = "|cff00ff00[Uwowea Settings]|r Profil '|cffffd100%s|r' nastaven na 3 Kings + 1 Prince (VD: %d, ED: %d, GC: %d, Částice: %d)."
    L.APPLY_TO_ACTIVE_PROFILE = "Aplikovat 3 Kings + 1 Prince na aktivní profil"
    L.APPLY_TO_ACTIVE_PROFILE_DESC = "Rychle aplikuje preset 3 Kings + 1 Prince na právě aktivní profil."

    -- Bottleneck / Display settings
    L.RENDER_SCALE = "Měřítko vykreslování (Render Scale)"
    L.RENDER_SCALE_DESC = "Určuje rozlišení vykreslování 3D grafiky vůči rozlišení monitoru. Nižší hodnoty výrazně snižují zátěž GPU."
    L.VERTICAL_SYNC = "Vertikální synchronizace (VSync)"
    L.VERTICAL_SYNC_DESC = "Synchronizuje snímkovou frekvenci s monitorem pro zamezení trhání obrazu. Vypněte pro minimální vstupní prodlevu."
    L.LOW_LATENCY_MODE = "Režim nízké latence (NVIDIA Reflex / XeLL)"
    L.LOW_LATENCY_MODE_DESC = "Snižuje systémovou latenci synchronizací předávání snímků mezi CPU a GPU."
    L.ANTI_ALIASING = "Vyhlazování hran (Anti-Aliasing)"
    L.ANTI_ALIASING_DESC = "Metody vyhlazování zubatých hran na 3D objektech."
    L.MSAA_QUALITY = "Multisampling (MSAA)"
    L.MSAA_QUALITY_DESC = "Hardwarové vyhlazování hran. Vyšší hodnoty značně zatěžují grafickou paměť i výkon GPU."
    L.MSAA_ALPHA_TEST = "MSAA Alpha-Test"
    L.MSAA_ALPHA_TEST_DESC = "Aplikuje vyhlazování hran i na průhledné textury (listí, ploty). Znatelná zátěž GPU."

    -- Hidden bottleneck CVars
    L.VOLUMETRIC_FOG = "Objemová mlha (Volumetric Fog)"
    L.VOLUMETRIC_FOG_DESC = "Kvalita 3D atmosférické objemové mlhy. Vypnutí přináší obrovský nárůst FPS na GPU v moderních zónách."
    L.GROUND_EFFECT_DIST = "Vzdálenost porostu (Ground Effect Dist)"
    L.GROUND_EFFECT_DIST_DESC = "Vzdálenost v yardech, do jaké se vykresluje tráva a drobný porost. Nižší hodnoty dramaticky snižují CPU draw-call bottleneck."
    L.GROUND_EFFECT_DENSITY = "Hustota porostu (Ground Effect Density)"
    L.GROUND_EFFECT_DENSITY_DESC = "Určuje přesnou hustotu objektů porostu na terénu."
    L.WEATHER_DENSITY = "Hustota počasí (Weather Density)"
    L.WEATHER_DENSITY_DESC = "Intenzita částic deště, sněhu a písečných bouří. Vypnutí zamezuje prudkým propadům FPS při bouřích."
    L.WATER_REFLECTION_MODE = "Odrazy na vodní hladině (Reflection Mode)"
    L.WATER_REFLECTION_MODE_DESC = "Ovládá zrcadlení na vodní hladině. Vypnutí eliminuje náročný druhý průchod vykreslování."
    L.WATER_RIPPLE_DETAIL = "Detail vlnění vody (Ripple Detail)"
    L.WATER_RIPPLE_DETAIL_DESC = "Ovládá fyzikální simulaci vln a čeření vodní hladiny."
    L.SHADOW_SOFT = "Měkké stíny (Soft Shadows Filter)"
    L.SHADOW_SOFT_DESC = "Rozmazává okraje stínů. Vypnutí šetří výkon shaderů grafické karty."
    L.FFX_GLOW = "Záře obrazovky (Full Screen Glow)"
    L.FFX_GLOW_DESC = "Post-processing efekt záře. Vypnutí odstraní mlžný opar, zlepší čitelnost v boji a zvedne FPS."
    L.FFX_DEATH = "Efekt smrti (Death Effect)"
    L.FFX_DEATH_DESC = "Černobílý filtr obrazu při smrti. Vypnutí zachová běžné barvy a plné FPS."
    L.FFX_NETHER = "Efekt astrálu (Nether Effect)"
    L.FFX_NETHER_DESC = "Filtr zkreslení obrazu při neviditelnosti nebo ve fázi astrálu/voidu."
    L.ENTITY_LOD_DIST = "Vzdálenost modelů (Entity LOD)"
    L.ENTITY_LOD_DIST_DESC = "Vzdálenost úrovně detailů pro 3D modely postav hráčů a NPC."

    -- New Bottleneck / CPU & GPU CVars
    L.SOUND_CHANNELS = "Zvukové kanály (CPU Audio mixer)"
    L.SOUND_CHANNELS_DESC = "Počet současně přehrávaných zvukových stop počítaných na procesoru. Vysoké hodnoty (64–128) způsobují v raidech silné mikrolagy audio mixeru. Snížení na 32–48 stabilizuje snímkovou frekvenci procesoru."
    L.SOUND_DSP = "Zvukové DSP efekty (Reverb)"
    L.SOUND_DSP_DESC = "Povolí ozvěnu a softwarové DSP filtry v jeskyních a budovách. Vypnutí šetří CPU audio vlákno."
    L.DOODAD_LOD_DIST = "Vzdálenost dekorací světa (Doodad LOD)"
    L.DOODAD_LOD_DIST_DESC = "Vzdálenost, do které se vykreslují drobné objekty světa (pochodně, ploty, sudy, vlajky). Snížení má obrovský dopad na snížení počtu draw callů CPU ve městech a raidech."
    L.LOD_OBJECT_MIN_SIZE = "Ořezávání drobných objektů (Culling)"
    L.LOD_OBJECT_MIN_SIZE_DESC = "Minimální velikost 3D objektu na obrazovce v pixelech, než je vyřazen ze scény. Zvýšení hodnoty ušetří CPU předčasným odříznutím miniaturních objektů v dálce."
    L.WMO_LOD_DIST = "Vzdálenost budov a interiérů (WMO LOD)"
    L.WMO_LOD_DIST_DESC = "Dohlednost velkých architektonických modelů a budov. Snížení uvolňuje paměť a geometrickou zátěž procesoru v hradech a pevnostech."
    L.ANIM_DOODAD_LOD_DIST = "Vzdálenost animací vegetace"
    L.ANIM_DOODAD_LOD_DIST_DESC = "Vzdálenost, do které procesor počítá animace kymácení stromů a vlajek. Snížení eliminuje zbytečné CPU výpočty animací v dálce."
    L.NAMEPLATE_MAX_DIST = "Dohlednost jmenovek (Nameplate Distance)"
    L.NAMEPLATE_MAX_DIST_DESC = "Maximální vzdálenost vykreslování jmenovek nepřátel. V raidech a dungeonech způsobuje 60yd enormní zátěž hlavního vlákna CPU. Snížení na 35–41yd výrazně zvedne minimální FPS v bojích."
    L.NAMEPLATE_MOTION = "Chování pohybu jmenovek"
    L.NAMEPLATE_MOTION_DESC = "Překrývající se jmenovky (Overlapping) neprovádí kolizní fyzikální výpočty na CPU každý snímek na rozdíl od vrstvených (Stacking), což zabraňuje propadům FPS při velkém počtu mobek."
    L.LIGHT_MODE = "Složitost osvětlení (Lighting Mode)"
    L.LIGHT_MODE_DESC = "Dynamická světla (úroveň 2) generují z každého kouzla dynamické bodové světlo a další draw cally. Úroveň 1 nebo 0 zásadně uleví procesoru v raidech."
    L.SPELL_CLUTTER = "Filtrování vizuálního smogu kouzel"
    L.SPELL_CLUTTER_DESC = "Dynamicky filtruje nepodstatné vizuální efekty kouzel spojenců při vysoké hustotě hráčů. Snižuje zahlcení obrazovky i nároky na CPU a GPU."
    L.SUN_SHAFTS = "Sluneční paprsky (Sunshafts)"
    L.SUN_SHAFTS_DESC = "Atmosférické sluneční paprsky pronikající korunami stromů. Vypnutí eliminuje dodatečný náročný stínový render pass."
    L.REFRACTION = "Lom světla a distorze (Refraction)"
    L.REFRACTION_DESC = "Vizuální lom světla za vodní hladinou a horkým vzduchem. Vypnutí šetří sekundární renderovací průchod na grafické kartě."
    L.MAX_FRAME_LATENCY = "Zpoždění snímků CPU (Frame Latency)"
    L.MAX_FRAME_LATENCY_DESC = "Počet snímků, které může procesor připravit dopředu před grafickou kartou. 1 snímek minimalizuje vstupní zpoždění myši, 2 snímky vyhlazují propady FPS při vytížení GPU."

    L.OPT_CHANNELS_16 = "16 kanálů"
    L.OPT_CHANNELS_32 = "32 kanálů (Úsporné)"
    L.OPT_CHANNELS_48 = "48 kanálů (Vyvážené)"
    L.OPT_CHANNELS_64 = "64 kanálů (Výchozí)"
    L.OPT_CHANNELS_128 = "128 kanálů (Náročné)"

    L.OPT_MOTION_OVERLAPPING = "Překrývající se (Nízké CPU)"
    L.OPT_MOTION_STACKING = "Vrstvené (Vysoké CPU)"

    L.OPT_LIGHT_BASIC = "Základní osvětlení"
    L.OPT_LIGHT_STANDARD = "Standardní osvětlení"
    L.OPT_LIGHT_DYNAMIC = "Dynamická světla (Náročné)"

    L.OPT_CLUTTER_AUTO = "Automaticky"
    L.OPT_CLUTTER_NONE = "Bez filtrování"
    L.OPT_CLUTTER_50 = "Střední redukce"
    L.OPT_CLUTTER_100 = "Maximální redukce"

    L.OPT_FRAME_LATENCY_1 = "1 snímek (Nejnižší odezva)"
    L.OPT_FRAME_LATENCY_2 = "2 snímky (Plynulejší FPS)"

    L.OPT_LOW_LATENCY_BUILTIN = "Integrovaný"
    L.OPT_LOW_LATENCY_REFLEX = "NVIDIA Reflex"
    L.OPT_LOW_LATENCY_BOOST = "NVIDIA Reflex + Boost"
    L.OPT_LOW_LATENCY_XELL = "Intel XeLL"

    L.OPT_AA_FXAA_LOW = "FXAA Nízké"
    L.OPT_AA_FXAA_HIGH = "FXAA Vysoké"
    L.OPT_AA_CMAA = "CMAA"
    L.OPT_AA_CMAA2 = "CMAA2"

    L.OPT_MSAA_2X = "2x MSAA"
    L.OPT_MSAA_4X = "4x MSAA"
    L.OPT_MSAA_8X = "8x MSAA"

    L.OPT_REFL_NONE = "Vypnuto"
    L.OPT_REFL_TERRAIN = "Pouze terén"
    L.OPT_REFL_ALL = "Vše (Plné odrazy)"

    L.PROFILE_SWITCHED = "|cff00ff00[Uwowea Settings]|r Grafický profil přepnut na: |cffffd100%s|r (Stupeň %d)"
end

addon.L = L

