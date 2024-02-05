function GetPlayerClothes()
	local CLOTHES = {
		{
			{0, "SP_80Rocker_H"},
			{0, "SP_Alien_H"},
			{0, "C_AngelHalo"},
			{0, "P_Army2"},
			{0, "P_Army1"},
			{0, "P_Army3"},
			{0, "SP_BMXhelmet"},
			{0, "B_BHat2"},
			{0, "B_BHat1"},
			{0, "B_BHat4"},
			{0, "B_BHat3"},
			{0, "B_BHat6"},
			{0, "B_BHat5"},
			{0, "P_Bandana3"},
			{0, "P_Bandana1"},
			{0, "P_Bandana2"},
			{0, "SP_Zorromask"},
			{0, "SP_Basshat"},
			{0, "B_Bucket1"},
			{0, "SP_BikeHelmet"},
			{0, "SP_Ninja_H"},
			{0, "S_BHat1"},
			{0, "S_BHat3"},
			{0, "S_BHat2"},
			{0, "S_Sunvisor1"},
			{0, "S_Sunvisor3"},
			{0, "S_Sunvisor2"},
			{0, "SP_Goldsuit_H"},
			{0, "P_BHat6"},
			{0, "P_BHat1"},
			{0, "P_BHat2"},
			{0, "P_BHat3"},
			{0, "P_BHat4"},
			{0, "P_BHat5"},
			{0, "C_CanadaHat"},
			{0, "C_ClownWig"},
			{0, "SP_Cowboyhat"},
			{0, "B_Various5"},
			{0, "SP_GK_Helmet"},
			{0, "C_DevilHorns"},
			{0, "SP_Duncehat"},
			{0, "SP_EdnaMask"},
			{0, "SP_EiffelHat"},
			{0, "SP_Elf_H"},
			{0, "SP_Colum_H"},
			{0, "SP_Firehat"},
			{0, "SP_Fries_H"},
			{0, "SP_Einstein"},
			{0, "SP_Gnome_H"},
			{0, "SP_MortarBhat"},
			{0, "SP_NinjaW_H"},
			{0, "SP_Hazmat"},
			{0, "SP_GymDisguise"},
			{0, "B_Various1"},
			{0, "R_Hat3"},
			{0, "R_Hat2"},
			{0, "R_Hat1"},
			{0, "SP_MBand_H"},
			{0, "SP_Mascot_H"},
			{0, "SP_Nerd_H"},
			{0, "B_Hunter1"},
			{0, "SP_Nutcrack_H"},
			{0, "B_Hunter2"},
			{0, "R_Hat4"},
			{0, "SP_Panda_H"},
			{0, "SP_PigMask"},
			{0, "SP_PirateHat"},
			{0, "SP_PithHelmet"},
			{0, "R_Hat5"},
			{0, "SP_Pumpkin_head"},
			{0, "SP_Nascar_H"},
			{0, "SP_NinjaR_H"},
			{0, "SP_Antlers"},
			{0, "B_Various2"},
			{0, "SP_Ween_H"},
			{0, "C_StrangeHat"},
			{0, "R_Hat6"},
			{0, "B_Various3"},
			{0, "B_Various4"},
			{0, "SP_Pophat"},
			{0, "B_Hunter3"},
			{0, "B_Bucket2"},
			{0, "SP_VHelmet"},
			{0, "SP_Werewolf"},
			{0, "SP_Wrestling_H"},
		}
	}
	local c = {}
  for i = 1, CLOTHES do
    for _, v in ipairs(CLOTHES[i]) do
      local index, id = ClothingGetPlayer(i - 1)
      if index == ObjectNameToHashID(v[2]) then
        c[i] = v[2]
        break
      end
    end
    c[i] = c[i] or ''
  end
  return c
end

function main()
  while not SystemIsReady() do
    Wait(0)
  end
  local motor = {[275] = true, [276] = true}
  local vehicle

  while true do
    Wait(1000)
    if PlayerIsInAnyVehicle() and motor[VehicleGetModelId(VehicleFromDriver(gPlayer))] then
      vehicle = VehicleFromDriver(gPlayer)
      while PlayerIsInVehicle(vehicle) do
        Wait(0)
        if not alreadywearinghelmet then
          local index, id = ClothingGetPlayer(0)
          if index ~= ObjectNameToHashID("SP_BikeHelmet") then
            ClothingSetPlayer(0, "SP_BikeHelmet")
            ClothingBuildPlayer()
            alreadywearinghelmet = true
          end
        end
      end
      while not PedMePlaying(gPlayer, "Default_KEY") do
        Wait(0)
      end
      ClothingSetPlayer(0, "Hair")
      ClothingBuildPlayer()
      alreadywearinghelmet = false
    end
  end
end
