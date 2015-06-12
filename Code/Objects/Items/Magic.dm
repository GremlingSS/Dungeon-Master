/obj/Items/Shafts/AstralBook
	icon = 'Book.dmi'
	icon_state = "AstralBook"
	weight = 5
	Enchanted = 1
	suffix = null
	desc = "This book gives off a bit of static electricity while you hold it, the instructions page reads: Teleport: Teleports caster to desired location(Where your ghost is), be cautious as you will be incapacitated upon reaching your destination. Find: Locate someone who you wish to find. Lightning Bolt: Fire the energies of the book at your enemies."

/obj/Items/Shafts/AstralBook/DblClick()
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
			var/obj/A = src
			A.loc = M
			var/list/menu = new()
			menu += "Drop"
			menu += "Inspect"
			menu += "Create Portal"
			menu += "Destroy Portal"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result == "Inspect") usr << src.desc
			if (Result == "Create Portal")
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
					usr << "There is a magic blocking portal stone near your destination, you cannot make a portal!"
					return
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot make a portal!"
					return
				var/obj/AstralPortal/Port = new
				var/obj/AstralPortal/Port2 = new
				Port.loc = M.loc
				Port.GoesTo = usr.loc
				Port2.loc = usr.loc
				Port2.GoesTo = M.loc
				view() << "Someone has created a portal with this location as the destination!!!"
				return
			if (Result == "Destroy Portal")
				for(var/obj/AstralPortal/Port in view(5,M))
					view() << "[M] fires a bolt of astral energy into the portal and causes it to implode upon itself, destroying it completely"
					for(var/obj/AstralPortal/Port2 in range(1,Port.GoesTo))
						del Port2
						break
					del Port
					return
			if (Result == "Drop")
				if(src.suffix == "(Carrying)")
					var/obj/A1 = src
					A1.loc = M.loc
					A1.suffix = null
					M.weight -= A1.weight
					return

/obj/Items/Shafts/MagicScroll
	icon = 'Book.dmi'
	icon_state = "Scroll"
	weight = 2
	suffix = null
	desc = "An empty scroll."

