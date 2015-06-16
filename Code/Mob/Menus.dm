/mob/proc/Stations()//This is the proc that creates the OSI
	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)
	usr.StationMenu()//Creates the OSI Background

/mob/proc/StationMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		var/obj/H = new/obj/HUD/Middle2(usr.client)
		var/obj/Smelt = new/obj/HUD/ClickSmelt(usr.client)
		var/obj/Forge = new/obj/HUD/ClickForge(usr.client)
		var/obj/Carp = new/obj/HUD/ClickCarp(usr.client)
		var/obj/Potion = new/obj/HUD/ClickPotion(usr.client)
		var/obj/Pos = new/obj/HUD/ClickPos(usr.client)
		var/obj/Mas = new/obj/HUD/ClickMas(usr.client)
		var/obj/Kit = new/obj/HUD/ClickKit(usr.client)
		var/obj/Let = new/obj/HUD/ClickLet(usr.client)
		var/obj/Gem = new/obj/HUD/ClickGem(usr.client)
		var/obj/Bone = new/obj/HUD/ClickBone(usr.client)
		var/obj/Melt = new/obj/HUD/ClickMelt(usr.client)
		H.screen_loc = "3,17 to 17,4"
		usr.Text(usr,3,17,4,13,"--Work Stations Menu--")
		switch(M.Race)
			if("Lizardman","Elf","Frogman")
				Pos.screen_loc = "4,16"
				usr.Text(usr,6,16,4,10,"PoisonCraft - Wood")
				Bone.screen_loc = "4,14"
				usr.Text(usr,6,14,4,10,"BoneCraft - Wood")
				Let.screen_loc = "4,12"
				usr.Text(usr,6,12,4,10,"Leather - Wood")
				Carp.screen_loc = "4,10"
				usr.Text(usr,6,10,4,10,"Carpentry - Wood")
				Melt.screen_loc = "4,8"
				usr.Text(usr,6,8,4,10,"Melter - Stone")
			if("Goblin","Svartalfar")
				Smelt.screen_loc = "4,16"
				usr.Text(usr,6,16,4,10,"Smelter - Stone")
				Forge.screen_loc = "4,14"
				usr.Text(usr,6,14,4,10,"Forge - Stone")
				Carp.screen_loc = "4,12"
				usr.Text(usr,6,12,4,10,"Carpentry - Wood")
				Potion.screen_loc = "4,10"
				usr.Text(usr,6,10,4,10,"PotionStation - Wood")
				Mas.screen_loc = "4,8"
				usr.Text(usr,6,8,4,10,"Masonary - Stone")
				Let.screen_loc = "4,6"
				usr.Text(usr,6,6,4,10,"Leather - Wood")
				Gem.screen_loc = "11,16"
				usr.Text(usr,13,16,4,10,"GemCraft - Stone")
				Pos.screen_loc = "11,14"
				usr.Text(usr,13,14,4,10,"AlchemyStation - Wood")
				Bone.screen_loc = "11,12"
				usr.Text(usr,13,12,4,10,"BoneCraft - Wood")
				Melt.screen_loc = "11,10"
				usr.Text(usr,13,10,4,10,"Melter - Stone")
			if("Vampire","Gargoyle","Demon")
				Smelt.screen_loc = "4,16"
				usr.Text(usr,6,16,4,10,"Smelter - Stone")
				Forge.screen_loc = "4,14"
				usr.Text(usr,6,14,4,10,"Forge - Stone")
				Carp.screen_loc = "4,12"
				usr.Text(usr,6,12,4,10,"Carpentry - Wood")
				Mas.screen_loc = "4,10"
				usr.Text(usr,6,10,4,10,"Masonary - Stone")
				Let.screen_loc = "4,8"
				usr.Text(usr,6,8,4,10,"Leather - Wood")
				Gem.screen_loc = "4,6"
				usr.Text(usr,6,6,4,10,"GemCraft - Stone")
				Pos.screen_loc = "11,16"
				usr.Text(usr,13,16,4,10,"PoisonCraft - Wood")
				Bone.screen_loc = "11,14"
				usr.Text(usr,13,14,4,10,"BoneCraft - Wood")
				Melt.screen_loc = "11,12"
				usr.Text(usr,13,12,4,10,"Melter - Stone")
			if("Dwarf")
				Smelt.screen_loc = "4,16"
				usr.Text(usr,6,16,4,10,"Smelter - Stone")
				Forge.screen_loc = "4,14"
				usr.Text(usr,6,14,4,10,"Forge - Stone")
				Carp.screen_loc = "4,12"
				usr.Text(usr,6,12,4,10,"Carpentry - Wood")
				Mas.screen_loc = "4,10"
				usr.Text(usr,6,10,4,10,"Masonary - Stone")
				Kit.screen_loc = "4,8"
				usr.Text(usr,6,8,8,10,"Kitchen - Wood")
				Let.screen_loc = "4,6"
				usr.Text(usr,6,6,4,10,"Leather - Wood")
				Gem.screen_loc = "4,4"
				usr.Text(usr,6,4,4,10,"GemCraft - Stone")
				Melt.screen_loc = "11,16"
				usr.Text(usr,13,16,4,10,"Melter - Stone")
			if("Human")
				Smelt.screen_loc = "4,16"
				usr.Text(usr,6,16,4,10,"Smelter - Stone")
				Forge.screen_loc = "4,14"
				usr.Text(usr,6,14,4,10,"Forge - Stone")
				Carp.screen_loc = "4,12"
				usr.Text(usr,6,12,4,10,"Carpentry - Wood")
				Potion.screen_loc = "4,10"
				usr.Text(usr,6,10,4,10,"AlchemyStation - Wood")
				Mas.screen_loc = "4,8"
				usr.Text(usr,6,8,4,10,"Masonary - Stone")
				Kit.screen_loc = "4,6"
				usr.Text(usr,6,6,4,10,"Kitchen - Wood")
				Let.screen_loc = "11,16"
				usr.Text(usr,13,16,4,10,"Leather - Wood")
				Gem.screen_loc = "11,14"
				usr.Text(usr,13,14,4,10,"GemCraft - Stone")
				Melt.screen_loc = "11,12"
				usr.Text(usr,13,12,4,10,"Melter - Stone")
			if("Kobold","Ratman","Orc")
				Smelt.screen_loc = "4,16"
				usr.Text(usr,6,16,4,10,"Smelter - Stone")
				Forge.screen_loc = "4,14"
				usr.Text(usr,6,14,4,10,"Forge - Stone")
				Carp.screen_loc = "4,12"
				usr.Text(usr,6,12,4,10,"Carpentry - Wood")
				Mas.screen_loc = "4,10"
				usr.Text(usr,6,10,4,10,"Masonary - Stone")
				Let.screen_loc = "4,8"
				usr.Text(usr,6,8,4,10,"Leather - Wood")
				Bone.screen_loc = "4,6"
				usr.Text(usr,6,6,4,10,"BoneCraft - Wood")
				Pos.screen_loc = "4,4"
				usr.Text(usr,6,4,4,10,"PoisonCraft - Wood")
				Melt.screen_loc = "11,16"
				usr.Text(usr,13,16,4,10,"Melter - Stone")
			else
				Mas.screen_loc = "4,6"
				usr.Text(usr,6,6,4,10,"Masonary - Stone")
				Melt.screen_loc = "11,10"
				usr.Text(usr,13,10,4,10,"Melter - Stone")

