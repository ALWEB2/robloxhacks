-- By JerryToaster556
-- If it stops working re-execute it
-- I suggest using the grenade launcher if you're on a high-end device
-- This is an exploit made for roblox's gun kit
-- Feel free to modify the names below if the names in the game are different
-- Most important of all, enjoy!

local AKName = "AR"
local ShotgunName = "Shotgun"
local SMGName = "SMG"
local GName = "Grenade Launcher"
local RPGName = "Rocket Launcher"

pcall(function()
	coroutine.resume(coroutine.create(function()
		while wait(0.3) do

			if game.Players.LocalPlayer.Backpack:FindFirstChild(AKName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Backpack:FindFirstChild(AKName)


				-- mods the gun
				AK.Configuration.AmmoCapacity.Value = 99999
				AK.Configuration.HitDamage.Value = 99999
				AK.Configuration.RecoilMin.Value = 0
				AK.Configuration.RecoilMax.Value = 0
				AK.Configuration.ShotCooldown.Value = 0
				AK.Configuration.TotalRecoilMax.Value = 0
				AK.Configuration.MaxSpread.Value = 0


			end


			if game.Players.LocalPlayer.Backpack:FindFirstChild(ShotgunName) then


				local Shotgun = game.Players.LocalPlayer.Backpack:FindFirstChild(ShotgunName)

				-- mods the gun
				Shotgun.Configuration.AmmoCapacity.Value = 99999
				Shotgun.Configuration.HitDamage.Value = 99999
				Shotgun.Configuration.RecoilMin.Value = 0
				Shotgun.Configuration.RecoilMax.Value = 0
				Shotgun.Configuration.ShotCooldown.Value = 0
				Shotgun.Configuration.TotalRecoilMax.Value = 0
				Shotgun.Configuration.MaxSpread.Value = 0
				Shotgun.Configuration.NumProjectiles.Value = 25

			end

			if game.Players.LocalPlayer.Character:FindFirstChild(AKName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Character:FindFirstChild(AKName)


				-- mods the gun
				AK.Configuration.AmmoCapacity.Value = 99999
				AK.Configuration.HitDamage.Value = 99999
				AK.Configuration.RecoilMin.Value = 0
				AK.Configuration.RecoilMax.Value = 0
				AK.Configuration.ShotCooldown.Value = 0
				AK.Configuration.TotalRecoilMax.Value = 0
				AK.Configuration.MaxSpread.Value = 0


			end


			if game.Players.LocalPlayer.Character:FindFirstChild(ShotgunName) then


				local Shotgun = game.Players.LocalPlayer.Character:FindFirstChild(ShotgunName)

				-- mods the gun
				Shotgun.Configuration.AmmoCapacity.Value = 99999
				Shotgun.Configuration.HitDamage.Value = 99999
				Shotgun.Configuration.RecoilMin.Value = 0
				Shotgun.Configuration.RecoilMax.Value = 0
				Shotgun.Configuration.ShotCooldown.Value = 0
				Shotgun.Configuration.TotalRecoilMax.Value = 0
				Shotgun.Configuration.MaxSpread.Value = 0
				Shotgun.Configuration.NumProjectiles.Value = 25

			end
			
			if game.Players.LocalPlayer.Backpack:FindFirstChild(SMGName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Backpack:FindFirstChild(SMGName)


				-- mods the gun
				AK.Configuration.AmmoCapacity.Value = 99999
				AK.Configuration.HitDamage.Value = 99999
				AK.Configuration.RecoilMin.Value = 0
				AK.Configuration.RecoilMax.Value = 0
				AK.Configuration.ShotCooldown.Value = 0
				AK.Configuration.TotalRecoilMax.Value = 0
				AK.Configuration.MaxSpread.Value = 0


			end
			
			if game.Players.LocalPlayer.Character:FindFirstChild(SMGName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Character:FindFirstChild(SMGName)


				-- mods the gun
				AK.Configuration.AmmoCapacity.Value = 99999
				AK.Configuration.HitDamage.Value = 99999
				AK.Configuration.RecoilMin.Value = 0
				AK.Configuration.RecoilMax.Value = 0
				AK.Configuration.ShotCooldown.Value = 0
				AK.Configuration.TotalRecoilMax.Value = 0
				AK.Configuration.MaxSpread.Value = 0


			end
			
			
			if game.Players.LocalPlayer.Backpack:FindFirstChild(GName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Backpack:FindFirstChild(GName)


				-- mods the gun
				AK.Configuration.NumProjectiles.Value = 25
				AK.Configuration.BulletSpeed.Value = 500
				AK.Configuration.ReloadTime.Value = 0
				AK.Configuration.ShotCooldown.Value = 0


			end
			
			if game.Players.LocalPlayer.Character:FindFirstChild(GName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Character:FindFirstChild(GName)


				-- mods the gun
				AK.Configuration.NumProjectiles.Value = 25
				AK.Configuration.BulletSpeed.Value = 500
				AK.Configuration.ReloadTime.Value = 0
				AK.Configuration.ShotCooldown.Value = 0


			end
			
			
			
			if game.Players.LocalPlayer.Backpack:FindFirstChild(RPGName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Backpack:FindFirstChild(RPGName)


				-- mods the gun

				AK.Configuration.BulletSpeed.Value = 1000
				AK.Configuration.BlastRadius.Value = 100
				AK.Configuration.ShotCooldown.Value = 0


			end
			
			if game.Players.LocalPlayer.Character:FindFirstChild(RPGName) then
				-- weapons in backpack
				local AK = game.Players.LocalPlayer.Character:FindFirstChild(RPGName)


				-- mods the gun

				AK.Configuration.BulletSpeed.Value = 1000
				AK.Configuration.BlastRadius.Value = 100
				AK.Configuration.ShotCooldown.Value = 0


			end
			
			

		end
	end))
end)
