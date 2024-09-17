        .org $d300

;;; Some functionality that is only present in the "64k" mode
;;; of the original FS2:
;;; * War Report
;;; * North and East readouts in slew mode


L002D           := $002D
L0045           := $0045
L00BA           := $00BA

        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $76
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $76
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $76
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $76
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $76

LD3D0:  jmp     LD41F
        .refto LD3D0

LD3D3:  jmp     LD3FA

        jmp     LD494

LD3D9:  jmp     LD507

        jmp     LD76F

        jmp     LD3E5

LD3E2:  jmp     LD95D

LD3E5:  lda     #$00
        sta     $1E09
        lda     #$20
        sta     $1E0B
        bit     LD972
        ldx     $1E08
        lda     $D088,x
        clc
        rts

LD3FA:  jsr     LD459
        bcs     LD41E
        jsr     L1FC4
LD402:  lda     ($A5),y
        sta     ($A7),y
        iny
        bne     LD402
        inc     $A6
        inc     $A8
        inc     $1E04
        dex
        bne     LD402
        jsr     LD48B
        jsr     LD5C8
        lda     #$00
        sta     $1E09
LD41E:  rts

LD41F:  jsr     LD459
        bcs     LD458
        jsr     L1FC4
        stx     $A0
        ldx     #$00
LD42B:  lda     $A6
        and     #$F0
        cmp     #$C0
        beq     LD44A
        lda     ($A7,x)
        sta     ($A5,x)
        inc     $A7
        bne     LD43D
        inc     $A8
LD43D:  inc     $A5
        bne     LD443
        inc     $A6
LD443:  iny
        bne     LD42B
        dec     $A0
        bne     LD42B
LD44A:  jsr     LD48B
        lda     $A5
        sta     $1E03
        lda     $A6
        sta     $1E04
        clc
LD458:  rts

LD459:  jsr     L1FE0
        bcs     LD484
LD45E:  jsr     L1EC6
        lda     #$FF
        sta     $1E09
        rts

        .byte   $02
        sta     $B6
LD46A:  jsr     LD7B5
        bcc     LD47D
        dec     $B6
        beq     LD477
        bpl     LD46A
        bmi     LD484
LD477:  jsr     LD95D
        jmp     LD46A

LD47D:  lda     #$FF
        sta     $1E09
        clc
        rts

LD484:  lda     #$00
        sta     $1E09
        sec
        rts

LD48B:  inc     $1E01
        bne     LD493
        inc     $1E02
LD493:  rts

LD494:  clc
        rts

        .res    95, 0

LD4F5:  lda     $1E01
        asl     a
        clc
        adc     #$02
        cmp     #$46
        bcs     LD506
        sta     $1E0B
        jsr     LD45E
LD506:  rts

LD507:  jsr     LD4F5
        bcs     LD52C
        jsr     LD52D
        lda     #$00
        sta     $1E09
        jsr     LD5C8
        bcs     LD52C
        inc     $1E01
        bne     LD521
        inc     $1E02
LD521:  lda     $A5
        sta     $1E03
        lda     $A6
        sta     $1E04
        clc
LD52C:  rts

LD52D:  jsr     L1FC4
        lda     #$60
        sta     $A7
        lda     #$3B
        sta     $A8
        sty     $B6
LD53A:  lda     ($A5),y
        eor     $B6
        sta     $B6
        lda     ($A5),y
        lsr     a
        ora     #$AA
        sta     ($A7),y
        inc     $A7
        bne     LD54D
        inc     $A8
LD54D:  lda     ($A5),y
        ora     #$AA
        sta     ($A7),y
        inc     $A7
        bne     LD559
        inc     $A8
LD559:  inc     $A5
        bne     LD55F
        inc     $A6
LD55F:  lda     $A8
        cmp     #$3E
        bcc     LD53A
        lda     $B6
        ora     #$AA
        sta     $3B5F
        lda     $B6
        lsr     a
        ora     #$AA
        sta     $3B5E
        rts

ReadBlockDataBuffer:
        .res    506, 0
LD5C8 := ReadBlockDataBuffer + 83 ; executable!

LD76F:
        .res    70, 0
LD7B5:
        .res    424, 0
LD95D:
        .res    21, 0
LD972:
        .res    115, 0

LD9E5:  .byte   $01
LD9E6:  brk
LD9E7:  brk
LD9E8:  brk
LD9E9:  .byte   $FF

mD9EA:  MESSAGE $88, $67, " 287", sD9EA

LD9F1:  lda     $097B
        beq     LDA52
        lsr     LD9E5
        bcc     LD9FE
        jsr     LDB28
LD9FE:  lda     LD9E6
        beq     LDA52
        ldx     #$00
        jsr     LA23D
        lda     $B6
        sbc     $70
        sta     $C2
        sta     $BE
        lda     $B7
        sbc     $71
        clc
        adc     #$40
        clc
        adc     $0849
        clc
        adc     $0847
        lsr     a
        sta     $C3
        sta     $BF
        ror     $C2
        ror     $BE
        LDAX    #$58
        jsr     ScaleC2ByAX
        eor     #$FF
        clc
        adc     #$58
        ldx     LD9E9
        bmi     LDA52
        cmp     LD9E9
        sta     LD9E9
        beq     LDA52
        txa
        ldx     #$04            ; needle index
        jsr     DrawIndicatorDialNeedle
        lda     LD9E9
        ldx     #$04            ; needle index
        jsr     DrawIndicatorDialNeedle
        jsr     LDA53
LDA52:  rts

LDA53:  lda     $BE
        sta     $C2
        lda     $BF
        clc
        adc     #$20
        and     #$7F
        sta     $C3
        LDAX    #$168
        jsr     ScaleC2ByAX
        STAX    ValueForString
        CALLAX  Set3DigitString, $DB24
        JUMPAX  DrawMessageOrange, mDB22

mDA79:  MESSAGE $93, $4B, "      "
        MESSAGE $98, $4B, "      "
        MESSAGE $9C, $55, "    "
        MESSAGE $9D, $4D, "$     "
        MESSAGE $A2, $4E, "      "
        MESSAGE $A7, $4E, "      "
        MESSAGE $AC, $4D, "$     "
        MESSAGE $B1, $4D, "$     "
        MESSAGE $B6, $4D, "$     "
        MESSAGE $BB, $4B, "      "

        MESSAGE $93, $4D, "<----"
        MESSAGE $98, $4D, "$    "
        MESSAGE $A2, $4D, "$"
        MESSAGE $A7, $4D, "$"

        MESSAGE $97, $4D, "$ ADF"
        MESSAGE $A3, $4D, "$  $  "

        .byte   $AF
        eor     $2D24
        jsr     $2020
        and     $BB00
        eor     $2024
        jsr     $2024
        brk
        .byte   $82
        pla
        eor     ($44,x)
        lsr     $0020
        brk
        .byte   $89
        adc     #$20
        jsr     $2020
        brk
        dey
        adc     #$20
        jsr     $2020
        brk
        brk
        brk

mDB22:  MESSAGE $9D, $55, "237"

LDB28:
        CALLAX  DrawMultiMessage, mDA79
        lda     #$0A
        sta     LD9E9
        ldx     #$04            ; needle index
        jsr     DrawIndicatorDialNeedle
        CALLAX  DrawMessageOrange, mDB22
        CALLAX  DrawMessageOrange, mD9EA
        rts

LDB48:  lda     $08A9
        beq     LDB94
        lda     #$00
        sta     $08A8
        lda     LD9E7
        ldy     #$01
        cmp     ($8B),y
        bne     LDB94
        lda     LD9E8
        iny
        cmp     ($8B),y
        bne     LDB94
        lda     #$00
        sta     $08F9
        sta     $08FD
        iny
        lda     ($8B),y
        sta     $08FA
        iny
        lda     ($8B),y
        sta     $08FB
        iny
        lda     ($8B),y
        sta     $08FC
        iny
        lda     ($8B),y
        sta     $08FE
        iny
        lda     ($8B),y
        sta     $08FF
        iny
        lda     ($8B),y
        sta     $0900
        lda     #$01
        sta     LD9E6
LDB94:  lda     #$09
        jmp     L6018

LDB99:  lda     $08F1
        beq     LDBAC
        lda     $FA
        cmp     #$0D
        bcc     LDBAC
        cmp     #$10
        bcs     LDBAC
        adc     #$01
        bne     LDBAE           ; always
LDBAC:  lda     #$0D            ; ???
LDBAE:  jmp     SetInputModeAndCounter

