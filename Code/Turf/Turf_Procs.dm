 //This should REALLY be a mob proc..
/turf/proc/ApplyTemperature(Temperature)
	if(usr)
		if(!usr.key)
			if(!usr.ImmuneToTemperature)
				if(!usr.Undead)
					if(!usr.CanBeSlaved)
						if(Temperature > 0 && !night)
							usr.Coldness -= Temperature
						if(Temperature < 0 && night)
							usr.Coldness -= Temperature
						if(usr.Coldness >= 100)
							usr.Coldness -= 5
							usr.destination = null
							usr.Owner << "[usr] starts to get frost bite!"
							usr.HP -= 20
							if(usr.HP <= 0)
								usr.GoingToDie = 1
								usr.Killer = "Frost Bite"
								usr.DeathType = "Coldness"
								usr.Death()
								return
						else if(usr.Coldness <= -100)
							usr.Coldness += 5
							usr.destination = null
							usr.Owner << "The heat damages [usr]"
							usr.HP -= 20
							if(usr.HP <= 0)
								usr.GoingToDie = 1
								usr.Killer = "Heat Stroke"
								usr.DeathType = "Overheating"
								usr.Death()
								return

/turf/proc/RestoreTemperature()
	if(usr)
		if(usr.Coldness)
			if(usr.Coldness > 0)
				usr.Coldness -= 1
				if(usr.Coldness < 0)
					usr.Coldness = 0
			else if(usr.Coldness < 0)
				usr.Coldness += 1
				if(usr.Coldness > 0)
					usr.Coldness = 0

/turf/proc/SparkleGlow()
	src.overlays += /obj/sparkle/
	spawn(15)
		src.overlays -= /obj/sparkle/

/turf/proc/ForceField()
	if(src.density == 0)
		for(var/mob/Monsters/M in src) return
		src.overlays += /obj/forcefield/
		src.density = 1
		spawn(300)
			src.overlays -= /obj/forcefield/
			src.density = 0

/turf/proc/ForestGrowth()
	var/GrowGrow = prob(4)
	if(GrowGrow)
		for(var/turf/T in range(5,src))
			var/GrowProb = prob(4)
			if(GrowProb == 1)
				if(T.icon_state == "Desert" || T.icon_state == "Grass" || T.Content == "Marsh")
					for(var/obj/Items/Seeds/S in view(0,T))
						return
					var/obj/Items/Seeds/TreeSeed/A1 = new()
					A1.loc = T
					if(T.icon_state == "Grass")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
					if(T.icon_state == "Desert")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
					if(T.Content == "Marsh")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
	else
		return

/turf/proc/MeteorStrike()
	switch(rand(1,8))
		if(1)
			src.icon = 'Lava.dmi'
			src.icon_state = "Lava"
			src.CanFish = 0
			src.Detailed = 0
			src.Content3 = "Lava"
			src.Content3 = "Lava"
			src.OIcon = "Lava"
			src.Cant = 1
			src.density = 1
			src.opacity = 0
			src.name = "Lava"
			src.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
		if(2)
			src.name = "cavefloor"
			src.icon = 'Cave.dmi'
			src.icon_state = "CaveFloor"
			src.CanDigAt = 0
			src.density = 0
			src.CanFish = 0
			src.Detailed = 0
			src.Content3 = null
			src.opacity = 0
			src.Sky = 1
		if(3)
			src.CanFish = 0
			src.Content3 = null
			src.name = "Mountain"
			src.icon = 'Cave.dmi'
			src.icon_state = "CaveWall"
			src.density = 1
			src.CanDigAt = 1
			src.HP = 100
			src.opacity = 1
			src.Cant = 0
			src.Sky = 1
			src.OIcon = "CaveFloor"
		if(4)
		if(5) if(prob(10)) new/obj/Items/gems/UnCutDiamond(loc)
		if(6) if(prob(10)) new/obj/Items/gems/UnCutRuby(loc)
		if(7) if(prob(10)) new/obj/Items/gems/UnCutEmerald(loc)
		if(8)
			for(var/mob/Monsters/MM in view(0,src)) MM.Fire()
			for(var/turf/grounds/GG in view(0,src)) GG.Fire()

