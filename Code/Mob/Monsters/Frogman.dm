/mob/Monsters/Frogman
	UsesPoison=1
	icon = 'FrogMan.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 100
	Race = "Frogman"
	MineingSkill = 10
	WoodCuttingSkill = 10
	Carn = 1
	ButcherySkill = 10
	SneakingSkill = 20
	SkinningSkill = 10
	FishingSkill = 20
	JewlCraftingSkill = 5
	MetalCraftingSkill = 10
	WoodCraftingSkill = 15
	ArmourSkill = 15
	ShieldSkill = 20
	SpearSkill = 25
	PoisonSkill = 25
	BoneCraftingSkill = 20
	UnArmedSkill = 20
	SneakingSkill = 15
	StoneCraftingSkill = 15
	LeatherCraftingSkill = 15
	ImmunePoison = 1
	UnArmedSkill = 10
	FishingSkill= 50
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
	OrganMaxHP = 85
	MaxBloodContent = 300

/mob/Monsters/Frogman/NPC
	Owner = "{NPC Frogmen}"
	name = "{NPC Frogmen} Frogman"
	CanBeSlaved=1
	ReturnDelay=500

/mob/Monsters/Frogman/NPC/New()
	..()
	StayLocal()

/mob/Monsters/Frogman/NPC/Scout
	name = "{NPC Frogmen} Frogman Scout"
	EXP=400
	ReturnDelay=700

/mob/Monsters/Frogman/NPC/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

/mob/Monsters/Frogman/NPC/Warrior
	name = "{NPC Frogmen} Frogman Warrior"
	EXP=700

/mob/Monsters/Frogman/NPC/Warrior/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

/mob/Monsters/Frogman/NPC/Chieftain
	name = "{NPC Frogmen} Frogman Cheiftain"
	EXP=1000

/mob/Monsters/Frogman/NPC/Chieftain/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/BoneBuckler(),new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Helmet/BoneHelmet(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
		CraftItem(E,"Quality")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

/mob/Monsters/Frogman/New(LOC,GENDER=prob(50))
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	Age = rand(20,60)
	usr.Strength += rand(5,7)
	usr.Agility += rand(5,10)
	usr.Defence += rand(15,25)
	usr.Intelligence += rand(0.025,0.05)
	usr.DieAge += rand(100,120)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