/mob/proc/FarmLand()//This is the proc that creates the OSI

	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)

	usr.FarmMenu()//Creates the OSI Background

/mob/proc/FarmMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		var/obj/H = new/obj/HUD/Middle2(usr.client)
		var/obj/O = new/obj/HUD/TopLeft(usr.client)
		var/obj/A = new/obj/HUD/TopRight(usr.client)
		var/obj/B = new/obj/HUD/BottomLeft(usr.client)
		var/obj/C = new/obj/HUD/BottomRight(usr.client)
		var/obj/D = new/obj/HUD/TopMiddle(usr.client)
		var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
		var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
		var/obj/G = new/obj/HUD/RightMiddle(usr.client)
		var/obj/Farm = new/obj/HUD/ClickFarm(usr.client)
		H.screen_loc = "4,14 to 14,4"
		O.screen_loc = "4,14"
		A.screen_loc = "14,14"
		B.screen_loc = "4,4"
		C.screen_loc = "14,4"
		D.screen_loc = "4,14 to 14,14"
		E.screen_loc = "4,4 to 14,4"
		F.screen_loc = "4,4 to 4,14"
		G.screen_loc = "14,4 to 14,14"
		usr.Text(usr,4,14,4,10,"--Farm Menu--")
		if(M.Race == "Human")
			Farm.screen_loc = "5,13"
			usr.Text(usr,7,13,4,10,"FarmLand - Humans")

