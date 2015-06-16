/atom/proc/Smoke()
	if(src.OnFire)
		var/obj/Smoke/S = new
		S.loc = locate(src.x,src.y,src.z)
		S.dir = NORTH
	else
		return
	spawn(50)
		Smoke()

/atom/proc/Fire()
	if(IsWood)
		var/FireResist = 0
		if(ismob(src))
			var/mob/M = src
			switch(M.Race)
				if("Dragon")
					return
				if("Gargoyle")
					return
			if(M.SubRace == "HalfDemon")
				return
		for(var/obj/Items/Equipment/Armour/A in src)
			if(A.suffix == "(Equipped)")
				if(A.Race == "Demon")
					FireResist += 20
		if(prob(FireResist))
			return
		if(!src.OnFire)
			src.overlays += 'Fire.dmi'
			src.OnFire = 1
		else
			if(src.IsWood)
				if(src.icon_state == "WoodenDoor")
					del src
					return
				if(src.icon_state == "Open")
					del src
					return
				if(src.icon_state == "Wooden Chest")
					for(var/obj/Items/I in src)
						I.suffix = null
						I.loc = src.loc
					del src
					return
				if(src.Wagon == 1)
					for(var/obj/Items/I in src)
						I.suffix = null
						I.loc = src.loc
					del src
					return
				src.Fuel -= 10
				if(ismob(src))
					var/mob/M = src
					M.LeftLegHP -= 18
					M.RightLegHP -= 18
					M.RightArmHP -= 18
					M.LeftArmHP -= 18
					M.BloodContent -= 50
					M.LeftLeg = "Burned"
					M.RightLeg = "Burned"
					M.RightArm = "Burned"
					M.LeftArm = "Burned"
					M.BloodLoss()
					spawn(150)
						for(var/turf/grounds/W in view(1,src))
							if(W.icon_state == "water")
								src.OnFire = 0
								src.overlays -= 'Fire.dmi'
								src.Fuel = 100
								src.IsWood = 0
								src.Safe()
						if(src.OnFire == 1)
							src.Fuel = 100
							src.OnFire = 0
							src.overlays -= 'Fire.dmi'
							src.IsWood = 0
							for(var/mob/Monsters/MKM in view(0,src))
								if(MKM == src)
									view(MKM) << "[MKM] burns to death!"
									MKM.GoingToDie = 1
									MKM.Killer = "Fire"
									MKM.DeathType = "Burned To Death"
									MKM.Death()
									return
		spawn(200)
			for(var/atom/T in view(2,src))
				if(T.OnFire == 0)
					if(T.IsWood)
						if(ismob(src))
							..()
						else
							if(T.Tree)
								T.overlays -= /obj/Trees/leaves3x2
								T.overlays -= /obj/Trees/leaves2x2
								T.overlays -= /obj/Trees/leaves1x2
								T.overlays -= /obj/Trees/leaves1x1
								T.overlays -= /obj/Trees/leaves2x1
								T.overlays -= /obj/Trees/leaves3x1
							var/catchchance = prob(50)
							if(catchchance)
								T.Fire()
		if(src.Fuel <= 0)
			if(isturf(src))
				src.overlays = null
				src.OnFire = 0
				src.IsWood = 0
				src.Fuel = 100
				src.opacity = 0
				src.density = 0
				src.CanDigAt = 0
				src.Detailed = 0
				src.icon = 'Cave.dmi'
				src.Tree = 0
				src.icon_state = src.OIcon
				src.GoesTo = null
				if(src.z == 1)
					var/obj/Support/Q = new
					Q.loc = locate(src.x,src.y,3)
					for(var/turf/TE in view(0,Q))
						if(TE.Supported == 1)
							TE.Supported = 0
							TE.icon_state = "DFloor"
							TE.name = "Floor"
							TE.density = 0
							TE.Detailed = 0
							if(TE.Content3 == "Peak")
								TE.icon = 'Cave.dmi'
								TE.icon_state = "Peak"
								TE.name = "MountainPeak"
							if(TE.Content == "Sky")
								TE.icon = 'Cave.dmi'
								TE.icon_state = "Sky"
								TE.name = "Sky"
					del(Q)
				return
			else
				src.Fuel = 100
				src.OnFire = 0
				src.overlays -= 'Fire.dmi'
				src.IsWood = 0
				src.Safe()
				return
		spawn(200)
			Fire()
			return

/atom/proc/Safe()
	spawn(400)
		src.IsWood = 1