LDBB1:  ldx     $097B
        beq     LDBD3
        lda     $FA
        cmp     #$0D
        bcc     LDBD3
        cmp     #$10
        bcs     LDBD3
        sec
        sbc     #$0D
        tax
        lda     sD9EA+1,x
        cmp     #$30
        bne     LDBCD
        lda     #$3A
LDBCD:  sec
        sbc     #$01
        jsr     LDC18
LDBD3:  lda     $FA
        cmp     #$03
        bne     LDC15
        ldx     $0A49
        inx
        cpx     #$08
        beq     LDC15
        bne     LDC11
        ldx     $097B
        beq     LDC05
        lda     $FA
        cmp     #$0D
        bcc     LDC05
        cmp     #$10
        bcs     LDC05
        sec
        sbc     #$0D
        tax
        lda     sD9EA+1,x
        cmp     #$39
        bne     LDBFF
        lda     #$2F
LDBFF:  clc
        adc     #$01
        jsr     LDC18
LDC05:  lda     $FA
        cmp     #$03
        bne     LDC15
        ldx     $0A49
        dex
        bmi     LDC15
LDC11:  txa
        jsr     UpdateMixtureControlIndicator
LDC15:  lda     $FA
        rts

LDC18:  sta     sD9EA+1,x
        CALLAX  DrawMessageOrange, mD9EA
        lda     sD9EA+2
        asl     a
        asl     a
        asl     a
        asl     a
        sta     $B7
        lda     sD9EA+3
        and     #$0F
        ora     $B7
        sta     LD9E7
        lda     sD9EA+1
        and     #$0F
        sta     LD9E8

LDC3D:  ldx     #$00
        stx     LD9E6
        inx
        stx     $08A8
        jmp     LDC15

        ;; Jump table
LDC49:  .addr   LDD07
        .addr   LDD10
        .addr   LDD19
        .addr   LDD1D
        .addr   LDD21
        .addr   LDD25
        .addr   LDD29
        .addr   LDD2D

LDC59:  lda     $0938
        beq     $DCDA
        lda     $0937
        bne     LDC84
        lda     $0A5B
        tax
        sec
        sbc     $0A5D
        bvc     LDC71
        bpl     LDC7A
        bmi     LDC75
LDC71:  beq     LDC81
        bmi     LDC7A
LDC75:  txa
        sec
        sbc     #$04
        tax
LDC7A:  txa
        clc
        adc     #$02
        sta     $0A5B
LDC81:  jsr     L91DE
LDC84:  dec     $08BC
        bpl     LDC9E
        lda     #$0A
        sta     $08BC
        lda     $63
        adc     $5B
        cmp     #$64
        bcs     LDC9E
        cmp     $0975
        bcc     LDC9E
        jsr     LDCE9
LDC9E:  lda     $099E
        cmp     $09A0
        sta     $B6
        lda     $099F
        sec
        sbc     $09A0
        bmi     LDCB9
        ora     $B6
        beq     LDCCB
        lda     #$FE
        ldx     #$FF
        bne     LDCBD
LDCB9:  lda     #$02
        ldx     #$00
LDCBD:  clc
        adc     $099E
        sta     $099E
        txa
        adc     $099F
        sta     $099F
LDCCB:  lda     $08AB
        clc
        adc     #$02
        sta     $08AB
        bcc     LDCD9
        inc     $08AC
LDCD9:  rts

        lda     #$00
        sta     $099E
        sta     $099F
        sta     $08AB
        sta     $08AC
        rts

LDCE9:  jsr     ClearViewportsToBlack
        CALLAX  DrawMessageOrange, msg_problem
        lda     $2B
        adc     $5F
        and     #$0E
        tax
        lda     LDC49,x
        sta     L00BA
        lda     LDC49+1,x
        sta     L00BA+1
        jmp     (L00BA)

LDD07:  lda     #$FE
LDD09:  and     $0914
        sta     $0914
        rts

LDD10:  lda     #$03
LDD12:  ora     $0991
        sta     $0991
        rts

LDD19:  lda     #$FB
        bne     LDD09           ; always
LDD1D:  lda     #$F7
        bne     LDD09           ; always
LDD21:  lda     #$0C
        bne     LDD12           ; always
LDD25:  lda     #$DF
        bne     LDD09           ; always
LDD29:  lda     #$BF
        bne     LDD09           ; always
LDD2D:  lda     #$7F
        bne     LDD09           ; always

;;; ============================================================
;;; North and East readouts in slew mode

msg_north:
        MESSAGE $02, $0A, " 00000 NORTH "
msg_east:
        MESSAGE $02, $4C, " 00000 EAST "

LDD50:  lda     $08B4
        and     #$01
        beq     LDD79
        lda     $093C
        ldx     $093D
        sta     $B6
        stx     $B7

        ;; Draw "00000 NORTH" (slew mode)
        CALLAX  DrawMessage, msg_north

        lda     $093E
        ldx     $093F
        sta     $B6
        stx     $B7

        ;; Draw "00000 EAST" (slew mode)
        CALLAX  DrawMessage, msg_east

LDD79:  rts

;;; ============================================================

LDD7A:  lda     $083C
        lsr     a
        bcs     LDD94
        lda     #$10
        sta     $0917
        lda     #$80
        sta     $0918
        lda     #$01
        sta     $0919
        lda     PanelLights
        beq     LDDA6
LDD94:  lda     $089B
        ldx     $089C
        sta     $0917
        stx     $0918
        lda     $089D
        sta     $0919
LDDA6:  rts

msg_mountain_crash:     MESSAGE $32, $14, "MOUNTAIN CRASH"
msg_crash:              MESSAGE $32, $14, "CRASH"
msg_building_crash:     MESSAGE $32, $14, "BUILDING CRASH"
msg_splash:             MESSAGE $32, $14, "SPLASH!"
msg_problem:            MESSAGE $32, $14, "AIRCRAFT PROBLEM !!!!"

;;; Address table
crash_msg_table:
        .addr   msg_crash
        .addr   msg_mountain_crash
        .addr   msg_crash
        .addr   msg_building_crash

LDDFB:  brk
        lda     $0834
        bne     LDE07
        lda     $09E3
        bne     LDE22
        rts

LDE07:  and     #$06
        tay
        lda     crash_msg_table,y
        ldx     crash_msg_table+1,y
        ldy     #$00
        sty     $0834
LDE15:  jsr     DrawMessageWhite
        ldx     #$FF
        jsr     LE311
        ldx     #$01
        jmp     L9093

LDE22:  lda     $2A36
        cmp     #$55
        bne     LDE4C
        lda     $083C
        and     #$01
        beq     LDE4C
        lda     $0937
        ora     $0836
        ora     $0A70
        bne     LDE4C
        inc     LDDFB
        lda     LDDFB
        cmp     #$05
        bne     LDE51
        LDAX    #msg_splash
        jmp     LDE15

LDE4C:  lda     #$00
        sta     LDDFB
LDE51:  rts

LDE52:  brk
LDE53:  .byte   $06
LDE54:  .byte   $1E
LDE55:  .byte   $06
LDE56:  brk
LDE57:  .byte   $13
LDE58:  .byte   $1E
LDE59:  .byte   $13
        brk
        .byte   $07
        asl     a:$07,x
        ora     ($1E),y
        ora     ($0000),y
        asl     $1E
        asl     $0000
        .byte   $13
        asl     a:$13,x
        ora     $1E
        ora     $0000
        ora     $1E,x
        ora     $AD,x
        lsr     $09,x
        and     #$03
        asl     a
        asl     a
        asl     a
        tax
        lda     $0955
        sec
        sbc     LDE52
        lda     $0954
        sbc     LDE53,x
        bmi     LDEB7
        lda     $0955
        sec
        sbc     LDE54
        lda     $0954
        sbc     LDE55,x
        bmi     LDEBB
        lda     $0955
        sec
        sbc     LDE56
        lda     $0954
        sbc     LDE57,x
        bmi     LDEBF
        lda     $0955
        sec
        sbc     LDE58
        lda     $0954
        sbc     LDE59,x
        bmi     LDEBB
LDEB7:  lda     #$04
        bne     LDEC1
LDEBB:  lda     #$02
        bne     LDEC1
LDEBF:  lda     #$01
LDEC1:  sta     $083C
        ldx     $0956
        lda     #$01
LDEC9:  sta     $0884
        asl     a
        dex
        bne     LDEC9
        rts

