mob/Monsters/Svartalfar
	icon = 'Night Elf.dmi'
	icon_state = "Normal"
	ImmuneToTemperature=1
	density = 1

	Unholy = 1
	WeaponDamageMin = 15
	WeaponDamageMax = 20

	weightmax = 200
	Race = "Svartalfar"
	MagicalAptitude = 1
	ImmunePoison = 1
	Carn = 1
	MineingSkill = 15
	WoodCuttingSkill = 15
	UsesPoison = 1
	SpearSkill = 35
	SwordSkill  = 35
	BloodContent = 300
	MaxBloodContent = 300
	AxeSkill  = 35
	MaceSkill  = 35
	UnArmedSkill  = 45
	BowSkill = 25
	ShieldSkill  = 35
	ArmourSkill  = 35
	WoodCraftingSkill  = 35
	MetalCraftingSkill  = 35
	SkinningSkill  = 35
	ButcherySkill  = 35
	LeatherCraftingSkill  = 35
	PoisonSkill  = 35
	PotionSkill = 20
	BoneCraftingSkill  = 35
	StoneCraftingSkill  = 35
	SneakingSkill  = 35
	LockPickingSkill = 35
	JewlCraftingSkill = 35
	CookingSkill  = 35
	FishingSkill  = 35
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
	OrganMaxHP = 140

mob/Monsters/Svartalfar/New()
	Age = rand(10,20)
	usr.Strength += rand(7,9)
	usr.Agility += rand(14,20)
	usr.Defence += rand(15,18)
	usr.Intelligence += rand(4,6)
	usr.DieAge += rand(500,600)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
