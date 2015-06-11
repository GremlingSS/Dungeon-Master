/mob/WorkShops/Carpentry
	name = "Carpentry"

/mob/WorkShops/Carpentry/Left
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopLeft"

/mob/WorkShops/Carpentry/Right
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopRight"

/mob/WorkShops/Carpentry/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
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
				M.DestroyCarpentryStation()
		if (Result == "Craft")
			var/list/menu2 = new()
			menu2 += "Wooden Spike"
			menu2 += "Necromancer's Staff"
			menu2 += "Staff"
			menu2 += "Wooden Cage"
			menu2 += "Wooden Door"
			menu2 += "Wooden Fence"
			menu2 += "Wooden Spear"
			menu2 += "Wooden Chair"
			menu2 += "Wooden Bucket"
			if(M.Race != "Lizardman")
				menu2 += "Wooden Spade"
			if(M.Race == "Elf")
				menu2 += "Full Wooden Armor"
				menu2 += "Wooden Pickaxe"
				menu2 += "Wooden Sword"
				menu2 += "Wooden Mace"
				menu2 += "Wooden Elf Spear"
				menu2 += "Wooden Elf Bow"
				menu2 += "Wooden Axe"
				menu2 += "Wooden Helmet"
				menu2 += "Wooden Chestplate"
				menu2 += "Wooden LeftArm"
				menu2 += "Wooden RightArm"
				menu2 += "Wooden Leggings"
			if(M.Race == "Svartalfar" || M.Intelligence >= 10)
				menu2 += "Paper"
			menu2 += "Wooden Wagon"
			menu2 += "Wooden Sign"
			menu2 += "Wooden Chest"
			menu2 += "Wooden Table"
			menu2 += "Wooden Training Post"
			menu2 += "Wooden Bow"
			menu2 += "Wooden Arrows"
			if(M.Race != "Goblin")
				if(M.Race != "Kobold")
					if(M.Race != "Vampire")
						if(M.Race != "Lizardman")
							menu2 += "Wooden Bed"
			if(M.Race != "Kobold")
				menu2 += "WoodenBuckler"
			if(M.Race == "Lizardman")
				menu2 += "Lizardman Shield"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "Paper")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						for(var/obj/Items/Shafts/WoodenBucket/S2 in M)
							if(S2.HasWater == "Water")
								var/fail
								fail = prob(M.WoodCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									del(S)
									break
									M.WoodCraftingSkill += 0.5
									return
								var/obj/Items/Shafts/MagicScroll/LB = new

								M.WoodCraftingSkill += 0.5
								M.weight -= S.weight
								LB.loc = M.loc
								del(S)
								S2.HasWater = null
								return
					usr << "You need one piece of wood and one wooden bucket full of water to make this."
			if (Result2 == "Wooden Spear")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Spears/WoodenSpear/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Sword")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Swords/WoodenSword/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Pickaxe")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Picks/WoodenPickAxe/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Mace")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Maces/WoodenMace/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Axe")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Axes/WoodenAxe/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Elf Spear")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Spears/ElfSpear/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Elf Bow")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Bows/ElfBow/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						LB.WeaponDamageMin += 10
						LB.WeaponDamageMax += 15
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Chair")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Furniture/Chairs/WoodenChair/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Staff")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.WoodCraftingSkill += 1
							del(S)
							break
							return
						var/obj/Items/Equipment/Weapon/Maces/Staff/LB = new
						LB.loc = M.loc
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Necromancer's Staff")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						if(M in range(1,src))
							for(var/obj/Items/Bones/Skull/S2 in M)
								var/fail
								fail = prob(M.WoodCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.WoodCraftingSkill += 1
									del(S)
									del(S2)
									break
									return
								var/obj/Items/Equipment/Weapon/Maces/NecroStaff/LB = new
								LB.loc = M.loc
								if(M.WoodCraftingSkill >= 90)
									LB.CraftRank = "Epic Quality"
								if(M.WoodCraftingSkill >= 100)
									LB.CraftRank = "Legendary Quality"
								if(M.WoodCraftingSkill <= 90)
									LB.CraftRank = "Epic Quality"
								if(M.WoodCraftingSkill <= 75)
									LB.CraftRank = "Masterful Quality"
								if(M.WoodCraftingSkill <= 60)
									LB.CraftRank = "Grand Quality"
								if(M.WoodCraftingSkill <= 50)
									LB.CraftRank = "Impressive Quality"
								if(M.WoodCraftingSkill <= 40)
									LB.CraftRank = "Quality"
								if(M.WoodCraftingSkill <= 30)
									LB.CraftRank = "Average Quality"
								if(M.WoodCraftingSkill <= 20)
									LB.CraftRank = "Poor Quality"

								LB.BoneWeaponCraft()
								M.WoodCraftingSkill += 1.5
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								return
			if (Result2 == "Wooden Bow")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill += 0.5
							return
						var/obj/Items/Equipment/Weapon/Bows/WoodenBow/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneWeaponCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Bucket")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill += 0.5
							break
							return
						var/obj/Items/Shafts/WoodenBucket/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Spade")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill += 0.5
							break
							return
						var/obj/Items/Shafts/WoodenSpade/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Table")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill+=1
							return
						var/obj/Items/Furniture/Tables/Table/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Arrows")
				if(M in range(1,src))
					var/XK = 0
					var/T = input("Amount?")as null|num
					if(!T)
						return
					else
						for(var/obj/Items/woods/wood/G in M)
							if(G in M)
								if(G.suffix == "(Carrying)")
									XK += 1
						if(XK <= T)
							M.CraftCount = XK
						else
							M.CraftCount = T
						for(var/obj/Items/woods/wood/S in M)
							if(M.CraftCount >= 1)
								var/fail
								fail = prob(M.WoodCraftingSkill*4)
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
												var/obj/Items/Arrows/WoodenArrow/LB = new
												LB.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB2 = new
												LB2.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB3 = new
												LB3.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB4 = new
												LB4.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB5 = new
												LB5.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB6 = new
												LB6.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB7 = new
												LB7.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB8 = new
												LB8.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB9 = new
												LB9.loc = L
												var/obj/Items/Arrows/WoodenArrow/LB10 = new
												LB10.loc = L
												M.WoodCraftingSkill += 1.5
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
												M.Owner << "This quiver has too many arrows in it!"
												return
								else
									M.Owner << "[M] - I've got no quiver to put arrows in!"
									return
							else
								M.CraftCount = 0
								return
			if (Result2 == "Wooden Training Post")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Furniture/Posts/WoodTrainingPost/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.TrainCraft()
						del(S)
						break
						return
			if (Result2 == "Wooden Chest")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/mob/Monsters/Chests/WoodenChest/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.Owner = M.Owner
						del(S)
						break
						return
			if (Result2 == "Wooden Spike")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.WoodCraftingSkill+=1
							return
						var/obj/Items/Traps/Spikes/WoodenSpike/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Sign")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Shafts/Sign/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Wagon")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/mob/Monsters/Chests/Wagon/LB = new
						LB.loc = M.loc
						LB.Owner = M.Owner
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Cage")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Traps/Cages/WoodenCage/LB = new
						LB.loc = M.loc
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Wooden Door")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Furniture/Doors/WoodenDoor/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.DoorCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Fence")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Furniture/Fences/WoodenFence/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.DoorCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Bed")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Furniture/Beds/WoodenBed/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.FurnitureCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "WoodenBuckler")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Shield/WoodenBuckler/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Chestplate")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Full Wooden Armor")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Leggings/WoodenLeggings/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/WoodenHelmet/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/WoodenRightGauntlet/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/WoodenLeftGauntlet/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Shield/WoodenBuckler/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
			if (Result2 == "Wooden RightArm")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/RightArm/WoodenRightGauntlet/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden LeftArm")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/LeftArm/WoodenLeftGauntlet/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Leggings")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Leggings/WoodenLeggings/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Wooden Helmet")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Helmet/WoodenHelmet/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.BoneArmourCraft()
						LB.Defence += 4
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Lizardman Shield")
				if(M in range(1,src))
					for(var/obj/Items/woods/wood/S in M)
						var/fail
						fail = prob(M.WoodCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.WoodCraftingSkill+=1
							break
							return
						var/obj/Items/Equipment/Armour/Shield/LizardShield/LB = new
						if(M.WoodCraftingSkill >= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill >= 100)
							LB.CraftRank = "Legendary Quality"
						if(M.WoodCraftingSkill <= 90)
							LB.CraftRank = "Epic Quality"
						if(M.WoodCraftingSkill <= 75)
							LB.CraftRank = "Masterful Quality"
						if(M.WoodCraftingSkill <= 60)
							LB.CraftRank = "Grand Quality"
						if(M.WoodCraftingSkill <= 50)
							LB.CraftRank = "Impressive Quality"
						if(M.WoodCraftingSkill <= 40)
							LB.CraftRank = "Quality"
						if(M.WoodCraftingSkill <= 30)
							LB.CraftRank = "Average Quality"
						if(M.WoodCraftingSkill <= 20)
							LB.CraftRank = "Poor Quality"
						LB.MetalArmourCraft()
						M.WoodCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
