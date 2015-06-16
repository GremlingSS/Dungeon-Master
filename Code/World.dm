/world/New()
	log = file("ErrorLog.txt")
	Name()
	Date()
	Age()
	Aging()
	History()
	SeasonChange()
	NightChange()
	Repop()
	BirthChanges()
	CallSave()

var/Season = "Summer"
var/WorldName
var/Date
var/History
var/Legends
var/Ages
var/night = 1
var/PlayerList = list()

/proc/SeasonChange()
	Seasons()
	world.Repop()
	spawn(10000)
		SeasonChange()

/proc/Seasons()
	Army()
	Date += 1
	switch(Season)
		if("Summer") Season = "Fall"
		if("Fall") Season = "Winter"
		if("Winter") Season = "Spring"
		if("Spring") Season = "Summer"
	world << "<b><font color=blue>It is now [Season]!"

/proc/BirthChanges()
	Births()
	spawn(600)
		BirthChanges()
		return

/proc/Births() for(var/mob/Monsters/m in world)
	m.overlays -= /obj/dodge/
	m.overlays -= /obj/miss/
	m.overlays -= /obj/block/

/proc/NightChange()
	Night()
	spawn(5500)
		NightChange()

/proc/Night()
	if(night)
		world << "<b><font color=blue>It Starts To Get Lighter"
		spawn(500)
			night = 0
			world << "<b><font color=blue>Day Rises"
			for(var/mob/X in Players2)
				if(X.client)
					for(var/obj/Hud/Day/D in X.client.screen)
						D.icon_state = "Sun"
						D.name = "Day"
						D.text = "<font color=yellow>¤"
			for(var/mob/Monsters/m in world)
				if(m.SubRace == "Werewolf")
					m.WerewolfTransformation()
				m.SunLight()
	else
		world << "<b><font color=blue>It Starts To Get Darker"
		spawn(500)
			night = 1
			world << "<b><font color=blue>Night Falls"
			if(prob(10)) spawn(300)
				world << "<b><font color=yellow>A wonderful shooting star appears in the sky!"
				if(Event("Shooting Star",600))
					ExperienceMultiplier+=9
					spawn(300)
						ExperienceMultiplier-=9
						world << "<b><font color=yellow>The shooting star disappears from the sky!"
			for(var/mob/X in Players2) if(X.client) for(var/obj/Hud/Day/D in X.client.screen)
				D.icon_state = "Moon"
				D.name = "Night"
				D.text = "<font color=blue>°"
			for(var/mob/Monsters/m in world)
				if(m.SubRace == "Werewolf") m.WerewolfTransformation()

/world/proc/Aging()
	spawn()
		while(1)
			sleep(4500)
			for(var/mob/Monsters/m in world)
				if(ismob(m.Owner))
					if(m.Owner:client)
						m.Age += 1
						m.SpiderAgeGains()
						if(m.Age <= 5)
							m.Age += 1
							m.SpiderAgeGains()
						if(m.Critter)
							if(m.Age > 10)
								switch(m.Race)
									if("CaveSpider","DeathBeatle","Mole","TowerCap")
										m.GoingToDie = 1
										m.Killer = "time"
										m.DeathType = "old age"
										m.Death()