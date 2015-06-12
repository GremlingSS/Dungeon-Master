/MiscCreate/verb/LegendaryMetalSword()
	set category="Misc"
	var/obj/Items/Equipment/Weapon/Swords/StraightSword/A1 = new (usr.loc)
	A1.CraftRank = "Legendary Quality"
	A1.MetalWeaponCraft()

/MiscCreate/verb/LegendaryMetalSpear()
	set category="Misc"
	var/obj/Items/Equipment/Weapon/Spears/MetalSpear/A1 = new (usr.loc)
	A1.CraftRank = "Legendary Quality"
	A1.MetalWeaponCraft()

/MiscCreate/verb/LegendaryMetalMace()
	set category="Misc"
	var/obj/Items/Equipment/Weapon/Maces/MetalMace/A1 = new (usr.loc)
	A1.CraftRank = "Legendary Quality"
	A1.MetalWeaponCraft()

/MiscCreate/verb/LegendaryMetalAxe()
	set category="Misc"
	var/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe/A1 = new (usr.loc)
	A1.CraftRank = "Legendary Quality"
	A1.MetalWeaponCraft()

/MiscCreate/verb/FullMetalLegendary()
	set category="Misc"
	var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/A1 = new (usr.loc)
	var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/A2 = new (usr.loc)
	var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/A3 = new (usr.loc)
	var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/A4 = new (usr.loc)
	var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/A5 = new (usr.loc)
	A1.CraftRank = "Legendary Quality"
	A2.CraftRank = "Legendary Quality"
	A3.CraftRank = "Legendary Quality"
	A4.CraftRank = "Legendary Quality"
	A5.CraftRank = "Legendary Quality"
	A1.MetalArmourCraft()
	A2.MetalArmourCraft()
	A3.MetalArmourCraft()
	A4.MetalArmourCraft()
	A5.MetalArmourCraft()

/MiscCreate/verb/FullBoneLegendary()
	set category="Misc"
	var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/A1 = new (usr.loc)
	var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/A2 = new (usr.loc)
	var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/A3 = new (usr.loc)
	var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/A4 = new (usr.loc)
	var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/A5 = new (usr.loc)
	A1.CraftRank = "Legendary Quality"
	A2.CraftRank = "Legendary Quality"
	A3.CraftRank = "Legendary Quality"
	A4.CraftRank = "Legendary Quality"
	A5.CraftRank = "Legendary Quality"
	A1.BoneArmourCraft()
	A2.BoneArmourCraft()
	A3.BoneArmourCraft()
	A4.BoneArmourCraft()
	A5.BoneArmourCraft()

/MiscCreate/verb/Grapes()
	set category="Misc"
	var/obj/Items/Plants/GrapeVine/item = new (usr.loc)
	item=item

/MiscCreate/verb/Garlic()
	set category="Misc"
	var/obj/Items/Plants/GarlicPlant/item = new (usr.loc)
	item=item

/MiscCreate/verb/Tomatos()
	set category="Misc"
	var/obj/Items/Plants/TomatoPlant/item = new (usr.loc)
	item=item

/MiscCreate/verb/IronIngot()
	set category="Misc"
	var/obj/Items/Ingots/IronIngot/item = new (usr.loc)
	item=item

/MiscCreate/verb/SilverIngot()
	set category="Misc"
	var/obj/Items/Ingots/SilverIngot/item = new (usr.loc)
	item=item

/MiscCreate/verb/GoldIngot()
	set category="Misc"
	var/obj/Items/Ingots/GoldIngot/item = new (usr.loc)
	item=item

/MiscCreate/verb/Stone()
	set category="Misc"
	var/obj/Items/ores/stone/item = new (usr.loc)
	item=item

/MiscCreate/verb/Wood()
	set category="Misc"
	var/obj/Items/woods/wood/item = new (usr.loc)
	item=item

/MiscCreate/verb/Food()
	set category="Misc"
	var/obj/Items/Food/Meat/Cooked_Meat/item = new (usr.loc)
	item=item

/MiscCreate/verb/Bones()
	set category="Misc"
	var/obj/Items/Bones/Bones/item = new (usr.loc)
	item=item

/MiscCreate/verb/WoodenDoor()
	set category="Misc"
	var/obj/Items/Furniture/Doors/WoodenDoor/item = new (usr.loc)
	item=item
	item.dir = usr.dir
	item.Placed = 1
	item.HP = 5000
	item.Owner = usr

/MiscCreate/verb/BoneDoor()
	set category="Misc"
	var/obj/Items/Furniture/Doors/BoneDoor/item = new (usr.loc)
	item=item
	item.dir = usr.dir
	item.Placed = 1
	item.HP = 5000
	item.Owner = usr

/MiscCreate/verb/MetalDoor()
	set category="Misc"
	var/obj/Items/Furniture/Doors/MetalDoor/item = new (usr.loc)
	item=item
	item.dir = usr.dir
	item.Placed = 1
	item.HP = 5000
	item.Owner = usr
	item.density = 1

/MiscCreate/verb/EmptyBottle()
	set category="Misc"
	var/obj/Items/Potions/EmptyBottle/item = new (usr.loc)
	item=item

/MiscCreate/verb/LonglifePotion()
	set category="Misc"
	var/obj/Items/Potions/LifePotion/item = new (usr.loc)
	item=item

/MiscCreate/verb/ImmuneToDevPotion()
	set category="Misc"
	var/obj/Items/Potions/DevourerPotion/item = new (usr.loc)
	item=item

/MiscCreate/verb/VampCurePotion()
	set category="Misc"
	var/obj/Items/Potions/VampirismCure/item = new (usr.loc)
	item=item