/obj/Items/Shafts/MagicScroll/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(src.Placed == 0)
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
				var/list/menu = new()
				menu += "Drop"
				menu += "Inspect"
				if(M.Race == "Svartalfar" && src.Content2 == 0)
					menu += "Write Magic"
				if(M.Intelligence >= 10 && M.MagicalAptitude == 1)
					menu += "Write Magic"
				if(src.Content2 != 0 && M.Intelligence >= 1)
					menu += "Cast"
				if(src.Content2 != 0 && M.Intelligence < 1)
					menu += "[M]'s too stupid to read"
				menu += "Cancel"
				var/Result = input("What Action Will You Choose?", "Choose", null) in menu
				if (Result != "Cancel")
					..()
				if(Result == "[M]'s too stupid to read")
					M.Owner << pick("[M] gnaws on the paper and tears it to shreds!","[M] sits down and draws stupid scribbles all over the paper and ruins it!","[M] sets the paper on fire and watches it burn","[M] uses the scroll to wipe dirt off of it's face.","[M] thinks the scroll is a treasure map but is confused about the difDipopent X's marking the spots, so it throws it away.")
					M.weight -= src.weight
					del src
				if (Result == "Inspect")
					usr << src.desc
				if (Result == "Drop")
					if(src.suffix == "(Carrying)")
						var/obj/A1 = src
						A1.loc = M.loc
						A1.suffix = null
						M.weight -= A1.weight
						A1.dir = M.dir
						return
				if (Result == "Cast")
					if (src.Content2 == "Nether Travel")
						view(M) << "[M] twists in and out of view and turns into some kind of dark shadowy substance before dissappearing."
						M.loc = locate(M.x,M.y,4)
						M.weight -= src.weight
						del src
					if (src.Content2 == "Teleportation")
						var/X = M.icon
						M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
						M.icon = 'Blood.dmi'
						flick("AstralBurst",M)
						view(M) << "A glowing blue portal snaps into existance and [M] steps through it!"
						for(var/turf/T in view(0,M))
							if(T.density == 1 && T.opacity == 1)
								M.icon = 'Blood.dmi'
								flick("AstralBurst",M)
								view(M) << "....and is torn to pieces by the dense object they stepped into!"
								spawn(10)
									M.icon = 'Blood.dmi'
									flick("HolyBurst",M)
								spawn(20)
									del(M)
						spawn(10)
							M.icon = X
							M.weight -= src.weight
							del src
					if (src.Content2 == "Nether Return")
						M.loc = locate(M.x,M.y,1)
						view(M) << "A dark shadow begins to creep forth from the earth and forms into the shape of [M]"
						M.weight -= src.weight
						del src
					if (src.Content2 == "Damage Mind")
						for(var/mob/Monsters/MM in oview(5,M))
							if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
								view(M) << "[M] uses their force of *Thought* to re-write the mind of [MM], causing them to lose some of the knowledge they once possessed."
								MM.EXP = 0
								MM.SwordSkill -= M.Intelligence/2
								MM.AxeSkill -= M.Intelligence/2
								MM.MaceSkill -= M.Intelligence/2
								MM.MetalCraftingSkill -= M.Intelligence/2
								MM.LeatherCraftingSkill -= M.Intelligence/2
								MM.MagicalConcentration -= M.Intelligence/2
								MM.MagicalAnger -= M.Intelligence/2
								MM.MagicalWill -= M.Intelligence/2
								MM.UnArmedSkill -= M.Intelligence/2
								M.weight -= src.weight
								del src
					if (src.Content2 == "Steal Thoughts")
						for(var/mob/Monsters/MM in oview(5,M))
							if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
								view(M) << "[M] uses their force of *Mind* to absorb some of the knowledge [MM] once held, making it their own...."
								M.GainEXP(MM.EXP)
								MM.EXP = 0
								MM.SwordSkill -= M.Intelligence/2
								MM.AxeSkill -= M.Intelligence/2
								MM.MaceSkill -= M.Intelligence/2
								MM.MetalCraftingSkill -= M.Intelligence/2
								MM.LeatherCraftingSkill -= M.Intelligence/2
								MM.MagicalConcentration -= M.Intelligence/2
								MM.MagicalAnger -= M.Intelligence/2
								MM.MagicalWill -= M.Intelligence/2
								MM.UnArmedSkill -= M.Intelligence/2
								M.SwordSkill += M.Intelligence/2
								M.AxeSkill += M.Intelligence/2
								M.MaceSkill += M.Intelligence/2
								M.MetalCraftingSkill += M.Intelligence/2
								M.LeatherCraftingSkill += M.Intelligence/2
								M.UnArmedSkill += M.Intelligence/2
								M.weight -= src.weight
								del src
					if (src.Content2 == "Insanity")
						for(var/mob/Monsters/MM in oview(5,M))
							if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
								view(M) << "[M] uses their force of *Thought* to scramble the mind of [MM] causing them to go in to temporary insanity."
								for(var/mob/Monsters/GGL in oview(6,MM))
									if(GGL != M)
										view(MM) << "[MM] starts chasing after random creatures!!!"
										MM.destination = GGL
										spawn(25)
											MM.destination = GGL
										spawn(50)
											MM.destination = GGL
										spawn(75)
											MM.destination = GGL
										break
								spawn(100)
								for(var/obj/Items/LLK in oview(6,MM))
									view(MM) << "[MM] starts chasing after random objects!!!"
									MM.destination = LLK
									spawn(200)
										MM.destination = LLK
									break
								spawn(300)
									view(MM) << "[MM]'s temporary insanity seems to have worn off."
									M.weight -= src.weight
									del src
									return
					if (src.Content2 == "Nether Alteration")
						var/list/menu3 = new()
						menu3 += "Grass"
						menu3 += "Snow"
						menu3 += "Desert"
						menu3 += "Hell"
						menu3 += "Mountains"
						menu3 += "Nether"
						menu3 += "Cancel"
						var/Result3 = input("Do What?", "Choose", null) in menu3
						if(Result3 == "Cancel") return
						if(M in range(10,usr))
							if(Result3 == "Grass")
								for(var/mob/Monsters/MM in view(2,usr))
									if(MM.Owner != usr)
										usr << "You can't use this on someone elses units."
										return
								if(M in range(100,usr) && src)
									for(var/turf/grounds/Y in view(2,usr))
										Y.name = "grass"
										Y.icon = 'Cave.dmi'
										Y.icon_state = "Grass"
										Y.Sky = 1
										Y.Content3 = "CanClimb"
										Y.OIcon = "Grass"
										Y.density = 0
										Y.CanDigAt = 0
										Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
									M.weight -= src.weight
									del src
								else
									usr << "[M] needs to be within 100 spaces of the target to use this!"
									return
							if(Result3 == "Nether")
								for(var/mob/Monsters/MM in view(2,usr))
									if(MM.Owner != usr)
										usr << "You can't use this on someone elses units."
										return
								if(M in range(100,usr) && src)
									for(var/turf/grounds/Y in view(2,usr))
										Y.name = "nether"
										Y.icon = 'Cave.dmi'
										Y.icon_state = "NetherFloor"
										Y.Sky = 1
										Y.Content3 = "CanClimb"
										Y.OIcon = "NetherFloor"
										Y.density = 0
										Y.CanDigAt = 0
										Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
									M.weight -= src.weight
									del src
								else
									usr << "[M] needs to be within 100 spaces of the target to use this!"
									return
							if(Result3 == "Snow")
								for(var/mob/Monsters/MM in view(2,usr))
									if(MM.Owner != usr)
										usr << "You can't use this on someone elses units."
										return
								if(M in range(100,usr) && src)
									for(var/turf/grounds/Y in view(2,usr))
										Y.name = "snow"
										Y.icon = 'Cave.dmi'
										Y.icon_state = "Snow"
										Y.Sky = 1
										Y.Content3 = "CanClimb"
										Y.OIcon = "Snow"
										Y.density = 0
										Y.CanDigAt = 0
										Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
									M.weight -= src.weight
									del src
								else
									usr << "[M] needs to be within 100 spaces of the target to use this!"
									return
							if(Result3 == "Desert")
								for(var/mob/Monsters/MM in view(2,usr))
									if(MM.Owner != usr)
										usr << "You can't use this on someone elses units."
										return
								if(M in range(100,usr) && src)
									for(var/turf/grounds/Y in view(2,usr))
										Y.name = "sand"
										Y.icon = 'Cave.dmi'
										Y.icon_state = "Desert"
										Y.Sky = 1
										Y.Content3 = "CanClimb"
										Y.OIcon = "Desert"
										Y.density = 0
										Y.CanDigAt = 0
										Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
									M.weight -= src.weight
									del src
								else
									usr << "[M] needs to be within 100 spaces of the target to use this!"
									return
							if(Result3 == "Hell")
								for(var/mob/Monsters/MM in view(2,usr))
									if(MM.Owner != usr)
										usr << "You can't use this on someone elses units."
										return
								if(M in range(100,usr) && src)
									for(var/turf/grounds/Y in view(2,usr))
										Y.name = "hellfloor"
										Y.icon = 'Cave.dmi'
										Y.icon_state = "HellFloor"
										Y.Sky = 1
										Y.Cant = 1
										Y.Content3 = "CanClimb"
										Y.OIcon = "HellFloor"
										Y.density = 0
										Y.CanDigAt = 0
										Y.opacity = 0
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
									M.weight -= src.weight
									del src
								else
									usr << "[M] needs to be within 100 spaces of the target to use this!"
									return
							if(Result3 == "Mountains")
								for(var/mob/Monsters/MM in view(2,usr))
									if(MM.Owner != usr)
										usr << "You can't use this on someone elses units."
										return
								if(M in range(100,usr) && src)
									for(var/turf/grounds/Y in view(2,usr))
										Y.name = "Mountain"
										Y.icon = 'Cave.dmi'
										Y.icon_state = "CaveWall"
										Y.Sky = 1
										Y.Content3 = "CanClimb"
										Y.OIcon = "CaveFloor"
										Y.density = 1
										Y.CanDigAt = 1
										Y.opacity = 1
									view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
									M.weight -= src.weight
									del src
								else
									usr << "[M] needs to be within 100 spaces of the target to use this!"
									return
						else usr<<"You can only cast this spell within 10 tiles of your unit."
					if (src.Content2 == "Willful Alteration")
						var/list/menu3 = new()
						menu3 += "Grass"
						menu3 += "Snow"
						menu3 += "Desert"
						menu3 += "Hell"
						menu3 += "Mountains"
						menu3 += "Cancel"
						var/Result3 = input("Do What?", "Choose", null) in menu3
						if (Result3 != "Cancel")
							..()
						if(Result3 == "Grass" && src)
							view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
							for(var/turf/grounds/Y in view(4,M))
								Y.name = "grass"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "Grass"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "Grass"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							M.weight -= src.weight
							del src
						if(Result3 == "Snow" && src)
							view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
							for(var/turf/grounds/Y in view(4,M))
								Y.name = "snow"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "Snow"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "Snow"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							M.weight -= src.weight
							del src
						if(Result3 == "Desert" && src)
							view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
							for(var/turf/grounds/Y in view(4,M))
								Y.name = "sand"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "Desert"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "Desert"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							M.weight -= src.weight
							del src
						if(Result3 == "Hell" && src)
							view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
							for(var/turf/grounds/Y in view(4,M))
								Y.name = "hellfloor"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "HellFloor"
								Y.Sky = 1
								Y.Cant = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "HellFloor"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							M.weight -= src.weight
							del src
						if(Result3 == "Mountains" && src)
							view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
							for(var/turf/grounds/Y in view(4,M))
								Y.name = "Mountain"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "CaveWall"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "CaveFloor"
								Y.density = 1
								Y.CanDigAt = 1
								Y.opacity = 1
							M.weight -= src.weight
							del src
					if (src.Content2 == "Destructive Alteration")
						for(var/mob/Monsters/MK in range(2,usr))
							if(MK.Owner != usr)
								usr << "You can't cast this directly on a unit."
								return
						var/list/menu3 = new()
						menu3 += "Lava"
						menu3 += "Water"
						menu3 += "Cancel"
						var/Result3 = input("Do What?", "Choose", null) in menu3
						if(Result3 == "Cancel") return
						if(usr in orange(10,M))
							if(Result3 == "Lava" && src)
								for(var/mob/Monsters/MK in range(2,usr))
									if(MK.Owner != usr)
										usr << "You can't cast this directly on a unit."
										return
								view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
								for(var/turf/grounds/Y in view(2,usr))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								M.weight -= src.weight
								del src
							if(Result3 == "Water" && src)
								for(var/mob/Monsters/MK in range(2,usr))
									if(MK.Owner != usr)
										usr << "You can't cast this directly on a unit."
										return
								view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
								for(var/turf/grounds/Y in view(2,usr))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								M.weight -= src.weight
								del src
						else usr<<"You can only cast this spell within 10 tiles of your unit."
				if (Result == "Write Magic")
					var/list/menu2 = new()
					menu2 += "Cancel"
					if(M.MagicalConcentration >= 20 && usr.DieAge >= usr.Age)
						menu2 += "Nether Travel"
						menu2 += "Nether Return"
						if(M.MagicalWill >= 20)
							menu2 += "Nether Alteration"
					if(M.MagicalWill >= 20 && usr.DieAge >= usr.Age)
						menu2 += "Willful Alteration"
					if(M.MagicalAnger >= 20 && usr.DieAge >= usr.Age)
						if(M.MagicalWill >= 25)
							menu2 += "Destructive Alteration"
					if(M.MagicalMind >= 20 && usr.DieAge >= usr.Age)
						menu2 += "Insanity"
						if(M.MagicalAnger >= 20)
							menu2 += "Damage Mind"
							if(M.MagicalConcentration >= 25)
								menu2 += "Steal Thoughts"
						if(M.MagicalWill >= 25)
							menu2 += "Teleportation"
					var/Result2 = input("Do What?", "Choose", null) in menu2
					if (Result2 != "Cancel")
						..()
					if (Result2 == "Nether Travel")
						if(M.Mana >= 10 - M.MagicalConcentration / 10)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 10 - M.MagicalConcentration / 10
						else
							M.Owner << "You need [10 - M.Mana] more mana."
					if (Result2 == "Teleportation")
						if(M.Mana >= 80 - M.MagicalWill / 10)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 80 - M.MagicalWill / 10
						else
							M.Owner << "You need [80 - M.Mana] more mana."
					if (Result2 == "Nether Return")
						if(M.Mana >= 10 - M.MagicalConcentration / 10)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 10
						else
							M.Owner << "You need [10 - M.Mana] more mana."
					if (Result2 == "Damage Mind")
						if(M.Mana >= M.MagicalMind / 2)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= M.MagicalMind / 2
						else
							M.Owner << "You need [M.MagicalMind / 2 - M.Mana] more mana."
					if (Result2 == "Steal Thoughts")
						if(M.Mana >= M.MagicalMind * 2)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= M.MagicalMind * 2
						else
							M.Owner << "You need [M.MagicalMind * 2 - M.Mana] more mana."
					if (Result2 == "Insanity")
						if(M.Mana >= 25)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 25
							return
						else
							M.Owner << "You need [25 - M.Mana] more mana."
					if (Result2 == "Nether Alteration")
						if(M.Mana >= 30)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 30
						else
							M.Owner << "You need [30 - M.Mana] more mana."
					if (Result2 == "Willful Alteration")
						if(M.Mana >= 50)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 50
						else
							M.Owner << "You need [50 - M.Mana] more mana."
					if (Result2 == "Destructive Alteration")
						if(M.Mana >= 100)
							src.Content2 = "[Result2]"
							src.name = "[Result2] Scroll"
							src.icon_state = "SvartalfarScroll"
							M.Mana -= 100
						else
							M.Owner << "You need [100 - M.Mana] more mana."
