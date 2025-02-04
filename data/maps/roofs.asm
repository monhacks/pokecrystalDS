; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_NEW_BARK  ; 0
	;const ROOF_CIANW   ; 1	UNUSED
	const ROOF_TRAD    ; 2
	const ROOF_OLIVINE   ; 3 
	const ROOF_GOLDENROD ; 4
	const ROOF_VIOLET    ;5  NOW MORE JAPANASE
	const ROOF_AZALEA   ; 6
	;const ROOF_SNOW    ;7 UNUSED
	
MapGroupRoofs:
; entries correspond to map groups
; values are indexes for Roofs (see below)
	db -1             ;  0
	db ROOF_OLIVINE   ;  1 (Olivine)
	db ROOF_TRAD      ;  2 (Mahogany)
	db -1             ;  3
	db ROOF_VIOLET    ;  4 (Ecruteak)
	db ROOF_TRAD    ;  5 (Blackthorn)
	db -1             ;  6
	db -1             ;  7
	db ROOF_AZALEA      ;  8 (Azalea)
	db ROOF_TRAD      ;  9 (Lake of Rage)
	db ROOF_VIOLET    ; 10 (Violet)
	db ROOF_GOLDENROD ; 11 (Goldenrod)
	db -1             ; 12
	db -1             ; 13
	db -1             ; 14
	db -1             ; 15
	db -1             ; 16
	db -1             ; 17
	db -1             ; 18
	db ROOF_NEW_BARK  ; 19 (Silver Cave)
	db -1             ; 20
	db -1             ; 21
	db ROOF_OLIVINE   ; 22 (Cianwood)
	db -1             ; 23
	db ROOF_NEW_BARK  ; 24 (New Bark)
	db -1             ; 25
	db ROOF_NEW_BARK  ; 26 (Cherrygrove)
	db -1			  ; 27 (Silver)

Roofs:
; entries correspond to ROOF_* constants
INCBIN "gfx/tilesets/roofs/new_bark.2bpp"
;INCBIN "gfx/tilesets/roofs/ciano.2bpp"
INCBIN "gfx/tilesets/roofs/trad.2bpp"
INCBIN "gfx/tilesets/roofs/olivine.2bpp"
INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
INCBIN "gfx/tilesets/roofs/violet.2bpp"
INCBIN "gfx/tilesets/roofs/azalea.2bpp"
;INCBIN "gfx/tilesets/roofs/snow.2bpp"
