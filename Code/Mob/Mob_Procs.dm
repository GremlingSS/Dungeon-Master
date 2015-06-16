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

/mob/proc/SunLight()
	if(!key)
		switch(Race)
			if("Vampire","Svartalfar")
				if(!NotInLight)
					NotInLight=1
					spawn()
						while(NotInLight)
							var/turf/LOCATION = loc
							if(!isturf(loc))
								NotInLight=0
								return
							if(DayWalker || LOCATION.density || LOCATION.icon_state=="CaveFloor" || LOCATION.icon_state=="HellFloor" || LOCATION.Detailed || LOCATION.isbridge || LOCATION.CaveWater || LOCATION.icon_state=="Chasm"||night)
								NotInLight=0
								return
							switch(Race)
								if("Vampire")
									src.Owner << "<b><font color=red>[src] takes damage from the sun!"
									src.HP -= 35
									if(src.HP <= 0)
										src.GoingToDie = 1
										src.Killer = "The Sun"
										src.DeathType = "Being Burned"
										src.Death()
										return
								if("Svartalfar")
									if(Mana>=5)
										Mana-=5
								else
									NotInLight=0
									return
							sleep(50)

/mob/Monsters/proc/StartAllProcs()
	FullHeal() //Before ANY other procs in case it could mean death.
	RebuildOverlays()
	if(Race!="Gargoyle" && Race!="Skeleton")
		spawn()
			Bleeding()
		spawn()
			Heal()
	spawn()
		Hunger()
	spawn()
		Tiredness()
	spawn()
		WalkTo()
	spawn()
		switch(Race)
			if("Zombie","Skeleton","Devourer")
			else
				Bed()
	spawn()
		LevelUp()
	spawn(5) //Time to allow saves to be loaded and everything.
		spawn()
			switch(Race)
				if("Lizardman","Vampire")
					Regen()
				if("Demon")
					FlameAttack()
			switch(SubRace)
				if("Werewolf")
					Regen()
					WerewolfTransformation()

/atom/var/tmp/destination

/mob/Monsters/proc/WalkTo(LINKED=1)
//	sleep(Delay+CanBeSlaved*2)
	if(StopDouble("WalkTo") || LINKED)
		spawn()
			while(!CanBeSlaved)
				sleep(Delay)
				if(Delay < 1)
					src.Delay = 1
				if(destination)
					if(!Fainted&&!Stunned&&!Sleeping&&CanWalk)
						if(CliffClimber||Flying)
							if(z==1||z==3)
								if(istype(destination,/atom/))
									var/atom/F = destination
									if(F.z != z)
										switch(F.z)
											if(3)
												for(var/turf/W in range(1,src))
													if(W.density || Flying)
														if(W.opacity || Flying)
															var/turf/W2 = locate(x,y,3)
															if(W2)
																if(W2.icon_state == "Sky")
																	z = 3
																	break
											if(1)
												if(Flying)
													for(var/turf/W in range(0,src))
														if(W.icon_state == "Sky")
															z=1
															break
						step_towards(src,destination)
						if(loc == destination)
							destination = null
			RandomWalk(1)

