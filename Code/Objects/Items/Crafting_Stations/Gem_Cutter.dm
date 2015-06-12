/mob/WorkShops/GemCutter
	name = "Gem Cutter"

/mob/WorkShops/GemCutter/Left
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopLeft2"

/mob/WorkShops/GemCutter/Right
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopRight2"

/mob/WorkShops/GemCutter/DblClick()
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
				M.DestroyGem()
		if (Result == "Craft")
			var/list/menu2 = new()
			menu2 += "CutEmerald"
			menu2 += "CutRuby"
			menu2 += "CutDiamond"
			menu2 += "FlawlessCutEmerald"
			menu2 += "FlawlessCutRuby"
			menu2 += "FlawlessCutDiamond"
			menu2 += "Silver Ruby Ring"
			menu2 += "Silver Diamond Ring"
			menu2 += "Silver Emerald Ring"
			menu2 += "Gold Ruby Ring"
			menu2 += "Gold Diamond Ring"
			menu2 += "Gold Emerald Ring"
			menu2 += "Plant Fibre Ring"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "CutEmerald")
				if(M in range(1,src))
					for(var/obj/Items/gems/UnCutEmerald/S in M)
						var/fail
						fail = prob(M.JewlCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.JewlCraftingSkill+=2
							break
							return
						var/obj/Items/gems/Emerald/LB = new
						LB.loc = M.loc
						M.JewlCraftingSkill += 1
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "FlawlessCutEmerald")
				if(M in range(1,src))
					for(var/obj/Items/gems/UnCutEmerald/S in M)
						var/fail
						fail = prob(M.JewlCraftingSkill/2)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.JewlCraftingSkill+=2
							break
							return
						var/obj/Items/gems/Emerald/LB = new
						LB.loc = M.loc
						LB.Content = "Flawless"
						LB.name = "Flawless Emerald"
						M.JewlCraftingSkill += 1
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "CutRuby")
				if(M in range(1,src))
					for(var/obj/Items/gems/UnCutRuby/S in M)
						var/fail
						fail = prob(M.JewlCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.JewlCraftingSkill+=2
							break
							return
						var/obj/Items/gems/Ruby/LB = new
						LB.loc = M.loc
						M.JewlCraftingSkill += 1
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "FlawlessCutRuby")
				if(M in range(1,src))
					for(var/obj/Items/gems/UnCutRuby/S in M)
						var/fail
						fail = prob(M.JewlCraftingSkill/2)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.JewlCraftingSkill+=2
							break
							return
						var/obj/Items/gems/Ruby/LB = new
						LB.loc = M.loc
						LB.Content = "Flawless"
						LB.name = "Flawless Ruby"
						M.JewlCraftingSkill += 1
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "FlawlessCutDiamond")
				if(M in range(1,src))
					for(var/obj/Items/gems/UnCutDiamond/S in M)
						var/fail
						fail = prob(M.JewlCraftingSkill/2)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							M.JewlCraftingSkill+=2
							break
							return
						var/obj/Items/gems/Diamond/LB = new
						LB.loc = M.loc
						LB.Content = "Flawless"
						LB.name = "Flawless Diamond"
						M.JewlCraftingSkill += 1
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "CutDiamond")
				if(M in range(1,src))
					for(var/obj/Items/gems/UnCutDiamond/S in M)
						var/fail
						fail = prob(M.JewlCraftingSkill*4)
						if(fail == 0)
							usr<< "Failed!"
							M.weight -= S.weight
							del(S)
							break
							M.JewlCraftingSkill+=2
							return
						var/obj/Items/gems/Diamond/LB = new
						LB.loc = M.loc
						M.JewlCraftingSkill += 1
						M.weight -= S.weight
						del(S)
						break
						return
			if (Result2 == "Silver Ruby Ring")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/S in M)
						for(var/obj/Items/Ingots/SilverIngot/S2 in M)
							var/fail
							fail = prob(M.JewlCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								M.JewlCraftingSkill+=2
								return
							var/obj/Items/gems/RubyRing/LB = new
							LB.loc = M.loc
							LB.icon_state = "Silver Ruby Ring"
							M.JewlCraftingSkill += 1
							M.weight -= S.weight
							M.weight -= S2.weight
							del(S)
							del(S2)
							break
							return
			if (Result2 == "Silver Diamond Ring")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/S in M)
						for(var/obj/Items/Ingots/SilverIngot/S2 in M)
							var/fail
							fail = prob(M.JewlCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								M.JewlCraftingSkill+=2
								return
							var/obj/Items/gems/DiamondRing/LB = new
							LB.loc = M.loc
							LB.icon_state = "Silver Diamond Ring"
							M.JewlCraftingSkill += 1
							M.weight -= S.weight
							M.weight -= S2.weight
							del(S)
							del(S2)
							break
							return
			if (Result2 == "Silver Emerald Ring")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/S in M)
						for(var/obj/Items/Ingots/SilverIngot/S2 in M)
							var/fail
							fail = prob(M.JewlCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								M.JewlCraftingSkill+=2
								return
							var/obj/Items/gems/EmeraldRing/LB = new
							LB.loc = M.loc
							LB.icon_state = "Silver Emerald Ring"
							M.JewlCraftingSkill += 1
							M.weight -= S.weight
							M.weight -= S2.weight
							del(S)
							del(S2)
							break
							return
			if (Result2 == "Gold Ruby Ring")
				if(M in range(1,src))
					for(var/obj/Items/gems/Ruby/S in M)
						if(S.Content == "Flawless")
							for(var/obj/Items/Ingots/GoldIngot/S2 in M)
								var/fail
								fail = prob(M.JewlCraftingSkill)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.weight -= S2.weight
									del(S)
									del(S2)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/RubyRing/LB = new
								LB.loc = M.loc
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								return
			if (Result2 == "Gold Diamond Ring")
				if(M in range(1,src))
					for(var/obj/Items/gems/Diamond/S in M)
						if(S.Content == "Flawless")
							for(var/obj/Items/Ingots/GoldIngot/S2 in M)
								var/fail
								fail = prob(M.JewlCraftingSkill)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.weight -= S2.weight
									del(S)
									del(S2)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/DiamondRing/LB = new
								LB.loc = M.loc
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								return
			if (Result2 == "Gold Emerald Ring")
				if(M in range(1,src))
					for(var/obj/Items/gems/Emerald/S in M)
						if(S.Content == "Flawless")
							for(var/obj/Items/Ingots/GoldIngot/S2 in M)
								var/fail
								fail = prob(M.JewlCraftingSkill)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.weight -= S2.weight
									del(S)
									del(S2)
									break
									M.JewlCraftingSkill+=2
									return
								var/obj/Items/gems/EmeraldRing/LB = new
								LB.loc = M.loc
								M.JewlCraftingSkill += 1
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								return
			if (Result2 == "Plant Fibre Ring")
				if(M in range(1,src))
					for(var/obj/Items/Glands/PoisonRoots/S in M)
						for(var/obj/Items/Ingots/GoldIngot/S2 in M)
							var/fail
							fail = prob(M.JewlCraftingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								M.weight -= S2.weight
								del(S)
								del(S2)
								break
								M.JewlCraftingSkill+=2
								return
							var/obj/Items/gems/PlantFibreRing/LB = new
							LB.loc = M.loc
							M.JewlCraftingSkill += 1
							M.weight -= S.weight
							M.weight -= S2.weight
							del(S)
							del(S2)
							break
						return
