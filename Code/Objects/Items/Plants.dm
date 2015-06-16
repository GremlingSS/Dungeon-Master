/obj/Items/Plants
	suffix = "Stuck"

/obj/Items/Plants/New()
	TomatoDecay()

/obj/Items/Plants/GrapeVine
	icon = 'Cave.dmi'
	icon_state = "PPlant1"
	Content3 = "Grape"
	weight = 10
	Content = 5
	desc = "This is a grape vine plant."

/obj/Items/Plants/GrapeVine/New()
	src.PlantRegen()

/obj/Items/Plants/GrapeVine/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in view(1,M))
			if(M)



				var/list/menu = new()
				menu += "Inspect"
				menu += "Pick"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc

				if (Result == "Pick")
					if(src.Content >= 0)
						src.Content -= 1
						var/obj/Items/Food/Grape/T = new
						T.loc = M.loc
						if(src.Content >= 1)
							src.icon_state = "PPlant5"
						if(src.Content >= 2)
							src.icon_state = "PPlant4"
						if(src.Content >= 3)
							src.icon_state = "PPlant3"
						if(src.Content >= 4)
							src.icon_state = "PPlant2"
						if(src.Content <= 0)
							for(var/turf/e in view(0,src))
								e.HasPlantIn = 0
							del(src)
							return

/obj/Items/Plants/GarlicPlant
	icon = 'Cave.dmi'
	icon_state = "Garlic Plant"
	weight = 10
	Content = 0
	desc = "This is a garlic plant."

/obj/Items/Plants/GarlicPlant/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in view(1,M))
			if(M)
				var/list/menu = new()
				menu += "Inspect"
				menu += "Pick"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc

				if (Result == "Pick")
					if(src.Content >= 0)
						src.Content -= 1
						var/obj/Items/Seeds/Garlic/G = new
						G.loc = M.loc
					else
						var/obj/Items/Seeds/Garlic/G = new
						G.loc = M.loc
						del(src)

/obj/Items/Plants/TomatoPlant
	icon = 'Cave.dmi'
	icon_state = "Plant1"
	Content3 = "Tomato"
	weight = 10
	Content = 5
	desc = "This is a tomato plant."

/obj/Items/Plants/TomatoPlant/New()
	src.PlantRegen()

/obj/Items/Plants/TomatoPlant/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in view(1,M))
			if(M)
				var/list/menu = new()
				menu += "Inspect"
				menu += "Pick"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc

				if (Result == "Pick")
					if(src.Content >= 0)
						src.Content -= 1
						var/obj/Items/Food/Tomato/T = new
						T.loc = M.loc
						if(src.Content >= 1)
							src.icon_state = "Plant5"

						if(src.Content >= 2)
							src.icon_state = "Plant4"

						if(src.Content >= 3)
							src.icon_state = "Plant3"
						if(src.Content >= 4)
							src.icon_state = "Plant2"
						if(src.Content <= 0)
							for(var/turf/e in view(0,src))
								e.HasPlantIn = 0
							del(src)
							return



/obj/Items/Seeds

/obj/Items/Seeds/New()
	ItemDecay()

/obj/Items/Seeds/Garlic
	icon = 'Farm Items.dmi'
	icon_state = "Garlic"
	weight = 2
	suffix = null
	desc = "This is garlic, it can be used for alchemy or eaten as food"

/obj/Items/Seeds/Garlic/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			var/obj/A = src
			A.loc = M
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			menu += "Plant"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return
			if (Result == "Plant")
				if(src.suffix == "(Carrying)")
					for(var/turf/T in view(0,M))
						if(T.icon_state == "FarmLand")
							if(T.HasPlantIn == 0)
								for(var/obj/Items/Seeds/S in M.loc)
									if(S != src)
										usr << "Cant plant too many seeds in one area!"
										return
								var/obj/A1 = src
								A1.loc = M.loc
								A1.suffix = "(Planted)"
								M.weight -= A1.weight
								A1.icon_state = ""
								A1.GarlicGrow()
								return

/obj/Items/Seeds/PoisonSporeSeed
	icon = 'Cave.dmi'
	icon_state = "TowerCapSeed"
	weight = 2
	suffix = null
	desc = "This is a posion plant seed, it can be planted in swamps only."