/mob/proc/Traps()//This is the proc that creates the OSI
	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)

	usr.TrapMenu()//Creates the OSI Background

/mob/proc/TrapMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		var/obj/H = new/obj/HUD/Middle2(usr.client)
		var/obj/O = new/obj/HUD/TopLeft(usr.client)
		var/obj/A = new/obj/HUD/TopRight(usr.client)
		var/obj/B = new/obj/HUD/BottomLeft(usr.client)
		var/obj/C = new/obj/HUD/BottomRight(usr.client)
		var/obj/D = new/obj/HUD/TopMiddle(usr.client)
		var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
		var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
		var/obj/G = new/obj/HUD/RightMiddle(usr.client)
		var/obj/Trap = new/obj/HUD/ClickTraps(usr.client)
		var/obj/StoneTrap = new/obj/HUD/ClickStoneFall(usr.client)
		var/obj/RibTrap = new/obj/HUD/ClickRibTrap(usr.client)
		var/obj/BST = new/obj/HUD/ClickBSTTrap(usr.client)
		H.screen_loc = "4,14 to 14,4"
		O.screen_loc = "4,14"
		A.screen_loc = "14,14"
		B.screen_loc = "4,4"
		C.screen_loc = "14,4"
		D.screen_loc = "4,14 to 14,14"
		E.screen_loc = "4,4 to 14,4"
		F.screen_loc = "4,4 to 4,14"
		G.screen_loc = "14,4 to 14,14"
		usr.Text(usr,4,14,4,10,"--Trap Menu--")
		Trap.screen_loc = "5,13"
		usr.Text(usr,7,13,4,10,"Pit Trap")
		StoneTrap.screen_loc = "5,11"
		usr.Text(usr,7,11,4,10,"StoneFall Trap")
		if(M.Race == "Kobold")
			RibTrap.screen_loc = "5,9"
			usr.Text(usr,7,9,4,10,"RibCage Trap")
			BST.screen_loc = "5,7"
			usr.Text(usr,7,7,4,10,"BoneSpike Trap")
		if(M.Race == "Ratman")
			RibTrap.screen_loc = "5,9"
			usr.Text(usr,7,9,4,10,"RibCage Trap")
			BST.screen_loc = "5,7"
			usr.Text(usr,7,7,4,10,"BoneSpike Trap")
		if(M.Race == "Goblin")
			RibTrap.screen_loc = "5,9"
			usr.Text(usr,7,9,4,10,"RibCage Trap")
			BST.screen_loc = "5,7"
			usr.Text(usr,7,7,4,10,"BoneSpike Trap")


/mob/proc/Floors()//This is the proc that creates the OSI
	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)

	usr.FloorMenu()//Creates the OSI Background

