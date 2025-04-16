local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()

-- Ana Menü
local Main = Library:CreateWindow({
    Name = "Xather Controller",
    Themeable = {
        Info = "CB Mod Controller",
        Credit = false
    },
    Background = "",
    Theme = [[{"__Designer.Colors.topGradient":"#FFFFFF",
               "__Designer.Colors.section":"#FFFFFF",
               "__Designer.Colors.main":"#FFFFFF",
               "__Designer.Colors.hoveredOptionTop":"#FFFFFF",
               "__Designer.Colors.unhoveredOptionTop":"#FFFFFF",
               "__Designer.Colors.background":"#1E1237",
               "__Designer.Colors.tabText":"#B9B9B9"}]]
})

-- Aimbot Sekmesi
local AimbotTab = Main:AddTab({ Name = "Aimbot", Icon = "rbxassetid://6238537240" })
local AimSection = AimbotTab:AddSection({ Name = "Aimbot Ayarları" })

AimSection:AddToggle({
    Name = "Aimbot Aç/Kapat",
    Default = getgenv().Aimbot and getgenv().Aimbot.Settings.Enabled or false,
    Callback = function(v)
        getgenv().Aimbot.Settings.Enabled = v
    end
})

AimSection:AddSlider({
    Name = "FOV",
    Min = 20,
    Max = 300,
    Default = getgenv().Aimbot and getgenv().Aimbot.FOVSettings.Amount or 90,
    Callback = function(val)
        getgenv().Aimbot.FOVSettings.Amount = val
    end
})

AimSection:AddDropdown({
    Name = "LockPart",
    Options = {"Head", "Torso", "LeftArm", "RightArm"},
    Default = getgenv().Aimbot and getgenv().Aimbot.Settings.LockPart or "Head",
    Callback = function(v)
        getgenv().Aimbot.Settings.LockPart = v
    end
})

AimSection:AddDropdown({
    Name = "Tetik Tuşu",
    Options = {"MouseButton1", "MouseButton2", "LeftAlt", "F"},
    Default = getgenv().Aimbot and getgenv().Aimbot.Settings.TriggerKey or "MouseButton2",
    Callback = function(k)
        getgenv().Aimbot.Settings.TriggerKey = k
    end
})

AimSection:AddSlider({
    Name = "Hassasiyet",
    Min = 0,
    Max = 1,
    Default = getgenv().Aimbot and getgenv().Aimbot.Settings.Sensitivity or 0,
    Callback = function(val)
        getgenv().Aimbot.Settings.Sensitivity = val
    end
})

-- Visual Sekmesi
local VisualTab = Main:AddTab({ Name = "Visual", Icon = "rbxassetid://6031265976" })
local VisualSection = VisualTab:AddSection({ Name = "ESP Ayarları" })

VisualSection:AddToggle({
    Name = "ESP Aç/Kapat",
    Default = getgenv().ESP and getgenv().ESP.Settings.Enabled or false,
    Callback = function(state)
        getgenv().ESP.Settings.Enabled = state
    end
})

VisualSection:AddColorPicker({
    Name = "ESP Renk",
    Default = getgenv().ESP and getgenv().ESP.Settings.Color or "255, 0, 0",
    Callback = function(clr)
        getgenv().ESP.Settings.Color = clr
    end
})

VisualSection:AddSlider({
    Name = "Şeffaflık",
    Min = 0,
    Max = 1,
    Default = getgenv().ESP and getgenv().ESP.Settings.Transparency or 0.5,
    Callback = function(val)
        getgenv().ESP.Settings.Transparency = val
    end
})

VisualSection:AddSlider({
    Name = "Kalınlık",
    Min = 1,
    Max = 5,
    Default = getgenv().ESP and getgenv().ESP.Settings.Thickness or 2,
    Callback = function(val)
        getgenv().ESP.Settings.Thickness = val
    end
})

-- Menü gizle/aç (Insert tuşu)
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        Main.Visible = not Main.Visible
    end
end)

Main.Visible = false
