/obj/HUD/Forcefield
	name = "Forcefield"
	icon_state = "ForcefieldP"
	text = "F"

/obj/HUD/Forcedield/DblClick()
	usr.Function = "Forcefield"
	usr << "Click and drag to place forcefield<br>"
	usr.Close()

/obj/HUD/Pyrokinesis
	name = "Pyrokinesis"
	icon_state = "PyrokinesisP"
	text = "P"

/obj/HUD/Pyrokinesis/DblClick()
	usr.Function = "Pyrokinesis"
	usr << "Click and drag to set fires<br>"
	usr.Close()

/obj/HUD/Telekinesis
	name = "Telekinesis"
	icon_state = "TelekinesisP"
	text = "T"

/obj/HUD/Telekinesis/DblClick()
	usr.Function = "Telekinesis"
	usr << "Click and drag to use telekinesis<br>"
	usr.Close()

/obj/HUD/Mindcontrol
	name = "Mindcontrol"
	icon_state = "MindcontrolP"
	text = "M"

/obj/HUD/Mindcontrol/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace == "Illithid")
			for(var/mob/Monsters/F in range(8,M))
				if(F == M.MagicTarget && F.Owner != M.Owner)
					if(!F.Critter)
						if(F.Undead == 0 && F.Race != "Vampire" && F.Infects == 0 && F.SubRace != "Illithid" && F.Race != "Gargoyle" && F.Race != "Demon" && F.Race != "Bat")
							if(M.Tiredness >= 0)
								if(M.invisibility >= 1)
									M.invisibility = 0
									view(M) << "[M] becomes visible!"
								var/MindDominate = prob(M.Intelligence * 3 - F.Intelligence * 4)
								if(F.CanBeSlaved == 1)
									MindDominate = 1
								if(F.Level >= 10 )
									MindDominate = 0
								if(MindDominate == 1 && F.Race != "Gargoyle")
									M.Tiredness -= 50
									F.ChangeOwnership(M.Owner)
									view(M) << "[M] uses their mental powers to completely dominate [F]'s mind!"
									usr.Close()
									return
								else
									view(M) << "[M] attempts to use their mental powers to dominate [F] but fails."
									M.Tiredness -= 25
									usr.Close()
									return
							else
								M.Owner << "[M] is too tired to do this."
						else
							M.Owner << "You cannot use this power on that creature"
	usr.Close()

/obj/HUD/ReadMind
	name = "ReadMind"
	icon_state = "ReadMindP"
	text = "R"

/obj/HUD/ReadMind/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace == "Illithid")
			for(var/mob/Monsters/F in view(8,M))
				if(F == M.MagicTarget)
					if(F.Undead == 0)
						if(F.icon_state != "TowerCap")
							var/list/menu2 = new()
							menu2 += "Read Speech Records"
							menu2 += "Read Action Records"
							menu2 += "View Inventory"
							menu2 += "View Statistics"
							menu2 += "View Skills"
							menu2 += "Mind Map"
							menu2 += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
							if(Result != "Cancel")
								F.Owner << "[F] can feel something probing at it's mind... looking for information."
								M.Owner << "[M] probes [F]'s mind, searching for information."
								..()
							if(Result == "Mind Map")
								M.TemporaryUnitTarget = F
								M.Owner << "[M] has memorized the structure of [F]'s mind and will be able to find them from any reasonable distance in the future."
							if(Result == "Read Speech Records")
								for(var/mob/O in world)
									if(O == F.Owner)
										var/html_doc="<head><title>Unit Chat</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Chat Log</U>From:<br> [O]</font><font face=Verdana><font color=COCOCO><br><br>[O.ChatLog]"
										usr<<browse(html_doc,"window=ChatLog")
							if(Result == "Read Action Records")
								for(var/mob/O in world)
									if(O == F.Owner)
										var/html_doc="<head><title>Unit Emote</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Emote Log</U>From:<br> [O]</font><font face=Verdana><font color=COCOCO><br><br>[O.EmoteLog]"
										usr<<browse(html_doc,"window=EmoteLog")
							if(Result == "View Inventory")
								for(var/obj/O in F)
									usr << "--<font color = silver>[O]"
							if(Result == "View Statistics")
								usr << "--<font color = silver><font size=4>{---[F.name]---}"
								usr << "--<font color = silver>[F.Strength] - Strength"
								usr << "--<font color = silver>[F.Agility] - Agility"
								usr << "--<font color = silver>[F.Intelligence] - Intelligence"
								usr << "--<font color = silver>[F.Defence] - Defence"
								usr << "--<font color = silver>[F.Age] - Age"
								usr << "--<font color = silver>[F.weight] - Weight"
								usr << "--<font color = silver>[F.weightmax] - Max Weight"
								usr << "--<font color = silver>[F.Tiredness] - Tiredness"
								usr << "--<font color = silver>[F.Hunger] - Hunger"
							if(Result == "View Skills")
								usr << "--<font color = silver><font size=4>{---[F.name]---}"
								usr << "--<font color = silver>[F.UnArmedSkill] - Unarmed Skill"
								usr << "--<font color = silver>[F.ClawSkill] - Claws Skill"
								usr << "--<font color = silver>[F.SwordSkill] - Sword Skill"
								usr << "--<font color = silver>[F.AxeSkill] - Axe Skill"
								usr << "--<font color = silver>[F.MaceSkill] - Mace Skill"
								usr << "--<font color = silver>[F.SpearSkill] - Spear Skill"
								usr << "--<font color = silver>[F.BowSkill] - Bow Skill"
								usr << "--<font color = silver>[F.ShieldSkill] - Shield Skill"
								usr << "--<font color = silver>[F.ArmourSkill] - ArmourSkill"
								usr << "--<font color = silver>[F.MetalCraftingSkill] - Metal Crafting Skill"
								usr << "--<font color = silver>[F.WoodCraftingSkill] - Wood Crafting Skill"
								usr << "--<font color = silver>[F.BoneCraftingSkill] - Bone Crafting Skill"
								usr << "--<font color = silver>[F.LeatherCraftingSkill] - Leather Crafting Skill"
								usr << "--<font color = silver>[F.StoneCraftingSkill] - Stone Crafting Skill"
								usr << "--<font color = silver>[F.JewlCraftingSkill] - Gem Crafting Skill"
								usr << "--<font color = silver>[F.PotionSkill] - Potion Crafting Skill"
								usr << "--<font color = silver>[F.FishingSkill] - Fishing Skill"
								usr << "--<font color = silver>[F.MineingSkill] - Mining Skill"
						else
							M.Owner << "You read the mind of the fungi and it's brainwaves are oddly humanoid, almost as if it's pondering it's existance as it grows in the cavern."
					else
						M.Owner << "You cannot use this power on that creature"
	usr.Close()

