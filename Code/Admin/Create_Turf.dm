/TurfCreate/verb/CreateStoneFloor()
	set category="Turf"
	var/turf/grounds/DetailedFloor/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateCrystalFloor()
	set category="Turf"
	var/turf/grounds/DetailedFloor/item = new (usr.loc)
	item=item
	item.icon_state = "IllithidFloor"
	item.name = "crystalfloor"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateObsidianFloor()
	set category="Turf"
	var/turf/grounds/DetailedFloor/item = new (usr.loc)
	item=item
	item.icon_state = "GoblinFloor"
	item.name = "obsidianfloor"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateSandkingFloor()
	set category="Turf"
	var/turf/grounds/DetailedFloor/item = new (usr.loc)
	item=item
	item.icon_state = "SandFloor"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateWoodFloor()
	set category="Turf"
	var/turf/grounds/WoodFloor/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateHellFloor()
	set category="Turf"
	var/turf/grounds/hellfloor/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateGrass()
	set category="Turf"
	var/turf/grounds/grass/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateEvilTurf()
	set category="Turf"
	var/turf/grounds/deadgrass/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateGoodTurf()
	set category="Turf"
	var/turf/grounds/goodgrass/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateEvilTree()
	set category="Turf"
	var/turf/grounds/Trees/DeadTree/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateGoodTree()
	set category="Turf"
	var/turf/grounds/Trees/GoodTree/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateNoDig()
	set category="Turf"
	var/turf/grounds/NoDig/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateSnow()
	set category="Turf"
	var/turf/grounds/snow/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateDesert()
	set category="Turf"
	var/turf/grounds/desert/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateMarsh()
	set category="Turf"
	var/turf/grounds/marsh/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateCaveFloor()
	set category="Turf"
	var/turf/grounds/cavefloor2/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateCaveWall()
	set category="Turf"
	var/turf/grounds/cavefloor/item = new (usr.loc)
	item=item
	item.name = "Mountain"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateStoneWall()
	set category="Turf"
	var/turf/grounds/DetailedWall/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateCrystalWall()
	set category="Turf"
	var/turf/grounds/DetailedWall/item = new (usr.loc)
	item=item
	item.icon_state = "IllithidWall"
	item.name = "Crystal Wall"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateObsidianWall()
	set category="Turf"
	var/turf/grounds/DetailedWall/item = new (usr.loc)
	item=item
	item.icon_state = "GoblinWall"
	item.name = "Obsidian Wall"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateSandkingWall()
	set category="Turf"
	var/turf/grounds/DetailedWall/item = new (usr.loc)
	item=item
	item.icon_state = "SandWall"
	item.name = "Sandking Wall"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateAdamantiumSpire()
	set category="Turf"
	var/turf/grounds/DetailedWall/item = new (usr.loc)
	item=item
	item.icon_state = "AdaSpire"
	item.name = "Adamantium Spire"
	item.HP = 10000
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateBoneWall()
	set category="Turf"
	var/turf/grounds/DetailedWall/item = new (usr.loc)
	item=item
	item.icon_state = "Bone Wall"
	item.name = "Bone Wall"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateTribalWall()
	set category="Turf"
	var/turf/grounds/WoodWall/item = new (usr.loc)
	item=item
	item.icon_state = "TribalWall"
	item.name = "Tribal Wall"
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateHellCliff()
	set category="Turf"
	var/turf/grounds/hellcliff/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateWoodWall()
	set category="Turf"
	var/turf/grounds/WoodWall/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateChasm()
	set category="Turf"
	var/turf/grounds/Chasm/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateLava()
	set category="Turf"
	var/turf/grounds/lavas/lava/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateWater()
	set category="Turf"
	var/turf/grounds/waters/water/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateSwampWater()
	set category="Turf"
	var/turf/grounds/waters/swamp/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1


/TurfCreate/verb/CreateTree()
	set category="Turf"
	var/turf/grounds/Trees/Tree1/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateTundraTree()
	set category="Turf"
	var/turf/grounds/Trees/TundraTree/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateCactus()
	set category="Turf"
	var/turf/grounds/Trees/Cactus/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1

/TurfCreate/verb/CreateBamboo()
	set category="Turf"
	var/turf/grounds/Trees/Bamboo/item = new (usr.loc)
	item=item
	if(usr.z == 1)
		item.Sky = 1
	if(usr.z == 2)
		item.Sky = 1
	if(usr.z == 3)
		item.Content3 = "Peak"
	if(usr.z == 4)
		item.Cant = 1