/mob/proc/FloorMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		var/obj/H = new/obj/HUD/Middle2(usr.client)
		var/obj/O = new/obj/HUD/TopLeft(usr.client)
		var/obj/A = new/obj/HUD/TopRight(usr.client)
		var/obj/B = new/obj/HUD/BottomLeft(usr.client)
		var/obj/C = new/obj/HUD/BottomRight(usr.client)
		var/obj/D = new/obj/HUD/TopMiddle(usr.client)
		var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
		var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
		var/obj/G = new/obj/HUD/RightMiddle(usr.client)
		var/obj/WoodFloor = new/obj/HUD/ClickWoodFloor(usr.client)
		var/obj/TribalFloor = new/obj/HUD/ClickTribalFloor(usr.client)
		var/obj/StoneFloor = new/obj/HUD/ClickStoneFloor(usr.client)
		var/obj/BoneFloor = new/obj/HUD/ClickBoneFloor(usr.client)
		var/obj/DigChannel = new/obj/HUD/ClickDigChannel(usr.client)
		var/obj/Dest = new/obj/HUD/ClickDestroy(usr.client)
		H.screen_loc = "4,14 to 14,4"
		O.screen_loc = "4,14"
		A.screen_loc = "14,14"
		B.screen_loc = "4,4"
		C.screen_loc = "14,4"
		D.screen_loc = "4,14 to 14,14"
		E.screen_loc = "4,4 to 14,4"
		F.screen_loc = "4,4 to 4,14"
		G.screen_loc = "14,4 to 14,14"
		usr.Text(usr,4,14,4,10,"--Floor Menu--")
		switch(M.Race)
			if("Lizardman","Frogman")
				TribalFloor.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"TribalFloor")
				Dest.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"DestroyFloor")
				BoneFloor.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"BoneFloor")
			if("Elf")
				WoodFloor.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodFloor")
				Dest.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"DestroyFloor")
			if("Orc")
				WoodFloor.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodenFloor")
				Dest.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"DestroyFloor")
			if("Dwarf","Human")
				WoodFloor.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodFloor")
				StoneFloor.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StoneFloor")
				Dest.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"DestroyFloor")
				DigChannel.screen_loc = "5,7"
				usr.Text(usr,7,7,4,10,"DigChannel")
			if("Gargoyle")
				StoneFloor.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StoneFloor")
				Dest.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"DestroyFloor")
			if("Kobold","Ratman")
				BoneFloor.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"BoneFloor")
				Dest.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"DestroyFloor")
			if("Goblin","Svartalfar","Vampire")
				WoodFloor.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodFloor")
				StoneFloor.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StoneFloor")
				BoneFloor.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"BoneFloor")
				Dest.screen_loc = "5,7"
				usr.Text(usr,7,7,4,10,"DestroyFloor")
		if(M.SubRace == "Illithid")
			StoneFloor.screen_loc = "5,11"
			usr.Text(usr,7,11,4,10,"StoneFloor")
			Dest.screen_loc = "5,9"
			usr.Text(usr,7,9,4,10,"DestroyFloor")
		if(M.SandWorker == 1)
			BoneFloor.screen_loc = "5,13"
			usr.Text(usr,7,13,4,10,"BoneFloor")
			StoneFloor.screen_loc = "5,11"
			usr.Text(usr,7,11,4,10,"StoneFloor")
			Dest.screen_loc = "5,9"
			usr.Text(usr,7,9,4,10,"DestroyFloor")

/mob/proc/Bridge()//This is the proc that creates the OSI
	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)

	usr.BridgeMenu()//Creates the OSI Background







