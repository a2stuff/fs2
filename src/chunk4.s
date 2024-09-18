        .org $200

;;; chunk5 references
LA851           := $A851        ; into middle of message???

        sty     $C2
        .byte   $D2
        cmp     $CE,x
        ldy     #$D5
        sta     $FF8D
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        ora     ($02,x)
        .byte   $04
        php
        bpl     L0256
        rti

        .byte   $80
        .byte   $80
        rti

        jsr     L0810
        .byte   $04
        .byte   $02
        .byte   $01

;;; Pixel list for elevator control position
PLElevatorControlPositionIndicator:
        .byte   6, 0,0, 1,0, 0,1, 1,1, 0,2, 1,2

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L0256:  brk
        brk
        brk
        brk
        brk
        brk
        brk

;;; Pixel list for aileron indicator and rudder indicator
PLAileronAndRudderIndicators:
        .byte   9, 0,0, 1,0, 2,0, 3,0, 4,0, 1,1, 2,1, 3,1, 2,2

;;; Pixel list for slip/skid indicator
PLSlipSkidIndicator:
        .byte   12, 1,0, 2,0, 0,1, 1,1, 2,1, 3,1, 0,2, 1,2, 2,2, 3,2, 1,3, 2,3

;;; Pixel list for fuel/oil gauges
PLFuelAndOilGauges:
        .byte   12, 0,0, 0,1, 0,2, 0,3, 0,4, 0,5, 1,0, 1,1, 1,2, 1,3, 1,4, 1,5

IndicatorDialNeedleLastValue:
        .byte   0, 0, 0, 0, 0

;;; Table used by `DrawIndicatorDialNeedle`, indexed by needle
IndicatorDialNeedleX:
        .byte   $82
        .byte   $82
        .byte   $1A
        .byte   $82
        .byte   $B4

;;; Table used by `DrawIndicatorDialNeedle`, indexed by needle
IndicatorDialNeedleY:
        .byte   $7E
        .byte   $7E
        .byte   $7E
        .byte   $AA
        .byte   $AF

;;; Table used by `DrawIndicatorDialNeedle`, indexed by needle
;;; 0 = skinny, 1 = thick
IndicatorDialNeedleStyle:
        .byte   0, 1, 0, 1, 1

;;; Thin needle data - table of addrs indexed by needle pos
IndicatorDialThinNeedleTable:
        .addr   ND0314, ND031B, ND0322, ND032D, ND033A, ND0349, ND035C, ND0371
        .addr   ND0388, ND03A1, ND03BC, ND0400, ND041F, ND0440, ND0463, ND0488
        .addr   ND04AF, ND04D6, ND04FF, ND0528, ND0553, ND057E, ND05A9

        .addr   ND05D4

;;; Thick needle data - table of addrs indexed by needle pos
IndicatorDialThickNeedleTable:
        .addr   ND05D4, ND05DD, ND05E8, ND05F5, ND0604, ND0613, ND0624, ND0637
        .addr   ND064C, ND0663, ND067C, ND0695, ND06B0, ND06CD, ND06EC, ND070B
        .addr   ND072C, ND074F, ND0772, ND0795, ND07BA, ND0E50, ND0E75

;;; Dial needle pixel lists
ND0314: .byte   $01, $0a, $00, $15, $01, $0a, $ff
ND031B: .byte   $01, $05, $00, $10, $01, $14, $ff
ND0322: .byte   $01, $03, $00, $09, $01, $0c, $06, $0c, $10, $05, $ff
ND032D: .byte   $01, $02, $00, $07, $01, $0a, $05, $0a, $0b, $08, $11, $04, $ff
ND033A: .byte   $00, $03, $01, $05, $01, $08, $04, $08, $08, $07, $0d, $05, $11, $03, $ff
ND0349: .byte   $00, $03, $01, $04, $01, $06, $03, $06, $06, $06, $09, $05, $0c, $04, $0f, $03, $12, $02, $ff
ND035C: .byte   $00, $02, $01, $03, $01, $05, $03, $05, $05, $05, $08, $04, $0a, $04, $0c, $04, $0f, $03, $11, $02, $ff
ND0371: .byte   $00, $02, $01, $03, $01, $05, $03, $04, $05, $04, $07, $04, $09, $04, $0b, $03, $0d, $03, $0f, $03, $11, $02, $ff
ND0388: .byte   $00, $03, $00, $05, $00, $06, $01, $06, $03, $06, $05, $05, $07, $04, $09, $04, $0b, $03, $0d, $02, $0f, $02, $11, $01, $ff
ND03A1: .byte   $00, $03, $00, $04, $00, $05, $01, $06, $03, $05, $04, $05, $06, $04, $08, $03, $09, $03, $0b, $03, $0c, $03, $0e, $02, $10, $01, $ff
ND03BC: .byte    $00, $03, $00, $04, $00, $05, $01, $05, $03, $04, $04, $04, $05, $04, $07, $03, $08, $03, $09, $03, $0b, $02, $0c, $02, $0d, $02, $0f, $01, $ff


;;; Probably garbage until vectors

        jmp     $B7B5

        lda     $9D0F
        ldy     $9D0E
        rts

        lda     $AAC2
        ldy     $AAC1
        rts

        jmp     LA851           ; ???

        nop
        nop

        .byte   $4c             ; JMP ???

        .addr   $ED98           ; BRK vector
        .addr   ResetInterruptHandler ; Reset vector
        .byte   $02             ; PWRUP byte
        jmp     L1F89           ; Applesoft & vector
        jmp     L1F89           ; Monitor Ctrl-Y vector
        jmp     ResetInterruptHandler ; NMI vector
        .addr   ResetInterruptHandler ; IRQ vector


        ;; Text page 1 - and screen holes!

;;; Dial needle pixel lists
ND0400: .byte   $00, $03, $00, $04, $00, $05, $01, $05, $02, $04, $03, $04, $05, $03, $06, $03, $07, $03, $08, $03, $09, $03, $0a, $02, $0c, $01, $0d, $01, $0e, $01, $ff
ND041F: .byte   $00, $03, $00, $04, $00, $04, $01, $04, $02, $04, $03, $04, $04, $03, $05, $03, $06, $03, $07, $03, $08, $02, $09, $02, $0a, $02, $0b, $02, $0c, $01, $0d, $01, $ff
ND0440: .byte   $00, $03, $00, $04, $00, $04, $01, $04, $02, $04, $03, $03, $03, $04, $04, $03, $05, $03, $06, $03, $07, $02, $08, $02, $09, $02, $09, $02, $0a, $02, $0b, $01, $0c, $01, $ff
ND0463: .byte   $00, $03, $00, $04, $00, $04, $01, $04, $01, $04, $02, $04, $03, $03, $04, $03, $04, $03, $05, $03, $06, $02, $07, $02, $07, $02, $08, $02, $09, $01, $0a, $01, $0a, $01, $0b, $01, $ff
ND0488: .byte   $00, $01, $00, $03, $01, $02, $01, $03, $02, $02, $02, $03, $03, $02, $04, $02, $04, $02, $05, $02, $05, $02, $06, $02, $06, $02, $07, $02, $08, $01, $08, $02, $09, $01, $09, $02, $0a, $01, $ff
ND04AF: .byte   $00, $01, $00, $03, $01, $02, $01, $03, $02, $02, $02, $03, $03, $02, $03, $02, $04, $02, $04, $02, $05, $02, $05, $02, $06, $02, $06, $02, $07, $01, $07, $02, $08, $01, $08, $02, $09, $01, $ff
ND04D6: .byte   $00, $01, $00, $03, $00, $03, $01, $03, $01, $03, $02, $02, $02, $03, $03, $02, $03, $02, $04, $02, $04, $02, $04, $02, $05, $02, $05, $02, $06, $01, $06, $02, $07, $01, $07, $01, $08, $01, $08, $01, $ff
ND04FF: .byte   $00, $01, $00, $03, $00, $03, $01, $02, $01, $03, $01, $03, $02, $02, $02, $02, $02, $03, $03, $02, $03, $02, $03, $02, $04, $01, $04, $02, $04, $02, $05, $01, $05, $01, $05, $02, $06, $01, $06, $01, $ff
ND0528: .byte   $01, $01, $00, $03, $00, $03, $01, $02, $01, $02, $01, $03, $01, $03, $02, $02, $02, $02, $02, $02, $02, $02, $03, $02, $03, $02, $03, $02, $03, $02, $04, $01, $04, $01, $04, $02, $04, $02, $05, $01, $05, $01, $ff
ND0553: .byte   $01, $01, $00, $03, $00, $03, $00, $03, $01, $02, $01, $02, $01, $03, $01, $03, $01, $03, $02, $02, $02, $02, $02, $02, $02, $02, $03, $01, $03, $01, $03, $01, $03, $02, $03, $02, $04, $01, $04, $01, $04, $01, $ff
ND057E: .byte   $01, $01, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $02, $02, $01, $02, $01, $02, $01, $02, $01, $02, $01, $ff
ND05A9: .byte   $01, $01, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $00, $03, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $ff
ND05D4: .byte   $07, $08, $00, $12, $04, $0d, $0a, $05, $ff
ND05DD: .byte   $07, $07, $00, $10, $03, $0f, $07, $0a, $0b, $04, $ff
ND05E8: .byte   $00, $01, $00, $0e, $02, $0e, $05, $0d, $09, $08, $0c, $03, $ff
ND05F5: .byte   $00, $01, $00, $07, $02, $0c, $04, $0c, $06, $0c, $09, $07, $0b, $03, $ff
ND0604: .byte   $00, $04, $01, $09, $03, $0b, $05, $0a, $07, $09, $09, $07, $0b, $06, $ff
ND0613: .byte   $00, $03, $01, $06, $03, $08, $05, $09, $06, $09, $08, $08, $0a, $06, $0c, $05, $ff
ND0624: .byte   $00, $02, $01, $04, $03, $06, $04, $08, $05, $09, $07, $08, $08, $08, $09, $07, $0b, $06, $ff
ND0637: .byte   $00, $02, $01, $03, $02, $04, $04, $05, $05, $06, $06, $07, $07, $07, $08, $07, $0a, $05, $0b, $05, $ff
ND064C: .byte   $00, $01, $01, $02, $02, $03, $03, $04, $04, $05, $05, $06, $07, $06, $08, $06, $09, $05, $0a, $05, $0c, $03, $ff
ND0663: .byte   $00, $01, $01, $02, $02, $03, $03, $03, $04, $04, $05, $05, $05, $07, $06, $07, $07, $07, $08, $06, $09, $06, $0c, $03, $ff
ND067C: .byte   $00, $01, $01, $02, $02, $02, $03, $03, $04, $04, $05, $04, $05, $06, $06, $06, $07, $06, $08, $05, $09, $05, $0b, $03, $ff
ND0695: .byte   $00, $01, $01, $02, $01, $03, $02, $03, $03, $04, $04, $04, $04, $05, $05, $06, $06, $06, $07, $05, $07, $06, $08, $05, $0a, $03, $ff
ND06B0: .byte   $00, $01, $01, $01, $01, $02, $02, $02, $03, $02, $03, $04, $04, $04, $04, $05, $05, $05, $06, $05, $06, $05, $07, $05, $08, $04, $0a, $02, $ff
ND06CD: .byte   $00, $01, $01, $01, $01, $02, $02, $02, $02, $03, $03, $04, $04, $04, $04, $05, $05, $05, $05, $06, $06, $05, $06, $05, $07, $05, $08, $04, $0a, $02, $ff
ND06EC: .byte   $00, $01, $01, $01, $01, $02, $02, $02, $02, $03, $03, $03, $03, $03, $04, $03, $04, $04, $05, $04, $05, $05, $06, $04, $06, $05, $07, $04, $09, $02, $ff
ND070B: .byte   $00, $01, $00, $02, $01, $02, $01, $02, $02, $02, $02, $03, $03, $03, $03, $04, $03, $05, $04, $04, $04, $05, $05, $05, $05, $05, $06, $04, $07, $03, $09, $01, $ff
ND072C: .byte   $00, $01, $00, $02, $01, $01, $01, $02, $01, $03, $02, $03, $02, $03, $02, $04, $02, $05, $03, $05, $03, $05, $03, $06, $04, $05, $04, $05, $05, $04, $06, $03, $08, $01, $ff
ND074F: .byte   $00, $01, $00, $02, $00, $02, $01, $02, $01, $02, $01, $03, $01, $04, $02, $03, $02, $04, $02, $04, $02, $05, $03, $04, $03, $05, $03, $05, $04, $04, $05, $03, $07, $01, $ff
ND0772: .byte   $00, $01, $00, $02, $00, $02, $00, $03, $01, $02, $01, $03, $01, $03, $01, $04, $01, $04, $01, $05, $02, $04, $02, $05, $02, $05, $02, $05, $03, $04, $04, $03, $06, $01, $ff
ND0795: .byte   $01, $01, $01, $01, $01, $02, $01, $02, $01, $03, $01, $03, $01, $04, $02, $03, $02, $03, $02, $04, $02, $04, $02, $05, $02, $05, $02, $05, $03, $03, $03, $03, $04, $01, $04, $01, $ff
ND07BA: .byte   $01, $01, $01, $01, $01, $02, $01, $02, $01, $02, $01, $03, $01, $03, $01, $03, $01, $03, $01, $04, $01, $04, $01, $04, $01, $05, $01, $05, $02, $03, $02, $03, $03, $01, $03, $01, $ff

        ror     $6A6C
        pla
        ror     $64
        adc     ($5E,x)
        .byte   $5A
        eor     $50,x
        .byte   $4B
        .byte   $47
        .byte   $43
        rol     $3539,x
        and     ($2C),y
        rol     $22
        .byte   $1F
        .byte   $1C
        .byte   $1A
        ldy     #$C6
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk

        ;; $800
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L0810:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     ($00,x)
        brk
        brk