/obj/Items/Seeds/PoisonSporeSeed/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)


				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Plant"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Plant")
					if(src.suffix == "(Carrying)")
						for(var/turf/T in view(0,M))
							if(T.Content == "Marsh")
								var/obj/A1 = src
								A1.loc = M.loc
								A1.suffix = "(Planted)"
								M.weight -= A1.weight
								A1.icon_state = ""
								A1.PoisonSporeGrow()
								return

/obj/Items/Seeds/CarnivorousPlantSeed
	icon = 'Cave.dmi'
	icon_state = "TowerCapSeed"
	weight = 2
	suffix = null
	desc = "This is a Carnivorous plant seed, it can be planted in swamps only."

/obj/Items/Seeds/CarnivorousPlantSeed/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)


				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Plant"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Plant")
					if(src.suffix == "(Carrying)")
						for(var/obj/Items/Seeds/S in M.loc)
							if(S != src)
								usr << "Cant plant too many seeds in one area!"
								return
						for(var/turf/T in view(0,M))
							if(T.Content == "Marsh")
								var/obj/A1 = src
								A1.loc = M.loc
								A1.suffix = "(Planted)"
								M.weight -= A1.weight
								A1.icon_state = ""
								A1.CarnGrow()
								return

/obj/Items/Seeds/TreeSeed
	icon = 'Cave.dmi'
	icon_state = "TowerCapSeed"
	weight = 2
	suffix = null
	desc = "This is a tree seed, it can be planted out side only."

/obj/Items/Seeds/TreeSeed/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)


				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Plant"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Plant")
					if(src.suffix == "(Carrying)")
						for(var/turf/T in view(0,M))
							for(var/obj/Items/Seeds/S in M.loc)
								if(S != src)
									usr << "Cant plant too many seeds in one area!"
									return
							if(T.icon_state == "Grass")
								var/obj/A1 = src
								A1.loc = M.loc
								A1.suffix = "(Planted)"
								M.weight -= A1.weight
								A1.icon_state = ""
								A1.TreeGrow()
								return
							if(T.icon_state == "Desert")
								var/obj/A1 = src
								A1.loc = M.loc
								A1.suffix = "(Planted)"
								M.weight -= A1.weight
								A1.icon_state = ""
								A1.TreeGrow()
								return
							if(T.Content == "Marsh")
								var/obj/A1 = src
								A1.loc = M.loc
								A1.suffix = "(Planted)"
								M.weight -= A1.weight
								A1.icon_state = ""
								A1.TreeGrow()
								return

/obj/Items/Seeds/GrapeSeed
	icon = 'Cave.dmi'
	icon_state = "TowerCapSeed"
	weight = 2
	suffix = null
	desc = "This is a grape seed, it can be planted anywhere."

/obj/Items/Seeds/GrapeSeed/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)


				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Plant"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Plant")
					if(src.suffix == "(Carrying)")
						for(var/obj/Items/Seeds/S in M.loc)
							if(S != src)
								usr << "Cant plant too many seeds in one area!"
								return
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = "(Planted)"
						M.weight -= A1.weight
						A1.icon_state = ""
						A1.GrapeGrow()
						break
						return

/obj/Items/Seeds/TomatoSeed
	icon = 'Cave.dmi'
	icon_state = "TowerCapSeed"
	weight = 2
	suffix = null
	desc = "This is a tomato seed, it can be planted in farm land only."

/obj/Items/Seeds/TomatoSeed/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)


				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Plant"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Plant")
					if(src.suffix == "(Carrying)")
						for(var/turf/T in view(0,M))
							if(T.icon_state == "FarmLand")
								if(T.HasPlantIn == 0)
									for(var/obj/Items/Seeds/S in M.loc)
										if(S != src)
											usr << "Cant plant too many seeds in one area!"
											return
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = "(Planted)"
									M.weight -= A1.weight
									A1.icon_state = ""
									T.HasPlantIn = 1
									A1.TomatoGrow()
									break
									return

/obj/Items/Seeds/TowerCapSeed
	icon = 'Cave.dmi'
	icon_state = "TowerCapSeed"
	weight = 2
	suffix = null
	desc = "This is a tower cap seed, it can be planted in a cave only."

/obj/Items/Seeds/TowerCapSeed/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)
				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Plant"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Plant")
					if(src.suffix == "(Carrying)")
						for(var/turf/T in view(0,M))
							for(var/obj/Items/Seeds/TowerCapSeed/S in view(0,M))
								if(S in M.loc)
									return
								else
									if(T.icon_state == "CaveFloor")
										for(var/obj/Items/Seeds/Z in M.loc)
											if(Z != src)
												usr << "Cant plant too many seeds in one area!"
												return
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = "(Planted)"
										M.weight -= A1.weight
										A1.icon_state = ""
										A1.TowerCapGrow()
										return

