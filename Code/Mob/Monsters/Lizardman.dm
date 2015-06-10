mob/Monsters/Lizardman
	icon = 'Lizardman.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 125
	MineingSkill = 10
	WoodCuttingSkill = 10
	Race = "Lizardman"
	BowSkill = 25
	Carn = 1
	SwordSkill = 20
	HasGland = 1
	ImmunePoison = 1
	BloodContent = 300
	MaxBloodContent = 300
	PotionSkill = 10
	ArmourSkill = 15
	ShieldSkill = 20
	PoisonDMG = 5
	SpearSkill = 25
	PoisonSkill = 25
	BoneCraftingSkill = 20
	ButcherySkill = 15
	SkinningSkill = 15
	UnArmedSkill = 20
	LockPickingSkill = 20
	SneakingSkill = 15
	MaceSkill = 10
	UsesPoison = 1
	FishingSkill = 20
	JewlCraftingSkill = 5
	MetalCraftingSkill = 10
	WoodCraftingSkill = 15
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
	OrganMaxHP = 115

mob/Monsters/Lizardman/NPCLizardMan
	CanBeSlaved = 1
	Owner = "{NPC Lizardmen}"
	name = "{NPC Lizardmen} Lizardmen"

mob/Monsters/Lizardman/NPCLizardMan/New()
	..()
	StayLocal()

mob/Monsters/Lizardman/NPCLizardMan/Scout
	ReturnDelay=300
	name = "{NPC Lizardmen} Lizardmen Scout"

mob/Monsters/Lizardman/NPCLizardMan/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

mob/Monsters/Lizardman/NPCLizardMan/Hunter
	ReturnDelay=200
	name = "{NPC Lizardmen} Lizardmen Hunter"
	EXP=500

mob/Monsters/Lizardman/NPCLizardMan/Hunter/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

mob/Monsters/Lizardman/NPCLizardMan/Warrior
	ReturnDelay=100
	name = "{NPC Lizardmen} Lizardmen Warrior"
	EXP = 1500

mob/Monsters/Lizardman/NPCLizardMan/Warrior/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/BoneBuckler(),new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Helmet/BoneHelmet(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
		CraftItem(E,"Impressive")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

mob/Monsters/Lizardman/New(LOC,GENDER=prob(50))
	Age = rand(20,60)
	if(GENDER) usr.Gender = "Male"
	else usr.Gender = "Female"
	usr.Strength += rand(6,11)
	usr.Agility += rand(8,12)
	usr.Defence += rand(9,12)
	usr.Intelligence += rand(0.25,0.5)
	usr.DieAge += rand(110,115)
	var/image/I = new('mob.dmi',src)
	src.Star = I
	StartAllProcs()
	..()