RadarView:      .byte   0       ; $01 if in Radar View mode
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     ($00,x)
        brk
        brk
        brk
        brk
        ora     ($00,x)
        ora     ($00,x)
        ora     ($00,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        cmp     $D5,x
        rol     a
        rol     a
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $0C
        sta     $24
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk

;;; Reboot vector (used for "Boot DOS" from Course Plotter)
RebootVector:   .addr   0
RebootFlag:     .byte   1

        brk
        brk
        txs
        ora     a:$01
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     ($00,x)

WW1AceScore:    .byte   0

        brk
        brk
        brk
        brk
        brk

Has64K:         .byte   1

        .byte   0
        .byte   0

        ;; $8C9
        MESSAGE $9B, $68, "BOMBS: 5 " ; modified in chunk5
        WW1AceBombsStr := *-3
        brk
        brk

        ;; $8D7
        MESSAGE $9B, $68, "SCORE:000" ; modified in chunk5
        WW1AceScoreStr := *-4

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $04
        brk
        brk

InputCounter:   .byte   0       ; ???

        ora     ($00,x)
        .byte   $03
        brk
        bpl     L08F8
L08F8:  bpl     L08FA
L08FA:  brk
        asl     $DD,x
        brk
        brk
        sed
        .byte   $03
        brk
        brk
        asl     $DD,x
        brk
        brk
        asl     $04,x
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $0F
        .byte   $FF
        .byte   $FF
        .byte   $0F
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $0C, $50, $A7
        brk
        brk
        .byte   $01

SlewMode:       .byte   $00

        brk
        brk

WW1AceMode:     .byte   $00

ATISPacing:     .byte   $C8

        bit     $43
        .byte   $1F
        eor     ($00,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $7F
        .byte   $FF
        .byte   $7F
        brk
        brk
        .byte   $FF
        .byte   $7F
        php
        brk
        .byte   $04
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $64
        brk
        .byte   $FF
        .byte   $FF
        .byte   $0F
        brk
        brk
        asl     a
        ora     ($01,x)
        brk
        brk
        .byte   $FF
        brk
        .byte   $FF
        brk
        .byte   $FF
        .byte   $02
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        ora     $00,y
        brk
L0994:  ora     $00,y
L0997:  ora     $0100,y
        ora     ($01,x)
L099C:  brk
L099D:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $7F
        brk
        brk
        brk
        brk
        brk
        brk
        bit     $6001
        ora     #$30
        adc     $00,x
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L09DA:  dey
        .byte   $13
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        bne     L09F5
        bne     L09F7
        brk
        brk
        cld
        .byte   $59
        brk
L09F5:  brk
        brk
L09F7:  brk
        brk
        brk
        brk
        bpl     L0A24
        brk
        rti

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L0A12:  brk
        brk
        brk
        brk
        brk
        cpy     $09
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $54
        .byte   $F2
        rts

L0A24:  beq     L09DA
        .byte   $E2
        bmi     L0A9E
        brk
        ora     $1E
        brk
        tay
        adc     ($B8,x)
        .byte   $0B
        ldy     #$0F
L0A33:  brk
        brk
        brk
        ldy     $00,x
        brk
        brk
        brk

IndicatorDialNeedlePos:         .byte   0
IndicatorDialNeedleIndex:       .byte   0

L0A3D:  brk
        brk
PixelListXHi:   .byte   0
        php
        php
L0A42:  brk
L0A43:  brk
L0A44:  brk
L0A45:  brk
L0A46:  brk
L0A47:  brk
L0A48:  brk
L0A49:  brk
L0A4A:  brk
L0A4B:  brk
L0A4C:  brk
L0A4D:  brk
L0A4E:  brk
L0A4F:  brk
L0A50:  brk
        brk
        brk

YokeHorizPos:   .byte   0

        .byte   $64
        brk
        brk
        brk
        brk
        brk
        brk

YokeVertPos:    .byte   0

        brk

ElevatorTrim:   .byte   0

        brk
        brk
        brk

PanelLights:    .byte   $FF

        .byte   $03
        ora     ($00,x)

RudderPos:      .byte   0

        brk

SlewRollRate:   .byte   0
        brk
SlewYawRate:    .byte   0
        brk
SlewPitchRate:  .byte   0
        brk
SlewAltRate:    .byte   0
        brk
        brk

ViewDirection:  .byte   0
;;; $00 = front
;;; $02 = front right
;;; $04 = right
;;; $06 = back right
;;; $08 = back
;;; $0A = back left
;;; $0C = left
;;; $0E = front left
;;; $FF = down

        .byte   $01

WarDeclared:
        .byte   $00

        .byte   $FF

ZoomLevel:      .faraddr        $0003FF

        rts

        rti

        cpy     #$E0
        .byte   $F4
        ora     ($41,x)
        rti

        .byte   $1F
        .byte   $F4
        ora     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        rti

        .byte   $F4
        ora     ($40,x)
        .byte   $1F
        eor     ($F4,x)
        ora     ($C0,x)
        cpx     #$FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        rti

        rti

        .byte   $1F
        .byte   $0C
        .byte   $FE
        .byte   $41
L0A9E:  cpy     #$E0
        .byte   $0C
        inc     $FFFF,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        rti

        .byte   $0C
        inc     $E0C0,x
        eor     ($0C,x)
        inc     $1F40,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF

;;; ============================================================

;;; Series of 64-byte buffers, 6 primary, 6 secondary???
;;; Used in chunk5.

L0AB8:
        .byte   $BE, $AB, $AE, $BA, $EA, $AA, $EE, $AA
        .byte   $AE, $EB, $AE, $AA, $AE, $EB, $BB, $AA
        .byte   $AE, $EB, $BA, $AA, $BE, $EA, $EA, $EE
        .byte   $BB, $BA, $BA, $FE, $AE, $EA, $AF, $FE
        .byte   $EF, $EA, $FA, $FB, $FA, $EE, $AE, $BF
        .byte   $FE, $FE, $EA, $FE, $AF, $FE, $AA, $EA
        .byte   $AA, $AE, $EE, $BE, $AE, $EA, $AA, $97
        .byte   $97, $97, $97, $97, $97, $97, $97, $97

L0AF8:
        .byte   $97, $97, $97, $97, $97, $97, $97, $97
        .byte   $AA, $D5, $DA, $EB, $97, $D7, $CB, $BF
        .byte   $F3, $AB, $AE, $B7, $96, $96, $96, $96
        .byte   $AE, $9D, $EF, $BE, $AA, $AA, $BA, $AB
        .byte   $AA, $EF, $FF, $AA, $FF, $AA, $AA, $FF
        .byte   $AA, $FF, $FF, $AA, $FF, $AA, $AA, $FF
        .byte   $AA, $FF, $FF, $AA, $FF, $AA, $AA, $FF
        .byte   $AA, $FF, $FF, $BE, $FA, $BF, $EE, $EE

L0B38:
        .byte   $FF, $AA, $BB, $BA, $AE, $AF, $FE, $AB
        .byte   $FE, $AB, $BA, $EA, $EA, $AB, $AA, $AF
        .byte   $EB, $FA, $FA, $FB, $EA, $FA, $BA, $AB
        .byte   $EA, $FB, $BA, $AB, $FF, $BE, $AA, $BE
        .byte   $BA, $EA, $AF, $AA, $AF, $AA, $AF, $FB
        .byte   $BA, $BE, $FA, $BF, $FB, $AA, $FA, $BA
        .byte   $AB, $FA, $BA, $AF, $AB, $BF, $FE, $FA
        .byte   $FE, $FF, $FE, $BA, $FA, $BA, $BE, $FB

L0B78:
        .byte   $FE, $EE, $AB, $EE, $FB, $AB, $FA, $AA
        .byte   $EA, $BE, $FE, $AE, $FE, $AA, $EA, $BE
        .byte   $FE, $AF, $BE, $AB, $AB, $AF, $EA, $BB
        .byte   $AF, $EB, $BB, $AF, $AB, $AA, $AB, $BA
        .byte   $EA, $BA, $FF, $EA, $EA, $FA, $BA, $AA
        .byte   $BE, $BB, $BB, $AA, $BF, $BB, $BB, $AA
        .byte   $BB, $BB, $BB, $EE, $EA, $AB, $BB, $AE
        .byte   $EA, $BF, $AA, $BA, $EA, $AB, $AE, $AA

L0BB8:
        .byte   $EE, $AB, $FB, $AE, $FE, $AA, $BA, $AA
        .byte   $EE, $FF, $BA, $AA, $EE, $FF, $BA, $AA
        .byte   $EE, $FF, $EE, $AA, $EE, $FA, $EA, $EA
        .byte   $AE, $AA, $FF, $AB, $AF, $AF, $FE, $BB
        .byte   $AF, $FA, $AE, $BF, $BA, $BB, $AB, $EA
        .byte   $BF, $AF, $EE, $AF, $FA, $EF, $AF, $BA
        .byte   $EF, $BA, $FA, $AB, $AE, $FA, $97, $97
        .byte   $97, $97, $97, $97, $97, $97, $97, $97

L0BF8:
        .byte   $97, $97, $97, $97, $97, $97, $97, $97
        .byte   $AA, $AA, $EB, $AF, $9B, $97, $9F, $E6
        .byte   $FA, $B3, $9A, $F3, $96, $96, $96, $9B
        .byte   $96, $9D, $AE, $FA, $AE, $AF, $AF, $AF
        .byte   $AA, $AA, $FF, $AA, $BF, $FF, $AA, $FF
        .byte   $AA, $AA, $FF, $AA, $FF, $FF, $AA, $FF
        .byte   $AA, $AA, $FF, $AA, $FF, $AA, $AA, $FF
        .byte   $AA, $AA, $FF, $EF, $BE, $EF, $FE, $FE

L0C38:
        .byte   $FA, $AF, $AA, $BA, $EE, $AE, $BF, $BA
        .byte   $FB, $AF, $EA, $AA, $EA, $EA, $AA, $FE
        .byte   $BA, $FB, $FA, $BA, $EA, $FA, $AF, $EA
        .byte   $AB, $BA, $AA, $AF, $FF, $FE, $AE, $AF
        .byte   $EA, $EE, $BE, $AA, $BE, $AF, $BF, $FB
        .byte   $AA, $BA, $AA, $FA, $EE, $EA, $AF, $BB
        .byte   $AA, $AA, $AA, $AE, $AA, $FE, $AB, $AB
        .byte   $AA, $FA, $AA, $EA, $AF, $BF, $EB, $BA

L0C78:
        .byte   $AB, $AA, $AB, $AF, $BE, $FF, $AF, $FB
        .byte   $BA, $AF, $AB, $FA, $AB, $EA, $FA, $EA
        .byte   $EA, $FE, $FF, $AA, $FE, $FB, $BA, $FE
        .byte   $BE, $BB, $FA, $FE, $FE, $AF, $FE, $FB
        .byte   $AB, $FE, $FF, $FF, $FA, $BB, $FA, $BA
        .byte   $AA, $AA, $AB, $BA, $AF, $AA, $AB, $BA
        .byte   $BE, $AA, $AB, $EA, $EA, $FE, $AB, $EA
        .byte   $EA, $AA, $AA, $FE, $FA, $AA, $EA, $FA

L0CB8:
        .byte   $EB, $BA, $BF, $FE, $BF, $FE, $AA, $BB
        .byte   $BB, $BA, $AA, $BF, $BB, $BA, $AA, $BA
        .byte   $BB, $BA, $EA, $BF, $EA, $FB, $FA, $AA
        .byte   $EB, $EA, $FB, $AA, $FA, $FB, $BA, $FE
        .byte   $FA, $AB, $AA, $EA, $AE, $AB, $FF, $BF
        .byte   $BB, $AF, $AF, $AF, $AF, $AF, $BE, $AB
        .byte   $FE, $BA, $AF, $AB, $AA, $AB, $97, $97
        .byte   $97, $97, $97, $97, $97, $97, $97, $97

L0CF8:
        .byte   $97, $97, $97, $97, $97, $97, $97, $97
        .byte   $AA, $AD, $AE, $9E, $97, $9A, $AC, $D7
        .byte   $E9, $B2, $AE, $FA, $96, $96, $96, $9D
        .byte   $96, $9D, $AE, $BA, $AF, $BE, $EA, $BF
        .byte   $FF, $AA, $FF, $AA, $AA, $FF, $AA, $FF
        .byte   $FF, $AA, $FF, $AA, $AA, $FF, $AA, $FF
        .byte   $FF, $AA, $FF, $AA, $AA, $AA, $AA, $FF
        .byte   $AA, $AA, $FF, $BF, $FA, $EB, $EE, $EF

L0D38:
        .byte   $FF, $BE, $AF, $AA, $EF, $BA, $EF, $AA
        .byte   $AF, $BE, $FB, $BA, $EE, $EA, $EA, $AB
        .byte   $EA, $FB, $AA, $AF, $AA, $EB, $FB, $FA
        .byte   $EA, $AA, $AE, $BF, $BA, $BF, $AF, $AA
        .byte   $FE, $AF, $FF, $AA, $FE, $BE, $BA, $EE
        .byte   $FB, $EA, $FB, $AB, $FA, $FA, $FB, $AE
        .byte   $EA, $AE, $FE, $AB, $AF, $AB, $BF, $AA
        .byte   $EA, $FA, $AE, $FA, $FB, $AA, $AB, $AA

L0D78:
        .byte   $AA, $AB, $AF, $BF, $FA, $AA, $AE, $EE
        .byte   $EA, $EA, $FE, $BB, $AA, $FA, $FF, $AF
        .byte   $EA, $AB, $BB, $AA, $BF, $BF, $AE, $AB
        .byte   $EA, $BE, $BB, $BA, $BF, $EE, $BF, $FB
        .byte   $FF, $BF, $EE, $EA, $FE, $AB, $BB, $FE
        .byte   $BA, $AA, $FE, $FA, $BA, $AA, $FE, $FA
        .byte   $BA, $AA, $FE, $EA, $AF, $AB, $FE, $EA
        .byte   $AE, $FF, $EA, $AB, $FB, $AA, $BA, $BA

;;; ============================================================

;;; 0DB8:
        .byte   $00, $37, $50, $41, $32, $2A, $1E, $1B
        .byte   $19, $19, $64, $32, $16, $12, $0F, $0F
        .byte   $0F, $0F, $0F, $0F, $78, $78, $3C, $27
        .byte   $0F, $18, $15, $12, $0F, $0F, $00, $78
        .byte   $46, $2D, $23, $19, $14, $12, $11, $11
        .byte   $06, $F8, $FF, $FD, $06, $F9, $FF, $FD
        .byte   $06, $FA, $FF, $FD, $06, $FB, $FF, $FD
        .byte   $07, $FC, $00, $FC, $07, $FD, $00, $FC

;;; 0DF8:
        .byte   $07, $FE, $00, $FC, $07, $FF, $00, $FC
        .byte   $07, $00, $00, $FC, $07, $01, $00, $FC
        .byte   $07, $02, $00, $FC, $07, $03, $00, $FC
        .byte   $07, $04, $00, $FC, $07, $05, $01, $FD
        .byte   $06, $06, $01, $FD, $06, $07, $01, $FD
        .byte   $FF, $AA, $FF, $FF, $AA, $FF, $AA, $AA
        .byte   $FF, $AA, $FF, $BA, $AA, $FF, $AA, $AA
        .byte   $AA, $AA, $FF, $FB, $BF, $EE, $FF, $FF

;;; 0E38:

        .byte   $FB
        ldx     $AEBF
        tax
        inc     $ABAA,x
        ldx     $AABA,y
        .byte   $FB
        tsx
        inc     $AFAF,x
        .byte   $FA
        inc     $FBBB,x
        tsx
        ldx     $FEBE,y

;;; ============================================================

;;; Dial needle pixel lists
ND0E50: .byte   $01, $01, $01, $01, $01, $01, $01, $02, $01, $02, $01, $02, $01, $02, $00, $04, $00, $04, $00, $04, $00, $04, $00, $05, $00, $05, $00, $05, $01, $03, $01, $03, $02, $01, $02, $01, $ff
ND0E75: .byte   $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $01, $02, $01, $02, $00, $03, $00, $03, $00, $03, $00, $04, $00, $04, $00, $04, $00, $04, $00, $03, $01, $02, $01, $01, $01, $01, $ff

;;; HBASH table

HiresTableHi:
        .byte   $20,$24,$28,$2c,$30,$34,$38,$3c
        .byte   $20,$24,$28,$2c,$30,$34,$38,$3c
        .byte   $21,$25,$29,$2d,$31,$35,$39,$3d
        .byte   $21,$25,$29,$2d,$31,$35,$39,$3d
        .byte   $22,$26,$2a,$2e,$32,$36,$3a,$3e
        .byte   $22,$26,$2a,$2e,$32,$36,$3a,$3e
        .byte   $23,$27,$2b,$2f,$33,$37,$3b,$3f
        .byte   $23,$27,$2b,$2f,$33,$37,$3b,$3f
        .byte   $20,$24,$28,$2c,$30,$34,$38,$3c
        .byte   $20,$24,$28,$2c,$30,$34,$38,$3c
        .byte   $21,$25,$29,$2d,$31,$35,$39,$3d
        .byte   $21,$25,$29,$2d,$31,$35,$39,$3d
        .byte   $22,$26,$2a,$2e,$32,$36,$3a,$3e
        .byte   $22,$26,$2a,$2e,$32,$36,$3a,$3e
        .byte   $23,$27,$2b,$2f,$33,$37,$3b,$3f
        .byte   $23,$27,$2b,$2f,$33,$37,$3b,$3f
        .byte   $20,$24,$28,$2c,$30,$34,$38,$3c
        .byte   $20,$24,$28,$2c,$30,$34,$38,$3c
        .byte   $21,$25,$29,$2d,$31,$35,$39,$3d
        .byte   $21,$25,$29,$2d,$31,$35,$39,$3d
        .byte   $22,$26,$2a,$2e,$32,$36,$3a,$3e
        .byte   $22,$26,$2a,$2e,$32,$36,$3a,$3e
        .byte   $23,$27,$2b,$2f,$33,$37,$3b,$3f
        .byte   $23,$27,$2b,$2f,$33,$37,$3b,$3f


;;; HBASHL table

HiresTableLo:
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $80,$80,$80,$80,$80,$80,$80,$80
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $80,$80,$80,$80,$80,$80,$80,$80
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $80,$80,$80,$80,$80,$80,$80,$80
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $80,$80,$80,$80,$80,$80,$80,$80
        .byte   $28,$28,$28,$28,$28,$28,$28,$28
        .byte   $a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8
        .byte   $28,$28,$28,$28,$28,$28,$28,$28
        .byte   $a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8
        .byte   $28,$28,$28,$28,$28,$28,$28,$28
        .byte   $a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8
        .byte   $28,$28,$28,$28,$28,$28,$28,$28
        .byte   $a8,$a8,$a8,$a8,$a8,$a8,$a8,$a8
        .byte   $50,$50,$50,$50,$50,$50,$50,$50
        .byte   $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0
        .byte   $50,$50,$50,$50,$50,$50,$50,$50
        .byte   $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0
        .byte   $50,$50,$50,$50,$50,$50,$50,$50
        .byte   $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0
        .byte   $50,$50,$50,$50,$50,$50,$50,$50
        .byte   $d0,$d0,$d0,$d0,$d0,$d0,$d0,$d0

HiresPixelToByteTable:
        .byte   $00, $00, $00, $00, $00, $00, $00
        .byte   $01, $01, $01, $01, $01, $01, $01
        .byte   $02, $02, $02, $02, $02, $02, $02
        .byte   $03, $03, $03, $03, $03, $03, $03
        .byte   $04, $04, $04, $04, $04, $04, $04
        .byte   $05, $05, $05, $05, $05, $05, $05
        .byte   $06, $06, $06, $06, $06, $06, $06
        .byte   $07, $07, $07, $07, $07, $07, $07
        .byte   $08, $08, $08, $08, $08, $08, $08
        .byte   $09, $09, $09, $09, $09, $09, $09
        .byte   $0A, $0A, $0A, $0A, $0A, $0A, $0A
        .byte   $0B, $0B, $0B, $0B, $0B, $0B, $0B
        .byte   $0C, $0C, $0C, $0C, $0C, $0C, $0C
        .byte   $0D, $0D, $0D, $0D, $0D, $0D, $0D
        .byte   $0E, $0E, $0E, $0E, $0E, $0E, $0E
        .byte   $0F, $0F, $0F, $0F, $0F, $0F, $0F
        .byte   $10, $10, $10, $10, $10, $10, $10
        .byte   $11, $11, $11, $11, $11, $11, $11
        .byte   $12, $12, $12, $12, $12, $12, $12
        .byte   $13, $13, $13, $13, $13, $13, $13
        .byte   $14, $14, $14, $14, $14, $14, $14
        .byte   $15, $15, $15, $15, $15, $15, $15
        .byte   $16, $16, $16, $16, $16, $16, $16
        .byte   $17, $17, $17, $17, $17, $17, $17
        .byte   $18, $18, $18, $18, $18, $18, $18
        .byte   $19, $19, $19, $19, $19, $19, $19
        .byte   $1A, $1A, $1A, $1A, $1A, $1A, $1A
        .byte   $1B, $1B, $1B, $1B, $1B, $1B, $1B
        .byte   $1C, $1C, $1C, $1C, $1C, $1C, $1C
        .byte   $1D, $1D, $1D, $1D, $1D, $1D, $1D
        .byte   $1E, $1E, $1E, $1E, $1E, $1E, $1E
        .byte   $1F, $1F, $1F, $1F, $1F, $1F, $1F
        .byte   $20, $20, $20, $20, $20, $20, $20
        .byte   $21, $21, $21, $21, $21, $21, $21
        .byte   $22, $22, $22, $22, $22, $22, $22
        .byte   $23, $23, $23, $23, $23, $23, $23
        .byte   $24, $24, $24, $24, $24, $24, $24
        .byte   $25, $25, $25, $25, $25, $25, $25
        .byte   $26, $26, $26, $26, $26, $26, $26
        .byte   $27, $27, $27, $27, $27, $27, $27

HiresPixelToBitMaskTable:
        .repeat 38
        .byte   $01, $02, $04, $08, $10, $20, $40
        .endrepeat

ColorPixelToByteTable:
        .byte   $00, $00, $00, $00
        .byte   $01, $01, $01
        .byte   $02, $02, $02, $02
        .byte   $03, $03, $03
        .byte   $04, $04, $04, $04
        .byte   $05, $05, $05
        .byte   $06, $06, $06, $06
        .byte   $07, $07, $07
        .byte   $08, $08, $08, $08
        .byte   $09, $09, $09
        .byte   $0A, $0A, $0A, $0A
        .byte   $0B, $0B, $0B
        .byte   $0C, $0C, $0C, $0C
        .byte   $0D, $0D, $0D
        .byte   $0E, $0E, $0E, $0E
        .byte   $0F, $0F, $0F
        .byte   $10, $10, $10, $10
        .byte   $11, $11, $11
        .byte   $12, $12, $12, $12
        .byte   $13, $13, $13
        .byte   $14, $14, $14, $14
        .byte   $15, $15, $15
        .byte   $16, $16, $16, $16
        .byte   $17, $17, $17
        .byte   $18, $18, $18, $18
        .byte   $19, $19, $19
        .byte   $1A, $1A, $1A, $1A
        .byte   $1B, $1B, $1B
        .byte   $1C, $1C, $1C, $1C
        .byte   $1D, $1D, $1D
        .byte   $1E, $1E, $1E, $1E
        .byte   $1F, $1F, $1F
        .byte   $20, $20, $20, $20
        .byte   $21, $21, $21
        .byte   $22, $22, $22, $22
        .byte   $23, $23, $23
        .byte   $24, $24, $24, $24
        .byte   $25, $25, $25
        .byte   $26, $26, $26, $26
        .byte   $27, $27, $27
        .assert * - ColorPixelToByteTable = 140, error, "size"

AltColorPixelToByteTable:
        .byte   $00, $00, $00
        .byte   $01, $01, $01, $01
        .byte   $02, $02, $02
        .byte   $03, $03, $03, $03
        .byte   $04, $04, $04
        .byte   $05, $05, $05, $05
        .byte   $06, $06, $06
        .byte   $07, $07, $07, $07
        .byte   $08, $08, $08
        .byte   $09, $09, $09, $09
        .byte   $0A, $0A, $0A
        .byte   $0B, $0B, $0B, $0B
        .byte   $0C, $0C, $0C
        .byte   $0D, $0D, $0D, $0D
        .byte   $0E, $0E, $0E
        .byte   $0F, $0F, $0F, $0F
        .byte   $10, $10, $10
        .byte   $11, $11, $11, $11
        .byte   $12, $12, $12
        .byte   $13, $13, $13, $13
        .byte   $14, $14, $14
        .byte   $15, $15, $15, $15
        .byte   $16, $16, $16
        .byte   $17, $17, $17, $17
        .byte   $18, $18, $18
        .byte   $19, $19, $19, $19
        .byte   $1A, $1A, $1A
        .byte   $1B, $1B, $1B, $1B
        .byte   $1C, $1C, $1C
        .byte   $1D, $1D, $1D, $1D
        .byte   $1E, $1E, $1E
        .byte   $1F, $1F, $1F, $1F
        .byte   $20, $20, $20
        .byte   $21, $21, $21, $21
        .byte   $22, $22, $22
        .byte   $23, $23, $23, $23
        .byte   $24, $24, $24
        .byte   $25, $25, $25, $25
        .byte   $26, $26, $26
        .byte   $27, $27, $27, $27
        .assert * - AltColorPixelToByteTable = 140, error, "size"

PixelToBitNumberTable:
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6
        .byte   0, 1, 2, 3, 4, 5, 6

L13EE:  .byte   0, 2, 4, 6, 1, 3, 5, 7

;;; Pixel and/or masks

OrMaskTable1:
        .byte   $01, $04, $10, $40

OrMaskTable2:
        .byte   $02, $08, $20, $01, $04, $10, $40, $02, $08, $20

AndMaskTable1:
        .byte   $FE, $FB, $EF, $BF

AndMaskTable2:
        .byte   $FD, $F7, $DF, $FE, $FB, $EF, $BF, $FD, $F7, $DF

        ;; Hires color table
L1412:  .byte   $00, $2A, $55, $7F
        .refto L1412
L1416:  .byte   $00, $55, $2A, $7F
        .refto L1416

L141A:  .byte   $FF
L141B:  .byte   $7F
L141C:  .byte   $F5
L141D:  .byte   $7F
        .byte   $D7
        .byte   $7F
        ldx     $7F
        adc     ($7F,x)
        ora     #$7F
        .byte   $9C
        ror     $7E1C,x
        .byte   $89
        adc     $7CE3,x
        and     #$7C
        .byte   $5C
        .byte   $7B
        .byte   $7C
        .byte   $7A
        .byte   $89
        adc     $7883,y
        .byte   $6B
        .byte   $77
        rti

        ror     $03,x
        adc     $B5,x
        .byte   $73
        .byte   $54
        .byte   $72
        sbc     ($70,x)
        lsr     $C96F,x
        adc     $6C23
        jmp     ($796A)

        .byte   $67
        dec     $E766
        .byte   $64
        sbc     ($62),y
        .byte   $EB
        rts

        dec     $5E,x
        .byte   $B3
        .byte   $5C
        sta     ($5A,x)
        .byte   $42
        cli
        .byte   $F4
        eor     $9A,x
        .byte   $53
        .byte   $33
        eor     ($BF),y
        lsr     $4C3F
        .byte   $B3
        eor     #$1C
        .byte   $47
        .byte   $7A
        .byte   $44
        cmp     $1641
        .byte   $3F
        lsr     $3C,x
        sty     $B939
        rol     $DE,x
        .byte   $33
        .byte   $FB
        bmi     L148D
        rol     $2B1F
        rol     $28
        .byte   $27
        and     $23
        .byte   $22
        ora     $0B1F,y
        .byte   $1C
        sbc     $E118,y
L148D:  ora     $C7,x
        .byte   $12
        .byte   $AB
        .byte   $0F
        sty     $6A0C
        ora     #$47
        asl     $24
        .byte   $03
        brk
        brk
        .byte   $DC
        .byte   $FC

L149E:
        .byte   $3F
        .byte   $7C
        .byte   $70
        .byte   $40
        .byte   $7E
        .byte   $78
        .byte   $60

L14A5:
        .byte   $00
        .byte   $01
        .byte   $07
        .byte   $1F
        .byte   $00
        .byte   $03
        .byte   $0F

;;; Pixel list for throttle control indicator
PLThrottleIndicator:
        .byte   4, 0,0, 1,0, 0,1, 1,1

;;; Pixel list for flaps/trim/mixture indicator
PLFlapsTrimMixtureIndicator:
        .byte   4, 0,0, 2,0, 0,1, 2,1

;;; Map 3 character bits to pixels (doubled)

CharBitsToPixelsTable:
        .byte   %000000
        .byte   %000011
        .byte   %001100
        .byte   %001111
        .byte   %110000
        .byte   %110011
        .byte   %111100
        .byte   %111111

LeftMaskTable:
        .byte   %10000000
        .byte   %10000001
        .byte   %10000011
        .byte   %10000111
        .byte   %10001111
        .byte   %10011111
        .byte   %10111111

RightMaskTable:
        .byte   %11111110
        .byte   %11111100
        .byte   %11111000
        .byte   %11110000
        .byte   %11100000
        .byte   %11000000
        .byte   %10000000

;;; Character Bitmaps
;;; 16 bits encode 5x3 pixels; the bits are shifted out to the right
;;; 3 at a time. Covers ASCII code point $20 (' ') through $5A ('Z')

CharBitmapTable:
        .word $0000, $2092, $002d, $5f7d, $2492, $588d, $0000, $0012 ;  !"#$%&'
        .word $2922, $4494, $55d5, $25d2, $2400, $01c0, $2000, $4889 ; ()*+,-./
        .word $7b6f, $1249, $79cf, $73cf, $13ed, $73e7, $7be4, $124f ; 01234567
        .word $7bef, $13ef, $0410, $2410, $24c0, $0e38, $0000, $246a ; 89:;<=>?
        .word $0000, $5f6a, $6bae, $3923, $6b6e, $79e7, $49e7, $7b27 ; @ABCDEFG
        .word $5bed, $2492, $7249, $5bad, $7924, $5b7d, $57f5, $7b6f ; HIJKLMNO
        .word $49ef, $1f6f, $5def, $73e7, $2497, $7b6d, $256d, $5f6d ; PQRSTUVW
        .word $5aad, $24ad, $788f                                    ; XYZ

;;; NOTE: Some characters are repurposed for box drawing (e.g. ADF)
;;;       < is ┌
;;;       $ is │

;;; Inputs are 16-bit signed numbers; scales X by (Y / $7FFF)
;;; Input: ZP locations specified by X, Y
;;; Output: ZP location specified by A
;;; Uses $C2-C6, $A5, $A7
.proc ZPScale
        ;; $154A

        ;; $C2-C3 = $00,X
        ;; $C4-C5 = $00,Y
        ;; $00,A = (result of jsr ScaleC2ByC4)
        sta     $A5
        lda     $00,x
        sta     $C2
        lda     $01,x
        sta     $C3
        lda     $00,y
        sta     $C4
        lda     $01,y
        sta     $C5
        jsr     ScaleC2ByC4
        ldy     $A5
        sta     $00,y
        stx     $01,y
        rts

ScaleC2ByC4:
        lda     $C2             ; If $C2-C3 is zero...
        ora     $C3
        beq     L1575
        lda     $C4             ; Or $C4-C5 is zero...
        ora     $C5
        bne     L1577
L1575:  tax                     ; just return 0 in X
        rts

L1577:  lda     $C3
        eor     $C5
        tay
        lda     $C3
        bmi     L158E
        lda     #$FF
        eor     $C2
        sta     $C2
        lda     #$FF
        eor     $C3
        sta     $C3
        bmi     L159C
L158E:  lda     $C2
        bne     L159A
        dec     $C3
        bmi     L159A
        inc     $C3
        bmi     L159C
L159A:  dec     $C2
L159C:  lda     $C5
        bpl     :+
        lda     #$00
        sec
        sbc     $C4
        sta     $C4
        lda     #$00
        sbc     $C5
        sta     $C5
        bpl     :+
        dec     $C4
        dec     $C5
:
        lsr     $C2
        bcc     :+
        lda     #$00
:
        lsr     a
        ror     $C2
        bcs     :+
        adc     $C5
:
        lsr     a
        ror     $C2
        bcs     :+
        adc     $C5
:
        lsr     a
        ror     $C2
        bcs     :+
        adc     $C5
:
        lsr     a
        ror     $C2
        bcs     :+
        adc     $C5
:
        lsr     a
        ror     $C2
        bcs     :+
        adc     $C5
:
        lsr     a
        ldx     #$00
        stx     $A7
        lsr     $C2
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C2
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        lsr     $C3
        bcs     :+
        tax
        lda     $A7
        adc     $C4
        sta     $A7
        txa
        adc     $C5
:
        lsr     a
        ror     $A7
        cpy     #$00
        bpl     :+
        sta     $A8
        lda     #$00
        sec
        sbc     $A7
        sta     $A7
        lda     #$00
        sbc     $A8
:
        tax
        lda     $A7
        rts
.endproc
ScaleC2ByC4 := ZPScale::ScaleC2ByC4

;;; ============================================================

.proc ScaleC2ByAX
        sta     $C4
        stx     $C5
        jmp     ZPScale::ScaleC2ByC4
.endproc

.proc ScaleC2ByAXIntoC2
        sta     $C4
        stx     $C5
        jsr     ZPScale::ScaleC2ByC4
        sta     $C2
        stx     $C3
        rts
.endproc

;;; ============================================================

        ;; 16-bit signed division val1 / val2 ???
.proc L16A2
        val1 := $C2
        val2 := $C4

        stx     val1
        sta     val1+1
        eor     val2+1
        pha                     ; stash sign-mismatch for later

        ;; If `val1` is negative, invert it
        lda     val1+1
        bpl     :+
        lda     #$00
        sec
        sbc     val1
        sta     val1
        lda     #$00
        sbc     val1+1
        sta     val1+1
:
        ;; If `val2` is negative, invert it
        lda     val2+1
        bpl     :+
        lda     #$00
        sec
        sbc     val2
        sta     val2
        lda     #$00
        sbc     val2+1
        sta     val2+1
:
        ;; Now both `val1` and `val2` are positive...
        ldx     val1
        stx     $A7
        lda     val1+1
        ldy     #$0F            ; number of bits
L16D3:  tax
        lda     $A7
        sec
        sbc     val2
        sta     $A7
        txa
        sbc     val2+1
        bmi     L16EC
L16E0:  rol     val1
        rol     val1+1
        asl     $A7
        rol     a
        dey
        bne     L16D3
        beq     L1706
L16EC:  asl     val1
        rol     val1+1
        asl     $A7
        rol     a
        dey
        beq     L1706
        tax
        lda     $A7
        clc
        adc     val2
        sta     $A7
        txa
        adc     val2+1
        bmi     L16EC
        sec
        bcs     L16E0
L1706:  asl     val1
        rol     val1+1
        bpl     L1710
        dec     val1
        dec     val1+1
L1710:
        ;; Invert `val1` if signs mismatched
        pla
        bpl     :+
        lda     #$00
        sec
        sbc     val1
        sta     val1
        lda     #$00
        sbc     val1+1
        sta     val1+1
:
        ;; Add 35 to $32-$33 ???
        lda     $32
        clc
        adc     #$23
        sta     $32
        bcc     :+
        inc     $33
:
        rts
.endproc

;;; Divide A,X by 2, signed
;;; Trashes Y
.proc AXDiv2
        tay
        txa
        cmp     #$80
        ror     a
        tax
        tya
        ror     a
        rts
.endproc

;;; 16-bit unsigned multiply, A,X by $C2-C3
;;; Inputs: A,X, $C2-C3
;;; Output: A,X
;;; Uses $C4-C9
.proc MultiplyAXByC2
        sta     $C4
        stx     $C5
        lda     #$00
        sta     $C8
        sta     $C9
        ldx     #$10            ; bits
L1741:  lsr     $C3
        ror     $C2
        bcc     L1752
        lda     $C8
        clc
        adc     $C4
        sta     $C8
        lda     $C9
        adc     $C5
L1752:  ror     a
        sta     $C9
        ror     $C8
        ror     $C7
        ror     $C6
        dex
        bne     L1741
        lda     $C7
        ldx     $C8
        rts
.endproc

L1763:
        ldx     #$00
        jmp     L177B

L1768:
        ldx     #$00
        jmp     L1778

        and     #$80
        tax
        tya
        jmp     L177B

        and     #$80
        tax
        tya
L1778:  sec
        sbc     #$40
L177B:  ora     #$00
        bmi     L17A5
L177F:  cmp     #$40
        bmi     L17BC
        sta     $BC
        stx     $BD
        lda     #$00
        sec
        sbc     $BD
        tax
        lda     #$80
        sbc     $BC
        jsr     L17BC
        sta     $BC
        stx     $BD
        lda     #$00
        sec
        sbc     $BC
        tay
        lda     #$00
        sbc     $BD
        tax
        tya
        rts

L17A5:  eor     #$FF
        tay
        txa
        eor     #$FF
        tax
        tya
        inx
        bne     L177F
        clc
        adc     #$01
        bpl     L177F
        lda     #$7F
        ldx     #$FF
        jmp     L177F

L17BC:  asl     a
        tay
        txa
        beq     L17DA
        and     #$7F
        bne     L17E1
        lda     L141A,y
        clc
        adc     L141C,y
        sta     $BC
        lda     L141B,y
        adc     L141D,y
        lsr     a
        tax
        lda     $BC
        ror     a
        rts

L17DA:  lda     L141A,y
        ldx     L141B,y
        rts

L17E1:  lda     L141A,y
        sta     $BC
        lda     L141B,y
        sta     $BD
        lda     L141C,y
        sec
        sbc     $BC
        sta     $C2
        lda     L141D,y
        sbc     $BD
        sta     $C3
        txa
        lsr     a
        tax
        lda     #$00
        jsr     ScaleC2ByAX
        clc
        adc     $BC
        tay
        txa
        adc     $BD
        tax
        tya
        rts

L180C:  jsr     L1818
        pha
        tya
        rol     a
        tya
        ror     a
        tay
        pla
        ror     a
        rts

L1818:  tya
        sta     $A5
        bpl     L1822
        sec
        sbc     #$01
        bmi     L1824
L1822:  eor     #$FF
L1824:  sta     $C4
        txa
        bpl     L1832
        eor     #$FF
        clc
        adc     #$01
        bpl     L1832
        lda     #$7F
L1832:  sta     $C2
        ror     $C4
        bcc     L183A
        lda     #$00
L183A:  lsr     a
        ror     $C4
        bcs     L1841
        adc     $C2
L1841:  lsr     a
        ror     $C4
        bcs     L1848
        adc     $C2
L1848:  lsr     a
        ror     $C4
        bcs     L184F
        adc     $C2
L184F:  lsr     a
        ror     $C4
        bcs     L1856
        adc     $C2
L1856:  lsr     a
        ror     $C4
        bcs     L185D
        adc     $C2
L185D:  lsr     a
        ror     $C4
        bcs     L1864
        adc     $C2
L1864:  lsr     a
        ror     $C4
        sta     $C5
        txa
        eor     $A5
        bpl     L187B
        lda     #$00
        sec
        sbc     $C4
        tax
        lda     #$00
        sbc     $C5
        tay
        txa
        rts

L187B:  ldy     $C5
        lda     $C4
        rts


L1880:  eor     #$FF
        tay
        txa
        eor     #$FF
        tax
        iny
        tya
        bne     L188C
        inx
L188C:  rts

;;; ============================================================

;;; 188D: UpdateAltimeterIndicator
.proc UpdateAltimeterIndicator
        lda     L0A12
        tax
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        tay
        lda     ($B8),y
        sta     $BC
        iny
        lda     ($B8),y
        sec
        sbc     $BC
        tay
        txa
        and     #$0F
        asl     a
        asl     a
        asl     a
        tax
        jsr     L180C
        asl     a
        sta     $C2
        tya
        rol     a
        clc
        adc     $BC
        sta     $C3
        rts

Init2:  ldx     #$00            ; needle index
        lda     IndicatorDialNeedleLastValue,x
        cmp     $28
        bne     L18C0
        rts

L18C0:  jsr     DrawIndicatorDialNeedle
        ldx     #$01            ; needle index
        lda     IndicatorDialNeedleLastValue,x
        jsr     DrawIndicatorDialNeedle
Init:   lda     $29
        ldx     #$01            ; needle index
        jsr     DrawIndicatorDialNeedleHelper
        lda     $28
        ldx     #$00
.endproc

;;; ============================================================

;;; some common code

DrawIndicatorDialNeedleHelper:
        sta     IndicatorDialNeedleLastValue,x
        jsr     DrawIndicatorDialNeedle

HandyRTS:
        rts

;;; ============================================================

.proc UpdateAirspeedIndicator
        lda     $FB
        lsr     a
        bcc     HandyRTS
        ldx     #$02
        lda     IndicatorDialNeedleLastValue,x
        cmp     L0A33
        beq     HandyRTS
        sta     $B6
        jsr     L190C

        lda     L0A33
        sec
        sbc     $B6
        tax
        cpx     #$80
        ror     a
        cpx     #$80
        ror     a
        tax
        bpl     L1902
        dex
L1902:  inx
        txa
        clc
        adc     $B6
Init:   ldx     #$02            ; needle index
        sta     IndicatorDialNeedleLastValue,x

L190C:  cmp     #$58
        bcc     L1912
        sbc     #$58
L1912:  jmp     DrawIndicatorDialNeedle
.endproc

;;; ============================================================

.proc UpdateVerticalSpeedIndicator
        ldx     #$03            ; needle index
        lda     IndicatorDialNeedleLastValue,x
        cmp     $2A
        beq     HandyRTS
        php
        pha
        jsr     DrawIndicatorDialNeedle
        pla
        plp
        bcc     L192A
        sec
        sbc     #$02
L192A:  clc
        adc     #$01
Init:   ldx     #$03            ; needle index
        bne     DrawIndicatorDialNeedleHelper
        ;; fall through to `DrawIndicatorDialNeedle`
.endproc

;;; ============================================================

;;; Generic indicator logic
;;; Inputs:
;;;     A = ???
;;;     X = needle index (0=alt1, 1=alt2, 2=airspeed, 3=vertical, 4=ADF)

.proc DrawIndicatorDialNeedle
        sta     IndicatorDialNeedlePos
        stx     IndicatorDialNeedleIndex           ; needle index

        NeedlePosTable := $94


        ;; Defaults for thin needle
        lda     #<IndicatorDialThinNeedleTable
        sta     NeedlePosTable
        lda     #>IndicatorDialThinNeedleTable
        sta     NeedlePosTable+1

        lda     IndicatorDialNeedleStyle,x
        beq     L194C
        ;; thick needle
        lda     #<IndicatorDialThickNeedleTable
        sta     NeedlePosTable
        lda     #>IndicatorDialThickNeedleTable
        sta     NeedlePosTable+1

L194C:
        lda     IndicatorDialNeedleX,x
        sta     $A5
        lda     IndicatorDialNeedleY,x
        sta     $A7

        ;; Determine quadrant
        lda     IndicatorDialNeedlePos
        cmp     #$42
        bcs     L198F
        cmp     #$2C
        bcs     L1980
        cmp     #$16
        bcs     L1971

        jsr     SetUpForINXAndADC
        jsr     SetUpForDEC
        lda     IndicatorDialNeedlePos
        jmp     L199B

L1971:  jsr     SetUpForDEXAndSBC
        jsr     SetUpForDEC
        lda     #$2C
        sec
        sbc     IndicatorDialNeedlePos
        jmp     L199B

L1980:  jsr     SetUpForDEXAndSBC
        jsr     SetUpForINC
        lda     IndicatorDialNeedlePos
        sec
        sbc     #$2C
        jmp     L199B

L198F:  jsr     SetUpForINXAndADC
        jsr     SetUpForINC
        lda     #$58
        sec
        sbc     IndicatorDialNeedlePos

        data_ptr := $96

        ;; Convert adjusted pos into an index
L199B:  asl     a
        tay
        lda     (NeedlePosTable),y
        sta     data_ptr
        iny
        lda     (NeedlePosTable),y
        sta     data_ptr+1
        jmp     L19F6

SetUpForINXAndADC:
        lda     #OPC_INX
        sta     L1A32
        lda     $A5
        clc
        adc     #$FE
        sta     $E6
        lda     #OPC_CLC
        sta     L1A01
        lda     #OPC_ADC_izy
        sta     L1A04
        dec     $A5
        rts

SetUpForDEXAndSBC:
        lda     #OPC_DEX
        sta     L1A32
        lda     $A5
        clc
        adc     #$EC
        sta     $E6
        lda     #OPC_SEC
        sta     L1A01
        lda     #OPC_SBC_izy
        sta     L1A04
        inc     $A5
        rts

SetUpForDEC:
        lda     #OPC_DEC_zp
        sta     L1A38
        lda     $A7
        clc
        adc     #$EC
        sta     $E7
        inc     $A7
        rts

SetUpForINC:
        lda     #OPC_INC_zp
        sta     L1A38
        dec     $A7
        lda     $A7
        sta     $E7
        rts

;;; Used to draw instrument indicators - processes a table of rows/pixels

        data_offset := $E7

L19F6:  ldy     #$00
        sty     data_offset
L19FA:  ldy     data_offset
        lda     (data_ptr),y
        bpl     L1A01           ; high bit as sentinel
        rts

L1A01:  clc                     ; self-modified
        lda     $A5
L1A04:  adc     ($96),y         ; self-modified
        sta     $E6
        iny
        lda     ($96),y
        sta     L0A3D
        iny
        sty     $E7
        ldx     $A7
        lda     HiresTableLo,x
        sta     $9A
        sta     $BA
        lda     HiresTableHi,x
        sta     $9B
        clc
        adc     HiresPageDelta
        sta     $BB
        ldx     $E6
L1A26:  ldy     HiresPixelToByteTable,x
        lda     HiresPixelToBitMaskTable,x         ; mask
        eor     ($9A),y
        sta     ($9A),y
        sta     ($BA),y
L1A32:  inx                     ; self-modified
        dec     L0A3D
        bne     L1A26
L1A38:  inc     $A7             ; self-modified
        jmp     L19FA
.endproc

;;; ============================================================

.proc UpdateElevatorPositionIndicator
        pha
        lda     L0A42
        jsr     L1A48
        pla
Init:   sta     L0A42
L1A48:  ldx     #$64
        clc
        adc     #$9F
        tay
        lda     #<PLElevatorControlPositionIndicator
        sta     PixelListData
        lda     #>PLElevatorControlPositionIndicator
        jmp     DrawPixelListHelper
.endproc

;;; ============================================================

.proc UpdateAileronPositionIndicator
        pha
        lda     L0A43
        jsr     L1A62
        pla
Init:   sta     L0A43
L1A62:  clc
        adc     #$55
        tax
        ldy     #$94
        ;; fall through to `DrawAileronOrRudderIndicator`
.endproc

DrawAileronOrRudderIndicator:
        lda     #<PLAileronAndRudderIndicators
        sta     PixelListData
        lda     #>PLAileronAndRudderIndicators
DrawPixelListHelper:
        sta     PixelListData+1
        lda     #$00
        sta     PixelListXHi
        jmp     DrawPixelList

;;; ============================================================

.proc UpdateRudderPositionIndicator
        pha
        lda     L0A45
        jsr     L1A83
        pla
Init:   sta     L0A45
L1A83:  clc
        adc     #$55
        tax
        ldy     #$BC            ; rudder
        jmp     DrawAileronOrRudderIndicator
.endproc

;;; ============================================================

.proc UpdateThrottleIndicator
        pha
        lda     L0A46
        jsr     L1A97
        pla
Init:   sta     L0A46
L1A97:  eor     #$FF
        clc
        clc                     ; ???
        adc     #$10
        ldx     #$CA
        clc
        adc     #$AF
        tay
        lda     #<PLThrottleIndicator
        sta     PixelListData
        lda     #>PLThrottleIndicator
        jmp     DrawPixelListHelper
.endproc

;;; ============================================================

.proc UpdateFlapsIndicator
        pha
        lda     L0A47
        jsr     L1AB7
        pla
Init:   sta     L0A47
L1AB7:  ldx     #$C8
        clc
        adc     #$66
        jmp     L1AE2
.endproc

.proc UpdateTrimIndicator
        pha
        lda     L0A48
        jsr     L1ACA
        pla
Init:   sta     L0A48
L1ACA:  ldx     #$C8
        clc
        adc     #$8E
        jmp     L1AE2
.endproc

.proc UpdateMixtureControlIndicator
        .refto UpdateMixtureControlIndicator

        pha
        lda     L0A49
        jsr     L1ADD
        pla
Init:   sta     L0A49
L1ADD:  ldx     #$D0
        clc
        adc     #$AF
        ;; fall through to `L1AE2`
.endproc

L1AE2:  tay
        lda     #<PLFlapsTrimMixtureIndicator
        sta     PixelListData
        lda     #>PLFlapsTrimMixtureIndicator
        jmp     DrawPixelListHelper

;;; ============================================================

.proc UpdateSlipSkidIndicator
        cmp     L0A44
        bne     L1AF2
        rts

L1AF2:  pha
        lda     L0A44
        jsr     L1AFD
        pla
Init:   sta     L0A44
L1AFD:  clc
        adc     #$0E
        tax
        ldy     #$B4
        lda     #<PLSlipSkidIndicator
        sta     PixelListData
        lda     #>PLSlipSkidIndicator
        jmp     DrawPixelListHelper
.endproc

;;; ============================================================

.scope UpdateFuelTankGauges
Left:
        lda     L0994
        lsr     a
        cmp     L0A4A
        bne     L1B16
L1B15:  rts

L1B16:  pha
        lda     L0A4A
        jsr     L1B3E
        pla
InitLeft:
        sta     L0A4A
        jmp     L1B3E

Right:
        lda     L0997
        lsr     a
        cmp     L0A4B
        beq     L1B15
        pha
        lda     L0A4B
        clc
        adc     #$1E
        jsr     L1B3E
        pla
InitRight:
        sta     L0A4B
        clc
        adc     #$1E            ; Tank 2 X offset
L1B3E:  clc
        adc     #$E8            ; Tank 1 X position
        tax
        lda     #$00
        adc     #$00
        sta     PixelListXHi
        ldy     #$A2            ; Fuel tank Y position
        ;; fall through to `DrawFuelOrOilGauge`
.endscope

.proc DrawFuelOrOilGauge
        lda     #<PLFuelAndOilGauges
        sta     PixelListData
        lda     #>PLFuelAndOilGauges
        sta     PixelListData+1
        jmp     DrawPixelList
.endproc

;;; ============================================================

.scope UpdateOilTempAndPressureGauges
Temp:
        lda     L099C
        cmp     L0A4C
        bne     L1B5F
L1B5E:  rts

L1B5F:  pha
        lda     L0A4C
        jsr     L1B86
        pla
InitTemp:
        sta     L0A4C
        jmp     L1B86

Pressure:
        lda     L099D
        cmp     L0A4D
        beq     L1B5E
        pha
        lda     L0A4D
        clc
        adc     #$1E
        jsr     L1B86
        pla
InitPressure:
        sta     L0A4D
        clc
        adc     #$1E            ; Oil pressure X position
L1B86:  clc
        adc     #$E8            ; Oil temp X position
        tax
        lda     #$00
        adc     #$00
        sta     PixelListXHi
        ldy     #$AA            ; Oil Y position
        jmp     DrawFuelOrOilGauge
.endscope

;;; ============================================================

PLFuelTankIndicator:
        .byte   4, 0,0, 3,0, 0,2, 3,2

.proc UpdateFuelTankIndicator
        ldx     #$FB
        ldy     #$A4
        lda     #<PLFuelTankIndicator
        sta     PixelListData
        lda     #>PLFuelTankIndicator
        jmp     DrawPixelListHelper
.endproc

;;; ============================================================

;;; Inputs: $9C points at data; first byte is length (copied to $F1),
;;;         rest is X,Y pixel offsets (single byte each)
;;;         X = x pos (low byte)
;;;         Y = y pos
;;;         PixelListXHi = x pos (high byte)

.proc DrawPixelList
        data_ptr    := PixelListData
        data_offset := L0A50
        data_count  := $F1
        hires_ptr1  := $8E
        hires_ptr2  := $BA
        x_pos       := L0A4E
        y_pos       := L0A4F

        x_hi        := PixelListXHi ; hi byte of X coord

        stx     x_pos
        sty     y_pos
        ldy     #$00
        lda     (data_ptr),y
        sta     data_count
        iny
        sty     data_offset

loop:
        ldy     data_offset
        lda     (data_ptr),y    ; X coord in data
        clc
        adc     x_pos
        tax                     ; low byte of X
        lda     x_hi
        adc     #$00
        sta     x_hi            ; hi byte of X
        iny
        lda     (data_ptr),y    ; Y coord in data
        iny
        sty     data_offset
        clc
        adc     y_pos
        tay
        lda     HiresTableHi,y
        sta     hires_ptr1+1
        clc                     ; TODO: Just EOR with %01100000
        adc     HiresPageDelta
        sta     hires_ptr2+1
        lda     HiresTableLo,y
        sta     hires_ptr1
        sta     hires_ptr2

        ;; x > 256
        lda     x_hi
        beq     low
        ldy     HiresPixelToByteTable+256,x
        lda     (hires_ptr1),y
        eor     HiresPixelToBitMaskTable+242,x
        jmp     write
low:
        ldy     HiresPixelToByteTable,x
        lda     (hires_ptr1),y
        eor     HiresPixelToBitMaskTable,x
write:
        sta     (hires_ptr1),y
        sta     (hires_ptr2),y
        dec     data_count
        bne     loop
        rts
.endproc

;;; ============================================================

;;; Draw message to both hires screens
;;; A,X = message (row, col, null-terminated string)

.proc DrawMessage
        msg_ptr := $BE
        color_mask1 = $90
        color_mask2 = $91
        msg_row = $C0
        msg_col = $C1

        ;; Entry point used for North/East in Slew Mode
        sta     msg_ptr
        stx     msg_ptr+1
        clc
        adc     #$02
        bcc     :+
        inx
:       sta     $B8             ; points at string
        stx     $B9
        ldy     #$00
        lda     $B7
        bmi     :+
        lda     #$20
        sta     ($B8),y
        bne     L1C39           ; always

:       lda     #$2D
        sta     ($B8),y
        lda     #$00
        sec
        sbc     $B6
        sta     $B6
        lda     #$00
        sbc     $B7
        sta     $B7
        bmi     L1C67

        ;; Prepare 5-digit number for display
L1C39:  LDAX    #10000
        ldy     #$01
        jsr     DivideByAXAndSetDigitY
        LDAX    #1000
        ldy     #$02
        jsr     DivideByAXAndSetDigitY
        LDAX    #100
        ldy     #$03
        jsr     DivideByAXAndSetDigitY
        LDAX    #10
        ldy     #$04
        jsr     DivideByAXAndSetDigitY
        lda     ValueForString
        ora     #'0'
        ldy     #$05
        sta     ($B8),y

        bne     L1C70
L1C67:  lda     #$2D
        ldy     #$05
L1C6B:  sta     ($B8),y
        dey
        bne     L1C6B
L1C70:  jmp     L1CA3

;;; ============================================================

;;; Partial uint16-to-string; calculate high digit for $B6-7 / A,X
;;; Inputs: A,X = divisor (e.g. 100)
;;;         Y = index of digit to set
;;;         $B6-B7 = value
;;;         $B8 = ptr to string
;;; Output: Character at ($B8),Y set; $B6 has remainder
;;; Uses: $A5-$A7

.proc DivideByAXAndSetDigitY
        sta     $A5
        stx     $A6
        sty     $A7

        ldx     #'0'
        lda     z:ValueForString
loop:   sec
        sbc     $A5
        tay
        lda     z:ValueForString+1
        sbc     $A6
        bmi     L1C90
        inx
        sta     z:ValueForString+1
        sty     z:ValueForString
        tya
        jmp     loop

L1C90:  ldy     $A7
        txa
        sta     ($B8),y
        rts
.endproc

;;; ============================================================

;;; Color mask is white
DrawMessageWhite:
        sta     msg_ptr
        stx     msg_ptr+1
L1C9A:  lda     #$7F
        tax
        bne     L1CAD           ; always

;;; Color mask is orange
DrawMessageOrange:
        sta     msg_ptr
        stx     msg_ptr+1
L1CA3:  lda     #$D5
        ldx     #$AA
        bne     L1CAD           ; always

;;; Unused ???
        lda     #$AA
        ldx     #$D5

L1CAD:  sta     color_mask1
        stx     color_mask2
        jsr     GetMessageColRow
        sta     msg_row
        stx     msg_col
        jmp     NextCharacter

;;; Assuming pointer is at start of message, returns A=row, X=col
.proc GetMessageColRow
        jsr     GetMessageByte
        pha
        jsr     GetMessageByte
        tax
        pla
        rts
.endproc

;;; Returns byte from message, incrementing `msg_ptr`
.proc GetMessageByte
        ldy     #$00
        lda     (msg_ptr),y
        inc     msg_ptr
        bne     :+
        inc     msg_ptr+1
:       rts
.endproc

;;; A = character ASCII code - $20

DrawCharacter:
        char_word = $A5
        char_rows = $A7

        asl     a               ; *= 2
        tax
        lda     CharBitmapTable,x
        sta     char_word
        lda     CharBitmapTable+1,x
        sta     char_word+1
        lda     #5              ; rows
        sta     char_rows

        ldx     msg_col
        ldy     PixelToBitNumberTable,x
        ldx     L13EE,y
        stx     $A9
        lda     LeftMaskTable,x
        sta     $AD
        lda     RightMaskTable,x
        sta     $AE
        ldy     msg_col
        lda     ColorPixelToByteTable,y
        lsr     a
        lda     color_mask1
        ldy     color_mask2
        bcc     L1D06

        sta     $BC
        sty     $BD
        bne     L1D0A           ; always
L1D06:
        sta     $BD
        sty     $BC
L1D0A:

        hires_ptr1 := $8E
        hires_ptr2 := $3C

        ldy     msg_row
        ldx     msg_col
        lda     HiresTableHi,y
        sta     hires_ptr1+1
        clc                     ; TODO: Just EOR with %01100000
        adc     #$20
        cmp     #$60
        bcc     :+
        sbc     #$40
:       sta     hires_ptr2+1
        lda     HiresTableLo,y
        sta     hires_ptr1
        sta     hires_ptr2
        ldy     ColorPixelToByteTable,x

        ;; Shift 3 bits out
        lda     #$00
        lsr     char_word+1
        ror     char_word
        rol     a
        lsr     char_word+1
        ror     char_word
        rol     a
        lsr     char_word+1
        ror     char_word
        rol     a
        tax
        lda     CharBitsToPixelsTable,x
        ldx     #$00
        stx     $AB
        ldx     $A9
        jmp     L1D49

;;; Inner loop of text drawing

L1D46:  asl     a
        rol     $AB
L1D49:  dex
        bpl     L1D46
        clc
        adc     #$80
        ora     #$80
        and     $BC
        sta     $AC
        lda     $AB
        rol     a
        ora     #$80
        and     $BD
        sta     $AB
        lda     $AD
        and     (HiresRowPtr),y
        ora     $AC
        sta     (HiresRowPtr),y
        sta     ($3C),y
        iny
        lda     $AE
        and     (HiresRowPtr),y
        ora     $AB
        sta     (HiresRowPtr),y
        sta     ($3C),y
        inc     msg_row
        dec     $A7
        bne     L1D0A
        lda     msg_col
        clc
        adc     #$04
        sta     msg_col
        lda     msg_row
        sec
        sbc     #$05
        sta     msg_row

NextCharacter:
        jsr     GetMessageByte
        sec
        sbc     #$20
        bmi     L1DA7           ; end of string
        jmp     DrawCharacter

;;; Draws multiple message, until sentinel is reached
DrawMultiMessage:
        sta     msg_ptr
        stx     msg_ptr+1
L1D96:  ldy     #$00
        lda     (msg_ptr),y
        bne     L1DA1
        iny
        lda     (msg_ptr),y
        beq     L1DA7
L1DA1:  jsr     L1C9A
        jmp     L1D96

L1DA7:  rts
.endproc

DrawMessageOrange := DrawMessage::DrawMessageOrange
DrawMessageWhite := DrawMessage::DrawMessageWhite
DrawMultiMessage := DrawMessage::DrawMultiMessage
DivideByAXAndSetDigitY := DrawMessage::DivideByAXAndSetDigitY

;;; Clear viewport on both hires screens
.proc ClearViewportsToBlack
        ptr1 := $8E
        ptr2 := $3C

        ;; Loop over all viewport rows
        ldx     #0              ; row

        ;; Hires table may be set for page1 or page2;
        ;; set ptr1 to current and ptr2 to alt regardless
loop:   lda     HiresTableHi,x
        sta     ptr1+1
        clc                     ; TODO: Just EOR with %01100000
        adc     #$20
        cmp     #$60
        bcc     :+
        sbc     #$40
:       sta     ptr2+1
        lda     HiresTableLo,x
        sta     ptr1
        sta     ptr2

        ;; Clear current row to black
        ldy     #39
        lda     #0
:       sta     (ptr1),y
        sta     (ptr2),y
        dey
        bpl     :-

        ;; Next row
        inx
        cpx     #100            ; viewport rows
        bne     loop

        rts
.endproc

;;; 1DD2 ???

        bmi     :+
        sec
        .byte   $02
:       ldx     #$02
        .byte   $A7
        .byte   $02
        ldy     $B102
        .byte   $02
        .byte   $DF
        .byte   $07
        txs
        asl     $0F5A
        .byte   $1A
        bpl     $1E01
        ora     ($32),y
        ora     ($24),y
        .byte   $12
        .byte   $3C
        .byte   $12
        iny
        .byte   $12
        .byte   $54
        .byte   $13
        inc     $F613
        .byte   $13
        .byte   $04
        .byte   $14
        .byte   $12
        .byte   $14
        asl     $14,x
        .byte   $12
        .byte   $14
        .byte   $13
        .byte   $14
        brk
        .byte   $20
        brk

L1E03:  .byte   $05
L1E04:  brk
        brk
        brk
        brk

BootSlot:
        .byte   $60     ; high nibble = boot slot

        brk
        .byte   $20
L1E0B:  .byte   $20
L1E0C:  ora     ($D9,x)
        brk
        brk
        brk
        sta     ($00),y
        .byte   $8F
        brk
        sta     ($00),y
        cpx     $00
        .byte   $8F
        brk
        .byte   $DF
        brk
        .byte   $DF
        brk
        .byte   $DF
        brk
        .byte   $DF
        brk
        stx     $8F00
        brk
        .byte   $DF
        brk
        .byte   $8B
        brk
        stx     $E200
        brk
        stx     $DC00
        brk
        dec     $DE00,x
        brk
        .byte   $8B
        brk
        sta     $8C00
        brk
        dec     $8D00,x
        brk
        dec     $DB00,x
        brk
        dec     $DE00,x
        brk
        sta     $8A00
        brk
        cmp     $8D00,x
        brk
        .byte   $8B
        brk
        .byte   $DF
        brk
        stx     $97,y
        txs
        .byte   $9B
        sta     $9F9E,x
        ldx     $A7
        .byte   $AB
        ldy     $AEAD
        .byte   $AF
        .byte   $B2
        .byte   $B3
        ldy     $B5,x
        ldx     $B7,y
        lda     $BBBA,y
        ldy     $BEBD,x
        .byte   $BF
        .byte   $CB
        cmp     $CFCE
        .byte   $D3
        dec     $D7,x
        cmp     $DBDA,y
        .byte   $DC
        cmp     $DFDE,x
        sbc     $E6
        .byte   $E7
        sbc     #$EA
        .byte   $EB
        cpx     $EEED
        .byte   $EF
        .byte   $F2
        .byte   $F3
        .byte   $F4
        sbc     $F6,x
        .byte   $F7
        sbc     $FBFA,y
        .byte   $FC
        sbc     $FFFE,x
        ora     ($30,x)
        plp
        bit     $20
        asl     $1C1D,x
        .byte   $1C
        .byte   $1C
        .byte   $1C
        .byte   $1C
        bvs     $1ECF
        rol     $22
        .byte   $1F
        asl     $1C1D,x
        .byte   $1C
        .byte   $1C
        .byte   $1C
        .byte   $1C

;;; Jump table, patched at runtime (48k vs 64k???)

L1EAD:  jmp     $203A           ; becomes D3D0
L1EB0:  jmp     $2015           ; becomes D3D3
L1EB3:  jmp     $20AF           ; becomes D3D6
L1EB6:  jmp     $2122           ; becomes D3D9
L1EB9:  jmp     $238A           ; becomes D3DC
L1EBC:  jmp     $2000           ; becomes D3DF

        sec
        rts

L1EC1:  jmp     $2578           ; becomes D3E2

L1EC4:  clc
        rts

L1EC6:  jsr     SwapZP
        lda     #$00
        sta     $53
        lda     $1E01
        lsr     a
        lsr     a
        clc
        adc     #$01
        asl     a
        asl     a
        asl     a
        rol     $53
        asl     a
        rol     $53
        ldy     $53
        tax
        tya
        lsr     a
        sta     $5A
        txa
        ror     a
        jsr     ReadBlocks

;;; ============================================================
;;; Zero page preservation code

.proc SwapZP
        ldx     #$1F
:       lda     $40,x
        ldy     ZPSwapStorage,x
        sta     ZPSwapStorage,x
        sty     $40,x
        dex
        bpl     :-
        clc
        rts
.endproc

;;; ============================================================

.proc ReadBlocks
        sta     $5E
        lda     #>$2600
        sta     $45
        lda     #<$2600
        sta     $44
        lda     #$10
        sta     $53
L1F08:  ldy     $5A
        cpy     $59
        beq     L1F2C
        sty     $59
        ldx     $5E
        inx
        stx     $5F
        lda     $45
        pha
        lda     $44
        pha
        ldy     $5A
        ldx     ReadBlockDataBuffer+512,y
        lda     ReadBlockDataBuffer+768,y
        jsr     DoReadBlockWithStandardDataBuffer
        pla
        sta     $44
        pla
        sta     $45
L1F2C:  ldy     $5E
        inc     $5E
        bne     L1F34
        inc     $5A
L1F34:  ldx     ReadBlockDataBuffer,y
        lda     ReadBlockDataBuffer+256,y
        pha
        ora     ReadBlockDataBuffer,y
        tay
        pla
        dey
        iny
        beq     L1F52
        jsr     DoReadBlock
L1F47:  inc     $45
        inc     $45
        dec     $53
        dec     $53
        bne     L1F08
        rts

L1F52:  sta     ($44),y
        inc     $45
        sta     ($44),y
        dec     $45
        iny
        bne     L1F52
        beq     L1F47

DoReadBlockWithStandardDataBuffer:
        ldy     #<ReadBlockDataBuffer
        sty     $44
        ldy     #>ReadBlockDataBuffer
        sty     $45

        ;; X,A = block number, $44-45 = data buffer
DoReadBlock:
        ldy     #$01            ; ReadBlock
        sty     SPCommandNumber
        stx     RBBlockNumber
        sta     RBBlockNumber+1
        jsr     L1F85
        lda     $45
        sta     RBDataBuffer+1
        lda     $44
        sta     RBDataBuffer

        jsr     $C70D           ; SmartPort entry point (self-modified)
SPCommandNumber:
        .byte   1               ; command (ReadBlock)
        .addr   RBParams        ; params

L1F85:  lda     #$04
        sta     $49

;;; Swap A bytes between page in $49 and stash at $FF00
;;; But the ptr advances mysteriously. ???
L1F89:  ldx     #$00
        stx     $48
        sta     $4A
L1F8F:  ldy     #$78
L1F91:  lda     ($48),y
        pha
        lda     $FF00,x
        sta     ($48),y
        pla
        sta     $FF00,x
        inx
        tya
        eor     #$80
        tay
        bmi     L1F91
        iny
        bpl     L1F91
        inc     $49
        dec     $4A
        bne     L1F8F
        rts

        ;; ReadBlock parameter list
RBParams:
        .byte   $03             ; parameter count
        .byte   $01             ; unit number
RBDataBuffer:
        .addr   $95DF           ; data buffer (lo, hi)
RBBlockNumber:
        .byte   $02, $00, $00   ; block number (lo, mid, hi)
.endproc

;;; Stash
L1F89 := ReadBlocks::L1F89

;;; ============================================================

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk

L1FC4:  lda     L1E03
        sta     $A5
        lda     L1E04
        sta     $A6
        lda     #$00
        sta     $A7
        lda     L1E0C
        asl     a
        asl     a
        adc     #$26
        sta     $A8
        ldx     #$04
        ldy     #$00
        rts

L1FE0:  lda     $1E01
        cmp     #$88
        bcs     L1FFB
        lsr     a
        php
        lsr     a
        .byte   $8D
        .byte   $0B
        asl     a:$A9,x
        rol     a
        plp
        rol     a
        sta     L1E0C
        inc     L1E0B
        asl     L1E0B
L1FFB:  rts

        brk
        brk
        brk
        brk

        .assert * = $2000, error, "EOF mismatch"

        .byte   $80
        .incbin "../res/loading_panel.bin", 1, 1535
