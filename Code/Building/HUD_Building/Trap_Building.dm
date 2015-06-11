/obj/HUD/SpiderTrap
	name = "Pit"
	icon_state = "Trap"
	text = "P"

/obj/HUD/SpiderTrap/DblClick()
	var/list/menu10 = new()
	menu10 += "Create"
	menu10 += "CoverPit"
	menu10 += "Disarm Trap"
	menu10 += "Info"
	menu10 += "Cancel"
	var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
	if (Result10 != "Cancel")
		..()
	if (Result10 == "Info")
		alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly")
		usr.Up = 0
		usr.Close()
		return
	if (Result10 == "CoverPit")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/PitTrap/T in view(0,M))
				T.icon = null
				T.Hole = 1
			usr.Up = 0
			usr.Close()
	if (Result10 == "Disarm Trap")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/T in view(0,M))
				del(T)
				usr << "Dis-armed"
				usr.Up = 0
				usr.Close()
	if (Result10 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
				usr << "Too close to other trap!"
				return
			if(M.WebContent >= 50)
				M.CreatePit()
				M.WebContent -= 50
				usr.Up = 0
				usr.Close()

/obj/HUD/Traps
	name = "Traps"
	icon_state = "Trap"
	text = "T"

/obj/HUD/Traps/DblClick()
	usr.Traps()

/obj/HUD/ClickCacoonTrap
	name = "CacoonTrap"
	icon_state = "DevourerCacoonTrap"
	text = "C"

/obj/HUD/ClickCacoonTrap/DblClick()
	var/list/menu10 = new()
	menu10 += "Create"
	menu10 += "Disarm"
	menu10 += "Info"
	menu10 += "Cancel"
	var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
	if (Result10 != "Cancel")
		..()
	if (Result10 == "Info")
		alert("This is a cacoon trap, it will release monsters to attack anyone who walks near it.")
		usr.Up = 0
		usr.Close()
		return
	if (Result10 == "Disarm Trap")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/T in view(0,M))
				del(T)
				view() << "[M] Dis-armed trap"
		usr.Up = 0
		usr.Close()
	if (Result10 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Devourer")
				for(var/obj/Items/Traps/LW in oview(0,M))
					usr << "Too close to other trap!"
					usr.Up = 0
					usr.Close()
					return
				for(var/mob/Monsters/MM in oview(1,M))
					usr << "Cannot place so close to another unit."
					usr.Up = 0
					usr.Close()
					return
				if(M.EggContent >= 1)
					M.CreateCacoonTrap()
					M.EggContent -= 1
					usr.Close()
					break
		usr.Up = 0
		usr.Close()

/obj/HUD/ClickBSTTrap
	name = "Bonespikes"
	icon_state = "BST"
	text = "B"

/obj/HUD/ClickBSTTrap/DblClick()
	var/list/menu10 = new()
	menu10 += "Create"
	menu10 += "Disarm Trap"
	menu10 += "Info"
	menu10 += "Cancel"
	var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
	if (Result10 != "Cancel")
		..()
	if (Result10 == "Info")
		alert("This is a rib spike trap, it will hurt anyone who walks over it.")
		usr.Up = 0
		usr.Close()
		return
	if (Result10 == "Disarm Trap")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/T in view(0,M))
				del(T)
				view() << "[M] Dis-armed trap"
		usr.Up = 0
		usr.Close()
	if (Result10 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Kobold" || M.Race == "Goblin" || M.Race == "Ratman")
				for(var/obj/Items/Bones/Bones/W in M)
					usr.Function = "PlaceBoneSpikes"
					usr << "Click and drag to place bonespikes"
					usr.Up = 0
					usr.Close()
					return
				usr << "You need bones to place bonespikes."
		usr.Up = 0
		usr.Close()

/obj/HUD/ClickRibTrap
	name = "Ribtrap"
	icon_state = "RibTrap"
	text = "R"

/obj/HUD/ClickRibTrap/DblClick()
	var/list/menu10 = new()
	menu10 += "Create"
	menu10 += "Disarm Trap"
	menu10 += "Info"
	menu10 += "Cancel"
	var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
	if (Result10 != "Cancel")
		..()
	if (Result10 == "Info")
		alert("This is a rib trap, it will crush anyone who walks into it.")
		usr.Up = 0
		usr.Close()
		return
	if (Result10 == "Disarm Trap")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/T in view(0,M))
				del(T)
				view() << "[M] Dis-armed trap"
		usr.Up = 0
		usr.Close()
	if (Result10 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Race == "Kobold" || M.Race == "Goblin" || M.Race == "Ratman")
				for(var/obj/Items/Bones/Bones/W in M)
					usr.Function = "PlaceRibcage"
					usr << "Click and drag to place ribcages"
					usr.Up = 0
					usr.Close()
					return
				usr << "You need bones to place bonespikes."
		usr.Up = 0
		usr.Close()

/obj/HUD/ClickStoneFall
	name = "Stonefall"
	icon_state = "StoneFall"
	text = "S"

/obj/HUD/ClickStoneFall/DblClick()
	var/list/menu10 = new()
	menu10 += "Create"
	menu10 += "Disarm Trap"
	menu10 += "Info"
	menu10 += "Cancel"
	var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
	if (Result10 != "Cancel")
		..()
	if (Result10 == "Info")
		alert("This is a stone fall trap, it will fall on anyone who nears it.")
		usr.Up = 0
		usr.Close()
		return
	if (Result10 == "Disarm Trap")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/T in view(0,M))
				del(T)
				view() << "[M] Dis-armed trap"
		usr.Up = 0
		usr.Close()
	if (Result10 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/ores/stone/W in M)
				usr.Function = "PlaceStoneFall"
				usr << "Click and drag to place stonefalls"
				usr.Up = 0
				usr.Close()
				return
		usr.Up = 0
		usr.Close()

/obj/HUD/ClickTraps
	name = "Pit"
	icon_state = "Trap"
	text = "P"

/obj/HUD/ClickTraps/DblClick()
	var/list/menu10 = new()
	menu10 += "Create"
	menu10 += "CoverPit"
	menu10 += "Disarm Trap"
	menu10 += "Info"
	menu10 += "Cancel"
	var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
	if (Result10 != "Cancel")
		..()
	if (Result10 == "Info")
		alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly, or even add some posion to it")
		usr.Up = 0
		usr.Close()
		return
	if (Result10 == "CoverPit")
		for(var/mob/Monsters/M in usr.Selected) for(var/obj/Items/Traps/PitTrap/T in view(0,M))
			T.icon = null
			T.Hole = 1
		usr.Up = 0
		usr.Close()
	if (Result10 == "Disarm Trap")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/T in view(0,M))
				del(T)
				usr << "Dis-armed"
		usr.Up = 0
		usr.Close()
	if (Result10 == "Create")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
				usr << "Too close to other trap!"
				usr.Up = 0
				usr.Close()
				return
			if(M.Race != "Lizardman")
				for(var/obj/Items/ores/stone/W in M)
					M.CreatePit()
					M.weight -= W.weight
					del(W)
					break
			if(M.Race == "Lizardman")
				for(var/obj/Items/woods/wood/W in M)
					M.CreatePit()
					M.weight -= W.weight
					del(W)
					break
		usr.Up = 0
		usr.Close()
