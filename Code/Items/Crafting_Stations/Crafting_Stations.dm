/mob/proc/DestroyLeatherStation()
	for(var/mob/WorkShops/LeatherWorks/LW in view(3,src))
		del(LW)

/mob/proc/DestroyCarpentryStation()
	for(var/mob/WorkShops/Carpentry/LW in view(3,src))
		del(LW)

/mob/proc/DestroySmelterStation()
	for(var/mob/WorkShops/Smelters/LW in view(3,src))
		del(LW)

/mob/proc/DestroyForge()
	for(var/mob/WorkShops/Forge/LW in view(3,src))
		del(LW)

/mob/proc/DestroyBone()
	for(var/mob/WorkShops/BoneCraft/LW in view(3,src))
		del(LW)

/mob/proc/DestroyPoison()
	for(var/mob/WorkShops/PoisonStation/LW in view(3,src))
		del(LW)

/mob/proc/DestroyKit()
	for(var/mob/WorkShops/Kitchen/LW in view(3,src))
		del(LW)

/mob/proc/DestroyGem()
	for(var/mob/WorkShops/GemCutter/LW in view(3,src))
		del(LW)

/mob/proc/DestroyMason()
	for(var/mob/WorkShops/Masonary/LW in view(3,src))
		del(LW)

/mob/proc/DestroyPotion()
	for(var/mob/WorkShops/PotionStation/CF in view(3,src))
		del(CF)
/mob/proc/DestroyMelter()
	for(var/mob/WorkShops/Melter/CF in view(3,src))
		del(CF)

/obj/DigAt
		icon = 'Cave.dmi'
		icon_state = "Dig"
		layer = 5
		Wagon = 1

/mob/WorkShops
	IsWood = 0
	WS = 1