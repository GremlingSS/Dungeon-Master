/turf
	name = ""

/turf/grounds/Enter(atom/m)
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

/turf/grounds/DblClick() for(var/mob/Monsters/M in usr.Selected)
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

/turf/grounds/Entered()
	if(ismob(usr))
		if(!usr.Wagon)
			if(src.Content3 == "Liquid")
				if(OnFire)
					usr.OnFire = 0
					usr.IsWood = 0
					usr.Fuel = 100
					usr.Safe()
			if(!usr.key)
				switch(icon_state)
					if("water","Peak","Grass","GoodGrass")
						usr.SunLight()
						RestoreTemperature()
					if("DeadGrass")
						if(usr.Shielded == 0 && usr.Infects == 0 && usr.Race != "Svartalfar")
							ApplyTemperature(-5)
					if("Marsh","Tropical1","Tropical2","Tropical2","Tropical3","Tropical4","Tropical5")
						if(usr.Race == "Dragon")
							usr.PoisonPoints += 1
						usr.SunLight()
						if(usr.Race=="Lizardman" || usr.Race=="Frogman")
							ApplyTemperature(0.05)
						else
							ApplyTemperature(0.1)
					if("HellFloor")
						if(usr.Race == "Dragon")
							usr.FirePoints += 1
						ApplyTemperature(1)
					if("Desert")
						if(usr.Race == "Dragon")
							usr.SandPoints += 1
						ApplyTemperature(0.5)
						usr.SunLight()
					if("Snow")
						if(usr.Race == "Dragon")
							usr.IcePoints += 1
						if(usr.Race=="Orc")
							ApplyTemperature(-0.25)
						else
							ApplyTemperature(-1)
						usr.SunLight()
					if("Sky")
						usr.SunLight()
						if(usr.density && !usr.Flying)
							usr.z = 1
							if(!usr.CliffClimber && usr.SubRace != "Illithid" && usr.SubRace != "Werewolf")
								if(usr.HasLeftLeg)
									if(prob(50))
										usr.LeftLegHP = 10
										usr.LeftLeg  = "Mangled"
										usr.BloodContent -= 25
										usr.BloodLoss()
										view(usr) << "<b><font color=red>[usr] falls and mangles their left leg!<br>"
										if(usr.RightLegHP <= 10)
											usr.CanWalk = 0
								if(usr.HasRightLeg)
									if(prob(50))
										usr.RightLegHP = 10
										usr.RightLeg  = "Mangled"
										usr.BloodContent -= 25
										usr.BloodLoss()
										view(usr) << "<b><font color=red>[usr] falls and mangles their right leg!<br>"
										if(usr.LeftLegHP <= 10)
											usr.CanWalk = 0
					if("Chasm")
						if(usr.density && !usr.Flying)
							Owner << "[usr] falls down a large chasm!<br>"
							view(usr) << "[usr] falls down a large chasm!<br>"
							del(usr)
							return
					else
						RestoreTemperature()
			if(icon=='Stairs.dmi')
				if(copytext(icon_state,-2)=="Up")
					switch(z)
						if(GROUND_LAYER)
							usr.z=SKY_LAYER
						if(UNDERGROUND_LAYER)
							usr.z=GROUND_LAYER
						if(SKY_LAYER)
							return
				if(copytext(icon_state,-4)=="Down")
					switch(z)
						if(GROUND_LAYER)
							usr.z=UNDERGROUND_LAYER
						if(UNDERGROUND_LAYER)
							return
						if(SKY_LAYER)
							usr.z=GROUND_LAYER
				usr.destination = null
