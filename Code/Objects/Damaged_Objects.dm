/obj/Smoke
	icon = 'Cave.dmi'
	icon_state = "Smoke"
	density = 0
	IsMist = 1
	IsWood = 0
	opacity = 1

/obj/Smoke/New()
	SmokeMove()
	DeleteSmoke()

/obj/Fire
	icon = 'Cave.dmi'
	icon_state = "Flame"
	density = 0
	IsMist = 1
	IsWood = 0
	layer = 50

/obj/Fire/New()
	SmokeMove()
	DeleteSmoke()
	Flame()
	pixel_x = rand(-12,12)
	pixel_y = rand(-12,12)

/obj/Trees
	layer = 5

/obj/Trees/leaves1x1
	icon = 'plants.dmi'
	icon_state = "leaves 1x1"
	pixel_x = -32

/obj/Trees/leaves2x1
	icon = 'plants.dmi'
	icon_state = "leaves 2x1"

/obj/Trees/leaves3x1
	icon = 'plants.dmi'
	icon_state = "leaves 3x1"
	pixel_x = 32

/obj/Trees/leaves21x1
	icon = 'plants.dmi'
	icon_state = "leaves2 1x1"

/obj/Trees/leaves1x2
	icon = 'plants.dmi'
	icon_state = "leaves 1x2"
	pixel_y = 32
	pixel_x = -32

/obj/Trees/leaves21x2
	icon = 'plants.dmi'
	icon_state = "leaves2 1x2"
	pixel_y = 32

/obj/Trees/leaves3x2
	icon = 'plants.dmi'
	icon_state = "leaves 3x2"
	pixel_y = 32
	pixel_x = 32

/obj/Trees/leaves2x2
	icon = 'plants.dmi'
	icon_state = "leaves 2x2"
	pixel_y = 32

/obj/Trees/tree3x2
	icon = 'plants.dmi'
	icon_state = "tree 3x2"
	pixel_y = 32
	pixel_x = 32

/obj/Trees/tree1x2
	icon = 'plants.dmi'
	icon_state = "tree 1x2"
	pixel_y = 32
	pixel_x = -32

/obj/Trees/tree21x2
	icon = 'plants.dmi'
	icon_state = "tree2 1x2"
	pixel_y = 32

/obj/Trees/tree2x2
	icon = 'plants.dmi'
	icon_state = "tree 2x2"
	pixel_y = 32
