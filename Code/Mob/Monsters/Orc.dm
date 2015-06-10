mob/Monsters/Orc
	icon = 'Orc.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 125
	MineingSkill = 15
	WoodCuttingSkill = 15
	Race = "Orc"
	UsesPicks = 1
	Carn = 1
	SpearSkill = 15
	SwordSkill = 20
	AxeSkill = 30
	MaceSkill = 25
	PotionSkill = 0
	BowSkill = 15
	BloodContent = 300
	MaxBloodContent = 300
	UnArmedSkill = 20
	ShieldSkill = 20
	JewlCraftingSkill = 0
	ArmourSkill = 20
	UsesPoison = 1
	WoodCraftingSkill = 20
	MetalCraftingSkill = 15
	SkinningSkill = 20
	ButcherySkill = 15
	LeatherCraftingSkill = 20
	PoisonSkill = 15
	BoneCraftingSkill = 15
	StoneCraftingSkill = 15
	SneakingSkill = 5
	LockPickingSkill = 10
	CookingSkill = 0
	FishingSkill = 15
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
	OrganMaxHP = 130

mob/Monsters/Orc/NPCOrc
	CanBeSlaved = 1
	Owner = "{NPC Orcs}"
	name = "{NPC Orcs} Orc"

mob/Monsters/Orc/NPCOrc/Scout
	ReturnDelay=300
	EXP=125
	name = "{NPC Orcs} Orc Scout"

mob/Monsters/Orc/NPCOrc/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Orc/NPCOrc/Hunter
	ReturnDelay=200
	name = "{NPC Orcs} Orc Hunter"
	EXP=800

mob/Monsters/Orc/NPCOrc/Hunter/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Orc/NPCOrc/Warlord
	name = "{NPC Orcs} Orcish Warlord"
	EXP=50000
	ButcherySkill=150
	SneakingSkill=100
	Defence=40
	ArmourSkill=70
	ShieldSkill=70

mob/Monsters/Orc/NPCOrc/Warlord/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/MetalBuckler(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet()))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	var/obj/Items/Equipment/Weapon/DemonicWeapons/Butcher_Knife/B = new
	if(ForcePickUpItem(B)) ForceEquipItem(B)
	StayLocal()
	..()

mob/Monsters/Orc/NPCOrc/Warrior
	name = "{NPC Orcs} Orc Warrior"
	EXP=1000

mob/Monsters/Orc/NPCOrc/Warrior/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/MetalBuckler(),new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet()))
		CraftItem(E,"Impressive")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Orc/NPCOrc/Guard
	EXP = 1000
	AxeSkill=100

mob/Monsters/Orc/NPCOrc/Guard/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/Shield/MetalBuckler()))
		CraftItem(E,"Epic")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	Guarding()
	..()

mob/Monsters/Orc/New(LOC,GENDER=prob(50))
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	Strength += rand(7,14)
	Agility += rand(5,8)
	Defence += rand(6,12)
	Intelligence += rand(0.25,0.5)
	DieAge += rand(110,125)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
