	object_const_def ; object_event constants
	const ROUTE2_BUG_CATCHER1
	const ROUTE2_BUG_CATCHER2
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_POKE_BALL3
	const ROUTE2_POKE_BALL4
	const ROUTE2_FRUIT_TREE

Route2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherRobAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherEd:
	trainer BUG_CATCHER, ED, EVENT_BEAT_BUG_CATCHER_ED, BugCatcherEdSeenText, BugCatcherEdBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherEdAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2DireHit:
	itemball DIRE_HIT

Route2MaxPotion:
	itemball MAX_POTION

Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER

Route2FruitTree:
	fruittree FRUITTREE_ROUTE_2

Route2HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

Route2HiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

Route2HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE

Route2HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_2_HIDDEN_REVIVE

BugCatcherRobSeenText:
	text "My bug #MON are"
	line "tough. Prepare to"
	cont "lose!"
	done

BugCatcherRobBeatenText:
	text "I was whipped…"
	done

BugCatcherRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#MON."
	done

BugCatcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

BugCatcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

BugCatcherEdAfterBattleText:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

Route2SignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done

Route2DiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events	
	warp_event 16, 45, ROUTE_2_GATE, 3
	warp_event 17, 45, ROUTE_2_GATE, 4
	warp_event  1,  5, ROUTE_2_GATE, 1	

	db 0 ; coord events

	db 6 ; bg events
	bg_event 16, 32, BGEVENT_READ, Route2Sign
	bg_event 28, 20, BGEVENT_READ, Route2DiglettsCaveSign
	bg_event 11,  4, BGEVENT_ITEM, Route2HiddenMaxEther
	bg_event 31, 42, BGEVENT_ITEM, Route2HiddenFullHeal
	bg_event  1, 40, BGEVENT_ITEM, Route2HiddenFullRestore
	bg_event 16,  3, BGEVENT_ITEM, Route2HiddenRevive

	db 5 ; object events
	object_event 27, 28, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherEd, -1
	object_event 16, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event  9, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event  1, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2MaxPotion, EVENT_ROUTE_2_MAX_POTION

