/mob/Monsters
	HumanParts = 1

/mob/Monsters/DblClick()
	if(Owner==usr)
		src.ToggleSelect()
	else if(usr.DE && usr.FreeSelect)
		src.ToggleSelect(usr)
