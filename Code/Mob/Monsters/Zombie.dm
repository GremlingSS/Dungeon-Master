mob/Monsters/Zombie
	icon = 'Kobold.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 100
	Race = "Zombie"
	BowSkill = 0
	Infects = 1
	BloodContent = 250
	MaxBloodContent = 250
	Carn = 1
	MineingSkill = 10
	WoodCuttingSkill = 10
	SpearSkill = 0
	ArmourSkill = 0
	UnArmedSkill = 15
	HasLeftEye = 1
	HasRightEye = 1
	HasRightLung  = 1
	HasLeftLung  = 1
	HasSpleen  = 1
	HasTeeth  = 1
	HasLeftArm  = 1
	HasRightArm = 1
	HasLeftLeg = 1
	HasRightLeg = 1
	HasHead = 1
	HasLeftEar = 1
	HasRightEar = 1
	HasGuts = 1
	HasStomach = 1
	HasLeftKidney = 1
	HasRightKidney = 1
	HasLiver = 1
	HasBrain = 1
	HasHeart = 1
	HasThroat = 1
	HasNose = 1
	OrganMaxHP = 100

mob/Monsters/Zombie/New()
	usr.Strength += rand(5,10)
	usr.Agility += rand(5,10)
	usr.Defence += rand(5,10)
	usr.Intelligence += rand(0.05,0.075)
	usr.DieAge += 10000
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I

/mob/proc/CreateZombie()
	spawn(500)
		if(src)
			src.icon = turn(src.icon,270)
			var/mob/Monsters/Zombie/Z = new
			Z.icon = src.icon
			Z.icon_state = src.icon_state
			for(var/mob/O in world)
				if(O.ckey == src.Owner)
					Z.Owner = O
					Z.name = "([O]) Zombie"
					O.UnitList += Z
			Z.Zombie()
			Z.LimbLoss()

			Z.overlays += /obj/Bloods/Zombie/
			Z.loc = src.loc
			range(8,src) << "<font color = teal>[src] begins to twitch, after a moment, they rise up from the dead and begin to walk!<br>"
			Z.Owner << "<font color = teal>A Zombie has risen at [Z.x],[Z.y],[Z.z]<br>"
			del (src)

/mob/proc/Infection(var/mob/InfectorOwner)
	if(src.Race != "Gargoyle")
		if(src.ImmuneToDevourer == 0)
			src.Infects = 1
			spawn(500)
				if(src)
					src.Owner << "<font color = teal>[src] begins to look pale.<br>"
					var/Heal = prob(25 + src.Level)
					spawn(1000)
						if(src)
							if(Heal && src.ImmuneToDevourer == 0)
								src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them.<br>"
								src.Infects = 0
								return
							if(src.ImmuneToDevourer == 1)
								src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them due tot heir newfound immunity.<br>"
								src.Infects = 0
								return
							else
								src.Owner << "<font color = teal>[src] begins to gurgle and splutter blood everywhere, they become a Zombie!<br>"
								var/mob/Monsters/Zombie/Z = new
								Z.icon = src.icon
								Z.icon_state = src.icon_state
								Z.Zombie()
								if(src.loc != locate(0,0,0))
									Z.loc = src.loc
								else
									Z.loc = InfectorOwner.loc
								Z.Owner = InfectorOwner
								Z.Undead = 1
								Z.name = "([Z.Owner]) Zombie"
								InfectorOwner.UnitList += Z
								Z.LimbLoss()
								var/obj/Bloods/Zombie/O = new
								Z.overlays += O
								Z.Owner << "<font color = teal>A new infection was created at [src.x],[src.y],[src.z]<br>"
								for(var/obj/Items/I in src)
									I.loc = src.loc
									I.suffix = null
								del(src)
								return

/mob/proc/Zombie()
	if(src)
		if(src.Owner)
			if(src.icon_state == "NoLeftArm")
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightArm")
				src.HasRightArm = 0
			if(src.icon_state == "NoLeftLeg")
				src.HasLeftLeg = 0
			if(src.icon_state == "NoRightLeg")
				src.HasRightLeg = 0
			if(src.icon_state == "NoLegs")
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArms")
				src.HasRightArm = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightLegNoLeftArm")
				src.HasRightLeg = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoLeftLegNoRightArm")
				src.HasLeftLeg = 0
				src.HasRightArm = 0
			if(src.icon_state == "NoRightArmNoRightLeg")
				src.HasRightArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "NoLeftArmNoLeftLeg")
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoRightArm")
				src.HasRightArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoLeftArm")
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoLeftLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoRightLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "None")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0

