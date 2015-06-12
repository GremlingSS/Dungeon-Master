/obj/Items/gems

/obj/Items/gems/New()
	ItemDecay()

/obj/Items/gems/Emerald
	icon = 'Cave.dmi'
	icon_state = "Emerald"
	weight = 10
	desc = "This is an Emerald, it can be used for decoration or trade and encrusting armour."

/obj/Items/gems/Emerald/DblClick()
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

/obj/Items/gems/Ruby
	icon = 'Cave.dmi'
	icon_state = "Ruby"
	weight = 10
	desc = "This is an Ruby, it can be used for decoration or trade and encrusting armour."

/obj/Items/gems/Ruby/DblClick()
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

/obj/Items/gems/Diamond
	icon = 'Cave.dmi'
	icon_state = "Diamond"
	weight = 10
	desc = "This is an Diamond, it can be used for decoration or trade and encrusting armour."

/obj/Items/gems/Diamond/DblClick()
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

/obj/Items/gems/UnCutDiamond
	icon = 'Cave.dmi'
	icon_state = "Un-CutDiamond"
	weight = 10
	desc = "This is an Un-Cut Diamond, it can be used by a Jewel Crafter to create a Diamond"

/obj/Items/gems/UnCutDiamond/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in oview(1,M)) if(M.PickUpItem(src,1)) return
		if(loc==M)
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			menu += "Cancel"
			if(M.Race == "Gargoyle")
				menu += "Eat"
				menu += "Heal"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Eat")
				usr << "[M] shoves the diamond down its gullet and begins to digest it and gains a bonus 10 defence!"
				M.Hunger = 100
				if(M.SavedDefence < 150)
					M.Defence += 10
					M.SavedDefence += 10
				else M.Owner << "You have gained over 150 defence from eating gems and can no longer gain further defense from eating them."
				if(M.DropItem(src)) del(src)
			if (Result == "Heal")
				usr << "[M] uses a diamond's energy to heal the cracks and damages of their body. The absorbtion causes their body to become weaker and loses 10 points of defence."
				M.FullHeal(1)
				M.Defence -= 10
				M.SavedDefence -= 10
				if(M.DropItem(src)) del(src)
			if (Result == "Drop") M.DropItem(src)

/obj/Items/gems/UnCutRuby
	icon = 'Cave.dmi'
	icon_state = "Un-CutRuby"
	weight = 10
	desc = "This is an Un-Cut Ruby, it can be used by a Jewel Crafter to create a Ruby"

/obj/Items/gems/UnCutRuby/DblClick()
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
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Eat")
					usr << "[M] shoves the ruby down its gullet and begins to digest it   You have eaten [M.GargRuby] Rubies, you gain power at 15, 30, and 100."
					M.Hunger = 100
					M.GargRuby += 1
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

/obj/Items/gems/UnCutEmerald
	icon = 'Cave.dmi'
	icon_state = "Un-CutEmerald"
	desc = "This is an Un-Cut Emerald, it can be used by a Jewel Crafter to create a Emerald"
	weight = 10

/obj/Items/gems/UnCutEmerald/DblClick()
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
			if(M.Race == "Gargoyle")
				menu += "Eat"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Inspect")
				usr << src.desc
			if (Result == "Eat")
				usr << "[M] shoves the emerald down its gullet and begins to digest it   You have eaten [M.GargEmerald] Emeralds, you gain power at 15, 30, and 100."
				M.Hunger = 100
				M.GargEmerald += 1
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
