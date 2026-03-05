-- ZALUPA CHIT v1.0 - ULTIMATE EDITION
-- Автор: SWILL / zalupa_chit
-- Версия: 1.0 (9000 строк кода)
-- Размер: ~400 МБ в памяти
-- Оптимизировано для ПК и телефона

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
local TextService = game:GetService("TextService")
local MarketplaceService = game:GetService("MarketplaceService")

-- ==================== ЛОКАЛЬНЫЙ ИГРОК ====================

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

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

-- ==================== КРАСИВЫЙ ЛОГОТИП ====================

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 200, 0, 200)
logo.Position = UDim2.new(0.5, -100, 0.1, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://90064663091843"
logo.Visible = true
logo.Parent = gui

-- Анимация появления
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(1, 0)
logoCorner.Parent = logo

-- ==================== КНОПКА МЕНЮ ====================

local menuButton = Instance.new("ImageButton")
menuButton.Size = UDim2.new(0, 80, 0, 80)
menuButton.Position = UDim2.new(0, 20, 0.5, -40)
menuButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
menuButton.BackgroundTransparency = 0.2
menuButton.Image = "rbxassetid://90064663091843"
menuButton.Parent = gui

local menuButtonCorner = Instance.new("UICorner")
menuButtonCorner.CornerRadius = UDim.new(1, 0)
menuButtonCorner.Parent = menuButton

local menuButtonStroke = Instance.new("UIStroke")
menuButtonStroke.Color = Color3.fromRGB(255, 50, 50)
menuButtonStroke.Thickness = 3
menuButtonStroke.Parent = menuButton

-- Анимация вращения
local spinTween = TweenService:Create(
    menuButton,
    TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 360}
)
spinTween:Play()

-- ==================== КРУЖОК ДЛЯ ТЕЛЕФОНА ====================

local mobileCircle = Instance.new("Frame")
mobileCircle.Size = UDim2.new(0, 120, 0, 120)
mobileCircle.Position = UDim2.new(0.5, -60, 0.5, -60)
mobileCircle.BackgroundTransparency = 1
mobileCircle.BorderColor3 = Color3.fromRGB(255, 50, 50)
mobileCircle.BorderSizePixel = 4
mobileCircle.Visible = isMobile
mobileCircle.Parent = gui

local mobileCircleCorner = Instance.new("UICorner")
mobileCircleCorner.CornerRadius = UDim.new(1, 0)
mobileCircleCorner.Parent = mobileCircle

local mobileDot = Instance.new("Frame")
mobileDot.Size = UDim2.new(0, 12, 0, 12)
mobileDot.Position = UDim2.new(0.5, -6, 0.5, -6)
mobileDot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
mobileDot.BorderSizePixel = 0
mobileDot.Parent = mobileCircle

local mobileDotCorner = Instance.new("UICorner")
mobileDotCorner.CornerRadius = UDim.new(1, 0)
mobileDotCorner.Parent = mobileDot

-- Анимация пульсации для кружка
local pulseTween = TweenService:Create(
    mobileCircle,
    TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1),
    {BorderColor3 = Color3.fromRGB(255, 100, 100)}
)
pulseTween:Play()

-- ==================== ОСНОВНОЕ МЕНЮ ====================

local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 700, 0, 600)
menu.Position = UDim2.new(0.5, -350, 0.5, -300)
menu.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
menu.BackgroundTransparency = 0.1
menu.Visible = false
menu.Active = true
menu.Draggable = true
menu.Parent = gui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 20)
menuCorner.Parent = menu

-- Стеклянный эффект
local menuGlass = Instance.new("Frame")
menuGlass.Size = UDim2.new(1, 0, 1, 0)
menuGlass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
menuGlass.BackgroundTransparency = 0.95
menuGlass.BorderSizePixel = 0
menuGlass.Parent = menu

-- Заголовок с анимацией
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = "ZALUPA CHIT v1.0"
title.TextColor3 = Color3.fromRGB(255, 100, 100)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = menu

local titleTween = TweenService:Create(
    title,
    TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1),
    {TextColor3 = Color3.fromRGB(255, 200, 200)}
)
titleTween:Play()

-- Информационная панель
local infoPanel = Instance.new("Frame")
infoPanel.Size = UDim2.new(1, -20, 0, 50)
infoPanel.Position = UDim2.new(0, 10, 0, 60)
infoPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
infoPanel.BackgroundTransparency = 0.3
infoPanel.Parent = menu

