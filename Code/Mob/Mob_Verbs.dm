/mob/verb/MusicOff()
	usr << sound(null)

/mob/verb/StopAll()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		M.Target = null
		if(M.BowOn == 1 && M.PracticeSkill == 0)
			M.PracticeSkill = 1
			spawn(50)
				M.BowOn = 0
				M.PracticeSkill = 0

/mob/verb/Ignore()
	var/T = input("Ignore/Un-Ignore who?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S.name)
				if(S.ckey in usr.IgnoreList)
					S << "[usr] has removed you from their ignore list!<br>"
					usr << "You remove [S] from your ignore list<br>"
					usr.IgnoreList -= S.ckey
				else
					S << "[usr] has put you on their ignore list!<br>"
					usr << "You put [S] on your ignore list<br>"
					usr.IgnoreList += S.ckey

/mob/verb/Test()
	set hidden = 1
	for(var/mob/Monsters/M in usr.Selected)
		if(M.IsMist)
			usr << "Cant build while misted!"
			return
	if(usr.Up == 0)
		usr.Up = 1
		Building(usr)
		return
	else
		usr.Up = 0
		for(var/obj/HUD/H in usr.client.screen)
			del(H)

/mob/verb/MindFlayer()
	set hidden = 1
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace != "Illithid")
			usr << "One or more of the units you have selected can not use mental abilities."
			return
		if(M.IsMist  == 1)
			usr << "Cant use while misted!"
			return
	if(usr.Up == 0)
		usr.Up = 1
		MindPower(usr)
		return
	else
		usr.Up = 0
		for(var/obj/HUD/H in usr.client.screen)
			del(H)

/mob/verb/WayPoint()
	var/list/menu = new()
	menu += "Goto WayPoint"
	menu += "Goto WayPoint2"
	menu += "Goto WayPoint3"
	menu += "Set WayPoint"
	menu += "Set WayPoint2"
	menu += "Set WayPoint3"
	menu += "Cancel"
	var/Result = input("What Action Will You Choose?", "Choose", null) in menu
	if (Result != "Cancel")
		..()
	if (Result == "Goto WayPoint")
		usr.loc = usr.Waypoint
	if (Result == "Goto WayPoint2")
		usr.loc = usr.Waypoint2
	if (Result == "Goto WayPoint3")
		usr.loc = usr.Waypoint3
	if (Result == "Set WayPoint")
		usr.Waypoint = usr.loc
		usr << "Way Point Set!"
	if (Result == "Set WayPoint2")
		usr.Waypoint2 = usr.loc
		usr << "Way Point Set!"
	if (Result == "Set WayPoint3")
		usr.Waypoint3 = usr.loc
		usr << "Way Point Set!"



/mob/verb/SendMSG(var/mob/M in Players, msg as text)
	set hidden = 1
	if(usr.ckey in M.IgnoreList)
		usr << "You are on [M]'s ignore list<br>"
		return
	if(Muted)
		usr << "You are muted."
		return
	usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[M];action=PM>[M]</a>:</font color> [html_encode(msg)]"
	M<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PM>[usr]</a>:</font color> [html_encode(msg)]"
	for(var/mob/D in Players2)
		if(D != M && D != usr)
			if(D.GM == 1 && D.DE == 1)
				D<<"<b><font color=silver>[usr] sent to [M]:</font color> [msg]"

/mob/verb/AddAlly()
	var/T = input("Set who as an ally?")as null|text
	if(T) for(var/mob/S in Players2)
		if(T == S.name)
			if(S.name in usr.AllyList)
				usr << "This person is already your ally"
				return
			else
				usr.AllyList += S.name
				usr << "You have added [S] to your allies list, your units will no longer attack [S]'s unless you remove him/her from your ally list."
				S << "[usr] has added you to their ally list"

/mob/verb/RemoveAlly()
	var/T=input("Which ally would you like to remove?")as null|anything in AllyList
	if(T) for(var/mob/S in Players2)
		if(T == S.name)
			if(S.name in usr.AllyList)
				usr.AllyList -= S.name
				usr << "You have removed [S] from your allies list, your units can now attack his/her units."
				S << "[usr] has removed you from their ally list"

