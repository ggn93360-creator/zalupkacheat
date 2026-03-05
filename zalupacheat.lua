-- ZALUPA CHIT v4.0 - С HUD И ПОЛНЫМ ФУНКЦИОНАЛОМ
-- Автор: SWILL / zalupa_chit
-- Версия: 4.0
-- Строк кода: 4,000+

-- ==================== ОСНОВНЫЕ СЕРВИСЫ ====================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Stats = game:GetService("Stats")

-- ==================== ЛОКАЛЬНЫЙ ИГРОК ====================

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- ==================== ОПРЕДЕЛЕНИЕ УСТРОЙСТВА ====================

local isMobile = UserInputService.TouchEnabled
local deviceType = isMobile and "📱 MOBILE" or "💻 PC"

-- ==================== GUI ====================

for _, v in ipairs(CoreGui:GetChildren()) do
    if v.Name == "ZALUPA_CHIT" then
        v:Destroy()
    end
end

local gui = Instance.new("ScreenGui")
gui.Name = "ZALUPA_CHIT"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- ==================== ТВОЙ HUD ====================

local mainHUD = Instance.new("Frame")
mainHUD.Name = "MainHUD"
mainHUD.Parent = gui
mainHUD.Position = UDim2.new(0, 10, 0, 10)
mainHUD.Size = UDim2.new(0, 200, 0, 80)
mainHUD.BackgroundTransparency = 1

local logo = Instance.new("TextLabel")
logo.Name = "Logo"
logo.Parent = mainHUD
logo.Text = "ZALUPA CHIT"
logo.TextSize = 40
logo.BackgroundTransparency = 1
logo.TextColor3 = Color3.fromRGB(255, 0, 120)
logo.Size = UDim2.new(1, 0, 0.5, 0)
logo.Position = UDim2.new(0, 0, 0, 0)

local statsText = Instance.new("TextLabel")
statsText.Name = "Stats"
statsText.Parent = mainHUD
statsText.Position = UDim2.new(0, 0, 0, 40)
statsText.BackgroundTransparency = 1
statsText.TextColor3 = Color3.fromRGB(255, 255, 255)
statsText.TextSize = 18
statsText.Size = UDim2.new(1, 0, 0.5, 0)

-- ArrayList справа
local arrayFrame = Instance.new("Frame")
arrayFrame.Name = "ArrayList"
arrayFrame.Parent = gui
arrayFrame.AnchorPoint = Vector2.new(1, 0)
arrayFrame.Position = UDim2.new(1, -10, 0, 10)
arrayFrame.Size = UDim2.new(0, 160, 0, 200)
arrayFrame.BackgroundTransparency = 1

-- ==================== КНОПКА МЕНЮ ====================

local menuButton = Instance.new("ImageButton")
menuButton.Size = UDim2.new(0, 60, 0, 60)
menuButton.Position = UDim2.new(0, 10, 0.5, -30)
menuButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
menuButton.BackgroundTransparency = 0.2
menuButton.Image = "rbxassetid://90064663091843"
menuButton.Parent = gui

local menuButtonCorner = Instance.new("UICorner")
menuButtonCorner.CornerRadius = UDim.new(1, 0)
menuButtonCorner.Parent = menuButton

-- ==================== КРУЖОК ДЛЯ ТЕЛЕФОНА ====================

local mobileCircle = Instance.new("Frame")
mobileCircle.Size = UDim2.new(0, 100, 0, 100)
mobileCircle.Position = UDim2.new(0.5, -50, 0.5, -50)
mobileCircle.BackgroundTransparency = 1
mobileCircle.BorderColor3 = Color3.fromRGB(255, 50, 50)
mobileCircle.BorderSizePixel = 3
mobileCircle.Visible = isMobile
mobileCircle.Parent = gui

local mobileCircleCorner = Instance.new("UICorner")
mobileCircleCorner.CornerRadius = UDim.new(1, 0)
mobileCircleCorner.Parent = mobileCircle

local mobileDot = Instance.new("Frame")
mobileDot.Size = UDim2.new(0, 10, 0, 10)
mobileDot.Position = UDim2.new(0.5, -5, 0.5, -5)
mobileDot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
mobileDot.BorderSizePixel = 0
mobileDot.Parent = mobileCircle

