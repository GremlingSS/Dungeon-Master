turf/grounds/Enter(atom/m)
	if(usr)
		if(usr.key)
			return(1)
		if(icon_state=="GoodGrass")
			if(usr.Infects || usr.Undead || usr.Unholy || usr.Race == "Svartalfar" || usr.Race == "Demon")
				if(!density)
					density=1
					spawn()
						density=0
				return
		if(m.IsMist)
			return(1)
		if(!density)
			for(var/atom/M in src)
				if(M.density)
					if(m.density)
						return
		else
			return
	return(1)

turf/grounds/DblClick() for(var/mob/Monsters/M in usr.Selected)
	for(var/obj/DigAt/D in view(0,src))
		if(D.Owner == M)
			M.destination = null
			M.DigTarget = null
			del(D)
			return
	if(src.density == 1)
		if(M.Dig == 1)
			M.destination = null
			var/obj/DigAt/D2 = new
			D2.loc = locate(src.x,src.y,src.z)
			D2.Owner = M
