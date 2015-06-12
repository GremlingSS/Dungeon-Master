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