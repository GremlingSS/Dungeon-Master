/mob/WorkShops/Forge
	name = "Forge"

/mob/WorkShops/Forge/Left
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopLeft2"

/mob/WorkShops/Forge/Right
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopRight2"

/mob/WorkShops/Forge/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Spider")
			return
		if(M.Wagon == 1)
			return
		if(M.Infects == 1)
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
				M.DestroyForge()
		if (Result == "Craft")
			var/list/menu2 = new()
			if(M.Race == "Orc")
				menu2 += "Metal OrcAxe"
				menu2 += "Metal OrcSword"
			if(M.Race == "Human" || M.Race == "Dwarf")
				menu2 += "Metal Drill"
			menu2 += "Metal Fence"
			menu2 += "Metal Cage"
			menu2 += "Full Metal Armor"
			menu2 += "Metal ChestPlate"
			menu2 += "Metal Leggings"
			menu2 += "Metal Left Gauntlet"
			menu2 += "Metal Right Gauntlet"
			menu2 += "MetalNeckGuard"
			menu2 += "Metal Training Post"
			menu2 += "Metal Helmet"
			menu2 += "Metal Spear"
			menu2 += "Metal Buckler"
			menu2 += "Metal Chest"
			menu2 += "MetalSpade"
			menu2 += "Metal Flask"
			menu2 += "Metal Axe"
			menu2 += "Metal Bed"
			menu2 += "Metal Door"
			menu2 += "Metal Dagger"
			if(M.Race == "Dwarf")
				menu2 += "Adamantium ChestPlate"
				menu2 += "Adamantium Leggings"
				menu2 += "Adamantium Left Gauntlet"
				menu2 += "Adamantium Right Gauntlet"
				menu2 += "Adamantium Buckler"
				menu2 += "Adamantium Sword"
				menu2 += "Adamantium Axe"
				menu2 += "Adamantium Mace"
				menu2 += "Adamantium Spear"
				menu2 += "Adamantium Helmet"
			if(M.MetalCraftingSkill >= 100)
				menu2 += "Soul Blade"
			if(M.Race != "Orc")
				menu2 += "MetalStraightSword"
				menu2 += "MetalGladius"
			menu2 += "Metal Bow"
			menu2 += "Metal Arrows"
			if(M.Race != "Orc")
				menu2 += "Gold Cage"
				menu2 += "Gold Crown"
				menu2 += "Golden Throne"
				menu2 += "Silver Training Post"
				menu2 += "Silver Arrows"
			for(var/obj/Items/gems/Diamond/R in M)
				if(M.Race != "Kobold")
					menu2 += "Diamond Encrusted Metal ChestPlate"
					menu2 += "Diamond Encrusted Silver ChestPlate"
					menu2 += "Diamond Encrusted Metal Leggings"
					menu2 += "Diamond Encrusted Silver Leggings"
					menu2 += "Diamond Encrusted Metal Helmet"
					menu2 += "Diamond Encrusted Silver Helmet"
				if(M.Race == "Dwarf")
					menu2 += "Diamond Encrusted Gold ChestPlate"
					menu2 += "Diamond Encrusted Gold Leggings"
					menu2 += "Diamond Encrusted Gold Helmet"
			for(var/obj/Items/gems/Emerald/R in M)
				if(M.Race != "Kobold")
					menu2 += "Emerald Encrusted Metal ChestPlate"
					menu2 += "Emerald Encrusted Silver ChestPlate"
					menu2 += "Emerald Encrusted Metal Leggings"
					menu2 += "Emerald Encrusted Silver Leggings"
					menu2 += "Emerald Encrusted Metal Helmet"
					menu2 += "Emerald Encrusted Silver Helmet"
				if(M.Race == "Dwarf")
					menu2 += "Emerald Encrusted Gold ChestPlate"
					menu2 += "Emerald Encrusted Gold Leggings"
					menu2 += "Emerald Encrusted Gold Helmet"
			for(var/obj/Items/gems/Ruby/R in M)
				if(M.Race != "Kobold")
					menu2 += "Ruby Encrusted Metal ChestPlate"
					menu2 += "Ruby Encrusted Silver ChestPlate"
					menu2 += "Ruby Encrusted Metal Leggings"
					menu2 += "Ruby Encrusted Silver Leggings"
					menu2 += "Ruby Encrusted Metal Helmet"
					menu2 += "Ruby Encrusted Silver Helmet"
				if(M.Race == "Dwarf")
					menu2 += "Ruby Encrusted Gold ChestPlate"
					menu2 += "Ruby Encrusted Gold Leggings"
					menu2 += "Ruby Encrusted Gold Helmet"
			if(M.Race != "Goblin")
				if(M.Race != "Kobold")
					menu2 += "Gold Spear"
					menu2 += "Gold Axe"
					menu2 += "Gold Dagger"
					menu2 += "Gold Mace"
					menu2 += "Gold Door"
					menu2 += "Gold Bed"
					menu2 += "Gold Training Post"
					menu2 += "Gold ChestPlate"
					menu2 += "Gold Leggings"
					menu2 += "Gold Helmet"
					menu2 += "Gold Buckler"
					menu2 += "Gold Chest"
					menu2 += "Golden Pillar"
					menu2 += "GoldStraightSword"
					menu2 += "GoldGladius"
					menu2 += "GoldLeftGauntlet"
					menu2 += "GoldRightGauntlet"
					menu2 += "GoldNeckGuard"
					menu2 += "Silver ChestPlate"
					menu2 += "Silver Chest"
					menu2 += "Silver Leggings"
					menu2 += "Silver Helmet"
					menu2 += "Silver Buckler"
					menu2 += "Silver Spear"
					menu2 += "Silver Axe"
					menu2 += "Silver Mace"
					menu2 += "Silver Dagger"
					menu2 += "Silver Sword"
					menu2 += "Silver Left Gauntlet"
					menu2 += "Silver Right Gauntlet"
					menu2 += "SilverNeckGuard"
			if(M.Race != "Kobold")
				menu2 += "Metal Mace"
			menu2 += "Metal PickAxe"
			if(M.Race != "Goblin")
				menu2 += "Gold PickAxe"
			if(M.Race == "Goblin")
				menu2 += "Goblin Sword"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if(Result2 == "Soul Blade")
				if(M in range(1,src))
					for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Sword/S1 in M)
						if(S1.suffix == "(Carrying)")
							for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Mace/S2 in M)
								if(S2.suffix == "(Carrying)")
									for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger/S3 in M)
										if(S3.suffix == "(Carrying)")
											for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Spear/S4 in M)
												if(S4.suffix == "(Carrying)")
													for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Axe/S5 in M)
														if(S5.suffix == "(Carrying)")
															var/obj/Items/Equipment/Weapon/DemonicWeapons/SoulBlade/S6 = new
															S6.loc = M.loc
															for(var/turf/L in range(1,src))
																if(L.icon_state == "Lava")
																	S6.WeaponDamageMin += 10
																	S6.WeaponDamageMax += 10
																	break
															for(var/obj/Items/Equipment/E in list(S1,S2,S3,S4,S5))
																if(M.DropItem(E))
																	del(E)
															return

			if (Result2 == "MetalNeckGuard")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill * 4)
						if(fail == 0)
							usr << "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						if(M)
							var/obj/Items/Equipment/Armour/NeckGuards/MetalNeckGuard/LB = new
							LB.loc = M.loc
							M.weight -= S.weight
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							M.MetalCraftingSkill += 1
							LB.FurnitureCraft()
							del(S)
							break
							return
			if (Result2 == "SilverNeckGuard")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill * 4)
						if(fail == 0)
							usr << "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						if(M)
							var/obj/Items/Equipment/Armour/NeckGuards/SilverNeckGuard/LB = new
							LB.loc = M.loc
							M.weight -= S.weight
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							M.MetalCraftingSkill += 1
							LB.FurnitureCraft()
							del(S)
							break
							return
			if (Result2 == "GoldNeckGuard")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						if(M)
							var/obj/Items/Equipment/Armour/NeckGuards/GoldNeckGuard/LB = new
							LB.loc = M.loc
							M.weight -= S.weight
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							M.MetalCraftingSkill += 1
							LB.FurnitureCraft()
							del(S)
							break
							return
			if (Result2 == "Golden Pillar")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill * 4)
						if(fail == 0)
							usr << "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						if(M in range(1,src))
							var/obj/Items/Furniture/Pillars/GoldPillar/LB = new
							LB.loc = M.loc

							M.weight -= S.weight
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							M.MetalCraftingSkill += 1
							LB.FurnitureCraft()
							del(S)
							break
							return
			if (Result2 == "Silver Arrows")
				if(M in range(1,src))
					var/XK = 0
					var/T = input("Amount?")as null|num
					if(!T)
						return
					else
						for(var/obj/Items/Ingots/SilverIngot/G in M)
							if(G in M)
								if(G.suffix == "(Carrying)")
									XK += 1
						if(XK <= T)
							M.CraftCount = XK
						else
							M.CraftCount = T
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							if(M.CraftCount >= 1)
								var/fail
								fail = prob(M.MetalCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.MetalCraftingSkill += 1
									T -= 1
									del(S)
								else if(M.WearingBack)
									for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
										if(L.suffix == "(Equipped)")
											if(L.Content <= 250)
												var/obj/Items/Arrows/SilverArrow/LB = new
												LB.loc = L
												var/obj/Items/Arrows/SilverArrow/LB2 = new
												LB2.loc = L
												var/obj/Items/Arrows/SilverArrow/LB3 = new
												LB3.loc = L
												var/obj/Items/Arrows/SilverArrow/LB4 = new
												LB4.loc = L
												var/obj/Items/Arrows/SilverArrow/LB5 = new
												LB5.loc = L
												var/obj/Items/Arrows/SilverArrow/LB6 = new
												LB6.loc = L
												var/obj/Items/Arrows/SilverArrow/LB7 = new
												LB7.loc = L
												var/obj/Items/Arrows/SilverArrow/LB8 = new
												LB8.loc = L
												var/obj/Items/Arrows/SilverArrow/LB9 = new
												LB9.loc = L
												var/obj/Items/Arrows/SilverArrow/LB10 = new
												LB10.loc = L
												M.MetalCraftingSkill += 1.5
												M.weight -= S.weight
												LB.Owner = M.Owner
												LB2.Owner = M.Owner
												LB3.Owner = M.Owner
												LB4.Owner = M.Owner
												LB5.Owner = M.Owner
												LB6.Owner = M.Owner
												LB7.Owner = M.Owner
												LB8.Owner = M.Owner
												LB9.Owner = M.Owner
												LB10.Owner = M.Owner
												L.Content += 10
												M.Owner << "Arrows placed in quiver!"
												M.CraftCount -= 1
												del(S)
											else
												M.Owner << "The quiver has too many arrows in it."
												return
								else
									M.Owner << "[M] - I've got no quiver to put arrows in!"
									return
							else
								M.CraftCount = 0
								return
			if (Result2 == "Metal Arrows")
				if(M in range(1,src))
					var/XK = 0
					var/T = input("Amount?")as null|num
					if(!T)
						return
					else
						for(var/obj/Items/Ingots/IronIngot/G in M)
							if(G in M)
								if(G.suffix == "(Carrying)")
									XK += 1
						if(XK <= T)
							M.CraftCount = XK
						else
							M.CraftCount = T
						for(var/obj/Items/Ingots/IronIngot/S in M)
							if(M.CraftCount >= 1)
								var/fail
								fail = prob(M.MetalCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.MetalCraftingSkill += 1
									T -= 1
									del(S)
								else if(M.WearingBack)
									for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
										if(L.suffix == "(Equipped)")
											if(L.Content <= 250)
												var/obj/Items/Arrows/MetalArrow/LB = new
												LB.loc = L
												var/obj/Items/Arrows/MetalArrow/LB2 = new
												LB2.loc = L
												var/obj/Items/Arrows/MetalArrow/LB3 = new
												LB3.loc = L
												var/obj/Items/Arrows/MetalArrow/LB4 = new
												LB4.loc = L
												var/obj/Items/Arrows/MetalArrow/LB5 = new
												LB5.loc = L
												var/obj/Items/Arrows/MetalArrow/LB6 = new
												LB6.loc = L
												var/obj/Items/Arrows/MetalArrow/LB7 = new
												LB7.loc = L
												var/obj/Items/Arrows/MetalArrow/LB8 = new
												LB8.loc = L
												var/obj/Items/Arrows/MetalArrow/LB9 = new
												LB9.loc = L
												var/obj/Items/Arrows/MetalArrow/LB10 = new
												LB10.loc = L
												M.MetalCraftingSkill += 1.5
												M.weight -= S.weight
												LB.Owner = M.Owner
												LB2.Owner = M.Owner
												LB3.Owner = M.Owner
												LB4.Owner = M.Owner
												LB5.Owner = M.Owner
												LB6.Owner = M.Owner
												LB7.Owner = M.Owner
												LB8.Owner = M.Owner
												LB9.Owner = M.Owner
												LB10.Owner = M.Owner
												L.Content += 10
												M.Owner << "Arrows placed in quiver!"
												M.CraftCount -= 1
												del(S)
											else
												M.Owner << "The quiver has too many arrows in it."
												return

								else
									M.Owner << "[M] - I've got no quiver to put arrows in!"
									return
							else
								M.CraftCount = 0
								return
			if (Result2 == "Metal Flask")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Shafts/MetalFlask/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 1
						M.weight -= S.weight
						LB.Owner = M.Owner
						del(S)
						break
						return
			if (Result2 == "Metal Drill")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/mob/Monsters/Chests/Drill/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 1
						M.weight -= S.weight
						LB.Owner = M.Owner
						del(S)
						break
						return
			if (Result2 == "Gold Chest")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/mob/Monsters/Chests/GoldChest/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 1
						M.weight -= S.weight
						LB.Owner = M.Owner
						del(S)
						break
						return
			if (Result2 == "Silver Chest")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/mob/Monsters/Chests/SilverChest/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 1
						M.weight -= S.weight
						LB.Owner = M.Owner
						del(S)
						break
						return
			if (Result2 == "Metal Chest")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/mob/Monsters/Chests/MetalChest/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 1
						M.weight -= S.weight
						LB.Owner = M.Owner
						del(S)
						break
						return
			if (Result2 == "MetalSpade")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.MetalCraftingSkill += 1
							break
							return
						var/obj/Items/Shafts/Spade/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold Door")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Furniture/Doors/GoldDoor/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.DoorCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Gold Training Post")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Furniture/Posts/GoldTrainingPost/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.TrainCraft()
						LB.Content3 += 0.1
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Metal Training Post")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.MetalCraftingSkill += 1
							M.weight -= S.weight
							del(S)
							break
							return
						var/obj/Items/Furniture/Posts/MetalTrainingPost/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.TrainCraft()
						LB.Content3 += 0.1
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Silver Training Post")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.MetalCraftingSkill += 1
							M.weight -= S.weight
							del(S)
							break
							return
						var/obj/Items/Furniture/Posts/SilverTrainingPost/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.TrainCraft()
						LB.Content3 += 0.1
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Metal Door")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Furniture/Doors/MetalDoor/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.DoorCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Metal Fence")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Furniture/Fences/MetalFence/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.DoorCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Golden Throne")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Furniture/Chairs/GoldenThrone/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Gold Bed")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Furniture/Beds/GoldBed/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Metal Bed")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.MetalCraftingSkill += 1
							M.weight -= S.weight
							del(S)
							break
							return
						var/obj/Items/Furniture/Beds/MetalBed/LB = new
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Metal Cage")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Traps/Cages/MetalCage/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold Cage")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Traps/Cages/GoldCage/LB = new
						LB.loc = M.loc
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold Crown")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Crown/Gold/LB = new
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf") LB.Defence += 1
						del(S)
						break
						return
			if(Result2 == "Diamond Encrusted Metal Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/DiamondMetalHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25

							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if(Result2 == "Diamond Encrusted Silver Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/DiamondSilverHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Metal Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/EmeraldMetalHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if(Result2 == "Emerald Encrusted Silver Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/EmeraldSilverHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if(Result2 == "Ruby Encrusted Metal Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/RubyMetalHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if(Result2 == "Ruby Encrusted Silver Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/RubySilverHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Gold ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/RubyGoldChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10

							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Diamond Encrusted Gold ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/DiamondGoldChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Diamond Encrusted Silver ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/DiamondSilverChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Diamond Encrusted Metal ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/DiamondMetalChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Metal ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/RubyMetalChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Metal ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/EmeraldMetalChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Diamond Encrusted Gold Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								break
								return
							var/obj/Items/Equipment/Armour/Helmet/DiamondGoldHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 15
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Gold Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/RubyGoldHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Gold Helmet")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Helmet/EmeraldGoldHelmet/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Gold ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/EmeraldGoldChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Silver ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/EmeraldSilverChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Silver ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Chestplate/RubySilverChestPlate/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							break
							return
			if (Result2 == "Metal Right Gauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if (Result2 == "Adamantium Right Gauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/AdamantiumRightGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Metal Left Gauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if(Result2 == "Adamantium Left Gauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/AdamantiumLeftGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Silver ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/SilverChestPlate/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if (Result2 == "Adamantium ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/AdamantiumChestPlate/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "GoldRightGauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/GoldRightGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if (Result2 == "GoldLeftGauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/GoldLeftGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if (Result2 == "Gold ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/GoldChestPlate/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if (Result2 == "Diamond Encrusted Gold Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								break
								return
							var/obj/Items/Equipment/Armour/Leggings/DiamondGoldLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Diamond Encrusted Silver Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/DiamondSilverLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Diamond Encrusted Metal Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/DiamondMetalLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 25
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Metal Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/RubyMetalLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Gold Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/RubyGoldLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Metal Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/IronIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= R.weight
								M.MetalCraftingSkill += 1
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/EmeraldMetalLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.MetalArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Gold Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/GoldIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/EmeraldGoldLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Emerald Encrusted Silver Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								break
								return
							var/obj/Items/Equipment/Armour/Leggings/EmeraldSilverLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Ruby Encrusted Silver Leggings")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/R in M)
						for(var/obj/Items/Ingots/SilverIngot/S in M)
							var/fail
							fail = prob(M.MetalCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.MetalCraftingSkill += 1
								M.weight -= R.weight
								del(S)
								del(R)
								return
							var/obj/Items/Equipment/Armour/Leggings/RubySilverLeggings/LB = new
							if(M.MetalCraftingSkill >= 299)
								LB.CraftRank = "Supernatural Quality"
							if(M.MetalCraftingSkill >= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill >= 100)
								LB.CraftRank = "Legendary Quality"
							if(M.MetalCraftingSkill <= 90)
								LB.CraftRank = "Epic Quality"
							if(M.MetalCraftingSkill <= 75)
								LB.CraftRank = "Masterful Quality"
							if(M.MetalCraftingSkill <= 60)
								LB.CraftRank = "Grand Quality"
							if(M.MetalCraftingSkill <= 50)
								LB.CraftRank = "Impressive Quality"
							if(M.MetalCraftingSkill <= 40)
								LB.CraftRank = "Quality"
							if(M.MetalCraftingSkill <= 30)
								LB.CraftRank = "Average Quality"
							if(M.MetalCraftingSkill <= 20)
								LB.CraftRank = "Poor Quality"
							LB.Defence += 10
							LB.BoneArmourCraft()
							M.MetalCraftingSkill += 0.5
							M.weight -= S.weight
							LB.loc = M.loc
							if(M.Race == "Dwarf")
								LB.Defence += 1
							del(S)
							del(R)
							return
			if (Result2 == "Silver Leggings")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Leggings/SilverLeggings/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Adamantium Leggings")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Leggings/AdamantiumLeggings/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						return
			if (Result2 == "Gold Leggings")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Leggings/GoldLeggings/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Silver Helmet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/SilverHelmet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Adamantium Helmet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/AdamantiumHelmet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						return
			if (Result2 == "Gold Helmet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/GoldHelmet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Silver Right Gauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/SilverRightGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Silver Left Gauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/SilverLeftGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Silver Buckler")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Shield/SilverBuckler/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Gold Buckler")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.MetalCraftingSkill += 1
							M.weight -= S.weight
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Shield/GoldBuckler/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Metal Buckler")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.MetalCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Shield/MetalBuckler/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Adamantium Buckler")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.MetalCraftingSkill += 1
							break
							return
						var/obj/Items/Equipment/Armour/Shield/AdamantiumBuckler/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						return
			if (Result2 == "Metal Helmet")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						return
			if (Result2 == "Metal Leggings")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						if(M.Race == "Dwarf")
							LB.Defence += 1
						del(S)
						break
						return
			if (Result2 == "Metal ChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Gold Mace")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Maces/GoldMace/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Full Metal Armor")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
						var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/Ingots/IronIngot/S2 in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S2.weight
							M.MetalCraftingSkill += 1
							del(S2)
							break
						var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S2.weight
						LB.loc = M.loc
						del(S2)
						break
					for(var/obj/Items/Ingots/IronIngot/S3 in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S3.weight
							M.MetalCraftingSkill += 1
							del(S3)
							break
						var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S3.weight
						LB.loc = M.loc
						del(S3)
						break
					for(var/obj/Items/Ingots/IronIngot/S4 in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S4.weight
							M.MetalCraftingSkill += 1
							del(S4)
							break
						var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S4.weight
						LB.loc = M.loc
						del(S4)
						break
					for(var/obj/Items/Ingots/IronIngot/S5 in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S5.weight
							M.MetalCraftingSkill += 1
							del(S5)
							break
						var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S5.weight
						LB.loc = M.loc
						del(S5)
						break
					for(var/obj/Items/Ingots/IronIngot/S5 in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S5.weight
							M.MetalCraftingSkill += 1
							del(S5)
							break
						var/obj/Items/Equipment/Armour/Shield/MetalBuckler/LB = new
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S5.weight
						LB.loc = M.loc
						del(S5)
						break
			if (Result2 == "Gold Mace")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Maces/GoldMace/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold PickAxe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Picks/GoldPickAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold Axe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Axes/GoldAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						if(M.Race == "Dwarf")
							LB.WeaponDamageMin += 1
							LB.WeaponDamageMax += 1
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold Dagger")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Daggers/GoldDagger/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Silver Spear")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Spears/SilverSpear/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Silver Dagger")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Daggers/SilverDagger/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						LB.WeaponDamageMin = LB.WeaponDamageMin/2
						LB.WeaponDamageMax = LB.WeaponDamageMax/2
						del(S)
						break
						return
			if(Result2 == "Silver Sword")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/SilverSword/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Silver Mace")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Maces/SilverMace/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Silver Axe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/SilverIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Axes/SilverAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Gold Spear")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Spears/GoldSpear/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal Bow")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Bows/MetalBow/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal Spear")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Spears/MetalSpear/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal Mace")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Maces/MetalMace/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "GoldGladius")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/GoldGladius/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "MetalGladius")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/Gladius/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "GoldStraightSword")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/GoldIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/GoldStraightSword/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "MetalStraightSword")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/StraightSword/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Adamantium Sword")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 4
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/AdamantiumSword/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumWeaponCraft()
						M.MetalCraftingSkill += 4
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Adamantium Dagger")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 4
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Daggers/AdamantiumDagger/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumWeaponCraft()
						M.MetalCraftingSkill += 4
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Adamantium Axe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 4
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Axes/AdamantiumAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumWeaponCraft()
						M.MetalCraftingSkill += 4
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Adamantium Mace")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 4
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Maces/AdamantiumMace/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumWeaponCraft()
						M.MetalCraftingSkill += 4
						M.weight -= S.weight
						del(S)
						break
						return
			if(Result2 == "Adamantium Spear")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 4
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Spears/AdamantiumSpear/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.AdamantiumWeaponCraft()
						M.MetalCraftingSkill += 4
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal OrcSword")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/GoblinSword/LB = new
						LB.loc = M.loc
						LB.name = "MetalOrcSword"
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Goblin Sword")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Swords/GoblinSword/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal PickAxe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Picks/PickAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal Dagger")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Daggers/MetalDagger/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal OrcAxe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Metal Axe")
				if(M in range(1,src))
					for(var/obj/Items/Ingots/IronIngot/S in M)
						var/fail
						fail = prob(M.MetalCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.MetalCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Axes/MetalAxe/LB = new
						LB.loc = M.loc
						if(M.MetalCraftingSkill >= 299)
							LB.CraftRank = "Supernatural Quality"
						if(M.MetalCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.MetalCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.MetalCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.MetalCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.MetalCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.MetalCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.MetalCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.MetalCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalWeaponCraft()
						if(M.Race == "Dwarf")
							LB.WeaponDamageMin += 1
							LB.WeaponDamageMax += 1
						M.MetalCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