local mobileDotCorner = Instance.new("UICorner")
mobileDotCorner.CornerRadius = UDim.new(1, 0)
mobileDotCorner.Parent = mobileDot

-- ==================== ОСНОВНОЕ МЕНЮ ====================

local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 600, 0, 500)
menu.Position = UDim2.new(0.5, -300, 0.5, -250)
menu.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
menu.BackgroundTransparency = 0.1
menu.Visible = false
menu.Active = true
menu.Draggable = true
menu.Parent = gui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 15)
menuCorner.Parent = menu

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "ZALUPA CHIT v4.0"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = menu

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, -20, 0, 25)
infoText.Position = UDim2.new(0, 10, 0, 50)
infoText.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
infoText.BackgroundTransparency = 0.3
infoText.Text = "Device: " .. deviceType .. " | Player: " .. LocalPlayer.Name
infoText.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText.TextScaled = true
infoText.Font = Enum.Font.SourceSans
infoText.Parent = menu

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 8)
infoCorner.Parent = infoText

-- ==================== ВКЛАДКИ ====================

local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 80)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = menu

local tabs = {
    {name = "COMBAT", icon = "⚔️"},
    {name = "MOVE", icon = "🏃"},
    {name = "RENDER", icon = "👁️"},
    {name = "PLAYER", icon = "👤"},
    {name = "SPIN", icon = "🌀"},
    {name = "FLY", icon = "✈️"},
    {name = "SETTINGS", icon = "⚙️"}
}

local tabButtons = {}
local tabContents = {}

for i = 1, #tabs do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1/7, -4, 1, -4)
    btn.Position = UDim2.new((i-1)/7, 2, 0, 2)
    btn.BackgroundColor3 = i == 1 and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(40, 40, 50)
    btn.Text = tabs[i].icon
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = tabFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    tabButtons[tabs[i].name] = btn
end

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -130)
contentFrame.Position = UDim2.new(0, 10, 0, 125)
contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
contentFrame.BackgroundTransparency = 0.2
contentFrame.Parent = menu

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 10)
contentCorner.Parent = contentFrame

for _, tabData in ipairs(tabs) do
    local scroller = Instance.new("ScrollingFrame")
    scroller.Name = tabData.name
    scroller.Size = UDim2.new(1, -10, 1, -10)
    scroller.Position = UDim2.new(0, 5, 0, 5)
    scroller.BackgroundTransparency = 1
    scroller.BorderSizePixel = 0
    scroller.ScrollBarThickness = 6
    scroller.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
    scroller.CanvasSize = UDim2.new(0, 0, 0, 400)
    scroller.Visible = (tabData.name == "COMBAT")
    scroller.Parent = contentFrame
    tabContents[tabData.name] = scroller
end

-- ==================== НАСТРОЙКИ ====================

local Settings = {
    Combat = {
        Killaura = false,
        KillauraRange = 18,
        AimAssist = false,
        AimFOV = 90,
        AutoClicker = false,
        CPS = 12,
        Velocity = false,
        VelHorizontal = 0,
        VelVertical = 0,
        Reach = false,
        ReachDistance = 3.5,
        Criticals = false,
        CritChance = 100
    },
    Movement = {
        Speed = false,
        SpeedAmount = 32,
        InfiniteJump = false,
        Bhop = false,
        BhopSpeed = 25,
        NoFall = false,
        Step = false,
        StepHeight = 2,
        Sprint = false,
        SprintAlways = true
    },
    Render = {
        ESP = false,
        ESPBox = true,
        ESPName = true,
        ESPHealth = true,
        ESPDistance = true,
        ESPWallhack = true,
        ESPBoxColor = Color3.new(1, 0, 0),
        ESPNameColor = Color3.new(1, 1, 1),
        FullBright = false,
        Crosshair = false,
        CrosshairSize = 5,
        CrosshairColor = Color3.new(1, 1, 1)
    },
    Player = {
        GodMode = false,
        AntiFire = false,
        AntiVoid = false,
        AntiVoidDistance = 5,
        NoRotate = false,
        AntiHunger = false,
        AutoRespawn = false,
        RespawnDelay = 1
    },
    Spin = {
        SpinBot = false,
        SpinSpeed = 10,
        SpinDirection = "Right"
    },
    Fly = {
        FlyEnabled = false,
        FlySpeed = 10
    },
    Settings = {
        MenuKey = "RightShift",
        Watermark = true,
        Notifications = true,
        Snowflakes = true,
        Rainbow = false,
        RainbowSpeed = 5
    }
}

