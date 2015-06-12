/mob/Admin/verb/make_vote()
	set category="Admin"
	if(vote_system.vote)
		return
	var/question = input("What will the question be?", "Question") as text
	var/list/options = list()
	var/option
	var/i = 0
	do
		if(option)
			options += option
		option = input(usr, "What will option #[++i] be?", "Option [i]") as null|text
	while(option != null && !vote_system.vote)

	if(vote_system.vote)
		return
	var/vote_data/result = vote_system.Query(question, options)
	if(result.tie)
		var/list/tie_data = new/list()
		for(i in result.tie_list)
			tie_data += options[i]
		world <<"<b>Tie!</b> between [dd_list2text(tie_data, "; ")]..."
	world << "Result: <b>[options[result.winner]]</b>"

var/vote_system/vote_system = new

/vote_data
	var/winner
	var/tie = 0 //1 if this was a tie
	var/list/tie_list
	var/aborted = 0

/vote_data/New(winner, tie = 0, tie_list)
	if(!winner)
		aborted = 1
	else
		src.winner = winner
		src.tie = tie
		src.tie_list = tie_list

/vote_system
	var/question
	var/list/answers
	var/list/results
	var/vote = 0 //if 1, a vote is already in progress
	var/default_answer = 0 //0 = H
	var/vote_reboot = TRUE
	var/reboot_vote = FALSE //if the vote is actually on
	var/reboot_time
	var/vote_timeout
	var/flags = 0
	var/const/VOTING = 1
	var/const/ABORTING = 2
	var/const/REBOOT = 4

/vote_system/proc/Abort()
	flags |= 2

/vote_system/proc/Query(vote, list/answers, timeout = 300)
	set background = 1
	src.question = vote
	src.answers = answers
	src.results = new/list()
	src.vote = 1
	SendMessage(world)

	vote_timeout = timeout + world.timeofday

	timeout /= 10
	while(--timeout && !(flags & ABORTING))
		sleep(10)

	if(flags & ABORTING)
		flags = 0
		return new/vote_data()

	world << "<b>Voting has ended!</b>"
	var/list/winners[src.answers.len]
	for(var/i = 1 to src.answers.len)
		winners[i] = 0

	for(var/ckey in results)
		winners[results[ckey]]++
		for(var/mob/XX in Players2)
			if(XX.DE == 1 && XX.GM == 1)
				XX << "[dd_list2text(winners, "; ")] - [ckey]"

	var/highest = 0
	for(var/i = 1 to winners.len)
		if(winners[i] > highest)
			highest = winners[i]

	var/winner
	for(var/i = 1 to winners.len)
		if(winners[i] >= highest)
			if(istype(winner, /list))
				winner += i
			else if(winner)
				winner = list(winner, i)
			else
				winner = i

	src.vote = 0
	if(istype(winner, /list))
		return new/vote_data(pick(winner), 1, winner)
	else
		return new/vote_data(winner)

/vote_system/proc/SendMessage(recp)
	if(!vote)
		return
	recp << "<center><b>A vote has been started! ([question])</b></center>"
	recp << "<center>Click <a href=\"byond://?src=\ref[src];cmd=view\">here</a> to cast your vote.</center>"

/vote_system/Topic(href, href_list[])
	if(!vote)
		usr << browse(null, "window=\ref[src]")
		return
	if(href_list["cmd"] == "vote" || href_list["cmd"] == "view")
		if(href_list["cmd"] == "vote")
			var/choice = text2num(href_list["choice"])
			if((usr.ckey in results) && results[usr.ckey] == choice)
				results -= usr.ckey
			else
				results[usr.ckey] = choice
			if(href_list["verbose"])
				/*if(istype(usr, /mob/character_handling))
					var/mob/character_handling/M = usr
					M.Display2()*/
				return
		. = {"
		<html>
			<head>
				<title>Voting Booth</title>
				<style>
					 body {
					 	font-family: Courier;
					 	font-size: 10pt;
					 	background-color: rgb(200, 220, 200);
					 	color: rgb(109, 64, 18);
					 }
					 input {
					 	background-color: rgb(200, 220, 200);
					 	color: rgb(109, 64, 18);
					 	margin-right: 8px;
					 	width: 100%;
					 	height: 24px;
					 	cursor: pointer;
					 }
					 input.selected {
					 	border-style: inset;
					 }
				</style>
			</head>
			<body>
				<p>[question]</p>
				<table width="100%">
					<tr><td>"}
		for(var/i = 1 to src.answers.len)
			. += "<input type=\"button\" value=\"[src.answers[i]]\" onclick=\"parent.location='byond://?src=\ref[src];cmd=vote;choice=[i]';\" [(usr.ckey in results) && results[usr.ckey] == i ? "class=\"selected\"" :] /></td>"
			if((i % 3) == 0)
				. += "</tr><tr>"
			. += "<td>"
		. += {"
				</table>
			</body>
		</html>"}
		usr << browse(., "window=\ref[src];size=600x256")
