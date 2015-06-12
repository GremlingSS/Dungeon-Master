/*===========================================================================================
Version 1.4 of Murrawhip's Murra-Admin library. Use what you wish, change what you
  wish. This is only very standard at the moment, send suggestions/bug reports to
  info@murrawhip.net if you wish. Enjoy!
---------------------------------------------------------------------------------------------
To install, merely include this library in your program, then add something similar
to this in your mob's Login() proc.
if(usr.key=="insertkeyhere")
	usr.verbs+=typesof(/Admin/verb/)//Gives all verbs under the mob/Admin mob.
The above shall grant the user specified, all adminstrative powers. If you wish to
only give select admin powers, then there are several ways you could go about it.

	if(usr.key=="insertkeyhere")
		usr.verbs+=typesof(/Admin/verb/)
		usr.verbs-=/Admin/verb/Delete
		usr.verbs-=/Admin/verb/Density_change
^Adding all powers of the Admin type, then subtracting
those powers you do not wish to give.

	if(usr.key=="insertkeyhere")
		usr.verbs+=/Admin/verb/Delete
		usr.verbs+=/Admin/verb/Density_change
^Adding those powers that you DO want to give.
---------------------------------------------------------------------------------------------
For banning/unbanning to work, include this in your mob's Login() proc also.
	if(usr.client.address in banlist)
			usr<<"You have been banned."
			del usr

===========================================================================================*/
mob/var{Mcloaked=0;Mprevicon}

var/moblist=list()
var/adminlist=list()
var/councillist=list()
var/modlist=list()
var/Players=list()
var/Players2=list()

mob

/mob/Topic(href,href_list[])
	switch(href_list["action"])
		if("PM")//action, if its PM it goes on, if its not it just does nothing
			if(usr.Muted)
				usr << "You are muted."
				return
			var/msg = input("What would you like to privately say to [src] ([src.name])?","Private Message") as text|null
			if(!msg)
				return
			//sends the message and tells the user the message they sent
			if(usr.ckey in src.IgnoreList)
				usr << "You are on [src]'s ignore list<br>"
				return
			usr << "<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[src];action=PM>[src]</a>:</font color> [html_encode(msg)]"
			src << "<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PM>[usr]</a>:</font color> [html_encode(msg)]"
			for(var/mob/D in Players2)
				if(D.GM == 1 && D.DE == 1 && D != src && D != usr)
					D << "<b><font color=silver>[usr] sent to [src]:</font color> [msg]"
		if("PPM")//action, if its PM it goes on, if its not it just does nothing
			var/msg = input("What would you like to privately say to [src] ([src.name])?","Private Message") as text|null
			if(!msg)
				return
			//sends the message and tells the user the message they sent
			if(usr.ckey in src.IgnoreList)
				usr << "You are on [src]'s ignore list<br>"
				return
			usr << "<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[src];action=PPM>[src]</a>:</font color> [html_encode(msg)]"
			src << "<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PPM>[usr]</a>:</font color> [html_encode(msg)]"
			for(var/mob/D in Players2)
				if(D.key == world.host)
					D<<"<b><font color=silver>(Priv)[usr] sent to [src]:</font color> [msg]"


/mob/verb/Adminhelp(msg as text)
	if(msg)
		for(var/mob/M in world)
			if(M.GM || M == src)
				M << "<font color=blue>Admin-help from: <a href=?src=\ref[usr];action=PM>[usr]</a>([usr.Race]):</font color> [html_encode(msg)]"

/mob/var/tmp/FreeSelect

/mob/var/tmp/LockDown=null

/Admin/verb/LockDownPlayer(Player/PLAY in world)
	set category = "Admin"
	if(alert("Remove [PLAY]'s verbs and disable any ability to do anything till the next reboot?","You sure?","Yes","No") == "Yes")
		PLAY.verbs -= PLAY.verbs
		PLAY.LockDown = 1
		usr << "Applied lockdown to [PLAY]."
		PLAY << "You've been locked down. Or at least we think you have."

