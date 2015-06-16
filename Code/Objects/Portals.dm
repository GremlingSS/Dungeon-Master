/obj/Portal
	layer = 5
	Content = 4
	icon = 'Cave.dmi'
	icon_state = "Portal"

/obj/AstralPortal
	layer = 5
	Content = 4
	icon = 'Blood.dmi'
	icon_state = "AstralBurst"
	text = "<font color=blue>@<b><font color=cyan>@"

/obj/AstralPortal/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.loc = src.GoesTo

/obj/PermPortal1
	name = "Portal"
	layer = 5
	Content = 4
	icon = 'Cave.dmi'
	icon_state = "Portal"

/obj/PermPortal1/New()
	Portal()

/obj/PermPortal2
	name = "Portal"
	layer = 5
	Content = 1
	icon = 'Cave.dmi'
	icon_state = "Portal"

/obj/PermPortal2/New()
	Portal()

/obj/proc/Portal()
	for(var/mob/M in view(0,src))
		if(M.loc != locate(M.x,M.y,4))
			M.loc = locate(M.x,M.y-1,4)
			M.destination = null
			var/C = prob(15)
			var/P = prob(25)
			if(M.client == null)
				if(!M.SubRace)
					if(C) if(M.CanSee)
						if(M.Wagon == 0 && M.Race != "Demon" && M.Race != "Gargoyle" && M.Race != "Demon" && M.Race != "Dragon" && M.Unholy == 0)
							M.Owner << "[M] goes insane from the horror and tears their own eyes out!"
							M.HasLeftEye = 0
							M.HasRightEye = 0
							M.CanSee = 0
							M.RightEyeHP = 0
							M.LeftEyeHP = 0
							M.LeftEye = "Destroyed"
							M.RightEye = "Destroyed"
					if(C == 0)
						if(P)
							if(ismob(M.Owner))
								if(M.Wagon == 0)
									if(M.Race != "Demon" && M.Race != "Gargoyle" && M.Race != "Demon" && M.Race != "Dragon")
										M.Owner << "[M] is possessed by the demonic forces surrounding the portal!"
										M.RaceChange(SUBRACE="HalfDemon")
		else
			M.loc = locate(M.x,M.y-1,src.Content)
			M.destination = null
	spawn(10)
		Portal()
		return

/obj/proc/AstralPortal()
	for(var/mob/M in view(0,src))
		var/obj/AstralPortal/A
		M.loc = A.GoesTo