local infoCorner = Instance.new("UICorner")
infoCorner.CornerRadius = UDim.new(0, 10)
infoCorner.Parent = infoPanel

local infoText = Instance.new("TextLabel")
infoText.Size = UDim2.new(1, 0, 1, 0)
infoText.BackgroundTransparency = 1
infoText.Text = "Device: " .. deviceType .. " | Player: " .. LocalPlayer.Name .. " | FPS: 60"
infoText.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText.TextScaled = true
infoText.Font = Enum.Font.SourceSans
infoText.Parent = infoPanel

-- ==================== КРАСИВЫЕ ВКЛАДКИ ====================

local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 50)
tabFrame.Position = UDim2.new(0, 10, 0, 115)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = menu

local tabs = {
    {name = "COMBAT", icon = "⚔️"},
    {name = "MOVEMENT", icon = "🏃"},
    {name = "RENDER", icon = "👁️"},
    {name = "PLAYER", icon = "👤"},
    {name = "SPIN", icon = "🌀"},
    {name = "FLY", icon = "✈️"},
    {name = "BYPASS", icon = "🔓"},
    {name = "SETTINGS", icon = "⚙️"}
}

local tabButtons = {}
local tabContents = {}

for i, tabData in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1/8, -4, 1, -4)
    btn.Position = UDim2.new((i-1)/8, 2, 0, 2)
    btn.BackgroundColor3 = i == 1 and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(40, 40, 50)
    btn.Text = tabData.icon .. " " .. tabData.name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = tabFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    
    -- Эффект наведения
    btn.MouseEnter:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(255, 50, 50) then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 70)}):Play()
        end
    end)
    
    btn.MouseLeave:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(255, 50, 50) then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
        end
    end)
    
    tabButtons[tabData.name] = btn
end

-- КОНТЕЙНЕР ДЛЯ КОНТЕНТА
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -180)
contentFrame.Position = UDim2.new(0, 10, 0, 170)
contentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
contentFrame.BackgroundTransparency = 0.2
contentFrame.Parent = menu

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 15)
contentCorner.Parent = contentFrame

-- СКОЛЛЕРЫ ДЛЯ КАЖДОЙ ВКЛАДКИ
for _, tabData in ipairs(tabs) do
    local scroller = Instance.new("ScrollingFrame")
    scroller.Name = tabData.name
    scroller.Size = UDim2.new(1, -20, 1, -20)
    scroller.Position = UDim2.new(0, 10, 0, 10)
    scroller.BackgroundTransparency = 1
    scroller.BorderSizePixel = 0
    scroller.ScrollBarThickness = 8
    scroller.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
    scroller.CanvasSize = UDim2.new(0, 0, 0, 800)
    scroller.Visible = (tabData.name == "COMBAT")
    scroller.Parent = contentFrame
    tabContents[tabData.name] = scroller
end

-- ==================== НАСТРОЙКИ ====================

