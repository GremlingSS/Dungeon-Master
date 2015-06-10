mob/Monsters/Demon
	BloodContent = 350
	MaxBloodContent = 350
	icon = 'Demon.dmi'
	ImmunePoison=1
	ImmuneToTemperature=1
	Race = "Demon"
	SubRace = "Blooded"
	IsWood = 0
	weightmax = 200
	MineingSkill = 10
	WoodCuttingSkill = 10
	Carn = 1
	BloodContent = 300
	MaxBloodContent = 300
	WingsOut = 1
	WoodCraftingSkill  = 20
	MetalCraftingSkill  = 20
	SkinningSkill  = 20
	ButcherySkill  = 20
	LeatherCraftingSkill  = 20
	PoisonSkill  = 20
	BoneCraftingSkill  = 20
	StoneCraftingSkill  = 20
	LockPickingSkill = 20
	JewlCraftingSkill = 20
	CookingSkill  = 20
	FishingSkill  = 25
	SneakingSkill  = 15
	text = "<font color=red>&"

	HasWings = 1
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
	OrganMaxHP = 250

	SpearSkill = 20
	AxeSkill  = 20
	SwordSkill  = 60
	UnArmedSkill  = 30
	MaceSkill  = 20
	BowSkill = 15
	ShieldSkill  = 20
	ArmourSkill  = 35

mob/Monsters/Demon/NPC
	IsRoyal=1//Stops ever changing owner, and grants better stats.
	CanBeSlaved = 1
	EXP=120000
	ReturnDelay=300
	UnArmedSkill=150
	SwordSkill=150
	MaceSkill=150
	SpearSkill=150
	AxeSkill=150
	DaggerSkill=150
	SneakingSkill=150
	BowSkill=150
	Defence=160
	Owner = "{NPC Demons}"
	name = "{NPC Demons} Demon"
	WeaponDamageMin=20
	WeaponDamageMax=20
	WearingChest=1
	WearingShield=1
	WearingHelmet=1
	WearingLegs=1
	WearingBack=1
	WearingCape=1
	WearingLeftArm=1
	WearingRightArm=1

mob/Monsters/Demon/NPC/New()
	if(!HoldingWeapon)
		var/obj/Items/Equipment/Weapon/W
		switch(rand(1,6))
			if(1) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Sword(loc)
			if(2) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Axe(loc)
			if(3) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Mace(loc)
			if(4) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Spear(loc)
			if(5) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger(loc)
			if(6) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Bow(loc)
		if(W) if(ForcePickUpItem(W)) if(ForceEquipItem(W)) if(HoldingWeapon=="Bow") HoldingWeapon="Mace"
	..()

mob/Monsters/Demon/NPC/Warrior //For map generated demons.
		name = "{NPC} Demon"

mob/Monsters/Demon/NPC/warrior/New()
	StayLocal()
	loc=LocateValidLocation(X=103,XX=929,Y=130,YY=683,Z=4)
	if(prob(0.5)) new/mob/Monsters/Demon/NPC/Lord(loc)
	..()

mob/Monsters/Demon/NPC/Lord
	IsRoyal=1
	name = "{NPC} Demon Lord"
	EXPNeeded=300000
	Level=100
	Strength = 30
	Agility = 30
	Defence = 230
	WeaponDamageMin = 40
	WeaponDamageMax = 65
	ImmunePoison=1
	SwordSkill = 150
	BloodContent = 400
	MaxBloodContent = 400

mob/Monsters/Demon/NPC/Lord/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/Crown/Bone()))
		CraftItem(E,"Unholy")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	var/obj/Items/Equipment/Weapon/DemonicWeapons/DestructionSword/E = new()
	if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Demon/New(LOC,GENDER=prob(50))
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	Age = rand(200,600)
	usr.DieAge += rand(10000,12500)
	usr.Strength += rand(100,120)
	usr.Agility += rand(100,120)
	usr.Intelligence += rand(4,8)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