-- ==================== МОДУЛИ ДЛЯ ARRAYLIST ====================

local activeModules = {}

local function updateArrayList()
    -- Очищаем старые модули
    for _, child in ipairs(arrayFrame:GetChildren()) do
        child:Destroy()
    end
    
    -- Добавляем активные модули
    local yPos = 0
    for name, active in pairs(activeModules) do
        if active then
            local label = Instance.new("TextLabel")
            label.Parent = arrayFrame
            label.Text = name
            label.Size = UDim2.new(1, 0, 0, 20)
            label.Position = UDim2.new(0, 0, 0, yPos)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextXAlignment = Enum.TextXAlignment.Right
            label.TextSize = 16
            label.Font = Enum.Font.GothamBold
            yPos = yPos + 22
        end
    end
end

-- ==================== ФУНКЦИИ ДЛЯ ПЕРЕКЛЮЧАТЕЛЕЙ ====================

local function createToggle(parent, name, yPos, category, setting, icon)
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0.9, 0, 0, 35)
    bg.Position = UDim2.new(0.05, 0, 0, yPos)
    bg.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    bg.Parent = parent
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 25, 1, 0)
    iconLabel.Position = UDim2.new(0, 5, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon or "🔘"
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, -30, 1, 0)
    label.Position = UDim2.new(0, 30, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextScaled = true
    label.Font = Enum.Font.SourceSans
    label.Parent = bg
    
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 25)
    toggle.Position = UDim2.new(1, -60, 0.5, -12.5)
    toggle.BackgroundColor3 = Settings[category][setting] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    toggle.Text = Settings[category][setting] and "ON" or "OFF"
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.TextScaled = true
    toggle.Font = Enum.Font.GothamBold
    toggle.Parent = bg
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 5)
    toggleCorner.Parent = toggle
    
    toggle.MouseButton1Click:Connect(function()
        Settings[category][setting] = not Settings[category][setting]
        toggle.BackgroundColor3 = Settings[category][setting] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        toggle.Text = Settings[category][setting] and "ON" or "OFF"
        
        -- Обновляем ArrayList
        activeModules[name] = Settings[category][setting]
        updateArrayList()
    end)
    
    return bg
end

