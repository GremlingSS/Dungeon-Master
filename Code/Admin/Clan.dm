/Clan/verb/Invite_To_Clan()
	set category="Clan"
	if(usr.IsClanLeader == 1)
		var/T = input("Pick Someone")as null|anything in Players
		if(!T)
			return
		else
			for(var/Player/M in Players)
				if(T == M)
					if(usr.ckey in M.IgnoreList)
						usr << "You are on [src]'s ignore list<br>"
						return
					var/choice = alert(M, "[usr] has invited you to their clan, [usr.Faction], Do you accept?", "Choose", "No","Yes",null)
					if (choice == "No")
						usr << "[M] has refused."
						return
					if (choice == "Yes")
						usr << "[M] has accepted."
						M << "You have accepted, - for clanchat, = for clan tapestries."
						M.Faction = usr.Faction
						M.IsClanLeader = 0

/Clan/verb/Boot_From_Clan()
	set category="Clan"
	if(usr.IsClanLeader)
		var/T = input("Kick Someone.") as null|text
		if(!T) return
		else for(var/Player/M in world) if(T == M.key) if(M.Faction == usr.Faction)
			M << "You have been booted from your clan!"
			M.Faction = "Player"
			return
