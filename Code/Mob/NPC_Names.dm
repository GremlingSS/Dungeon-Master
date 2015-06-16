/mob/proc/NPCGoblinName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Gud'don"
		if(2)
			name1 = "Smex'ma"
		if(3)
			name1 = "Lug'ex"
		if(4)
			name1 = "Gugo'plux"
		if(5)
			name1 = "Slash'da"
		if(6)
			name1 = "Qux'lix"
		if(7)
			name1 = "Te'lax"
		if(8)
			name1 = "Smo'mux"
		if(9)
			name1 = "Smaz'sma"
		if(10)
			name1 = "Gug'lu"
		if(11)
			name1 = "Quin'qui"
		if(12)
			name1 = "Plux'meg"
		if(13)
			name1 = "Blah'sma"
		if(14)
			name1 = "Puke'lex"
		if(15)
			name1 = "Snag'la"
		if(16)
			name1 = "Smog'liz"
		if(17)
			name1 = "Yug'lux"
		if(18)
			name1 = "Smas'max"
		if(19)
			name1 = "Xe'loh"
		if(20)
			name1 = "Qel'lex"
	Pick2 = rand(1,20)

	switch(Pick2)
		if(1)
			name2 = "Snag'ma"
		if(2)
			name2 = "Smo'balix"
		if(3)
			name2 = "Ba'lix"
		if(4)
			name2 = "Kil'la"
		if(5)
			name2 = "Squah'lug"
		if(6)
			name2 = "Ash'meag"
		if(7)
			name2 = "Spog'mex"
		if(8)
			name2 = "Puk'wa"
		if(9)
			name2 = "Rux'pa"
		if(10)
			name2 = "Pug'pex"
		if(11)
			name2 = "Smack'erlex"
		if(12)
			name2 = "Cug'ma"
		if(14)
			name2 = "Cel'ix"
		if(15)
			name2 = "Trus'lus"
		if(16)
			name2 = "Bug'liz"
		if(17)
			name2 = "Rup'ture"
		if(18)
			name2 = "Diz'miz"
		if(19)
			name2 = "Ug'lex"
		if(20)
			name2 = "Tez'lek"
	src.name = "{NPC} [name1] [name2]"

/mob/proc/NPCKoboldName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Smug"
		if(2)
			name1 = "Ug"
		if(3)
			name1 = "Lum"
		if(4)
			name1 = "Sharpy"
		if(5)
			name1 = "Oglux"
		if(6)
			name1 = "Megma"
		if(7)
			name1 = "Frug"
		if(8)
			name1 = "Snat"
		if(9)
			name1 = "Snoter"
		if(10)
			name1 = "Lux"
		if(11)
			name1 = "Pok"
		if(12)
			name1 = "Pleg"
		if(13)
			name1 = "Hugx"
		if(14)
			name1 = "Welb"
		if(15)
			name1 = "Smag"
		if(16)
			name1 = "Quag"
		if(17)
			name1 = "Quxlux"
		if(18)
			name1 = "Rebspa"
		if(19)
			name1 = "Xelog"
		if(20)
			name1 = "Slashma"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Snagtooth"
		if(2)
			name2 = "Slash"
		if(3)
			name2 = "Smorg"
		if(4)
			name2 = "Alag"
		if(5)
			name2 = "Egad"
		if(6)
			name2 = "Gad"
		if(7)
			name2 = "Icul"
		if(8)
			name2 = "Pukpuk"
		if(9)
			name2 = "Plem"
		if(10)
			name2 = "Deg"
		if(11)
			name2 = "Quickclaw"
		if(12)
			name2 = "Sneakers"
		if(14)
			name2 = "Trickster"
		if(15)
			name2 = "Smegle"
		if(16)
			name2 = "Trug'ug"
		if(17)
			name2 = "Po'log"
		if(18)
			name2 = "Mo'meg"
		if(19)
			name2 = "Ug'lex"
		if(20)
			name2 = "Ty'sme"
	src.name = "[name1] [name2]"

/mob/proc/NPCHumanName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Talos"
		if(2)
			name1 = "Morgon"
		if(3)
			name1 = "Selious"
		if(4)
			name1 = "Dulert"
		if(5)
			name1 = "Yobert"
		if(6)
			name1 = "Maditz"
		if(7)
			name1 = "Franious"
		if(8)
			name1 = "Edmen"
		if(9)
			name1 = "Weltra"
		if(10)
			name1 = "Kelok"
		if(11)
			name1 = "Dargon"
		if(12)
			name1 = "Morgoth"
		if(13)
			name1 = "Belven"
		if(14)
			name1 = "Smith"
		if(15)
			name1 = "Ben"
		if(16)
			name1 = "Julious"
		if(17)
			name1 = "Almak"
		if(18)
			name1 = "Hulom"
		if(19)
			name1 = "Richard"
		if(20)
			name1 = "Patrick"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Smith"
		if(2)
			name2 = "Megs"
		if(3)
			name2 = "Julip"
		if(4)
			name2 = "Tolan"
		if(5)
			name2 = "Tukoms"
		if(6)
			name2 = "Inles"
		if(7)
			name2 = "Curtious"
		if(8)
			name2 = "Mobaine"
		if(9)
			name2 = "Wesman"
		if(10)
			name2 = "Polom"
		if(11)
			name2 = "Cherly"
		if(12)
			name2 = "Statious"
		if(14)
			name2 = "Huknos"
		if(15)
			name2 = "Trucken"
		if(16)
			name2 = "Lilo"
		if(17)
			name2 = "Fredus"
		if(18)
			name2 = "Miloms"
		if(19)
			name2 = "Hobomes"
		if(20)
			name2 = "Tyken"
	src.name = "{NPC} [name1] [name2]"
