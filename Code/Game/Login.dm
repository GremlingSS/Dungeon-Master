#define DEBUG

var/MultiKeyAllowed=null

mob/verb/Multikey()
	set hidden = 1
	if(key == world.host)
		if(MultiKeyAllowed)
			usr << "Disabled"
			MultiKeyAllowed = null
		else
			usr << "Enabled"
			MultiKeyAllowed = 1

/mob/Logout()
	Players -= usr
	usr.Save()
	usr.Up = 0
	world << "<b><font color=purple>[usr] has logged out."
	usr.Restart = 0
	for(var/obj/DigAt/D in world)
		if(D.Owner == usr)
			del(D)
	for(var/mob/Monsters/M in usr.UnitList)
		M.DigTarget = null
		M.destination = null
		M.Guarding(AUTO=1)
	for(var/mob/Monsters/M in usr.Selected)
		usr.Selected.Remove(M)
		M.destination = null

/mob/Login()
	usr.Load()
	usr.IsWood = 0
	usr.Up = 0
	usr.DMID = usr.client.address
	usr.verbs += typesof(/Targeting/verb/)
	usr.Content = "CantBeCaged"
	for(var/mob/KL in Players) if(KL != usr)
		if(KL.client.computer_id == usr.client.computer_id)
			if(KL!=usr)
				if(MultiKeyAllowed)
					world << "[KL.key] was trying to connect as [usr.key], and then did!"
				else
					world << "[KL.key] was trying to connect as [usr.key], but was refused access!"
					del(client)
					return
		if(KL.DMID==usr.DMID)
			if(KL.LockDown)
				spawn()
					verbs-=verbs
				spawn()
					client.verbs-=client.verbs
				client.verbs-=client.verbs
				verbs-=verbs
			for(var/Player/P)
				if(P.GM || P.DE)
					P << "[KL] is running as [usr]<br>Registered as: [DMID]"
	if(usr in Players2)
		..()
	else
		Players2 += usr
	Players += usr
	if(usr.key == world.host)
		adminlist += usr.client.address
	if(usr.client.address in adminlist)
		usr.verbs+=typesof(/Admin/verb/)
		usr.verbs+=typesof(/TurfCreate/verb)
		usr.verbs+=typesof(/mob/Spawn/verb)
		usr.verbs+=typesof(/MiscCreate/verb)
		usr.verbs+=typesof(/mob/Developer/verb)
		usr.GM = 1
		usr.DE = 1
		usr.sight = 30
	if(usr.IsClanLeader)
		usr.verbs += typesof(/Clan/verb)
	if(usr.GM)
		usr.Rares += "SandKing"
		usr.Rares += "Illithids"
	usr << "<b><font color=lime><font size=3>Autosaves happen every 15 minutes, if the server crashes you will be rolled back by at most 15 minutes."
	if(!usr.GM)
		world << "<b><font color =purple>[usr] has logged in."
	usr << "\blue <center><b><BIG>[LoginMessage]"
	usr.Intro()
	if(!usr.Loaded)
		if(usr.LoadUnits())
			return
	for(var/mob/Monsters/M in usr.UnitList)
		if(M.Owner == usr)
			usr.loc = M.loc
			break
	for(var/mob/Monsters/M in usr.UnitList)
		return
	usr.Loaded = 1
	usr.loc = locate(rand(350,700),rand(400,750),1)
	usr.density = 0
	if(usr.LoggedIn == 0)
		usr.LoggedIn = 1
		var/Sand = prob(3)
		var/Illit = prob(3)
		for(var/mob/LLL in PlayerList)
			if(LLL.DMID == usr.DMID)
				if(LLL.key != usr.key)
					Sand = 0
					Illit = 0
		if(Sand)
			usr.Rares += "SandKing"
		if(Illit)
			usr.Rares += "Illithids"
	var/In = 0
	if(usr in PlayerList)
		In = 1
	if(In == 0)
		PlayerList += usr
	usr.Restart = 0
	usr << "<b>Press R to choose a race to play."
