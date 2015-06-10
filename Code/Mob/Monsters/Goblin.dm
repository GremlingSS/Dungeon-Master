mob/Monsters/Goblin
	icon = 'Goblins.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 95
	MineingSkill = 10
	WoodCuttingSkill = 10
	Race = "Goblin"
	BowSkill = 20
	UsesPicks = 1
	Carn = 1
	SwordSkill = 20
	BloodContent = 300
	MaxBloodContent = 300
	PotionSkill = 10
	ArmourSkill = 10
	ShieldSkill = 15
	SpearSkill = 20
	PoisonSkill = 30
	BoneCraftingSkill = 15
	ButcherySkill = 15
	SkinningSkill = 15
	UnArmedSkill = 15
	LockPickingSkill = 20
	SneakingSkill = 20
	MaceSkill = 10
	UsesPoison = 1
	FishingSkill = 15
	JewlCraftingSkill = 15
	MetalCraftingSkill = 15
	WoodCraftingSkill = 10
	StoneCraftingSkill = 15
	LeatherCraftingSkill = 15
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
	OrganMaxHP = 95

mob/Monsters/Goblin/NPC
	CanBeSlaved = 1
	Owner = "{NPC Goblins}"
	name = "{NPC Goblins} Goblin"

mob/Monsters/Goblin/NPC/Scout
	ReturnDelay=300
	name = "{NPC Goblins} Goblin Scout"
	SpearSkill=40

mob/Monsters/Goblin/NPC/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Goblin/NPC/Villager
	EXP = 100
	UnArmedSkill=40

mob/Monsters/Goblin/NPC/Villager/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
		CraftItem(E,"Poor")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Goblin/NPC/Guard
	name = "{NPC Goblins} Goblin Guard"
	EXP=1000
	SpearSkill=100

mob/Monsters/Goblin/NPC/Guard/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
		CraftItem(E,"Impressive")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Goblin/NPC/King
	name = "{NPC Goblins} Goblin King"
	EXP=15000
	SwordSkill=150
	IsRoyal=1

mob/Monsters/Goblin/NPC/King/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/SilverSword(),new/obj/Items/Equipment/Armour/Chestplate/SilverChestPlate(),new/obj/Items/Equipment/Armour/Leggings/SilverLeggings(),new/obj/Items/Equipment/Armour/Crown/Bone))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Goblin/NPC/Commander
	ReturnDelay=400
	name = "{NPC Goblins} Goblin Commander"
	EXP = 2500
	SwordSkill=150
	SneakingSkill=100

mob/Monsters/Goblin/NPC/Commander/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	var/obj/Items/Equipment/Weapon/Swords/Lichbane/D = new
	if(ForcePickUpItem(D)) ForceEquipItem(D)
	StayLocal()
	..()

mob/Monsters/Goblin/New(LOC,GENDER=prob(50))
	Age = rand(20,60)
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	Strength += rand(4,9)
	Agility += rand(8,12)
	Defence += rand(3,8)
	Intelligence += rand(0.5,0.75)
	DieAge = rand(110,120)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