/mob/proc/BridgeMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		var/obj/H = new/obj/HUD/Middle2(usr.client)
		var/obj/O = new/obj/HUD/TopLeft(usr.client)
		var/obj/A = new/obj/HUD/TopRight(usr.client)
		var/obj/B = new/obj/HUD/BottomLeft(usr.client)
		var/obj/C = new/obj/HUD/BottomRight(usr.client)
		var/obj/D = new/obj/HUD/TopMiddle(usr.client)
		var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
		var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
		var/obj/G = new/obj/HUD/RightMiddle(usr.client)
		var/obj/TribalBridge = new/obj/HUD/ClickTribalBridge(usr.client)
		var/obj/StoneBridge = new/obj/HUD/ClickStoneBridge(usr.client)
		var/obj/WoodBridge = new/obj/HUD/ClickWoodBridge(usr.client)
		var/obj/BoneBridge = new/obj/HUD/ClickBoneBridge(usr.client)
		H.screen_loc = "4,14 to 14,4"
		O.screen_loc = "4,14"
		A.screen_loc = "14,14"
		B.screen_loc = "4,4"
		C.screen_loc = "14,4"
		D.screen_loc = "4,14 to 14,14"
		E.screen_loc = "4,4 to 14,4"
		F.screen_loc = "4,4 to 4,14"
		G.screen_loc = "14,4 to 14,14"
		usr.Text(usr,4,14,4,10,"--Bridge Menu--")
		switch(M.Race)
			if("Lizardman","Frogman")
				TribalBridge.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"TribalBridge")
			if("Goblin","Svartalfar","Vampire","Gargoyle")
				StoneBridge.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"StoneBridge")
				WoodBridge.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"WoodBridge")
				BoneBridge.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"BoneBridge")
			if("Dwarf","Human")
				StoneBridge.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"StoneBridge")
				WoodBridge.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"WoodBridge")
			if("Kobold","Ratman")
				BoneBridge.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"BoneBridge")
			if("Orc")
				WoodBridge.screen_loc = "5,13"
				usr.Text(usr,7,11,4,10,"WoodBridge")
			if("Elf")
				WoodBridge.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodBridge")

/mob/proc/Walls()//This is the proc that creates the OSI
	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)
	usr.WallMenu()//Creates the OSI Background

/mob/proc/WallMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		var/obj/H = new/obj/HUD/Middle2(usr.client)
		var/obj/O = new/obj/HUD/TopLeft(usr.client)
		var/obj/A = new/obj/HUD/TopRight(usr.client)
		var/obj/B = new/obj/HUD/BottomLeft(usr.client)
		var/obj/C = new/obj/HUD/BottomRight(usr.client)
		var/obj/D = new/obj/HUD/TopMiddle(usr.client)
		var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
		var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
		var/obj/G = new/obj/HUD/RightMiddle(usr.client)
		var/obj/WoodWall = new/obj/HUD/ClickWoodWall(usr.client)
		var/obj/ElfWall = new/obj/HUD/ClickElfWall(usr.client)
		var/obj/TribalWall = new/obj/HUD/ClickTribalWall(usr.client)
		var/obj/StoneWall = new/obj/HUD/ClickStoneWall(usr.client)
		var/obj/BoneWall = new/obj/HUD/ClickBoneWall(usr.client)
		var/obj/SecretWall = new/obj/HUD/ClickSecretWall(usr.client)
		var/obj/Detail = new/obj/HUD/ClickDetail(usr.client)
		var/obj/ArrowSlit = new/obj/HUD/ClickArrowSlit(usr.client)
		H.screen_loc = "4,14 to 14,4"
		O.screen_loc = "4,14"
		A.screen_loc = "14,14"
		B.screen_loc = "4,4"
		C.screen_loc = "14,4"
		D.screen_loc = "4,14 to 14,14"
		E.screen_loc = "4,4 to 14,4"
		F.screen_loc = "4,4 to 4,14"
		G.screen_loc = "14,4 to 14,14"
		usr.Text(usr,4,14,4,10,"--Wall Menu--")
		switch(M.Race)
			if("Vampire","Svartalfar","Gargoyle","Goblin")
				WoodWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodWall")
				BoneWall.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"BoneWall")
				StoneWall.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"StoneWall")
				SecretWall.screen_loc = "5,7"
				usr.Text(usr,7,7,4,10,"SecretWall")
			if("Orc")
				WoodWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodWall")
				SecretWall.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"SecretWall")
			if("Lizardman","Frogman")
				TribalWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"TribalWall")
				BoneWall.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"BoneWall")
				SecretWall.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"SecretWall")
			if("Human")
				WoodWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"WoodWall")
				StoneWall.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StoneWall")
				ArrowSlit.screen_loc = "5,5"
				usr.Text(usr,7,5,4,10,"ArrowSlit")
				SecretWall.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"SecretWall")
			if("Dwarf")
				WoodWall.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"WoodWall")
				StoneWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"StoneWall")
				Detail.screen_loc = "11,13"
				usr.Text(usr,12,13,4,10,"Detail")
				SecretWall.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"SecretWall")
			if("Kobold","Ratman")
				BoneWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"BoneWall")
				SecretWall.screen_loc = "5,9"
				usr.Text(usr,7,7,4,10,"SecretWall")
			if("Elf")
				ElfWall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"ElfWall")
				SecretWall.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"SecretWall")
			else
				SecretWall.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"SecretWall")
		if(M.SandWorker == 1)
			StoneWall.screen_loc = "5,11"
			usr.Text(usr,7,11,4,10,"StoneWall")
			WoodWall.screen_loc = "5,13"
			usr.Text(usr,7,13,4,10,"BoneWall")
		if(M.SubRace == "Illithid")
			StoneWall.screen_loc = "5,13"
			usr.Text(usr,7,13,4,10,"StoneWall")