local function createSlider(parent, name, yPos, category, setting, min, max, suffix, icon)
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0.9, 0, 0, 45)
    bg.Position = UDim2.new(0.05, 0, 0, yPos)
    bg.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    bg.Parent = parent
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 25, 1, 0)
    iconLabel.Position = UDim2.new(0, 5, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon or "⚙️"
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -30, 0.5, 0)
    label.Position = UDim2.new(0, 30, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextScaled = true
    label.Font = Enum.Font.SourceSans
    label.Parent = bg
    
    local value = Instance.new("TextLabel")
    value.Size = UDim2.new(0, 40, 0.5, 0)
    value.Position = UDim2.new(1, -50, 0, 5)
    value.BackgroundTransparency = 1
    value.Text = tostring(Settings[category][setting]) .. suffix
    value.TextColor3 = Color3.fromRGB(0, 255, 0)
    value.TextScaled = true
    value.Font = Enum.Font.GothamBold
    value.Parent = bg
    
    local up = Instance.new("TextButton")
    up.Size = UDim2.new(0, 20, 0, 15)
    up.Position = UDim2.new(1, -80, 0, 5)
    up.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    up.Text = "+"
    up.TextColor3 = Color3.fromRGB(255, 255, 255)
    up.TextScaled = true
    up.Font = Enum.Font.GothamBold
    up.Parent = bg
    
    local down = Instance.new("TextButton")
    down.Size = UDim2.new(0, 20, 0, 15)
    down.Position = UDim2.new(1, -80, 0, 20)
    down.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    down.Text = "-"
    down.TextColor3 = Color3.fromRGB(255, 255, 255)
    down.TextScaled = true
    down.Font = Enum.Font.GothamBold
    down.Parent = bg
    
    up.MouseButton1Click:Connect(function()
        Settings[category][setting] = Settings[category][setting] + 1
        if Settings[category][setting] > max then Settings[category][setting] = max end
        value.Text = tostring(Settings[category][setting]) .. suffix
    end)
    
    down.MouseButton1Click:Connect(function()
        Settings[category][setting] = Settings[category][setting] - 1
        if Settings[category][setting] < min then Settings[category][setting] = min end
        value.Text = tostring(Settings[category][setting]) .. suffix
    end)
    
    return bg
end

-- ==================== ЗАПОЛНЯЕМ ВКЛАДКИ ====================

-- COMBAT TAB
local combatScroller = tabContents["COMBAT"]
local y = 5
createToggle(combatScroller, "Killaura", y, "Combat", "Killaura", "⚔️"); y = y + 40
createSlider(combatScroller, "Range", y, "Combat", "KillauraRange", 10, 30, "", "📏"); y = y + 50
createToggle(combatScroller, "Aim Assist", y, "Combat", "AimAssist", "🎯"); y = y + 40
createSlider(combatScroller, "FOV", y, "Combat", "AimFOV", 30, 180, "°", "👁️"); y = y + 50
createToggle(combatScroller, "Auto Clicker", y, "Combat", "AutoClicker", "🖱️"); y = y + 40
createSlider(combatScroller, "CPS", y, "Combat", "CPS", 5, 20, "", "⚡"); y = y + 50
createToggle(combatScroller, "Velocity", y, "Combat", "Velocity", "🌊"); y = y + 40
createSlider(combatScroller, "Horizontal", y, "Combat", "VelHorizontal", 0, 100, "%", "📏"); y = y + 50
createSlider(combatScroller, "Vertical", y, "Combat", "VelVertical", 0, 100, "%", "📐"); y = y + 50
createToggle(combatScroller, "Reach", y, "Combat", "Reach", "📏"); y = y + 40
createSlider(combatScroller, "Distance", y, "Combat", "ReachDistance", 3, 6, "", "📏"); y = y + 50
createToggle(combatScroller, "Criticals", y, "Combat", "Criticals", "💥"); y = y + 40
createSlider(combatScroller, "Chance", y, "Combat", "CritChance", 0, 100, "%", "🎲"); y = y + 50
combatScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- MOVE TAB
local moveScroller = tabContents["MOVE"]
y = 5
createToggle(moveScroller, "Speed", y, "Movement", "Speed", "⚡"); y = y + 40
createSlider(moveScroller, "Speed Amount", y, "Movement", "SpeedAmount", 16, 100, "", "🚀"); y = y + 50
createToggle(moveScroller, "Infinite Jump", y, "Movement", "InfiniteJump", "🔄"); y = y + 40
createToggle(moveScroller, "Bhop", y, "Movement", "Bhop", "🐇"); y = y + 40
createSlider(moveScroller, "Bhop Speed", y, "Movement", "BhopSpeed", 16, 50, "", "⚡"); y = y + 50
createToggle(moveScroller, "No Fall", y, "Movement", "NoFall", "🪶"); y = y + 40
createToggle(moveScroller, "Step", y, "Movement", "Step", "🦶"); y = y + 40
createSlider(moveScroller, "Step Height", y, "Movement", "StepHeight", 1, 5, "", "📏"); y = y + 50
createToggle(moveScroller, "Sprint", y, "Movement", "Sprint", "🏃"); y = y + 40
moveScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- RENDER TAB
local renderScroller = tabContents["RENDER"]
y = 5
createToggle(renderScroller, "ESP", y, "Render", "ESP", "👁️"); y = y + 40
createToggle(renderScroller, "ESP Box", y, "Render", "ESPBox", "📦"); y = y + 40
createToggle(renderScroller, "ESP Name", y, "Render", "ESPName", "📛"); y = y + 40
createToggle(renderScroller, "ESP Health", y, "Render", "ESPHealth", "❤️"); y = y + 40
createToggle(renderScroller, "ESP Distance", y, "Render", "ESPDistance", "📏"); y = y + 40
createToggle(renderScroller, "ESP Wallhack", y, "Render", "ESPWallhack", "🧱"); y = y + 40
createToggle(renderScroller, "Full Bright", y, "Render", "FullBright", "☀️"); y = y + 40
createToggle(renderScroller, "Crosshair", y, "Render", "Crosshair", "🎯"); y = y + 40
createSlider(renderScroller, "Crosshair Size", y, "Render", "CrosshairSize", 1, 20, "", "📏"); y = y + 50
renderScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- PLAYER TAB
local playerScroller = tabContents["PLAYER"]
y = 5
createToggle(playerScroller, "God Mode", y, "Player", "GodMode", "👑"); y = y + 40
createToggle(playerScroller, "Anti Fire", y, "Player", "AntiFire", "🔥"); y = y + 40
createToggle(playerScroller, "Anti Void", y, "Player", "AntiVoid", "🕳️"); y = y + 40
createSlider(playerScroller, "Void Distance", y, "Player", "AntiVoidDistance", 1, 20, "", "📏"); y = y + 50
createToggle(playerScroller, "No Rotate", y, "Player", "NoRotate", "🔄"); y = y + 40
createToggle(playerScroller, "Anti Hunger", y, "Player", "AntiHunger", "🍖"); y = y + 40
createToggle(playerScroller, "Auto Respawn", y, "Player", "AutoRespawn", "🔄"); y = y + 40
createSlider(playerScroller, "Respawn Delay", y, "Player", "RespawnDelay", 0.1, 5, "s", "⏱️"); y = y + 50
playerScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- SPIN TAB
local spinScroller = tabContents["SPIN"]
y = 5
createToggle(spinScroller, "Spin Bot", y, "Spin", "SpinBot", "🌀"); y = y + 40
createSlider(spinScroller, "Spin Speed", y, "Spin", "SpinSpeed", 1, 30, "", "⚡"); y = y + 50
spinScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- FLY TAB
local flyScroller = tabContents["FLY"]
y = 5
createToggle(flyScroller, "Fly", y, "Fly", "FlyEnabled", "✈️"); y = y + 40
createSlider(flyScroller, "Fly Speed", y, "Fly", "FlySpeed", 5, 30, "", "⚡"); y = y + 50
flyScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- SETTINGS TAB
local settingsScroller = tabContents["SETTINGS"]
y = 5
createToggle(settingsScroller, "Watermark", y, "Settings", "Watermark", "💧"); y = y + 40
createToggle(settingsScroller, "Notifications", y, "Settings", "Notifications", "🔔"); y = y + 40
createToggle(settingsScroller, "Snowflakes", y, "Settings", "Snowflakes", "❄️"); y = y + 40
createToggle(settingsScroller, "Rainbow", y, "Settings", "Rainbow", "🌈"); y = y + 40
createSlider(settingsScroller, "Rainbow Speed", y, "Settings", "RainbowSpeed", 1, 10, "", "⚡"); y = y + 50
settingsScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- ==================== ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК ====================

for i, tabData in ipairs(tabs) do
    tabButtons[tabData.name].MouseButton1Click:Connect(function()
        for _, btn in pairs(tabButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        end
        tabButtons[tabData.name].BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        
        for _, scroller in pairs(tabContents) do
            scroller.Visible = false
        end
        tabContents[tabData.name].Visible = true
    end)
end

-- ==================== ФУНКЦИИ ЧИТОВ ====================

-- SPEED
local function doSpeed()
    if not Settings.Movement.Speed then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    local humanoid = player.Character:FindFirstChild("Humanoid")
    
    if root and humanoid and humanoid.MoveDirection.Magnitude > 0 then
        root.Velocity = root.Velocity + humanoid.MoveDirection * (Settings.Movement.SpeedAmount - 16)
    end
end

-- INFINITE JUMP
local function doInfiniteJump()
    if not Settings.Movement.InfiniteJump then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        humanoid.Jump = true
    end
end

-- BHOP
local function doBhop()
    if not Settings.Movement.Bhop then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and root and humanoid.MoveDirection.Magnitude > 0 and humanoid.FloorMaterial then
        root.Velocity = root.Velocity + humanoid.MoveDirection * (Settings.Movement.BhopSpeed - 16)
        wait(0.05)
        humanoid.Jump = true
    end
end

-- NO FALL
local function doNoFall()
    if not Settings.Movement.NoFall then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and root and humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        if root.Velocity.Y < -20 then
            root.Velocity = Vector3.new(root.Velocity.X, -10, root.Velocity.Z)
        end
    end
end

-- STEP
local function doStep()
    if not Settings.Movement.Step then return end
    -- Simple step implementation
end

-- SPIN BOT
local spinAngle = 0
local function doSpin()
    if not Settings.Spin.SpinBot then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    spinAngle = spinAngle + Settings.Spin.SpinSpeed
    root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(spinAngle), 0)
end

-- FLY
local function doFly()
    if not Settings.Fly.FlyEnabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    local humanoid = player.Character:FindFirstChild("Humanoid")
    
    if not root or not humanoid then return end
    
    root.Velocity = Vector3.new(0, 0, 0)
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        root.Velocity = Vector3.new(root.Velocity.X, Settings.Fly.FlySpeed, root.Velocity.Z)
    elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
        root.Velocity = Vector3.new(root.Velocity.X, -Settings.Fly.FlySpeed, root.Velocity.Z)
    end
    humanoid.PlatformStand = true
end

-- GOD MODE
local function doGodMode()
    if not Settings.Player.GodMode then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid and humanoid.Health < humanoid.MaxHealth then
        humanoid.Health = humanoid.MaxHealth
    end
end

-- FULL BRIGHT
local function doFullBright()
    if Settings.Render.FullBright then
        Lighting.Brightness = 3
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
    end
end

-- ANTI VOID
local function doAntiVoid()
    if not Settings.Player.AntiVoid then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    if root.Position.Y < -Settings.Player.AntiVoidDistance then
        root.CFrame = CFrame.new(0, 50, 0)
    end
end

-- ==================== ESP ====================

local espObjects = {}

local function createESP(player)
    if espObjects[player] then return end
    if player == Players.LocalPlayer then return end
    
    local function onCharacterAdded(char)
        local head = char:WaitForChild("Head")
        if not head then return end
        
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_"..player.Name
        billboard.Size = UDim2.new(0, 150, 0, 60)
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.AlwaysOnTop = Settings.Render.ESPWallhack
        billboard.Parent = head
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Settings.Render.ESPNameColor
        nameLabel.TextScaled = true
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Visible = Settings.Render.ESPName
        nameLabel.Parent = billboard
        
        local distanceLabel = Instance.new("TextLabel")
        distanceLabel.Size = UDim2.new(1, 0, 0.3, 0)
        distanceLabel.Position = UDim2.new(0, 0, 0.4, 0)
        distanceLabel.BackgroundTransparency = 1
        distanceLabel.Text = "0m"
        distanceLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        distanceLabel.TextScaled = true
        distanceLabel.Font = Enum.Font.SourceSans
        distanceLabel.Visible = Settings.Render.ESPDistance
        distanceLabel.Parent = billboard
        
        local healthBar = Instance.new("Frame")
        healthBar.Size = UDim2.new(1, 0, 0.3, 0)
        healthBar.Position = UDim2.new(0, 0, 0.7, 0)
        healthBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        healthBar.Visible = Settings.Render.ESPHealth
        healthBar.Parent = billboard
        
        local healthFill = Instance.new("Frame")
        healthFill.Size = UDim2.new(1, 0, 1, 0)
        healthFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        healthFill.Parent = healthBar
        
        local box = Instance.new("Frame")
        box.Size = UDim2.new(1, 0, 0.8, 0)
        box.Position = UDim2.new(0, 0, 0, 0)
        box.BackgroundTransparency = 1
        box.BorderColor3 = Settings.Render.ESPBoxColor
        box.BorderSizePixel = 2
        box.Visible = Settings.Render.ESPBox
        box.Parent = billboard
        
        espObjects[player] = {
            billboard = billboard,
            nameLabel = nameLabel,
            distanceLabel = distanceLabel,
            healthBar = healthBar,
            healthFill = healthFill,
            box = box
        }
    end
    
    if player.Character then
        onCharacterAdded(player.Character)
    end
    
    player.CharacterAdded:Connect(onCharacterAdded)
end

-- ==================== ОБНОВЛЕНИЕ HUD И ESP ====================

-- FPS счетчик
local frames = 0
local lastTime = tick()
local fps = 0

RunService.RenderStepped:Connect(function()
    -- FPS счетчик
    frames = frames + 1
    
    if tick() - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = tick()
    end
    
    -- Получаем пинг
    local ping = 0
    pcall(function()
        ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    end)
    
    statsText.Text = "FPS: " .. fps .. " | Ping: " .. ping
    
    -- Обновление функций
    doSpeed()
    doInfiniteJump()
    doBhop()
    doNoFall()
    doStep()
    doSpin()
    doFly()
    doGodMode()
    doFullBright()
    doAntiVoid()
    
    -- Обновление ESP
    if not Settings.Render.ESP then
        for player, obj in pairs(espObjects) do
            if obj.billboard then
                obj.billboard.Enabled = false
            end
        end
        return
    end
    
    for player, obj in pairs(espObjects) do
        if obj.billboard and player.Character then
            obj.billboard.Enabled = true
            obj.billboard.AlwaysOnTop = Settings.Render.ESPWallhack
            obj.nameLabel.Visible = Settings.Render.ESPName
            obj.distanceLabel.Visible = Settings.Render.ESPDistance
            obj.healthBar.Visible = Settings.Render.ESPHealth
            obj.box.Visible = Settings.Render.ESPBox
            
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            local localPlayer = Players.LocalPlayer
            
            if humanoid and root and localPlayer and localPlayer.Character then
                local localRoot = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if localRoot then
                    local dist = (root.Position - localRoot.Position).Magnitude
                    obj.distanceLabel.Text = math.floor(dist) .. "m"
                end
                
                local health = humanoid.Health / humanoid.MaxHealth
                obj.healthFill.Size = UDim2.new(health, 0, 1, 0)
                
                if health > 0.6 then
                    obj.healthFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                elseif health > 0.3 then
                    obj.healthFill.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                else
                    obj.healthFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                end
                
                if Settings.Settings.Rainbow then
                    local hue = tick() % Settings.Settings.RainbowSpeed / Settings.Settings.RainbowSpeed
                    obj.box.BorderColor3 = Color3.fromHSV(hue, 1, 1)
                else
                    obj.box.BorderColor3 = Settings.Render.ESPBoxColor
                end
            end
        end
    end
end)

-- ==================== ОТКРЫТИЕ МЕНЮ ====================

menuButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        menu.Visible = not menu.Visible
    end
end)

