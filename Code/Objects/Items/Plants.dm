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