/mob/proc/MindPower()//This is the proc that creates the OSI
	for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
		del(H)
	usr.MindMenu()//Creates the OSI Background

/mob/proc/MindMenu()//Proc that creates the OSI Background
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace == "Illithid")
			var/obj/H = new/obj/HUD/Middle2(usr.client)
			var/obj/O = new/obj/HUD/TopLeft(usr.client)
			var/obj/A = new/obj/HUD/TopRight(usr.client)
			var/obj/B = new/obj/HUD/BottomLeft(usr.client)
			var/obj/C = new/obj/HUD/BottomRight(usr.client)
			var/obj/D = new/obj/HUD/TopMiddle(usr.client)
			var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
			var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
			var/obj/G = new/obj/HUD/RightMiddle(usr.client)
			var/obj/Wall = new/obj/HUD/Forcefield(usr.client)
			var/obj/Telekinesis = new/obj/HUD/Telekinesis(usr.client)
			var/obj/Mindcontrol = new/obj/HUD/Mindcontrol(usr.client)
			var/obj/Pyrokinesis = new/obj/HUD/Pyrokinesis(usr.client)
			var/obj/ReadMind = new/obj/HUD/ReadMind(usr.client)
			var/obj/Warp = new/obj/HUD/Warp(usr.client)
			//var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
			//var/obj/Br = new/obj/HUD/B(usr.client)
			//var/obj/Dec = new/obj/HUD/Dec(usr.client)
			var/obj/Scrying = new/obj/HUD/Scrying(usr.client)
			H.screen_loc = "4,14 to 14,4"
			O.screen_loc = "4,14"
			A.screen_loc = "14,14"
			B.screen_loc = "4,4"
			C.screen_loc = "14,4"
			D.screen_loc = "4,14 to 14,14"
			E.screen_loc = "4,4 to 14,4"
			F.screen_loc = "4,4 to 4,14"
			G.screen_loc = "14,4 to 14,14"
			usr.Text(usr,4,14,4,10,"--Mindcraft Menu--")
			Wall.screen_loc = "5,13"
			usr.Text(usr,7,13,4,10,"Forcefield")
			Telekinesis.screen_loc = "5,11"
			usr.Text(usr,7,11,4,10,"Telekinesis")
			Mindcontrol.screen_loc = "5,9"
			usr.Text(usr,7,9,4,10,"Mindcontrol")
			Pyrokinesis.screen_loc = "5,7"
			usr.Text(usr,7,7,4,10,"Pyrokinesis")
			ReadMind.screen_loc = "5,5"
			usr.Text(usr,7,5,4,10,"Read Mind")
			Warp.screen_loc = "11,13"
			usr.Text(usr,12,13,4,10,"Warp")
			Scrying.screen_loc = "11,11"
			usr.Text(usr,13,11,4,10,"Scrying")

/mob/proc/Building()
	for(var/obj/HUD/H in usr.client.screen) del(H)
	usr.BuildingMenu()

