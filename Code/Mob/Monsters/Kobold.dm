mob/Monsters/Kobold
	icon = 'Kobold.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 85
	Race = "Kobold"
	CliffClimber=1
	MineingSkill = 10
	WoodCuttingSkill = 10
	BowSkill = 20
	BloodContent = 300
	MaxBloodContent = 300
	Carn = 1
	SpearSkill = 25
	ArmourSkill = 10
	LockPickingSkill = 25
	SneakingSkill = 40
	UsesPoison = 1
	PoisonSkill = 40
	SkinningSkill = 15
	BoneCraftingSkill = 20
	ButcherySkill = 10
	UnArmedSkill = 15
	FishingSkill = 20
	MetalCraftingSkill = 10
	WoodCraftingSkill = 10
	StoneCraftingSkill = 10
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
	OrganMaxHP = 85

mob/Monsters/Kobold/NPC
	CanBeSlaved = 1
	Owner = "{NPC Kobolds}"
	name = "{NPC Kobolds} Kobold"

mob/Monsters/Kobold/NPC/Scout
	ReturnDelay=400
	name = "{NPC Kobolds} Kobold Scout"
	EXP = 100

mob/Monsters/Kobold/NPC/Scout/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear(),new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
		CraftItem(E,"Poor")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	StayLocal()
	..()

mob/Monsters/Kobold/NPC/Chieftain
	ReturnDelay=400
	name = "{NPC Kobolds} Kobold Chieftain"
	EXP = 2500
	DaggerSkill=150
	SneakingSkill=100

mob/Monsters/Kobold/NPC/Chieftain/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
		CraftItem(E,"Grand")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	var/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger/D = new
	D.name = "Sacrifical Blade of Dragethh"
	D.desc = "The kobolds probably stole it from the temple of some crazy cult of blood god worshippers, it is very sharp and radiates an aura of pure evil."
	if(ForcePickUpItem(D)) ForceEquipItem(D)
	StayLocal()
	..()

mob/Monsters/Kobold/New(LOC,GENDER=prob(50))
	Age = rand(20,60)
	if(GENDER) Gender = "Male"
	else Gender = "Female"
	Strength += rand(4,8)
	Agility += rand(9,13)
	Defence += rand(2,6)
	Intelligence += rand(0.1,0.2)
	DieAge += rand(95,110)
	StartAllProcs()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
