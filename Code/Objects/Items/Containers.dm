/obj/Items/Shafts/MetalFlask
	icon = 'LeatherItems.dmi'
	icon_state = "Flask"
	weight = 5
	suffix = null
	desc = "This is a metal flask, it can be useful in hot areas, be sure to fill it up with liquid though"

/obj/Items/Shafts/MetalFlask/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				for(var/atom/A in view(2,M))
					if(src.HasWater == "Water")
						if(A.OnFire == 1)
							menu += "Put Fire Out"
				for(var/obj/Bloods/B in view(1,M))
					if(src.HasWater == null)
						if(M.Wagon == 0)
							menu += "Fill [src] with blood"
				for(var/turf/grounds/W in view(1,M))
					if(W.CanFish == 1)
						if(src.HasWater == null)
							if(M.Wagon == 0)
								menu += "Fill [src] with water"
				for(var/turf/grounds/Trees/Cactus/C in view(1,M))
					if(src.HasWater == null)
						if(M.Wagon == 0)
							menu += "Fill [src]"
				for(var/mob/Monsters/V in oview(1,M))
					if(V.Race == "Vampire")
						if(src.HasWater == "Water")
							if(M.Wagon == 0)
								menu += "Spray"
				if(src.HasWater)
					if(M.Wagon == 0)
						menu += "Empty [src]"
						if(src.HasWater != "Unholy" && src.HasWater != "Holy")
							menu += "Drink"
						else
							menu += "Bless Equipped Weapon"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Spray")
					for(var/mob/Monsters/Vampire/V in oview(1,M))
						src.HasWater = null
						view() << "[M] sprays [V] with water"
						V.BloodContent -= 20
						V.BloodLoss()
						V.Death()
						return
					src.Coldness = 0
				if(Result == "Bless Equipped Weapon")
					for(var/obj/Items/Equipment/Weapon/W in M)
						if(W.suffix == "(Equipped)" && W.Content3 == 0)
							if(src.HasWater == "Unholy")
								W.name = "[W.name] - Cursed"
								W.Content3 = "Cursed"
							if(src.HasWater == "Holy")
								W.name = "[W.name] - Blessed"
								W.Content3 = "Blessed"
				if (Result == "Put Fire Out")
					if(src.HasWater == "Water")
						for(var/atom/A2 in view(2,M))
							if(A2.OnFire == 1)
								A2.OnFire = 0
								A2.overlays -= 'Fire.dmi'
								A2.Fuel = 100
								A2.IsWood = 0
								A2.Safe()
				if (Result == "Drink")
					if(src.HasWater == "Water")
						src.HasWater = null
						M.Owner << "[M] drinks water from [src]"
						M.Coldness = 0
					if(M.Race == "Vampire")
						if(src.HasWater == "Blood")
							src.HasWater = null
							M.Owner << "[M] drinks blood from [src]"
							if(M.Hunger >= 100)
								return
							M.Hunger += 20
				if (Result == "Empty [src]")
					src.HasWater = null
					M.Owner << "[M] empties [src]"
				if (Result == "Fill [src] with water")
					src.HasWater = "Water"
					M.Owner << "[M] fills [src] with water!"
				if (Result == "Fill [src] with blood")
					src.HasWater = "Blood"
					M.Owner << "[M] fills [src] with blood!"
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/Shafts/WoodenBucket
	icon = 'WoodItems.dmi'
	icon_state = "Bucket"
	weight = 7
	suffix = null
	desc = "This is a wooden bucket, it can be useful in hot areas, be sure to fill it up with liquid though"

/obj/Items/Shafts/WoodenBucket/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return

	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				for(var/atom/A in view(2,M))
					if(src.HasWater == "Water")
						if(A.OnFire == 1)
							menu += "Put Fire Out"
				for(var/obj/Bloods/B in view(1,M))
					if(src.HasWater == null)
						if(M.Wagon == 0)
							menu += "Fill [src] with blood"
				for(var/turf/grounds/W in view(1,M))
					if(W.CanFish == 1)
						if(src.HasWater == null)
							if(M.Wagon == 0)
								menu += "Fill [src] with water"
				for(var/turf/grounds/Trees/Cactus/C in view(1,M))
					if(src.HasWater == null)
						if(M.Wagon == 0)
							menu += "Fill [src]"
				for(var/mob/Monsters/V in oview(1,M))
					if(V.Race == "Vampire")
						if(src.HasWater == "Water")
							if(M.Wagon == 0)
								menu += "Spray"
					if(V.Gender == "Female")
						menu += "Milk"
				if(src.HasWater)
					if(M.Wagon == 0)
						menu += "Empty [src]"
						menu += "Drink"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Spray")
					for(var/mob/Monsters/Vampire/V in oview(1,M))
						src.HasWater = null
						view() << "[M] sprays [V] with water"
						V.BloodContent -= 20
						V.BloodLoss()
						V.Death()
						return
					src.Coldness = 0
				if (Result == "Milk")
					for(var/mob/Monsters/V in oview(1,M))
						if(V.Gender == "Female")
							if(V.Hunger >= 25)
								var/GG = Race
								src.HasWater = "Milk"
								src.Content3 = GG
								if(!src.Content3)
									src.Content3 = "Unknown"
								V.Hunger -= 10
								view() << "[M] grabs [V] and milks her"
								return
							else
								usr << "[V] is too hungry!"
					src.Coldness = 0
				if (Result == "Put Fire Out")
					if(src.HasWater == "Water")
						for(var/atom/A2 in view(2,M))
							if(A2.OnFire == 1)
								A2.OnFire = 0
								A2.overlays -= 'Fire.dmi'
								A2.Fuel = 100
								A2.IsWood = 0
								A2.Safe()
				if (Result == "Drink")
					if(src.HasWater == "Water")
						src.HasWater = null
						M.Owner << "[M] drinks water from [src]"
						M.Coldness = 0
					if(src.HasWater == "Milk")
						M.Owner << "[M] drinks [src.Content3] milk from [src]"
						M.Hunger += 10
						if(M.Hunger >= 100)
							M.Hunger = 100
						src.HasWater = null
						src.Content3 = 0
					if(M.Race == "Vampire")
						if(src.HasWater == "Blood")
							src.HasWater = null
							M.Owner << "[M] drinks blood from [src]"
							if(M.Hunger >= 100)
								return
							M.Hunger += 20
				if (Result == "Empty [src]")
					src.HasWater = null
					M.Owner << "[M] empties [src]"
				if (Result == "Fill [src] with water")
					src.HasWater = "Water"
					M.Owner << "[M] fills [src] with water!"
				if (Result == "Fill [src] with blood")
					src.HasWater = "Blood"
					M.Owner << "[M] fills [src] with blood!"
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return