/Admin/verb/FreeSelect()
	set category = "Admin"
	if(usr.FreeSelect)
		usr.FreeSelect = null
	else
		usr.FreeSelect = 1

/Admin/verb/MakeArmy(ARM as num,NUM as num)
	set category = "NPC's"
	set desc = "(Army ID,Value)"
	Army(ARM,NUM,usr.loc)

var/DamageMultiplier=1

/Admin/verb/ChangeDamageMultiplier(DAMAGE as num)
	set category = "Admin"
	usr << "You have set the Damage Multiplier from [DamageMultiplier] to [DAMAGE]."
	DamageMultiplier=DAMAGE

/Admin/verb/ChangeExperienceMultiplier(EXPERIENCE as num)
	set category = "Admin"
	usr << "You have set the Experience Multiplier from [ExperienceMultiplier] to [EXPERIENCE]"
	ExperienceMultiplier=EXPERIENCE

/Admin/verb/make_vote()
	set category="Admin"
	if(vote_system.vote) return
	var/question = input("What will the question be?", "Question") as text
	var/list/options = list()
	var/option
	var/i = 0
	do
		if(option) options += option
		option = input(usr, "What will option #[++i] be?", "Option [i]") as null|text
	while(option != null && !vote_system.vote)

	if(vote_system.vote) return
	var/vote_data/result = vote_system.Query(question, options)
	if(result.tie)
		var/list/tie_data = new/list()
		for(i in result.tie_list) tie_data += options[i]
		world <<"<b>Tie!</b> between [dd_list2text(tie_data, "; ")]..."
	world << "Result: <b>[options[result.winner]]</b>"

/Admin/verb/CheckOwner(var/mob/M in range())
	set category="Admin"
	usr << "[M]'s Owner is [M.Owner]"

/Admin/verb/RollDice()
	set category="Admin"
	var/N = input("Format = 2d3 etc.") as null|text
	var/G = roll("[N]")
	world << "<font color=yellow><font size=3>[usr] has rolled [N] dice with result [G]"

/Admin/verb/CheckPlayerGenders()
	set category="Admin"
	for(var/mob/M in Players2) usr << "[M] - [M.gender]"

/Admin/verb/FakeLogout()
	set category="Admin"
	world << "<b><font color=purple>[usr] has logged out."
	Players -= usr
	usr.Content2 = "Invisible"
	usr.invisibility = 25
	usr.see_invisible = 100

/Admin/verb/FakeLogin()
	set category="Admin"
	world << "<b><font color=purple>[usr] has logged in."
	if(usr in Players) ..()
	else Players += usr
	usr.Content2 = 0

/Admin/verb/CheckRaces()
	set category="Admin"
	for(var/mob/M in world) if(M.key) usr << "--<font color = purple>[M] - Race:[M.Race]"

/Admin/verb/HealUnit(var/mob/M in view())
	set category="Admin"
	M.FullHeal(1)

/Admin/verb/Admin_Send_File(var/mob/person in Players2,filez as file)
	set hidden = 1
	switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
		if("Yes")
			alert(usr,"[person] accepted the file","File Accepted")
			person<<ftp(filez)
		if("No")
			alert(usr,"[person] declined the file","File Declined")

