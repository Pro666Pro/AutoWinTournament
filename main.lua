local GameName = "Auto Win Tournament - by nexer"

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "Auto Win Tournament", IntroIcon = "rbxassetid://15315284749",Name = GameName, HidePremium = false, SaveConfig = true, ConfigFolder = "Tutorial"})

OrionLib:MakeNotification({Name = "Warning",Content = "Use at your own risk.",Image = "rbxassetid://7733658504",Time = 5})

if workspace:FindFirstChild("Baseplate") == nil then
local S = Instance.new("Part")
S.Name = "Baseplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(20000, 60000, 30000)
S.Size = Vector3.new(1000, 10, 1000)
S.Parent = workspace
end

local Script = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Script:AddToggle({
	Name = "Auto Enter Tournament",
  	Default = false,
	Callback = function(Value)
_G.AutoFarm = Value
while _G.AutoFarm == true do
local args = {
    [1] = true
}
game:GetService("ReplicatedStorage").Events.Tournament.TournamentResponse:FireServer(unpack(args))
wait(0.01)
end
	 end
})

Script:AddToggle({
	Name = "Auto Teleport Safe Spot",
  	Default = false,
	Callback = function(Value)
_G.AutoTeleport = Value
while _G.AutoTeleport == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Baseplate"].CFrame * CFrame.new(0,10,0)
wait(0.01)
end
	 end
})