LDED1:  brk
LDED2:  brk
LDED3:  brk
LDED4:  brk
LDED5:  brk
LDED6:  brk
LDED7:  brk
LDED8:  brk
        .byte   $14
        brk
        ora     ($46,x)
        .byte   $8B
        brk
        brk
        asl     $C014,x
        ora     ($3C,x)
        sei
        .byte   $80
        brk
        plp
        .byte   $02
        brk
        brk
        .byte   $3C
        bvs     LDEEF
LDEEF:  brk
        plp
        .byte   $02
        brk
        brk
        .byte   $3C
        pha
        brk
        brk
        plp
        .byte   $02
        brk
        brk
        .byte   $3C
        jsr     $0000
        plp
        .byte   $14
        cpy     #$01
        .byte   $3C
        plp
        rti

        ora     ($28,x)
        .byte   $14
        brk
        ora     ($46,x)
        .byte   $14
        brk
        ora     ($1E,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LDF19:  .byte   $14
        .byte   $2B
        .byte   $7F
        .byte   $13
        .byte   $2B
        .byte   $7F
        ora     $2B,x
        .byte   $7F
        .byte   $14
        .byte   $27
        .byte   $0C
        .byte   $14
        .byte   $23
        .byte   $0C
        sty     $3E,x
        .byte   $3F
        sty     $3A,x
        .byte   $0C
        .byte   $14
        .byte   $2F
        .byte   $0C
        .byte   $14
        .byte   $33
        .byte   $0C
        .byte   $14
        .byte   $37
        .byte   $3F
        .byte   $14
        .byte   $3B
        .byte   $0C
        .byte   $14
        .byte   $3F
        .byte   $0C
        sty     $36,x
        .byte   $0C
        sty     $32,x
        .byte   $3F
        sty     $23,x
        .byte   $3F
        brk
        brk
        .byte   $14
        .byte   $2B
        .byte   $7F
        .byte   $14
        .byte   $27
        .byte   $0C
        .byte   $14
        .byte   $23
        .byte   $0C
        .byte   $14
        .byte   $2F
        .byte   $0C
        .byte   $14
        .byte   $33
        .byte   $0C
        .byte   $14
        .byte   $37
        .byte   $0C
        .byte   $14
        .byte   $3B
        .byte   $3F
        .byte   $13
        .byte   $2B
        sei
        ora     $2B,x
        .byte   $03
        brk
        brk

LDF65:  lda     $0836
        beq     LDF6E
        ldx     #$2F
        bne     LDF7C
LDF6E:  lda     $0A70
        bpl     LDFA4
        lda     #$10
        ldx     WW1AceMode
        beq     LDFA4
        ldx     #$00
LDF7C:  ldy     #$00
LDF7E:  lda     LDF19,x
        sta     $B8
        inx
        lda     LDF19,x
        beq     LDFA3
        sta     $B9
        inx
        lda     LDF19,x
        pha
        ora     ($B8),y
        sta     ($B8),y
        lda     $B9
        clc
        adc     #$20
        sta     $B9
        pla
        ora     ($B8),y
        sta     ($B8),y
        inx
        bne     LDF7E
LDFA3:  rts

LDFA4:  asl     a
        asl     a
        pha
        jsr     LDFBA
        pla
        cmp     #$40
        beq     LDFA3
LDFAF:  rts

LDFB0:  brk
LDFB1:  brk
LDFB2:  brk
LDFB3:  brk
LDFB4:  brk
LDFB5:  brk
LDFB6:  brk
LDFB7:  brk
LDFB8:  brk
LDFB9:  brk
LDFBA:  pha
        lda     #$09
        sta     $0876
        jsr     L601E
        pla
        tax
        lda     #$00
        sta     LDFB4
        sta     LDFB0
        lda     LDED1,x
        sta     LDFB5
        beq     LDFAF
        lda     LDED2,x
        sta     LDFB6
        lda     LDED3,x
        sta     LDFB7
        lda     LDED4,x
        sta     LDFB8
        lda     LDED5,x
        sta     LDFB1
        lda     LDED6,x
        sta     LDFB2
        lda     LDED7,x
        sta     LDFB3
        lda     LDED8,x
        sta     LDFB9
LDFFF:  lda     LDFB1
        sta     $27
        ldy     LDFB8
        lda     HiresTableLo,y
        sta     $8E
        lda     HiresTableHi,y
        sta     $8F
        lda     LDFB5
        jsr     L601B
        lda     LDFB0
        clc
        adc     LDFB2
        sta     LDFB0
        lda     LDFB1
        adc     LDFB3
        sta     LDFB1
        lda     LDFB4
        clc
        adc     LDFB6
        sta     LDFB4
        lda     LDFB5
        adc     LDFB7
        sta     LDFB5
        inc     LDFB8
        dec     LDFB9
        bne     LDFFF
        rts

LE046:  .byte   $01
LE047:  .byte   $01
LE048:  brk
LE049:  brk
LE04A:  brk
LE04B:  ora     $110F
        .byte   $13
        ora     $16,x
        clc
        ora     $1C1B,y
        ora     $1F1E,x
        jsr     $2221
        .byte   $23
        bit     $25
        rol     $27
        plp
        and     #$2A
        .byte   $2B
        bit     $2E2D
        .byte   $2F
        bmi     $E09B
        .byte   $32
LE06B:  brk
        .byte   $03
        .byte   $07
        .byte   $0B
        .byte   $0F
        .byte   $12
        .byte   $13
        .byte   $14
        ora     $18,x
        .byte   $1B
        asl     $2421,x
        rol     $28
        rol     a
        bit     $2F2D
        bmi     LE0B3
        .byte   $34
        and     $37,x
        and     $3D3B,y
        .byte   $3F
        eor     ($43,x)
        .byte   $46

;;; ADF???

mE08B:  MESSAGE $9A, $76, "O"
mE08F:  MESSAGE $9A, $76, "L"
mE093:  MESSAGE $9A, $76, "R"
mE097:  MESSAGE $9A, $76, "B"
mE09B:  MESSAGE $9A, $76, "S"

        lda     WW1AceMode
        bne     LE0C8
        lda     $0938
        beq     LE0C8
        lda     $0A49
        cmp     #$07
        beq     LE0C2
        lda     LE046
LE0B3:  and     $0999
        sta     $B7
        lda     LE047
        and     $099A
        ora     $B7
        bne     LE0C8
LE0C2:  jsr     LE2AD
        jmp     LE110

LE0C8:  lda     $0998
        bne     LE0D4
        lda     $0994
        beq     LE0C2
        bne     LE0D9
LE0D4:  lda     $0997
        beq     LE0C2
LE0D9:  lda     $0938
        ora     $099B
        beq     LE10B
        lda     $099B
        bne     LE110
        lda     $0A12
        cmp     #$25
        bcs     LE10B
        lda     $0A62
        cmp     #$04
        bne     LE110
        ldx     #$64
        jsr     LE311
        ldx     #$03
        jsr     LE2C1
        lda     $0956
        cmp     #$01
        bne     LE10B
        lda     $2B
        and     #$04
        beq     LE110
LE10B:  lda     #$01
        sta     $099B
LE110:  lda     $0A12
        lsr     a
        lsr     a
        cmp     #$1F
        bcc     LE11B
        lda     #$1F
LE11B:  tax
        lda     LE06B,x
        sta     L00BA
        ldy     $0A6F
        lda     $099B
        beq     LE141
        lda     $0A58
        beq     LE143
        lda     #$F8
        ldx     LE048
        beq     LE13A
        lda     #$E0
        dec     LE048
LE13A:  clc
        adc     $0A6F
        tay
        bpl     LE143
LE141:  ldy     #$00
LE143:  lda     $0991
        and     #$03
        beq     LE152
        tya
        cmp     #$10
        bcc     LE151
        lda     #$10
LE151:  tay
LE152:  lda     LE046
        and     $0999
        beq     LE162
        lda     LE047
        and     $099A
        bne     LE16B
LE162:  tya
        sec
        sbc     #$04
        tay
        bpl     LE16B
        ldy     #$00
LE16B:  tya
        lsr     a
        lsr     a
        tay
        lda     LE04B,y
        ldx     $099B
        bne     LE179
        lda     #$00
LE179:  sta     $0990
        cmp     #$0E
        bcs     LE182
        lda     #$00
LE182:  sta     $C3
        lda     #$00
        sta     $C2
        LDAX    #$7D0
        jsr     ScaleC2ByAXIntoC2
        LDAX    $09A9
        jsr     ScaleC2ByAX
        sta     $0A0D
        stx     $0A0E
        lda     L00BA
        cmp     $0990
        bmi     LE1A8
        sta     $0990
LE1A8:  lda     $0938
        bne     LE1B9
        lda     $0990
        cmp     #$0D
        bcs     LE1B9
        lda     #$0D
        sta     $0990
LE1B9:  lda     $FC
        and     #$40
        beq     LE22B
        ldx     #$00
        lda     $099B
        beq     LE1D1
        ldx     #$06
        lda     $0991
        and     #$01
        beq     LE1D1
        ldx     #$0A
LE1D1:  lda     LE049
        cpx     $099C
        beq     LE1F5
        bcs     LE1E8
        sbc     #$0A
        sta     LE049
        lda     $099C
        sbc     #$00
        jmp     LE1F2

LE1E8:  adc     #$0A
        sta     LE049
        lda     $099C
        adc     #$00
LE1F2:  sta     $099C
LE1F5:  ldx     #$00
        lda     $099B
        beq     LE207
        ldx     #$06
        lda     $0991
        and     #$01
        beq     LE207
        ldx     #$02
LE207:  lda     LE04A
        cpx     $099D
        beq     LE22B
        bcs     LE21E
        sbc     #$64
        sta     LE04A
        lda     $099D
        sbc     #$00
        jmp     LE228

LE21E:  adc     #$64
        sta     LE04A
        lda     $099D
        adc     #$00
LE228:  sta     $099D
LE22B:  lda     $31
        LE22C := *-1

        and     #$1F
        bne     LE2AC
        lda     $099B
        beq     LE2AC
        ldx     #$F2
        lda     WW1AceMode
        beq     LE241
        txa
        asl     a
        asl     a
        tax
LE241:  ldy     $0A6F
        jsr     L180C
        sta     $A5
        sty     $A6
        lda     $0991
        and     #$04
        beq     LE25A
        dec     $0994
        bpl     LE25A
        inc     $0994
LE25A:  lda     $0998
        bne     LE27B
        lda     $A5
        clc
        adc     $0992
        sta     $0992
        tya
        bpl     LE2AC
        adc     $0993
        sta     $0993
        lda     #$FF
        adc     $0994
        bmi     LE27B
        sta     $0994
LE27B:  lda     $0991
        and     #$08
        beq     LE28A
        dec     $0997
        bpl     LE28A
        inc     $0997
LE28A:  lda     $0998
        beq     LE2AC
        .byte   $A5
LE290:  lda     $18
        adc     $0995
        sta     $0995
        lda     $A6
        bpl     LE2AC
        .byte   $6D
        .byte   $96
LE29E:  ora     #$8D
        stx     $09,y
        lda     #$FF
        adc     $0997
        bmi     LE2AC
        sta     $0997
LE2AC:  rts

LE2AD:  lda     #$00
        sta     $099B
        rts

LE2B3:  ldy     #$00
        sty     $FA
        lsr     a
        sta     LE047
        rol     a
        and     #$01
        sta     LE046
LE2C1:  stx     $0A62
        jmp     DrawCarbHeatAndLights

;;; Message table

LE2C7:
        .addr   mE08B
        .addr   mE08F
        .addr   mE093
        .addr   mE097
        .addr   mE09B

LE2D1:  jsr     DrawMessageWhite
        lda     $0A62
        asl     a
        tax
        lda     LE2C7,x
        pha
        lda     LE2C7+1,x
        tax
        pla
        jsr     DrawMessageWhite
        rts

        lda     $FA
        cmp     #$03
        bne     LE2F3
        lda     #$03
        ldx     #$03
        jmp     L8CC6

LE2F3:  ldx     #$02
        stx     $FA
LE2F7:  jmp     L9100

LE2FA:  lda     $FA
        cmp     #$03
        bne     LE307
        lda     #$03
        ldx     #$04
        jmp     L8CC6

LE307:  ldx     #$01
        lda     $0836
        bne     LE2F7
        stx     $FA
        rts

LE311:  ldy     #$FF
LE313:  inc     $A5
        dec     $A5
        dey
        bne     LE313
        dex
        bne     LE311
        rts

        brk
        .byte   $0B
        .byte   $17
        .byte   $22
        .byte   $23
        and     $41,x
        .byte   $64
        ror     $88,x
        sta     $D0AB,y

        .byte   "WEATHER - ", 0
        .byte   "OBSERVATION", 0
LE342:  .byte   "12:00 ZULU", 0
        .byte   0
        .byte   "TEMPERATURE "
LE35A:  .byte   "75 - ", 0
        .byte   "INFORMATION", 0
        .byte   "LANDING AND DEPARTING RUNWAY "
LE389:  .byte   "31 - ", 0
        .byte   "ADVISE CONTROLLER", 0
        .byte   "ALTIMETER 29.95 -", 0
        .byte   "VISIBILITY 10 - ", 0
        .byte   "WIND "
LE3C9:  .byte   "330 AT "
LE3D0:  .byte   "27 - ", 0
        .byte   " "
LE3D7:  .byte   " "
        .byte   "MEASURED CEILING "
LE3E9:  .byte   "00600 OVERCAST - ", 0
        .byte   "ON INITIAL CONTACT", 0

LE40E:  ldx     $0956
        lda     $090E,x
        clc
        adc     $0930
        jsr     LE4C5
        sta     LE35A
        stx     LE35A+1
        lda     #$68
        sta     $C2
        lda     #$01
        sta     $C3
        lda     $0973
        ldx     $0974
        jsr     MultiplyAXByC2
        txa
        ldx     $C9
        jsr     LE4C7
        sta     LE3C9+1
        stx     LE3C9+2
        cpy     #$30
        bne     LE444
        ldy     #$20
LE444:  sty     LE3C9
        lda     $0971
        jsr     LE4C5
        cmp     #$30
        bne     LE453
        lda     #$20
LE453:  sta     LE3D0
        stx     LE3D0+1
        lda     $0954
        clc
        adc     $0854
        cmp     #$18
        bcc     LE467
        sec
        sbc     #$18
LE467:  jsr     LE4C5
        sta     LE342
        stx     LE342+1
        lda     #$66
        sta     $C2
        lda     #$08
        sta     $C3
        lda     $0856
        ldx     $0857
        jsr     MultiplyAXByC2
        ldy     #$00
        sty     LE3D7
        txa
        ldx     $C9
        bne     LE48E
        tay
        beq     LE4AB
LE48E:  ldy     #$20
        sty     LE3D7
        jsr     LE4C7
        cpy     #$30
        bne     LE4A2
        ldy     #$20
        cmp     #$30
        bne     LE4A2
        lda     #$20
LE4A2:  sty     LE3E9
        sta     LE3E9+1
        stx     LE3E9+2
LE4AB:  lda     $0974
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        tax
        lda     $090B,x
        jsr     LE4C5
        sta     LE389
        stx     LE389+1
        rts

;;; ============================================================

LE4C2:  brk
LE4C3:  brk
LE4C4:  brk
LE4C5:  ldx     #$00
LE4C7:  STAX    $B6
        CALLAX  Set3DigitString, $E4C2
        ldy     LE4C2
        lda     LE4C3
        ldx     LE4C4
        rts

LE4DC:  rts

        lda     $0913
        bne     LE4DC
        inc     $0913
        sta     $BB
        lda     #$03
        sta     $B8
        sta     $B9
        jsr     ClearViewportsToBlack
        lda     $092A
        ldx     $092B
        sta     $B6
        stx     $B7
LE4FA:  ldy     #$00
        lda     ($B6),y
        inc     $B6
        bne     LE504
        inc     $B7
LE504:  tay
        bne     LE508
        rts

LE508:  bpl     LE52E
        lda     $B7
        pha
        lda     $B6
        pha
        lda     LE29E,y
        clc
        adc     #$2B
        sta     $B6
        lda     #$E3
        adc     #$00
        sta     $B7
        lda     #$20
        jsr     LE504
        jsr     LE554
        pla
        sta     $B6
        pla
        sta     $B7
LE52C:  bne     LE4FA
LE52E:  cmp     #$20
        beq     LE54F
        sta     L00BA
        CALLAX  DrawMessageWhite, $00B8
        lda     #$00
        sec
        sbc     $093B
        tax
LE542:  ldy     #$78
LE544:  dey
        bne     LE544
        dex
        bne     LE542
        jsr     LE56D
        bne     LE52C
LE54F:  jsr     LE554
        bne     LE52C
LE554:  lda     $B9
        cmp     #$64
        bcc     LE56D
        lda     $B8
        adc     #$07
        cmp     #$5A
        bcc     LE567
        jsr     ClearViewportsToBlack
        lda     #$03
LE567:  sta     $B8
        lda     #$03
        bne     LE572
LE56D:  lda     $B9
        clc
        adc     #$04
LE572:  sta     $B9
        rts

        brk
        .byte   $5A
        pla
        .byte   $33
        brk
        inx
        .byte   $03
        .byte   $52
        stx     L002D,y
        .byte   $1F
        sbc     #$35
        .byte   $52
        stx     L002D,y
        asl     $EA
        pla
        .byte   $5A
        pla
        .byte   $33
        sbc     $34EA
        .byte   $5A
        pla
        .byte   $33
        .byte   $0C
        cpx     $529C
        ror     a
        .byte   $2F
        .byte   $2B
        sbc     $0ADC
        .byte   $B3
        ora     $1C,x
        inc     $526B
        stx     L002D,y
        rol     a
        inc     $0ECE
        .byte   $8F
        asl     $11,x
        .byte   $EF
        .byte   $F3
        asl     a
        .byte   $82
        .byte   $22
        and     $EF
        .byte   $CF
        asl     a
        .byte   $74
        .byte   $1C
        .byte   $3B
        .byte   $EF
        .byte   $CF
        asl     a
        ror     $1A
        eor     $31EF
        .byte   $0C
        .byte   $64
        .byte   $03
        lsr     $D0EF,x
        asl     $45A2
        adc     ($EF,x)
        dec     $0E,x
        tax
        rol     LEF9E,x
        dec     $6504
        .byte   $02
        brk
        .byte   $FC
        .byte   $DA
        .byte   $0C
        tsx
        .byte   $3B
        ora     ($FC,x)
        .byte   $CF
        asl     a
        .byte   $82
        ora     $FC2E,x
        inc     $0A,x
        .byte   $74
        .byte   $14
        eor     ($FC,x)
        .byte   $9C
        lsr     $95,x
        bmi     LE63A
        .byte   $FC
        lda     $0977
        and     $0914
        and     $0917
        cmp     $FB
        beq     LE609
        sta     $9E
        ldx     $FB
        stx     $A0
        sta     $FB
        lda     #$75
        ldx     #$E5
        jsr     LE642
LE609:  lda     $0978
        and     $0915
        and     $0918
        cmp     $FC
        beq     LE625
        sta     $9E
        ldx     $FC
        stx     $A0
        sta     $FC
        lda     #$A5
        ldx     #$E5
        jsr     LE642
LE625:  lda     $0979
        and     $0916
        and     $0919
        cmp     $FD
        beq     LE641
        sta     $9E
        ldx     $FD
        stx     $A0
        sta     $FD
LE63A:  lda     #$D5
        ldx     #$E5
        jsr     LE642
LE641:  rts

LE642:  sta     $BC
        stx     $BD
LE646:  lda     #$08
        sta     $A2
LE64A:  lda     $A0
        and     #$01
        sta     $B6
        lda     $9E
        and     #$01
        sta     $B7
        lda     $BC
        ldx     $BD
        sta     $B8
        stx     $B9
        jsr     LE67F
        lsr     $9E
        lsr     $A0
        lda     $BC
        clc
        adc     #$06
        sta     $BC
        bcc     LE670
        inc     $BD
LE670:  dec     $A2
        bne     LE64A
        rts

LE675:  brk
LE676:  brk
LE677:  brk
LE678:  brk
LE679:  brk
LE67A:  brk
LE67B:  brk
LE67C:  brk
LE67D:  brk
LE67E:  brk
LE67F:  lda     $B7
        cmp     $B6
        bne     LE686
        rts

LE686:  sta     LE675
        ldy     #$00
        lda     ($B8),y
        sta     LE676
        iny
        lda     ($B8),y
        sta     LE679
        lsr     LE679
        and     #$01
        sta     LE677
        iny
        lda     ($B8),y
        sta     LE678
        iny
        lda     ($B8),y
        sta     LE67A
        iny
        lda     ($B8),y
        sta     L00BA
        iny
        lda     ($B8),y
        sta     $BB
        lda     #$00
        sta     LE67E
LE6B9:  lda     LE67A
        sta     LE67D
        lda     LE676
        ldx     LE677
        sta     LE67B
        stx     LE67C
LE6CB:  lda     LE675
        beq     LE6E4
        jsr     LE7BD
        ldx     LE67C
        stx     $A5
        ldx     LE67B
        ldy     LE678
        jsr     LE74A
        jmp     LE6F5

LE6E4:  lda     LE67C
        sta     $A5
        ldx     LE67B
        ldy     LE678
        jsr     LE722
        jsr     LE79B
LE6F5:  inc     LE67B
        bne     LE6FD
        inc     LE67C
LE6FD:  dec     LE67D
        bne     LE6CB
        inc     LE678
        dec     LE679
        bne     LE6B9
        lda     LE675
        bne     LE721
        ldx     LE67E
        ldy     #$00
        lda     (L00BA),y
LE716:  inx
        cpx     #$09
        beq     LE71F
        rol     a
        jmp     LE716

LE71F:  sta     (L00BA),y
LE721:  rts

LE722:  jsr     LE770
        and     ($B8),y
        beq     LE72A
        iny
LE72A:  sty     $A7
        txa
        eor     #$FF
        ldy     #$00
        and     ($B8),y
        sta     ($B8),y
        tax
        lda     $B9
        clc
        adc     #$20
        cmp     #$60
        bcc     LE742
        sec
        sbc     #$40
LE742:  sta     $B9
        txa
        sta     ($B8),y
        lda     $A7
        rts

LE74A:  pha
        jsr     LE770
        pla
        ora     #$00
        beq     LE759
        txa
        eor     ($B8),y
        jmp     LE75B

LE759:  lda     ($B8),y
LE75B:  sta     ($B8),y
        tax
        lda     $B9
        clc
        adc     #$20
        cmp     #$60
        bcc     LE76A
        sec
        sbc     #$40
LE76A:  sta     $B9
        txa
        sta     ($B8),y
        rts

LE770:  lda     HiresTableHi,y
        sta     $B9
        lda     HiresTableLo,y
        sta     $B8
        lda     HiresPixelToByteTable,x
        ldy     $A5
        beq     LE784
        lda     HiresPixelToByteTable+256,x
LE784:  clc
        adc     $B8
        sta     $B8
        bcc     LE78D
        inc     $B9
LE78D:  lda     HiresPixelToBitMaskTable,x
        ldy     $A5
        beq     LE797
        lda     HiresPixelToBitMaskTable+242,x
LE797:  tax
        ldy     #$00
        rts

LE79B:  sta     $A5
        inc     LE67E
        lda     LE67E
        cmp     #$09
        bne     LE7B2
        lda     #$01
        sta     LE67E
        inc     L00BA
        bne     LE7B2
        inc     $BB
LE7B2:  lda     $A5
        ldy     #$00
        ror     a
        lda     (L00BA),y
        rol     a
        sta     (L00BA),y
        rts

LE7BD:  inc     LE67E
        lda     LE67E
        cmp     #$09
        bne     LE7D2
        lda     #$01
        sta     LE67E
        inc     L00BA
        bne     LE7D2
        inc     $BB
LE7D2:  ldy     #$00
        lda     (L00BA),y
        rol     a
        sta     (L00BA),y
        rol     a
        and     #$01
        rts

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
        .byte   $FE
        .byte   $FF
LE7ED:  .byte   $FF
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
        inc     $FFFF,x
        brk
        brk
        lda     #$D5
        sta     $FFFE
        lda     #$EF
        sta     $FFFF
        jmp     LEA31

LE80D:  brk
LE80E:  rts

LE80F:  brk
LE810:  .byte   $36
LE811:  .byte   $30
LE812:  .byte   $05
LE813:  .byte   $FF
        .byte   $FF
        ora     #$0A
LE817:  .byte   $04
        .byte   $0B
        .byte   $89
        .byte   $1F
        .byte   $43
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
LE82D:  .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $D3
        tax
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        cpy     #$9B
        sty     $80
        .byte   $80
        .byte   $80
        .byte   $80
        ldy     #$D8
        sta     ($80,x)
LE85A:  .byte   $80
        .byte   $80
LE85C:  .byte   $80
        .byte   $80
        bne     LE82D
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        cpx     $86
        .byte   $80
        .byte   $80
        stx     $80
        bcc     LE7ED
        .byte   $80
        cpy     #$81
        ldy     #$80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        cpy     #$FF
        .byte   $FF
        .byte   $FF
        .byte   $87
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        cpx     #$88
        .byte   $B2
        cld
LE890:  sbc     ($B6),y
        .byte   $DB
        .byte   $87
        .byte   $DB
        cmp     $AA,x
        cmp     $AA,x
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
LE89D:  .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
LE8AA:  .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $82
        cmp     $80,x
        .byte   $80
        .byte   $80
        .byte   $80
        beq     LE85C
        dey
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        bcc     LE85A
        cmp     ($8D,x)
        .byte   $80
        .byte   $80
        .byte   $80
        cpx     #$C6
        tya
        sty     $80
        .byte   $80
        .byte   $80
        cpy     #$B0
        ldx     $E7,y
        .byte   $E7
        .byte   $83
        .byte   $83
        bcc     LE89D
        .byte   $C3
        sta     $A080,y
        .byte   $80
        dec     $80
        cpy     $80
        cpy     $81
        bcs     LE8AA
        .byte   $83
        .byte   $80
        .byte   $80
        ldy     #$83
        .byte   $80
        .byte   $80
        .byte   $93
        .byte   $80
        .byte   $DB
        sta     ($E4,x)
        .byte   $80
        tya
        dey
        sta     $A2,x
        .byte   $D4
        cpy     #$81
        .byte   $C2
        cpx     #$D8
        sta     $8386
        .byte   $D4
        .byte   $80
        cmp     ($A2),y
        lda     $80
        .byte   $80
        brk
LE916:  .byte   $04
        .byte   $0B
        brk
        lda     #$02
        brk
        lda     #$01
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
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LEA15:  nop
        .byte   $7A
        nop
        .byte   $9E
        nop
        cpx     $EA
        pha
        nop
        inc     $41EB,x
        .byte   $EB
        adc     $EB,x
        sta     $20EC,x
        cpx     LEC71
        lda     $47ED,y
        sbc     LEEB3
        .byte   $FD
LEA31:  php
        sta     LE80D
        pla
        sta     LE810
        stx     LE80E
        sty     LE80F
        tsx
        stx     LE811
        jsr     LEF67
        jsr     LEF74
LEA49:  ldy     #$00
        jsr     LEF7F
        sta     LE817,y
        tax
LEA52:  dex
        beq     LEA63
        iny
        cpy     #$FF
        bcs     LEA63
        jsr     LEF7F
        sta     LE817,y
        jmp     LEA52

LEA63:  ldy     #$01
        lda     LE817,y
        cmp     #$0E
        bcc     LEA6F
        jmp     LEA49

LEA6F:  asl     a
        tax
        lda     LEA15,x
        pha
        inx
        lda     LEA15,x
        pha
        rts

        ldy     #$00
        lda     #$04
        sta     LE916,y
        iny
        lda     LE817,y
        sta     LE916,y
        iny
        pla
        sta     LE916,y
        iny
        pla
        pha
        sta     LE916,y
        dey
        lda     LE916,y
        pha
        jsr     LEF4F
        jmp     LEA49

        ldy     #$00
        lda     #$03
        sta     LE916,y
        iny
        lda     LE817,y
        sta     LE916,y
        iny
        lda     LE817,y
        cmp     #$41
        bne     LEABB
        lda     LE80D
        jmp     LEADC

LEABB:  cmp     #$58
        bne     LEAC5
        lda     LE80E
        jmp     LEADC

LEAC5:  cmp     #$59
        bne     LEACF
        lda     LE80F
        jmp     LEADC

LEACF:  cmp     #$53
        bne     LEAD9
        lda     LE811
        jmp     LEADC

LEAD9:  lda     LE810
LEADC:  sta     LE916,y
        jsr     LEF4F
        jmp     LEA49

        ldy     #$00
        lda     #$03
        sta     LE916,y
        iny
        lda     LE817,y
        sta     LE916,y
        iny
        lda     #$00
        sta     LE916,y
        jsr     LEF4F
        jmp     LEA49

        ldy     #$02
        lda     LE817,y
        iny
        cmp     #$41
        bne     LEB12
        lda     LE817,y
        sta     LE80D
        jmp     LEA49

LEB12:  cmp     #$58
        bne     LEB1F
        lda     LE817,y
        sta     LE80E
        jmp     LEA49

LEB1F:  cmp     #$59
        bne     LEB2C
        lda     LE817,y
        sta     LE80F
        jmp     LEA49

LEB2C:  cmp     #$53
        bne     LEB39
        lda     LE817,y
        sta     LE811
        jmp     LEA49

LEB39:  lda     LE817,y
        sta     LE810
        jmp     LEA49

        ldy     #$02
        lda     LE817,y
        sta     $57
        iny
        lda     LE817,y
        sta     $56
        iny
        lda     LE817,y
        tax
        clc
        adc     #$02
        ldy     #$00
        sta     LE916,y
        iny
        lda     LE817,y
        sta     LE916,y
        ldy     #$00
LEB65:  lda     ($56),y
        iny
        iny
        sta     LE916,y
        dey
        dex
        bne     LEB65
        jsr     LEF4F
        jmp     LEA49

        ldy     #$02
        lda     LE817,y
        sta     $57
        iny
        lda     LE817,y
        sta     $56
        ldy     #$00
        lda     LE817,y
        sta     LE812
        ldx     #$04
        ldy     #$00
LEB8F:  lda     LE817,x
        sta     ($56),y
        iny
        inx
        cpx     LE812
        bcc     LEB8F
        jmp     LEA49

        ldx     #$02
        lda     LE817,x
        sta     $57
        lda     #$00
        sta     $56
        inx
        lda     LE817,x
        tay
        inx
        lda     LE817,x
        sta     LEBE0
        inx
        lda     LE817,x
        sta     LEBE4
        ldx     #$00
        lda     LE817,x
        sta     LE812
        sec
        sbc     #$07
        sta     LEBFC
        lda     #$02
        pha
        ldx     #$06
        lda     ($56),y
        cmp     LE817,x
        beq     LEBEA
LEBD6:  ldx     #$06
LEBD8:  iny
        bne     LEBDD
        inc     $57
LEBDD:  lda     $57
        .byte   $C9
LEBE0:  sta     LEC90,y
        .byte   $C0
LEBE4:  sta     LE890,y
        jmp     LEC0E

LEBEA:  inx
        cpx     LE812
        bcs     LEBF3
        jmp     LEBD8

LEBF3:  pla
        cmp     #$FC
        bcs     LEC0F
        tax
        tya
        sec
        .byte   $E9
LEBFC:  sta     $169D,y
        sbc     #$E8
        lda     $57
        sbc     #$00
        sta     LE916,x
        inx
        txa
        pha
        jmp     LEBD6

LEC0E:  pla
LEC0F:  ldy     #$00
        sta     LE916,y
        iny
        lda     LE817,y
        sta     LE916,y
        jsr     LEF4F
        jmp     LEA49

        ldy     #$02
        lda     LE817,y
        sta     LEC64
        iny
        lda     LE817,y
        sta     LEC6A
        iny
        lda     LE817,y
        sta     $57
        iny
        lda     LE817,y
        sta     $56
        ldy     #$08
        lda     LE817,y
        sta     $59
        iny
        lda     LE817,y
        sta     $58
        ldy     #$00
LEC4B:  lda     ($56),y
        sta     ($58),y
        dec     $56
        lda     $56
        cmp     #$FF
        bne     LEC59
        dec     $57
LEC59:  dec     $58
        lda     $58
        cmp     #$FF
        bne     LEC63
        dec     $59
LEC63:  .byte   $A9
LEC64:  sta     $57C5,y
        bcc     LEC4B
        .byte   $A9
LEC6A:  sta     $56C5,y
        bcc     LEC4B
        .byte   $4C
        .byte   $49
LEC71:  nop
        ldy     #$02
        lda     LE817,y
        sta     $57
        iny
        lda     LE817,y
        sta     $56
        iny
        lda     LE817,y
        sta     LECAE
        iny
        lda     LE817,y
        sta     LECB4
        iny
        .byte   $B9
        .byte   $17
LEC90:  inx
        sta     $59
        iny
        lda     LE817,y
        sta     $58
        ldy     #$00
LEC9B:  lda     ($56),y
        sta     ($58),y
        inc     $56
        bne     LECA5
        inc     $57
LECA5:  inc     $58
        bne     LECAB
        inc     $59
LECAB:  lda     $57
        .byte   $C9
LECAE:  ora     ($90,x)
        nop
        lda     $56
        .byte   $C9
LECB4:  brk
        bcc     LEC9B
        jmp     LEA49

        ldy     #$02
        lda     LE817,y
        sta     $57
        iny
        lda     LE817,y
        sta     $56
        iny
        lda     LE817,y
        sta     LECF8
        iny
        lda     LE817,y
        sta     LECFE
        iny
        lda     LE817,y
        sta     $59
        iny
        lda     LE817,y
        sta     $58
        ldy     #$00
        lda     ($56),y
        cmp     ($58),y
        bne     LED0F
        inc     $56
        bne     LECEF
        inc     $57
LECEF:  inc     $58
        bne     LECF5
        inc     $59
LECF5:  lda     $57
        .byte   $C9
LECF8:  sta     LE890,y
        lda     $56
        .byte   $C9
LECFE:  sta     LE290,y
        ldx     #$02
        lda     #$FF
        sta     LE916,x
        inx
        sta     LE916,x
        jmp     LED34

LED0F:  pha
        ldx     #$02
        lda     $57
        sta     LE916,x
        inx
        lda     $56
        sta     LE916,x
        inx
        pla
        sta     LE916,x
        inx
        lda     $59
        sta     LE916,x
        inx
        lda     $58
        sta     LE916,x
        inx
        lda     ($58),y
        sta     LE916,x
LED34:  inx
        txa
        ldx     #$00
        sta     LE916,x
        inx
        lda     LE817,x
        sta     LE916,x
        jsr     LEF4F
        jmp     LEA49

        ldx     #$00
LED4A:  lda     LE813,x
        sta     $56,x
        inx
        cpx     #$04
        bcc     LED4A
        ldx     LE811
        txs
        ldy     #$00
        lda     LE817,y
        sta     LE916,y
        iny
        lda     LE817,y
        sta     LE916,y
        iny
        lda     LE817,y
        pha
        iny
        lda     LE817,y
        pha
        dey
        lda     BRKVector
        sta     LE817,y
        iny
        lda     $03F1
        sta     LE817,y
        lda     #$98
        sta     BRKVector
        lda     #$ED
        sta     $03F1
        ldx     LE80E
        ldy     LE80F
        lda     LE810
        pha
        lda     LE80D
        plp
        rts

        nop
        jmp     LEFA4

LED9C:  tsx
        stx     LE811
        dey
        lda     LE817,y
        sta     BRKVector
        iny
        lda     LE817,y
        sta     $03F1
        jsr     LEF4F
        jmp     LEA49

        ldx     #$7C
        lda     #$C0
        sta     LE812
        lda     #$00
        sta     $56
        sta     $57
        tay
LEDC2:  lda     ($56),y
        sta     $58
        iny
        bne     LEDCC
        jsr     LEEC7
LEDCC:  lda     ($56),y
        cmp     $58
        beq     LEDEF
        lda     $58
        cmp     #$83
        bne     LEDE3
        pha
        jsr     LEF97
        dex
        bne     LEDE2
        jsr     LEEC1
LEDE2:  pla
LEDE3:  jsr     LEF97
        dex
        bne     LEDEC
        jsr     LEEC1
LEDEC:  jmp     LEDC2

LEDEF:  iny
        bne     LEDF5
        jsr     LEEC7
LEDF5:  lda     ($56),y
        cmp     $58
        beq     LEE2E
        lda     $58
        cmp     #$83
        bne     LEE17
        pha
        jsr     LEF97
        dex
        bne     LEE0B
        jsr     LEEC1
LEE0B:  pla
        pha
        jsr     LEF97
        dex
        bne     LEE16
        jsr     LEEC1
LEE16:  pla
LEE17:  pha
        jsr     LEF97
        dex
        bne     LEE21
        jsr     LEEC1
LEE21:  pla
        jsr     LEF97
        dex
        bne     LEE2B
        jsr     LEEC1
LEE2B:  jmp     LEDC2

LEE2E:  lda     #$03
        sta     $59
LEE32:  iny
        bne     LEE38
        jsr     LEEC7
LEE38:  lda     ($56),y
        cmp     $58
        beq     LEE8D
        lda     #$83
        jsr     LEF97
        dex
        bne     LEE49
        jsr     LEEC1
LEE49:  lda     $59
        cmp     #$83
        bne     LEE72
        lda     #$40
        jsr     LEF97
        dex
        bne     LEE5A
        jsr     LEEC1
LEE5A:  lda     $58
        jsr     LEF97
        dex
        bne     LEE65
        jsr     LEEC1
LEE65:  lda     #$83
        jsr     LEF97
        dex
        bne     LEE70
        jsr     LEEC1
LEE70:  lda     #$43
LEE72:  jsr     LEF97
        dex
        bne     LEE7B
        jsr     LEEC1
LEE7B:  lda     $58
        jsr     LEF97
        dex
        bne     LEE86
        jsr     LEEC1
LEE86:  lda     #$00
        sta     $59
        jmp     LEDC2

LEE8D:  lda     $59
        clc
        adc     #$01
        bcs     LEE99
        sta     $59
        jmp     LEE32

LEE99:  lda     #$83
        jsr     LEF97
        dex
        bne     LEEA4
        jsr     LEEC1
LEEA4:  lda     $59
        jsr     LEF97
        dex
        bne     LEEAF
        jsr     LEEC1
LEEAF:  lda     $58
        .byte   $20
        .byte   $97
LEEB3:  .byte   $EF
        dex
        bne     LEEBA
        jsr     LEEC1
LEEBA:  lda     #$01
        sta     $59
        jmp     LEE32

LEEC1:  jsr     LEF7F
        ldx     #$80
        rts

LEEC7:  lda     LE812
        sec
        sbc     #$01
        beq     LEEDA
        sta     LE812
        lda     $57
        clc
        adc     #$01
        sta     $57
        rts

LEEDA:  pla
        pla
        lda     $59
        beq     LEEFB
        lda     #$83
        jsr     LEF97
        dex
        bne     LEEEB
        jsr     LEEC1
LEEEB:  lda     $59
        jsr     LEF97
        dex
        bne     LEEF6
        jsr     LEEC1
LEEF6:  lda     $58
        jsr     LEF97
LEEFB:  jmp     LEA49

        lda     #$C0
        sta     LE812
        lda     #$00
        sta     $56
        sta     $57
        tay
LEF0A:  jsr     LEF7F
        cmp     #$83
        beq     LEF1C
LEF11:  sta     ($56),y
        iny
        bne     LEF19
        jsr     LEF37
LEF19:  jmp     LEF0A

LEF1C:  jsr     LEF7F
        cmp     #$83
        beq     LEF11
        tax
        jsr     LEF7F
LEF27:  sta     ($56),y
        iny
        bne     LEF31
        pha
        jsr     LEF37
        pla
LEF31:  dex
        bne     LEF27
        jmp     LEF0A

LEF37:  lda     LE812
        sec
        sbc     #$01
        beq     LEF4A
        sta     LE812
        lda     $57
        clc
        adc     #$01
        sta     $57
        rts

LEF4A:  pla
        pla
        jmp     LEA49

LEF4F:  ldy     #$00
        lda     LE916,y
        tax
LEF55:  jsr     LEF7F
        cmp     #$FF
        beq     LEF66
        lda     LE916,y
        jsr     LEF97
        iny
        dex
        bne     LEF55
LEF66:  rts

LEF67:  ldx     #$00
LEF69:  lda     $56,x
        sta     LE813,x
        inx
        cpx     #$04
        bcc     LEF69
        rts

LEF74:  lda     #$03
        sta     $C0B0
        lda     #$11
        sta     $C0B0
        rts

LEF7F:  lda     #$70
        bit     $C0B0
        bne     LEF92
        lda     #$01
        bit     $C0B0
        beq     LEF7F
        lda     $C0B1
        clc
        rts

LEF92:  lda     $C0B1
        sec
        rts

LEF97:  pha
        lda     #$02
        bit     $C0B0
        .byte   $F0
LEF9E:  .byte   $FB
        pla
        sta     $C0B1
        rts

LEFA4:  lda     L0045
        sta     LE80D
        lda     $46
        sta     LE80E
        lda     $47
        sta     LE80F
        lda     $48
        sta     LE810
        lda     $49
        clc
        adc     #$04
        sta     LE811
        ldy     #$02
        lda     $3A
        sec
        sbc     #$02
        sta     LE916,y
        iny
        lda     $3B
        sbc     #$00
        sta     LE916,y
        jmp     LED9C

        sta     L0045
        plp
        stx     $46
        sty     $47
        php
        pla
        sta     $48
        tsx
        stx     $49
        cld
        pla
        sta     $3A
        pla
        sta     $3B
        jmp     (BRKVector)

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
        inc     $FFFF,x
        .byte   0, 0

;;; ============================================================
;;; "War Report" for "World War 1 Ace" mode
;;; The whole display is rendered, then the stats are re-rendered
;;; in orange.

msg_war_report: MESSAGE $00, $18, "***** WAR REPORT *****"
                MESSAGE $0C, $04, "ENEMY PLANES SHOT DOWN = "
msg_wr2:        MESSAGE $0C, $68, "000"
                MESSAGE $12, $04, "BOMB HITS = "
msg_wr3:        MESSAGE $12, $34, "000"
                MESSAGE $18, $04, "AIRCRAFT DAMAGE BY ENEMY = "
msg_wr4:        MESSAGE $18, $70, "000"
                MESSAGE $24, $04, "ENEMY STATUS: 0=SHOT DOWN"
                MESSAGE $2A, $3C, "1=RETURNING OR HOME"
                MESSAGE $30, $3C, "2=ATTACKING"

                MESSAGE $3C, $04, "ENEMY 1 = "
msg_wr5:        MESSAGE $3C, $2C, "0", LF0C3

                MESSAGE $3C, $3C, "ENEMY 2 = "
msg_wr6:        MESSAGE $3C, $64, "0", LF0D4

                MESSAGE $42, $04, "ENEMY 3 = "
msg_wr7:        MESSAGE $42, $2C, "0", LF0E5

                MESSAGE $42, $3C, "ENEMY 4 = "
msg_wr8:        MESSAGE $42, $64, "0", LF0F6

                MESSAGE $48, $04, "ENEMY 5 = "
msg_wr9:        MESSAGE $48, $2C, "0", LF107

                MESSAGE $48, $3C, "ENEMY 6 = "
msg_wr10:       MESSAGE $48, $64, "0", LF118

                MESSAGE $54, $00, "PRESS ANY KEY TO RESUME BATTLE"
        .byte   0, 0            ; sentinel

LF13D:  rts

        lda     $08C8
        beq     LF13D
        lda     #$00
        sta     $08C8
        lda     $0898
        sta     $B6
        lda     #$00
        sta     $B7
        CALLAX  Set3DigitStringRelay, $F037
        lda     $A81B
        sta     $B6
        lda     #$00
        sta     $B7
        CALLAX  Set3DigitStringRelay, $F04C
        lda     $08A4
        sta     $B6
        lda     #$00
        sta     $B7
        CALLAX  Set3DigitStringRelay, $F070
        lda     $A972
        ora     #$30
        sta     LF0C3
        lda     $A98E
        ora     #$30
        sta     LF0D4
        lda     $A9AA
        ora     #$30
        sta     LF0E5
        lda     $A9C6
        ora     #$30
        sta     LF0F6
        lda     $A9E2
        ora     #$30
        sta     LF107
        lda     $A9FE
        ora     #$30
        sta     LF118
        jsr     ClearViewportsToBlack
        CALLAX  DrawMultiMessage, msg_war_report
        CALLAX  DrawMessageOrange, msg_wr2
        CALLAX  DrawMessageOrange, msg_wr3
        CALLAX  DrawMessageOrange, msg_wr4
        CALLAX  DrawMessageOrange, msg_wr5
        CALLAX  DrawMessageOrange, msg_wr6
        CALLAX  DrawMessageOrange, msg_wr7
        CALLAX  DrawMessageOrange, msg_wr8
        CALLAX  DrawMessageOrange, msg_wr9
        CALLAX  DrawMessageOrange, msg_wr10
        jsr     TogglePauseRelay
        rts

;;; ============================================================

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
        .byte   $76, $FF
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
        .byte   $2F
        rti

LF242:  brk
LF243:  brk
LF244:  brk
LF245:  brk
        .byte   $41
LF247:  brk
LF248:  brk
LF249:  brk
LF24A:  brk
        .byte   $41
LF24C:  brk
LF24D:  brk
LF24E:  brk
LF24F:  brk
        .byte   $41
LF251:  brk
LF252:  brk
LF253:  brk
LF254:  brk
        and     #$1B
        .byte   $2B
LF258:  brk
LF259:  brk
LF25A:  brk
LF25B:  brk
LF25C:  brk
LF25D:  brk
LF25E:  brk
LF25F:  brk
        .byte   $19

LF261:  iny
        lda     ($8B),y
        clc
        adc     $0849
        clc
        adc     $0847
        eor     #$FF
        clc
        adc     #$41
        sta     $F2
        jsr     L1763
        sta     $A9
        stx     $AA
        lda     $F2
        jsr     L1768
        sta     $BE
        stx     $BF
        sta     $C4
        stx     $C5
        ldy     #$02
        lda     ($8B),y
        sta     $3E
        sta     $C2
        iny
        lda     ($8B),y
        sta     $3F
        sta     $C3
        jsr     ScaleC2ByC4
        sta     $18
        stx     $19
        sta     LF25A
        stx     LF25B
        eor     #$FF
        clc
        adc     #$01
        sta     LF25E
        bne     LF2AE
        dex
LF2AE:  txa
        eor     #$FF
        sta     LF25F
        lda     $A9
        ldx     $AA
        sta     $C4
        stx     $C5
        lda     $3E
        ldx     $3F
        sta     $C2
        stx     $C3
        jsr     ScaleC2ByC4
        sta     $1B
        stx     $1C
        sta     LF258
        stx     LF259
        eor     #$FF
        clc
        adc     #$01
        sta     LF25C
        bne     LF2DC
        dex
LF2DC:  txa
        eor     #$FF
        sta     LF25D
        ldy     #$04
        lda     ($8B),y
        sta     $9A
        sta     $C2
        iny
        lda     ($8B),y
        sta     $9B
        sta     $C3
        lda     $BE
        ldx     $BF
        sta     $C4
        stx     $C5
        jsr     ScaleC2ByC4
        sta     $1E
        stx     $1F
        lda     $9A
        ldx     $9B
        sta     $C2
        stx     $C3
        lda     $A9
        ldx     $AA
        sta     $C4
        stx     $C5
        jsr     ScaleC2ByC4
        sta     $A9
        stx     $AA
        clc
        adc     $18
        sta     LF244
        txa
        adc     $19
        sta     LF245
        eor     #$FF
        sta     LF24F
        lda     LF244
        eor     #$FF
        clc
        adc     #$01
        sta     LF24E
        bne     LF338
        inc     LF24F
LF338:  lda     $1B
        clc
        adc     $1E
        sta     LF247
        lda     $1C
        adc     $1F
        sta     LF248
        eor     #$FF
        sta     LF252
        lda     LF247
        eor     #$FF
        clc
        adc     #$01
        sta     LF251
        bne     LF35C
        inc     LF252
LF35C:  lda     $1B
        sec
        sbc     $1E
        sta     LF242
        lda     $1C
        sbc     $1F
        sta     LF243
        eor     #$FF
        sta     LF24D
        lda     LF242
        eor     #$FF
        clc
        adc     #$01
        sta     LF24C
        bne     LF380
        inc     LF24D
LF380:  lda     $18
        sec
        sbc     $A9
        sta     LF249
        lda     $19
        sbc     $AA
        sta     LF24A
        eor     #$FF
        sta     LF254
        lda     LF249
        eor     #$FF
        clc
        adc     #$01
        sta     LF253
        bne     LF3A4
        inc     LF254
LF3A4:  lda     $8B
        pha
        lda     $8C
        pha
        lda     #$40
        sta     $8B
        lda     #$F2
        sta     $8C
        lda     #$00
        sta     $0876
        lda     #$00
        sta     $0877
        jsr     L6734
        pla
        sta     $8C
        pla
        sta     $8B
        lda     #$06
        jmp     L67FD

LF3CA:  iny
        lda     ($8B),y
        sta     $A5
        iny
        lda     ($8B),y
        sta     $A6
        jmp     L6D4B

        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        .byte   $76, $FF
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
        .byte   $76, $FF
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
        .byte   $76

        .assert * = $F400, error, "EOF mismatch"
