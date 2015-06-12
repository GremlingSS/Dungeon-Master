/obj/Hud/DigAdd
	icon = 'Selection.dmi'
	icon_state = "addi"
	layer = 11
	name = "Add tiles to autodig selection. Hot Key - (tab)"

/obj/Hud/DigAdd/New(client/c)
	screen_loc = "2,19"
	c.screen += src

/obj/Hud/DigAdd/DblClick()
	usr.digadd()

/obj/Hud/DigSub
	icon = 'Selection.dmi'
	icon_state = "subi"
	layer = 11
	name = "Subtract tiles from autodig selection. Hot Key - (tab)"

/obj/Hud/DigSub/New(client/c)
	screen_loc = "3,19"
	c.screen += src

/obj/Hud/DigSub/DblClick()
	usr.digsub()

/obj/Hud/DigSel
	icon = 'Selection.dmi'
	icon_state = "autodig"
	layer = 11
	name = "Use selection autodig. To use you must have at least one unit selected with autodig on. Hot Key - (f5)"

/obj/Hud/DigSel/New(client/c)
	screen_loc = "1,19"
	c.screen += src

/obj/Hud/DigSel/DblClick()
	usr.switchdig()
