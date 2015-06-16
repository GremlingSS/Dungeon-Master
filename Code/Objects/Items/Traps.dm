/obj/Items/Traps
	IsTrap = 1

/obj/Items/Traps/Cages

/obj/Items/Traps/Cages/DblClick()
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
			if(M.Wagon == 0)
				var/obj/A4 = src
				A4.loc = M
				var/list/menu = new()
				if(M.density == 1)
					menu += "Drop"
					menu += "Inspect"
					for(var/mob/Monsters/Q in src)
						if(Q.Cantame == 1) menu += "Tame"
						if(Q.CanBeSlaved == 1 && Q.Race != "Demon") menu += "Enslave"
					//	if(M.Age >= 29 && M.SubRace=="Queen") menu += "Lay Eggs In"
						menu += "Contents"
						menu += "TakeItems"
						menu += "Release"
					menu += "Capture"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						return
				if (Result == "Contents") for(var/mob/Monsters/A in src) usr << "[A] - [A.Gender]"
				if (Result == "TakeItems") for(var/mob/Monsters/A in src) for(var/obj/Items/O in A) if(A.DropItem(O)) O.loc=M.loc
				if (Result == "Enslave")
					for(var/mob/Monsters/A in src)
						A.ChangeOwnership(M.Owner)
						view() << "[A] has been enslaved!"
						A.name = "{[M.Owner]} Slave"
						A.loc = M.loc
						src.underlays = null
						src.overlays = null
						src.HasPersonIn = 0
						A.InHole = 0
						A.CanBeCaged = 1
						A.HomeLoc=null
						A.PatrolPoint1 = null
						A.PatrolPoint2 = null
						A.HomeLoc = null
						A.Target = null
						A.Caged = 0
				if (Result == "Capture") for(var/mob/Monsters/C in oview(1,M)) if(!HasPersonIn&&!C.Wagon)
					if(!M.CanBeCaged)
						switch(C.Race)
							if("Gremlin","SandKing") usr << "[C.Race]s cannot be caged"
							else
								var/CAN
								if(C.CanBeCaged&&C.Owner==M.Owner) CAN=1
								if(C.InHole || C.Fainted || C.Tame || C.Cantame) CAN=1
								if(CAN)
									for(var/obj/Items/Traps/PitTrap/P in oview(1,M)) if(C.loc == P.loc) if(P.HasPersonIn) del(P)
									var/Escape = prob(C.Level - M.Level)
									if(M.Race == "Spider") Escape = prob(C.Level - (M.Level+10))
									if(!Escape)
										C.Target = null
										C.HomeLoc = null
										C.destination = null
										C.PatrolPoint1 = null
										C.PatrolPoint2 = null
										C.loc = src
										C.BleedType = null
										C.BloodContent = C.MaxBloodContent
										C.Caged = 1
										view(M) << "<b><font color=red>[C] is loaded into [src]"
										HasPersonIn = 1
										underlays += C
										C.Deselect()
									else
										C.InHole = 0
										view() << "[M] attempts to load [C] into a cage but they escape and climb out of the pit!"
										return
					else M.Owner << "[M] is part of a slave race, races that have been enslaved cannot cage units."
				if (Result == "Tame")
					for(var/mob/Monsters/C in src)
						C.loc = M.loc
						view() << "<b><font color=red>[C] is tamed by [M]"
						src.underlays = null
						src.overlays = null
						src.HasPersonIn = 0
						C.name = "{[M.Owner]}"
						C.Tame = 1
						C.Cantame = 0
						C.destination = M
						C.InHole = 0
						C.WalkTo()
						C.Owner = C.OldOwner
						C.OldOwner = null
						C.Caged = 0
						C.Owner = M.Owner
						var/mob/F = M.Owner
						F.UnitList += C
				if (Result == "Release")
					for(var/mob/Monsters/C in src)
						C.loc = M.loc
						view(C) << "<b><font color=red>[C] is released from [src] by [M]"
						src.underlays = null
						src.overlays = null
						src.HasPersonIn = 0
						if(C.OldOwner)
							C.Owner = C.OldOwner
							C.OldOwner = null
						C.InHole = 0
						C.Caged = 0
	Content3 = "Cage"

/obj/Items/Traps/Cages/GoldCage
	icon = 'GoldItems.dmi'
	icon_state = "Cage"
	weight = 50
	suffix = null
	desc = "This is a gold cage, it can be used to capture creatures in"

/obj/Items/Traps/Cages/MetalCage
	icon = 'MetalObjects.dmi'
	icon_state = "Cage"
	weight = 50
	suffix = null
	desc = "This is a metal cage, it can be used to capture creatures in"

/obj/Items/Traps/Cages/Cacoon
	icon = 'Spiders.dmi'
	icon_state = "Cage"
	weight = 25
	suffix = null

/obj/Items/Traps/Cages/BoneCage
	icon = 'BoneItems.dmi'
	icon_state = "Cage"
	weight = 40
	suffix = null

/obj/Items/Traps/Cages/WoodenCage
	icon = 'Cave.dmi'
	icon_state = "Cage"
	weight = 40
	suffix = null
	desc = "This is a wooden cage, it can be used to capture creatures in"

/obj/Items/Traps/PitTrap
	icon = 'Cave.dmi'
	icon_state = "Hole"
	CantKill = 1