/mob/Monsters/proc/Hunger()
	if(StopDouble("Hunger"))
		spawn()
			while(1)
				sleep(400)
				if(MagicalAptitude)
					if(Mana < MaxMana)
						Mana += MagicalConcentration / 2
						for(var/obj/Items/Equipment/Armour/Chestplate/ChaosRobe/C in src)
							if(C.suffix == "(Equipped)")
								Mana += 5
						for(var/obj/Items/Equipment/Armour/Helmet/ChaosHood/C in src)
							if(C.suffix == "(Equipped)")
								Mana += 5
						for(var/obj/Items/Equipment/Armour/Capes/ChaosCape/C in src)
							if(C.suffix == "(Equipped)")
								Mana += 5
					if(Mana > MaxMana)
						Mana = MaxMana
				if(HP < MAXHP)
					HP += 10
					if(HP > MAXHP)
						HP = MAXHP
				if(ismob(Owner))
					if(!InHole && Owner:client)
						switch(Race)
							if("Zombie","Devourer")
								if(Hunger < 100)
									Hunger += 0.5
							else
								switch(Race)
									if("Spider")
										if(WebContent < MaxWebContent)
											WebContent += 35 + Level
											if(WebContent > MaxWebContent)
												WebContent = MaxWebContent
											if(WebContent < 0)
												WebContent = 0
									if("Dragon")
										if(Age >= 50 && Gender == "Female")
											if(EggContent < 3)
												EggContent += 0.005
											if(EggContent > 3)
												EggContent = 3
								if(!InHole&&Race != "Gargoyle")
									if(Race=="Lizardman")
										Hunger -= 0.5
									else
										Hunger-=1
								if(Hunger<=20)
									if(!EatSomething())
										Owner << "<b><font color=red>[src] : I'm Hungry!" //Now it only pops up if you don't have food.
										if(Hunger<=10)
											HP+=Hunger //You're thinking "PLUS?!" but infact, the value is always below zero in this situation, so it's lowering your HP.
										//	if(HP<=0) Death("has died of starvation!")
											if(HP <= 0)
												GoingToDie = 1
												Killer = "Lack Of Food"
												DeathType = "Starvation"
												Death()

/mob/Monsters/proc/EatSomething()
	switch(Race)
		if("Gargoyle")
			for(var/obj/Items/ores/ITEM in src)
				if(ITEM.icon_state!="Sand")
					if(EatItem(ITEM))
						return(1)
		if("Vampire")
			for(var/mob/Monsters/C in view(1,src))
				if(VampireBite(C,100,1))
					return(1)
		else
			for(var/obj/Items/Food/ITEM in src)
				switch(ITEM.icon_state)
					if("CookedMeat","Grape","Tomato")
						if(EatItem(ITEM))
							return(1)
			for(var/obj/Items/Food/ITEM in src)
				if(EatItem(ITEM))
					return(1)

			for(var/obj/Items/Food/ITEM in range(5,src))
				if(ITEM.ItemType=="Food")
					if(ForcePickUpItem(ITEM))
						if(EatItem(ITEM))
							return(1)
			for(var/mob/Monsters/M in range(5,src))
				for(var/obj/Items/Food/ITEM in M)
					if(ITEM.ItemType=="Food")
						if(M.DropItem(ITEM))
							if(ForcePickUpItem(ITEM))
								if(EatItem(ITEM))
									return(1)

mob/Monsters/proc/Tiredness()
	if(StopDouble("Tiredness"))
		spawn()
			while(1)
				sleep(400)
				if(ismob(Owner))
					if(!InHole&&Owner:client) switch(Race)
						if("Gargoyle","Elf","Zombie","Svartalfar","Devourer")
							if(Tiredness < 100)
								Tiredness +=0.5
						else
							if(src.Tiredness <= 20)
								src.Owner << "<b><font color=red>[src] : I'm Tired!"
								if(!IsMist&&!Flying)
									switch(Race)
										if("Spider","Dragon")
											Sleep(300-Level)
										else for(var/obj/Items/Furniture/Beds/B in view(20,src))
											if(!Sleeping)
												if(destination)
													SavedDest = destination
												else
													SavedDest = loc
												if(B.loc!=src&&B.loc!=loc)
													destination = B.loc
											break
							if(src.Tiredness <= -10)
								src.HP -= 10
								if(src.HP <= 0)
									src.GoingToDie = 1
									src.Killer = "Lack Of Sleep"
									src.DeathType = "Tiredness"
								src.Death()
							else
								src.Tiredness -= 1

/mob/proc/Bed()
	if(StopDouble("Bed"))
		spawn()
			while(1)
				if(CanBeSlaved)
					sleep(1000)
				else
					sleep(5)
				if(Tiredness <= 20)
					for(var/obj/Items/Furniture/Beds/B in view(0,src))
						var/CanSleep = 1
						for(var/mob/Monsters/J in oview(5,src))
							if(J.destination == src)
								CanSleep = 0
						if(CanSleep && src.Sleeping == 0)
							Sleep(300-B.CR)