/Admin/verb/MakeChess()
	set hidden = 1
	var/obj/Items/Furniture/Tables/Table/T1 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T2 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T3 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T4 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T5 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T6 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T7 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T8 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T9 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T10 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T11 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T12 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T13 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T14 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T15 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T16 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T17 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T18 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T19 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T20 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T21 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T22 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T23 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T24 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T25 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T26 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T27 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T28 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T29 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T30 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T31 = new(usr.loc)
	var/obj/Items/Furniture/Tables/Table/T32 = new(usr.loc)
	T1.icon_state = "WPawn"
	T2.icon_state = "WPawn"
	T3.icon_state = "WPawn"
	T4.icon_state = "WPawn"
	T5.icon_state = "WPawn"
	T6.icon_state = "WPawn"
	T7.icon_state = "WPawn"
	T8.icon_state = "WPawn"
	T9.icon_state = "BPawn"
	T10.icon_state = "BPawn"
	T11.icon_state = "BPawn"
	T12.icon_state = "BPawn"
	T13.icon_state = "BPawn"
	T14.icon_state = "BPawn"
	T15.icon_state = "BPawn"
	T16.icon_state = "BPawn"
	T17.icon_state = "BRook"
	T18.icon_state = "WRook"
	T19.icon_state = "BRook"
	T20.icon_state = "WRook"
	T21.icon_state = "BKnight"
	T22.icon_state = "BKnight"
	T23.icon_state = "WKnight"
	T24.icon_state = "WKnight"
	T25.icon_state = "BQueen"
	T26.icon_state = "WQueen"
	T27.icon_state = "BKing"
	T28.icon_state = "WKing"
	T29.icon_state = "BBishop"
	T30.icon_state = "BBishop"
	T31.icon_state = "WBishop"
	T32.icon_state = "WBishop"
	for(var/obj/Items/Furniture/Tables/Table/T in range(1,usr))
		T.icon = 'Chess Pieces.dmi'
		T.name = T.icon_state
		T.weight = 0

/Admin/verb/SendSound(var/mob/person in Players2,filez as file)
	set hidden = 1
	person << sound(filez)

/Admin/verb/SendSoundAll(filez as file)
	set hidden = 1
	world << sound(filez)

/Admin/verb/SoundOffAll()
	world << sound(null)

/Admin/verb/GiveRare()
	set category="Admin"
	var/T = input("Select Player Here")as null|anything in Players
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S)
				var/list/menu4 = new()
				menu4 += "Sandking"
				menu4 += "Illithids"
				menu4 += "Remove All"
				menu4 += "Cancel"
				switch(input("Which Race?", "Choose", null) in menu4)
					if("Sandking")
						S.Rares += "SandKing"
						usr << "You have given [S] Sandking"
					if("Illithids")
						S.Rares += "Illithids"
						usr << "You have given [S] Illithid"
					if("Remove All")
						S.Rares -= S.Rares
						usr << "You have removed [S]'s rares"
/Admin/verb/RolePlayAnnounce()
	set category="Admin"
	var/T = input("Whisper to who?")as null|text
	if(!T)
		..()
	else
		world<<"<b><font color=yellow>[T]"

/Admin/verb/WarningAnnounce()
	set category="Admin"
	var/T = input("Type Warning Here")as null|text
	if(!T)
		..()
	else
		world<<"<b><font color=white>[T]"

/Admin/verb/OpenHellPortal()
	set category="Admin"
	var/choice2 = alert(usr, "Are you sure you want to create a hell portal?", "Choose", "No", "Yes", null)
	if (choice2 == null)
		return
	if (choice2 == "No")
		return
	if (choice2 == "Yes")
		if(usr.z == 4)
			usr << "Cant make a portal to hell while in hell."
			return
		else
			var/obj/Portal/P = new
			P.loc = usr.loc
			P.suffix = "Stuck"
			world<<"<b><font color=yellow>The land starts to shake as a strange rift in time and space tear open, creating a way to hell its self!-[usr.x],[usr.y],[usr.z]"
			P.Portal()
			var/obj/Portal/P2 = new
			P2.loc = locate(P.x,P.y,4)
			P2.suffix = "Stuck"
			P2.Content = P.z
			P2.Portal()

/Admin/verb/UnlimitedHungerTiredness(mob/Monsters/m in view())
	set category="Admin"
	if(m.Hunger<=100 ||m.Tiredness<=100)
		m.Owner << "[m]'s sleep and hunger will now be set to 40000!"
		m.Hunger = 40000
		m.Tiredness = 40000
	else
		m.Owner << "[m]'s sleep and hunger will now be set to 100!"
		m.Hunger = 100
		m.Tiredness = 100

/Admin/verb/Mute()
	set category="Admin"
	var/T = input("Mute/Un-Mute who?")as null|text
	if(T) for(var/mob/S in world)
		if(T == S.key)
			if(S.Muted)
				world << "[S] has been un-muted by [usr]."
				S.Muted = 0
				return
			else
				world << "[S] has been muted by [usr]."
				S.Muted = 1

