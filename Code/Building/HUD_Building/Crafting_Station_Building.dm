/obj/HUD/Stations
	name = "Stations"
	icon_state = "Station"
	text = "C"

/obj/HUD/Stations/DblClick()
	usr.Stations()

/obj/HUD/ClickFire
	name = "Campfire"
	icon_state = "Fire"

/obj/HUD/ClickFire/DblClick()
	var/list/menu11 = new()
	menu11 += "Create"
	menu11 += "Info"
	menu11 += "Cancel"
	var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
	if (Result11 != "Cancel")
		..()
	if (Result11 == "Info")
		alert("This is a camp fire, it can be used to cook with, it will also provide heat during winter.")
		return
	if (Result11 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/woods/wood/W in M)
				var/mob/WorkShops/CampFires/Fire/F = new
				F.loc = M.loc
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickGem
	name = "Gem Station"
	icon_state = "Gem"

/obj/HUD/ClickGem/DblClick()
	var/list/menu3 = new()
	menu3 += "Create"
	menu3 += "Info"
	menu3 += "Cancel"
	var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
	if (Result3 != "Cancel")
		..()
	if (Result3 == "Info")
		alert("This is a gem crafting station, it can be used to craft un-cut gems into something more intresting")
		return
	if (Result3 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race != "Kobold")
				for(var/mob/WorkShops/LW in view(1,M))

					usr.Close()
					return
				for(var/obj/Items/ores/stone/W in M)
					M.CreateGem()
					M.weight -= W.weight
					del(W)
					break
		usr.Close()

/obj/HUD/ClickMelt
	name = "Melter Station"
	icon_state = "Melt"

/obj/HUD/ClickMelt/DblClick()
	var/list/menu3 = new()
	menu3 += "Create"
	menu3 += "Info"
	menu3 += "Cancel"
	var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
	if (Result3 != "Cancel")
		..()
	if (Result3 == "Info")
		alert("This is a melter station, it can be used to destroy un-used items.")
		return
	if (Result3 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/ores/stone/W in M)
				M.CreateMelter()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickMas
	name = "Masonry Station"
	icon_state = "Mas"

/obj/HUD/ClickMas/DblClick()
	var/list/menu3 = new()
	menu3 += "Create"
	menu3 += "Info"
	menu3 += "Cancel"
	var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
	if (Result3 != "Cancel")
		..()
	if (Result3 == "Info")
		alert("This is a masonary station, it can be used to make stone items and statues")
		return
	if (Result3 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/ores/stone/W in M)
				M.CreateMasonary()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickLet
	name = "Leather Station"
	icon_state = "Let"

/obj/HUD/ClickLet/DblClick()
	var/list/menu3 = new()
	menu3 += "Create"
	menu3 += "Info"
	menu3 += "Cancel"
	var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
	if (Result3 != "Cancel")
		..()
	if (Result3 == "Info")
		alert("This is a leather crafting station, it can be used to make leather armour, sheets and clothes")
		return
	if (Result3 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/woods/wood/W in M)
				M.CreateWorkShopLeather()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickKit
	name = "Kitchen"
	icon_state = "Kit"

/obj/HUD/ClickKit/DblClick()
	var/list/menu11 = new()
	menu11 += "Create"
	menu11 += "Info"
	menu11 += "Cancel"
	var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
	if (Result11 != "Cancel")
		..()
	if (Result11 == "Info")
		alert("This is a kitchen, take un-cooked meat here to cook it.")
		return
	if (Result11 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Carn == 0)
				for(var/mob/WorkShops/LW in view(1,M))

					usr.Close()
					return
				for(var/obj/Items/woods/wood/W in M)
					M.CreateKit()
					M.weight -= W.weight
					del(W)
					break
			else
				usr << "That race does not need to cook food!"
		usr.Close()

/obj/HUD/ClickBone
	name = "Bonecrafting Station"
	icon_state = "Bone"

