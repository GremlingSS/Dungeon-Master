/obj/Items/Bones

/obj/Items/Bones/New()
	DeleteItem()

/obj/Items/Bones/DblClick()
	if(ismob(loc))
		var/mob/M = loc
		if(M.Owner != usr)
			return
		var/list/menu = new()
		if(istype(src,/obj/Items/Bones/Head/))
			if(M.Race == "Illithid") menu += "Eat Brain"
			menu += "Make Into Skull"
			for(var/obj/Items/Traps/Spikes/S in M) menu += "Put On Spike"
		menu += "Inspect"
		menu += "Drop"
		menu += "Cancel"
		var/Result = input("What would you like to do with the [src]?","Choose",null)in menu
		if(src in M)
			switch(Result)
				if("Eat Brain")
					M.Hunger += 100
					if(M.Hunger > M.MaxHunger)
						M.Hunger = M.MaxHunger
					M.Intelligence += Intelligence / 25
					M.GainEXP(Intelligence * 10)
					view(M) << "[M] sucks the brain out of [src] with their tentacles..."
					M.Owner << "[M] has gained [Intelligence / 25] intelligence."
					if(M.DropItem(src))
						del(src)
				if("Put On Spike")
					for(var/obj/Items/Traps/Spikes/S in M)
						if(S.icon_state == "Spike")
							if(S.HasHeadOn == 0)
								S.name = name
								S.overlays += icon(icon,icon_state)
								S.HasHeadOn = 1
								if(M.DropItem(src))
									del(src)
				if("Make Into Skull")
					var/obj/Items/Bones/Skull/SKULL = new(M.loc)
					SKULL.name = name
					if(M.DropItem(src))
						del(src)
				if("Inspect")
					usr << "\icon[src] <b>[name]</b>"
					if(weight) usr<<"Weighs [weight] units."
					if(desc)usr << desc
					usr << "" //just the same as including a "<br>" at the end, stops people from getting as confused when looking at lots of items.
				if("Drop")M.DropItem(src)
	else if(!suffix)
		for(var/mob/Monsters/M in usr.Selected)
			if(M.PickUpItem(src,1))
				return(1)

/obj/Items/Bones/SkullPile
	name = "Skull Pile"
	icon = 'Cave.dmi'
	icon_state = "SkullPile"
	weight = 10
	desc = "This is a skull pile, it looks scary."

/obj/Items/Bones/Shell
	name = "Chitin Shell"
	icon = 'Cave.dmi'
	icon_state = "Shell"
	weight = 10
	desc = "This is a hard shell, it can be used for crafting or burial."

/obj/Items/Bones/BloodyLimb
	name = "Bloody Limb"
	icon = 'Blood.dmi'
	icon_state = "Arm"
	weight = 5
	desc = "This is limb, it's useless to hold onto."

/obj/Items/Bones/Head
	name = "Head"
	icon = 'Heads.dmi'
	icon_state = "FrogManHead"
	weight = 10
	desc = "This is a head, it can be stuck on a spike to warn invaders!"

/obj/Items/Bones/Skull
	name = "Skull"
	icon = 'Cave.dmi'
	icon_state = "Skull"
	weight = 10
	desc = "This is a skull, it can be used for bone crafting or burial"

/obj/Items/Bones/Bones
	name = "Bones"
	icon = 'Cave.dmi'
	icon_state = "Bone"
	weight = 10
	desc = "These are bones, they can be used for bone crafting or burial"
