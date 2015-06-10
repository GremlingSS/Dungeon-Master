/mob
	HP=350
	MAXHP=350
	IsWood = 1

/mob/Test
	density = 0
	IsMist = 1

/mob/proc/ToggleSelect(Player/USR=Owner)
	if(USR.Selected.Find(src))
		src.Deselect(USR)
	else
		src.Select(USR)

/mob/proc/Select(mob/USER=Owner) if(ismob(USER))
	if(src.Egg || src.InHole || src.Sleeping)
		return
	if(!ismob(loc)&&!isobj(loc))
		if(!USER.Selected.Find(src))
			USER.Selected.Add(src)
			if(USER.client)
				USER.client.images += Star

/mob/proc/Deselect(Player/USER=Owner) if(ismob(USER)) if(USER.Selected.Find(src))
	USER.Selected.Remove(src)
	if(USER.client)
		USER.client.images -= Star

/mob/Monsters
	HumanParts=1

/mob/Monsters/DblClick()
	if(Owner==usr)
		src.ToggleSelect()
	else if(usr.DE && usr.FreeSelect)
		src.ToggleSelect(usr)