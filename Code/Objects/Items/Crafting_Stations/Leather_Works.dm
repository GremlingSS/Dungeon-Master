/mob/WorkShops/LeatherWorks
	name = "Leatherworking Station"

/mob/WorkShops/LeatherWorks/Left
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopLeft"

/mob/WorkShops/LeatherWorks/Right
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopRight"

/mob/WorkShops/LeatherWorks/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Spider")
			return
		if(M.Wagon == 1)
			return
		if(M.Race == "Spider")
			return
		if(M.Wagon == 1)
			return
		var/list/menu = new()
		menu += "Craft"
		menu += "Destroy"
		menu += "Cancel"
		var/Result = input("What Action Will You Choose?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Destroy")
			if(M in range(1,src))
				M.DestroyLeatherStation()
		if (Result == "Craft")
			var/list/menu2 = new()
			menu2 += "Strip all Skin from Corpses"
			menu2 += "Black Robe"
			menu2 += "Red Robe"
			menu2 += "White Robe"
			menu2 += "Black Hood"
			menu2 += "White Hood"
			menu2 += "Red Hat"
			menu2 += "Red Cape"
			menu2 += "Black Cape"
			menu2 += "White Cape"
			menu2 += "Leather Quiver"
			menu2 += "Leather Bed"
			menu2 += "Leather Leggings"
			menu2 += "Leather Left Glove"
			menu2 += "Leather Right Glove"
			menu2 += "Leather Top"
			menu2 += "Leather Helmet"
			menu2 += "Leather Flask"
			menu2 += "Demon Leather Top"
			menu2 += "Demon Leather Leggings"
			menu2 += "Demon Leather Helmet"
			menu2 += "Demon Leather Right Glove"
			menu2 += "Demon Leather Left Glove"
			menu2 += "Demon Leather Shield"
			menu2 += "Leather Sleeping Bag"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if(Result2 == "Strip all Skin from Corpses") for(var/mob/Body/m in M) if(M && m) M.TearSkin(m)
			if (Result2 == "Leather Quiver")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.LeatherCraftingSkill += 1
							return
						var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/LB = new
						LB.loc = M.loc
						M.LeatherCraftingSkill += 0.5
						M.weight -= S.weight
						LB.dir = NORTH
						del(S)
						break
						return
			if (Result2 == "Leather Flask")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.LeatherCraftingSkill += 1
							return
						var/obj/Items/Shafts/LeatherFlask/LB = new
						LB.loc = M.loc
						M.LeatherCraftingSkill += 0.5
						M.weight -= S.weight
						LB.FurnitureCraft()
						del(S)
						break
						return
			if (Result2 == "Leather Helmet")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/LeatherHelmet/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if(Result2 == "Demon Leather Helmet")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						if(S.Race == "Demon")
							var/fail
							fail = prob(M.LeatherCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.LeatherCraftingSkill += 1
								break
								return
							var/obj/Items/Equipment/Armour/Helmet/DemonLeatherHelmet/LB = new
							if(M.LeatherCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.LeatherCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.LeatherCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.LeatherCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.LeatherCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.LeatherCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.LeatherCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.MetalArmourCraft()
							M.LeatherCraftingSkill += 1
							M.weight -= S.weight
							LB.loc = M.loc
							del(S)
							break
							return
			if(Result2 == "Demon Leather Shield")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						if(S.Race == "Demon")
							var/fail
							fail = prob(M.LeatherCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.LeatherCraftingSkill += 1
								break
								return
							var/obj/Items/Equipment/Armour/Shield/DemonLeatherShield/LB = new
							if(M.LeatherCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.LeatherCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.LeatherCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.LeatherCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.LeatherCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.LeatherCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.LeatherCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.MetalArmourCraft()
							M.LeatherCraftingSkill += 1
							M.weight -= S.weight
							LB.loc = M.loc
							del(S)
							break
							return
			if (Result2 == "Black Robe")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/BlackRobe/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Red Robe")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/RedRobe/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "White Robe")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/WhiteRobe/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Black Cape")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Capes/BlackCape/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Red Cape")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Capes/RedCape/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "White Cape")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Capes/WhiteCape/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Red Hat")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/RedHat/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Black Hood")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/BlackHood/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "White Hood")
				if(M in range(1,src))
					for(var/obj/Items/Silks/SpiderSilk/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/WhiteHood/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Leather Right Glove")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/LeatherRightGauntlet/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Demon Leather Right Glove")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						if(S.Race == "Demon")
							var/fail
							fail = prob(M.LeatherCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.LeatherCraftingSkill += 1
								break
								return
							var/obj/Items/Equipment/Armour/RightArm/DemonLeatherRightGauntlet/LB = new
							if(M.LeatherCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.LeatherCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.LeatherCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.LeatherCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.LeatherCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.LeatherCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.LeatherCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.MetalArmourCraft()
							M.LeatherCraftingSkill += 1
							M.weight -= S.weight
							LB.loc = M.loc
							del(S)
							break
							return
			if (Result2 == "Leather Left Glove")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/LeatherLeftGauntlet/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Demon Leather Left Glove")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						if(S.Race == "Demon")
							var/fail
							fail = prob(M.LeatherCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.LeatherCraftingSkill += 1
								break
								return
							var/obj/Items/Equipment/Armour/LeftArm/DemonLeatherLeftGauntlet/LB = new
							if(M.LeatherCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.LeatherCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.LeatherCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.LeatherCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.LeatherCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.LeatherCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.LeatherCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.MetalArmourCraft()
							M.LeatherCraftingSkill += 1
							M.weight -= S.weight
							LB.loc = M.loc
							del(S)
							break
							return
			if (Result2 == "Leather Top")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Demon Leather Top")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						if(S.Race == "Demon")
							var/fail
							fail = prob(M.LeatherCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.LeatherCraftingSkill += 1
								break
								return
							var/obj/Items/Equipment/Armour/Chestplate/DemonLeatherChestPlate/LB = new
							if(M.LeatherCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.LeatherCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.LeatherCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.LeatherCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.LeatherCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.LeatherCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.LeatherCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.MetalArmourCraft()
							M.LeatherCraftingSkill += 1
							M.weight -= S.weight
							LB.loc = M.loc
							del(S)
							break
							return
			if (Result2 == "Leather Leggings")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.LeatherCraftingSkill += 1
							return
						var/obj/Items/Equipment/Armour/Leggings/LeatherLeggings/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Demon Leather Leggings")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						if(S.Race == "Demon")
							var/fail
							fail = prob(M.LeatherCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								break
								M.LeatherCraftingSkill += 1
								return
							var/obj/Items/Equipment/Armour/Leggings/DemonLeatherLeggings/LB = new
							if(M.LeatherCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.LeatherCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.LeatherCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.LeatherCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.LeatherCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.LeatherCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.LeatherCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.LeatherCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.MetalArmourCraft()
							M.LeatherCraftingSkill += 1
							M.weight -= S.weight
							LB.loc = M.loc
							del(S)
							break
							return
			if (Result2 == "Leather Sleeping Bag")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Furniture/Beds/SleepingBag/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Leather Bed")
				if(M in range(1,src))
					for(var/obj/Items/Skin/S in M)
						var/fail
						fail = prob(M.LeatherCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.LeatherCraftingSkill += 1
							break
							return
						var/obj/Items/Furniture/Beds/LeatherBed/LB = new
						if(M.LeatherCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.LeatherCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.LeatherCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.LeatherCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.LeatherCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.LeatherCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.LeatherCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.LeatherCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.LeatherCraftingSkill += 1
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return