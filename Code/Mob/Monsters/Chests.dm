/mob/Monsters/Chests
	icon = 'Cave.dmi'
	density=0
	HumanParts=0
	weightmax=100000
	Wagon=1
	CantKill=1
	layer=4

/mob/Monsters/Chests/New()
	var/image/I = new('mob.dmi',src)
	src.Star = I

/mob/Monsters/Chests/SilverChest
	icon_state = "Silver Chest"
	desc = "This is a silver chest, it can ued to store items in."

/mob/Monsters/Chests/GoldChest
	icon_state = "Gold Chest"
	desc = "This is a gold chest, it can ued to store items in."

/mob/Monsters/Chests/MetalChest
	icon_state = "Metal Chest"
	desc = "This is a metal chest, it can ued to store items in."

/mob/Monsters/Chests/WoodenChest
	icon_state = "Wooden Chest"
	desc = "This is a wooden chest, it can ued to store items in."

/mob/Monsters/Chests/Wagon
	icon_state = "Wagon"
	weightmax = 1500
	HasLeftLeg = 1
	Delay = 4
	HasRightLeg = 1
	Fainted = 0
	CanWalk = 1

/mob/Monsters/Chests/Wagon/New()
	WalkTo()
	..()

/mob/Monsters/Chests/Drill
	icon = 'MetalObjects.dmi'
	icon_state = "Drill"
	Drill = 1
	desc = "This is a drill, it can be used to extract ore from the ground.This type of drill can be placed in the ground and twisted around to dig with."
