/obj/PowerupPillar
	layer = 4
	Content = 4
	Content2 = "Uncaptured"
	icon = 'Book.dmi'
	icon_state = "Pillar1"

/obj/PowerupPillar/DblClick()
	var/mob/Test/A = new()
	A.loc = src.loc
	A.z = 3
	var/mob/Test/A2 = new()
	A2.loc = src.loc
	A2.z = 2
	for(var/Player/M in world)
		if(src.Content2 == M.Faction)
			for(var/mob/Monsters/X in M.UnitList)
				if(X in range(20,src))
					usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
					del A
					del A2
					return
				if(X in range(20,A))
					usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
					del A
					del A2
					return
				if(X in range(20,A2))
					usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
					del A
					del A2
					return
	if(usr.Faction != "Player" && usr.Faction != "Uncaptured")
		for(var/mob/Monsters/M in usr.Selected)
			if(src in range(1,M))
				world << "<b><font color=silver><font size=3>[src] has been captured by [usr.Faction] at [src.x],[src.y],[src.z]"
				src.Content2 = usr.Faction
				del A
				del A2
				return
	else
		usr << "You need to be in a clan to capture a shrine."
	del A
	del A2