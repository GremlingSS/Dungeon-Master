/obj/Items/ores

/obj/Items/ores/New()
	ItemDecay()

/obj/Items/ores/Iron
	name = "Iron"
	icon = 'Cave.dmi'
	icon_state = "Iron"
	weight = 20
	desc = "This is a chunk of Metal, it can be used to create Ingots for armour and weapon creation"

/obj/Items/ores/Iron/DblClick()
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
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			if(M.Race == "Gargoyle")
				menu += "Eat"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Eat")
				usr << "[M] shoves the iron down its gullet and begins to digest it"
				M.Hunger = 100
				var/obj/St = src
				M.weight -= St.weight
				del St

			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return

/obj/Items/ores/Adamantium
	name = "Adamantium"
	icon = 'Cave.dmi'
	icon_state = "Adamantium"
	weight = 20
	desc = "This is a chunk of Adamantium, it can be used to create Ingots for amazing armour and weapon creation"

/obj/Items/ores/Adamantium/DblClick()
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
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			if(M.Race == "Gargoyle")
				menu += "Eat"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Eat")
				usr << "[M] shoves the Adamantium down its gullet and starts to crack and crumbles as it's body is destroyed!"
				src.loc = M.loc
				src.suffix = null
				M.weight -= src.weight
				M.GoingToDie = 1
				M.Killer = "a piece of Adamantium ore"
				M.DeathType = "eating it like a moron."
				M.Death()
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return

/obj/Items/ores/Sand
	icon = 'Farm Items.dmi'
	icon_state = "Sand"
	weight = 30
	desc = "This is sand, it can be used to create glass objects."

/obj/Items/ores/Sand/DblClick()
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
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					return

/obj/Items/ores/Gold
	icon = 'Cave.dmi'
	icon_state = "Gold"
	weight = 30
	desc = "This is a golden nugget, it can be used to create Ingots for armour and weapon creation or used to create royal items as well as other fanciful things"

/obj/Items/ores/Gold/DblClick()
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



				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				if(M.Race == "Gargoyle")
					menu += "Eat"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Eat")
					usr << "[M] shoves the piece of gold down its gullet"
					M.Hunger = 100
					var/obj/St = src
					M.weight -= St.weight
					del St
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/ores/Silver
	icon = 'Cave.dmi'
	icon_state = "Silver"
	weight = 20
	desc = "This is a lump of silver, it can be used to create coins, weapons, armour, and other fanciful things"

/obj/Items/ores/Silver/DblClick()

	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					if(M.Race != "Vampire" && M.SubRace != "Werewolf")
						src.loc = M
						src.suffix = "(Carrying)"
						M.weight += src.weight
						return
					else
						view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
						M.BloodContent -= 5
						M.BloodLoss()
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)



				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				if(M.Race == "Gargoyle")
					menu += "Eat"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Eat")
					usr << "[M] shoves the piece of silver down it's gullet"
					M.Hunger = 100
					var/obj/St = src
					del St

					M.weight -= St.weight
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/ores/stone
	name="Stone"
	icon = 'Cave.dmi'
	icon_state = "Stone"
	weight = 20
	desc = "This is a lump of stone, it can be used to detail walls and floors, it can also be used for statue creation or food for Gargoyles"

/obj/Items/ores/Stone/DblClick()
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



				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Cancel"
				if(M.Race == "Gargoyle")
					menu += "Eat"
				if(M.MagicalWill >= 10)
					menu += "Transmute Into Wood"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Transmute Into Wood")
					var/obj/Items/woods/wood/K = new()
					K.loc = M
					M.weight += K.weight
					K.suffix = "(Carrying)"
					if(src in M)
						M.weight -= src.weight
					view(M) << "[M] uses their force of will to transmute the piece of stone into a piece of wood."
					del src
				if (Result == "Eat")
					view() << "[M] swallows a large rock whole"
					M.Hunger = 100
					var/obj/St = src
					M.weight -= St.weight
					del St
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
