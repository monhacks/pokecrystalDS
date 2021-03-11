	object_const_def ; object_event constants
	

VioletGarden_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGarden_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events
	;warp_event  3,  7, VIOLET_CITY, 4
	;warp_event  4,  7, VIOLET_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	;object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseTeacherScript, -1
	;object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseLassScript, -1
	;object_event  5,  2, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseBirdScript, -1
