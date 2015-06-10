mob/Monsters/Dwarf
	icon = 'Human.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 130
	MineingSkill = 50
	WoodCuttingSkill = 20
	Race = "Dwarf"
	UsesPicks = 1
	BloodContent = 300
	MaxBloodContent = 300
	Carn = 0

	BowSkill = 15
	AxeSkill = 20
	ArmourSkill = 40
	SneakingSkill = 10
	ShieldSkill = 20
	ButcherySkill = 10
	MaceSkill = 25
	SkinningSkill = 10
	UnArmedSkill = 10
	StoneCraftingSkill = 30
	MetalCraftingSkill = 25
	JewlCraftingSkill = 20
	FishingSkill = 15
	LeatherCraftingSkill = 15
	CookingSkill = 15

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
	OrganMaxHP = 125

mob/Monsters/Dwarf/NPC
	CanBeSlaved = 1
	Owner = "{NPC Alliance}"
	name = "{NPC Alliance} Dwarf"

mob/Monsters/Dwarf/NPC/Guard
	name = "{NPC Alliance} Dwarven Guard"
	EXP = 10000
	SpearSkill=100

mob/Monsters/Dwarf/NPC/Guard/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet))
		CraftItem(E,"Impressive")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Dwarf/NPC/Villager
	name = "{NPC Alliance} Dwarven Villager"
	EXP = 100
	UnArmedSkill=40

mob/Monsters/Dwarf/NPC/Villager/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
		CraftItem(E,"Poor")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Dwarf/New(LOC,GENDER=prob(50))
	Age = rand(20,30)
	if(GENDER)
		Gender = "Male"
		Beard = pick("Grey","Brown","Black",null)
		Hair = 0
	else
		Gender = "Female"
		Beard = 0
		Hair = "HumanBrown"
	Strength += rand(7,14)
	Agility += rand(3,6)
	Defence += rand(7,13)
	Intelligence += rand(0.5,0.75)
	DieAge += rand(120,150)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