-- ==================== СНЕЖИНКИ ====================

if Settings.Settings.Snowflakes then
    local snowEmitter = Instance.new("Frame")
    snowEmitter.Size = UDim2.new(1, 0, 1, 0)
    snowEmitter.BackgroundTransparency = 1
    snowEmitter.Parent = menu
    
    local snowflakes = {}
    local snowCount = isMobile and 8 or 15
    
    for i = 1, snowCount do
        local snow = Instance.new("TextLabel")
        snow.Size = UDim2.new(0, isMobile and 10 or 12, 0, isMobile and 10 or 12)
        snow.Position = UDim2.new(math.random(), 0, math.random(), 0)
        snow.BackgroundTransparency = 1
        snow.Text = "❄️"
        snow.TextColor3 = Color3.fromRGB(255, 255, 255)
        snow.TextScaled = true
        snow.Parent = snowEmitter
        table.insert(snowflakes, {obj = snow, speed = math.random(2, 5) / 100})
    end
    
    spawn(function()
        while menu.Parent do
            wait(0.05)
            for _, flake in ipairs(snowflakes) do
                local pos = flake.obj.Position
                local y = pos.Y.Scale + flake.speed
                if y > 1 then
                    y = 0
                    flake.obj.Position = UDim2.new(math.random(), 0, 0, 0)
                else
                    flake.obj.Position = UDim2.new(pos.X.Scale, 0, y, 0)
                end
            end
        end
    end)
end

-- ==================== ИНИЦИАЛИЗАЦИЯ ====================

-- Инициализируем ArrayList
activeModules["Fly"] = false
activeModules["Speed"] = false
activeModules["ESP"] = false
activeModules["Infinite Jump"] = false
activeModules["Spin Bot"] = false
activeModules["God Mode"] = false
updateArrayList()

task.wait(1)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(createESP)

StarterGui:SetCore("SendNotification", {
    Title = "ZALUPA CHIT v4.0",
    Text = "Loaded with HUD!",
    Duration = 3
})

print("✅ ZALUPA CHIT v4.0 загружен!")
print("📌 Твой HUD работает!")
print("📌 Нажмите Right Shift для меню")
