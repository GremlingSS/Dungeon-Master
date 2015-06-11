/obj/HUD/CreateOrgan
	name = "CreateOrgan"
	icon_state = "DevourerOrgan"
	text = "O"

/obj/HUD/CreateOrgan/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Devourer")
			if(M.EggContent >= 1)
				var/list/menu2 = new()
				menu2 += "Reinforced Flesh"
				menu2 += "Enhanced Muscle Structure"
				menu2 += "Efficient Nerve Centre"
				menu2 += "Expanded Skull"
				menu2 += "Symbiotic Cancerous Cells"
				menu2 += "Organic Climbing Hooks"
				menu2 += "Sharpened Finger Bones"
				menu2 += "Toxic Marrow"
				menu2 += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
				if(Result != "Cancel" && M.EggContent >= 2)
					var/obj/Items/Shafts/EngineeredOrgan/E = new()
					E.loc = M
					E.suffix = "(Carrying)"
					M.EggContent -= 1
					if(Result == "Reinforced Flesh")
						E.Content2 = "Toughness"
					if(Result == "Enhanced Muscle Structure")
						E.Content2 = "Strength"
					if(Result == "Efficient Nerve Centre") E.Content2 = "Agility"
					if(Result == "Expanded Skull")
						E.Content2 = "Intelligence"
					if(Result == "Symbiotic Cancerous Cells")
						E.Content2 = "Resistance"
					if(Result == "Organic Climbing Hooks")
						E.Content2 = "Climbing"
					if(Result == "Sharpened Finger Bones")
						E.Content2 = "Claws"
					if(Result == "Toxic Marrow")
						E.Content2 = "Acid"
					E.name = "Organ - [Result]"
				usr.Close()
			else
				usr << "Your devourer does not have enough bodies stored, you require 1 body for this."
		else
			usr << "One or more of the units you have selected is not a devourer"
			return

/obj/HUD/ImproveDevourer
	name = "ImproveDevourer"
	icon_state = "Devourer"
	text = "I"

/obj/HUD/ImproveDevourer/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Devourer")
			if(M.EggContent >= 5)
				var/list/menu2 = new()
				if(M.SavedDefence<100)
					menu2 += "Hardened Casing"
				if(M.Delay >= 4)
					menu2 += "Enhanced Motile Tendrils"
				if(M.HoldingWeapon == "Mace")
					menu2 += "Sharpened Tool Stalks"
				if(!M.CliffClimber)
					menu2 += "Adhesive Slime Glands"
				menu2 += "Concentration Enhancing Hormonal Gland"
				menu2 += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
				if(Result != "Cancel" && M.EggContent >= 5)
					if(Result == "Hardened Casing")
						if(M.SavedDefence<100)
							M.EggContent -= 5
							M.Defence += 5
							M.SavedDefence += 5
							usr<<"[M]'s defence has increesed by 5 points. (So far [M.SavedDefence])"
					if(Result == "Enhanced Motile Tendrils")
						if(M.Delay == 4)
							M.Delay = 3
							M.EggContent -= 5
							usr<<"[M] will now move and attack 25% faster."
					if(Result ==  "Sharpened Tool Stalks")
						if(M.HoldingWeapon == "Mace")
							M.HoldingWeapon = "Sword"
							M.WeaponDamageMin += 10
							M.WeaponDamageMax += 12
							M.EggContent -= 5
							usr<<"[M]'s damage has been improved by 10 to 12 points. [M] will also now deal slashing damage."
					if(Result == "Adhesive Slime Glands")
						if(!M.CliffClimber)
							M.CliffClimber = 1
							M.EggContent -= 5
							usr<<"[M] has gained the ability to climb cliffs. To do so simply click on a tile in the sky and you will automatically climb over any walls in the way, if possible."
					if(Result == "Concentration Enhancing Hormonal Gland")
						M.Intelligence += 1
						M.EXP += 250
						M.EggContent -= 5
						usr<<"[M]'s intelligence has been enhanced by 1 point."
				else
					usr << "You need 5 bodies stored to do this."
				usr.Close()
			else
				usr << "Your devourer does not have any bodies stored. You need 5."

/obj/HUD/BuiltInBonecraft
	name = "Bonecraft"
	icon_state = "DevourerBonecraft"
	text = "B"

