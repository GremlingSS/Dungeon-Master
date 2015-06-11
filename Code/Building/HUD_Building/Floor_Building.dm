/obj/HUD/Floors
	name = "Floors"
	icon = 'Cave.dmi'
	icon_state = "WoodFloor"
	text = "F"

/obj/HUD/Floors/DblClick()
	usr.Floors()

/obj/HUD/ClickFarm
	name = "Farming"
	icon_state = "Farming"

/obj/HUD/ClickFarm/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		for(var/obj/Items/Shafts/Spade/S in M)
			for(var/turf/grounds/W in view(1,M))
				if(W.icon_state == "Grass")
					W.icon = 'Cave.dmi'
					W.icon_state = "FarmLand"
					W.name = "FarmLand"
					W.Detailed = 1
		for(var/obj/Items/Shafts/WoodenSpade/S in M)
			for(var/turf/grounds/W in view(1,M))
				if(W.icon_state == "Grass")
					W.icon = 'Cave.dmi'
					W.icon_state = "FarmLand"
					W.name = "FarmLand"
					W.Detailed = 1
		usr.Close()

/obj/HUD/Farming
	name = "Farming"
	icon_state = "Farming"

/obj/HUD/Farming/DblClick()
	usr.FarmLand()

/obj/HUD/ClickWoodFloor
	icon='Cave.dmi'
	name = "Wood Floor"
	icon_state = "WoodFloor"

/obj/HUD/ClickWoodFloor/DblClick()
	usr.Function = "PlaceWoodenFloor"
	usr << "Click and drag to place floor<br>"
	usr.Close()

/obj/HUD/ClickStoneFloor
	name = "Stone Floor"
	icon='Cave.dmi'
	icon_state = "DetailedFloor"

/obj/HUD/ClickStoneFloor/DblClick()
	usr.Function = "PlaceStoneFloor"
	usr << "Click and drag to place floor<br>"
	usr.Close()

/obj/HUD/ClickTribalFloor
	name = "Tribal Floor"
	icon_state = "Tribal"
	icon='Cave.dmi'

/obj/HUD/ClickTribalFloor/DblClick()
	usr.Function = "PlaceTribalFloor"
	usr << "Click and drag to place floor<br>"
	usr.Close()

/obj/HUD/ClickDevourerFloor
	name = "Devourer Floor"
	icon_state = "DevourerFloor"

/obj/HUD/ClickDevourerFloor/DblClick()
	usr.Function = "PlaceDevourerFloor"
	usr << "Click and drag to place floor<br>"
	usr.Close()

/obj/HUD/ClickBoneFloor
	name = "Bone Floor"
	icon='Cave.dmi'
	icon_state = "BoneFloor"

/obj/HUD/ClickBoneFloor/DblClick()
	usr.Function = "PlaceBoneFloor"
	usr << "Click and drag to place floor<br>"
	usr.Close()

/obj/HUD/ClickDigChannel
	name = "Dig Channel"
	icon_state = "Channel"

/obj/HUD/ClickDigChannel/DblClick()
	usr.Function = "DigChannel"
	usr << "Click and drag to dig channels for liquids<br>"
	usr.Close()