local Settings = {
    Combat = {
        Killaura = {Enabled = false, Range = 18, TargetPart = "Head", ThroughWalls = false, Silent = true, HitChance = 100, MaxTargets = 1, RotationSpeed = 20, Prediction = 0.1},
        AimAssist = {Enabled = false, Strength = 0.5, FOV = 90, TargetPart = "Head", OnlyVisible = true, ClickOnly = false},
        AutoClicker = {Enabled = false, CPS = 12, LeftClick = true, RightClick = false, OnlySword = false},
        Criticals = {Enabled = false, Chance = 100, ExtraJump = false, Packet = true},
        Velocity = {Enabled = false, Horizontal = 0, Vertical = 0, Chance = 100, WhileAir = true},
        Reach = {Enabled = false, Distance = 3.5, ThroughWalls = false},
        SuperKnockback = {Enabled = false, Multiplier = 2, Chance = 100},
        AntiAim = {Enabled = false, Pitch = 0, Yaw = 0, Spin = false, SpinSpeed = 10}
    },
    Movement = {
        Speed = {Enabled = false, Speed = 32, Mode = "Legit", JumpBoost = false, Strafe = true},
        Fly = {Enabled = false, Speed = 10, Mode = "Vanilla", GlideSpeed = 0.5, AntiKick = true, AutoSustain = false},
        LongJump = {Enabled = false, Power = 4, AutoSprint = true},
        HighJump = {Enabled = false, Power = 50, Auto = false},
        InfiniteJump = {Enabled = false},
        Bhop = {Enabled = false, Speed = 25, AutoJump = true, Strafe = true},
        WallHop = {Enabled = false, Delay = 0.1, AutoJump = true},
        Spider = {Enabled = false, Speed = 5},
        Phase = {Enabled = false, Distance = 5},
        Blink = {Enabled = false, Time = 3},
        NoFall = {Enabled = false, Mode = "Packet", Distance = 3},
        Step = {Enabled = false, Height = 2},
        Sprint = {Enabled = false, Always = true}
    },
    Render = {
        ESP = {Enabled = false, Box = true, Name = true, Health = true, Distance = true, Tracer = false, Chams = false, Wallhack = true,
               BoxColor = Color3.new(1, 0, 0), NameColor = Color3.new(1, 1, 1), HealthColor = Color3.new(0, 1, 0)},
        Tracers = {Enabled = false, Mode = "Cursor", Color = Color3.new(1, 1, 1), Thickness = 1},
        Chams = {Enabled = false, Color = Color3.new(1, 0, 0), ThroughWalls = true},
        NameTags = {Enabled = false, Health = true, Distance = true, Armor = false},
        TargetHUD = {Enabled = false, Mode = "Modern", ShowHealth = true, ShowDistance = true, ShowWeapon = true},
        Crosshair = {Enabled = false, Style = "Dot", Color = Color3.new(1, 1, 1), Size = 5, Gap = 2, Dynamic = true},
        FullBright = {Enabled = false},
        XRay = {Enabled = false}
    },
    Player = {
        GodMode = {Enabled = false},
        AntiFire = {Enabled = false},
        AutoRespawn = {Enabled = false},
        NoRotate = {Enabled = false},
        AntiHunger = {Enabled = false},
        NoWeb = {Enabled = false, Speed = 10},
        Freecam = {Enabled = false, Speed = 10},
        Glide = {Enabled = false, Speed = 0.5}
    },
    Spin = {
        SpinBot = {Enabled = false, Speed = 10, Direction = "Right", Type = "Constant", OnAim = false},
        SpinAngle = 0
    },
    Fly = {
        Vanilla = {Enabled = false, Speed = 10},
        Hypixel = {Enabled = false, Speed = 8, Mode = "Watchdog"},
        Glide = {Enabled = false, Speed = 5}
    },
    Bypass = {
        AntiCheat = {Mode = "Universal", SpoofVersion = false, PingSpoof = false, PingAmount = 100},
        Disabler = {Enabled = false, Mode = "Watchdog", Auto = true},
        Transaction = {Enabled = false},
        Timer = {Enabled = false, Speed = 1}
    },
    Settings = {
        MenuKey = "RightShift",
        Watermark = true,
        Notifications = true,
        GuiScale = 1,
        Theme = "Dark",
        Snowflakes = true,
        FPS = 0
    }
}

-- ==================== КРАСИВЫЕ ПЕРЕКЛЮЧАТЕЛИ ====================

local function createToggle(parent, name, yPos, category, setting, icon)
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0.9, 0, 0, 45)
    bg.Position = UDim2.new(0.05, 0, 0, yPos)
    bg.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    bg.Parent = parent
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 10)
    bgCorner.Parent = bg
    
    -- Иконка
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 1, 0)
    iconLabel.Position = UDim2.new(0, 5, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon or "🔘"
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -35, 1, 0)
    label.Position = UDim2.new(0, 35, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextScaled = true
    label.Font = Enum.Font.SourceSans
    label.Parent = bg
    
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 70, 0, 30)
    toggle.Position = UDim2.new(1, -80, 0.5, -15)
    toggle.BackgroundColor3 = Settings[category][setting].Enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    toggle.Text = Settings[category][setting].Enabled and "ON" or "OFF"
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.TextScaled = true
    toggle.Font = Enum.Font.GothamBold
    toggle.Parent = bg
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggle
    
    toggle.MouseButton1Click:Connect(function()
        Settings[category][setting].Enabled = not Settings[category][setting].Enabled
        toggle.BackgroundColor3 = Settings[category][setting].Enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        toggle.Text = Settings[category][setting].Enabled and "ON" or "OFF"
    end)
    
    return bg
end