/obj/Items/Traps/PitTrap/New()
	PitTrap()

/obj/Items/Traps/BST
	icon = 'Cave.dmi'
	icon_state = "BST"

/obj/Items/Traps/BST/New()
	BSTTrap()

/obj/Items/Traps/CacoonTrap
	icon = 'Devourer.dmi'
	icon_state = "TinyCacoon"

/obj/Items/Traps/CacoonTrap/New()
	CacoonTrap()

/obj/Items/Traps/RibTrap
	icon = 'Cave.dmi'
	icon_state = "RibTrap"

/obj/Items/Traps/RibTrap/New()
	RibTrap()

/obj/Items/Traps/StoneTrap
	icon = 'Cave.dmi'
	icon_state = "FallTrap"

/obj/Items/Traps/StoneTrap/New()
	StoneTrap()

/obj/Items/Traps/Spikes

/obj/Items/Traps/Spikes/WoodenSpike
	icon = 'Cave.dmi'
	icon_state = "Spike"
	weight = 5
	suffix = null
	desc = "This is a wooden spike, it can be combined with a pit to create a spike pit"

/obj/Items/Traps/Spikes/WoodenSpike/DblClick()

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
		for(src in M)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					src.loc = M.loc
					src.suffix = null
					M.weight -= src.weight
					return

/obj/proc/CacoonTrap()
	var/OGB = 0
	for(var/mob/Monsters/X in range(4,src))
		if(X.Owner != src.Owner)
			if(!X.Critter)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.name in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0 && X.Owner != src.Owner)
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
	spawn(5) src.CacoonTrap()

/obj/proc/BSTTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									M.LeftLegHP -= 10
									M.RightLegHP -= 10
									M.BloodContent -= 15
									M.BloodLoss()
									M.SneakingSkill += 0.1
									var/Break = prob(3)
									if(Break == 1)
										del(src)
										return
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Race != "Gargoyle")
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									else
										M.SneakingSkill += 0.1
	spawn(5)
		BSTTrap()
		return

/obj/proc/RibTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									src.Hole = 0
									src.IsSpiked = 0
									view() << "<b><font color=red>[M] walks over a trap and their legs are crushed!"
									M.LeftLegHP -= 60
									M.RightLegHP -= 60
									M.BloodContent -= 50
									M.BloodLoss()
									M.SneakingSkill += 1.5
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Race != "Gargoyle")
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									del(src)
								else
									M.SneakingSkill += 0.1
	spawn(5)
		RibTrap()
		return

/obj/proc/StoneTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			for(var/mob/KLK in world)
				if(src.Owner == KLK)
					for(var/mob/MK in world)
						if(M.Owner == MK)
							if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
								OGB = 1
			if(M.Owner == src.Owner)
				..()
			else
				if(M.Wagon == 0)
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							var/avoid = prob(M.SneakingSkill)
							if(avoid == 0)
								if(!M.WearingHelmet)
									if(M.Race != "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head"
										M.HeadHP -= 80
										M.BloodContent -= 65
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(70)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Race == "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
								else
									if(M.Race != "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head, but some of the force is deflected by their helmet."
										M.HeadHP -= 50
										M.BloodContent -= 40
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(50)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Race == "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
							else
								M.SneakingSkill += 0.1
	spawn(5)
		StoneTrap()
		return

/obj/proc/PitTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(src.Owner == KLK)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner) ..()
				else
					if(M.Wagon == 0)
						if(src.HasPersonIn == 0)
							if(OGB == 0)
								if(M.density == 1)
									var/avoid = prob(M.SneakingSkill+40)
									if(src.IsSpiked == 0)
										if(avoid == 0)
											M.destination = null
											for(var/mob/A in world) if(A == M.Owner) M.Deselect()
											src.HasPersonIn = 1
											M.InHole = 1
											src.Hole = 0
											src.icon = 'Cave.dmi'
											src.icon_state = "Hole"
											view(src) << "<b><font color=red>[M] falls into a pit"
											src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
											M.Struggle()

									if(src.Poisoned == 1)
										if(avoid == 0)
											if(src.IsSpiked == 1)
												M.HP  -= src.PoisonContent
												M.LeftLegHP -= 80
												M.RightLegHP -= 80
												M.BloodContent -= 60
												M.BloodLoss()
												src.Hole = 0
												src.icon = 'Cave.dmi'
												src.icon_state = "Hole"
												src.IsSpiked = 0
												src.Poisoned = 0
												src.PoisonContent = 0
												view(src) << "<b><font color=red>[M] falls into a posionious spiked trap"
												src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
												var/Stun = prob(50)
												if(Stun == 1)
													if(M.Race != "Gargoyle")
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
												else
													M.SneakingSkill += 0.1
											if(src.IsSpiked == 1)
												if(avoid == 0)
													M.LeftLegHP -= 70
													M.RightLegHP -= 70
													M.BloodContent -= 50
													M.BloodLoss()
													src.Hole = 0
													src.icon = 'Cave.dmi'
													src.icon_state = "Hole"
													src.IsSpiked = 0
													view(src) << "<b><font color=red>[M] falls into a spiked trap"
													src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
													if(prob(50))
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
													else
														M.SneakingSkill += 0.1
	spawn(5)
		PitTrap()
		return