/mob/proc/BuildingMenu()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.density == 1) switch(M.Race)
			if("Spider")
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Wall = new/obj/HUD/SilkWall(usr.client)
				var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
				var/obj/Trap = new/obj/HUD/SpiderTrap(usr.client)
				var/obj/Post = new/obj/HUD/Post(usr.client)
				var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
				var/obj/Br = new/obj/HUD/SilkBridge(usr.client)
				var/obj/Dec = new/obj/HUD/Dec(usr.client)
				var/obj/Lair = new/obj/HUD/Lair(usr.client)
				var/obj/Dest = new/obj/HUD/ClickDestroy(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Build Menu--")
				Wall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"SilkWall")
				Trap.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StickyTrap")
				Post.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"SilkPost")
				Cacoon.screen_loc = "5,7"
				usr.Text(usr,7,7,4,10,"Cacoon")
				Br.screen_loc = "5,5"
				usr.Text(usr,7,5,4,10,"SilkBridge")
				Dec.screen_loc = "11,13"
				usr.Text(usr,12,13,4,10,"Decorations")
				if(M.icon == 'SpiderQueenMature.dmi')
					Lair.screen_loc = "11,11"
					usr.Text(usr,13,11,4,10,"Lair")
				Dest.screen_loc = "11,9"
				usr.Text(usr,13,9,4,10,"DestroyFloor")
				Stairs.screen_loc = "11,7"
				Stairs.icon_state="SpiderDown"
				usr.Text(usr,12,7,4,10,"Stairs")
			if("Devourer")
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Wall = new/obj/HUD/ClickDevourerWall(usr.client)
				var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
				var/obj/Trap = new/obj/HUD/ClickCacoonTrap(usr.client)
				var/obj/Bonecraft = new/obj/HUD/BuiltInBonecraft(usr.client)
				var/obj/Cacoon = new/obj/HUD/CreateZombieCacoon(usr.client)
				var/obj/Organ = new/obj/HUD/CreateOrgan(usr.client)
				var/obj/Improve = new/obj/HUD/ImproveDevourer(usr.client)
				var/obj/Lair = new/obj/HUD/ClickDevourerFloor(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Build Menu--")
				Wall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"FleshWall")
				Trap.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"Trap")
				Bonecraft.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"Bonecraft")
				Cacoon.screen_loc = "5,7"
				usr.Text(usr,7,7,4,10,"Cacoon")
				Organ.screen_loc = "5,5"
				usr.Text(usr,7,5,4,10,"Organ")
				Improve.screen_loc = "11,13"
				usr.Text(usr,12,13,4,10,"Enhance")
				Stairs.screen_loc = "11,7"
				usr.Text(usr,12,7,4,10,"Stairs")
				Lair.screen_loc = "11,11"
				usr.Text(usr,13,11,4,10,"Floor")
			else
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Wall = new/obj/HUD/Walls(usr.client)
				var/obj/Floor = new/obj/HUD/Floors(usr.client)
				var/obj/Bridge = new/obj/HUD/Bridges(usr.client)
				var/obj/Trap = new/obj/HUD/Traps(usr.client)
				var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
				var/obj/Stations = new/obj/HUD/Stations(usr.client)
				var/obj/Farming = new/obj/HUD/Farming(usr.client)
				var/obj/Fire = new/obj/HUD/ClickFire(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Build Menu--")
				Wall.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"Walls")
				Floor.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"Floors")
				Bridge.screen_loc = "5,9"
				usr.Text(usr,7,9,4,10,"Bridges")
				Trap.screen_loc = "5,7"
				usr.Text(usr,7,7,4,10,"Traps")
				Stairs.screen_loc = "11,13"
				usr.Text(usr,12,13,4,10,"Stairs")
				Stations.screen_loc = "11,11"
				usr.Text(usr,12,11,4,10,"Stations")
				Farming.screen_loc = "11,9"
				usr.Text(usr,12,9,4,10,"Farming")
				Fire.screen_loc = "11,7"
				usr.Text(usr,12,7,4,10,"CampFire")

