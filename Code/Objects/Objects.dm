/obj/proc/ItemDecay()
	spawn(19000)
	if(src.suffix == null)
		del(src)
	else
		src.ItemDecay()

/obj/proc/Seek()
	if(src.Target)
		walk_towards(src,src.Target,2)
	else
		src.BowSkill = 0
		return
	spawn(0.1)
		Seek()

/obj/proc/Flame()
	if(IsWood)
		if(ismob(src))
			return
		for(var/atom/T in view(2,src))
			if(T.OnFire == 0)
				if(T.Tree)
					T.overlays -= /obj/Trees/leaves3x2
					T.overlays -= /obj/Trees/leaves2x2
					T.overlays -= /obj/Trees/leaves1x2
					T.overlays -= /obj/Trees/leaves1x1
					T.overlays -= /obj/Trees/leaves2x1
					T.overlays -= /obj/Trees/leaves3x1
				T.Fire()
				del(src)
				return
		spawn(20)
			Flame()

obj/proc/DeleteSmoke()
	spawn(30)
		del(src)

/obj/proc/SmokeMove()
	spawn()
		while(1)
			step_rand(src)
			sleep(10)

obj/proc/Death()
	if(src.HP <= 0)
		del(src)

