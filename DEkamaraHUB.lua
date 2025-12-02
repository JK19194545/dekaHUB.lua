local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🔥でかマラ💦　HUB", "DarkTheme")

-- Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

-- join
local rejoin = Window:NewTab("rejoin")
local rejoinSection = rejoin:NewSection("rejoin")


MainSection:NewButton("金玉ヘリコプター", "Makes you do gymnastics", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)


MainSection:NewButton("相手をでかまらにする", "Makes you do gymnastics", function()
_G.HeadSize = 50
_G.Disabled = true
 
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

MainSection:NewButton("でかまらで移動", "Makes you do gymnastics", function()
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local teleportTarget = nil

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.5, -125, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Text = "Player Teleport GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = Frame

-- Scrolling list
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -10, 1, -70)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 35)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScrollingFrame.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- TP Button
local TPButton = Instance.new("TextButton")
TPButton.Size = UDim2.new(1, -10, 0, 30)
TPButton.Position = UDim2.new(0, 5, 1, -35)
TPButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
TPButton.Text = "Teleport"
TPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TPButton.Font = Enum.Font.GothamBold
TPButton.TextSize = 14
TPButton.Parent = Frame

-- Update player list function
local function updatePlayerList()
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local PlayerButton = Instance.new("TextButton")
            PlayerButton.Size = UDim2.new(1, 0, 0, 25)
            PlayerButton.Text = player.Name
            PlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            PlayerButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            PlayerButton.Font = Enum.Font.Gotham
            PlayerButton.TextSize = 12
            PlayerButton.Parent = ScrollingFrame
            
            PlayerButton.MouseButton1Click:Connect(function()
                teleportTarget = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                TPButton.Text = "Teleport to: " .. player.Name
            end)
        end
    end
end

-- Teleport function
TPButton.MouseButton1Click:Connect(function()
    if teleportTarget then
        LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = teleportTarget.CFrame + Vector3.new(0, 3, 0)
    end
end)

-- Update list on player join/leave
Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)
updatePlayerList()

-- Dragging the GUI
local dragging, dragInput, dragStart, startPos
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

Title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

end)

MainSection:NewButton("でかチンレーダー", "Makes you do gymnastics", function()
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- 描画用関数
local function createLine() 
    local line = Drawing.new("Line")
    line.Color = Color3.fromRGB(255, 0, 0)
    line.Thickness = 2
    line.Transparency = 1
    return line
end

local function createText()
    local text = Drawing.new("Text")
    text.Color = Color3.fromRGB(255, 255, 255)
    text.Size = 16
    text.Center = true
    text.Outline = true
    return text
end

local visuals = {}

local function tryGetBounty(player)
    if player:FindFirstChild("leaderstats") then
        local b = player.leaderstats:FindFirstChild("Bounty")
        if b then
            return b.Value
        end
    end
    return nil
end

-- 初期セットアップ
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        visuals[player.Name] = {
            line = createLine(),
            nameText = createText(),
            bountyText = createText()
        }
    end
end

-- プレイヤーの追加 / 削除
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        visuals[player.Name] = {
            line = createLine(),
            nameText = createText(),
            bountyText = createText()
        }
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if visuals[player.Name] then
        visuals[player.Name].line:Remove()
        visuals[player.Name].nameText:Remove()
        visuals[player.Name].bountyText:Remove()
        visuals[player.Name] = nil
    end
end)

-- 毎フレーム更新
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            local vis = visuals[player.Name]

            if onScreen then
                vis.line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                vis.line.To = Vector2.new(screenPos.X, screenPos.Y)
                vis.line.Visible = true

                vis.nameText.Text = player.Name
                vis.nameText.Position = Vector2.new(screenPos.X, screenPos.Y - 20)
                vis.nameText.Visible = true

                local bounty = tryGetBounty(player)
                if bounty then
                    vis.bountyText.Text = "Bounty: "..tostring(bounty)
                    vis.bountyText.Position = Vector2.new(screenPos.X, screenPos.Y + 5)
                    vis.bountyText.Visible = true
                else
                    vis.bountyText.Visible = false
                end
            else
                vis.line.Visible = false
                vis.nameText.Visible = false
                vis.bountyText.Visible = false
            end
        end
    end
end)

end)

MainSection:NewButton("ブラックホールまんこ吸引", "Makes you do gymnastics", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tintinkaikai/GhostShip/refs/heads/main/ghost%20ship%20for%20mobile"))()
end)

rejoinSection:NewButton("ちんぽをまんこにかえる", "Makes you do gymnastics", function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local ts = game:GetService("TeleportService")



local p = game:GetService("Players").LocalPlayer







ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
end)

MainSection:NewButton("あなる開発研究所", "Makes you do gymnastics", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/7EAbhifj"))("t.me/ByteScripts")   
end)