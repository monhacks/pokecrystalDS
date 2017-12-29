UnusedTitleScreen: ; 10c000

	call ClearBGPalettes
	call ClearTileMap
	call DisableLCD

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

	ld hl, UnusedTitleBG_GFX
	ld de, vTiles2
	ld bc, vBGMap0 - vTiles2
	call CopyBytes

	ld hl, UnusedTitleBG_GFX + $80 tiles
	ld de, vTiles1
	ld bc, vTiles2 - vTiles1
	call CopyBytes

	ld hl, UnusedTitleFG_GFX
	ld de, vTiles0
	ld bc, vTiles1 - vTiles0
	call CopyBytes

	ld hl, UnusedTitleBG_Tilemap
	debgcoord 0, 0
	ld bc, 32 * 32
.copy
	ld a, 0
	ld [rVBK], a
	ld a, [hli]
	ld [de], a
	ld a, 1
	ld [rVBK], a
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy

	ld hl, UnusedTitleFG_OAM
	ld de, Sprites
	ld bc, $a0
	call CopyBytes

	call EnableLCD
	ld a, [rLCDC]
	set rLCDC_SPRITE_ENABLE, a
	set rLCDC_SPRITE_SIZE, a
	ld [rLCDC], a

	call DelayFrame

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, UnusedTitleBG_Palettes
	ld de, UnknBGPals
	ld bc, 8 palettes
	call CopyBytes

	ld hl, UnusedTitleFG_Palettes
	ld de, UnknOBPals
	ld bc, 8 palettes
	call CopyBytes

	ld hl, UnusedTitleBG_Palettes
	ld de, BGPals
	ld bc, 8 palettes
	call CopyBytes

	ld hl, UnusedTitleFG_Palettes
	ld de, OBPals
	ld bc, 8 palettes
	call CopyBytes

	pop af
	ld [rSVBK], a

	ld a, $1
	ld [hCGBPalUpdate], a

	ld de, MUSIC_TITLE
	call PlayMusic

	ret
; 10c0b1

UnusedTitleBG_GFX: ; 10c0b1
INCBIN "gfx/title/old_bg.2bpp"
; 10d0b1

UnusedTitleBG_Tilemap: ; 10d0b1
; 32x32 (tile, attributes)
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $01,$00, $02,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $03,$00, $04,$00, $05,$01, $06,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $07,$05, $08,$05, $09,$05, $0a,$05, $0b,$00, $0c,$00, $0d,$00, $0e,$00, $0f,$01, $10,$01, $11,$01, $12,$01, $13,$05, $14,$05, $15,$05, $16,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $17,$04, $18,$04, $19,$04, $1a,$04, $1b,$00, $1c,$00, $1d,$02, $1e,$02, $1f,$07, $20,$07, $21,$01, $22,$01, $23,$04, $24,$04, $25,$04, $26,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $27,$04, $28,$04, $29,$04, $2a,$04, $2b,$00, $2c,$00, $2d,$03, $2e,$01, $2f,$01, $30,$01, $31,$01, $32,$01, $33,$04, $34,$04, $35,$04, $36,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $37,$04, $38,$04, $39,$04, $3a,$04, $3b,$00, $3c,$00, $3d,$01, $00,$00, $00,$00, $3e,$07, $3f,$01, $40,$01, $41,$04, $42,$04, $43,$04, $44,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $45,$04, $46,$04, $47,$04, $48,$04, $49,$00, $3c,$00, $4a,$01, $00,$00, $00,$00, $4b,$07, $3f,$01, $4c,$01, $4d,$06, $4e,$06, $4f,$06, $50,$06, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $51,$04, $52,$06, $53,$06, $54,$06, $55,$00, $3c,$00, $56,$01, $00,$00, $00,$00, $57,$07, $58,$01, $59,$01, $5a,$06, $5b,$06, $5c,$06, $5d,$06, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $5e,$06, $5f,$06, $60,$06, $61,$06, $62,$00, $63,$00, $64,$03, $65,$01, $66,$01, $67,$07, $68,$01, $69,$01, $26,$04, $6a,$06, $26,$04, $26,$04, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $6b,$00, $6c,$05, $6d,$05, $6e,$05, $6f,$00, $70,$02, $71,$02, $72,$01, $73,$00, $74,$02, $75,$01, $76,$01, $77,$05, $78,$05, $79,$05, $6b,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $7a,$00, $7b,$00, $7c,$00, $7d,$00, $0f,$01, $7e,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $a2,$00, $80,$00, $81,$00, $82,$00, $83,$00, $84,$07, $85,$01, $86,$01, $87,$01, $88,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $89,$00, $8a,$00, $8b,$00, $8c,$07, $8d,$01, $8e,$01, $8f,$01, $90,$01, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $91,$01, $92,$01, $93,$01, $94,$01, $95,$01, $00,$00, $00,$00, $00,$00, $96,$05, $97,$05, $98,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $99,$05, $9a,$05, $9b,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $9c,$05, $9d,$05, $9e,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $9f,$05, $a0,$05, $a1,$05, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $6b,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
	db $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00
; 10d8b1

UnusedTitleBG_Palettes: ; 10d8b1
INCLUDE "data/palettes/unused_title/bg.pal"

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 20, 04, 20
	RGB 16, 08, 16
	RGB 24, 00, 24

rept 54
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
endr
; 10dab1

UnusedTitleFG_GFX: ; 10dab1
INCBIN "gfx/title/old_fg.2bpp"
; 10eab1

UnusedTitleFG_Palettes: ; 10eab1
INCLUDE "data/palettes/unused_title/ob.pal"
; 10ecb1

UnusedTitleFG_OAM: ; 10ecb1
	db $18, $38, $00, $01,  $18, $40, $02, $01,  $18, $48, $04, $01,  $18, $50, $06, $01
	db $18, $58, $08, $01,  $18, $60, $0a, $01,  $18, $68, $0c, $01,  $18, $70, $0e, $01

	db $28, $38, $10, $00,  $28, $40, $12, $00,  $28, $48, $14, $00,  $28, $50, $16, $00
	db $28, $58, $18, $00,  $28, $60, $1a, $00,  $28, $68, $1c, $00,  $28, $70, $1e, $00

	db $38, $38, $20, $00,  $38, $40, $22, $00,  $38, $48, $24, $00,  $38, $50, $26, $00
	db $38, $58, $28, $00,  $38, $60, $2a, $00,  $38, $68, $2c, $00,  $38, $70, $2e, $00

	db $48, $38, $30, $02,  $48, $40, $32, $02,  $48, $48, $34, $02,  $48, $50, $36, $02
	db $48, $58, $38, $02,  $48, $60, $3a, $02,  $48, $68, $3c, $02,  $48, $70, $3e, $02

	db $58, $38, $40, $01,  $58, $40, $42, $01,  $58, $48, $44, $01,  $58, $50, $46, $01
	db $58, $58, $48, $01,  $58, $60, $4a, $01,  $58, $68, $4c, $01,  $58, $70, $4e, $01
; 10ed51


Function10ed51: ; 10ed51
	call _TitleScreen
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
	ld b, a
	and 1
	jr nz, .done
	call SuicuneFrameIterator
	call DelayFrame
	jr .loop
.done
	ret
; 10ed67