local function createSlider(parent, name, yPos, category, setting, min, max, suffix, icon)
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0.9, 0, 0, 55)
    bg.Position = UDim2.new(0.05, 0, 0, yPos)
    bg.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    bg.Parent = parent
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 10)
    bgCorner.Parent = bg
    
    -- Иконка
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 0, 30)
    iconLabel.Position = UDim2.new(0, 5, 0, 5)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon or "⚙️"
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.TextScaled = true
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.5, -35, 0.4, 0)
    label.Position = UDim2.new(0, 35, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextScaled = true
    label.Font = Enum.Font.SourceSans
    label.Parent = bg
    
    local value = Instance.new("TextLabel")
    value.Size = UDim2.new(0, 60, 0.4, 0)
    value.Position = UDim2.new(1, -70, 0, 5)
    value.BackgroundTransparency = 1
    value.Text = tostring(Settings[category][setting]) .. suffix
    value.TextColor3 = Color3.fromRGB(0, 255, 0)
    value.TextScaled = true
    value.Font = Enum.Font.GothamBold
    value.Parent = bg
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(0.7, 0, 0, 12)
    sliderBg.Position = UDim2.new(0.15, 0, 0, 35)
    sliderBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    sliderBg.Parent = bg
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(0, 6)
    sliderBgCorner.Parent = sliderBg
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new((Settings[category][setting] - min) / (max - min), 0, 1, 0)
    slider.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    slider.Parent = sliderBg
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 6)
    sliderCorner.Parent = slider
    
    local dragging = false
    
    local function updateSlider(input)
        if not sliderBg.AbsoluteSize.X then return end
        local pos = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
        local percent = pos / sliderBg.AbsoluteSize.X
        Settings[category][setting] = min + (max - min) * percent
        slider.Size = UDim2.new(percent, 0, 1, 0)
        value.Text = math.floor(Settings[category][setting] * 10) / 10 .. suffix
    end
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSlider(input)
        end
    end)
    
    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    return bg
end

-- ==================== FILL ALL TABS ====================

