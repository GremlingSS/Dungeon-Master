mob/Monsters/Ratman
	icon = 'Ratmen.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 100
	Race = "Ratman"
	MineingSkill = 45
	WoodCuttingSkill = 45
	BowSkill = 20
	BloodContent = 300
	MaxBloodContent = 300
	Carn = 1
	SpearSkill = 25
	ArmourSkill = 10
	LockPickingSkill = 10
	SneakingSkill = 45
	UsesPoison = 1
	PoisonSkill = 45
	SkinningSkill = 15
	BoneCraftingSkill = 35
	ButcherySkill = 35
	UnArmedSkill = 20
	FishingSkill = 20
	MetalCraftingSkill = 5
	WoodCraftingSkill = 5
	StoneCraftingSkill = 25
	LeatherCraftingSkill = 20
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
	OrganMaxHP = 65

mob/Monsters/Ratman/NPC
	CanBeSlaved = 1
	Owner = "{NPC Ratmen}"
	name = "{NPC Ratmen} Ratman"

mob/Monsters/Ratman/NPC/Scout
	ReturnDelay=500
	name = "{NPC Ratmen} Ratman Scout"
	EXP = 100

mob/Monsters/Ratman/NPC/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
		CraftItem(E,"Poor")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Ratman/NPC/King
	ReturnDelay=400
	name = "{NPC Ratmen} Ratman Commander"
	EXP = 2500
	SpearSkill=150
	SneakingSkill=100

mob/Monsters/Ratman/NPC/King/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet(),new/obj/Items/Equipment/Armour/Crown/Bone()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	var/obj/Items/Equipment/Weapon/Spears/Bloodwhisker/B = new
	if(ForcePickUpItem(B)) ForceEquipItem(B)
	StayLocal()
	..()

mob/Monsters/Ratman/New(LOC,GENDER=prob(50))
	Age = rand(5,10)
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	Strength += rand(1,2)
	Agility += rand(10,15)
	Defence += rand(0,1)
	Intelligence += rand(0.25,0.5)
	DieAge += rand(40,50)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