/mob/proc/Sleep(TIME=300)
	if(!Sleeping)
		if(TIME<=40)
			TIME=40
		spawn(TIME)
			Tiredness = 100
			Sleeping = 0
			destination = SavedDest
			SavedDest = null
			RebuildOverlays()
		Tiredness = 100
		Sleeping = 1
		if(!SavedDest)
			SavedDest = destination
		destination = null
		dir=SOUTH
		RebuildOverlays()
		Deselect()

/mob/proc/CraftItem(obj/Items/A1,RANK) ////////////////For NPC use only.//////////////////////////
	A1.CraftRank = "[RANK] Quality"
	if(RANK=="Quality")
		A1.CraftRank = "Quality"
	if(istype(A1,/obj/Items/Equipment/Armour/))
		A1.MetalArmourCraft()
	if(istype(A1,/obj/Items/Equipment/Weapon/))
		A1.MetalWeaponCraft()
	return(A1)

/mob/proc/ChangeOwnership(WHO,FORCE) //Sets to the owner to WHO, and if WHO is a mob adds to the unit list.
	//If setting to a player make sure WHO is the player's mob, and not just their name.
	//This meaning src's Owner and WHO can both be null and the proc will still work.
	if(!IsRoyal||FORCE)
		var/mob/OWNER
		var/mob/NEWOWNER
		if(ismob(Owner))
			OWNER=Owner //Checks to see if src's owner is a mob, then assigns it to a mob var.
		if(ismob(WHO))
			NEWOWNER=WHO//Same thing, but checks WHO instead of src's Owner.
		if(OWNER) //Thus only triggering if src's Owner is a mob.
			OWNER.UnitList -= src //Removes src from the old Owner's UnitList.
			Deselect()
		if(NEWOWNER) //Thus only triggering if WHO is a mob.
			NEWOWNER.UnitList += src //If WHO is a mob, we'll be adding it to that mob's unit list with this.
			CanBeSlaved=0 //We only want these set to 0 if the ownership if going to a mob.
		Owner = WHO //Regardless of other details, this proc ALWAYS sets src's Owner to WHO unless it is a royal unit.
		return(1)

/mob/proc/Meditation()
	spawn()
		if(Meditating)
			Meditating = 0
			Owner << "[src] prepares to stop meditating."
		else
			Meditating = 1
			view(src) << "[src] starts to meditate. They will slowly gain magical skills over time."
			if(StopDouble("Meditation"))
				while(Meditating)
					if(ismob(Owner)) if(!Owner:client) break
					Target = null
					BowOn = 0
					CanWalk = 0
					destination = null
					sleep(100)
					if(MagicalWill < 50) if(prob(35))
						MagicalWill += 0.5
						if(Race == "Svartalfar") MagicalWill += 0.5
					if(MagicalAnger < 50) if(prob(35))
						MagicalAnger += 0.5
						if(Race == "Svartalfar") MagicalAnger += 0.5
					if(MagicalMind < 50) if(prob(30))
						MagicalMind += 0.5
						if(Race == "Svartalfar") MagicalMind += 0.5
					if(MagicalConcentration < 50) if(prob(30))
						MagicalConcentration += 0.5
						if(Race == "Svartalfar") MagicalConcentration += 0.5
					if(MaxMana < 250) if(prob(40))
						MaxMana += 1.25
						if(Race == "Svartalfar") MaxMana += 1.25
					if(Mana<MaxMana) Mana+=0.5
					GainEXP(25)
				Meditating=0
				view(src) << "[src] finishes meditating and stands up."
				RunningProcs-="Meditation"
				CanWalk = 1

/mob/proc/CacoonTrap()
	for(var/mob/Monsters/X in range(4,src))
		var/OGB = 0
		if(X.Owner != src.Owner)
			if(!X.Critter)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.name in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0)
			var/mob/Monsters/Devourer/FleshCrawler/F1 = new(loc)
			var/mob/Monsters/Devourer/FleshCrawler/F2 = new(loc)
			F1.Owner = src.Owner
			F2.Owner = src.Owner
			F1.destination = X
			F2.destination = X
			F1.name = "{[F1.Owner]} Flesh Crawler"
			F2.name = "{[F2.Owner]} Flesh Crawler"
			view(src) << "[src] explodes open in a shower of gore and releases two small monstrosities!"
			src.Owner << "<b><font color=red><font size=3>[src] has detected an intruder at [src.x],[src.y],[src.z]!"
			del src
	spawn(5)
		src.CacoonTrap()

