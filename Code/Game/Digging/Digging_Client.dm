/client
	var/paintdigon
	var/paintdigoff
	var/blockdigon = 1
	var/blockdigoff
	var/selecting
	var/list/box
	var/tmp/sellist[] = list()
	var/list/block1
	var/turf/loc1
	var/turf/loc2
	var/list/selected

/client/New()
	new/obj/Hud/DigSel(src)
	new/obj/Hud/DigAdd(src)
	new/obj/Hud/DigSub(src)
	..()