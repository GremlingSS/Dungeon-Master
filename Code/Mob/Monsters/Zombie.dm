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