/mob/proc/SolarPowered()
	if(night == 0)
		src.Hunger += 1
		if(src.Hunger >= 100)
			src.Hunger = 100
		src.Mana += 1
		if(src.Mana >= src.MaxMana)
			src.Mana = src.MaxMana
		src.Tiredness += 0.5
		if(src.Tiredness >= 100)
			src.Tiredness = 100
	spawn(100)
		src.SolarPowered()

/mob/proc/Running()
	if(!Running && Delay > 1)
		view(src) << "[src] starts to run!"
		Running = 1
		Delay -= 1
		Tiredness -= 25
		spawn(300)
			Delay += 1
			view(src) << "[src] stops running!"
			spawn(100)
			Running = 0

/mob/proc/textlist(var/textlist)
	writing=list();for(var/t=1,t<=length(textlist),t++)writing+=copytext(textlist,t,t+1)

/mob/proc/Text(mob/m,var/x,var/y,var/offx,var/offy,var/t)
	if(m.key!=null)
		textlist(t)
		for(var/w in writing)
			var/obj/HUD/Text/s=new(m.client)
			s.screen_loc="[x]:[offx],[y]:[offy]"
			s.icon_state=w
			s.name="\proper[w]"
			offx+=8
			if(offx >= 32) {/*sleep(0.1);*/offx-=32 ; x++}

/mob/proc/FindItems()
	for(var/obj/Items/I in view(6,src))
		if(I.suffix == null)
			if(I.Door == 0)
				if(I.IsTrap == 0)
					if(I.Content3 != "Cage")
						if(src.Target == null)
							src.Target = I
	for(var/obj/Items/I in view(0,src))
		if(src.Target == I)
			del(I)
	if(src.Target)
		var/obj/A = src.Target
		if(A.suffix == null)
			step_towards(src,src.Target)
		else
			src.Target = null
	else
		step_rand(src)
	spawn(10)
		FindItems()

/mob/proc/TurnOffAttack()
	src.destination = null
	spawn(500) TurnOffAttack()

/mob/proc/PetFollow()
	if(destination)
		step_towards(src,src.destination)
	else
		return
	spawn(5)
		PetFollow()


mob/proc/Ready()
	src.Owner << "<b><font color=purple>[src]'s egg sack begins to swell she may now create a lair!"
	src.icon = 'SpiderQueenMature.dmi'
	src.icon_state = "Normal"
	src.MaxWebContent += 100
	src.WebContent = src.MaxWebContent
	src.CanBreed = 1

