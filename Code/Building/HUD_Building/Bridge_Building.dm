/obj/HUD/Bridges
	name = "Bridges"
	icon='Cave.dmi'
	icon_state = "Bridge"
	text = "B"

/obj/HUD/Bridges/DblClick()
	usr.Bridge()

/obj/HUD/ClickTribalBridge
	name = "Tribal Bridge"
	icon='Cave.dmi'
	icon_state = "TribalBridge"

/obj/HUD/ClickTribalBridge/DblClick()
	usr.Function = "PlaceTribalBridge"
	usr << "Click and drag to place bridge<br>"
	usr.Close()

/obj/HUD/ClickBoneBridge
	name = "Bone Bridge"
	icon = 'Cave.dmi'
	icon_state = "BoneBridge"

/obj/HUD/ClickBoneBridge/DblClick()
	usr.Function = "PlaceBoneBridge"
	usr << "Click and drag to place bridge<br>"
	usr.Close()

/obj/HUD/ClickWoodBridge
	name = "Wooden Bridge"
	icon='Cave.dmi'
	icon_state = "WoodBridge"

/obj/HUD/ClickWoodBridge/DblClick()
	usr.Function = "PlaceWoodenBridge"
	usr << "Click and drag to place bridge<br>"
	usr.Close()

/obj/HUD/ClickStoneBridge
	name = "Stone Bridge"
	icon='Cave.dmi'
	icon_state = "Bridge"

/obj/HUD/ClickStoneBridge/DblClick()
	usr.Function = "PlaceStoneBridge"
	usr << "Click and drag to place bridge<br>"
	usr.Close()
