mob/Monsters/Human
	icon = 'Human.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 110
	MineingSkill = 10
	WoodCuttingSkill = 20
	Race = "Human"
	UsesPicks = 1
	Carn = 0
	SpearSkill = 10
	SwordSkill = 20
	AxeSkill = 10
	MaceSkill = 10
	PotionSkill = 10
	BowSkill = 15
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

mob/Monsters/Human/NPC
	CanBeSlaved = 1
	Owner = "{NPC Alliance}"
	name = "{NPC Alliance} Human"

mob/Monsters/Human/NPC/Paladin
	ReturnDelay=400
	EXP=1000
	SwordSkill=80
	name = "{NPC Alliance} Human Paladin"

mob/Monsters/Human/NPC/Paladin/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius,new/obj/Items/Equipment/Armour/Leggings/DragoonLeggings,new/obj/Items/Equipment/Armour/Chestplate/DragoonChestPlate))
		CraftItem(E,"Grand")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Human/NPC/PaladinGuard
	EXP=1500
	SwordSkill=100
	name = "{NPC Alliance} Human Paladin"

mob/Monsters/Human/NPC/PaladinGuard/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius,new/obj/Items/Equipment/Armour/Leggings/DragoonLeggings,new/obj/Items/Equipment/Armour/Chestplate/DragoonChestPlate))
		CraftItem(E,"Grand")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Human/NPC/Dragoon
	ReturnDelay=400
	EXP=20000
	SwordSkill=80
	ArmourSkill=40
	SneakingSkill=100
	name = "{NPC Alliance} Human Dragoon"

mob/Monsters/Human/NPC/Dragoon/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius,new/obj/Items/Equipment/Armour/RightArm/DragoonRightGauntlet,new/obj/Items/Equipment/Armour/Helmet/DragoonHelmet,new/obj/Items/Equipment/Armour/Leggings/DragoonLeggings,new/obj/Items/Equipment/Armour/Chestplate/DragoonChestPlate,new/obj/Items/Equipment/Armour/LeftArm/DragoonLeftGauntlet))
		CraftItem(E,"Holy")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Human/NPC/Scout
	ReturnDelay=500
	name = "{NPC Alliance} Human Scout"
	EXP = 400
	SwordSkill=40

mob/Monsters/Human/NPC/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/Gladius(),new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
		CraftItem(E,"Quality")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Human/NPC/Warrior
	ReturnDelay=50
	name = "{NPC Alliance} Human Warrior"
	EXP = 13000
	SwordSkill=150

mob/Monsters/Human/NPC/Warrior/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/MetalBuckler(),new/obj/Items/Equipment/Weapon/Swords/StraightSword(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet()))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Human/NPC/Guard
	name = "{NPC Alliance} Human Guard"
	EXP = 1000
	SpearSkill=100

mob/Monsters/Human/NPC/Guard/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
		CraftItem(E,"Impressive")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Human/NPC/Noble
	IsRoyal=1
	name = "{NPC Alliance} Human Noble"
	EXP = 15000
	SwordSkill=200
	ArmourSkill=100

mob/Monsters/Human/NPC/Noble/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius(),new/obj/Items/Equipment/Armour/Chestplate/GoldChestPlate(),new/obj/Items/Equipment/Armour/Leggings/GoldLeggings()))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Human/NPC/Villager
	name = "{NPC Alliance} Human Villager"
	EXP = 100
	UnArmedSkill=40

mob/Monsters/Human/NPC/Villager/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
		CraftItem(E,"Poor")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Human/NPC/Skorn
	Owner= "{NPC Demons}"
	name = "{NPC Demons} Follower of Skorn"
	SubRace="HalfDemon"
	EXP = 30000
	SpearSkill=200
	ShieldSkill=40
	ArmourSkill=50
	SneakingSkill=100
	WearingShield=1
	Defence=60

mob/Monsters/Human/NPC/Skorn/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Leggings/SkornLeggings,new/obj/Items/Equipment/Armour/Chestplate/SkornChestPlate,new/obj/Items/Equipment/Armour/Helmet/SkornPlateHelmet,new/obj/Items/Equipment/Armour/LeftArm/SkornLeftGauntlet,new/obj/Items/Equipment/Armour/RightArm/SkornRightGauntlet))
		CraftItem(E,"Unholy")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear()))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()
	spawn() icon+=rgb(100,0,0)

mob/Monsters/Human/NPC/Skorn/Skorn
	IsRoyal=1
	name = "{NPC Demons} Skorn, Lord of Pain"
	ShieldSkill=90
	ArmourSkill=90
	SneakingSkill=100
	EXP = 50000
	WeaponDamageMin=50
	WeaponDamageMax=70
	WearingShield=1
	Strength=50
	Agility=50
	Defence=90

mob/Monsters/Human/NPC/Skorn/Skorn/New()
	..()
	Gender = "Male"
	icon='Human.dmi'
	Black=null
	Hair=null

mob/Monsters/Human/New(LOC,GENDER=prob(50))
	Age = rand(20,30)
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	if(prob(50))
		Black=1
		icon = 'HumanBlack.dmi'
	if(Gender=="Female") Hair="Human[pick("Black","Brown")]"
	else Hair=0
	Strength += rand(5,10)
	Agility += rand(7,11)
	Defence += rand(4,9)
	Intelligence += rand(1,2)
	DieAge += rand(95,115)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