/mob/proc/Detail()
	for(var/mob/Monsters/M in usr.Selected)
		var/mob/Test/left = new
		left.loc = locate(M.x-1,M.y,M.z)
		for(var/turf/TUR in view(0,left))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTH
				src.destination = null
			if(TUR.dir == SOUTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == NORTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHEAST
		var/mob/Test/right = new
		right.loc = locate(M.x+1,M.y,M.z)
		for(var/turf/TUR in view(0,right))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTH
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == NORTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHWEST
		var/mob/Test/top = new
		top.loc = locate(M.x,M.y+1,M.z)
		for(var/turf/TUR in view(0,top))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = WEST
				src.destination = null
			if(TUR.dir == NORTHEAST)
				TUR.dir = WEST
			if(TUR.dir == NORTHWEST)
				TUR.dir = WEST
			if(TUR.dir == NORTH)
				TUR.dir = SOUTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = SOUTHWEST
		var/mob/Test/bot = new
		bot.loc = locate(M.x,M.y-1,M.z)
		for(var/turf/TUR in view(0,bot))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = EAST
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = EAST
			if(TUR.dir == SOUTHWEST)
				TUR.dir = EAST
			if(TUR.dir == NORTH)
				TUR.dir = NORTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = NORTHWEST
		var/mob/Test/botleft = new
		botleft.loc = locate(M.x-1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHWEST
				src.destination = null
		var/mob/Test/botright = new
		botright.loc = locate(M.x+1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHEAST
				src.destination = null
		var/mob/Test/topright = new
		topright.loc = locate(M.x+1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHEAST
				src.destination = null
		var/mob/Test/topleft = new
		topleft.loc = locate(M.x-1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHWEST
				src.destination = null
		del(topleft)
		del(topright)
		del(botright)
		del(botleft)
		del(bot)
		del(top)
		del(left)
		del(right)

/mob/proc/Save()
	var/sav = "players/[src.ckey]_save.sav"
	var/savefile/S = new(sav)
	S["Kills"] << src.Kills
	S["Faction"] << src.Faction
	S["IsClanLeader"] << src.IsClanLeader

/mob/proc/Load()
	var/sav = "players/[src.ckey]_save.sav"
	if(length(file(sav)))
		var/savefile/S = new(sav)
		S["Kills"] >> src.Kills
		S["Faction"] >> src.Faction
		S["IsClanLeader"] >> src.IsClanLeader

/mob/proc/Heat()
	for(var/mob/Monsters/M in view(4,src))
		if(M.Coldness >= 0)
			M.Coldness = 0
	for(var/turf/grounds/KKG in view(1,src))
		if(KKG.OnFire == 0)
			if(KKG.IsWood == 1)
				var/CatchChance = prob(10)
				if(CatchChance)
					if(KKG.icon_state == "WoodWall")
						KKG.Fire()
					if(KKG.icon_state == "TribalWall")
						KKG.Fire()
					if(KKG in view(0,src))
						if(KKG.icon_state == "WoodFloor")
							KKG.Fire()
						if(KKG.icon_state == "Tribal")
							KKG.Fire()
	spawn(75)
		Heat()

/mob/proc/BodyDecay()
	spawn(4000)
	if(src.suffix == null)
		del(src)
	else
		src.BodyDecay()

/mob/proc/FishDecay()
	spawn(500)
		if(src.suffix == null)
			del(src)

/mob/proc/Struggle()
	if(src)
		for(var/obj/Items/Traps/PitTrap/P in view(0,src))
			if(src.InHole == 1)
				var/E
				E = prob(src.SneakingSkill/2)
				if(E == 1)
					view()<< "<b><font color=red>[src] has escaped from a pit trap!"
					src.Owner << "<b><font color=red>[src] has escaped from a pit trap!"
					src.InHole = 0
					src.SneakingSkill += 0.5
					del(P)

			else
				return
	spawn(100)
		Struggle()

/mob/proc/FlameAttack()
	if(src.destination in view(1,src))
		view() << "[src] breathes fire over [src.destination]"
		var/obj/Fire/F = new
		F.loc = src.loc
		F.dir = src.dir
	spawn(750)
		FlameAttack()

/mob/proc/Close()
	if(src.Up == 0)
		src.Up = 1
		Building(src)
		return
	else
		src.Up = 0
		for(var/obj/HUD/H in src.client.screen)
			del(H)

/mob/proc/StopWalk()
	if(src.Wagon == 0)
		src.WalkNumber += 1
		src.CanWalk = 0
		spawn(20)
			src.WalkNumber -= 1
			if(src.WalkNumber <= 0)
				src.WalkNumber = 0
				src.Stunned = 0
				src.CanWalk = 1
			return
/mob/proc/StunnedWalk()
	if(src.Wagon == 0)
		src.WalkNumber += 1
		view(src) << "[src] is stunned!"
		src.Stunned = 1
		spawn(150)
			src.WalkNumber -= 1
			if(src.WalkNumber <= 0)
				src.Stunned = 0
				src.CanWalk = 1
				view(src) << "[src] is no longer stunned."
			return

/mob/proc/Slowdown2()
	if(src.Wagon == 0)
		src.Delay += 5
		spawn(50)
			src.Delay -= 5
			return

mob/proc/LegendView()
	src << browse(Legends)

/mob/proc/FightSound()
	spawn(5)
		if(src.HoldingWeapon)
			var/S = rand(1,3)
			if(S == 1)
				view() << '1.wav'
			if(S == 2)
				view() << '2.wav'
			if(S == 3)
				view() << '3.wav'

/mob/proc/FightSound2()
	spawn(5)
		if(!HoldingWeapon)
			var/S = rand(1,3)
			if(S == 1)
				view() << 'P1.wav'
			if(S == 2)
				view() << 'P2.wav'
			if(S == 3)
				view() << 'P3.wav'

/mob/proc/CreatePotion()
	var/mob/WorkShops/PotionStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Potion Station"
	L.overlays += /obj/WSoverlays/Poison/
	var/mob/WorkShops/PotionStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Potion Station"
	src.WoodCraftingSkill += 1

/mob/proc/CreateBone()
	var/mob/WorkShops/BoneCraft/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "BoneCraftingStation"
	L.overlays += /obj/WSoverlays/Bone/
	var/mob/WorkShops/BoneCraft/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "BoneCraftingStation"
	src.WoodCraftingSkill += 1

/mob/proc/CreatePoison()
	var/mob/WorkShops/PoisonStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "PoisonStation"
	L.overlays += /obj/WSoverlays/Poison/
	var/mob/WorkShops/PoisonStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "PoisonStation"
	src.WoodCraftingSkill += 1

/mob/proc/CreateWorkShopLeather()
	var/mob/WorkShops/LeatherWorks/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "LeatherCraftingStation"
	L.overlays += /obj/WSoverlays/Leather/
	var/mob/WorkShops/LeatherWorks/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "LeatherCraftingStation"
	src.WoodCraftingSkill += 1

/mob/proc/CreateCarpentry()
	var/mob/WorkShops/Carpentry/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "CarpentryCraftingStation"
	L.overlays += /obj/WSoverlays/Carpentry/
	var/mob/WorkShops/Carpentry/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "CarpentryCraftingStation"
	src.WoodCraftingSkill += 1

/mob/proc/CreateSmelter()
	var/mob/WorkShops/Smelters/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "SmelterStation"
	L.overlays += /obj/WSoverlays/Smelter/
	var/mob/WorkShops/Smelters/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "SmelterStation"
	src.StoneCraftingSkill += 1

/mob/proc/CreatePit()
	var/obj/Items/Traps/PitTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.name = "Pit"
	if(src.SubRace == "Hunter")
		if(src.Level >= 20)
			L.icon = null
			L.Hole = 1
	src.StoneCraftingSkill += 1

/mob/proc/CreateRib()
	var/obj/Items/Traps/RibTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Rib Trap"
	src.BoneCraftingSkill += 1

/mob/proc/CreateBST()
	var/obj/Items/Traps/BST/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Bone Spike Trap"
	src.BoneCraftingSkill += 1

/mob/proc/CreateCacoonTrap()
	var/obj/Items/Traps/CacoonTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Cacoon Trap"
	src.BoneCraftingSkill += 1

/mob/proc/CreateStone()
	var/obj/Items/Traps/StoneTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Stone Fall Trap"
	src.StoneCraftingSkill += 1

/mob/proc/CreateForge()
	var/mob/WorkShops/Forge/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "ForgeStation"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Forge/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "ForgeStation"
	src.StoneCraftingSkill += 1

/mob/proc/CreateKit()
	var/mob/WorkShops/Kitchen/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Kitchen"
	L.overlays += /obj/WSoverlays/Kitchen/
	var/mob/WorkShops/Kitchen/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Kitchen"
	src.WoodCraftingSkill += 1

/mob/proc/CreateGem()
	var/mob/WorkShops/GemCutter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "GemCutter"
	L.overlays += /obj/WSoverlays/Gem/
	var/mob/WorkShops/GemCutter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "GemCutter"
	src.StoneCraftingSkill += 1

/mob/proc/CreateMasonary()
	var/mob/WorkShops/Masonary/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Masonary"
	L.overlays += /obj/WSoverlays/Masonary/
	var/mob/WorkShops/Masonary/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Masonary"
	src.StoneCraftingSkill += 1

/mob/proc/CreateMelter()
	var/mob/WorkShops/Melter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Melter"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Melter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Melter"
	src.StoneCraftingSkill += 1
