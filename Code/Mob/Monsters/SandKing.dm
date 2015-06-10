mob/Monsters/SandKing
	UsesEquipment=0
	icon = 'Sandking.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 95
	Race = "SandKing"
	SubRace = "Sand"
	WearingCape = 1
	Carn = 1
	BloodContent = 300
	MaxBloodContent = 300
	HasLeftEye = 1
	HasRightEye = 1
	HasRightLung  = 1
	HasLeftLung  = 1
	HasSpleen  = 1
	HasTeeth  = 1
	CanWalk = 0
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
	OrganMaxHP = 95

mob/Monsters/SandKing/New()
	Age = 45
	usr.Strength += rand(10,15)
	usr.Agility += rand(1,2)
	usr.Defence += rand(20,40)
	FullHeal()
	Hunger()
	Heal()
	Bleeding()
	usr.DieAge = rand(1000,2000)
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I

mob/Monsters/SandKing/Sand_Humanoid
	parent_type = /mob/Monsters/Dwarf
	icon = 'Sand Humanoid.dmi'
	Race = "Humanoid"
	SubRace = "Sand"
	Carn = 1
	SandWorker = 1
	Gender = "None"
	Delay = 3
	ImmunePoison = 1
	OrganMaxHP = 85

mob/Monsters/SandKing/Sand_Humanoid/New()
	..()
	Beard=null
	Hair=null
	Gender = "None"
	RebuildOverlays()
	Strength += rand(10,15)
	Agility += rand(10,15)
	Defence += rand(15,25)
	Intelligence += rand(0.25,0.5)
	DieAge += rand(900,1000)

mob/Monsters/SandKing/Sand_Maggot
		parent_type = /mob/Monsters/SandKing/Sand_Humanoid
		Race = "Maggot"
		UsesEquipment=0
		icon = 'SandSoldier.dmi'
		HoldingWeapon = "Claws"
		ClawSkill=25
		BloodContent = 300
		MaxBloodContent = 300
		OrganMaxHP = 85

mob/Monsters/SandKing/Sand_Dragon
		parent_type = /mob/Monsters/Dragon
		SubRace="Sand"
		icon_state="sand"