/obj/HUD/BuiltInBonecraft/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race != "Devourer")
			return
		var/list/menu = new()
		menu += "Craft"
		menu += "Cancel"
		var/Result = input("What Action Will You Choose?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Craft")
			var/list/menu2 = new()
			menu2 += "BoneSpear"
			menu2 += "Full Bone Armor"
			menu2 += "BoneAxe"
			menu2 += "BoneDagger"
			menu2 += "BoneHelmet"
			menu2 += "BoneChestPlate"
			menu2 += "BoneLeggings"
			menu2 += "BoneLeftGauntlet"
			menu2 += "BoneRightGauntlet"
			menu2 += "Bone Door"
			menu2 += "BoneBuckler"
			menu2 += "Bone Training Post"
			menu2 += "Bone Throne"
			menu2 += "Bone Sword"
			menu2 += "Skull Mace"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "Bone Throne")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						M.BoneCraftingSkill += 0.25
						del(S)
						break
						return
					var/obj/Items/Furniture/Chairs/BoneThrone/LB = new
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.FurnitureCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "Bone Training Post")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						M.BoneCraftingSkill += 0.25
						del(S)
						break
						return
					var/obj/Items/Furniture/Posts/BoneTrainingPost/LB = new
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.TrainCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "LockPick")
				for(var/obj/Items/Bones/Bones/S in view(1,M))
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Shafts/LockPick/LB = new
					LB.loc = M.loc
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.FurnitureCraft()
					del(S)
					break
					return
			if (Result2 == "BoneBuckler")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Armour/Shield/BoneBuckler/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "BoneDagger")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Weapon/Daggers/BoneDagger/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneWeaponCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					LB.WeaponDamageMin = LB.WeaponDamageMin/2
					LB.WeaponDamageMax = LB.WeaponDamageMax/2
					del(S)
					break
					return
			if (Result2 == "BoneAxe")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Weapon/Axes/BoneAxe/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneWeaponCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "Skull Mace")
				for(var/obj/Items/Bones/Skull/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Weapon/Maces/SkullMace/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneWeaponCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "Bone Sword")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Weapon/Swords/BoneSword/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneWeaponCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "BoneSpear")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Weapon/Spears/BoneSpear/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneWeaponCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "BoneRightGauntlet")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "BoneLeftGauntlet")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "BoneLeggings")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "Full Bone Armor")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						M.BoneCraftingSkill += 0.25
						del(S)
						break
					var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
				for(var/obj/Items/Bones/Bones/S2 in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S2.weight
						M.BoneCraftingSkill += 0.25
						del(S2)
						break
					var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S2.weight
					LB.loc = M.loc
					del(S2)
					break
				for(var/obj/Items/Bones/Bones/S3 in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S3.weight
						M.BoneCraftingSkill += 0.25
						del(S3)
						break
					var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S3.weight
					LB.loc = M.loc
					del(S3)
					break
				for(var/obj/Items/Bones/Bones/S4 in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S4.weight
						M.BoneCraftingSkill += 0.25
						del(S4)
						break
					var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S4.weight
					LB.loc = M.loc
					del(S4)
					break
				for(var/obj/Items/Bones/Skull/S5 in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S5.weight
						M.BoneCraftingSkill += 0.25
						del(S5)
						break
					var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S5.weight
					LB.loc = M.loc
					del(S5)
					break
			if (Result2 == "BoneChestPlate")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "Bone Door")
				for(var/obj/Items/Bones/Bones/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Furniture/Doors/BoneDoor/LB = new
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.DoorCraft()
					M.BoneCraftingSkill += 0.25
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return
			if (Result2 == "BoneHelmet")
				for(var/obj/Items/Bones/Skull/S in M)
					var/fail
					fail = prob(M.BoneCraftingSkill*4)
					if(fail == 0)
						usr<< "Failed!"
						M.weight -= S.weight
						del(S)
						break
						M.BoneCraftingSkill += 0.25
						return
					var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
					if(M.BoneCraftingSkill >= 299)
						LB.CraftRank = "Supernatural Quality"
					if(M.BoneCraftingSkill >= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill >= 100)
						LB.CraftRank = "Legendary Quality"
					if(M.BoneCraftingSkill <= 90)
						LB.CraftRank = "Epic Quality"
					if(M.BoneCraftingSkill <= 75)
						LB.CraftRank = "Masterful Quality"
					if(M.BoneCraftingSkill <= 60)
						LB.CraftRank = "Grand Quality"
					if(M.BoneCraftingSkill <= 50)
						LB.CraftRank = "Impressive Quality"
					if(M.BoneCraftingSkill <= 40)
						LB.CraftRank = "Quality"
					if(M.BoneCraftingSkill <= 30)
						LB.CraftRank = "Average Quality"
					if(M.BoneCraftingSkill <= 20)
						LB.CraftRank = "Poor Quality"
					LB.BoneArmourCraft()
					M.BoneCraftingSkill += 0.25
					LB.WeaponDamageMin = rand(1,3)
					LB.WeaponDamageMax = rand(3,6)
					M.weight -= S.weight
					LB.loc = M.loc
					del(S)
					break
					return

/obj/HUD/CreateZombieCacoon
	name = "CreateZombieCacoon"
	icon_state = "DevourerZombie"
	text = "Z"

/obj/HUD/CreateZombieCacoon/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Devourer")
			if(M.EggContent >= 1)
				M.EggContent -= 1
				var/obj/Items/Shafts/PortableDevourerCacoon/C = new
				C.loc = M
				C.suffix = "(Carrying)"
				usr.Close()
			else
				usr << "Your devourer does not have enough bodies stored."
