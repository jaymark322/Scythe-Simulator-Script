local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Scythe Simulator Made by Jacob", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().Rebirth = Value
		
		while getgenv().Rebirth do
			game:GetService("ReplicatedStorage"):WaitForChild("RebirthPlayer"):FireServer()
			wait(0.8)
		end
	end    
})

Tab:AddToggle({
	Name = "Enable Anti-AFK",
	Default = false,
	Callback = function(Value)
		getgenv().AntiAFK = Value

		while getgenv().AntiAFK do
			local player = game.Players.LocalPlayer
			local rootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if rootPart then
				rootPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, 0.1) -- Small movement to prevent AFK detection
			end

			wait(60)
		end
	end    
})

Tab:AddButton({
	Name = "Claim Quest for without waiting",
	Callback = function()
		local player = game.Players.LocalPlayer
		if player.PlayerData then
			local questData = player.PlayerData:FindFirstChild("QuestData")
			if questData and questData:FindFirstChild("CanClaim") then
				questData.CanClaim.Value = true
				print("Changed CanClaim to true")
			else
				warn("QuestData or CanClaim not found.")
			end
		else
			warn("PlayerData not found!")
		end
	end    
})

local TabEggs = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabEggs:AddToggle({
	Name = "Auto Hatch Egg",
	Default = false,
	Callback = function(Value)
		getgenv().egs = Value
		while getgenv().egs do
			game:GetService("ReplicatedStorage"):WaitForChild("HatchPet"):FireServer(eggs, 1, 44)
			wait(0.2)
		end
	end    
})

TabEggs:AddDropdown({
	Name = "Choose Which Egg To Auto Hatch",
	Default = "Egg1",
	Options = {"Egg1", "Egg2", "Egg3", "Egg4", "Egg5", "Egg6", "Egg7", "Egg8", "Egg9", "Egg10", "Egg11", "Egg12", "Egg13", "Egg14", "Egg15"},
	Callback = function(Value)
		eggs = Value
	end    
})

local TabTeleports = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabTeleports:AddButton({
	Name = "World 1",
	Callback = function()
		local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
		rootPart.CFrame = CFrame.new(22.797048568725586, 4.749998569488525, 0.7367979884147644)
	end    
})

TabTeleports:AddButton({
	Name = "World 2",
	Callback = function()
		local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
		rootPart.CFrame = CFrame.new(-1147.4737548828125, 4.749999046325684, 0.1376972198486328)
	end    
})

TabTeleports:AddToggle({
	Name = "Auto Tp To King World 1",
	Default = false,
	Callback = function(Value)
		getgenv().spawnone = Value
		while getgenv().spawnone do
			local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
			rootPart.CFrame = CFrame.new(2.0492165088653564, 17.099992752075195, 103.42451477050781)
			wait(2)
		end
	end    
})

TabTeleports:AddToggle({
	Name = "Auto Tp To King World 2",
	Default = false,
	Callback = function(Value)
		getgenv().spawntwo = Value
		while getgenv().spawntwo do
			local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
			rootPart.CFrame = CFrame.new(-1147.75732421875, 17.099992752075195, 104.32843017578125)
			wait(2)
		end
	end    
})