/obj/HUD/Scrying
	name = "Scrying"
	icon_state = "ScryingP"
	text = "S"

/obj/HUD/Scrying/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace == "Illithid" && M.Race == "Illithid")
			var/list/menu2 = new()
			menu2 += "Locate Active Minds"
			menu2 += "Locate Memorized Mind"
			menu2 += "Locate Living Creatures"
			menu2 += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
			if(Result != "Cancel")
				if(Result == "Locate Active Minds")
					M.Owner << "[M] is locating all non-illithid creatures with psychic abilities"
					for(var/mob/Monsters/K in world)
						if(K.SubRace == "Illithid" && K.Race != "Illithid")
							M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
				if(Result == "Locate Memorized Mind")
					for(var/mob/Monsters/K in world)
						if(K == M.TemporaryUnitTarget)
							M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
				if(Result == "Locate Living Creatures")
					for(var/mob/Monsters/K in range(40,M))
						if(K.Undead == 0 && K.Race != "Gargoyle" && K.Race != "Illithid" && K.icon != 'Cave.dmi') if(!K.Critter)
							M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
		else
			M.Owner << "Only full illithids can do this"
	usr.Close()

/obj/HUD/Warp
	name = "Warp"
	icon_state = "WarpP"
	text = "W"

/obj/HUD/Warp/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace == "Illithid")
			var/list/menu2 = new()
			menu2 += "Self"
			menu2 += "Other"
			menu2 += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
			if(Result == "Cancel")
				..()
			if(Result == "Self")
				var/X = rand(-10,10)
				var/Y = rand(-10,10)
				var/minus = prob(50)
				if(minus == 1)
					X -= M.Intelligence
					Y -= M.Intelligence
				if(minus == 0)
					X += M.Intelligence
					Y += M.Intelligence
				view(M) << "[M] uses their powers of the mind to fold space and create a interdimensional portal!"
				M.x += X
				M.y += Y
				for(var/turf/T in range(0,M))
					if(T.density == 1)
						M.Owner << "[M] slams into [T]!"
						M.BloodContent -= 25
						M.BloodLoss()
			if(Result == "Other")
				for(var/mob/Monsters/K in view(8,M))
					if(K == M.MagicTarget)
						if(M.Level >= 30)
							if(K.Mutated == 0)
								if(K.Wagon == 0 && K.Race != "Gargoyle")
									view(M) << "[M] begins to shape [K]'s very being with the powers of their mind..."
									var/list/menu3 = new()
									menu3 += "Create Mutation - Claws"
									menu3 += "Create Mutation - Thick Skin"
									menu3 += "Create Mutation - Weak Bones"
									menu3 += "Create Mutation - Strong Bones"
									menu3 += "Create Mutation - Unlock Mind"
									menu3 += "Create Mutation - Solar Powered"
									menu3 += "Create Mutation - Acidic Blood"
									menu3 += "Cancel"
									var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu3
									if(Result2 == "Cancel")
										..()
									if(Result2 == "Create Mutation - Claws")
										if(!K.HoldingWeapon)
											K.HoldingWeapon = "Claws"
											K.WeaponDamageMin += 35
											K.WeaponDamageMax += 40
											K.ClawSkill += 100
											K.Mutated = 1
									if(Result2 == "Create Mutation - Thick Skin")
										K.Defence += 15
										K.Mutated = 1
									if(Result2 == "Create Mutation - Weak Bones")
										K.OrganMaxHP -= 10
										K.OrganMaxHP -= 10
										K.OrganMaxHP -= 10
										K.OrganMaxHP -= 10
										K.Intelligence += 1
										K.Mutated = 1
									if(Result2 == "Create Mutation - Strong Bones")
										K.OrganMaxHP += 10
										K.OrganMaxHP += 10
										K.OrganMaxHP += 10
										K.OrganMaxHP += 10
										K.Mutated = 1
									if(Result2 == "Create Mutation - Unlock Mind")
										if(!K.SubRace)
											K.SubRace = "Illithid"
											K.Intelligence += (K.Intelligence/10)
											K.Mutated = 1
										else return
									if(Result2 == "Create Mutation - Solar Powered")
										K.SolarPowered()
										K.Mutated = 1
									if(Result2 == "Create Mutation - Acidic Blood")
										K.Mutated = 1
										K.BloodAcidity = 25
									if(Result2 != "Cancel")
										view(M) << "[M] has changed [K] with [Result2]"
								else
									M.Owner << "This creature cannot be mutated."
							else
								M.Owner << "[K] is already mutated."
						else
							M.Owner << "[M] isn't level 30 yet"
	usr.Close()

