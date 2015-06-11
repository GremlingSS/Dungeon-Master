/mob
	HP=350
	MAXHP=350
	IsWood = 1
	var/Critter = 0

	//Reason it's temp is so as to evade saving duplicates of particular units and to not have breeding details carry in saves.
	//Reason these two are named "MALE" and "FEMALE" rather than FutureFather/Mother, is simply to keep em close to the vars used in "BreedWith()"
	var/tmp/mob/CHILDMALE //Doubles as a "IsPregnent" var by use of "if(CHILDMALE)"
	var/tmp/mob/CHILDFEMALE //This is mostly used for eggs, but having it in the code allows for complicated things like having someone have someone elses kid or something.
	var/tmp/CHILDTYPE //This holds the actual type value that the child will be. In most cases equal to FEMALE's racetype durring births, but needs to be set for eggs.
	var/tmp/CHILDCOUNT //This holds the ammount of children that will be created upon "GiveBirth()".

	var/IsRoyal

	var/UsesEquipment="Normal" //Simply set to 0 to stop use of equipment.
	var/HoldingWeapon
	var/WearingChest
	var/WearingShield
	var/WearingHelmet
	var/WearingLegs
	var/WearingBack
	var/WearingCape
	var/WearingLeftArm
	var/WearingRightArm
	var/WearingFullPlateHelm
	var/WearingRing = 0
	var/WearingCrown

	var/tmp/Function = null
	var/tmp/SubFunction = null

/mob/Test
	density = 0
	IsMist = 1



/mob/Monsters
	HumanParts=1


/mob/Monsters/DblClick()
	if(Owner==usr)
		src.ToggleSelect()
	else if(usr.DE && usr.FreeSelect)
		src.ToggleSelect(usr)