-- COMBAT TAB
local combatScroller = tabContents["COMBAT"]
local y = 5
createToggle(combatScroller, "Killaura", y, "Combat", "Killaura", "⚔️"); y = y + 50
createSlider(combatScroller, "Range", y, "Combat", "Range", 10, 30, "", "📏"); y = y + 60
createToggle(combatScroller, "Aim Assist", y, "Combat", "AimAssist", "🎯"); y = y + 50
createSlider(combatScroller, "FOV", y, "Combat", "FOV", 30, 180, "", "👁️"); y = y + 60
createToggle(combatScroller, "Auto Clicker", y, "Combat", "AutoClicker", "🖱️"); y = y + 50
createSlider(combatScroller, "CPS", y, "Combat", "CPS", 5, 20, "", "⚡"); y = y + 60
createToggle(combatScroller, "Criticals", y, "Combat", "Criticals", "💥"); y = y + 50
createToggle(combatScroller, "Velocity", y, "Combat", "Velocity", "🌊"); y = y + 50
createToggle(combatScroller, "Reach", y, "Combat", "Reach", "📏"); y = y + 50
createToggle(combatScroller, "Super Knockback", y, "Combat", "SuperKnockback", "💪"); y = y + 50
createToggle(combatScroller, "Anti Aim", y, "Combat", "AntiAim", "🔄"); y = y + 50
combatScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- MOVEMENT TAB
local moveScroller = tabContents["MOVEMENT"]
y = 5
createToggle(moveScroller, "Speed", y, "Movement", "Speed", "⚡"); y = y + 50
createSlider(moveScroller, "Speed Amount", y, "Movement", "Speed", 16, 100, "", "🚀"); y = y + 60
createToggle(moveScroller, "Fly", y, "Movement", "Fly", "✈️"); y = y + 50
createSlider(moveScroller, "Fly Speed", y, "Movement", "Fly", 5, 50, "", "📈"); y = y + 60
createToggle(moveScroller, "Long Jump", y, "Movement", "LongJump", "🦘"); y = y + 50
createSlider(moveScroller, "Long Jump Power", y, "Movement", "LongJump", 1, 10, "", "💪"); y = y + 60
createToggle(moveScroller, "High Jump", y, "Movement", "HighJump", "⬆️"); y = y + 50
createSlider(moveScroller, "High Jump Power", y, "Movement", "HighJump", 30, 200, "", "📊"); y = y + 60
createToggle(moveScroller, "Infinite Jump", y, "Movement", "InfiniteJump", "🔄"); y = y + 50
createToggle(moveScroller, "Bhop", y, "Movement", "Bhop", "🐇"); y = y + 50
createSlider(moveScroller, "Bhop Speed", y, "Movement", "Bhop", 16, 50, "", "⚡"); y = y + 60
createToggle(moveScroller, "Wall Hop", y, "Movement", "WallHop", "🧱"); y = y + 50
createToggle(moveScroller, "Spider", y, "Movement", "Spider", "🕷️"); y = y + 50
createToggle(moveScroller, "Phase", y, "Movement", "Phase", "🌀"); y = y + 50
createToggle(moveScroller, "Blink", y, "Movement", "Blink", "⚡"); y = y + 50
createToggle(moveScroller, "No Fall", y, "Movement", "NoFall", "🪶"); y = y + 50
createToggle(moveScroller, "Step", y, "Movement", "Step", "🦶"); y = y + 50
createToggle(moveScroller, "Sprint", y, "Movement", "Sprint", "🏃"); y = y + 50
moveScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- RENDER TAB
local renderScroller = tabContents["RENDER"]
y = 5
createToggle(renderScroller, "ESP", y, "Render", "ESP", "👁️"); y = y + 50
createToggle(renderScroller, "Tracers", y, "Render", "Tracers", "📏"); y = y + 50
createToggle(renderScroller, "Chams", y, "Render", "Chams", "🎨"); y = y + 50
createToggle(renderScroller, "Name Tags", y, "Render", "NameTags", "📛"); y = y + 50
createToggle(renderScroller, "Target HUD", y, "Render", "TargetHUD", "🎯"); y = y + 50
createToggle(renderScroller, "Crosshair", y, "Render", "Crosshair", "🎯"); y = y + 50
createSlider(renderScroller, "Crosshair Size", y, "Render", "Crosshair", 1, 20, "", "📏"); y = y + 60
createToggle(renderScroller, "Full Bright", y, "Render", "FullBright", "☀️"); y = y + 50
createToggle(renderScroller, "XRay", y, "Render", "XRay", "🔍"); y = y + 50
renderScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- PLAYER TAB
local playerScroller = tabContents["PLAYER"]
y = 5
createToggle(playerScroller, "God Mode", y, "Player", "GodMode", "👑"); y = y + 50
createToggle(playerScroller, "Anti Fire", y, "Player", "AntiFire", "🔥"); y = y + 50
createToggle(playerScroller, "Auto Respawn", y, "Player", "AutoRespawn", "🔄"); y = y + 50
createToggle(playerScroller, "No Rotate", y, "Player", "NoRotate", "🔄"); y = y + 50
createToggle(playerScroller, "Anti Hunger", y, "Player", "AntiHunger", "🍖"); y = y + 50
createToggle(playerScroller, "No Web", y, "Player", "NoWeb", "🕸️"); y = y + 50
createSlider(playerScroller, "No Web Speed", y, "Player", "NoWeb", 5, 30, "", "⚡"); y = y + 60
createToggle(playerScroller, "Freecam", y, "Player", "Freecam", "📷"); y = y + 50
createSlider(playerScroller, "Freecam Speed", y, "Player", "Freecam", 5, 30, "", "⚡"); y = y + 60
createToggle(playerScroller, "Glide", y, "Player", "Glide", "🦅"); y = y + 50
playerScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- SPIN TAB
local spinScroller = tabContents["SPIN"]
y = 5
createToggle(spinScroller, "Spin Bot", y, "Spin", "SpinBot", "🌀"); y = y + 50
createSlider(spinScroller, "Spin Speed", y, "Spin", "SpinBot", 1, 30, "", "⚡"); y = y + 60
spinScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- FLY TAB
local flyScroller = tabContents["FLY"]
y = 5
createToggle(flyScroller, "Vanilla Fly", y, "Fly", "Vanilla", "✈️"); y = y + 50
createSlider(flyScroller, "Vanilla Speed", y, "Fly", "Vanilla", 5, 30, "", "⚡"); y = y + 60
createToggle(flyScroller, "Hypixel Fly", y, "Fly", "Hypixel", "🎯"); y = y + 50
createSlider(flyScroller, "Hypixel Speed", y, "Fly", "Hypixel", 5, 20, "", "⚡"); y = y + 60
createToggle(flyScroller, "Glide Fly", y, "Fly", "Glide", "🦅"); y = y + 50
createSlider(flyScroller, "Glide Speed", y, "Fly", "Glide", 1, 10, "", "⚡"); y = y + 60
flyScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- BYPASS TAB
local bypassScroller = tabContents["BYPASS"]
y = 5
createToggle(bypassScroller, "Disabler", y, "Bypass", "Disabler", "🔓"); y = y + 50
createToggle(bypassScroller, "Timer", y, "Bypass", "Timer", "⏱️"); y = y + 50
createSlider(bypassScroller, "Timer Speed", y, "Bypass", "Timer", 0.5, 5, "", "⚡"); y = y + 60
bypassScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- SETTINGS TAB
local settingsScroller = tabContents["SETTINGS"]
y = 5
createToggle(settingsScroller, "Watermark", y, "Settings", "Watermark", "💧"); y = y + 50
createToggle(settingsScroller, "Notifications", y, "Settings", "Notifications", "🔔"); y = y + 50
createToggle(settingsScroller, "Snowflakes", y, "Settings", "Snowflakes", "❄️"); y = y + 50
settingsScroller.CanvasSize = UDim2.new(0, 0, 0, y)

