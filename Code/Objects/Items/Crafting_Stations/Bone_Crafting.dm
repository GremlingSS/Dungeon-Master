/mob/WorkShops/BoneCraft
	name = "Bonecrafting Station"

/mob/WorkShops/BoneCraft/Left
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopLeft"

/mob/WorkShops/BoneCraft/Right
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopRight"

/mob/WorkShops/BoneCraft/DblClick()
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
				M.DestroyBone()
		if (Result == "Craft")
			var/list/menu2 = new()
			if(M.UsesPoison)
				menu2 += "Full Bone Armor"
				menu2 += "BoneSpear"
				menu2 += "BoneAxe"
				menu2 += "BoneDagger"
				menu2 += "BoneHelmet"
				menu2 += "BoneChestPlate"
				menu2 += "BoneLeggings"
				menu2 += "BoneLeftGauntlet"
				menu2 += "BoneRightGauntlet"
				menu2 += "BoneCage"
				menu2 += "Bone Door"
				menu2 += "BoneBuckler"
				menu2 += "Bone Training Post"
				menu2 += "BoneCrown"
				menu2 += "Bone Throne"
				menu2 += "Bone Sword"
				menu2 += "Skull Mace"
				menu2 += "Bone Bow"
				menu2 += "Bone Arrows"
				if(Race != "Orc")
					menu2 += "LockPick"
					menu2 += "Full Chitin Armor"
					menu2 += "ChitinHelmet"
					menu2 += "ChitinChestPlate"
					menu2 += "ChitinLeggings"
					menu2 += "ChitinBuckler"
					menu2 += "ChitinLeftGauntlet"
					menu2 += "ChitinRightGauntlet"
					menu2 += "ChitinSpear"
					menu2 += "ChitinSword"
					menu2 += "ChitinAxe"
					menu2 += "ChitinDagger"
					menu2 += "ChitinMace"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "Bone Throne")
				if(M in range(1,src))
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
				if(M in range(1,src))
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
				if(M in range(1,src))
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
				if(M in range(1,src))
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
			if (Result2 == "Bone Arrows")
				if(M in range(1,src))
					var/XK = 0
					var/T = input("Amount?")as null|num
					if(!T)
						return
					else
						for(var/obj/Items/Bones/Bones/G in M)
							if(G in M)
								if(G.suffix == "(Carrying)")
									XK += 1
						if(XK <= T)
							M.CraftCount = XK
						else
							M.CraftCount = T
					for(var/obj/Items/Bones/Bones/S in M)
						if(M.CraftCount >= 1)
							var/fail
							fail = prob(M.BoneCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								break
								M.BoneCraftingSkill += 0.25
								return
							if(M.WearingBack)
								for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
									if(L.suffix == "(Equipped)")
										if(L.Content <= 250)
											var/obj/Items/Arrows/BoneArrow/LB = new
											LB.loc = L
											var/obj/Items/Arrows/BoneArrow/LB2 = new
											LB2.loc = L
											var/obj/Items/Arrows/BoneArrow/LB3 = new
											LB3.loc = L
											var/obj/Items/Arrows/BoneArrow/LB4 = new
											LB4.loc = L
											var/obj/Items/Arrows/BoneArrow/LB5 = new
											LB5.loc = L
											var/obj/Items/Arrows/BoneArrow/LB6 = new
											LB6.loc = L
											var/obj/Items/Arrows/BoneArrow/LB7 = new
											LB7.loc = L
											var/obj/Items/Arrows/BoneArrow/LB8 = new
											LB8.loc = L
											var/obj/Items/Arrows/BoneArrow/LB9 = new
											LB9.loc = L
											var/obj/Items/Arrows/BoneArrow/LB10 = new
											LB10.loc = L
											M.BoneCraftingSkill += 1.5
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
								M.Owner << "[M] - I,ve got no quiver to put arrows in!"
								return
						else
							M.CraftCount = 0
							return

			if (Result2 == "BoneCage")
				if(M in range(1,src))
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
						var/obj/Items/Traps/Cages/BoneCage/LB = new
						LB.desc = "This is a bone cage, it can be used to capture creatures in"
						LB.FurnitureCraft()
						LB.loc = M.loc
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Bone Bow")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Weapon/Bows/BoneBow/LB = new
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
			if (Result2 == "BoneDagger")
				if(M in range(1,src))
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
				if(M in range(1,src))
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
						LB.loc = M.loc
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "ChitinAxe")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Weapon/Axes/ChitinAxe/LB = new
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
			if (Result2 == "ChitinMace")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Weapon/Maces/ChitinMace/LB = new
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
			if (Result2 == "ChitinDagger")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Weapon/Daggers/ChitinDagger/LB = new
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
				if(M in range(1,src))
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
				if(M in range(1,src))
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
				if(M in range(1,src))
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
			if (Result2 == "ChitinSpear")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Weapon/Spears/ChitinSpear/LB = new
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
						M.BoneCraftingSkill += 0.75
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "ChitinSword")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Weapon/Swords/ChitinSword/LB = new
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
						M.BoneCraftingSkill += 0.75
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "ChitinLeftGauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Armour/LeftArm/ChitinLeftGauntlet/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Supernatural Bone Leggings")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Armour/Leggings/SupernaturalBoneLeggings/LB = new
						LB.Defence = 40
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Supernatural Bone Chestplate")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Armour/Chestplate/SupernaturalBoneChestPlate/LB = new
						LB.Defence = 40
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Supernatural Bone Helmet")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Armour/Helmet/SupernaturalBoneHelmet/LB = new
						LB.Defence = 20
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Supernatural Bone LeftArm")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Armour/LeftArm/SupernaturalBoneLeftGauntlet/LB = new
						LB.Defence = 20
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Supernatural Bone RightArm")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Armour/RightArm/SupernaturalBoneRightGauntlet/LB = new
						LB.Defence = 20
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "ChitinRightGauntlet")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Armour/RightArm/ChitinRightGauntlet/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "ChitinBuckler")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Armour/Shield/ChitinBuckler/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "ChitinLeggings")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Armour/Leggings/ChitinLeggings/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "BoneRightGauntlet")
				if(M in range(1,src))
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
				if(M in range(1,src))
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
				if(M in range(1,src))
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
			if (Result2 == "ChitinChestPlate")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Armour/Chestplate/ChitinChestPlate/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "Full Chitin Armor")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							M.BoneCraftingSkill += 0.25
							del(S)
							break
						var/obj/Items/Equipment/Armour/Chestplate/ChitinChestPlate/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						LB.WeaponDamageMin = rand(1,3)
						LB.WeaponDamageMax = rand(3,6)
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
					for(var/obj/Items/Bones/Shell/S2 in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S2.weight
							M.BoneCraftingSkill += 0.25
							del(S2)
							break
						var/obj/Items/Equipment/Armour/Leggings/ChitinLeggings/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						LB.WeaponDamageMin = rand(1,3)
						LB.WeaponDamageMax = rand(3,6)
						M.weight -= S2.weight
						LB.loc = M.loc
						del(S2)
						break
					for(var/obj/Items/Bones/Shell/S3 in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S3.weight
							M.BoneCraftingSkill += 0.25
							del(S3)
							break
						var/obj/Items/Equipment/Armour/LeftArm/ChitinLeftGauntlet/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						LB.WeaponDamageMin = rand(1,3)
						LB.WeaponDamageMax = rand(3,6)
						M.weight -= S3.weight
						LB.loc = M.loc
						del(S3)
						break
					for(var/obj/Items/Bones/Shell/S4 in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S4.weight
							M.BoneCraftingSkill += 0.25
							del(S4)
							break
						var/obj/Items/Equipment/Armour/RightArm/ChitinRightGauntlet/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						LB.WeaponDamageMin = rand(1,3)
						LB.WeaponDamageMax = rand(3,6)
						M.weight -= S4.weight
						LB.loc = M.loc
						del(S4)
						break
					for(var/obj/Items/Bones/Shell/S5 in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S5.weight
							M.BoneCraftingSkill += 0.25
							del(S5)
							break
						var/obj/Items/Equipment/Armour/Helmet/ChitinHelmet/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						LB.WeaponDamageMin = rand(1,3)
						LB.WeaponDamageMax = rand(3,6)
						M.weight -= S5.weight
						LB.loc = M.loc
						del(S5)
						break
					for(var/obj/Items/Bones/Shell/S5 in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S5.weight
							M.BoneCraftingSkill += 0.25
							del(S5)
							break
						var/obj/Items/Equipment/Armour/Shield/ChitinBuckler/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						LB.WeaponDamageMin = rand(1,3)
						LB.WeaponDamageMax = rand(3,6)
						M.weight -= S5.weight
						LB.loc = M.loc
						del(S5)
						break
			if (Result2 == "Full Bone Armor")
				if(M in range(1,src))
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
					for(var/obj/Items/Bones/Bones/S4 in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S4.weight
							M.BoneCraftingSkill += 0.25
							del(S4)
							break
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
				if(M in range(1,src))
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
				if(M in range(1,src))
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
			if (Result2 == "ChitinHelmet")
				if(M in range(1,src))
					for(var/obj/Items/Bones/Shell/S in M)
						var/fail
						fail = prob(M.BoneCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.BoneCraftingSkill += 0.25
							return
						var/obj/Items/Equipment/Armour/Helmet/ChitinHelmet/LB = new
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
						LB.MetalArmourCraft()
						M.BoneCraftingSkill += 0.25
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "BoneCrown")
				if(M in range(1,src))
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
						var/obj/Items/Equipment/Armour/Crown/Bone/LB = new
						M.BoneCraftingSkill += 0.5
						M.weight -= S.weight
						LB.loc = M.loc
						del(S)
						break
						return
			if (Result2 == "BoneHelmet")
				if(M in range(1,src))
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