/obj/Items/Shafts/LeatherFlask
	icon = 'LeatherItems.dmi'
	icon_state = "Flask"
	weight = 5
	suffix = null
	desc = "This is a leather flask, it can be useful in hot areas, be sure to fill it up with liquid though"

/obj/Items/Shafts/LeatherFlask/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src in view(1,M))
			M.destination = null
			if(src.suffix == null)
				if(M.weight <= M.weightmax)
					src.loc = M
					src.suffix = "(Carrying)"
					M.weight += src.weight
					return
				else
					usr << "[M] : I Cant Carry Too Much!"
					return
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		if(src in M)
			if(M)
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				for(var/atom/A in view(2,M))
					if(src.HasWater == "Water")
						if(A.OnFire == 1)
							menu += "Put Fire Out"
				for(var/obj/Bloods/B in view(1,M))
					if(src.HasWater == null)
						if(M.Wagon == 0)
							menu += "Fill [src] with blood"
				for(var/turf/grounds/W in view(1,M))
					if(W.CanFish == 1)
						if(src.HasWater == null)
							if(M.Wagon == 0)
								menu += "Fill [src] with water"
				for(var/turf/grounds/Trees/Cactus/C in view(1,M))
					if(src.HasWater == null)
						if(M.Wagon == 0)
							menu += "Fill [src]"
				for(var/mob/Monsters/V in oview(1,M))
					if(V.Race == "Vampire")
						if(src.HasWater == "Water")
							if(M.Wagon == 0)
								menu += "Spray"
				if(src.HasWater)
					if(M.Wagon == 0)
						menu += "Empty [src]"
						if(src.HasWater != "Unholy" && src.HasWater != "Holy")
							menu += "Drink"
						else
							menu += "Bless Equipped Weapon"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Spray")
					for(var/mob/Monsters/Vampire/V in oview(1,M))
						src.HasWater = null
						view() << "[M] sprays [V] with water"
						V.BloodContent -= 20
						V.BloodLoss()
						V.Death()
						return
					src.Coldness = 0
				if(Result == "Bless Equipped Weapon")
					for(var/obj/Items/Equipment/Weapon/W in M)
						if(W.suffix == "(Equipped)" && W.Content3 == 0)
							if(src.HasWater == "Unholy")
								W.name = "[W.name] - Cursed"
								W.Content3 = "Cursed"
							if(src.HasWater == "Holy")
								W.name = "[W.name] - Blessed"
								W.Content3 = "Blessed"
				if (Result == "Put Fire Out")
					if(src.HasWater == "Water")
						for(var/atom/A2 in view(2,M))
							if(A2.OnFire == 1)
								A2.OnFire = 0
								A2.overlays -= 'Fire.dmi'
								A2.Fuel = 100
								A2.IsWood = 0
								A2.Safe()
				if (Result == "Drink")
					if(src.HasWater == "Water")
						src.HasWater = null
						M.Owner << "[M] drinks water from [src]"
						M.Coldness = 0
					if(M.Race == "Vampire")
						if(src.HasWater == "Blood")
							src.HasWater = null
							M.Owner << "[M] drinks blood from [src]"
							if(M.Hunger >= 100)
								return
							M.Hunger += 20
				if (Result == "Empty [src]")
					src.HasWater = null
					M.Owner << "[M] empties [src]"
				if (Result == "Fill [src] with water")
					src.HasWater = "Water"
					M.Owner << "[M] fills [src] with water!"
				if (Result == "Fill [src] with blood")
					src.HasWater = "Blood"
					M.Owner << "[M] fills [src] with blood!"
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return