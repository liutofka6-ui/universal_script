print("KeySystem script is running!")
-- Change VALID_KEY and COPY_LINK below
local VALID_KEY = "8!34L45"
local COPY_LINK = "https://roblox.com.ee/communities/7857135856/"

-- Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 280)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

-- Top accent bar
local AccentBar = Instance.new("Frame")
AccentBar.Size = UDim2.new(1, 0, 0, 3)
AccentBar.Position = UDim2.new(0, 0, 0, 0)
AccentBar.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
AccentBar.BorderSizePixel = 0
AccentBar.Parent = MainFrame

local AccentCorner = Instance.new("UICorner")
AccentCorner.CornerRadius = UDim.new(0, 14)
AccentCorner.Parent = AccentBar

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 44)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "🔑  Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -40, 0, 20)
Subtitle.Position = UDim2.new(0, 20, 0, 50)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Enter your key to continue"
Subtitle.TextColor3 = Color3.fromRGB(140, 130, 170)
Subtitle.TextSize = 13
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = MainFrame

-- Input Box
local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -40, 0, 44)
InputBox.Position = UDim2.new(0, 20, 0, 82)
InputBox.BackgroundColor3 = Color3.fromRGB(24, 22, 36)
InputBox.BorderSizePixel = 0
InputBox.Text = ""
InputBox.PlaceholderText = "Paste your key here..."
InputBox.PlaceholderColor3 = Color3.fromRGB(90, 80, 120)
InputBox.TextColor3 = Color3.fromRGB(220, 215, 255)
InputBox.TextSize = 14
InputBox.Font = Enum.Font.Gotham
InputBox.ClearTextOnFocus = false
InputBox.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputBox

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 20)
StatusLabel.Position = UDim2.new(0, 20, 0, 136)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 13
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

-- Check Key Button (LEFT)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.5, -26, 0, 44)
CheckBtn.Position = UDim2.new(0, 20, 0, 166)
CheckBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 230)
CheckBtn.BorderSizePixel = 0
CheckBtn.Text = "✔  Check Key"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextSize = 14
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.AutoButtonColor = false
CheckBtn.Parent = MainFrame

local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = CheckBtn

-- Copy Link Button (RIGHT)
local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.5, -26, 0, 44)
CopyBtn.Position = UDim2.new(0.5, 6, 0, 166)
CopyBtn.BackgroundColor3 = Color3.fromRGB(24, 22, 36)
CopyBtn.BorderSizePixel = 0
CopyBtn.Text = "🔗  Copy Link"
CopyBtn.TextColor3 = Color3.fromRGB(160, 140, 255)
CopyBtn.TextSize = 14
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.AutoButtonColor = false
CopyBtn.Parent = MainFrame

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 8)
CopyCorner.Parent = CopyBtn

-- Link display label (shows URL when Copy Link is clicked)
local LinkLabel = Instance.new("TextLabel")
LinkLabel.Size = UDim2.new(1, -40, 0, 18)
LinkLabel.Position = UDim2.new(0, 20, 0, 220)
LinkLabel.BackgroundTransparency = 1
LinkLabel.Text = ""
LinkLabel.TextColor3 = Color3.fromRGB(120, 100, 200)
LinkLabel.TextSize = 11
LinkLabel.Font = Enum.Font.Gotham
LinkLabel.TextXAlignment = Enum.TextXAlignment.Center
LinkLabel.TextTruncate = Enum.TextTruncate.AtEnd
LinkLabel.Parent = MainFrame

-- Footer
local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, 0, 0, 20)
Footer.Position = UDim2.new(0, 0, 0, 252)
Footer.BackgroundTransparency = 1
Footer.Text = "Powered by your script"
Footer.TextColor3 = Color3.fromRGB(70, 60, 100)
Footer.TextSize = 11
Footer.Font = Enum.Font.Gotham
Footer.Parent = MainFrame

-- // Logic

local debounce = false

-- Check Key
CheckBtn.MouseButton1Click:Connect(function()
    if debounce then return end

    local input = InputBox.Text

    if input == "" then
        StatusLabel.TextColor3 = Color3.fromRGB(230, 160, 40)
        StatusLabel.Text = "⚠  Please enter a key first."
        return
    end

    if input == VALID_KEY then
        debounce = true
        StatusLabel.TextColor3 = Color3.fromRGB(100, 220, 130)
        StatusLabel.Text = "✔  Valid key! Loading..."
        CheckBtn.BackgroundColor3 = Color3.fromRGB(30, 120, 60)
        CheckBtn.Text = "✔  Verified!"
        task.wait(1.5)
        ScreenGui:Destroy()
        -- Put your post-auth code here
    else
        StatusLabel.TextColor3 = Color3.fromRGB(220, 80, 80)
        StatusLabel.Text = "✖  Invalid key. Try again."
        CheckBtn.BackgroundColor3 = Color3.fromRGB(140, 30, 30)
        task.wait(0.8)
        CheckBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 230)
    end
end)

-- Copy Link
CopyBtn.MouseButton1Click:Connect(function()
    LinkLabel.Text = COPY_LINK
    local original = CopyBtn.Text
    local originalColor = CopyBtn.TextColor3
    CopyBtn.Text = "✔  Link Shown!"
    CopyBtn.TextColor3 = Color3.fromRGB(100, 220, 130)
    task.wait(2.5)
    CopyBtn.Text = original
    CopyBtn.TextColor3 = originalColor
    LinkLabel.Text = ""
end)
