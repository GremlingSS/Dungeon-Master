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
