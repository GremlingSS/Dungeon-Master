/obj/Items/Ingots

/obj/Items/Ingots/New()
	ItemDecay()

/obj/Items/Ingots/SilverIngot
	icon = 'Cave.dmi'
	icon_state = "SilverIngot"
	weight = 20
	suffix = null
	desc = "This is a silver bar, it can be used to create armour and weapons as well as other fanciful things"

/obj/Items/Ingots/SilverIngot/DblClick()
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

			if(M.Wagon == 0)


				var/obj/A5 = src
				A5.loc = M
				var/list/menu = new()
				if(M.MagicalWill >= 10)
					menu += "Transmute Into Gold"
					menu += "Transmute Into Iron"
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
						return
				if (Result == "Transmute Into Gold")
					if(src.suffix == "(Carrying)")
						var/obj/Items/Ingots/GoldIngot/B = new()
						B.loc = M
						B.suffix = "(Carrying)"
						M.weight += B.weight
						M.weight -= src.weight
						view(M) << "[M] uses their force of will to change the metal into another type of metal."
						del src
				if (Result == "Transmute Into Iron")
					if(src.suffix == "(Carrying)")
						var/obj/Items/Ingots/IronIngot/B = new()
						B.loc = M
						B.suffix = "(Carrying)"
						M.weight += B.weight
						M.weight -= src.weight
						view(M) << "[M] uses their force of will to change the metal into another type of metal."
						del src
						return

/obj/Items/Ingots/GoldIngot
	icon = 'Cave.dmi'
	icon_state = "GoldIngot"
	weight = 20
	suffix = null
	desc = "This is a gold bar, it can be used to create armour and weapons as well as other fanciful things"

/obj/Items/Ingots/GoldIngot/DblClick()
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


				var/obj/A5 = src
				A5.loc = M
				var/list/menu = new()
				if(M.MagicalWill >= 10)
					menu += "Transmute Into Silver"
					menu += "Transmute Into Iron"
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
						return
				if (Result == "Transmute Into Silver")
					if(src.suffix == "(Carrying)")
						var/obj/Items/Ingots/SilverIngot/B = new()
						B.loc = M
						B.suffix = "(Carrying)"
						M.weight += B.weight
						M.weight -= src.weight
						view(M) << "[M] uses their force of will to change the metal into another type of metal."
						del src
						return
				if (Result == "Transmute Into Iron")
					if(src.suffix == "(Carrying)")
						var/obj/Items/Ingots/IronIngot/B = new()
						B.loc = M
						B.suffix = "(Carrying)"
						M.weight += B.weight
						M.weight -= src.weight
						view(M) << "[M] uses their force of will to change the metal into another type of metal."
						del src
						return

/obj/Items/Ingots/IronIngot
	icon = 'Cave.dmi'
	icon_state = "IronIngot"
	weight = 20
	suffix = null
	desc = "This is a metal ingot, it can be used to create armour and weapons and other metal objects"

/obj/Items/Ingots/IronIngot/DblClick()
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


				var/obj/A5 = src
				A5.loc = M
				var/list/menu = new()
				if(M.MagicalWill >= 10)
					menu += "Transmute Into Silver"
					menu += "Transmute Into Gold"
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
						return
				if (Result == "Transmute Into Gold")
					if(src.suffix == "(Carrying)")
						var/obj/Items/Ingots/GoldIngot/B = new()
						B.loc = M
						B.suffix = "(Carrying)"
						M.weight += B.weight
						M.weight -= src.weight
						view(M) << "[M] uses their force of will to change the metal into another type of metal."
						del src
						return
				if (Result == "Transmute Into Silver")
					if(src.suffix == "(Carrying)")
						var/obj/Items/Ingots/SilverIngot/B = new()
						B.loc = M
						B.suffix = "(Carrying)"
						M.weight += B.weight
						M.weight -= src.weight
						view(M) << "[M] uses their force of will to change the metal into another type of metal."
						del src
						return

/obj/Items/Ingots/AdamantiumIngot
	icon = 'Cave.dmi'
	icon_state = "AdamantiumIngot"
	weight = 0
	suffix = null
	desc = "This is a Adamantium ingot, it can be used to create amazing armour and weapons."

/obj/Items/Ingots/AdamantiumIngot/DblClick()
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


				var/obj/A5 = src
				A5.loc = M
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
						return