/mob/verb/Rename()
	for(var/mob/Monsters/M in Selected)
		var/PrefixLength=length("[M.Owner]")+4
		if(M.IsRoyal)
			PrefixLength+=length(GenderToLeader(M.Gender))+1
		var/NAME
		if(copytext(M.name,1,PrefixLength) == "[GenderToLeader(M.Gender)] {[M.Owner]} " || copytext(M.name,1,PrefixLength) == "{[M.Owner]} ")
			NAME=input("Rename your [M.Gender] [M.Race] to what?","Rename","[copytext(M.name,PrefixLength,0)]") as text|null
		else
			NAME=input("Rename your [M.Gender] [M.Race] to what?","Rename","[M.name]") as text|null
		if(NAME)
			if(length(NAME)>25)
				usr << "This name is far too long. Try a shorter one."
				continue
			if(M.IsRoyal)
				M.name="[GenderToLeader(M.Gender)] {[M.Owner]} [NAME]"
			else
				M.name="{[M.Owner]} [NAME]"

/mob/verb/Who()
	var/PlayerCount
	usr << "<font color = red size = 4>((-Players Online-))"
	for (var/mob/M in world)
		if(M.client)
			if(M.Content2 != "Invisible")
				PlayerCount ++
				usr << "--<font color = purple>[M]"
			else if(usr.key == world.host)
				PlayerCount ++
				usr << "--<font color = red>[M.name] - Invisible"
	usr << "<font color = red size = 3> ((-[PlayerCount] Player(s) Online-))"

/mob/verb/Check_Clan_Members()
	for(var/mob/M in Players2)
		if(M.Faction == usr.Faction)
			usr << "<b><font color=red>[M.name]"

/mob/verb/Check_Shrines()
	for(var/obj/PowerupPillar/P in world)
		if(P.invisibility == 0)
			if(P.Content2 == usr.Faction)
				usr << "<b><font color=blue>[P] - [P.x],[P.y],[P.z] - Owner = [P.Content2]"
			else
				usr << "<b><font color=red>[P] - [P.x],[P.y],[P.z] - Owner = [P.Content2]"

/mob/verb/Create_A_Clan()
	var/T = input("Clan Name")as null|text
	if(!T)
		return
	if(length(T)>25)
		usr << "This clan name is far too long."
		return
	for(var/mob/K in Players2)
		if(K.Faction == T)
			usr << "There is already a clan with this name."
			return
	if(CoolDown("CreateClan",300))
		usr.IsClanLeader = 1
		usr.verbs+=typesof(/Clan/verb)
		usr.Faction = T
		usr << "Clan [T] created"
	else
		usr << "You need to wait a while before creating a new clan."

/mob/verb/ListAllies()
	var/AllyCount
	usr << "<font color = yellow size = 4>((-Allies-))"
	for(var/mob/M in Players2)
		if(M.name in usr.AllyList)
			AllyCount ++
			usr << "--<font color = yellow>[M]"
	usr << "<font color = yellow size = 3> ((-[AllyCount] Allies-))"

/mob/verb/WorldChat()
	if(CoolDown("WorldChatEnter",30))
		if(usr.WC == 1)
			usr.WC = 0
			world << "<font color = blue>[usr] Enters World Chat!"
			return
		if(usr.WC == 0)
			usr.WC = 1
			world << "<font color = blue>[usr] Leaves World Chat!"
			usr << "Press L to re-join!"
			return

