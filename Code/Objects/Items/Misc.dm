/obj/Items/Skin
	icon = 'Skin.dmi'
	icon_state = "FrogSkin"
	weight = 10
	suffix = null
	desc = "This is a peice of skin, it can be used for creating leather armour and clothes"

/obj/Items/Skin/DblClick()
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

/obj/Items/Silks
	SpiderSilk
		icon = 'Spiders.dmi'
		icon_state = "Silk"
		weight = 10
		suffix = null
		desc = "This is spider silk, it is supprisingly strong and very rare."

/obj/Items/Silks/DblClick()
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
			if(M.Wagon == 0)
				var/obj/A16 = src
				A16.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
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
						if(A1.Content3 == 0)
							A1.DeleteItem()
						return

/obj/Items/Shafts/Sign
	icon = 'Cave.dmi'
	icon_state = "sign"
	weight = 5
	suffix = null
	desc = "This is a sign post, use it to put warnings and other messages on."

/obj/Items/Shafts/Sign/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 0)
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

/obj/Items/Shafts/LockPick
	icon = 'Cave.dmi'
	icon_state = "LockPick"
	weight = 5
	suffix = null
	desc = "This is a lockpick, it can be used to open locked doors and chests, it will break if you fail to lockpick an item"

/obj/Items/Shafts/LockPick/DblClick()
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

/obj/Items/Shafts/DoorKey
	icon = 'MetalObjects.dmi'
	icon_state = "Key"
	weight = 5
	suffix = null
	desc = "This is a key, it opens a door and is attuned to a door"

/obj/Items/Shafts/DoorKey/DblClick()
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

/obj/Items/Shafts/SpearHead
	icon = 'Cave.dmi'
	icon_state = "SpearHead"
	weight = 5
	suffix = null
	desc = "This is a spear head, it can be combined with a spear shaft to create a spear"

/obj/Items/Shafts/SpearHead/DblClick()
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

/obj/Items/Shafts/WoodenSpade
	icon = 'Cave.dmi'
	icon_state = "Spade"
	weight = 5
	suffix = null
	desc = "This is a spade, it can be used to bury the dead or make farm land"

/obj/Items/Shafts/WoodenSpade/DblClick()
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
			if(M.Wagon == 0)
				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				for(var/obj/Items/Shafts/WoodenSpade/SP in M)
					for(var/turf/grounds/D in view(0,M))
						if(D.icon_state == "Desert")
							menu += "Dig Up Sand"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Dig Up Sand")
					if(M.weight <= M.weightmax)
						var/obj/Items/ores/Sand/S = new
						S.loc = M
						S.suffix = "(Carrying)"
						M.weight += S.weight
						return
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/Shafts/MobileSandKing
	icon = 'Book.dmi'
	icon_state = "MobileSand"
	weight = 5
	suffix = null
	desc = "You can hear the sand king inside this caccoon, scratching against the inside with its slimy tendrils"

/obj/Items/Shafts/EngineeredOrgan
	icon = 'Devourer.dmi'
	icon_state = "Organ"
	weight = 0
	NoDropOnDeath = 1
	suffix = null
	desc = "This disgusting organ appears to be alive and functioning, it is impossible to determine the original owner..."

/obj/Items/Shafts/EngineeredOrgan/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M.Wagon == 0)
				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Inspect"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc

/obj/Items/Shafts/PortableDevourerCacoon
	icon = 'Eggs.dmi'
	icon_state = "Devourer"
	weight = 0
	name = "Dormant Cacoon"
	NoDropOnDeath = 1
	suffix = null
	desc = "The devourer is storing an unimaginable monstrosity in this pod constructed of reeking flesh, ready to be released upon the world at any time."

/obj/Items/Shafts/PortableDevourerCacoon/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M.Wagon == 0)
				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Inspect"
				menu += "Initiate Incubation"
				menu += "Add Organ"
				menu += "Remove Organ"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Initiate Incubation")
					if(src in M)
						var/mob/Monsters/Egg/E = new(M.loc)
						E.icon_state="Devourer"
						E.ChangeOwnership(M.Owner)
						E.Breeding(M,M,600)
						E.CHILDTYPE = /mob/Monsters/DevourerZombie
						for(var/obj/G in src) G.loc = E
						del src
				if(Result == "Add Organ")
					if(src in M)
						var/list/menu2 = new
						for(var/obj/Items/Shafts/EngineeredOrgan/E in M)
							menu2 += E
						menu2 += "None"
						var/Result2 = input("What Organ Will You Choose?", "Choose", null) in menu2
						if(Result2 != "None")
							var/obj/I = Result2
							M.weight -= I.weight
							I.loc = src
				if(Result == "Remove Organ")
					if(src in M)
						var/list/menu2 = new
						for(var/obj/Items/Shafts/EngineeredOrgan/E in src)
							menu2 += E
						menu2 += "None"
						var/Result2 = input("What Organ Will You Choose?", "Choose", null) in menu2
						if(Result2 != "None")
							var/obj/I = Result2
							M.weight += I.weight
							I.loc = M

/obj/Items/Shafts/Spade
	icon = 'MetalObjects.dmi'
	icon_state = "Spade"
	weight = 7
	suffix = null
	desc = "This is a spade, it can be used to bury the dead or make farm land"

/obj/Items/Shafts/Spade/DblClick()
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
			if(M.Wagon == 0)
				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				for(var/obj/Items/Shafts/Spade/SP in M)
					for(var/turf/grounds/D in view(0,M))
						if(D.icon_state == "Desert")
							menu += "Dig Up Sand"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Dig Up Sand")
					if(M.weight <= M.weightmax)
						var/obj/Items/ores/Sand/S = new
						S.loc = M
						S.suffix = "(Carrying)"
						M.weight += S.weight
						return
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/Shafts/Flag
	icon = 'Flags.dmi'
	icon_state = "Soviet Flag"
	weight = 7
	suffix = null
	desc = "This is a Flag, it can be used to poke out someone's eyes or to beat the over the head, also you can use it to symbolize your country..."

/obj/Items/Shafts/Flag/DblClick()
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

			if(M.Wagon == 0)


				var/obj/A = src
				A.loc = M
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Dig Up Sand")
					if(M.weight <= M.weightmax)
						var/obj/Items/ores/Sand/S = new
						S.loc = M
						S.suffix = "(Carrying)"
						M.weight += S.weight
						return
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/Shafts/SpearShaft
	icon = 'Cave.dmi'
	icon_state = "Shaft"
	weight = 5
	suffix = null
	desc = "This is a spear shaft, it can be combined with a spear head to create a spear"

/obj/Items/Shafts/SpearShaft/DblClick()
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

/obj/Items/woods

/obj/Items/woods/New()
	ItemDecay()

/obj/Items/woods/wood
	icon = 'Cave.dmi'
	icon_state = "Wood"
	weight = 20
	suffix = null
	desc = "This is a wooden log, it can be used to create furtniture, buildings and pretty much anything else"

/obj/Items/woods/wood/DblClick()
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
			menu += "Cancel"
			if(M.MagicalWill >= 5)
				menu += "Transmute Into Stone"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Transmute Into Stone")
				var/obj/Items/ores/stone/K = new()
				K.loc = M
				M.weight += K.weight
				K.suffix = "(Carrying)"
				if(src in M)
					M.weight -= src.weight
				view(M) << "[M] uses their force of will to transmute the piece of wood into a large stone."
				del src
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return
