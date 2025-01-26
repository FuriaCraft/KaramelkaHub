loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = Orion:MakeWindow({Name = "Karamelka Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "KaramelkaHub"})

local Section = Window:MakeSection({Name = "Speed"})

local WalkSpeedSlider = Section:MakeSlider({Name = "Walkspeed", Min = 10, Max = 100, Default = 50, Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end})

local JumpPowerSlider = Section:MakeSlider({Name = "Jump Power", Min = 10, Max = 100, Default = 50, Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end})

local TrollSection = Window:MakeSection({Name = "Troll"})

local CMD_FEButton = TrollSection:MakeButton({Name = "CMD FE", Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IssacRawCoreOfficiak/CMD-FE/main/cmdfe.lua"))()
end})

local InfiniteYieldButton = TrollSection:MakeButton({Name = "Infinite Yield", Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end})

local antiKickEnabled = false

local function antiKick()
local Character = LocalPlayer.Character
if Character then
local Humanoid = Character:FindFirstChild("Humanoid")
if Humanoid then
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
wait(0.1)
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
end
end
end

local function toggleAntiKick()
if antiKickEnabled then
antiKickEnabled = false
print("Anti-Kick desativado")
else
antiKickEnabled = true
print("Anti-Kick ativado")
end
end

local AntiKickButton = TrollSection:MakeButton({Name = "Anti-Kick", Callback = function()
toggleAntiKick()
end})

local InfiniteJumpButton = Section:MakeButton({Name = "Infinite Jump", Callback = function()
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")

UserInputService.InputBegan:Connect(function(Input)
if Input.KeyCode == Enum.KeyCode.Space then
while UserInputService:IsKeyDown(Enum.KeyCode.Space) do
Humanoid.Jump = true
wait()
end
end
end)
end})

local ESPSection = Window:MakeSection({Name = "ESP"})

local ESPEnabled = false

local function toggleESP()
if ESPEnabled then
ESPEnabled = false
print("ESP desativado")
else
ESPEnabled = true
print("ESP ativado")
end
end

local ESPButton = ESPSection:MakeButton({Name = "ESP", Callback = function()
toggleESP()
end})

local function drawESP()
for _, player in pairs(game.Players:GetPlayers()) do
if player ~= game.Players.LocalPlayer then
local character = player.Character
if character then
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
if humanoidRootPart then
local box = Instance.new("BoxHandleAdornment")
box.Color = Color3.new(1, 0, 0) -- Vermelho
box.OutlineColor = Color3.new(0, 0, 0) -- Preto
box.OutlineTransparency = 0
box.Size = Vector3.new(2, 2, 2)
box.Adornee = humanoidRootPart
box.Parent = game.Workspace
end
end
end
end
end
end

local TrollUptempoMusicButton = TrollSection:MakeButton({Name = "Troll Uptempo Music", Callback = function()
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://18841895741"
Sound.Parent = game.Workspace
Sound:Play()
end})

local SpectateSection = Window:MakeSection({Name = "Spectate"})

local PlayersDropdown = SpectateSection:MakeDropdown({Name = "Players", Options = {}})

local function updatePlayersDropdown()
local players = game.Players:GetPlayers()
local options = {}
for _, player in pairs(players) do
if player ~= game.Players.LocalPlayer then
table.insert(options, player.Name)
end
end
PlayersDropdown:UpdateOptions(options)
end

updatePlayersDropdown()
game.Players.PlayerAdded:Connect(updatePlayersDropdown)
game.Players.PlayerRemoving:Connect(updatePlayersDropdown)
[]
local SpectateButton = SpectateSection:MakeButton({Name = "Spectate", Callback = function()
local selectedPlayer = PlayersDropdown:GetSelected()
if selectedPlayer then
local player = game.Players:GetPlayerByName(selectedPlayer)
if player then
local character = player.Character
if character then
game.Workspace.CurrentCamera.CameraSubject = character.Humanoid
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame
end
end
end
end})

local CreateObjectsButton = TrollSection:MakeButton({Name = "Create 98888 Objects por Segundo", Callback = function()
while true do
for i = 1, 98888 do
local part = Instance.new("Part")
part.Size = Vector3.new(1, 1, 1)
part.Position = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100))
part.Anchored = true
part.Parent = game.Workspace
end
wait(1)
end
end})

while wait(0.1) do
if ESPEnabled then
drawESP()
end
end
