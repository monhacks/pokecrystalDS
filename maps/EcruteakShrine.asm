	object_const_def ; object_event constants
	
TinTowerSign:
	jumptext TinTowerSignText
	
TinTowerSignText:
	text "TIN TOWER"

	para "A legendary #-"
	line "MON is said to"
	cont "roost here."
	done	
	

EcruteakShrine_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakShrine_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  4, 33, ECRUTEAK_CITY, 3
	warp_event  5, 33, ECRUTEAK_CITY, 4
	warp_event 19, 21, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 19,  5, TIN_TOWER_1F, 1
	warp_event 19, 18, WISE_TRIOS_ROOM, 1
	warp_event 20, 18, WISE_TRIOS_ROOM, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 18,  7, BGEVENT_READ, TinTowerSign

	db 0 ; object events
	;object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseTeacherScript, -1
	;object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseLassScript, -1
	;object_event  5,  2, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseBirdScript, -1
