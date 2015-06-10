mob/Monsters/Devourer
	HoldingWeapon = "Mace"
	WearingShield = 1
	WeaponDamageMin=20
	WeaponDamageMax=24
	UsesEquipment=0
	BoneCraftingSkill = 25
	icon = 'Devourer.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 200
	Race = "Devourer"
	SubRace = "Blooded"
	Gender = "None"
	Carn = 1
	Infects = 1
	EggContent = 0
	BloodContent = 400
	MaxBloodContent = 400
	ArmourSkill = 10
	SwordSkill = 20
	SneakingSkill = 0
	Delay = 4
	ShieldSkill = 10
	ImmunePoison = 1
	ButcherySkill = 5
	UnArmedSkill = 30
	FishingSkill = 25

	HasLeftEye = 1
	HasRightEye = 1
	HasRightLung  = 1
	HasLeftLung  = 1
	HasSpleen  = 1
	HasTeeth  = 1
	HasLeftArm  = 1
	HasRightArm = 1
	HasLeftLeg = 0
	HasRightLeg = 0
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
	LeftLeg = "N/A"
	RightLeg = "N/A"
	OrganMaxHP = 150
	Undead = 1
	Defence = 75
	Age = 2000
	DieAge = 5000

mob/Monsters/Devourer/New()
	usr.Strength += rand(15,20)
	usr.Agility += rand(10,15)
	usr.Intelligence += rand(1,2)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I

mob/Monsters/Devourer/FleshCrawler
	parent_type=/mob/Monsters
	UsesEquipment=0
	WeaponDamageMin = 7
	WeaponDamageMax = 10
	icon = 'Devourer.dmi'
	icon_state = "FleshCrawler"
	Race="FleshCrawler"
	density = 1
	Carn = 1
	HoldingWeapon = "Claws"
	SneakingSkill = 250
	CantLoseLimbs = 1
	BloodContent = 200
	MaxBloodContent = 200
	Gender = "None"
	Delay = 3
	ImmunePoison = 1
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
	OrganMaxHP = 60

mob/Monsters/Devourer/FleshCrawler/New()
	Age = rand(20,60)
	usr.Strength += rand(10,15)
	usr.Agility += rand(10,15)
	usr.Defence += rand(15,25)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
	spawn(2000)
		src.Killer = "Rapid Decay"
		src.GoingToDie = 1
		src.Death()

mob/Monsters/DevourerZombie
	Undead=1
	Race = "Zombie"
	SubRace = "Blooded"
	icon = 'DevourerZombie.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 100
	MineingSkill = 10
	WoodCuttingSkill = 20
	Infects = 1
	Carn = 1
	SpearSkill = 10
	SwordSkill = 10
	AxeSkill = 10
	MaceSkill = 10
	PotionSkill = 10
	BowSkill = 15
	BloodContent = 300
	MaxBloodContent = 300
	UnArmedSkill = 10
	ShieldSkill = 15
	JewlCraftingSkill = 15
	ArmourSkill = 15
	WoodCraftingSkill = 25
	MetalCraftingSkill = 15
	SkinningSkill = 15
	ButcherySkill = 15
	LeatherCraftingSkill = 15
	PoisonSkill = 10
	BoneCraftingSkill = 10
	StoneCraftingSkill = 15
	SneakingSkill = 10
	LockPickingSkill = 10
	CookingSkill = 20
	FishingSkill = 25
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
	OrganMaxHP = 110
	Age = 0
	Strength=10
	Agility=10
	Defence=0
	Intelligence=0
	DieAge=1500

mob/Monsters/DevourerZombie/New()
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
