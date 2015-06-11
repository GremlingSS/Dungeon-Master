/obj/HUD/
	icon = 'HUD2.dmi'
	layer = MOB_LAYER+10
	name = ""

/obj/HUD/New(client/C)
	C.screen += src
	..()

/obj/HUD/BottomRight
	icon_state = "BR"

/obj/HUD/BottomLeft
	icon_state = "BL"

/obj/HUD/TopRight
	icon_state = "TR"

/obj/HUD/TopLeft
	icon_state = "TL"

/obj/HUD/TopMiddle
	icon_state = "TM"

/obj/HUD/BottomMiddle
	icon_state = "BM"

/obj/HUD/LeftMiddle
	icon_state = "LM"

/obj/HUD/RightMiddle
	icon_state = "RM"

/obj/HUD/Middle2
	icon_state = "M2"

/obj/HUD/Text
	icon = 'txt.dmi'

/obj/HUD/ClickDetail
	name = "DetailedWall"
	icon_state = "DetailedWall"
	text = "S"

/obj/HUD/ClickDetail/DblClick()
	usr.Detail()
	usr.Up = 0
	usr.Close()

/obj/HUD/ClickDestroy
	name = "Destroy"
	icon='Cave.dmi'
	icon_state = "CaveFloor"
	text = "D"

/obj/HUD/ClickDestroy/DblClick()
	usr.Function = "DestroyFloor"
	usr << "Click and drag to destroy floors and stairs.<br>"
	usr.Close()

/obj/HUD/Dec
	name = "Decoration"
	icon_state = "Dec"
	text = "W"

/obj/HUD/Dec/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		for(var/turf/W in view(0,M))
			if(W.density == 0)
				if(M.Race == "Spider")
					if(M.WebContent >= 25)
						var/D
						D = prob(50)
						if(D == 1)
							W.overlays += 'Decoration1.dmi'
						else
							W.overlays += 'Decoration2.dmi'
						M.WebContent -= 25
						break
						usr.Up = 0
						usr.Close()
						return
		usr.Up = 0
		usr.Close()
