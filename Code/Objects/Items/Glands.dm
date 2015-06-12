obj/Items/Glands

obj/Items/Glands/New()
	ItemDecay()

obj/Items/Glands/PoisonRoots
	name = "Poison Root"
	icon = 'Animal.dmi'
	icon_state = "Gland"
	weight = 10
	suffix = null
	desc = "This is a posion root, it can be used to add posion to weapons, traps or food but first must be extracted."

obj/Items/Glands/ToxicGland
	name = "Toxin Gland"
	icon = 'Cave.dmi'
	icon_state = "Gland"
	weight = 10
	suffix = null
	desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."

obj/Items/Glands/PoisonGland
	name = "Poison Gland"
	icon = 'Cave.dmi'
	icon_state = "Gland"
	weight = 10
	suffix = null
	desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."

obj/Items/Glands/DblClick()
	if(ismob(loc))
		var/mob/M=loc
		if(M.Owner!=usr)
			return
		M.DropItem(src)
	else if(!suffix)
		for(var/mob/Monsters/M in usr.Selected)
			if(M.PickUpItem(src,1))
				return(1)