/obj/proc/PlantRegen()
	if(src.Content <= 4)
		src.Content += 1
		if(src.Content >= 1)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant5"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant5"
		if(src.Content >= 2)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant4"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant4"
		if(src.Content >= 3)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant3"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant3"
		if(src.Content >= 4)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant2"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant2"
		if(src.Content >= 5)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant1"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant1"
	spawn(1200)
		src.PlantRegen()
		return

/obj/proc/TowerCapGrow()
	sleep(1000)
	var/mob/Monsters/Critters/TowerCap/C = new
	C.loc = src.loc
	del(src)
	return

/obj/proc/GrapeGrow()
	sleep(1000)
	if(Season != "Winter")
		var/obj/Items/Plants/GrapeVine/T = new
		T.loc = src.loc
		T.name = "Grape Vine Plant"
		del(src)
	else del(src)

/obj/proc/AcidSpray()
	if(src.BloodAcidity >= 1)
		for(var/mob/Monsters/M in range(0,src))
			if(M.BloodAcidity == 0)
				view(M) << "[M] steps into a pool of acidic blood!"
				M.BloodContent -= 10
				M.BloodLoss()
		for(var/turf/grounds/Y in view(1,src))
			var/AcidMelt = prob(src.BloodAcidity)
			if(AcidMelt == 1)
				Y.name = "acid ground"
				Y.icon = 'Cave.dmi'
				Y.icon_state = "Acidground"
				Y.Sky = 1
				Y.Content3 = "CanClimb"
				Y.OIcon = "Acidground"
				Y.density = 0
				Y.CanDigAt = 0
				Y.opacity = 0
		for(var/obj/Items/I in view(0,src))
			var/Melt = prob(src.BloodAcidity)
			if(Melt == 1)
				var/obj/Bloods/AcidGoo/A = new(I.loc)
				A.name = I.name
				del I
		if(src.Undead == 0)
			src.icon += rgb(-50,150,0)
			src.Undead = 1
	spawn(20)
		src.AcidSpray()

/obj/proc/TomatoGrow()
	sleep(1000)
	if(Season != "Winter")
		var/obj/Items/Plants/TomatoPlant/T = new
		T.loc = src.loc
		T.name = "Tomato Plant"
		del(src)
	else
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return

/obj/proc/GarlicGrow()
	sleep(1000)
	if(Season != "Winter")
		var/obj/Items/Plants/GarlicPlant/T = new
		T.loc = src.loc
		T.name = "Garlic Plant"
		del(src)
	else
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return

/obj/proc/PoisonSporeGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/Critters/PoisonSporePlant/P = new
					P.loc = src.loc
	del(src)
	return

/obj/proc/CarnGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/Critters/CarnivorousPlant/P = new
					P.loc = src.loc
	del(src)
	return

/obj/proc/TreeGrow()
	sleep(1000)
	if(Season != "Winter")
		for(var/turf/T in view(0,src))
			if(T.icon_state == "Grass")
				T.icon = 'plants.dmi'
				T.icon_state = "tree 2x1"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.overlays += /obj/Trees/leaves3x2
				T.overlays += /obj/Trees/leaves2x2
				T.overlays += /obj/Trees/leaves1x2
				T.overlays += /obj/Trees/leaves1x1
				T.overlays += /obj/Trees/leaves2x1
				T.overlays += /obj/Trees/leaves3x1
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Snow")
				T.icon = 'plants.dmi'
				T.icon_state = "SnowTree"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Desert")
				T.icon_state = "Cactus"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.opacity = 1
				T.IsWood = 1
				T.name = "Cactus"
				T.Cactus = 1
			if(T.Content == "Marsh")
				T.icon_state = "Bamboo"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.IsWood = 1
				T.opacity = 1
				T.name = "Bamboo"
				T.Bamboo = 1
	del(src)
	return

/obj/proc/TomatoDecay()
	spawn(19000)
	if(src.suffix == null)
		for(var/turf/t in view(0,src))
			if(t.icon_state == "FarmLand")
				if(t.HasPlantIn == 1)
					t.HasPlantIn = 0
		del(src)
	else
		src.TomatoDecay()
