/obj/Items/Graves/TombStone
	icon = 'StoneItems.dmi'
	icon_state = "TombStone1"
	weight = 30
	suffix = null
	TS = 1
	desc = "This a tomb stone, it can be placed over a Vrage."

/obj/Items/Graves/TombStone/DblClick()
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

/obj/Items/Graves/Grave
	icon = 'Cave.dmi'
	icon_state = "Vrage"
	weight = 10
	suffix = null
	desc = "Vrage"
