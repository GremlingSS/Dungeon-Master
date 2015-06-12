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