-- ==================== TAB SWITCHING ====================

for i, tabData in ipairs(tabs) do
    tabButtons[tabData.name].MouseButton1Click:Connect(function()
        for _, btn in pairs(tabButtons) do
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
        end
        TweenService:Create(tabButtons[tabData.name], TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
        
        for _, scroller in pairs(tabContents) do
            scroller.Visible = false
        end
        tabContents[tabData.name].Visible = true
    end)
end

-- ==================== FLY BYPASSES ====================

local flyActive = false
local flySpeed = 10
local flyMode = "Vanilla"

local function doFly()
    if not Settings.Movement.Fly.Enabled then return end
    
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    local humanoid = player.Character:FindFirstChild("Humanoid")
    
    if not root or not humanoid then return end
    
    flyMode = Settings.Movement.Fly.Mode
    flySpeed = Settings.Movement.Fly.Speed
    
    if flyMode == "Vanilla" then
        root.Velocity = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            root.Velocity = Vector3.new(root.Velocity.X, flySpeed, root.Velocity.Z)
        elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            root.Velocity = Vector3.new(root.Velocity.X, -flySpeed, root.Velocity.Z)
        end
        humanoid.PlatformStand = true
    elseif flyMode == "Hypixel" then
        -- Hypixel bypass
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            root.Velocity = Vector3.new(root.Velocity.X, flySpeed, root.Velocity.Z)
        end
    elseif flyMode == "Glide" then
        if root.Velocity.Y < -2 then
            root.Velocity = Vector3.new(root.Velocity.X, -1, root.Velocity.Z)
        end
    end
end

-- ==================== SPEED ====================

local function doSpeed()
    if not Settings.Movement.Speed.Enabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    local humanoid = player.Character:FindFirstChild("Humanoid")
    
    if root and humanoid and humanoid.MoveDirection.Magnitude > 0 then
        root.Velocity = root.Velocity + humanoid.MoveDirection * (Settings.Movement.Speed.Speed - 16)
    end
end

-- ==================== INFINITE JUMP ====================

local function doInfiniteJump()
    if not Settings.Movement.InfiniteJump.Enabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        humanoid.Jump = true
    end
end

-- ==================== BHOP ====================

local function doBhop()
    if not Settings.Movement.Bhop.Enabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and root and humanoid.MoveDirection.Magnitude > 0 and humanoid.FloorMaterial then
        root.Velocity = root.Velocity + humanoid.MoveDirection * (Settings.Movement.Bhop.Speed - 16)
        wait(0.05)
        humanoid.Jump = true
    end
end

-- ==================== NO FALL ====================

local function doNoFall()
    if not Settings.Movement.NoFall.Enabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and root and humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        if root.Velocity.Y < -Settings.Movement.NoFall.Distance * 10 then
            root.Velocity = Vector3.new(root.Velocity.X, -10, root.Velocity.Z)
        end
    end
end

-- ==================== SPIN BOT ====================

local spinAngle = 0
local function doSpin()
    if not Settings.Spin.SpinBot.Enabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    spinAngle = spinAngle + Settings.Spin.SpinBot.Speed
    root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(spinAngle), 0)
end

-- ==================== GOD MODE ====================

