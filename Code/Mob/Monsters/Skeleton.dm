mob/Monsters/Skeleton
	icon = 'Skeleton.dmi'
	icon_state = "Normal"
	density = 1
	weightmax = 100
	Undead = 1
	Fling = 1
	Carn = 1
	SpecialUnit = 1
	ButcherySkill = 1
	Race = "Skeleton"
	SubRace = "Blooded"
	ImmunePoison = 1
	ImmuneToTemperature = 1
	SneakingSkill = 10
	UnArmedSkill = 35
	HasTeeth  = 1
	HasLeftArm  = 1
	HasRightArm = 1
	HasLeftLeg = 1
	HasRightLeg = 1
	HasHead = 1
	OrganMaxHP=75

mob/Monsters/Skeleton/NPC
	CanBeSlaved=1
	OrganMaxHP=1
	Owner = "{NPC Undead}"

mob/Monsters/Skeleton/NPC/Warrior
	name = "{NPC Undead} Skeleton Warrior"
	WeaponDamageMin = 5
	WeaponDamageMax = 10

mob/Monsters/Skeleton/NPC/Lord
	name = "{NPC Undead} Skeleton Lord"
	WeaponDamageMin = 5
	WeaponDamageMax = 10
	Strength=10
	Agility=10

mob/Monsters/Skeleton/NPC/Lord/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
		CraftItem(E,"Average")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	..()

mob/Monsters/Skeleton/NPC/Lich
	IsRoyal=1
	OrganMaxHP=50
	name = "{NPC Undead} Skeletal Lich King"
	Strength=25
	Agility=25
	SneakingSkill=100
	UsesEquipment=0
	Defence=60
	EXPNeeded=1500

mob/Monsters/Skeleton/NPC/New()
	for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/NecroRobe(),new/obj/Items/Equipment/Armour/Crown/Bone()))
		CraftItem(E,"Legendary")
		if(ForcePickUpItem(E)) ForceEquipItem(E)
	var/obj/Items/Equipment/Weapon/Maces/AstralStaff/S = new
	S.name = "Brainmasher"
	S.desc = "Those nutty skeletons probably hacked down a magic tree to make this glorified club."
	S.WeaponDamageMin = 22
	S.WeaponDamageMax = 35
	if(ForcePickUpItem(S)) ForceEquipItem(S)
	..()

mob/Monsters/Skeleton/New()
	usr.Strength += rand(6,11)
	usr.Agility += rand(8,12)
	usr.Defence += rand(9,12)
	usr.Intelligence += rand(0.25,0.5)
	usr.DieAge = rand(500,900)
	WalkTo()
	FullHeal()
	..()
	var/image/I = new('mob.dmi',src)
	src.Star = I