/mob/verb/Send_File(var/mob/person in Players,filez as file)
	set hidden = 1
	if(usr in person.IgnoreList)
		usr << "[person] is ignoring you."
		return
	else
		switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
			if("Yes")
				alert(usr,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(usr,"[person] declined the file","File Declined")

/mob/verb/ClanChat()
	if(usr.Faction != "Player")
		var/T = input("Shout")as null|text
		if(!T)
			return
		for(var/mob/M in Players2)
			if(M.Faction == usr.Faction)
				M << "<b><font color=red>[usr] Clanchats:</b><font color=red> [Safe_Guard(T)]"
			else if(M.key == world.host)
				M << "<b><font color=silver>[usr.Faction] - [usr] Clanchats:</b><font color=silver> [Safe_Guard(T)]"
	else
		usr << "You're not in a clan."

/mob/verb/WorldSay()
	var/T = input("Shout")as null|text
	if(!T)
		return
	if(usr.Muted == 1)
		usr << "You are Muted"
		return
	if(CoolDown("OOC",5))
		for(var/Player/M in world)
			if(usr.WC == 0)
				if(M.WC == 0)
					if(usr in M.IgnoreList)
						..()
					else
						M << "<font color=green><strong>OOC: [usr]</strong>: [Safe_Guard(T)]</html> <br>"
	else
		usr << "Must Wait before speaking again!"

/mob/verb/GetCords()
	src << "[src.x],[src.y],[src.z]<br>"

/mob/verb/Coords(X as num, Y as num, Z as num)
	set desc = "X,Y,Z"
	if(X > world.maxx)
		X = world.maxx
	else if(X < 1)
		X = 1
	if(Y > world.maxy)
		Y = world.maxy
	else if(Y < 1)
		Y = 1
	if(Z > world.maxz)
		Z = world.maxz
	else if(Z < 1)
		Z = 1
	loc = locate(X,Y,Z)
/mob/verb/Zip()
	for(var/mob/Monsters/c in usr.Selected)
		c.Deselect(src)

/mob/verb/Goto()
	for(var/mob/Monsters/c in usr.Selected)
		usr.loc = c.loc

/mob/verb/Every()
	for(var/mob/Monsters/c in world)
		if(c.Owner == src)
			if(c in Selected)
				continue
			if(c.Wagon)
				continue
			c.Select(src)

/mob/verb/All()
	for(var/mob/Monsters/c in orange(usr))
		if(c.Owner == src)
			if(c in Selected)
				continue
			if(c.Wagon)
				continue
			c.Select(src)

/mob/verb/Emote(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		usr.EmoteLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] [Safe_Guard(T)]<br />"
		M.EmoteLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] [Safe_Guard(T)]<br />"
		if(src.Muted)
			src << "You are Muted"
			return
		else
			if(M.Wagon == 0)
				var/list/viewmob = list()
				for(var/mob/m in view(M))
					viewmob += m.Owner
				for(var/mob/g in viewmob)
					var/mob/replace = g
					for(var/mob/g2 in viewmob)
						if(g2 == g)
							viewmob.Remove(g)
					viewmob += replace
				for(var/mob/g in viewmob)
					if(g in view(M))
						g << "[M] [Safe_Guard(T)]"
					else if(M.Owner == g)
						g << "[M] [Safe_Guard(T)]"
					else
						g << "([M.x],[M.y],[M.z])   [M] [Safe_Guard(T)]"
			for(var/mob/K in range(10,M))
				if(K.GM == 1)
					for(var/mob/KM in view(M))
						if(KM.Owner == K)
							return
					K << "[M] [Safe_Guard(T)]"

/mob/verb/UnitSay(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		usr.ChatLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] says:[Safe_Guard(T)]<br />"
		M.ChatLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] says:[Safe_Guard(T)]<br />"
		if(src.Muted == 1)
			src << "You are Muted"
			return
		else
			if(M.Wagon == 0)
				var/list/viewmob = list()
				for(var/mob/m in view(M))
					viewmob += m.Owner
				for(var/mob/g in viewmob)
					var/mob/replace = g
					for(var/mob/g2 in viewmob)
						if(g2 == g)
							viewmob.Remove(g)
					viewmob += replace
				for(var/mob/g in viewmob)
					if(g in view(M))
						g << "<font color = blue>[M] says:[Safe_Guard(T)]"
					else if(M.Owner == g)
						g << "<font color = blue>[M] says :[Safe_Guard(T)]"
					else
						g << "<font color = blue>([M.x],[M.y],[M.z])   [M] says:[Safe_Guard(T)]"
			for(var/mob/K in range(10,M))
				if(K.GM == 1)
					for(var/mob/KM in view(M))
						if(KM.Owner == K)
							return
					K << "<font color = blue>[M] says:[Safe_Guard(T)]"

/mob/verb/PlaceTapestry()
	if(usr.Function == "Tapestry")
		usr << "No longer placing/removing tapestries."
		usr.Function = null
	else
		usr.Function = "Tapestry"
		usr << "Now placing/removing tapestries. Single Click a wall near a selected unit."

mob/verb/Legends()
	usr.LegendView()