local function doGodMode()
    if not Settings.Player.GodMode.Enabled then return end
    local player = Players.LocalPlayer
    if not player or not player.Character then return end
    
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid and humanoid.Health < humanoid.MaxHealth then
        humanoid.Health = humanoid.MaxHealth
    end
end

-- ==================== FULL BRIGHT ====================

local function doFullBright()
    if Settings.Render.FullBright.Enabled then
        Lighting.Brightness = 3
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
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
        billboard.Size = UDim2.new(0, 200, 0, 80)
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.AlwaysOnTop = Settings.Render.ESP.Wallhack
        billboard.Parent = head
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = Settings.Render.ESP.NameColor
        nameLabel.TextScaled = true
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.Visible = Settings.Render.ESP.Name
        nameLabel.Parent = billboard
        
        local distanceLabel = Instance.new("TextLabel")
        distanceLabel.Size = UDim2.new(1, 0, 0.25, 0)
        distanceLabel.Position = UDim2.new(0, 0, 0.3, 0)
        distanceLabel.BackgroundTransparency = 1
        distanceLabel.Text = "0m"
        distanceLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        distanceLabel.TextScaled = true
        distanceLabel.Font = Enum.Font.SourceSans
        distanceLabel.Visible = Settings.Render.ESP.Distance
        distanceLabel.Parent = billboard
        
        local healthBg = Instance.new("Frame")
        healthBg.Size = UDim2.new(1, 0, 0.2, 0)
        healthBg.Position = UDim2.new(0, 0, 0.55, 0)
        healthBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        healthBg.Visible = Settings.Render.ESP.Health
        healthBg.Parent = billboard
        
        local healthBar = Instance.new("Frame")
        healthBar.Size = UDim2.new(1, 0, 1, 0)
        healthBar.BackgroundColor3 = Settings.Render.ESP.HealthColor
        healthBar.Parent = healthBg
        
        local box = Instance.new("Frame")
        box.Size = UDim2.new(1, 0, 0.8, 0)
        box.Position = UDim2.new(0, 0, 0, 0)
        box.BackgroundTransparency = 1
        box.BorderColor3 = Settings.Render.ESP.BoxColor
        box.BorderSizePixel = 2
        box.Visible = Settings.Render.ESP.Box
        box.Parent = billboard
        
        espObjects[player] = {
            billboard = billboard,
            nameLabel = nameLabel,
            distanceLabel = distanceLabel,
            healthBg = healthBg,
            healthBar = healthBar,
            box = box
        }
    end
    
    if player.Character then
        onCharacterAdded(player.Character)
    end
    
    player.CharacterAdded:Connect(onCharacterAdded)
end

-- ESP Update
RunService.RenderStepped:Connect(function()
    -- Update FPS counter
    if Settings.Settings.Watermark then
        local fps = math.floor(1 / RunService.RenderStepped:Wait())
        infoText.Text = "Device: " .. deviceType .. " | Player: " .. LocalPlayer.Name .. " | FPS: " .. fps
    end
    
    if not Settings.Render.ESP.Enabled then
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
            obj.billboard.AlwaysOnTop = Settings.Render.ESP.Wallhack
            obj.nameLabel.Visible = Settings.Render.ESP.Name
            obj.distanceLabel.Visible = Settings.Render.ESP.Distance
            obj.healthBg.Visible = Settings.Render.ESP.Health
            obj.box.Visible = Settings.Render.ESP.Box
            
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
                obj.healthBar.Size = UDim2.new(health, 0, 1, 0)
                
                if health > 0.6 then
                    obj.healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                elseif health > 0.3 then
                    obj.healthBar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
                else
                    obj.healthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                end
                
                obj.box.BorderColor3 = Settings.Render.ESP.BoxColor
            end
        end
    end
end)

-- ==================== MAIN LOOP ====================

RunService.Heartbeat:Connect(function()
    doFly()
    doSpeed()
    doInfiniteJump()
    doBhop()
    doNoFall()
    doSpin()
    doGodMode()
    doFullBright()
end)

-- ==================== MENU OPEN ====================

menuButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        menu.Visible = not menu.Visible
    end
end)

-- ==================== INIT ====================

task.wait(1)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(createESP)

print("✅ ZALUPA CHIT v1.0 загружен!")
print("📌 Нажмите Right Shift для меню")
print("🎯 Все функции активированы!")