/obj/HUD/ClickBone/DblClick()
	for(var/mob/Monsters/M2 in usr.Selected)
		var/list/menu7 = new()
		menu7 += "Create"
		menu7+= "Info"
		menu7 += "Cancel"
		var/Result7 = input("What Action Will You Choose?", "Choose", null) in menu7
		if (Result7 != "Cancel")
			..()
		if (Result7 == "Info")
			alert("This is a Bone crafting station, it can be used to create bone crafts, weapons and armours")
			usr.Close()
			return
		if (Result7 == "Create")
			for(var/mob/Monsters/M in usr.Selected)
				for(var/mob/WorkShops/LW in view(1,M))

					return
				for(var/obj/Items/woods/wood/W in M)
					M.CreateBone()
					M.weight -= W.weight
					del(W)
					break
			usr.Close()

/obj/HUD/ClickSmelt
	name = "Smelter Station"
	icon_state = "Smelt"

/obj/HUD/ClickSmelt/DblClick()
	var/list/menu5 = new()
	menu5 += "Create"
	menu5 += "Info"
	menu5 += "Cancel"
	var/Result5 = input("What Action Will You Choose?", "Choose", null) in menu5
	if (Result5 != "Cancel")
		..()
	if (Result5 == "Info")
		alert("This is a smelter  station, it can be used to create Ingots for armour and weapon creation or to create glass bottles out of sand.")
		return
	if (Result5 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/ores/stone/W in M)
				M.CreateSmelter()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickForge
	name = "Metalcrafting Station"
	icon_state = "Forge"

/obj/HUD/ClickForge/DblClick()
	var/list/menu6 = new()
	menu6 += "Create"
	menu6+= "Info"
	menu6 += "Cancel"
	var/Result6 = input("What Action Will You Choose?", "Choose", null) in menu6
	if (Result6 != "Cancel")
		..()
	if (Result6 == "Info")
		alert("This is a forge  station, it can be used to create armour and weapons")
		return
	if (Result6 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/ores/stone/W in M)
				M.CreateForge()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickCarp
	name = "Carpentry Station"
	icon_state = "Carp"

/obj/HUD/ClickCarp/DblClick()
	var/list/menu4 = new()
	menu4 += "Create"
	menu4 += "Info"
	menu4 += "Cancel"
	var/Result4 = input("What Action Will You Choose?", "Choose", null) in menu4
	if (Result4 != "Cancel")
		..()
	if (Result4 == "Info")
		alert("This is a carpentry crafting station, it can be used to make lots of items from wood")
		return
	if (Result4 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))

				usr.Close()
				return
			for(var/obj/Items/woods/wood/W in M)
				M.CreateCarpentry()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

/obj/HUD/ClickPotion
	name = "Meth Lab"
	icon_state = "Potion"

/obj/HUD/ClickPotion/DblClick()
	for(var/mob/Monsters/S in usr.Selected)
		var/list/menu3 = new()
		if(S.Race == "Human")
			menu3 += "Create"
		if(S.Race == "Goblin")
			menu3 += "Create"
		if(S.Race == "Svartalfar")
			menu3 += "Create"
		menu3 += "Info"
		menu3 += "Cancel"
		var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
		if (Result3 != "Cancel")
			..()
		if (Result3 == "Info")
			alert("This is a potion station, it can be used to make various potions.")
			return
		if (Result3 == "Create")
			for(var/mob/Monsters/M in usr.Selected)
				for(var/mob/WorkShops/LW in view(1,M))

					usr.Close()
					return
				for(var/obj/Items/woods/wood/W in M)
					M.CreatePotion()
					M.weight -= W.weight
					del(W)
					break
			usr.Close()

/obj/HUD/ClickPos
	name = "Poison Station"
	icon_state = "Pos"

/obj/HUD/ClickPos/DblClick()
	var/list/menu8 = new()
	menu8 += "Create"
	menu8 += "Info"
	menu8 += "Cancel"
	var/Result8= input("What Action Will You Choose?", "Choose", null) in menu8
	if (Result8 != "Cancel")
		..()
	if (Result8 == "Info")
		alert("This is a posion extraction station, it can be used to extract posion from glands")
		return
	if (Result8 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/mob/WorkShops/LW in view(1,M))
				usr.Close()
				return
			for(var/obj/Items/woods/wood/W in M)
				M.CreatePoison()
				M.weight -= W.weight
				del(W)
				break
		usr.Close()

