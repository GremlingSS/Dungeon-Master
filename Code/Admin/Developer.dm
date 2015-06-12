/mob/Developer/verb/RealPrivateMessage(var/mob/M in Players, msg as text)
	set hidden=1
	usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[M];action=PPM>[M]</a>:</font color> [html_encode(msg)]"
	M<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PPM>[usr]</a>:</font color> [html_encode(msg)]"
	for(var/mob/D in Players2)
		if(D != M && D != usr)
			if(D.key == world.host)
				D<<"<b><font color=silver>(Priv)[usr] sent to [M]:</font color> [msg]"

/mob/Developer/verb/Change_Login_Message(msg as message)
	set category="Admin"
	usr << "<b><font color=red>The login message is currently: '[LoginMessage]'"
	LoginMessage=msg

/mob/Developer/verb/DevEdit(A in world)
	set category="Admin"
	usr.client<<link("?command=edit;target=\ref[A];type=view;")

/mob/Developer/verb/DevCreate()
	set category = "Admin"
	var
		maxlen = 0
		list/List2 = list()
		list/List3 = list()
		i = 0
		a
	for(a in typesof(/mob,/obj,/turf))
		List2.Add(a)
	maxlen = 200

	var/list/list= input("Make what?","List 1")in List2
	if(list)
		var/item = new list(usr.loc)
		item=item

	for(a in typesof(/mob,/obj,/turf))
		i ++
		if(i > maxlen)
			List3.Add(a)
