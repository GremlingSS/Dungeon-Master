/mob/WorkShops/Smelters
	name = "Smelter"

/mob/WorkShops/Smelters/Left
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopLeft2"

/mob/WorkShops/Smelters/Right
	density = 1
	layer = 4
	icon = 'Cave.dmi'
	icon_state = "WorkShopRight2"

/mob/WorkShops/Smelters/DblClick()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Spider")
			return
		if(M.Wagon == 1)
			return
		var/list/menu = new()
		menu += "Smelt Ores and Sand"
		menu += "Destroy"
		menu += "Cancel"
		var/Result = input("What Action Will You Choose?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Destroy")
			if(M in range(1,src))
				M.DestroySmelterStation()
		if (Result == "Smelt Ores and Sand")
			for(var/obj/Items/ores/S in M) if(S.icon_state!="Stone")
				var/CHANCE
				var/TYPE
				switch(S.icon_state)
					if("Iron")
						TYPE = /obj/Items/Ingots/IronIngot/
						CHANCE=5
						M.MetalCraftingSkill+=0.25
					if("Silver")
						TYPE = /obj/Items/Ingots/SilverIngot/
						CHANCE=4
						M.MetalCraftingSkill+=0.5
					if("Gold")
						TYPE = /obj/Items/Ingots/GoldIngot/
						CHANCE=3
						M.MetalCraftingSkill+=0.75
					if("Adamantium")
						TYPE = /obj/Items/Ingots/AdamantiumIngot/
						CHANCE=1
						M.MetalCraftingSkill+=10
					if("Sand")
						TYPE = /obj/Items/Potions/EmptyBottle/
						CHANCE=5
						M.MetalCraftingSkill+=0.25
				if(prob(M.MetalCraftingSkill*CHANCE))
					if(M.DropItem(S)) del(S)
					var/obj/Items/NEWITEM = new TYPE(M.loc)
					M.PickUpItem(NEWITEM)
				else
					if(M.DropItem(S)) del(S)
					M.Owner << "[M] failed working working with the [S.name]"
