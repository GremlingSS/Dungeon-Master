/obj/HUD/Walls
	name = "Walls"
	icon='Cave.dmi'
	icon_state = "WoodWall"
	text = "W"

/obj/HUD/Walls/DblClick()
	usr.Walls()

/obj/HUD/ClickSecretWall
	name = "Secret Wall"
	icon='Cave.dmi'
	icon_state = "CaveWall"

/obj/HUD/ClickSecretWall/DblClick()
	usr.Function = "PlaceSecretWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

/obj/HUD/ClickTribalWall
	name = "Tribal Wall"
	icon='Cave.dmi'
	icon_state = "TribalWall"

/obj/HUD/ClickTribalWall/DblClick()
	usr.Function = "PlaceTribalWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

/obj/HUD/ClickElfWall
	name = "Elf Wall"
	icon = 'Cave.dmi'
	icon_state = "Elf Wall"

/obj/HUD/ClickElfWall/DblClick()
	usr.Function = "PlaceElfWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

/obj/HUD/ClickArrowSlit
	icon = 'Cave.dmi'
	name = "Arrow Slit"
	icon_state = "ArrowSlit"

/obj/HUD/ClickArrowSlit/DblClick()
	usr.Function = "PlaceArrowSlit"
	usr << "Click to place arrow slits<br>"
	usr.Close()

/obj/HUD/ClickDevourerWall
	name = "DevourerWall"
	icon = 'Cave.dmi'
	icon_state = "DevourerWall2"

/obj/HUD/ClickDevourerWall/DblClick()
	usr.Function = "PlaceDevourerWall"
	usr << "Click and drag to place floor<br>"
	usr.Close()

/obj/HUD/ClickWoodWall
	name = "Wooden Wall"
	icon='Cave.dmi'
	icon_state = "WoodWall"

/obj/HUD/ClickWoodWall/DblClick()
	usr.Function = "PlaceWoodenWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

/obj/HUD/ClickStoneWall
	name = "Stone Wall"
	icon='Cave.dmi'
	icon_state = "DetailedWall"

/obj/HUD/ClickStoneWall/DblClick()
	usr.Function = "PlaceStoneWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

/obj/HUD/ClickBoneWall
	name = "Bone Wall"
	icon='Cave.dmi'
	icon_state = "Bone Wall"

/obj/HUD/ClickBoneWall/DblClick()
	usr.Function = "PlaceBoneWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

