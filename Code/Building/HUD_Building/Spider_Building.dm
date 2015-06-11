/obj/HUD/SilkBridge
	name = "SilkBridge"
	icon_state = "B"
	text = "B"

/obj/HUD/SilkBridge/DblClick()
	usr.Function = "PlaceSilkBridge"
	usr << "Click and drag to place bridge<br>"
	usr.Close()

/obj/HUD/Cacoon
	name = "Cacoon"
	icon_state = "Cacoon"
	text = "C"

/obj/HUD/Cacoon/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.WebContent >= 50)
			var/obj/Items/Traps/Cages/Cacoon/C = new
			C.loc = M.loc
			C.desc = "This is a cacoon, it is used by spiders to in-trap victims."
			M.WebContent -= 50
			usr.Up = 0
			usr.Close()
			return
		usr.Up = 0
		usr.Close()

/obj/HUD/Post
	name = "Post"
	icon_state = "Post"
	text = "P"

/obj/HUD/Post/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		for(var/obj/Items/woods/wood/W in M)
			if(M.Race == "Spider")
				if(M.WebContent >= 75)
					var/obj/Items/Furniture/Posts/SilkTrainingPost/P = new
					P.loc = M.loc
					M.WebContent -= 75
					M.weight -= W.weight
					if(M.WoodCraftingSkill >= 90)
						P.CraftRank = "Epic Quality"
					if(M.WoodCraftingSkill >= 100)
						P.CraftRank = "Legendary Quality"
					if(M.WoodCraftingSkill <= 90)
						P.CraftRank = "Epic Quality"
					if(M.WoodCraftingSkill <= 75)
						P.CraftRank = "Masterful Quality"
					if(M.WoodCraftingSkill <= 60)
						P.CraftRank = "Grand Quality"
					if(M.WoodCraftingSkill <= 50)
						P.CraftRank = "Impressive Quality"
					if(M.WoodCraftingSkill <= 40)
						P.CraftRank = "Quality"
					if(M.WoodCraftingSkill <= 30)
						P.CraftRank = "Average Quality"
					if(M.WoodCraftingSkill <= 20)
						P.CraftRank = "Poor Quality"
					P.HP = 999999999999999999999
					M.WoodCraftingSkill += 2
					P.TrainCraft()
					del(W)
					usr.Up = 0
					usr.Close()
					break
					return
		usr.Up = 0
		usr.Close()

/obj/HUD/SilkWall
	name = "SilkWall"
	icon_state = "SilkWall"
	text = "W"

/obj/HUD/SilkWall/DblClick()
	usr.Function = "PlaceSilkWall"
	usr << "Click and drag to place wall<br>"
	usr.Close()

/obj/HUD/Lair
	name = "Lair"
	icon_state = "Silk"
	text = "L"

/obj/HUD/Lair/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.CanBreed)
			if(M.Race != "Spider")
				usr.Up = 0
				usr.Close()
				return
			if(M.WebContent >= 200)
				M.WebContent -= 200
				for(var/turf/T in view(2,M))
					if(T.density == 0)
						T.icon = 'Cave.dmi'
						T.icon_state = "SilkWall"
						T.Detailed = 1
		usr.Up = 0
		usr.Close()