/Admin/verb/WarpTo()
	set category="Admin"
	var/T = input("Warp to who?")as null|text
	if(T) for(var/mob/S in world) if(T == S.name) usr.loc = S.loc

/Admin/verb/AdminKill(mob/m in view())
	set category="Admin"
	if(m.HumanParts)
		usr << "You admin kill [m]."
		m.GoingToDie = 1
		m.Death()

/Admin/verb/ForceNight()
	set category="Admin"
	Night()
	world << "<b><font color=aqua>[usr] forces Night/Day."

/Admin/verb/ForceSeasons()
	set category="Admin"
	Seasons()
	world << "<b><font color=red>[usr] forces Season Changes."

/Admin/verb/MakeExplode(mob/m in view())
	set category="Admin"
	if(m.HumanParts == 1)
		view() << "[usr] sends a bolt of energy into [m]!"
		m.HasLeftArm = 0
		m.HasLeftLeg = 0
		m.HasRightLeg = 0
		m.HasRightArm = 0
		m.CanWalk = 0
		m.CanSee = 0
		m.Stunned = 0
		m.LimbLoss()
		m.BloodContent -= 400
		m.BloodLoss()
		m.LimbFling("Left Arm")
		sleep(1)
		m.LimbFling("Right Arm")
		sleep(1)
		m.LimbFling("Left Leg")
		sleep(1)
		m.LimbFling("Right Leg")

/Admin/verb/CheckIP()
	set category="Admin"
	var/T = input("IP Check who?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S.key)
				usr << "[S]'s IP is: [S.client.address]"
				usr << "[S] is registered in DM as: [S.DMID]"

/Admin/verb/Announcement(msg as message)///Nifty window pop-up announcement
	set category="Admin"
	var/html_doc="<head><title>Announcement</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Announcement</U>From:<br> [usr]</font><font face=Verdana><font color=COCOCO><br><br>[msg]"
	world<<browse(html_doc,"window=Announcement")

/Admin/verb/Summon(mob/M in world)
	set category = "Admin"
	M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;

/Admin/verb/SummonPlayer()
	set category = "Admin"
	var/T = input("Summon who's units?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S.key)
				switch(alert("Summon: [S]","Summon Player & Units?","Yes","No"))
					if("Yes")
						S.x = usr.x; S.y = usr.y; S.z = usr.z; if(S.client) S.client.eye = S;
						for(var/mob/Monsters/H in S.UnitList)
							H.x = usr.x; H.y = usr.y; H.z = usr.z; if(H.client) H.client.eye = H;

/Admin/verb/Watch(mob/M in world)
	set category="Admin"
	usr.client.eye = M
	usr.client.perspective = EYE_PERSPECTIVE

/Admin/verb/StopWatching()
	set category="Admin"
	usr.client.eye = usr
	usr.client.perspective = MOB_PERSPECTIVE

/Admin/verb/Delete(atom/M in view())
	set category="Admin"
	del M

/Admin/verb/Create()
	set category="Admin"
	usr.client<<link("?command=create;")

/Admin/verb/Edit(obj/O as obj|turf|mob in view())
	set category="Admin"
	if(O)
		var/variable=input("Which var?","Var") in O.vars
		var/default
		var/typeof=O.vars[variable]
		var/value = Edit_null_display(typeof)
		if(isnull(typeof))
			usr<<"Unknown Variable-Type"
		else if(istext(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>TEXT</b> type [value]."
			default="text"
		else if(istype(typeof,/atom) || istype(typeof,/datum))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>TYPE</b> type [value]."
			default="type"
		else if(isicon(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>ICON</b> type [value]."
			typeof="\icon[typeof]"
			default="icon"
		else if(isloc(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>REFERENCE</b> type [value]."
			default="reference"
		else if(isnum(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>NUM</b> type [value]."
			default="num"
			usr.dir=1
		else if(istype(typeof,/list))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>LIST</b> type [value]."
			usr<<"Unable to edit Lists."
		else if(istype(typeof,/client))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>CLIENT</b> type [value]."
			usr<<"Unable to edit Client."
		else
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>FILE</b> type [value]."
			default="file"
		var/class=input("What type?","Variable Type",default)as null|anything in list("text","num","type","reference","icon","file","default")
		switch(class)
			if("default")
				O.vars[variable]=initial(O.vars[variable])
			if("text")
				O.vars[variable]=input("Enter new text:","Text",\
					O.vars[variable]) as null|text
			if("num")
				O.vars[variable]=input("Enter new number:","Num",\
					O.vars[variable]) as null|num
			if("icon")
				O.vars[variable]=input("Pick icon:","Icon",O.vars[variable]) \
					as null|icon
			if("type")
				O.vars[variable]=input("Enter type:","Type",O.vars[variable]) \
					in typesof(/obj,/mob,/area,/turf)
			if("reference")
				O.vars[variable]=input("Select reference:","Reference",\
					O.vars[variable]) as null|mob|obj|turf|area in world
			if("file")
				O.vars[variable]=input("Pick file:","File",O.vars[variable]) \
					as null|file

/Admin/verb/SetOwner(obj/O as mob in view())
	set category="Admin"
	var/T = input("Set Who as Owner?")as null|text
	if(T) for(var/Player/S in world) if(T == S.name)
		S.Deselect()
		O.Owner = S
		O.CanBeSlaved = 0
		S.UnitList += O
		S << "[usr] makes [S] the owner of [O]"
		if(S != usr) usr << "[usr] makes [S] the owner of [O]"

/Admin/verb/MakeNPC(mob/Monsters/O in view())
	set category="Admin"
	usr << "You make [O] into an NPC"
	if(ismob(O))
		O.ChangeOwnership(FORCE=1)
		O.CanBeSlaved = 1
		O.RandomWalk()
		return

/Admin/verb/MeteorStrikeLocation()
	set category="Admin"
	for(var/turf/grounds/G in view(8,usr)) G.MeteorStrike()
	world << "A meteor has struck at [usr.x],[usr.y],[usr.z]!!!!"

/Admin/verb/Server_Options()
	set category="Admin"
	set name="Server Options"
	switch(input("Select Option","Server Panel")as null|anything in list ("Reboot Server","Shutdown Server","Repop Server","Change Server Name","Change Server Status","Admin Log","Chat Log","Unitchat Log","Emote Log"))
		if("Reboot Server")
			world<<"<b><font color = red>[usr] is Restarting the world in 10 seconds.</font></b>"
			sleep(100)
			world.Reboot()
		if("Shutdown Server") if(usr.key == world.host)
			world<<"<b><font color = red>Server will shut down in 15 seconds.</font></b>"
			sleep(150)
			del world
		if("Repop Server") world.Repop()
		if("Change Server Name")
			set category="Admin"
			world.name=input("What is the new world name?","Change World Name",world.name)
		if("Change Server Status")
			set category="Admin"
			world.status=input("What is the new world status?","Change World Status",world.status)

/proc/Edit_null_display(typeof)
	if(typeof=="")
		return"and currently equals null"
	else
		return"and currently equals [typeof]"

/Targeting/verb/SetTarget(var/mob/Monsters/M in view())
	for(var/mob/Monsters/X in usr.Selected)
		X.MagicTarget = M
		usr << "[X] is now targeting [M]"

Admin/verb/ChangeEventButton(VERB as text)
	set category="Admin"
	EVENT_ACTION=VERB
	switch(EVENT_ACTION)
		if("Warp","SilentWarp")
			EVENT_DETAIL=usr.loc
			EVENT_QUESTION=input(usr,"Event Question, answered by a yes/no.","EVENT_QUESTION","Are you sure you wish to warp your selected units to the event zone?") as text
			EVENT_TEXT=input(usr,"Text displayed to all when used.","EVENT_TEXT"," has joined the event!") as text
		else
			usr<<"You input ''[VERB]''"
			return