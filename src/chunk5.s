; da65 V2.19 - Git 7f1dd09bc
; Created:    2024-08-24 11:58:27
; Input file: ../chunks/5_6000-b3df
; Page:       1


        .setcpu "6502"
        .org $6000
        .include "macros.inc"

        .refto __APPLE2__

L000E           := $000E
L003C           := $003C
L00A5           := $00A5

;;; Possible chunk4 references
L0300           := $0300
L08AD           := $08AD
HiresTableHi    := $0E9A
HiresTableLo    := $0F5A
L154A           := $154A
L1569           := $1569
L168F           := $168F
L1696           := $1696
L16A2           := $16A2
L172C           := $172C
L1735           := $1735
L1763           := $1763
L1768           := $1768
L1778           := $1778
L177B           := $177B
L180C           := $180C
L1818           := $1818
L1880           := $1880
L188D           := $188D
L18B6           := $18B6
L18CB           := $18CB
L18DD           := $18DD
L1907           := $1907
L1915           := $1915
L192D           := $192D
L1A3D           := $1A3D
L1A45           := $1A45
L1A57           := $1A57
L1A5F           := $1A5F
L1A6E           := $1A6E
L1A78           := $1A78
L1A80           := $1A80
L1A8C           := $1A8C
L1A94           := $1A94
L1AAC           := $1AAC
L1AB4           := $1AB4
L1ABF           := $1ABF
L1AC7           := $1AC7
L1ADA           := $1ADA
L1AEC           := $1AEC
L1AFA           := $1AFA
L1B0C           := $1B0C
L1B1E           := $1B1E
L1B24           := $1B24
L1B38           := $1B38
L1B56           := $1B56
L1B67           := $1B67
L1B6D           := $1B6D
L1B80           := $1B80
L1B9F           := $1B9F
L1C73           := $1C73
DrawMessage2    := $1C96
DrawMessage3    := $1C9F
DrawMessage4    := $1D92
ClearViewportsToBlack   := $1DA8
L1EAD           := $1EAD
L1EB0           := $1EB0
L1EB3           := $1EB3
L1EBC           := $1EBC
L1EC4           := $1EC4
L1F89           := $1F89

;;; Possible chunk5 references
LB808           := $B808
LB849           := $B849
LB9C3           := $B9C3
LB9CE           := $B9CE

;;; Possible chunk3 references
LD3D3           := $D3D3
LD3D9           := $D3D9
LD3E2           := $D3E2
LD9F1           := $D9F1
LDB48           := $DB48
LDB99           := $DB99
LDBB1           := $DBB1
LDC3D           := $DC3D
LDC59           := $DC59
LDD50           := $DD50
LDD7A           := $DD7A
LDF65           := $DF65
LE22C           := $E22C
LE2B3           := $E2B3
LE2D1           := $E2D1
LE2FA           := $E2FA
LE40E           := $E40E
LE646           := $E646
LE667           := $E667
LF261           := $F261
LF3CA           := $F3CA

;;; Possible chunk2 references
LF71C           := $F71C
LF7E2           := $F7E2
LF97A           := $F97A
LF9B5           := $F9B5
LFA56           := $FA56
LFAEC           := $FAEC

L6000:  jmp     L610A

L6003:  jmp     L639D

L6006:  jmp     L6734

        jmp     L7988

        jmp     L7963

        jmp     L7B16

L6012:  jmp     L84B5

        jmp     L84F4

        jmp     L67FD

        jmp     L790E

        jmp     L7BA0

L6021:  lda     #$09
        jmp     L67FD

L6026:  rts

        rts

        rts

        lda     $08F3
        beq     L6049
        lda     #$00
        sta     $08F2
        ldy     #$08
        lda     $08F7
        ldx     $08F8
        jsr     L604E
        ldy     #$00
        lda     $08F5
        ldx     $08F6
        jsr     L604E
L6049:  lda     #$0B
        jmp     L67FD

L604E:  sty     $B6
        ldy     #$01
        cmp     ($8B),y
        bne     L607C
        txa
        iny
        cmp     ($8B),y
        bne     L607C
        ldx     $B6
        lda     #$08
        sta     $B6
        iny
L6063:  lda     ($8B),y
        sta     $08F9,x
        iny
        inx
        dec     $B6
        bne     L6063
        lda     #$01
        cpx     #$10
        beq     L6076
        lda     #$02
L6076:  ora     $08F4
        sta     $08F4
L607C:  rts

        iny
        lda     ($8B),y
        pha
        iny
        lda     $090A
        beq     L60BD
        lda     #$00
        sta     $0909
        lda     $089F
        iny
        cmp     ($8B),y
        bne     L60BD
        lda     $08A0
        iny
        cmp     ($8B),y
        bne     L60BD
        iny
        ldx     #$08
L609F:  lda     ($8B),y
        iny
        sta     $0905,y
        dex
        bne     L609F
        lda     $8B
        clc
        adc     #$0D
        sta     $092A
        lda     #$00
        sta     $0913
        adc     $8C
        sta     $092B
        jsr     L6026
L60BD:  pla
        clc
        adc     $8B
        sta     $8B
        bcc     L60C7
        inc     $8C
L60C7:  jmp     L6746

        lda     #$04
        ldx     #$A5
        sta     $3E
L60D0:  iny
        lda     ($8B),y
        sta     $00,x
        inx
        dec     $3E
        bne     L60D0
        rts

        ldy     #$05
L60DD:  lda     ($8B),y
        sta     $08E4,y
        dey
        bne     L60DD
        lda     $08E9
        bmi     L60FD
        pha
        clc
        lda     $08E7
        adc     $8B
        sta     $08E7
        lda     $08E8
        adc     $8C
        sta     $08E8
        pla
L60FD:  and     #$03
        sta     $08E9
        jsr     L8776
        lda     #$06
        jmp     L67FD

L610A:  lda     $0836
        beq     L612D
        lda     #$00
        sta     $72
        lda     #$40
        sta     $73
        lda     #$00
        sta     $76
        lda     #$00
        sta     $77
        sec
        sbc     $70
        sta     $74
        lda     #$00
        sbc     $71
        sta     $75
        jmp     L61F0

L612D:  lda     $0A70
        bpl     L6155
        lda     #$00
        sec
        sbc     $70
        sta     $74
        lda     #$00
        sbc     $71
        sta     $75
        lda     #$00
        sta     $76
        lda     #$00
        sta     $77
        lda     $6C
        sta     $72
        lda     $6D
        clc
        adc     #$40
        sta     $73
        jmp     L61F0

L6155:  lda     $0A70
        asl     a
        asl     a
        asl     a
        asl     a
        sta     $3E
        lda     $6E
        ldx     $6F
        sta     $B6
        stx     $B7
        lda     $6C
        ldx     $6D
        sta     $C0
        stx     $C1
        lda     $71
        sta     $3D
        lda     $B7
        clc
        adc     #$40
        bmi     L617C
        jmp     L6199

L617C:  lda     #$00
        ldx     #$80
        sec
        sbc     $C0
        tay
        txa
        sbc     $C1
        tax
        tya
        sta     $C0
        stx     $C1
        lda     $B7
        eor     #$80
        sta     $B7
        lda     $3D
        eor     #$80
        sta     $3D
L6199:  lda     $3D
        clc
        adc     $3E
        sta     $77
        lda     $3E
        jsr     L1763
        sta     $BA
        stx     $BB
        lda     $3E
        jsr     L1768
        sta     $BE
        stx     $BF
        ldx     #$C0
        ldy     #$BA
        lda     #$98
        jsr     L154A
        ldx     #$B6
        ldy     #$BE
        lda     #$AD
        jsr     L154A
        sec
        lda     $98
        sbc     $AD
        sta     $72
        lda     $99
        sbc     $AE
        sta     $73
        ldx     #$B6
        ldy     #$BA
        lda     #$98
        jsr     L154A
        ldx     #$C0
        ldy     #$BE
        lda     #$AD
        jsr     L154A
        clc
        lda     $AD
        adc     $98
        sta     $74
        lda     $AE
        adc     $99
        sta     $75
L61F0:  lda     $73
        clc
        adc     #$40
        bpl     L6210
        lda     #$00
        sec
        sbc     $72
        sta     $72
        lda     #$80
        sbc     $73
        sta     $73
        lda     $75
        eor     #$80
        sta     $75
        lda     $77
        eor     #$80
        sta     $77
L6210:  ldx     $72
        lda     $73
        jsr     L1778
        sta     $CB
        stx     $CC
        ldx     $74
        lda     $75
        jsr     L1778
        sta     $CD
        stx     $CE
        ldx     $76
        lda     $77
        jsr     L1778
        sta     $CF
        stx     $D0
        ldx     $72
        lda     $73
        jsr     L177B
        sta     $18
        stx     $19
        ldx     $74
        lda     $75
        jsr     L177B
        sta     $D4
        stx     $D5
        ldx     $76
        lda     $77
        jsr     L177B
        sta     $D6
        stx     $D7
        ldx     #$D6
        ldy     #$D4
        lda     #$D8
        jsr     L154A
        ldx     #$CF
        ldy     #$CD
        lda     #$1B
        jsr     L154A
        ldx     #$D6
        ldy     #$CD
        lda     #$DD
        jsr     L154A
        ldx     #$CF
        ldy     #$D4
        lda     #$DF
        jsr     L154A
        ldx     #$CB
        ldy     #$1B
        lda     #$E1
        jsr     L154A
        ldx     #$CB
        ldy     #$DF
        lda     #$1E
        jsr     L154A
        ldx     #$DD
        ldy     #$CB
        lda     #$4A
        jsr     L154A
        ldx     #$CB
        ldy     #$D8
        lda     #$4D
        jsr     L154A
        clc
        lda     $D8
        adc     $E1
        sta     $78
        lda     $D9
        adc     $E2
        sta     $79
        sec
        lda     $1E
        sbc     $DD
        sta     $7A
        lda     $1F
        sbc     $DE
        sta     $7B
        ldx     #$CF
        ldy     #$18
        lda     #$7C
        jsr     L154A
        ldx     #$CD
        ldy     #$18
        lda     #$7E
        jsr     L154A
        ldx     #$18
        ldy     #$D4
        lda     #$80
        jsr     L154A
        lda     #$00
        sec
        sbc     $CB
        sta     $82
        lda     #$00
        sbc     $CC
        sta     $83
        sec
        lda     $4A
        sbc     $DF
        sta     $84
        lda     $4B
        sbc     $E0
        sta     $85
        clc
        lda     $1B
        adc     $4D
        sta     $86
        lda     $1C
        adc     $4E
        sta     $87
        ldx     #$D6
        ldy     #$18
        lda     #$88
        jsr     L154A
        ldx     #$0C
L6301:  lda     $79,x
        rol     a
        ror     $79,x
        ror     $78,x
        lda     $7D,x
        rol     a
        php
        ror     $7D,x
        ror     $7C,x
        plp
        ror     $7D,x
        ror     $7C,x
        txa
        sec
        sbc     #$06
        tax
        bpl     L6301
        rts

L631D:  lda     $7E
        ldx     $7F
        sta     $C2
        stx     $C3
        jsr     L6363
        lda     $C7
        sta     $4C
        lda     $C8
        ldx     $C9
        sta     $4A
        stx     $4B
        lda     $80
        ldx     $81
        sta     $C2
        stx     $C3
        jsr     L6363
        lda     $C7
        sta     $4F
        lda     $C8
        ldx     $C9
        sta     $4D
        stx     $4E
        lda     $82
        ldx     $83
        sta     $C2
        stx     $C3
        jsr     L6363
        lda     $C7
        sta     $52
        lda     $C8
        ldx     $C9
        sta     $50
        stx     $51
        rts

L6363:  lda     $C3
        eor     $69
        php
        lda     $C3
        bpl     L6379
        lda     #$00
        sec
        sbc     $C2
        sta     $C2
        lda     #$00
        sbc     $C3
        sta     $C3
L6379:  lda     $68
        ldx     $69
        jsr     L1735
        asl     $C7
        rol     $C8
        rol     $C9
        plp
        bmi     L639C
        lda     #$00
        sec
        sbc     $C7
        sta     $C7
        lda     #$00
        sbc     $C8
        sta     $C8
        lda     #$00
        sbc     $C9
        sta     $C9
L639C:  rts

L639D:  txa
        bne     L63BE
        ldx     #$C0
L63A2:  lda     $0E99,x
        clc
        adc     $8D
        sta     $0E99,x
        dex
        bne     L63A2
        lda     $8D
        eor     #$C0
        sta     $8D
        bpl     L63BB
        sta     $C054
        bmi     L63BE
L63BB:  sta     $C055
L63BE:  lda     $8B
        ldx     $8C
        sta     $35
        stx     $36
        lda     #$0D
        sta     L6B2C
        lda     #$FF
        sta     $EA
        lda     $77
        clc
        adc     #$20
        lsr     a
        lsr     a
        and     #$F0
        clc
        adc     #$78
        sta     $8B
        lda     #$0A
        adc     #$00
        sta     $8C
        lda     $66
        ldx     $67
        sta     $02
        stx     $03
        lda     $6A
        ldx     $6B
        sta     $04
        stx     $05
        lda     #$00
        sta     $66
        sta     $67
        sta     $6A
        sta     $6B
        sta     $4A
        sta     $4B
        sta     $4C
        sta     $4D
        sta     $4E
        sta     $4F
        sta     $50
        sta     $51
        sta     $52
        jsr     L6746
        lda     $02
        ldx     $03
        sta     $66
        stx     $67
        lda     $04
        ldx     $05
        sta     $6A
        stx     $6B
        lda     #$20
        sta     L6B2C
        lda     $35
        ldx     $36
        sta     $8B
        stx     $8C
        lda     $E9
        ldx     $EA
        sta     $D1
        stx     $D2
        lda     $EB
        ldx     $EC
        sta     $DA
        stx     $DB
        lda     $0882
        beq     L644A
        cmp     #$FF
        beq     L644A
        lda     #$2A
L644A:  sta     $ED
        lda     $0880
        beq     L6457
        cmp     #$FF
        beq     L6457
        lda     #$D5
L6457:  sta     $EE
        beq     L6467
        cmp     #$FF
        beq     L6467
        lda     $ED
        beq     L6467
        cmp     #$FF
        bne     L646D
L6467:  and     #$03
        tax
        jsr     L7BA9
L646D:  lda     #$00
        sta     $F0
        lda     #$63
        sta     $EF
        lda     $EA
        bpl     L6492
        dec     $F0
        lda     $73
        bpl     L6482
        jsr     L6519
L6482:  jmp     L6509

L6485:  cmp     $EF
        bcs     L648B
        sta     $EF
L648B:  cmp     $F0
        bcc     L6491
        sta     $F0
L6491:  rts

L6492:  lda     $EA
        jsr     L6485
        lda     $EC
        jsr     L6485
        lda     $E9
        beq     L64BD
        lda     $EA
        beq     L64C0
        lda     $EB
        beq     L64C0
        lda     $EC
        beq     L64BD
        lda     $E9
        cmp     #$8B
        bne     L64B9
        lda     $EC
        bne     L64C0
        jmp     L64BD

L64B9:  lda     $EB
        beq     L64C0
L64BD:  jsr     L6519
L64C0:  ldy     $EF
        beq     L64CC
        sty     $F1
        dey
        sty     $E7
        jsr     L6541
L64CC:  lda     $E9
        bne     L64D9
        lda     $EC
        cmp     $EA
        bcs     L64E3
        jmp     L64E6

L64D9:  lda     $EB
        bne     L64E6
        lda     $EA
        cmp     $EC
        bcc     L64E6
L64E3:  jsr     L6519
L64E6:  jsr     L842B
        lda     $F0
        cmp     #$63
        beq     L6515
        lda     $E9
        bne     L64FC
        lda     $EC
        cmp     $EA
        bcc     L6506
        jmp     L6509

L64FC:  lda     $EB
        bne     L6509
        lda     $EA
        cmp     $EC
        bcs     L6509
L6506:  jsr     L6519
L6509:  lda     #$63
        sta     $E7
        sec
        sbc     $F0
        sta     $F1
        jsr     L6541
L6515:  jsr     L8278
        rts

L6519:  ldx     $ED
        ldy     $EE
        stx     $EE
        sty     $ED
        rts

L6522:  stx     $F3
        ldy     $12C8,x
        lda     $1358,x
        tax
        lda     $149E,x
        ora     ($8E),y
        sta     ($8E),y
        cpy     #$27
        bcs     L653E
        iny
        lda     $14A5,x
        ora     ($8E),y
        sta     ($8E),y
L653E:  ldx     $F3
        rts

L6541:  ldy     $E7
        lda     HiresTableLo,y
        sta     $8E
        lda     HiresTableHi,y
        sta     $8F
        lda     $ED
        beq     L6555
        cmp     #$FF
        bne     L6567
L6555:  ldy     #$27
L6557:  sta     ($8E),y
        dey
        sta     ($8E),y
        dey
        sta     ($8E),y
        dey
        sta     ($8E),y
        dey
        bpl     L6557
        bmi     L656A
L6567:  jsr     L663F
L656A:  dec     $E7
        dec     $F1
        bne     L6541
        rts

L6571:  sta     ($8E),y
        iny
L6574:  .byte   $49
L6575:  .byte   $7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        iny
        eor     #$7F
        sta     ($8E),y
        rts

L6637:  lda     $ED
        beq     L669D
        cmp     #$FF
        beq     L669D
L663F:  ldy     #$00
        jmp     L6571

L6644:  .byte   $A4
L6645:  .byte   $E7
L6646:  lda     HiresTableLo,y
        sta     $8E
        lda     HiresTableHi,y
        sta     $8F
        stx     $B2
        lda     $123C,x
        cmp     #$27
        beq     L6637
        asl     a
        asl     a
        adc     $123C,x
        tay
        ror     a
        lda     $EE
        bcs     L6666
        eor     #$7F
L6666:  sta     L6575,y
        lda     #$A9
        sta     L6574,y
        sty     $F3
        ldy     #$00
        lda     $ED
        jsr     L6571
        ldy     $F3
        lda     #$49
        sta     L6574,y
        lda     #$7F
        sta     L6575,y
        lda     $EE
        beq     L668B
        cmp     #$FF
        bne     L6695
L668B:  lda     #$8B
        sta     $27
        sec
        sbc     $B2
        jsr     L790E
L6695:  lda     $ED
        beq     L669D
        cmp     #$FF
        bne     L66A4
L669D:  lda     $B2
        sta     $27
        jsr     L790E
L66A4:  ldx     $B2
        rts

        brk
L66A8:  iny
L66A9:  adc     #$88
        pla
        .byte   $9F
        pla
        .byte   $8B
        .byte   $6F
        .byte   $AF
        adc     L6021
        .byte   $52
        .byte   $6B
        ldy     #$6B
        jmp     (LAD67)

        .byte   $67
        lda     $4867
        adc     L676C
        .byte   $DB
        rts

        .byte   $B2
        .byte   $67
        jmp     (L6C67)

        .byte   $67
        .byte   $C3
        .byte   $67
        .byte   $07
        .byte   $7B
        sbc     $F36D
        adc     L676C
        jmp     (L6C67)

        .byte   $67
        .byte   $80
        .byte   $67
        tsx
        .byte   $67
        ror     $6D
        ldx     $7A,y
        .byte   $D4
        .byte   $7A
        and     #$60
        adc     L6C60,x
        .byte   $67
        ror     L896E,x
        ror     L6E97
        sbc     ($6E),y
        .byte   $64
        .byte   $6B
        stx     L6C6D
        .byte   $67
        jmp     ($1D67)

        .byte   $6F
        iny
        .byte   $67
        jmp     (LE667)

        adc     #$6C
        .byte   $67
        jmp     (L6C67)

        .byte   $67
        .byte   $BB
        .byte   $67
        jmp     ($4767)

        adc     #$BA
        pla
        sbc     #$68
        jmp     (LA767)

        adc     #$6C
        .byte   $67
        jmp     (L6C67)

        .byte   $67
        jmp     (L6C67)

        .byte   $67
        jmp     (L6C67)

        .byte   $67
        jmp     (L6C67)

        .byte   $67
        jmp     (L8F67)

        pla
        ldx     $68
        lsr     L6C69
        .byte   $67
        jmp     (L6C67)

        .byte   $67
L6734:  lda     $08F2
        sta     $08F3
        lda     $0909
        sta     $090A
        lda     $08A8
        sta     $08A9
L6746:  lda     #$00
        sta     $08C4
        sta     $8A
L674D:  lda     $33
        cmp     #$20
        bcc     L6756
        jsr     L8752
L6756:  ldy     #$00
        lda     ($8B),y
        bmi     L6760
        cmp     #$46
        bmi     L6771
L6760:  lda     #$00
        sta     $090A
        sta     $08F3
        sta     $08A9
        rts

L676C:  lda     #$90
        jsr     L1F89
L6771:  asl     a
        tax
        lda     L66A8,x
        sta     L00A5
        lda     L66A9,x
        sta     $A6
        jmp     (L00A5)

        lda     $8B
        clc
        adc     #$03
        pha
        lda     $8C
        adc     #$00
        pha
        inc     $08B5
        iny
        lda     ($8B),y
        clc
        adc     $8B
        tax
        iny
        lda     ($8B),y
        adc     $8C
        sta     $8C
        stx     $8B
        jsr     L674D
        dec     $08B5
        pla
        sta     $8C
        pla
        sta     $8B
        jmp     L674D

        lda     #$03
        jmp     L67FD

        lda     $08C6
        beq     L67BA
        jmp     LF3CA

L67BA:  rts

        lda     #$FF
        sta     $2C
        lda     #$00
        sta     $B5
        lda     #$01
        jmp     L67FD

        lda     $2C
        bne     L67DD
        ldx     #$09
L67CE:  lda     $07,x
        sta     $D2,x
        dex
        bne     L67CE
        lda     #$01
        jsr     L67F1
        jmp     L6AE3

L67DD:  lda     $D3
        bmi     L67E8
        dec     $B5
        bmi     L67E8
        jsr     L6F98
L67E8:  lda     #$00
        sta     $2C
        lda     #$01
        jmp     L67FD

L67F1:  clc
        adc     $8B
        sta     $8B
        bcc     L67FA
        inc     $8C
L67FA:  rts

        lda     #$02
L67FD:  jsr     L67F1
        jmp     L6746

L6803:  ldy     #$D4
        .byte   $20
L6806:  .byte   $BC
L6807:  ror     $2CA5,x
        beq     L6839
        ldy     $B5
        cpy     #$3C
        bcs     L6843
        inc     $B5
        lda     $D4
        sta     $0AB8,y
        lda     $D5
        sta     $0AF8,y
        lda     $D6
        sta     $0B38,y
        lda     $D7
        sta     $0B78,y
        lda     $D8
        sta     $0BB8,y
        lda     $D9
        sta     $0BF8,y
        and     $D3
        sta     $D3
        jmp     L6843

L6839:  jsr     L73CB
        lda     $D3
        bne     L6843
        jsr     L7C0F
L6843:  rts

L6844:  ldy     #$CB
        .byte   $20
L6847:  .byte   $BC
L6848:  ror     $2CA5,x
        beq     L6874
        ldy     $B5
        inc     $B5
        lda     $CB
        sta     $0AB8,y
        lda     $CC
        sta     $0AF8,y
        lda     $CD
        sta     $0B38,y
        lda     $CE
        sta     $0B78,y
        lda     $CF
        sta     $0BB8,y
        lda     $D0
        sta     $0BF8,y
        sta     $D3
        jmp     L6843

L6874:  jsr     L7382
        lda     $CA
        bne     L687E
        jsr     L7BF3
L687E:  ldx     #$09
L6880:  lda     $C9,x
        sta     $07,x
        dex
        bne     L6880
        rts

        ldx     #$C5
        lda     #$80
        jmp     L6893

        ldx     #$BC
        lda     #$7E
L6893:  stx     L6847
        sta     L6848
        jsr     L6844
L689C:  jmp     L674D

        ldx     #$C5
        lda     #$80
        jmp     L68AA

        ldx     #$BC
        lda     #$7E
L68AA:  stx     L6806
        sta     L6807
        jsr     L6803
        lda     $2C
        bne     L689C
        jmp     L6AE3

        jsr     L6987
        lda     $2C
        beq     L68C7
        jsr     L6919
        jmp     L68E4

L68C7:  ldy     #$07
        lda     #$00
        sta     $CA
        sta     $08
L68CF:  lda     ($2D),y
        sta     $CB,y
        sta     $09,y
        dey
        bpl     L68CF
        lda     $D2
        bpl     L68E4
        lda     $D1
        sta     $CA
        sta     $08
L68E4:  lda     #$01
        jmp     L67FD

        jsr     L6987
        lda     $2C
        beq     L68FB
        jsr     L6919
        lda     #$01
        jsr     L67F1
        jmp     L674D

L68FB:  lda     #$00
        sta     $D3
        ldy     #$07
L6901:  lda     ($2D),y
        sta     $D4,y
        dey
        bpl     L6901
        lda     $DB
        bpl     L6911
        lda     $DA
        sta     $D3
L6911:  lda     #$01
        jsr     L67F1
        jmp     L6AE3

L6919:  ldy     #$00
        ldx     $B5
        inc     $B5
        lda     ($2D),y
        sta     $0AB8,x
        iny
        lda     ($2D),y
        sta     $0AF8,x
        iny
        lda     ($2D),y
        sta     $0B38,x
        iny
        lda     ($2D),y
        sta     $0B78,x
        iny
        lda     ($2D),y
        sta     $0BB8,x
        iny
        lda     ($2D),y
        sta     $0BF8,x
        and     $D3
        sta     $D3
        rts

        ldx     #$C5
        lda     #$80
        jmp     L6952

        ldx     #$BC
        lda     #$7E
L6952:  stx     L6806
        sta     L6807
        jsr     L6987
        ldx     #$09
L695D:  lda     $D2,x
        sta     $DB,x
        dex
        bne     L695D
        lda     #$FF
        sta     $DB
        jsr     L6803
        lda     $D3
        beq     L6971
        sta     $DA
L6971:  ldy     #$07
L6973:  lda     $D4,y
        sta     ($2D),y
        dey
        bpl     L6973
        ldx     #$09
L697D:  lda     $DB,x
        sta     $D2,x
        dex
        bne     L697D
        jmp     L674D

L6987:  iny
        lda     ($8B),y
L698A:  ldx     #$00
        stx     $2E
        asl     a
        rol     $2E
        asl     a
        rol     $2E
        asl     a
        rol     $2E
        adc     #$40
        sta     $2D
        lda     $2E
        adc     #$01
        sta     $2E
        lda     #$01
        jsr     L67F1
        rts

        jsr     L6987
        lda     #$01
        jsr     L67F1
        ldy     #$07
        lda     #$00
        sta     $CA
L69B5:  lda     ($2D),y
        sta     $CB,y
        dey
        bpl     L69B5
        lda     $D2
        bpl     L69D5
        lda     $D1
        sta     $CA
        jmp     L69D5

        ldx     #$C5
        lda     #$80
        stx     L6847
        sta     L6848
        jsr     L6844
L69D5:  lda     $CA
        beq     L69DC
        jmp     L674D

L69DC:  jsr     L7BF3
        tax
        jsr     L7963
L69E3:  jmp     L674D

        ldx     #$BC
        lda     #$7E
        stx     L6806
        stx     L6847
        sta     L6807
        sta     L6848
        jsr     L6844
        dec     $8B
        lda     $8B
        cmp     #$FF
        bne     L6A03
        dec     $8C
L6A03:  jsr     L6803
        lda     $CA
        and     $D3
        bne     L69E3
L6A0C:  lda     $2F
        cmp     $08EE
        beq     L6A2A
        bcs     L6A20
        ldx     #$CB
        jsr     L6ACD
        dec     $08EE
        jmp     L6A0C

L6A20:  ldx     #$D4
        jsr     L6ACD
        dec     $2F
        jmp     L6A0C

L6A2A:  sec
        lda     $D4
        sbc     $CB
        sta     $9E
        lda     $D5
        sbc     $CC
        sta     $9F
        sec
        lda     $D6
        sbc     $CD
        sta     $A0
        lda     $D7
        sbc     $CE
        sta     $A1
        sec
        lda     $D8
        sbc     $CF
        sta     $A2
        lda     $D9
        sbc     $D0
        sta     $A3
        ldx     #$9E
        jsr     L6ACD
        jsr     L6ACD
        jsr     L6ACD
        jsr     L6ACD
        lda     #$60
        sta     L6B4F
        lda     #$08
        sta     $0A51
L6A69:  jsr     L6874
        clc
        lda     $CB
        adc     $9E
        sta     $D4
        lda     $CC
        adc     $9F
        sta     $D5
        clc
        lda     $CD
        adc     $A0
        sta     $D6
        lda     $CE
        adc     $A1
        sta     $D7
        clc
        lda     $CF
        adc     $A2
        sta     $D8
        lda     $D0
        adc     $A3
        sta     $D9
        jsr     L6839
        jsr     L6AE3
        clc
        lda     $CB
        adc     $9E
        sta     $CB
        lda     $CC
        adc     $9F
        sta     $CC
        clc
        lda     $CD
        adc     $A0
        sta     $CD
        lda     $CE
        adc     $A1
        sta     $CE
        clc
        lda     $CF
        adc     $A2
        sta     $CF
        lda     $D0
        adc     $A3
        sta     $D0
        dec     $0A51
        bne     L6A69
        lda     #$4C
        sta     L6B4F
        jmp     L674D

L6ACD:  lda     $01,x
        rol     a
        ror     $01,x
        ror     $00,x
        lda     $03,x
        rol     a
        ror     $03,x
        ror     $02,x
        lda     $05,x
        rol     a
        ror     $05,x
        ror     $04,x
        rts

L6AE3:  lda     $CA
        and     $D3
        bne     L6B2F
        lda     $CA
        beq     L6AF7
        jsr     L7414
        inc     $08C4
        lda     $CA
        bne     L6B2F
L6AF7:  lda     $D3
        beq     L6B0D
        ldx     #$07
L6AFD:  lda     $D2,x
        sta     $DB,x
        dex
        bne     L6AFD
        jsr     L7428
        inc     $8A
        lda     $D3
        bne     L6B2F
L6B0D:  lda     $08C4
        beq     L6B15
        jsr     L7BF3
L6B15:  lda     $8A
        beq     L6B1C
        jsr     L7C0F
L6B1C:  lda     $D1
        ldx     $D2
        sta     $E9
        stx     $EA
        lda     $DA
        ldx     $DB
        sta     $EB
        stx     $EC
L6B2C:  jsr     L7988
L6B2F:  lda     $8A
        beq     L6B3F
        ldx     #$07
L6B35:  lda     $DB,x
        sta     $C9,x
        dex
        bne     L6B35
        jmp     L6B48

L6B3F:  ldx     #$09
L6B41:  lda     $D2,x
        sta     $C9,x
        dex
        bne     L6B41
L6B48:  lda     #$00
        sta     $8A
        sta     $08C4
L6B4F:  jmp     L674D

L6B52:  iny
        lda     ($8B),y
        sta     $E8,y
        cpy     #$04
        bne     L6B52
        jsr     L7988
        lda     #$05
        jmp     L67FD

        iny
        lda     ($8B),y
        pha
        lda     $5A
        ldx     $5B
        sta     $18
        stx     $19
        lda     $62
        ldx     $63
        sta     $1E
        stx     $1F
        lda     $0836
        beq     L6B8A
        lda     $0A73
        ldx     $0A74
        sta     $1B
        stx     $1C
        jmp     L6B92

L6B8A:  lda     $5E
        ldx     $5F
        sta     $1B
        stx     $1C
L6B92:  lda     #$FF
        sta     $AD
        pla
        tax
        jsr     L6BB0
        lda     #$08
        jmp     L67FD

        iny
        lda     ($8B),y
        tax
        lda     #$00
        sta     $AD
        jsr     L6BB0
        lda     #$0E
        jmp     L67FD

L6BB0:  sec
        lda     $AD
        bne     L6BC3
        lda     $5A
        iny
        sbc     ($8B),y
        sta     $18
        lda     $5B
        iny
        sbc     ($8B),y
        sta     $19
L6BC3:  lda     $5C
        iny
        sbc     ($8B),y
        sta     $66
        lda     $5D
        iny
        sbc     ($8B),y
        sta     $67
        sec
        lda     $0836
        beq     L6BFE
        lda     $AD
        bne     L6BEB
        lda     $0A73
        iny
        sbc     ($8B),y
        sta     $1B
        lda     $0A74
        iny
        sbc     ($8B),y
        sta     $1C
L6BEB:  lda     $0A75
        iny
        sbc     ($8B),y
        sta     $68
        lda     $0A76
        iny
        sbc     ($8B),y
        sta     $69
        jmp     L6C1E

L6BFE:  lda     $AD
        bne     L6C10
        lda     $5E
        iny
        sbc     ($8B),y
        sta     $1B
        lda     $5F
        iny
        sbc     ($8B),y
        sta     $1C
L6C10:  lda     $60
        iny
        sbc     ($8B),y
        sta     $68
        lda     $61
        iny
        sbc     ($8B),y
        sta     $69
L6C1E:  sec
        lda     $AD
        bne     L6C31
        lda     $62
        iny
        sbc     ($8B),y
        sta     $1E
        lda     $63
        iny
        sbc     ($8B),y
        sta     $1F
L6C31:  lda     $64
        iny
        sbc     ($8B),y
        sta     $6A
        lda     $65
        iny
        sbc     ($8B),y
        sta     $6B
        dex
        dex
        bmi     L6C53
        bne     L6C48
        jmp     L6CCE

L6C48:  cpx     #$02
        beq     L6C6E
        cpx     #$04
        beq     L6C89
        jmp     L6D28

L6C53:  lda     $18
        ldx     $19
        sta     $66
        stx     $67
        lda     $1B
        ldx     $1C
        .byte   $85
L6C60:  pla
        stx     $69
        lda     $1E
        ldx     $1F
L6C67:  sta     $6A
L6C69:  stx     $6B
        .byte   $4C
        plp
L6C6D:  .byte   $6D
L6C6E:  ldx     $19
        ldy     $66
        stx     $66
        sty     $67
        ldx     $1C
        ldy     $68
        stx     $68
        sty     $69
        ldx     $1F
        ldy     $6A
        stx     $6A
        sty     $6B
        jmp     L6D28

L6C89:  lda     $19
        asl     a
        rol     $66
        rol     $67
        asl     a
        rol     $66
        rol     $67
        asl     a
        rol     $66
        rol     $67
        asl     a
        rol     $66
        rol     $67
        lda     $1C
        asl     a
        rol     $68
        rol     $69
        asl     a
        rol     $68
        rol     $69
        asl     a
        rol     $68
        rol     $69
        asl     a
        rol     $68
        rol     $69
        lda     $1F
        asl     a
        rol     $6A
        rol     $6B
        asl     a
        rol     $6A
        rol     $6B
        asl     a
        rol     $6A
        rol     $6B
        asl     a
        rol     $6A
        rol     $6B
        jmp     L6D28

L6CCE:  lda     $66
        sta     $67
        lda     $19
        sta     $66
        lda     $18
        asl     a
        rol     $66
        rol     $67
        asl     a
        rol     $66
        rol     $67
        asl     a
        rol     $66
        rol     $67
        asl     a
        rol     $66
        rol     $67
        lda     $68
        sta     $69
        lda     $1C
        sta     $68
        lda     $1B
        asl     a
        rol     $68
        rol     $69
        asl     a
        rol     $68
        rol     $69
        asl     a
        rol     $68
        rol     $69
        asl     a
        rol     $68
        rol     $69
        lda     $6A
        sta     $6B
        lda     $1F
        sta     $6A
        lda     $1E
        asl     a
        rol     $6A
        rol     $6B
        asl     a
        rol     $6A
        rol     $6B
        asl     a
        rol     $6A
        rol     $6B
        asl     a
        rol     $6A
        rol     $6B
L6D28:  lda     $69
        bne     L6D32
        lda     $68
        bne     L6D32
        inc     $68
L6D32:  lda     $68
        cmp     $35
        sta     $35
        bne     L6D40
        lda     $69
        cmp     $36
        beq     L6D43
L6D40:  jsr     L631D
L6D43:  lda     $69
        sta     $36
        rts

        jsr     L6D56
        lda     L00A5
        ldx     $A6
        sta     $8B
        stx     $8C
        jmp     L674D

L6D56:  iny
        lda     ($8B),y
        clc
        adc     $8B
        sta     L00A5
        iny
        lda     ($8B),y
        adc     $8C
        sta     $A6
        rts

        iny
        lda     ($8B),y
        sta     L00A5
        iny
        lda     ($8B),y
        sta     $A6
        iny
        lda     ($8B),y
        sta     $A7
        iny
        lda     ($8B),y
        sty     $B3
        sta     $A8
        ldy     #$00
        lda     ($A7),y
        sta     (L00A5),y
        iny
        lda     ($A7),y
        sta     (L00A5),y
        ldy     $B3
        lda     #$05
        jmp     L67FD

        iny
        lda     ($8B),y
        sta     $A7
        iny
        lda     ($8B),y
        sta     $A8
        iny
        lda     ($8B),y
        ldx     #$00
        sta     ($A7,x)
        iny
        lda     ($8B),y
        sty     $B3
        ldy     #$01
        sta     ($A7),y
        ldy     $B3
        lda     #$05
        jmp     L67FD

        jsr     L6D56
        lda     #$02
        jsr     L67F1
        lda     #$F8
L6DB9:  sta     $DC
L6DBB:  ldy     #$00
        iny
        lda     ($8B),y
        bmi     L6DD9
        jsr     L698A
        ldy     #$07
        lda     ($2D),y
        bmi     L6DCF
        lda     #$00
        beq     L6DB9
L6DCF:  dey
        lda     ($2D),y
        and     $DC
        sta     $DC
        jmp     L6DBB

L6DD9:  lda     #$02
        jsr     L67F1
        lda     $DC
        beq     L6DF0
        lda     L00A5
        ldx     $A6
        sta     $8B
        stx     $8C
        jmp     L674D

        jsr     L6E17
L6DF0:  jmp     L674D

        jsr     L6E17
        sec
        lda     $0836
        beq     L6E07
        lda     $0A75
        sbc     $98
        lda     $0A76
        jmp     L6E0D

L6E07:  lda     $60
        sbc     $98
        lda     $61
L6E0D:  sbc     $99
        bmi     L6E14
        jmp     L6EE6

L6E14:  jmp     L674D

L6E17:  jsr     L6D56
        iny
        lda     ($8B),y
        sta     $98
        iny
        lda     ($8B),y
        sta     $99
        lda     #$64
        sta     L6E49
        lda     #$65
        sta     L6E50
        jsr     L6E44
        lda     #$5C
        sta     L6E49
        lda     #$5D
        sta     L6E50
        jsr     L6E44
        lda     #$09
        jsr     L67F1
        rts

L6E44:  iny
        lda     ($8B),y
        sec
        .byte   $E5
L6E49:  .byte   $64
        sta     $AB
        iny
        lda     ($8B),y
        .byte   $E5
L6E50:  adc     $85
        ldy     $0E30
        lda     $98
        sec
        sbc     $AB
        lda     $99
        sbc     $AC
        bpl     L6E6E
        jmp     L6E6F

        lda     $98
        clc
        adc     $AB
        lda     $99
        adc     $AC
        bmi     L6E6F
L6E6E:  rts

L6E6F:  pla
        pla
        pla
        pla
        lda     L00A5
        ldx     $A6
        sta     $8B
        stx     $8C
        jmp     L674D

        jsr     L6D56
        jsr     L6EA8
        lda     #$09
        jmp     L67FD

        jsr     L6D56
        jsr     L6EA8
        jsr     L6EA8
        lda     #$0F
        jmp     L67FD

L6E97:  jsr     L6D56
        jsr     L6EA8
        jsr     L6EA8
        jsr     L6EA8
        lda     #$15
        jmp     L67FD

L6EA8:  iny
        lda     ($8B),y
        sta     $8E
        iny
        lda     ($8B),y
        sta     $8F
        ldx     #$00
        lda     ($8E,x)
        sta     L6ED5
        inc     $8E
        bne     L6EBF
        inc     $8F
L6EBF:  sec
        iny
        sbc     ($8B),y
        lda     ($8E,x)
        iny
        sbc     ($8B),y
        bmi     L6ECE
        bvs     L6EE4
        bvc     L6ED0
L6ECE:  bvc     L6EE4
L6ED0:  iny
        lda     ($8B),y
        sec
        .byte   $E9
L6ED5:  brk
        iny
        lda     ($8B),y
        sbc     ($8E,x)
        bmi     L6EE1
        bvs     L6EE4
        bvc     L6EE3
L6EE1:  bvc     L6EE4
L6EE3:  rts

L6EE4:  pla
        pla
L6EE6:  lda     L00A5
        ldx     $A6
        sta     $8B
        stx     $8C
        jmp     L674D

        jsr     L6D56
        iny
        lda     ($8B),y
        sta     $8E
        iny
        lda     ($8B),y
        sta     $8F
        iny
        lda     ($8B),y
        sta     $A9
        iny
        lda     ($8B),y
        sty     $B3
        ldy     #$01
        and     ($8E),y
        bne     L6F16
        lda     $A9
        ldy     #$00
        and     ($8E),y
        beq     L6EE6
L6F16:  ldy     $B3
        lda     #$07
        jmp     L67FD

        iny
        lda     ($8B),y
        sta     $A9
        jsr     L6D56
        iny
        lda     ($8B),y
        sta     $AB
        iny
        lda     ($8B),y
        sta     $AC
        iny
        lda     ($8B),y
        sta     $AD
        iny
        lda     ($8B),y
        sty     $B3
        sta     $AE
        lda     $A9
        beq     L6F71
        cmp     #$02
        beq     L6F5A
        ldy     #$00
        sec
        lda     ($AB),y
        sbc     ($AD),y
        iny
        lda     ($AB),y
        sbc     ($AD),y
        bmi     L6F55
        bvc     L6F84
        bvs     L6F57
L6F55:  bvs     L6F84
L6F57:  jmp     L6EE6

L6F5A:  ldy     #$00
        sec
        lda     ($AB),y
        sbc     ($AD),y
        iny
        lda     ($AB),y
        sbc     ($AD),y
        bmi     L6F6C
        bvs     L6F84
        bvc     L6F6E
L6F6C:  bvc     L6F84
L6F6E:  jmp     L6EE6

L6F71:  ldy     #$01
        lda     ($AB),y
        cmp     ($AD),y
        bne     L6F84
        ldy     #$00
        lda     ($AB),y
        cmp     ($AD),y
        bne     L6F84
        jmp     L6EE6

L6F84:  ldy     $B3
        lda     #$08
        jmp     L67FD

        lda     $08C6
        beq     L6F93
        jmp     LF261

L6F93:  lda     #$06
        jmp     L67FD

L6F98:  inc     $B5
        ldx     $B5
        lda     $0AB8
        sta     $0AB8,x
        lda     $0AF8
        sta     $0AF8,x
        lda     $0B38
        sta     $0B38,x
        lda     $0B78
        sta     $0B78,x
        lda     $0BB8
        sta     $0BB8,x
        lda     $0BF8
        sta     $0BF8,x
        lda     $0BB8
        sec
        sbc     $0AB8
        lda     $0BF8
        sbc     $0AF8
        bmi     L6FD3
        lda     #$00
        beq     L6FD5
L6FD3:  lda     #$FF
L6FD5:  sta     $B4
        dex
        ldy     #$00
L6FDA:  lda     $0BB8,x
        sec
        sbc     $0AB8,x
        lda     $0BF8,x
        sbc     $0AF8,x
        bmi     L6FED
        lda     #$00
        beq     L6FEF
L6FED:  lda     #$FF
L6FEF:  cmp     $B4
        sta     $B4
        beq     L705F
        lda     $0AB8,x
        sta     $D4
        lda     $0AF8,x
        sta     $D5
        lda     $0B38,x
        sta     $D6
        lda     $0B78,x
        sta     $D7
        lda     $0BB8,x
        sta     $D8
        lda     $0BF8,x
        sta     $D9
        lda     $0AB9,x
        sta     $CB
        lda     $0AF9,x
        sta     $CC
        lda     $0B39,x
        sta     $CD
        lda     $0B79,x
        sta     $CE
        lda     $0BB9,x
        sta     $CF
        lda     $0BF9,x
        sta     $D0
        sty     $B1
        stx     $B0
        jsr     L7576
        ldx     $B0
        ldy     $B1
        lda     $D9
        sta     $0D78,y
        ora     $D8
        beq     L705F
        lda     $D8
        sta     $0D38,y
        lda     $D4
        sta     $0C38,y
        lda     $D5
        sta     $0C78,y
        lda     $D6
        sta     $0CB8,y
        lda     $D7
        sta     $0CF8,y
        iny
L705F:  lda     $B4
        bne     L7088
        lda     $0AB8,x
        sta     $0C38,y
        lda     $0AF8,x
        sta     $0C78,y
        lda     $0B38,x
        sta     $0CB8,y
        lda     $0B78,x
        sta     $0CF8,y
        lda     $0BB8,x
        sta     $0D38,y
        lda     $0BF8,x
        sta     $0D78,y
        iny
L7088:  dex
        bmi     L708E
        jmp     L6FDA

L708E:  sty     $B5
        lda     $B5
        bne     L7095
        rts

L7095:  ldx     $B5
        lda     $0C38
        sta     $0C38,x
        lda     $0C78
        sta     $0C78,x
        lda     $0CB8
        sta     $0CB8,x
        lda     $0CF8
        sta     $0CF8,x
        lda     $0D38
        sta     $0D38,x
        lda     $0D78
        sta     $0D78,x
        lda     $0D38
        sec
        sbc     $0CB8
        lda     $0D78
        sbc     $0CF8
        bmi     L70CE
        lda     #$00
        beq     L70D0
L70CE:  lda     #$FF
L70D0:  sta     $B4
        dex
        ldy     #$00
L70D5:  lda     $0D38,x
        sec
        sbc     $0CB8,x
        lda     $0D78,x
        sbc     $0CF8,x
        bmi     L70E8
        lda     #$00
        beq     L70EA
L70E8:  lda     #$FF
L70EA:  cmp     $B4
        sta     $B4
        beq     L715A
        lda     $0C38,x
        sta     $D4
        lda     $0C78,x
        sta     $D5
        lda     $0CB8,x
        sta     $D6
        lda     $0CF8,x
        sta     $D7
        lda     $0D38,x
        sta     $D8
        lda     $0D78,x
        sta     $D9
        lda     $0C39,x
        sta     $CB
        lda     $0C79,x
        sta     $CC
        lda     $0CB9,x
        sta     $CD
        lda     $0CF9,x
        sta     $CE
        lda     $0D39,x
        sta     $CF
        lda     $0D79,x
        sta     $D0
        stx     $B0
        sty     $B1
        jsr     L7470
        ldx     $B0
        ldy     $B1
        lda     $D9
        sta     $0BF8,y
        ora     $D8
        beq     L715A
        lda     $D8
        sta     $0BB8,y
        lda     $D4
        sta     $0AB8,y
        lda     $D5
        sta     $0AF8,y
        lda     $D6
        sta     $0B38,y
        lda     $D7
        sta     $0B78,y
        iny
L715A:  lda     $B4
        bne     L7183
        lda     $0C38,x
        sta     $0AB8,y
        lda     $0C78,x
        sta     $0AF8,y
        lda     $0CB8,x
        sta     $0B38,y
        lda     $0CF8,x
        sta     $0B78,y
        lda     $0D38,x
        sta     $0BB8,y
        lda     $0D78,x
        sta     $0BF8,y
        iny
L7183:  dex
        bmi     L7189
        jmp     L70D5

L7189:  sty     $B5
        lda     $B5
        bne     L7190
        rts

L7190:  ldx     $B5
        lda     $0AB8
        sta     $0AB8,x
        lda     $0AF8
        sta     $0AF8,x
        lda     $0B38
        sta     $0B38,x
        lda     $0B78
        sta     $0B78,x
        lda     $0BB8
        sta     $0BB8,x
        lda     $0BF8
        sta     $0BF8,x
        lda     $0AB8
        clc
        adc     $0BB8
        lda     $0AF8
        adc     $0BF8
        bpl     L71C9
        lda     #$FF
        bne     L71CB
L71C9:  lda     #$00
L71CB:  sta     $B4
        dex
        ldy     #$00
L71D0:  lda     $0AB8,x
        clc
        adc     $0BB8,x
        lda     $0AF8,x
        adc     $0BF8,x
        bpl     L71E3
        lda     #$FF
        bne     L71E5
L71E3:  lda     #$00
L71E5:  cmp     $B4
        sta     $B4
        beq     L7255
        lda     $0AB8,x
        sta     $D4
        lda     $0AF8,x
        sta     $D5
        lda     $0B38,x
        sta     $D6
        lda     $0B78,x
        sta     $D7
        lda     $0BB8,x
        sta     $D8
        lda     $0BF8,x
        sta     $D9
        lda     $0AB9,x
        sta     $CB
        lda     $0AF9,x
        sta     $CC
        lda     $0B39,x
        sta     $CD
        lda     $0B79,x
        sta     $CE
        lda     $0BB9,x
        sta     $CF
        lda     $0BF9,x
        sta     $D0
        stx     $B0
        sty     $B1
        jsr     L75F4
        ldx     $B0
        ldy     $B1
        lda     $D9
        sta     $0D78,y
        ora     $D8
        beq     L7255
        lda     $D8
        sta     $0D38,y
        lda     $D4
        sta     $0C38,y
        lda     $D5
        sta     $0C78,y
        lda     $D6
        sta     $0CB8,y
        lda     $D7
        sta     $0CF8,y
        iny
L7255:  lda     $B4
        bne     L727E
        lda     $0AB8,x
        sta     $0C38,y
        lda     $0AF8,x
        sta     $0C78,y
        lda     $0B38,x
        sta     $0CB8,y
        lda     $0B78,x
        sta     $0CF8,y
        lda     $0BB8,x
        sta     $0D38,y
        lda     $0BF8,x
        sta     $0D78,y
        iny
L727E:  dex
        bmi     L7284
        jmp     L71D0

L7284:  sty     $B5
        lda     $B5
        bne     L728B
        rts

L728B:  ldx     $B5
        lda     $0C38
        sta     $0C38,x
        lda     $0C78
        sta     $0C78,x
        lda     $0CB8
        sta     $0CB8,x
        lda     $0CF8
        sta     $0CF8,x
        lda     $0D38
        sta     $0D38,x
        lda     $0D78
        sta     $0D78,x
        lda     $0CB8
        clc
        adc     $0D38
        lda     $0CF8
        adc     $0D78
        bpl     L72C4
        lda     #$FF
        bne     L72C6
L72C4:  lda     #$00
L72C6:  sta     $B4
        dex
        ldy     #$00
L72CB:  lda     $0CB8,x
        clc
        adc     $0D38,x
        lda     $0CF8,x
        adc     $0D78,x
        bpl     L72DE
        lda     #$FF
        bne     L72E0
L72DE:  lda     #$00
L72E0:  cmp     $B4
        sta     $B4
        beq     L7350
        lda     $0C38,x
        sta     $D4
        lda     $0C78,x
        sta     $D5
        lda     $0CB8,x
        sta     $D6
        lda     $0CF8,x
        sta     $D7
        lda     $0D38,x
        sta     $D8
        lda     $0D78,x
        sta     $D9
        lda     $0C39,x
        sta     $CB
        lda     $0C79,x
        sta     $CC
        lda     $0CB9,x
        sta     $CD
        lda     $0CF9,x
        sta     $CE
        lda     $0D39,x
        sta     $CF
        lda     $0D79,x
        sta     $D0
        stx     $B0
        sty     $B1
        jsr     L74EE
        ldx     $B0
        ldy     $B1
        lda     $D9
        sta     $0BF8,y
        ora     $D8
        beq     L7350
        lda     $D8
        sta     $0BB8,y
        lda     $D4
        sta     $0AB8,y
        lda     $D5
        sta     $0AF8,y
        lda     $D6
        sta     $0B38,y
        lda     $D7
        sta     $0B78,y
        iny
L7350:  lda     $B4
        bne     L7379
        lda     $0C38,x
        sta     $0AB8,y
        lda     $0C78,x
        sta     $0AF8,y
        lda     $0CB8,x
        sta     $0B38,y
        lda     $0CF8,x
        sta     $0B78,y
        lda     $0D38,x
        sta     $0BB8,y
        lda     $0D78,x
        sta     $0BF8,y
        iny
L7379:  dex
        bmi     L737F
        jmp     L72CB

L737F:  jmp     L7684

L7382:  ldx     #$00
        lda     $D0
        bpl     L738A
        ldx     #$80
L738A:  lda     $CB
        clc
        adc     $CF
        lda     $CC
        adc     $D0
        bpl     L7399
        txa
        ora     #$40
        tax
L7399:  lda     $CF
        sec
        sbc     $CB
        lda     $D0
        sbc     $CC
        bpl     L73A8
        txa
        ora     #$20
        tax
L73A8:  lda     $CD
        clc
        adc     $CF
        lda     $CE
        adc     $D0
        bpl     L73B7
        txa
        ora     #$10
        tax
L73B7:  lda     $CF
        sec
        sbc     $CD
        lda     $D0
        sbc     $CE
        bpl     L73C8
        txa
        ora     #$08
        sta     $CA
        rts

L73C8:  stx     $CA
        rts

L73CB:  ldx     #$00
        lda     $D9
        bpl     L73D3
        ldx     #$80
L73D3:  lda     $D4
        clc
        adc     $D8
        lda     $D5
        adc     $D9
        bpl     L73E2
        txa
        ora     #$40
        tax
L73E2:  lda     $D8
        sec
        sbc     $D4
        lda     $D9
        sbc     $D5
        bpl     L73F1
        txa
        ora     #$20
        tax
L73F1:  lda     $D6
        clc
        adc     $D8
        lda     $D7
        adc     $D9
        bpl     L7400
        txa
        ora     #$10
        tax
L7400:  lda     $D8
        sec
        sbc     $D6
        lda     $D9
        sbc     $D7
        bpl     L7411
        txa
        ora     #$08
        sta     $D3
        rts

L7411:  stx     $D3
        rts

L7414:  jsr     L741A
        jsr     L7428
L741A:  ldx     #$06
L741C:  lda     $CA,x
        ldy     $D3,x
        sta     $D3,x
        sty     $CA,x
        dex
        bpl     L741C
        rts

L7428:  lda     $D3
        bne     L742D
L742C:  rts

L742D:  and     #$40
        beq     L743D
        jsr     L75F4
        jsr     L73CB
        lda     $D3
        and     $CA
        bne     L742C
L743D:  lda     $D3
        and     #$20
        beq     L744F
        jsr     L7576
        jsr     L73CB
        lda     $D3
        and     $CA
        bne     L742C
L744F:  lda     $D3
        and     #$10
        beq     L7461
        jsr     L74EE
        jsr     L73CB
        lda     $D3
        and     $CA
        bne     L742C
L7461:  lda     $D3
        and     #$08
        beq     L742C
        jsr     L7470
        jmp     L73CB

L746D:  jsr     L7679
L7470:  sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $CD
        sec
        sbc     $D6
        tax
        lda     $CE
        sbc     $D7
        tay
        txa
        sec
        sbc     $C4
        sta     $C4
        tya
        sbc     $C5
        bvs     L746D
        sta     $C5
        lda     $D8
        sec
        sbc     $D6
        tax
        lda     $D9
        sbc     $D7
        jsr     L16A2
        sec
        lda     $CB
        sbc     $D4
        sta     $C4
        lda     $CC
        sbc     $D5
        sta     $C5
        lda     $C2
        ldx     $C3
        sta     $A9
        stx     $AA
        jsr     L1569
        clc
        adc     $D4
        sta     $D4
        txa
        adc     $D5
        sta     $D5
        sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $A9
        ldx     $AA
        sta     $C2
        stx     $C3
        jsr     L1569
        clc
        adc     $D8
        sta     $D8
        sta     $D6
        txa
        adc     $D9
        sta     $D9
        sta     $D7
        rts

L74EB:  jsr     L7679
L74EE:  sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $D6
        sec
        sbc     $CD
        tax
        lda     $D7
        sbc     $CE
        tay
        txa
        sec
        sbc     $C4
        sta     $C4
        tya
        sbc     $C5
        bvs     L74EB
        sta     $C5
        lda     $D8
        clc
        adc     $D6
        tax
        lda     $D9
        adc     $D7
        jsr     L16A2
        sec
        lda     $CB
        sbc     $D4
        sta     $C4
        lda     $CC
        sbc     $D5
        sta     $C5
        lda     $C2
        ldx     $C3
        sta     $A9
        stx     $AA
        jsr     L1569
        clc
        adc     $D4
        sta     $D4
        txa
        adc     $D5
        sta     $D5
        sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $A9
        ldx     $AA
        sta     $C2
        stx     $C3
        jsr     L1569
        clc
        adc     $D8
        sta     $D8
        eor     #$FF
        sta     $D6
        txa
        adc     $D9
        sta     $D9
        eor     #$FF
        sta     $D7
        inc     $D6
        bne     L7572
        inc     $D7
L7572:  rts

L7573:  jsr     L7679
L7576:  sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $CB
        sec
        sbc     $D4
        tax
        lda     $CC
        sbc     $D5
        tay
        txa
        sec
        sbc     $C4
        sta     $C4
        tya
        sbc     $C5
        bvs     L7573
        sta     $C5
        lda     $D8
        sec
        sbc     $D4
        tax
        lda     $D9
        sbc     $D5
        jsr     L16A2
        sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $C2
        ldx     $C3
        sta     $A9
        stx     $AA
        jsr     L1569
        clc
        adc     $D8
        sta     $D8
        sta     $D4
        txa
        adc     $D9
        sta     $D9
        sta     $D5
        sec
        lda     $CD
        sbc     $D6
        sta     $C4
        lda     $CE
        sbc     $D7
        sta     $C5
        lda     $A9
        ldx     $AA
        sta     $C2
        stx     $C3
        jsr     L1569
        clc
        adc     $D6
        sta     $D6
        txa
        adc     $D7
        sta     $D7
        rts

L75F1:  jsr     L7679
L75F4:  sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $D4
        sec
        sbc     $CB
        tax
        lda     $D5
        sbc     $CC
        tay
        txa
        sec
        sbc     $C4
        sta     $C4
        tya
        sbc     $C5
        bvs     L75F1
        sta     $C5
        lda     $D8
        clc
        adc     $D4
        tax
        lda     $D9
        adc     $D5
        jsr     L16A2
        sec
        lda     $CD
        sbc     $D6
        sta     $C4
        lda     $CE
        sbc     $D7
        sta     $C5
        lda     $C2
        ldx     $C3
        sta     $A9
        stx     $AA
        jsr     L1569
        clc
        adc     $D6
        sta     $D6
        txa
        adc     $D7
        sta     $D7
        sec
        lda     $CF
        sbc     $D8
        sta     $C4
        lda     $D0
        sbc     $D9
        sta     $C5
        lda     $A9
        ldx     $AA
        sta     $C2
        stx     $C3
        jsr     L1569
        clc
        adc     $D8
        sta     $D8
        eor     #$FF
        sta     $D4
        txa
        adc     $D9
        sta     $D9
        eor     #$FF
        sta     $D5
        inc     $D4
        bne     L7678
        inc     $D5
L7678:  rts

L7679:  ldx     #$CB
        jsr     L6ACD
        ldx     #$D4
        jsr     L6ACD
        rts

L7684:  dey
        bmi     L7678
        sty     $B5
        lda     #$8B
        sta     $53
        lda     #$63
        sta     $EF
        lda     #$00
        sta     $54
        sta     $F0
        tya
        tax
L7699:  lda     $0AB8,x
        sta     $C2
        lda     $0AF8,x
        sta     $C3
        lda     $0BB8,x
        sta     $C4
        lda     $0BF8,x
        sta     $C5
        ldy     $0B38,x
        lda     $0B78,x
        stx     $B2
        jsr     L7E80
        ldx     $B2
        sta     $0C78,x
        cmp     $53
        bcs     L76C3
        sta     $53
L76C3:  cmp     $54
        bcc     L76C9
        sta     $54
L76C9:  tya
        sta     $0CF8,x
        cmp     $EF
        bcs     L76D3
        sta     $EF
L76D3:  cmp     $F0
        bcc     L76D9
        sta     $F0
L76D9:  dex
        bpl     L7699
        lda     $54
        sec
        sbc     $53
        lsr     a
        tax
        lda     $F0
        sec
        sbc     $EF
        tay
        jsr     L180C
        clc
        adc     $32
        sta     $32
        tya
        adc     $33
        sta     $33
        ldx     $B5
        lda     $0C78,x
        sta     $0C77
        lda     $0CF8,x
        sta     $0CF7
        inx
        lda     $0C78
        sta     $0C78,x
        lda     $0CF8
        sta     $0CF8,x
        inx
        lda     $0C79
        sta     $0C78,x
        lda     $0CF9
        sta     $0CF8,x
        inc     $B5
        ldy     #$00
        ldx     #$00
L7724:  lda     #$00
        sta     $0B38,x
        lda     $0CF9,y
        sec
        sbc     $0CF8,y
        bne     L7735
        jmp     L77EA

L7735:  bcs     L775F
        eor     #$FF
        adc     #$01
        sta     $0AF8,x
        lda     $0CF9,y
        sta     $0AB8,x
        lda     $0CF7,y
        cmp     $0CF8,y
        bcc     L774F
        inc     $0B38,x
L774F:  lda     $0C79,y
        sta     $0B78,x
        lda     $0C78,y
        sec
        sbc     $0C79,y
        jmp     L7780

L775F:  sta     $0AF8,x
        lda     $0CF8,y
        sta     $0AB8,x
        lda     $0CFA,y
        cmp     $0CF9,y
        bcc     L7773
        inc     $0B38,x
L7773:  lda     $0C78,y
        sta     $0B78,x
        lda     $0C79,y
        sec
        sbc     $0C78,y
L7780:  php
        bcs     L778A
        sta     $AF
        lda     #$00
        sec
        sbc     $AF
L778A:  sta     $F5
        lda     $0AF8,x
        sta     $F6
        stx     $B0
        sty     $B1
        lda     #$00
        sta     $F4
        sta     $F8
        sta     $F9
        ldx     #$10
L779F:  asl     $F4
        rol     $F5
        rol     $F8
        rol     $F9
        sec
        lda     $F8
        sbc     $F6
        tay
        lda     $F9
        sbc     $F7
        bcc     L77B9
        inc     $F4
        sta     $F9
        sty     $F8
L77B9:  dex
        bne     L779F
        ldx     $B0
        ldy     $B1
        lda     $0B38,x
        beq     L77C8
        dec     $0AF8,x
L77C8:  plp
        bcs     L77DD
        lda     #$00
        sec
        sbc     $F4
        sta     $0BB8,x
        lda     #$00
        sbc     $F5
        sta     $0BF8,x
        jmp     L7831

L77DD:  lda     $F4
        sta     $0BB8,x
        lda     $F5
        sta     $0BF8,x
        jmp     L7831

L77EA:  lda     #$FF
        sta     $0AF8,x
        lda     $0CF8,y
        sta     $0AB8,x
        cmp     $0CF7,y
        php
        lda     $0C78,y
        sta     $0BF8,x
        sta     $0B78,x
L7802:  iny
        lda     $0C78,y
        cmp     $0BF8,x
        bcs     L780E
        sta     $0BF8,x
L780E:  cmp     $0B78,x
        bcc     L7816
        sta     $0B78,x
L7816:  lda     $0AB8,x
        cmp     $0CF9,y
        beq     L7802
        bcs     L7825
        plp
        bcc     L7833
        bcs     L7826
L7825:  plp
L7826:  lda     $0B78,x
        sec
        sbc     $0BF8,x
        sta     $0BF8,x
        dey
L7831:  inx
        iny
L7833:  cpy     $B5
        bpl     L783A
        jmp     L7724

L783A:  dex
        stx     $25
        jsr     L7BA0
        lda     $EF
        sta     $B1
        lda     #$00
        sta     $C6
        sta     $C7
L784A:  ldx     $25
        lda     #$02
        sta     L7889
        ldy     $B1
        lda     HiresTableLo,y
        sta     $8E
        lda     HiresTableHi,y
        sta     $8F
L785D:  lda     $B1
        cmp     $0AB8,x
        bne     L789B
        lda     $0AF8,x
        bpl     L787B
        lda     $0B78,x
        sta     $27
        lda     $0BF8,x
        stx     $B0
        jsr     L790E
        ldx     $B0
        jmp     L789B

L787B:  lda     $0B38,x
        clc
        adc     $0BB8,x
        sta     $0B38,x
        lda     $0B78,x
        .byte   $85
L7889:  .byte   $02
        inc     L7889
        adc     $0BF8,x
        sta     $0B78,x
        dec     $0AF8,x
        bmi     L789B
        inc     $0AB8,x
L789B:  dex
        bpl     L785D
        lda     L7889
        sec
        sbc     #$03
        bmi     L78E0
        sta     $26
        tay
        clc
        adc     $C6
        sta     $C6
        bcc     L78B2
        inc     $C7
L78B2:  tya
        tax
        dex
L78B5:  lda     $02,x
        cmp     $02,y
        bcs     L78C6
        pha
        lda     $02,y
        sta     $02,x
        pla
        sta     $02,y
L78C6:  dex
        bpl     L78B5
        dey
        bne     L78B2
        ldx     $26
L78CE:  lda     $01,x
        sta     $27
        sec
        sbc     $02,x
        stx     $B2
        jsr     L790E
        ldx     $B2
        dex
        dex
        bpl     L78CE
L78E0:  inc     $B1
        ldy     $F0
        cpy     $B1
        bmi     L78EB
        jmp     L784A

L78EB:  lda     $33
        cmp     #$20
        bcc     L78F4
        jsr     L8752
L78F4:  lda     $C6
        asl     a
        rol     $C7
        asl     a
        rol     $C7
        asl     a
        rol     $C7
        asl     a
        rol     $C7
        clc
        adc     $32
        sta     $32
        lda     $C7
        adc     $33
        sta     $33
        rts

L790E:  sta     $F1
        inc     $F1
        ldx     $27
        ldy     $12C8,x
        lda     $1354,x
        tax
        cmp     #$06
        beq     L7941
L791F:  lda     ($8E),y
L7921:  .byte   $1D
L7922:  .byte   $FA
L7923:  .byte   $13
        cpx     #$03
        bne     L792D
        sta     ($8E),y
        dey
        lda     ($8E),y
L792D:  .byte   $3D
L792E:  .byte   $04
L792F:  .byte   $14
        sta     ($8E),y
        dex
        bmi     L793A
        dec     $F1
        bne     L791F
L7939:  rts

L793A:  ldx     #$06
        dey
        dec     $F1
        beq     L7939
L7941:  lda     $F1
        sec
        sbc     #$07
        bcc     L791F
        beq     L7959
        sta     $F1
        lda     $23
        sta     ($8E),y
        dey
        lda     $24
        sta     ($8E),y
        dey
        jmp     L7941

L7959:  lda     $23
        sta     ($8E),y
        dey
        lda     $24
        sta     ($8E),y
        rts

L7963:  lda     HiresTableHi,y
        sta     $8F
        lda     HiresTableLo,y
        sta     $8E
        ldy     $12C8,x
        lda     $1354,x
        tax
        lda     ($8E),y
L7976:  .byte   $1D
L7977:  .byte   $FA
L7978:  .byte   $13
        cpx     #$03
        bne     L7982
        sta     ($8E),y
        dey
        lda     ($8E),y
L7982:  .byte   $3D
L7983:  .byte   $04
L7984:  .byte   $14
        sta     ($8E),y
        rts

L7988:  lda     $E9
        sec
        sbc     $EB
        bcs     L79A3
        eor     #$FF
        adc     #$01
        ldx     $E9
        ldy     $EB
        stx     $EB
        sty     $E9
        ldx     $EA
        ldy     $EC
        stx     $EC
        sty     $EA
L79A3:  sta     $21
        ldx     $E9
        ldy     $EA
        jsr     L7963
        stx     $B0
        sty     $B1
        ldy     #$E6
        lda     $EC
        sec
        sbc     $EA
        bcs     L79BF
        ldy     #$C6
        eor     #$FF
        adc     #$01
L79BF:  sta     $22
        ora     $21
        bne     L79C6
        rts

L79C6:  lda     $22
        sty     L7A06
        sty     L7A74
        cmp     $21
        ldx     $B0
        ldy     $B1
        bcc     L7A43
        sta     $F1
        asl     a
        clc
        adc     $0A
        adc     $32
        sta     $32
        bcc     L79E4
        inc     $33
L79E4:  lda     $F1
        sec
        sbc     $21
        sta     $F2
        cpx     #$03
        bne     L79F0
        iny
L79F0:  lda     $F2
        sec
        sbc     $21
        bcs     L7A04
        adc     $22
        cpx     #$03
        bne     L79FE
        dey
L79FE:  dex
        bpl     L7A04
        ldx     #$06
        dey
L7A04:  sta     $F2
L7A06:  dec     $EA
L7A08:  .byte   $84
L7A09:  .byte   $B1
L7A0A:  ldy     $EA
        lda     HiresTableHi,y
        sta     $8F
        lda     HiresTableLo,y
        sta     $8E
        ldy     $B1
        lda     ($8E),y
L7A1A:  .byte   $1D
L7A1B:  .byte   $FA
L7A1C:  .byte   $13
        cpx     #$03
        bne     L7A2E
        sta     ($8E),y
        dey
        lda     ($8E),y
L7A26:  .byte   $3D
L7A27:  .byte   $04
L7A28:  .byte   $14
        sta     ($8E),y
        iny
        bne     L7A33
L7A2E:  .byte   $3D
L7A2F:  .byte   $04
L7A30:  .byte   $14
        sta     ($8E),y
L7A33:  dec     $F1
        bne     L79F0
        rts

        lda     $F1
        and     #$03
        bne     L7A33
        sty     $B1
        jmp     L7A0A

L7A43:  lda     $21
        sta     $F1
        asl     a
        bcc     L7A4D
        inc     $33
        clc
L7A4D:  adc     $32
        sta     $32
        bcc     L7A55
        inc     $33
L7A55:  lda     $32
        clc
        adc     #$0A
        sta     $32
        bcc     L7A60
        inc     $33
L7A60:  lda     $F1
        sec
        sbc     $22
        sta     $F2
L7A67:  lda     $F2
        sec
        sbc     $22
        sta     $F2
        bcs     L7A86
        adc     $21
        sta     $F2
L7A74:  inc     $EA
        sty     $B1
        ldy     $EA
        lda     HiresTableHi,y
        sta     $8F
        lda     HiresTableLo,y
        sta     $8E
        ldy     $B1
L7A86:  dex
        bpl     L7A8C
        ldx     #$06
        dey
L7A8C:  .byte   $B1
L7A8D:  .byte   $8E
L7A8E:  .byte   $1D
L7A8F:  .byte   $FA
L7A90:  .byte   $13
        cpx     #$03
        bne     L7A9A
        sta     ($8E),y
        dey
        lda     ($8E),y
L7A9A:  .byte   $3D
L7A9B:  php
L7A9C:  .byte   $14
        sta     ($8E),y
L7A9F:  dec     $F1
        bne     L7A67
        rts

        lda     $F1
        and     #$03
        bne     L7AAF
        lda     ($8E),y
        jmp     L7A8E

L7AAF:  cpx     #$03
        bne     L7A9F
        dey
        bpl     L7A9F
        lda     #$84
        sta     L7A08
        lda     #$B1
        sta     L7A09
        lda     #$B1
        sta     L7A8C
        lda     #$8E
        sta     L7A8D
        lda     #$03
        jsr     L7B16
        lda     #$01
        jmp     L67FD

        lda     $083C
        and     #$01
        bne     L7AF2
        lda     #$10
        sta     L7A08
        sta     L7A8C
        lda     #$2E
        sta     L7A09
        lda     #$16
        sta     L7A8D
        lda     #$01
        jsr     L7B16
L7AF2:  lda     #$01
        jmp     L67FD

L7AF7:  brk
        .byte   $02
        ora     ($02,x)
        ora     ($00,x)
        ora     ($01,x)
        brk
        .byte   $03
        brk
        .byte   $02
        ora     ($03,x)
        ora     ($03,x)
        iny
        lda     ($8B),y
        tay
        lda     L7AF7,y
        jsr     L7B16
        lda     #$02
        jmp     L67FD

L7B16:  tax
        bpl     L7B1D
        ldx     #$5D
        bne     L7B26
L7B1D:  ldx     #$1D
        bit     $13F6
        bne     L7B26
        ldx     #$3D
L7B26:  stx     L7982
        stx     L7A2E
        stx     L7A9A
        stx     L7A26
        ldx     #$F6
        ldy     #$13
        bit     $13F6
        bne     L7B3F
        ldx     #$04
        ldy     #$14
L7B3F:  stx     L7983
        sty     L7984
        stx     L7A2F
        sty     L7A30
        stx     L7A9B
        sty     L7A9C
        stx     L7A27
        sty     L7A28
        tax
        bpl     L7B5E
        ldx     #$5D
        bne     L7B67
L7B5E:  ldx     #$1D
        bit     $13FA
        bne     L7B67
        ldx     #$3D
L7B67:  stx     L7976
        stx     L7A1A
        stx     L7A8E
        ldx     #$FA
        ldy     #$13
        bit     $13FA
        bne     L7B7D
        ldx     #$08
        ldy     #$14
L7B7D:  stx     L7977
        sty     L7978
        stx     L7A1B
        sty     L7A1C
        stx     L7A8F
        sty     L7A90
        rts

L7B90:  brk
        rol     a
        eor     $7F,x
        .byte   $80
        tax
        cmp     $FF,x
L7B98:  brk
        eor     $2A,x
        .byte   $7F
        .byte   $80
        cmp     $AA,x
        .byte   $FF
L7BA0:  lda     $0876
        and     #$0F
        tay
        ldx     L7AF7,y
L7BA9:  lda     L7B90,x
        sta     $23
        lda     L7B98,x
        sta     $24
        txa
        ldx     #$1D
        bit     $13F6
        bne     L7BBD
        ldx     #$3D
L7BBD:  stx     L792D
        ldx     #$F6
        ldy     #$13
        bit     $13F6
        bne     L7BCD
        ldx     #$04
        ldy     #$14
L7BCD:  stx     L792E
        sty     L792F
        ldx     #$1D
        bit     $13FA
        bne     L7BDC
        ldx     #$3D
L7BDC:  stx     L7921
        ldx     #$FA
        ldy     #$13
        bit     $13FA
        bne     L7BEC
        ldx     #$08
        ldy     #$14
L7BEC:  stx     L7922
        sty     L7923
        rts

L7BF3:  lda     $CB
        sta     $C2
        lda     $CC
        sta     $C3
        lda     $CF
        sta     $C4
        lda     $D0
        sta     $C5
        ldy     $CD
        lda     $CE
        jsr     L7E80
        sta     $D1
        sty     $D2
        rts

L7C0F:  lda     $D4
        sta     $C2
        lda     $D5
        sta     $C3
        lda     $D8
        sta     $C4
        lda     $D9
        sta     $C5
        ldy     $D6
        lda     $D7
        jsr     L7E80
        sta     $DA
        sty     $DB
        rts

L7C2B:  tax
        cmp     $C5
        bne     L7C3D
        cpy     $C4
        bne     L7C3D
        ldx     #$7F
        lda     #$00
        sta     $A6
        jmp     L7D76

L7C3D:  tya
        clc
        adc     $C4
        bne     L7C51
        txa
        adc     $C5
        bne     L7C51
        ldx     #$7F
        lda     #$FF
        sta     $A6
        jmp     L7D76

L7C51:  txa
        stx     $A6
        bmi     L7C9E
        clc
        rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7CB0
L7C68:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7CC1
L7C79:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7CD2
L7C8A:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7CE3
        jmp     L7D29

L7C9E:  sec
        rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7C68
L7CB0:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7C79
L7CC1:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7C8A
L7CD2:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7D29
L7CE3:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7D3A
L7CF4:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7D4B
L7D05:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7D5C
L7D16:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        clc
        adc     $C4
        tay
        txa
        adc     $C5
        bpl     L7D6D
        bcc     L7D6D
L7D29:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7CF4
L7D3A:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7D05
L7D4B:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7D16
L7D5C:  rol     L00A5
        cpy     #$80
        rol     a
        tax
        tya
        asl     a
        sec
        sbc     $C4
        tay
        txa
        sbc     $C5
        bmi     L7D6D
L7D6D:  lda     L00A5
        rol     a
        bcc     L7D74
        eor     #$FF
L7D74:  lsr     a
        tax
L7D76:  .byte   $BD
L7D77:  .byte   $FF
L7D78:  .byte   $FF
        ldy     $A6
        bpl     L7D7F
        eor     #$FF
L7D7F:  rts

        brk
        brk
        ora     ($01,x)
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        ora     $05
        asl     $07
        .byte   $07
        php
        php
        ora     #$09
        asl     a
        asl     a
        .byte   $0B
        .byte   $0B
        .byte   $0C
        ora     $0E0D
        asl     $0F0F
        bpl     L7DB0
        ora     ($11),y
        .byte   $12
        .byte   $13
        .byte   $13
        .byte   $14
        .byte   $14
        ora     $15,x
        asl     $16,x
        .byte   $17
        .byte   $17
        clc
        clc
        .byte   $19
L7DB0:  .byte   $1A
        .byte   $1A
        .byte   $1B
        .byte   $1B
        .byte   $1C
        .byte   $1C
        ora     $1E1D,x
        asl     $201F,x
        jsr     $2121
        .byte   $22
        .byte   $22
        .byte   $23
        .byte   $23
        bit     $24
        and     $26
        rol     $27
        .byte   $27
        plp
        plp
        and     #$29
        rol     a
        rol     a
        .byte   $2B
        bit     $2D2C
        and     $2E2E
        .byte   $2F
        .byte   $2F
        bmi     L7E0B
        and     ($31),y
        .byte   $32
        .byte   $33
        .byte   $33
        .byte   $34
        .byte   $34
        and     $35,x
        rol     $36,x
        .byte   $37
        .byte   $37
        sec
        and     $3A39,y
        .byte   $3A
        .byte   $3B
        .byte   $3B
        .byte   $3C
        .byte   $3C
        and     $3E3D,x
        .byte   $3F
        .byte   $3F
        rti

        rti

        eor     ($41,x)
        .byte   $42
        .byte   $42
        .byte   $43
        .byte   $43
        .byte   $44
        eor     $00
        brk
        brk
        ora     ($01,x)
        ora     ($02,x)
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $03
L7E0B:  .byte   $04
        .byte   $04
        ora     $05
        ora     $06
        asl     $07
        .byte   $07
        .byte   $07
        php
        php
        php
        ora     #$09
        asl     a
        asl     a
        asl     a
        .byte   $0B
        .byte   $0B
        .byte   $0C
        .byte   $0C
        .byte   $0C
        ora     $0E0D
        asl     $0F0E
        .byte   $0F
        bpl     L7E3B
        bpl     L7E3E
        ora     ($11),y
        .byte   $12
        .byte   $12
        .byte   $13
        .byte   $13
        .byte   $13
        .byte   $14
        .byte   $14
        ora     $15,x
        ora     $16,x
        .byte   $16
L7E3B:  .byte   $17
        .byte   $17
        .byte   $17
L7E3E:  clc
        clc
        ora     $1919,y
        .byte   $1A
        .byte   $1A
        .byte   $1A
        .byte   $1B
        .byte   $1B
        .byte   $1C
        .byte   $1C
        .byte   $1C
        ora     $1E1D,x
        asl     $1F1E,x
        .byte   $1F
        jsr     $2020
        and     ($21,x)
        and     ($22,x)
        .byte   $22
        .byte   $23
        .byte   $23
        .byte   $23
        bit     $24
        and     $25
        and     $26
        rol     $27
        .byte   $27
        .byte   $27
        plp
        plp
        and     #$29
        and     #$2A
        rol     a
        rol     a
        .byte   $2B
        .byte   $2B
        bit     $2C2C
        and     $2E2D
        rol     $2F2E
        .byte   $2F
        bmi     L7EAD
        bmi     L7EB0
        .byte   $31
L7E80:  ldx     #$00
        stx     L7D77
        ldx     #$7E
        stx     L7D78
        jsr     L7C2B
        sta     $AF
        lda     #$31
        sec
        sbc     $AF
        sta     $A7
        lda     #$80
        sta     L7D77
        lda     #$7D
        sta     L7D78
        lda     $C3
        ldy     $C2
        jsr     L7C2B
        clc
        adc     #$46
        ldy     $A7
        rts

L7EAD:  ror     a
        sta     $A3
L7EB0:  ror     $A2
        lda     $9F
        rol     a
        ror     $9F
        ror     $9E
        jmp     L7F7F

        sty     $E5
        lda     $32
        clc
        adc     #$51
        sta     $32
        bcc     L7EC9
        inc     $33
L7EC9:  lda     $4A
        ldx     $4B
        sta     $18
        stx     $19
        lda     $4C
        sta     $1A
        lda     $4D
        ldx     $4E
        sta     $1B
        stx     $1C
        lda     $4F
        sta     $1D
        lda     $50
        ldx     $51
        sta     $1E
        stx     $1F
        lda     $52
        sta     $20
        ldy     #$01
        lda     $2F
        sta     $08EE
        lda     #$40
        sta     $2F
        lda     ($8B),y
        iny
        sec
        sbc     $66
        sta     $9E
        lda     ($8B),y
        iny
        sbc     $67
        bvs     L7F64
        sta     $9F
        lda     ($8B),y
        iny
        sec
        sbc     $6A
        sta     $A2
        lda     ($8B),y
        iny
        sbc     $6B
        bvs     L7EAD
        sta     $A3
L7F1A:  lda     $9F
        clc
        adc     #$40
        bmi     L7F96
        lda     $A3
        clc
        adc     #$40
        bmi     L7F96
        lda     $19
        clc
        adc     #$40
        bmi     L7F96
        lda     $1C
        clc
        adc     #$40
        bmi     L7F96
        lda     $1F
        clc
        adc     #$40
        bmi     L7F96
        inc     $2F
        asl     $9E
        rol     $9F
        asl     $A2
        rol     $A3
        asl     $1A
        rol     $18
        rol     $19
        asl     $1D
        rol     $1B
        rol     $1C
        asl     $20
        rol     $1E
        rol     $1F
        jmp     L7F1A

L7F5C:  ror     a
        sta     $A3
        ror     $A2
        jmp     L7F7F

L7F64:  ror     a
        sta     $9F
        ror     $9E
        lda     ($8B),y
        iny
        sec
        sbc     $6A
        sta     $A2
        lda     ($8B),y
        iny
        sbc     $6B
        bvs     L7F5C
        sta     $A3
        rol     a
        ror     $A3
        ror     $A2
L7F7F:  lda     $19
        rol     a
        ror     $19
        ror     $18
        lda     $1C
        rol     a
        ror     $1C
        ror     $1B
        lda     $1F
        rol     a
        ror     $1F
        ror     $1E
        dec     $2F
L7F96:  ldx     $9F
        ldy     $79
        jsr     L1818
        clc
        adc     $18
        sta     $18
        tya
        adc     $19
        sta     $19
        bpl     L7FAD
        lda     #$FF
        bmi     L7FAF
L7FAD:  lda     #$00
L7FAF:  bvc     L7FB3
        eor     #$FF
L7FB3:  sta     $1A
        ldx     $A3
        ldy     $85
        jsr     L1818
        clc
        adc     $18
        sta     $18
        tya
        adc     $19
        sta     $19
        tya
        bpl     L7FCD
        lda     #$FF
        bmi     L7FCF
L7FCD:  lda     #$00
L7FCF:  adc     $1A
        sta     $1A
        ldx     $9F
        ldy     $7B
        jsr     L1818
        clc
        adc     $1B
        sta     $1B
        tya
        adc     $1C
        sta     $1C
        bpl     L7FEA
        lda     #$FF
        bmi     L7FEC
L7FEA:  lda     #$00
L7FEC:  bvc     L7FF0
        eor     #$FF
L7FF0:  sta     $1D
        ldx     $A3
        ldy     $87
        jsr     L1818
        clc
        adc     $1B
        sta     $1B
        tya
        adc     $1C
        sta     $1C
        tya
        bpl     L800A
        lda     #$FF
        bmi     L800C
L800A:  lda     #$00
L800C:  adc     $1D
        sta     $1D
        ldx     $9F
        ldy     $7D
        jsr     L1818
        clc
        adc     $1E
        sta     $1E
        tya
        adc     $1F
        sta     $1F
        bpl     L8027
        lda     #$FF
        bmi     L8029
L8027:  lda     #$00
L8029:  bvc     L802D
        eor     #$FF
L802D:  sta     $20
        ldx     $A3
        ldy     $89
        jsr     L1818
        clc
        adc     $1E
        sta     $1E
        tya
        adc     $1F
        sta     $1F
        tya
        bpl     L8047
        lda     #$FF
        bmi     L8049
L8047:  lda     #$00
L8049:  adc     $20
        sta     $20
        lda     $1A
        eor     $1D
        eor     $20
        beq     L8059
        cmp     #$FF
        bne     L806D
L8059:  lda     $1A
        eor     $19
        bmi     L8070
        lda     $1D
        eor     $1C
        bmi     L8070
        lda     $20
        eor     $1F
        bpl     L8079
        bmi     L8070
L806D:  jsr     L80B0
L8070:  jsr     L80B0
        jsr     L80B0
        jmp     L8091

L8079:  lda     $19
        clc
        adc     #$40
        bmi     L808E
        lda     $1C
        clc
        adc     #$40
        bmi     L808E
        lda     $1F
        clc
        adc     #$40
        bpl     L8091
L808E:  jsr     L80B0
L8091:  ldx     $E5
        lda     $18
        sta     $00,x
        lda     $19
        sta     $01,x
        lda     $1B
        sta     $02,x
        lda     $1C
        sta     $03,x
        lda     $1E
        sta     $04,x
        lda     $1F
        sta     $05,x
        lda     #$05
        jmp     L67F1

L80B0:  lsr     $1A
        ror     $19
        ror     $18
        lsr     $1D
        ror     $1C
        ror     $1B
        lsr     $20
        ror     $1F
        ror     $1E
        dec     $2F
        rts

        sty     $E5
        lda     $32
        clc
        adc     #$C7
        sta     $32
        bcc     L80D2
        inc     $33
L80D2:  ldy     #$01
        lda     ($8B),y
        iny
        sec
        sbc     $66
        sta     $9E
        lda     ($8B),y
        iny
        sbc     $67
        bvc     L80E6
        jmp     L81D9

L80E6:  sta     $9F
        lda     ($8B),y
        iny
        sec
        sbc     $68
        sta     $A0
        lda     ($8B),y
        iny
        sbc     $69
        bvc     L80FA
        jmp     L820F

L80FA:  sta     $A1
        lda     ($8B),y
        iny
        sec
        sbc     $6A
        sta     $A2
        lda     ($8B),y
        iny
        sbc     $6B
        bvc     L810E
        jmp     L821E

L810E:  sta     $A3
L8110:  lda     $9F
        clc
        adc     #$40
        bmi     L8125
        lda     $A1
        clc
        adc     #$40
        bmi     L8125
        lda     $A3
        clc
        adc     #$40
        bpl     L813A
L8125:  lda     $9F
        rol     a
        ror     $9F
        ror     $9E
        lda     $A1
        rol     a
        ror     $A1
        ror     $A0
        lda     $A3
        rol     a
        ror     $A3
        ror     $A2
L813A:  lda     #$00
        sta     $2F
        sta     $30
        lda     #$07
        jsr     L67F1
        ldx     #$9E
        ldy     #$78
        lda     #$A9
        jsr     L154A
        ldx     #$A0
        ldy     #$7E
        lda     #$AB
        jsr     L154A
        lda     $A2
        ldx     $A3
        sta     $C2
        stx     $C3
        lda     $84
        ldx     $85
        sta     $C4
        stx     $C5
        jsr     L1569
        jsr     L8234
        ldx     #$9E
        ldy     #$7A
        lda     #$A9
        jsr     L154A
        ldx     #$A0
        ldy     #$80
        lda     #$AB
        jsr     L154A
        lda     $A2
        ldx     $A3
        sta     $C2
        stx     $C3
        lda     $86
        ldx     $87
        sta     $C4
        stx     $C5
        jsr     L1569
        jsr     L8234
        ldx     #$9E
        ldy     #$7C
        lda     #$A9
        jsr     L154A
        ldx     #$A0
        ldy     #$82
        lda     #$AB
        jsr     L154A
        lda     $A2
        ldx     $A3
        sta     $C2
        stx     $C3
        lda     $88
        ldx     $89
        sta     $C4
        stx     $C5
        jsr     L1569
        jsr     L8234
        ldx     $E5
        lda     $30
        beq     L81D8
        lda     $FF,x
        rol     a
        ror     $FF,x
        ror     $FE,x
        lda     $FD,x
        rol     a
        ror     $FD,x
        ror     $FC,x
        lda     $FB,x
        rol     a
        ror     $FB,x
        ror     $FA,x
L81D8:  rts

L81D9:  ror     a
        sta     $9F
        ror     $9E
        lda     ($8B),y
        iny
        sec
        sbc     $68
        sta     $A0
        lda     ($8B),y
        iny
        sbc     $69
        bvs     L81F1
        sta     $A1
        rol     $A1
L81F1:  ror     a
        sta     $A1
        ror     $A0
L81F6:  lda     ($8B),y
        iny
        sec
        sbc     $6A
        sta     $A2
        lda     ($8B),y
L8200:  iny
        sbc     $6B
        bvs     L8207
        cmp     #$80
L8207:  ror     a
        sta     $A3
        ror     $A2
        jmp     L8110

L820F:  ror     a
        sta     $A1
        ror     $A0
        lda     $9F
        rol     a
        ror     $9F
        ror     $9E
        jmp     L81F6

L821E:  ror     a
        sta     $A3
        ror     $A2
        lda     $A1
        rol     a
        ror     $A1
        ror     $A0
        lda     $9F
        rol     a
        ror     $9F
        ror     $9E
        jmp     L8110

L8234:  clc
        adc     $A9
        tay
        txa
        adc     $AA
        tax
        tya
        clc
        adc     $AB
        tay
        txa
        adc     $AC
        ldx     $E5
        sta     $01,x
        sty     $00,x
        inc     $E5
        inc     $E5
        clc
        adc     #$40
        bpl     L8255
        inc     $30
L8255:  rts

L8256:  cmp     ($CF,x)
        .byte   $D4
        cmp     $E1DD,y
        cpx     $E7
        nop
        sbc     $F2EF
        .byte   $F4
        .byte   $F7
        sbc     $FEFC,y
        brk
        .byte   $02
        ora     $07
        asl     a
        .byte   $0C
        .byte   $0F
        .byte   $12
        ora     $18,x
        .byte   $1B
        asl     $2622,x
        .byte   $2B
        and     ($40),y
L8278:  ldx     #$06
        lda     $6D
        bpl     L8280
        ldx     #$05
L8280:  jsr     L7BA9
        lda     #$8D
        sta     $E7
        lda     #$1F
        jsr     L8387
        lda     $6D
        clc
        adc     #$20
        cmp     #$40
        bcc     L8298
        jmp     L83E2

L8298:  lsr     a
        tax
        lda     L8256,x
        sta     $AD
        lda     $6F
        sec
        sbc     $AD
        sta     $98
        jsr     L1763
        ldy     #$12
        jsr     L180C
        tya
        clc
        adc     #$27
        sta     $E9
        lda     $98
        jsr     L1768
        txa
        rol     a
        php
        txa
        ror     a
        plp
        php
        ror     a
        plp
        ror     a
        clc
        adc     #$7E
        sta     $EA
        lda     $6F
        eor     #$80
        clc
        adc     $AD
        sta     $98
        jsr     L1763
        ldy     #$12
        jsr     L180C
        tya
        clc
        adc     #$27
        sta     $EB
        lda     $98
        jsr     L1768
        txa
        rol     a
        php
        txa
        ror     a
        plp
        php
        ror     a
        plp
        ror     a
        clc
        adc     #$7E
        sta     $EC
        lda     #$00
        sta     $8A
        lda     $6F
        bpl     L82FD
        dec     $8A
L82FD:  ldx     #$05
        lda     $6D
        bpl     L830B
        lda     $8A
        eor     #$FF
        sta     $8A
        ldx     #$06
L830B:  jsr     L7BA9
        lda     #$60
        sta     L6522
        lda     #$4C
        sta     L6644
        lda     #$03
        sta     L6645
        lda     #$84
        sta     L6646
        jsr     L842B
        lda     #$86
        sta     L6522
        lda     #$A4
        sta     L6644
        lda     #$E7
        sta     L6645
        lda     #$B9
        sta     L6646
        lda     $E9
        clc
        sbc     #$27
        sta     $98
        lda     $EB
        clc
        sbc     #$27
        eor     $98
        bpl     L8365
        lda     $6F
        clc
        adc     #$40
        bmi     L8368
        lda     $6D
        bmi     L836C
L8354:  lda     $EA
        cmp     $EC
        bcc     L835C
        lda     $EC
L835C:  sta     $E7
        dec     $E7
        sec
        sbc     #$6F
        bpl     L8381
L8365:  jmp     L83E2

L8368:  lda     $6D
        bmi     L8354
L836C:  lda     $EA
        cmp     $EC
        bcs     L8374
        lda     $EC
L8374:  sta     $B5
        inc     $B5
        lda     #$8D
        sta     $E7
        sec
        sbc     $B5
        bmi     L8384
L8381:  jsr     L8387
L8384:  jmp     L83E2

L8387:  sta     $B5
        ldx     $E7
L838B:  lda     HiresTableLo,x
        sta     $8E
        lda     HiresTableHi,x
        sta     $8F
        ldy     #$08
        lda     $24
        sta     ($8E),y
        iny
        iny
        sta     ($8E),y
        iny
        iny
        sta     ($8E),y
        ldy     #$09
        lda     $23
        sta     ($8E),y
        iny
        iny
        sta     ($8E),y
        iny
        iny
        sta     ($8E),y
        dex
        dec     $B5
        bpl     L838B
        rts

L83B7:  ldx     #$6E
L83B9:  lda     HiresTableLo,x
        sta     $8E
        lda     HiresTableHi,x
        sta     $8F
        stx     $B0
        ldx     #$00
        ldy     #$08
L83C9:  lda     ($2D,x)
L83CB:  ora     ($8E),y
        sta     ($8E),y
        inc     $2D
        bne     L83D5
        inc     $2E
L83D5:  iny
        cpy     #$0E
        bne     L83C9
        ldx     $B0
        inx
        cpx     #$8E
        bne     L83B9
        rts

L83E2:  lda     #$86
        sta     $2E
        lda     #$0D
        sta     $2D
        lda     #$31
        sta     L83CB
        jsr     L83B7
        lda     #$85
        sta     $2E
        lda     #$4D
        sta     $2D
        lda     #$11
        sta     L83CB
        jsr     L83B7
        rts

        stx     $B2
        ldy     $E7
        lda     HiresTableLo,y
        sta     $8E
        lda     HiresTableHi,y
        sta     $8F
        lda     $8A
        bne     L841F
        lda     #$2F
        sta     $27
        sec
        sbc     $B2
        jmp     L8425

L841F:  txa
        sta     $27
        sec
        sbc     #$1E
L8425:  jsr     L790E
        ldx     $B2
        rts

L842B:  ldx     #$E8
        lda     $EB
        sec
        sbc     $E9
        bcs     L843A
        ldx     #$CA
        eor     #$FF
        adc     #$01
L843A:  sta     $21
        stx     L8483
        stx     L849A
        ldy     #$E6
        lda     $EC
        sec
        sbc     $EA
        bcs     L8451
        ldy     #$C6
        eor     #$FF
        adc     #$01
L8451:  sta     $22
        sty     L8484
        sty     L84A8
        ldx     $E9
        ldy     $EA
        sty     $E7
        jsr     L6644
        jsr     L6522
        lda     $22
        ora     $21
        bne     L846C
        rts

L846C:  lda     $22
        cmp     $21
        bcc     L8491
        sta     $93
        sta     $F2
L8476:  lda     $F2
        sec
        sbc     $21
        sta     $F2
        bcs     L8484
        adc     $22
        sta     $F2
L8483:  dex
L8484:  dec     $E7
        jsr     L6644
        jsr     L6522
        dec     $93
        bne     L8476
        rts

L8491:  lda     $21
        sta     $93
        sec
        sbc     $22
        sta     $F2
L849A:  inx
        lda     $F2
        sec
        sbc     $22
        sta     $F2
        bcs     L84B0
        adc     $21
        sta     $F2
L84A8:  inc     $E7
        jsr     L6644
        jsr     L6522
L84B0:  dec     $93
        bne     L849A
        rts

L84B5:  lda     $FB
        and     #$02
        beq     L8504
        lda     $09CD
        asl     a
        tax
        lda     $09CE
        rol     a
        tay
        txa
        adc     $09CD
        tax
        tya
        adc     $09CE
        cpx     #$80
        adc     #$08
        bmi     L84DC
        cmp     #$10
        bmi     L84DE
L84D8:  lda     #$0F
        bne     L84DE
L84DC:  lda     #$00
L84DE:  sta     $AF
        lda     $0A40
        ldx     $8D
        bpl     L84EA
        lda     $0A41
L84EA:  cmp     $AF
        bne     L84EF
        rts

L84EF:  jsr     L8505
        lda     $AF
L84F4:  ldx     $8D
        bpl     L84FE
        sta     $0A41
        jmp     L8501

L84FE:  sta     $0A40
L8501:  jsr     L8505
L8504:  rts

L8505:  pha
        lda     #$83
        jsr     L7B16
        pla
        asl     a
        asl     a
        pha
        tax
        .byte   $BD
        .byte   $E0
L8512:  .byte   $0D
        clc
L8514:  adc     #$0C
        sta     $E9
        lda     $0DE1,x
        clc
        adc     #$A6
        sta     $EA
        lda     #$0C
        sec
        sbc     $0DE0,x
        sta     $EB
        lda     #$A6
        sec
        sbc     $0DE1,x
        sta     $EC
        jsr     L7988
        pla
        tax
        lda     #$0C
        sta     $E9
        clc
        adc     $0DE2,x
        sta     $EB
        lda     #$A6
        sta     $EA
        clc
        adc     $0DE3,x
        sta     $EC
        jsr     L7988
        rts

        dey
        .byte   $80
        .byte   $83
        cmp     ($81,x)
        bcc     L84D8
L8554:  cpx     #$C0
        .byte   $83
        stx     $A0
        .byte   $86
L855A:  tya
        cpx     #$87
        tya
        .byte   $E0
L855F:  .byte   $83
        stx     $80
        .byte   $80
        cpx     #$C0
        sta     ($81,x)
        .byte   $80
L8568:  .byte   $80
        cpy     #$81
        cpy     #$80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $82
        ldy     #$80
        .byte   $80
        .byte   $80
        .byte   $80
        sty     $90
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        dey
        tya
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        tya
        dey
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        bcc     L8512
        .byte   $80
        cpx     #$87
        .byte   $80
        bcc     L8514
        .byte   $80
        .byte   $80
        .byte   $80
L8593:  .byte   $80
        ldy     #$84
L8596:  .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        ldy     #$84
        .byte   $80
        cpx     #$87
        .byte   $80
        ldy     #$84
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        ldy     #$84
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        ldy     #$84
        sed
        .byte   $9F
        sbc     LA09F,y
        sty     $80
        .byte   $80
        .byte   $80
        .byte   $80
        ldy     #$84
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        ldy     #$84
        .byte   $80
        cpx     #$87
        .byte   $80
        ldy     #$84
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        bcc     L8554
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        bcc     L855A
        .byte   $80
        cpx     #$87
        .byte   $80
        bcc     L8568
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        dey
        bcc     L855F
        .byte   $80
        .byte   $80
        .byte   $80
        dey
        ldy     #$80
        .byte   $80
        .byte   $80
        .byte   $80
        sty     $E0
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        stx     $C0
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $80
        .byte   $82
        sta     ($81,x)
        .byte   $80
        .byte   $80
        .byte   $80
        sta     ($82,x)
        stx     $E0
        .byte   $83
        cpx     #$C0
        sty     $98
        tya
        sty     $E098
        sty     L87F0
        beq     L8593
        bcs     L8596
        .byte   $80
        .byte   $FF
        .byte   $FF
        sta     ($90,x)
        sty     $E0
        .byte   $FF
        .byte   $FF
        .byte   $87
        ldy     #$86
        sed
        .byte   $FF
        .byte   $FF
        .byte   $9F
        cpx     #$83
        inc     $FFFF,x
        .byte   $FF
        cpy     #$81
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     ($C0,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        cpx     #$FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $87
        .byte   $F0
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $8F
        sed
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9F
        sed
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9F
        sed
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9F
        .byte   $FC
        .byte   $FF
L8651:  .byte   $FF
        .byte   $FF
L8653:  .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $BF
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9F
        sed
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9F
        sed
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9F
        .byte   $F0
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $8F
        .byte   $F0
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $8F
        cpx     #$FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $87
        cpx     #$FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $87
        cpy     #$FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     ($82,x)
        inc     $FFFF,x
        .byte   $FF
        cpy     #$84
        sed
        .byte   $9F
        .byte   $FC
        .byte   $9F
        cpx     #$8C
        beq     L8651
        beq     L8653
        .byte   $B0
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
        jmp     L8AC4

        jmp     L89D0

        jmp     LA524

        jmp     L8CC6

L874C:  jmp     L9BF8

        jmp     L9B1F

L8752:  jmp     L8A15

        jmp     LA66B

        jmp     LA674

        jmp     LA67D

        jmp     LA686

        jmp     LA68F

        jmp     L91DE

        jmp     L90E8

        jmp     L92CB

        jmp     L9270

L8770:  jmp     LA4D2

L8773:  jmp     L9CFC

L8776:  jmp     LA63A

        jmp     LA6F9

        jmp     L915D

L877F:  jsr     LA7F4
L8782:  lda     $33
        clc
        adc     #$0D
        sta     $33
        lda     $08A6
        ora     $08A7
        beq     L8794
        jsr     LA7E8
L8794:  jsr     LA7F4
        lda     $0937
        beq     L87A2
        jsr     L9B47
        jmp     L87A8

L87A2:  jsr     L97BF
L87A5:  jsr     L8AFD
L87A8:  jsr     LA60C
        jsr     LA61B
        jsr     L6000
        ldx     #$00
        lsr     $089A
        bcc     L87BE
        lda     $0899
        bne     L87BE
        inx
L87BE:  jsr     L89B6
        jsr     L6003
        jsr     L6006
        jsr     L8AFD
        jsr     LA1E2
        jsr     L9F39
        jsr     LA14D
        jsr     LA1B8
        jsr     L8943
        jsr     L9C6E
        jsr     L6012
        jsr     L9C77
        jsr     L9D1B
        jsr     L8AFD
        lda     $093A
        beq     L87F0
        jsr     LA7EE
L87F0:  jsr     L8AFD
        jsr     L9F6B
        jsr     L9FE9
        jsr     L8AFD
        lda     $092C
        beq     L8804
        jsr     L8C6A
L8804:  lda     $2B
        lsr     a
        bcs     L8836
        lsr     a
        bcs     L882D
        jsr     LA5E1
        jsr     L8A06
        jsr     L1B0C
        jsr     L8AFD
        lda     $2B
        and     #$04
        beq     L8863
        jsr     L9EBC
        jsr     L9DDA
        jsr     L9DFB
        jsr     L8AFD
        jmp     L8863

L882D:  jsr     L1B56
        jsr     L9AA3
        jmp     L8863

L8836:  lsr     a
        bcs     L8842
        jsr     L1B24
        jsr     L8AFD
        jmp     L8848

L8842:  jsr     L1B6D
        jsr     L8AFD
L8848:  jsr     LA0D0
        jsr     LA139
        jsr     LA021
        jsr     L8AFD
        lda     $0832
        asl     a
        rol     $0833
        adc     #$00
        sta     $0832
        jmp     L8871

L8863:  jsr     L9C40
        jsr     LA054
        lda     $097A
        beq     L8871
        jsr     L8C1E
L8871:  inc     $2B
        jmp     L8782

L8876:  brk
L8877:  brk
L8878:  .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $BF
        .byte   $FF
        brk
        brk
L8880:  brk
L8881:  .byte   $FF
L8882:  brk
L8883:  brk
        brk
        brk

m8886:  MESSAGE $A1, $20, "000"
m888C:  MESSAGE $B1, $20, "000"
m8892:  MESSAGE $5F, $65, "000"
m8898:  MESSAGE $6C, $69, "2485", s8898
m889F:  MESSAGE $7A, $69, "1000", s889F
m88A6:  MESSAGE $88, $69, "1135", s88A6
m88AD:  MESSAGE $6C, $54, "000", s88AD
m88B3:  MESSAGE $8C, $54, "000", s88B3
m88B9:  MESSAGE $97, $54, "000", s88B9
m88BF:  MESSAGE $B7, $54, "000", s88BF
m88C5:  MESSAGE $88, $7B, "1200", s88C5

        .byte   $B3
        .byte   $7B
L88CE:  .byte   $32
L88CF:  .byte   $33
L88D0:  .byte   $37
        bmi     *+1

m88D3:  MESSAGE $91, $72, "00", s88D3
m88D8:  MESSAGE $91, $7B, "00", s88D8
m88DD:  MESSAGE $91, $84, "00", s88DD

        .byte   $7A
        .byte   $7D
L88E4:  .byte   $30
L88E5:  .byte   $30
L88E6:  bmi     L88E8
L88E8:  txs
        .byte   $87
        and     ($00),y
        txs
        .byte   $87
        .byte   $4F
        brk
        .byte   $BB
        .byte   $6E
        pha
        eor     $41
        .byte   $54
        brk
        .byte   $BB
        ror     $2E43
        pha
        rol     L8200
        .byte   $54
        .byte   $4F
        lsr     $46
        brk
        .byte   $07
        php
        .byte   $82
        .byte   $54
        .byte   $54
        .byte   $4F
        .byte   $20
        brk
        .byte   $07
        php
        .byte   $82
        .byte   $54
        .byte   $46
        .byte   $52
        jsr     $0700
        php
        lda     $4F54
        lsr     $46
        brk
        .byte   $07
        php
        lda     $5454
        .byte   $4F
        jsr     $0700
        php
        lda     $4654
        .byte   $52
        jsr     $0700
        php
        .byte   $6C
        .byte   $7D
L8930:  cli
L8931:  cli
        brk
L8933:  jsr     L9DC3
        jsr     L9DDF
        jsr     L9E09
        jsr     L9F05
        jsr     L8AC4
        rts

L8943:  lda     $0843
        ldx     $0844
        ldy     $0A12
        cpy     #$0A
        bcs     L8956
        sta     $0A36
        stx     $0A37
L8956:  jsr     L8959
L8959:  ldy     #$00
        lda     $0843
        ldx     $0844
        cpx     $0A37
        bcc     L8971
        bne     L8972
        cmp     $0A36
        bcc     L8971
        .byte   $F0
L896E:  .byte   $3A
        bne     L8972
L8971:  dey
L8972:  tya
        bmi     L8977
        lda     #$01
L8977:  clc
        adc     $0A36
        sta     $0A36
        tya
        adc     $0A37
        sta     $0A37
        tya
        eor     #$FF
        tay
        bmi     L898D
        lda     #$01
L898D:  clc
        adc     $5F
        sta     $5F
        tya
        adc     $60
        sta     $60
        bmi     L89A1
        bne     L89A9
        lda     $5F
        cmp     #$03
        bcs     L89A9
L89A1:  lda     #$03
        sta     $5F
        lda     #$00
        sta     $60
L89A9:  rts

msg_crash:      MESSAGE $32, $14, "CRASH !!!"

L89B6:  lda     $0834
        bne     L89BC
        rts

L89BC:  lda     #$00
        sta     $0834
        jsr     ClearViewportsToBlack
        CALLAX  DrawMessage2, msg_crash
        ldx     #$01
        jmp     L9093

L89D0:  lda     $08A6
        pha
        inc     $08BB
        lda     #$01
        sta     $08A6
L89DC:  lda     $32
        clc
        adc     #$0A
        sta     $32
        bcc     L89E7
        inc     $33
L89E7:  lda     $33
        cmp     #$20
        bcc     L89F0
        jsr     L8A15
L89F0:  lda     $08B1
        bpl     L89DC
        ldx     #$00
        stx     $08B1
        tax
        pla
        sta     $08A6
        txa
        and     #$7F
        lsr     $08BB
L8A05:  rts

L8A06:  rts

        ror     $08AF
        bcs     L8A05
        lda     $C089
        lda     $C089
        jmp     (L08AD)

L8A15:  sbc     #$11
        sta     $33
        lda     $0935
        beq     L8A26
        lda     $099B
        beq     L8A26
        lda     $C030
L8A26:  inc     $34
        lda     $C000
        bpl     L8A35
        and     #$7F
        jsr     L8BEC
        sta     $C010
L8A35:  lda     L8877
        cmp     L8876
        beq     L8A45
        lda     $08B0
        bne     L8A45
        jsr     L8C78
L8A45:  lda     $097A
        beq     L8A4D
        jsr     L8BFD
L8A4D:  inc     $31
        lda     $31
        lsr     a
        bcc     L8A55
L8A54:  rts

L8A55:  lda     $08BB
        bne     L8A54
        lda     $08F1
        beq     L8A62
        dec     $08F1
L8A62:  jsr     L93CA
        jsr     L18DD
        jsr     L1915
        lda     $31
        and     #$03
        bne     L8A54
        lda     $31
        and     #$07
        bne     L8A54
        jsr     LA55A
        ldx     $08F0
        cpx     #$3B
        bne     L8A9F
        ldy     $0955
        cpy     #$3B
        bne     L8A99
        inc     $0954
        lda     $0954
        cmp     #$18
        bne     L8A97
        lda     #$00
        sta     $0954
L8A97:  ldy     #$FF
L8A99:  iny
        sty     $0955
        ldx     #$FF
L8A9F:  inx
        stx     $08F0
        jsr     L9EFC
        txa
        ldx     #$2F
L8AA9:  inx
        sec
        sbc     #$0A
        bcs     L8AA9
        clc
        adc     #$3A
        stx     s88DD
        sta     s88DD+1
        CALLAX  DrawMessage3, m88DD
        lda     $08F0
        bne     L8AFD
L8AC4:  jsr     L9EFC
        lda     $0955
        ldx     #$2F
L8ACC:  inx
        sec
        sbc     #$0A
        bcs     L8ACC
        clc
        adc     #$3A
        stx     s88D8
        sta     s88D8+1
        CALLAX  DrawMessage3, m88D8
        lda     $0954
        ldx     #$2F
L8AE7:  inx
        sec
        sbc     #$0A
        bcs     L8AE7
        clc
        adc     #$3A
        stx     s88D3
        sta     s88D3+1
        CALLAX  DrawMessage3, m88D3
L8AFD:  rts

L8AFE:  brk
L8AFF:  brk
        .byte   $47
        sta     ($C3),y
        .byte   $8F
        dec     $8F
        eor     ($90,x)
        cmp     $8F,x
        .byte   $FA
        .byte   $A7
        .byte   $F7
        bcc     L8B56
        sta     ($D3),y
        bcc     L8B14
        .byte   $90
L8B14:  .byte   $47
        sta     ($47),y
        sta     ($10),y
        bcc     L8B94
        bcc     L8B7E
        bcc     L8B66
        sta     ($D0),y
        .byte   $89
        .byte   $47
        sta     ($47),y
        sta     ($47),y
        sta     ($7D),y
        .byte   $8F
        cpy     #$90
        .byte   $5C
        bcc     L8B76
        sta     ($AB),y
        .byte   $8F
        .byte   $47
        sta     ($47),y
        sta     ($9E),y
        sty     L9147
        .byte   $47
        sta     ($47),y
        sta     ($47),y
        sta     ($7E),y
        bcc     L8B8A
        sta     ($47),y
        sta     ($47),y
L8B47:  sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        .byte   $91
L8B56:  sta     ($90),y
        ora     ($8D,x)
L8B5A:  .byte   $47
        sta     ($27),y
        stx     L90F1
        .byte   $47
        sta     ($A4),y
        sty     L8CCB
L8B66:  sbc     $FC8C
        bcc     L8B70
        sta     ($47),y
        sta     ($47),y
        .byte   $91
L8B70:  .byte   $F3
        sty     L8CF7
        .byte   $47
        .byte   $91
L8B76:  .byte   $47
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        .byte   $91
L8B7E:  .byte   $47
        sta     ($47),y
        sta     ($C3),y
        .byte   $8F
        .byte   $DB
        .byte   $92
        lda     ($92,x)
        .byte   $F3
        .byte   $91
L8B8A:  .byte   $47
        .byte   $91
L8B8C:  .byte   $F7
        sta     ($0C),y
        .byte   $92
        jmp     $4792

        .byte   $91
L8B94:  .byte   $47
        sta     ($0C),y
        bcc     L8BA9
        bcc     L8B47
        .byte   $92
        .byte   $97
        sta     ($47),y
        sta     ($D0),y
        .byte   $89
        .byte   $9B
        bcc     L8BC7
        sta     ($97),y
        bcc     L8B5A
L8BA9:  sta     ($47),y
        sta     ($0F),y
        sta     ($73),y
        .byte   $8F
        .byte   $1B
        bcc     L8BFB
        sta     ($9E),y
        bcc     L8BFE
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        sta     ($47),y
        sta     ($48),y
        txa
        pha
        lda     $C000
        .byte   $10
L8BC7:  php
        and     #$7F
        jsr     L8BEC
        sta     $C010
        pla
        tax
        pla
        rts

L8BD4:  lda     L8877
        cmp     L8876
        bne     L8BDE
        clc
        rts

L8BDE:  inc     L8877
        lda     L8877
        and     #$07
        tax
        lda     L8878,x
        sec
        rts

L8BEC:  pha
        inc     L8876
        lda     L8876
        and     #$07
        tax
        pla
        sta     L8878,x
        rts

L8BFB:  rti

L8BFC:  rti

L8BFD:  .byte   $20
L8BFE:  bmi     L8B8C
        tya
        sec
        sbc     L8BFB
        jsr     L8C5B
        pha
        txa
        sec
        sbc     L8BFC
        jsr     L8C5B
        cmp     #$80
        ror     a
        jsr     L9259
        pla
        cmp     #$80
        ror     a
        jmp     L91D6

L8C1E:  lda     $C061
        ora     $C062
        bpl     L8C2F
        jsr     L8C30
        sty     L8BFB
        stx     L8BFC
L8C2F:  rts

L8C30:  ldy     #$00
        ldx     #$00
        sta     $C070
L8C37:  lda     $C064
        bpl     L8C49
        inx
        bne     L8C41
        beq     L8C53
L8C41:  lda     $C065
        bpl     L8C56
        iny
        bne     L8C37
L8C49:  nop
        nop
        lda     $C065
        bpl     L8C5A
        iny
        bne     L8C37
L8C53:  pla
        pla
        rts

L8C56:  nop
        jmp     L8C37

L8C5A:  rts

L8C5B:  sta     $C6
        clc
        adc     $C6
        bvc     L8C69
        bpl     L8C67
        lda     #$7F
        rts

L8C67:  lda     #$81
L8C69:  rts

L8C6A:  lda     $0A5B
        cmp     #$18
        bcs     L8C74
        jsr     L92DB
L8C74:  jsr     L90C0
        rts

L8C78:  jsr     L8BD4
        bcc     L8C87
        ldx     $08A6
        beq     L8C88
        ora     #$80
        sta     $08B1
L8C87:  rts

L8C88:  cmp     #$60
        bcc     L8C8D
        rts

L8C8D:  asl     a
        clc
        adc     #$00
        sta     L8C9C
        lda     #$8B
        adc     #$00
        sta     L8C9D
        .byte   $6C
L8C9C:  brk
L8C9D:  brk
        lda     #$01
        sta     $08A6
        rts

        ldx     #$01
        lda     $FA
        cmp     #$03
        bne     L8CB2
        lda     #$00
        ldx     #$00
        beq     L8CC6
L8CB2:  cmp     #$06
        beq     L8CBA
        cmp     #$07
        bne     L8CBE
L8CBA:  stx     $0A63
        rts

L8CBE:  cmp     #$0C
        bne     L8CC5
        stx     $0A71
L8CC5:  rts

L8CC6:  ldy     #$00
        sty     $FA
        rts

L8CCB:  lda     $FA
        ldx     #$02
        cmp     #$03
        bne     L8CD9
        lda     #$01
        ldx     #$01
        bne     L8CC6
L8CD9:  cmp     #$06
        beq     L8CE1
        cmp     #$07
        bne     L8CE5
L8CE1:  stx     $0A63
        rts

L8CE5:  cmp     #$0C
        bne     L8CEC
        stx     $0A71
L8CEC:  rts

        lda     #$01
        ldx     #$02
        bne     L8CC6
        dec     $0A6B
        rts

L8CF7:  inc     $0A6B
        rts

        lda     #$00
        ldx     #$05
        bne     L8CC6
        lda     $FA
        nop
        ldx     #$00
        stx     $08F1
        sec
        sbc     #$02
        bne     L8D20
        sec
        rol     $0A74
        rol     $0A75
        rol     $0A76
        rol     $0A76
        clc
        ror     $0A76
        rts

L8D20:  ldx     $093A
        beq     L8D28
        jmp     L8DEA

L8D28:  sec
        sbc     #$02
        tax
        bne     L8D4F
        LDAX    s8898
        cmp     #$31
        bne     L8D42
        cpx     #$38
        bne     L8D42
        lda     #$33
        ldx     #$35
        bne     L8D4C
L8D42:  dex
        cpx     #$2F
        bne     L8D4C
        ldx     #$39
        sec
        sbc     #$01
L8D4C:  jmp     L8E73

L8D4F:  dex
        bne     L8D5E
        LDAX    s8898+2
        jsr     L8DFC
        jmp     L8E88

L8D5E:  dex
        bne     L8D80
        lda     $0A63
        cmp     #$02
        beq     L8D74
        LDAX    s889F
        jsr     L8E10
        jmp     L8EA4

L8D74:  LDAX    s88A6
        jsr     L8E10
        jmp     L8EB6

L8D80:  dex
        bne     L8DA2
        lda     $0A63
        cmp     #$02
        beq     L8D96
        LDAX    s889F+2
        jsr     L8DFC
        jmp     L8ED2

L8D96:  LDAX    s88A6+2
        jsr     L8DFC
        jmp     L8EE4

L8DA2:  dex
        cpx     #$04
        bcs     L8DB9
        lda     s88C5,x
        cmp     #'0'
        bne     L8DB0
        lda     #'8'
L8DB0:  sec
        sbc     #$01
        sta     s88C5,x
        jmp     L9F05

L8DB9:  dex
        dex
        dex
        dex
        bne     L8DEA
        lda     $0A71
        cmp     #$02
        beq     L8DD8
        dec     L8880
        lda     L8880
        cmp     #$FF
        bne     L8DD5
        lda     #$B3
        sta     L8880
L8DD5:  jmp     L9E29

L8DD8:  dec     L8883
        lda     L8883
        cmp     #$FF
        bne     L8DE7
        lda     #$B3
        sta     L8883
L8DE7:  jmp     L9E7C

L8DEA:  lda     $FA
        cmp     #$10
        bne     L8DFB
        lda     $0998
        beq     L8DF8
        dec     $0998
L8DF8:  jmp     L1B9F

L8DFB:  rts

L8DFC:  cpx     #$30
        bne     L8E09
        ldx     #$35
        cmp     #$30
        bne     L8E0C
        lda     #$39
        rts

L8E09:  ldx     #$30
        rts

L8E0C:  sec
        sbc     #$01
        rts

L8E10:  cmp     #$30
        bne     L8E1D
        cpx     #$38
        bne     L8E1D
        lda     #$31
        ldx     #$37
        rts

L8E1D:  dex
        cpx     #$2F
        bne     L8E26
        ldx     #$39
        lda     #$30
L8E26:  rts

        lda     $FA
        nop
        ldx     #$00
        stx     $08F1
        sec
        sbc     #$02
        bne     L8E47
        clc
        ror     $0A76
        ror     $0A75
        ror     $0A74
        lda     #$1F
        ora     $0A74
        sta     $0A74
        rts

L8E47:  ldx     $093A
        beq     L8E4F
        jmp     L8F35

L8E4F:  sec
        sbc     #$02
        tax
        bne     L8E7C
        LDAX    s8898
        cmp     #$33
        bne     L8E69
        cpx     #$35
        bne     L8E69
        lda     #$31
        ldx     #$38
        bne     L8E73
L8E69:  inx
        cpx     #$3A
        bne     L8E73
        ldx     #$30
        clc
        adc     #$01
L8E73:  STAX    s8898
        jmp     L8E8E

L8E7C:  dex
        bne     L8E91
        LDAX    s8898+2
        jsr     L8F47
L8E88:  STAX    s8898+2
L8E8E:  jmp     L9E09

L8E91:  dex
        bne     L8EBF
        lda     $0A63
        cmp     #$02
        beq     L8EAD
        LDAX    s889F
        jsr     L8F5C
L8EA4:  STAX    s889F
        jmp     L9DC3

L8EAD:  LDAX    s88A6
        jsr     L8F5C
L8EB6:  STAX    s88A6
        jmp     L9DDF

L8EBF:  dex
        bne     L8EED
        lda     $0A63
        cmp     #$02
        beq     L8EDB
        LDAX    s889F+2
        jsr     L8F47
L8ED2:  STAX    s889F+2
        jmp     L9DC3

L8EDB:  LDAX    s88A6+2
        jsr     L8F47
L8EE4:  STAX    s88A6+2
        jmp     L9DDF

L8EED:  dex
        cpx     #$04
        bcs     L8F04
        lda     s88C5,x
        cmp     #$37
        bne     L8EFB
        lda     #$2F
L8EFB:  clc
        adc     #$01
        sta     s88C5,x
        jmp     L9F05

L8F04:  dex
        dex
        dex
        dex
        bne     L8F35
        lda     $0A71
        cmp     #$02
        beq     L8F23
        inc     L8880
        lda     L8880
        cmp     #$B4
        bne     L8F20
        lda     #$00
        sta     L8880
L8F20:  jmp     L9E29

L8F23:  inc     L8883
        lda     L8883
        cmp     #$B4
        bne     L8F32
        lda     #$00
        sta     L8883
L8F32:  jmp     L9E7C

L8F35:  lda     $FA
        cmp     #$10
        bne     L8F46
        lda     $0998
        bne     L8F43
        inc     $0998
L8F43:  jsr     L1B9F
L8F46:  rts

L8F47:  cpx     #$35
        bne     L8F53
        ldx     #$30
        cmp     #$39
        bne     L8F56
        txa
        rts

L8F53:  ldx     #$35
        rts

L8F56:  ldx     #$30
        clc
        adc     #$01
        rts

L8F5C:  cmp     #$31
        bne     L8F68
        cpx     #$37
        bne     L8F68
        lda     #$30
        inx
L8F67:  rts

L8F68:  inx
        cpx     #$3A
        bne     L8F72
        ldx     #$30
        clc
        adc     #$01
L8F72:  rts

        lda     #$01
        ora     $0A72
        sta     $0A72
        rts

        rts

        lda     $0937
        beq     L8FAB
        lda     #$00
        sec
        sbc     $6C
        sta     $09AD
        lda     #$00
        sbc     $6D
        sta     $09AE
        lda     #$00
        sec
        sbc     $6E
        sta     $09AF
        lda     #$00
        sbc     $6F
        sta     $09B0
        lda     $70
        ldx     $71
        sta     $09E4
        stx     $09E5
        rts

L8FAB:  lda     $08F1
        beq     L8FBE
        lda     $FA
        cmp     #$08
        bcc     L8FBE
        cmp     #$0C
        bcs     L8FBE
        adc     #$01
        bne     L8FC0
L8FBE:  lda     #$08
L8FC0:  jmp     L9071

        nop
        nop
        nop
        lda     #$00
        sta     $099E
        sta     $099F
        sta     $09A0
        sta     $09A1
        rts

        lda     $08B2
        ldx     $08B3
        sec
        sbc     $70
        tay
        txa
        sbc     $71
        tax
        tya
        clc
        adc     $0848
        tay
        txa
        adc     $0849
        tax
        tya
        clc
        adc     $0846
        tay
        txa
        adc     $0847
        tax
        tya
        sta     $08AB
        stx     $08AC
        rts

        lda     $0A58
        eor     #$FF
        sta     $0A58
        jmp     L9F10

        lsr     $092C
        rts

        lda     $0A61
        eor     #$FF
        sta     $0A61
        jmp     L9F10

        lda     $093A
        cmp     #$01
        bne     L9040
        lda     $08D2
        cmp     #$30
        beq     L9040
        lda     $0A56
        ora     $0A57
        bne     L9040
        dec     $08D2
        lda     $0A39
        ldx     $0A3A
        sta     $0A56
        stx     $0A57
L9040:  rts

        lda     #$01
        lda     $08F1
        beq     L9051
        lda     $FA
        cmp     #$04
        bne     L9051
        inc     $FA
        rts

L9051:  cmp     #$05
        bne     L9058
        inc     $0909
L9058:  lda     #$04
        bne     L9071
        lda     #$0C
        sta     $FA
        rts

        lda     $08F1
        beq     L906F
        lda     $FA
        cmp     #$06
        bne     L906F
        inc     $FA
        rts

L906F:  lda     #$06
L9071:  sta     $FA
        lda     #$03
        sta     $08F1
        rts

        lda     #$03
        sta     $FA
        rts

L907E:  lda     $09E3
        beq     L90B2
        dec     $0A12
        bpl     L9090
        lda     #$00
        sta     $0A11
        sta     $0A12
L9090:  rts

        ldx     #$01
L9093:  stx     $08A7
        rts

        ldx     #$02
        bne     L9093
        jmp     L8AFD

        lda     $0937
        beq     L90B1
        lda     #$00
        sta     $6E
        sta     $6F
        sta     $70
        sta     $71
        sta     $6C
        sta     $6D
L90B1:  rts

L90B2:  lda     $0A54
        ora     $0A55
        beq     L90BF
        lda     #$03
        sta     $0A60
L90BF:  rts

L90C0:  inc     $0A6D
        lda     #$78
        lsr     $08C5
        bcs     L90E5
        lda     $0A6F
        clc
        adc     #$08
        bpl     L90E5
L90D2:  rts

        dec     $0A6D
        lda     #$00
        lsr     $08C5
        bcs     L90E5
        lda     $0A6F
        sec
        sbc     #$08
        bmi     L90D2
L90E5:  sta     $0A6F
L90E8:  lda     $0A6F
        lsr     a
        lsr     a
        lsr     a
        jmp     L1A8C

L90F1:  lda     #$01
        sta     $08C5
        rts

        lda     #$10
        sta     $FA
        rts

        ldx     #$02
        stx     $FA
L9100:  dex
        stx     $0836
        rts

        ldx     #$01
        lda     $0836
        bne     L9100
        stx     $FA
        rts

        ldx     #$0A
        jsr     L9303
        inc     $0A69
        lda     $0A5D
        clc
        adc     #$04
        cmp     #$54
        jmp     L9135

        ldx     #$0E
        jsr     L9303
        inc     $08C8
        inc     $0A67
        lda     $0A5D
        sec
        sbc     #$04
        cmp     #$AC
L9135:  beq     L913A
        sta     $0A5D
L913A:  lda     #$50
        sec
        sbc     $0A5D
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        jsr     L1ABF
L9147:  rts

        ldx     #$02
        jsr     L9303
        dec     $0A67
        lda     $0A5F
        sec
        sbc     #$20
        bpl     L915A
        lda     #$00
L915A:  sta     $0A5F
L915D:  lsr     a
        lsr     a
        lsr     a
        lsr     a
        jsr     L1AAC
        lda     $0A5E
        ldx     $0A5F
        sta     $C2
        stx     $C3
        lda     $0A31
        ldx     $0A32
        jsr     L168F
        sta     $09F0
        stx     $09F1
        jsr     L9386
        lda     $0A5E
        ldx     $0A5F
        sta     $C2
        stx     $C3
        lda     $09DA
        ldx     $09DB
        jsr     L168F
        stx     $09D9
        rts

        ldx     #$06
        jsr     L9303
        dec     $0A69
        lda     $0937
        bne     L91B0
        lda     $0A5F
        clc
        adc     #$20
        bpl     L915A
        lda     #$60
        bpl     L915A
L91B0:  rts

        ldx     #$00
        jsr     L9303
        lda     $0A5B
        sec
        sbc     #$04
        ldx     $0937
        bne     L91C9
        ldx     $08F1
        beq     L91C9
        sec
        sbc     #$0C
L91C9:  sta     $0A5B
        ora     #$00
        bpl     L91D6
        cmp     #$B0
        bcs     L91D6
        lda     #$B0
L91D6:  sta     $0A5B
        lda     #$03
        sta     $08F1
L91DE:  lda     #$50
        sec
        sbc     $0A5B
        lsr     a
        lsr     a
        lsr     a
        cmp     L8AFE
        beq     L91F2
        sta     L8AFE
        jsr     L1A3D
L91F2:  rts

        inc     $08B4
        rts

        ldx     #$0C
        jsr     L9303
        lda     $0A53
        sec
        sbc     #$04
        cmp     #$80
        beq     L91F2
        sta     $0A53
        jmp     L925C

        ldx     #$FF
        jsr     L9303
L9211:  lda     #$00
        ldx     $0937
        beq     L9227
        sta     $0A5B
        sta     $0A6B
        sta     $0A67
        sta     $0A69
        sta     $0A6D
L9227:  sta     $0A53
        sta     $0A65
        lda     $097C
        lsr     a
        clc
        adc     $09CC
        cmp     $097C
        bcc     L9246
        lda     $09CB
        ldx     $09CC
        sta     $08B9
        stx     $08BA
L9246:  jsr     L925C
        jmp     L92B7

        ldx     #$04
        jsr     L9303
        lda     $0A53
        clc
        adc     #$04
        bvs     L92A0
L9259:  sta     $0A53
L925C:  lda     $0936
        beq     L9270
        lda     $0A52
        ldx     $0A53
        sta     $0A64
        stx     $0A65
        jsr     L92CB
L9270:  lda     $0A53
        clc
        adc     #$7F
        lsr     a
        lsr     a
        lsr     a
        cmp     L8AFF
        sta     L8AFF
        beq     L9284
        jsr     L1A57
L9284:  lda     $0A52
        ldx     $0A53
        sta     $C2
        stx     $C3
        lda     $0A2F
        ldx     $0A30
        jsr     L168F
        sta     $09E8
        stx     $09E9
        jsr     L9311
L92A0:  rts

        lda     $0A65
        sec
        sbc     #$04
        cmp     #$80
        bne     L92B4
        rts

        lda     $0A65
        clc
        adc     #$04
        bvs     L92DA
L92B4:  sta     $0A65
L92B7:  lda     $0936
        beq     L92CB
        lda     $0A64
        ldx     $0A65
        sta     $0A52
        stx     $0A53
        jsr     L9270
L92CB:  lda     $0A65
        clc
        adc     #$7F
        lsr     a
        lsr     a
        lsr     a
        jsr     L1A78
        jsr     L9311
L92DA:  rts

L92DB:  ldx     #$08
        jsr     L9303
        lda     $0A5B
        clc
        adc     #$04
        ldx     $0937
        bne     L92F3
        ldx     $08F1
        beq     L92F3
        clc
        adc     #$0C
L92F3:  sta     $0A5B
        ora     #$00
        bmi     L9300
        cmp     #$50
        bcc     L9300
        lda     #$50
L9300:  jmp     L91D6

L9303:  lda     $FA
        cmp     #$01
        bne     L9310
        dec     $FA
        stx     $0A70
        pla
        pla
L9310:  rts

L9311:  ldx     $0A65
        jsr     L172C
        stx     $B7
        ldx     $0A53
        jsr     L172C
        txa
        sec
        sbc     $B7
        sta     $09C2
        sta     $C3
        lda     #$00
        sta     $C2
        lda     $0A29
        ldx     $0A2A
        jsr     L168F
        sta     $09E6
        stx     $09E7
        lda     $09C1
        ldx     $09C2
        sta     $C2
        stx     $C3
        lda     $0A25
        ldx     $0A26
        jsr     L168F
        sta     $09C3
        stx     $09C4
        lda     $09C1
        ldx     $09C2
        sta     $C2
        stx     $C3
        lda     $0A27
        ldx     $0A28
        jsr     L168F
        sta     $0A0B
        stx     $0A0C
        lda     $09C1
        ldx     $09C2
        sta     $C2
        stx     $C3
        lda     $0A23
        ldx     $0A24
        jsr     L168F
        sta     $09C5
        stx     $09C6
L9386:  lda     $09F0
        clc
        adc     $09B1
        tax
        lda     $09F1
        adc     $09B2
        tay
        txa
        sec
        sbc     $09E8
        sta     $09EE
        tya
        sbc     $09E9
        sta     $09EF
        txa
        clc
        adc     $09E8
        tax
        tya
        adc     $09E9
        tay
        txa
        clc
        adc     $09C5
        sta     $09EC
        tya
        adc     $09C6
        sta     $09ED
        rts

        .byte   $64
        .byte   $64
        .byte   $64
        .byte   $5A
        pha
        .byte   $37
        ora     $1919,y
        .byte   $19
L93C9:  rts

L93CA:  lda     $0937
        bne     L93C9
        ldx     $09AD
        lda     $09AE
        jsr     L1778
        sta     $0A03
        stx     $0A04
        lda     $09AE
        jsr     L1763
        sta     $09B7
        stx     $09B8
        ldx     $09AF
        lda     $09B0
        jsr     L1778
        sta     $0A05
        stx     $0A06
        lda     $09B0
        jsr     L1763
        sta     $09BB
        stx     $09BC
        sta     $09C7
        stx     $09C8
        lda     #$D6
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     L188D
        tax
        ldy     $0A65
        jsr     L180C
        sty     $09D4
        sta     $09D3
        lda     #$B8
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     L188D
        lda     $0A5A
        ldx     $0A5B
        jsr     L168F
        sta     $09AB
        sta     $C2
        txa
        clc
        adc     #$07
        sta     $09AC
        sta     $C3
        lda     $0A2D
        ldx     $0A2E
        jsr     L168F
        sta     $09EA
        stx     $09EB
        lda     #$BF
        sta     $B8
        lda     #$93
        sta     $B9
        jsr     L188D
        lda     $C2
        ldx     $C3
        sta     L00A5
        stx     $A6
        lda     L00A5
        ldx     $A6
        sta     $C2
        stx     $C3
        lda     $09EC
        ldx     $09ED
        jsr     L168F
        clc
        adc     $09EA
        sta     $0A19
        txa
        adc     $09EB
        sta     $0A1A
        lda     $08C3
        beq     L9493
        lda     #$00
        sta     $0A19
        sta     $0A1A
L9493:  lda     L00A5
        ldx     $A6
        sta     $C2
        stx     $C3
        lda     $09EE
        ldx     $09EF
        jsr     L168F
        clc
        adc     $09EA
        sta     $0A1B
        txa
        adc     $09EB
        sta     $0A1C
        lda     $09AC
        bmi     L94E1
        ldx     #$80
        cmp     #$29
        bcc     L94BF
        ldx     #$AA
L94BF:  stx     $3A36
        stx     $3E36
        stx     $22B6
        stx     $5A36
        stx     $5E36
        stx     $42B6
        cmp     #$2C
        bcc     L94E5
L94D5:  ldx     #$0F
        stx     $08B6
        ldx     #$06
        stx     $0899
        bne     L94E7
L94E1:  cmp     #$D1
        bcc     L94D5
L94E5:  ldx     #$00
L94E7:  lda     $0A11
        ldx     $0A12
        sta     $C2
        stx     $C3
        jsr     L168F
        sta     $0A13
        stx     $0A14
        sta     $C2
        stx     $C3
        lda     $0A19
        ldx     $0A1A
        jsr     L168F
        stx     $09F7
        asl     a
        rol     $09F7
        asl     a
        rol     $09F7
        sta     $09F6
        lda     $0A13
        ldx     $0A14
        sta     $C2
        stx     $C3
        lda     $0A1B
        ldx     $0A1C
        jsr     L168F
        stx     $09F9
        asl     a
        rol     $09F9
        asl     a
        rol     $09F9
        sta     $09F8
        ldx     #$00
        lda     $5F
        cmp     #$14
        lda     $60
        sbc     #$00
        bpl     L9544
        ldx     #$0B
L9544:  txa
        pha
        lda     $09F8
        clc
        adc     $09F6
        sta     $C2
        lda     $09F9
        adc     $09F7
        sta     $C3
        lda     $09A9
        ldx     $09AA
        jsr     L1696
        pla
        clc
        adc     $09F3
        tax
        lda     $09F2
        jsr     L168F
        sta     $09F4
        stx     $09F5
        lda     $08B6
        beq     L9582
        dec     $08B6
        lda     #$00
        sta     $09F4
        sta     $09F5
L9582:  lda     $0A03
        ldx     $0A04
        sta     $C2
        stx     $C3
        lda     $0A17
        ldx     $0A18
        jsr     L168F
        sta     $0A09
        stx     $0A0A
        lda     $09B7
        ldx     $09B8
        sta     $C2
        stx     $C3
        lda     $0A17
        ldx     $0A18
        jsr     L168F
        sta     $09BF
        stx     $09C0
        lda     $09F4
        ldx     $09F5
        sta     $C2
        stx     $C3
        lda     $09C7
        ldx     $09C8
        jsr     L168F
        sec
        sbc     $09BF
        sta     $0A0F
        txa
        sbc     $09C0
        sta     $0A10
        lda     $0A19
        ldx     $0A1A
        sta     $C2
        stx     $C3
        jsr     L168F
        sta     $0A1D
        stx     $0A1E
        lda     $0A1B
        ldx     $0A1C
        sta     $C2
        stx     $C3
        jsr     L168F
        sta     $0A1F
        stx     $0A20
        clc
        adc     $0A1D
        bcc     L9603
        inx
        clc
L9603:  adc     $09E6
        sta     $C2
        txa
        adc     $0A1E
        clc
        adc     $09E7
        clc
        adc     $09D9
        sta     $C3
        lda     $09B5
        ldx     $09B6
        jsr     L168F
        clc
        adc     $09B3
        sta     $C2
        txa
        adc     $09B4
        sta     $C3
        lda     $0A13
        ldx     $0A14
        jsr     L1696
        lda     $09A9
        ldx     $09AA
        jsr     L168F
        clc
        adc     $0A09
        sta     $09CF
        txa
        adc     $0A0A
        sta     $09D0
        lda     $0A11
        ora     $0A12
        beq     L9662
        lda     $09CF
        clc
        adc     $0A2B
        sta     $09CF
        bcc     L9662
        inc     $09D0
L9662:  lda     $0A0D
        sec
        sbc     $09CF
        sta     $09D7
        sta     $C2
        lda     $0A0E
        sbc     $09D0
        sta     $09D8
        sta     $C3
        lda     $09FB
        ldx     $09FC
        jsr     L168F
        sta     $09D1
        stx     $09D2
        lda     #$CC
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     L188D
        lda     $0A05
        ldx     $0A06
        jsr     L1696
        lda     $09F4
        ldx     $09F5
        jsr     L97B0
        ldy     $09E3
        beq     L96AF
        tay
        txa
        jmp     L96B8

L96AF:  clc
        adc     $09C3
        tay
        txa
        adc     $09C4
L96B8:  sty     $09CD
        sta     $09CE
        lda     $09E3
        beq     L96E0
        lda     $0A11
        ora     $0A12
        beq     L96E0
        lda     $0A64
        ldx     $0A65
        jsr     L172C
        jsr     L172C
        jsr     L172C
        sta     $09CD
        stx     $09CE
L96E0:  lda     #$C2
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     L188D
        lda     $0899
        beq     L96F9
        lda     $0A0F
        ldx     $0A10
        jmp     L9704

L96F9:  lda     $0A10
        cmp     #$80
        ror     a
        tax
        lda     $0A0F
        ror     a
L9704:  jsr     L168F
        sta     $09C9
        txa
        sta     $09CA
        ldx     $09E3
        beq     L971E
        tax
        bpl     L971E
        lda     #$00
        sta     $09C9
        sta     $09CA
L971E:  lda     #$76
        sta     $C2
        lda     #$FD
        sta     $C3
        lda     $09C9
        ldx     $09CA
        jsr     L168F
        clc
        adc     $09D1
        tay
        txa
        adc     $09D2
        tax
        tya
        ldy     $0899
        beq     L9745
        lda     $09D1
        ldx     $09D2
L9745:  clc
        adc     $0A11
        sta     $0A11
        txa
        adc     $0A12
        bvc     L9754
        lda     #$64
L9754:  bpl     L975B
        lda     #$00
        sta     $0A11
L975B:  sta     $0A12
        lda     $09AD
        clc
        adc     $09C9
        sta     $09AD
        lda     $09AE
        adc     $09CA
        sta     $09AE
        bpl     L978B
        jsr     L9779
        jsr     L978B
L9779:  lda     #$00
        sec
        sbc     $09AD
        sta     $09AD
        lda     #$00
        sbc     $09AE
        sta     $09AE
        rts

L978B:  tax
        lda     $09AD
        cpx     #$40
        bcc     L97AF
        jsr     L1880
        sta     $09AD
        txa
        eor     #$80
        sta     $09AE
        lda     $09B0
        eor     #$80
        sta     $09B0
        lda     $09E5
        eor     #$80
        sta     $09E5
L97AF:  rts

L97B0:  jsr     L168F
        asl     a
        tay
        txa
        rol     a
        asl     a
        tax
        tya
        asl     a
        bcc     L97BE
        inx
L97BE:  rts

L97BF:  lda     #$01
        sta     $08C2
        lda     $32
        tax
        sec
        sbc     $08B7
        stx     $08B7
        sta     $09DE
        lda     $33
        tax
        sbc     $08B8
        stx     $08B8
L97DA:  dec     $34
        bmi     L97E5
        clc
        adc     #$10
        bvc     L97DA
        lda     #$7F
L97E5:  inc     $34
        sta     $09DF
        sta     $C3
        lda     #$00
        sta     $C2
        lda     $09CD
        ldx     $09CE
        jsr     L168F
        clc
        adc     $09E4
        sta     $09E4
        txa
        adc     $09E5
        sta     $09E5
        lda     $09DE
        ldx     $09DF
        sta     $C2
        stx     $C3
        lda     $0A11
        ldx     $0A12
        jsr     L168F
        sta     $09E0
        stx     $09E1
        lda     $0A0B
        ldx     $0A0C
        ldy     $09E3
        beq     L982F
        lda     #$00
        ldx     #$00
L982F:  clc
        adc     $09E4
        txa
        adc     $09E5
        sta     $B7
        jsr     L1768
        sta     $0A07
        stx     $0A08
        lda     $B7
        jsr     L1763
        sta     $09BD
        stx     $09BE
        lda     $09B7
        ldx     $09B8
        sta     $C2
        stx     $C3
        lda     $09E0
        ldx     $09E1
        jsr     L168F
        sta     $09B9
        stx     $09BA
        sta     $C2
        stx     $C3
        lda     $0A07
        ldx     $0A08
        jsr     L168F
        sta     $09D5
        stx     $09D6
        lda     $0A03
        ldx     $0A04
        sta     $C2
        stx     $C3
        lda     $09E0
        ldx     $09E1
        jsr     L168F
        clc
        adc     $08A1
        tay
        txa
        adc     $08A2
        tax
        tya
        sta     $09A7
        stx     $09A8
        lda     $09BD
        ldx     $09BE
        sta     $C2
        stx     $C3
        lda     $09B9
        ldx     $09BA
        jsr     L168F
        sta     $0A01
        stx     $0A02
        lda     $09F6
        sec
        sbc     $09F8
        sta     $09FF
        lda     $09F7
        sbc     $09F9
        asl     $09FF
        rol     a
        asl     $09FF
        rol     a
        sta     $0A00
        sta     $C3
        lda     $09FF
        sta     $C2
        lda     $09FD
        ldx     $09FE
        jsr     L168F
        sta     $09CB
        stx     $09CC
        lda     $09CB
        sec
        sbc     $08B9
        sta     $09CB
        lda     $09CC
        sbc     $08BA
        sta     $09CC
        lda     $08B9
        ora     $08BA
        beq     L990E
        ldx     #$00
        stx     $08B9
        stx     $08BA
        inx
        stx     $089A
L990E:  lda     $09E0
        ldx     $09E1
        sta     $C2
        stx     $C3
        lda     $09CB
        ldx     $09CC
        jsr     L168F
        asl     a
        tay
        txa
        rol     a
        tax
        tya
        clc
        adc     $09AF
        sta     $09AF
        txa
        adc     $09B0
        sta     $09B0
        ldx     #$00
        lda     $0A01
        clc
        adc     $62
        sta     $62
        lda     $0A02
        bpl     L9945
        dex
L9945:  adc     $63
        sta     $63
        txa
        adc     $64
        sta     $64
        txa
        adc     $65
        sta     $65
        ldx     #$00
        lda     $09D5
        clc
        adc     $5A
        sta     $5A
        lda     $09D6
        bpl     L9963
        dex
L9963:  adc     $5B
        sta     $5B
        txa
        adc     $5C
        sta     $5C
        txa
        adc     $5D
        sta     $5D
        ldx     #$00
        lda     $09A7
        clc
        adc     $5E
        sta     $5E
        lda     $09A8
        bpl     L9981
        dex
L9981:  adc     $5F
        sta     $5F
        txa
        adc     $60
        sta     $60
        bpl     L9996
        lda     #$00
        sta     $5E
        sta     $60
        lda     #$03
        sta     $5F
L9996:  lda     $089E
        beq     L99A1
        jsr     LA524
        dec     $089E
L99A1:  lda     $09AB
        ldx     $09AC
        sta     $C2
        stx     $C3
        lda     $0A21
        ldx     $0A22
        jsr     L168F
        sec
        sbc     $09AD
        pha
        txa
        sbc     $09AE
        ldy     $0A70
        bne     L99C5
        clc
        adc     #$00
L99C5:  tax
        pla
        ldy     $09E3
        bne     L99D7
        clc
        adc     $09DC
        tay
        txa
        adc     $09DD
        tax
        tya
L99D7:  sta     $6C
        txa
        clc
        adc     $09FA
        sta     $6D
        lda     #$00
        sta     $09FA
        sec
        sbc     $09AF
        sta     $6E
        lda     #$00
        sbc     $09B0
        sta     $6F
        lda     $09E4
        ldx     $09E5
        sta     $70
        stx     $71
        ldx     #$00
        lda     $5E
        cmp     #$01
        lda     $5F
        sbc     #$03
        lda     $60
        sbc     #$00
        bpl     L9A0D
        dex
L9A0D:  stx     $09E3
        txa
        beq     L9A6A
        lda     #$00
        sta     $09AF
        sta     $09B0
        sta     $09CB
        sta     $09CC
        ldx     $09AE
        bpl     L9A2C
        sta     $09AD
        sta     $09AE
L9A2C:  lda     $089E
        beq     L9A37
        jsr     L907E
        jmp     L9A57

L9A37:  ldx     #$04
        lda     $0A16
        bpl     L9A57
        clc
        adc     #$08
        bpl     L9A4B
        stx     $0834
        lda     #$00
        sta     $0A12
L9A4B:  lda     $6F
        clc
        adc     #$0A
        cmp     #$14
        bcc     L9A57
        stx     $0834
L9A57:  ldx     #$00
        lda     $09E2
        bne     L9A64
        dec     $09E2
        ldx     $0A16
L9A64:  stx     $09FA
        jmp     L9A85

L9A6A:  cmp     $09E2
        beq     L9A85
        sta     $09E2
        lda     $63
        and     #$03
        bne     L9A85
        ldx     #$00
        adc     $2B
        bpl     L9A7F
        dex
L9A7F:  sta     $09A0
        stx     $09A1
L9A85:  lda     $09DE
        ldx     $09DF
        sta     $C4
        stx     $C5
        lda     $09A8
        ldx     $09A7
        jsr     L16A2
        lda     $C2
        ldx     $C3
        sta     $0A15
        stx     $0A16
L9AA2:  rts

L9AA3:  lda     $0937
        bne     L9AA2
        lda     $0830
        tax
        asl     a
        sta     $C2
        lda     $0831
        rol     a
        sta     $C3
        ror     a
        lsr     a
        tay
        txa
        ror     a
        adc     $C2
        sta     $C2
        tya
        adc     $C3
        sta     $C3
        lda     #$FE
        sbc     $C2
        sta     $09A9
        lda     #$7F
        sbc     $C3
        sta     $09AA
        lda     $0A65
        bne     L9AFB
        lda     $09AF
        ldx     $09B0
        bmi     L9AE9
        sec
        sbc     #$05
        bcc     L9AE4
        inx
L9AE4:  dex
        bmi     L9AF2
        bpl     L9AF5
L9AE9:  clc
        adc     #$05
        bcs     L9AEF
        dex
L9AEF:  inx
        bmi     L9AF5
L9AF2:  lda     #$00
        tax
L9AF5:  sta     $09AF
        stx     $09B0
L9AFB:  lda     $0838
        beq     L9B1E
        lda     $0A12
        bne     L9B19
        jsr     L9B1F
        lda     $0838
        cmp     #$02
        bne     L9B19
        lda     #$64
        sta     $0A54
        lda     #$35
        sta     $08D2
L9B19:  lda     #$00
        sta     $0838
L9B1E:  rts

L9B1F:  lda     #$19
        sta     $0994
        sta     $0997
        ldx     #$FF
        stx     $0914
        stx     $0915
        stx     $089B
        stx     $089C
        inx
        stx     $08A4
        stx     $0991
        inx
        stx     $099A
        stx     $0999
        inc     $08A5
        rts

L9B47:  lsr     $08C2
        bcc     L9B4F
        jsr     L9211
L9B4F:  lda     $0A53
        jsr     L9C13
        clc
        adc     $5B
        sta     $5B
        txa
        adc     $5C
        sta     $5C
        lda     $BC
        adc     $5D
        sta     $5D
        lda     #$00
        sec
        sbc     $0A5B
        jsr     L9C13
        clc
        adc     $63
        sta     $63
        txa
        adc     $64
        sta     $64
        lda     $BC
        adc     $65
        sta     $65
        ldx     #$FF
        lda     $0A6D
        bmi     L9B86
        inx
L9B86:  clc
        adc     $5F
        sta     $5F
        txa
        adc     $60
        sta     $60
        txa
        adc     $61
        sta     $61
        bpl     L9B9F
        lda     #$00
        sta     $5F
        sta     $60
        sta     $61
L9B9F:  lda     $60
        sta     $60
        lda     $0A6B
        asl     a
        tay
        lda     $6F
        clc
        adc     #$40
        bpl     L9BB6
        tya
        eor     #$FF
        clc
        adc     #$01
        tay
L9BB6:  tya
        clc
        adc     $6D
        sta     $6D
        bmi     L9BC5
        cmp     #$41
        bcc     L9BE8
        jmp     L9BC9

L9BC5:  cmp     #$C0
        bcs     L9BE8
L9BC9:  lda     #$00
        sec
        sbc     $6C
        sta     $6C
        lda     #$00
        sbc     $6D
        sta     $6D
        lda     $6D
        eor     #$80
        sta     $6D
        lda     $6F
        eor     #$80
        sta     $6F
        lda     $71
        eor     #$80
        sta     $71
L9BE8:  lda     $0A67
        clc
        adc     $6F
        sta     $6F
        lda     $71
        sec
        sbc     $0A69
        sta     $71
L9BF8:  lda     $65
        clc
        adc     #$40
        sta     $093D
        lda     $64
        sta     $093C
        lda     $5D
        clc
        adc     #$40
        sta     $093F
        lda     $5C
        sta     $093E
        rts

L9C13:  tax
        bpl     L9C2B
        lda     #$FF
        sta     $BC
        sta     $B7
L9C1C:  asl     $B7
        rol     a
        rol     $BC
        inx
        inx
        inx
        inx
        bmi     L9C1C
L9C27:  tax
        lda     $B7
        rts

L9C2B:  lda     #$00
        sta     $BC
        sta     $B7
L9C31:  dex
        dex
        dex
        dex
        bmi     L9C27
        sec
        rol     $B7
        rol     a
        rol     $BC
        jmp     L9C31

L9C40:  ldx     $0899
        dex
        bmi     L9C4A
        stx     $0899
        rts

L9C4A:  lda     $09AE
        clc
        adc     #$0F
        cmp     #$1E
        bcs     L9C68
        lda     $09B0
        clc
        adc     #$16
        cmp     #$2C
        bcs     L9C68
        lda     $0A12
        clc
        adc     #$53
        cmp     #$A6
        bcc     L9C6D
L9C68:  lda     #$06
        sta     $0899
L9C6D:  rts

L9C6E:  lda     $0937
        beq     L9C76
        nop
        nop
        nop
L9C76:  rts

L9C77:  lda     $FB
        and     #$04
        beq     L9C76
        lda     $70
        ldx     $71
        clc
        adc     $08AB
        tay
        txa
        adc     $08AC
        tax
        tya
        sec
        sbc     $0848
        tay
        txa
        sbc     $0849
        tax
        tya
        sec
        sbc     $0846
        tay
        txa
        sbc     $0847
        tax
        tya
        jsr     L9CE6
        cmp     L8881
        beq     L9C76
        sta     L8881
        pha
        stx     $3E
        lda     #$88
        ldx     #$88
        jsr     L9CFC
        CALLAX  DrawMessage3, m8886
        ldx     $3E
        pla
        sec
        sbc     #$B4
        tay
        txa
        sbc     #$00
        tax
        tya
        cpx     #$80
        bcc     L9CD4
        adc     #$67
        bcc     L9CD3
        inx
L9CD3:  inx
L9CD4:  sta     $B6
        stx     $B7
        lda     #$8E
        ldx     #$88
        jsr     L9CFC
        JUMPAX  DrawMessage3, m888C

L9CE6:  tay
        txa
        lsr     a
        tax
        tya
        ror     a
        sta     $C2
        stx     $C3
        lda     #$68
        ldx     #$01
        jsr     L168F
        sta     $B6
        stx     $B7
        rts

L9CFC:  sta     $B8
        stx     $B9
L9D00:  .byte   $A9
L9D01:  .byte   $64
        ldx     #$00
        ldy     #$00
L9D06:  .byte   $20
L9D07:  .byte   $73
        .byte   $1C
        lda     #$0A
        ldx     #$00
        ldy     #$01
        jsr     L1C73
        lda     $B6
        ora     #$30
        ldy     #$02
        sta     ($B8),y
        rts

L9D1B:  lda     $FC
        and     #$10
        beq     L9D6A
        lda     $0A70
        bne     L9D6A
        lda     $08B2
        ldx     $08B3
        sec
        sbc     $70
        tay
        txa
        sbc     $71
        tax
        tya
        clc
        adc     $0848
        tay
        txa
        adc     $0849
        tax
        tya
        clc
        adc     $0846
        tay
        txa
        adc     $0847
        tax
        tya
        inx
        dex
        bmi     L9D6B
        bne     L9D58
        lda     #$00
        ldx     #$00
        jmp     L9D7A

L9D58:  cpx     #$0A
        bpl     L9D63
        lda     #$B5
        ldx     #$FF
        jmp     L9D7A

L9D63:  lda     #$50
        ldx     #$FB
        jmp     L9D7A

L9D6A:  rts

L9D6B:  cpx     #$F6
        bmi     L9D76
        lda     #$4B
        ldx     #$00
        jmp     L9D7A

L9D76:  lda     #$B0
        ldx     #$04
L9D7A:  clc
        adc     $08B2
        tay
        txa
        adc     $08B3
        tax
        tya
        sta     $08B2
        stx     $08B3
        jsr     L9CE6
        lda     #$94
        ldx     #$88
        jsr     L9CFC
        JUMPAX  DrawMessage2, m8892

L9D9C:  sta     $BE
        stx     $BF
        ldy     #$00
        lda     ($BE),y
        asl     a
        asl     a
        asl     a
        asl     a
        sta     $B7
        iny
        lda     ($BE),y
        and     #$0F
        ora     $B7
        tax
        iny
        lda     ($BE),y
        asl     a
        asl     a
        asl     a
        asl     a
        sta     $B6
        iny
        lda     ($BE),y
        and     #$0F
        ora     $B6
        rts

L9DC3:  jsr     L9EFC
        CALLAX  DrawMessage3, m889F
        lda     #$A1
        ldx     #$88
        jsr     L9D9C
        sta     $08F7
        stx     $08F8
L9DDA:  lda     #$FE
        jmp     L9DFD

L9DDF:  jsr     L9EFC
        lda     $097B
        bne     L9E08
        CALLAX  DrawMessage3, m88A6
        lda     #$A8
        ldx     #$88
        jsr     L9D9C
        sta     $08F5
        stx     $08F6
L9DFB:  lda     #$FD
L9DFD:  and     $08F4
        sta     $08F4
        lda     #$01
        sta     $08F2
L9E08:  rts

L9E09:  jsr     L9EFC
        CALLAX  DrawMessage3, m8898
        lda     #$9A
        ldx     #$88
        jsr     L9D9C
        sta     $089F
        stx     $08A0
        lda     #$01
        sta     $0913
        sta     $0909
        rts

L9E29:  lda     $FB
        and     #$20
        beq     L9E63
        lda     L8880
        jsr     L9E64
        sty     s88AD
        stx     s88AD+1
        sta     s88AD+2
        lda     L8880
        sec
        sbc     #$5A
        bcs     L9E49
        clc
        adc     #$B4
L9E49:  jsr     L9E64
        sty     s88B3
        stx     s88B3+1
        sta     s88B3+2
        CALLAX  DrawMessage2, m88AD
        CALLAX  DrawMessage2, m88B3
L9E63:  rts

L9E64:  ldy     #$2F
L9E66:  iny
        sec
        sbc     #$32
        bcs     L9E66
        clc
        adc     #$32
        asl     a
        ldx     #$2F
L9E72:  inx
        sec
        sbc     #$0A
        bcs     L9E72
        clc
        adc     #$3A
        rts

L9E7C:  lda     $097B
        bne     L9EBB
        lda     $FD
        and     #$08
        beq     L9EBB
        lda     L8883
        jsr     L9E64
        sty     s88B9
        stx     s88B9+1
        sta     s88B9+2
        lda     L8883
        sec
        sbc     #$5A
        bcs     L9EA1
        clc
        adc     #$B4
L9EA1:  jsr     L9E64
        sty     s88BF
        stx     s88BF+1
        sta     s88BF+2
        CALLAX  DrawMessage2, m88B9
        CALLAX  DrawMessage2, m88BF
L9EBB:  rts

L9EBC:  jsr     L9EFC
        lsr     $097E
        bcc     L9EED
        lda     $097D
        bne     L9EEE
        lda     $097F
        clc
        adc     #$30
        sta     L88E6
        lda     $0980
        ldx     #$2F
L9ED7:  inx
        sec
        sbc     #$0A
        bcs     L9ED7
        clc
        adc     #$3A
        stx     L88E4
        sta     L88E5
L9EE6:
        CALLAX  DrawMessage3, $88E2
L9EED:  rts

L9EEE:  lda     #$20
        sta     L88E4
        sta     L88E5
        sta     L88E6
        jmp     L9EE6

L9EFC:  lda     $FC
        and     #$80
        bne     L9F04
        pla
        pla
L9F04:  rts

L9F05:  jsr     L9EFC
        CALLAX  DrawMessage3, m88C5
        rts

L9F10:  LDAX    #$88F0
        ldy     $0A58
        bne     L9F23
        CALLAX  DrawMessage2, $88F7
        jmp     L9F26

L9F23:  jsr     DrawMessage3
L9F26:  jsr     L9EFC
        LDAX    #$88E8
        ldy     $0A61
        bne     L9F36
        LDAX    #$88EC
L9F36:  jmp     DrawMessage2

L9F39:  lda     $0990
        tax
        cmp     L8882
        beq     L9F6A
        stx     L8882
        txa
        lsr     a
        tax
        lda     #$30
        bcc     L9F4E
        lda     #$35
L9F4E:  sta     L88D0
        txa
        ldx     #$2F
L9F54:  inx
        sec
        sbc     #$0A
        bcs     L9F54
        clc
        adc     #$3A
        stx     L88CE
        sta     L88CF
        CALLAX  DrawMessage3, $88CC
L9F6A:  rts

L9F6B:  lda     $FB
        and     #$08
        bne     L9F72
        rts

L9F72:  lda     $5F
        sta     $0A39
        clc
        adc     $0A36
        sta     $0830
        lda     $60
        sta     $0A3A
        adc     $0A37
        sta     $0831
        clc
        lda     $0830
        adc     $099E
        sta     $C2
        lda     $0831
        adc     $099F
        sta     $C3
        lda     #$F4
        ldx     #$24
        jsr     L168F
L9FA1:  sta     L00A5
        stx     $A6
        sec
        sbc     #$70
        tay
        txa
        sbc     #$03
        bmi     L9FB3
        tax
        tya
        jmp     L9FA1

L9FB3:  lda     L00A5
        ldx     $A6
        sta     $C2
        stx     $C3
        lda     #$CC
        ldx     #$0C
        jsr     L168F
        eor     #$FF
        clc
        adc     #$16
        bpl     L9FCC
        clc
        adc     #$58
L9FCC:  sta     $29
        lda     L00A5
        ldx     $A6
L9FD2:  sec
        sbc     #$58
        bcs     L9FD2
        dex
        bpl     L9FD2
        eor     #$FF
        clc
        adc     #$BE
        bpl     L9FE4
        clc
        adc     #$58
L9FE4:  sta     $28
        jmp     L18B6

L9FE9:  lda     $FB
        and     #$01
        bne     L9FF0
        rts

L9FF0:  lda     $0A12
        cmp     #$5A
        bcc     L9FF9
        lda     #$5A
L9FF9:  pha
        lsr     a
        lsr     a
        tax
        lda     $07DF,x
        sta     $B6
        lda     $07E0,x
        sec
        sbc     $B6
        tay
        lda     $0A11
        rol     a
        pla
        rol     a
        and     #$07
        asl     a
        asl     a
        asl     a
        asl     a
        tax
        jsr     L180C
        tya
        clc
        adc     $B6
        sta     $0A33
        rts

LA021:  lda     $FB
        and     #$80
        bne     LA028
        rts

LA028:  lda     $0A15
        rol     a
        tay
        lda     $0A16
        bmi     LA03A
        cmp     #$09
        bcc     LA040
        lda     #$09
        bne     LA040
LA03A:  cmp     #$F7
        bcs     LA040
        lda     #$F7
LA040:  rol     a
        cpy     #$80
        rol     a
        eor     #$FF
        clc
        adc     #$84
LA049:  cmp     #$58
        bcc     LA051
        sbc     #$58
        bne     LA049
LA051:  sta     $2A
        rts

LA054:  lda     $FB
        and     #$02
        beq     LA08E
        lda     $09E3
        bne     LA065
        lda     $09C2
        jmp     LA070

LA065:  lda     #$00
        ldy     $0A12
        beq     LA070
        sec
        sbc     $0A65
LA070:  clc
        adc     #$7F
        lsr     a
        lsr     a
        sec
        sbc     #$1F
        bmi     LA082
        cmp     #$09
        bcc     LA088
        lda     #$08
        bne     LA088
LA082:  cmp     #$F8
        bcs     LA088
        lda     #$F8
LA088:  clc
        adc     #$09
        jmp     L1AEC

LA08E:  rts

LA08F:  brk
LA090:  brk
LA091:  .byte   $8C
LA092:  .byte   $02
        ora     ($05),y
        stx     $F807
        ora     #$57
        .byte   $0C
        .byte   $9F
        asl     $10CD
LA09F:  cpx     $12
        .byte   $DF
        .byte   $14
        cmp     ($16,x)
        .byte   $89
        clc
        and     $CF1A,y
        .byte   $1B
        lsr     a
        ora     $1EAE,x
        brk
        jsr     L000E
        ora     ($00,x)
        .byte   $02
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        ora     $00
        asl     $00
        .byte   $07
        ora     ($01,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($04,x)
        ora     ($05,x)
        ora     ($06,x)
        ora     ($07,x)
        brk
        brk
LA0D0:  lda     #$01
        ldy     L8880
        ldx     $0905
        beq     LA0EE
        pha
        lda     $0852
        ldx     $0853
        sta     $C2
        stx     $C3
        lda     #$55
        ldx     #$15
        jsr     L168F
        tay
        pla
LA0EE:  ldx     #$08
        jsr     LA0FF
        sta     $0987
        jsr     LA32D
        sta     $0982
        jmp     LA34B

LA0FF:  and     $08F4
        bne     LA109
        sta     $B7
        sta     $B6
        rts

LA109:  sty     $3F
        jsr     LA23D
        lda     $3F
        sta     $C2
        lda     #$00
        sta     $C3
        lda     #$6C
        ldx     #$01
        jsr     L1735
        ldx     $C6
        tay
        txa
        sec
        sbc     $B6
        sta     $C2
        tya
        sbc     $B7
        sta     $C3
        lda     #$1C
        ldx     #$02
        jsr     L168F
        sta     $B6
        stx     $B7
        jmp     LA2D9

LA139:  lda     #$02
        ldy     L8883
        ldx     #$00
        jsr     LA0FF
        sta     $0988
        jsr     LA32D
        sta     $0984
        rts

LA14D:  lda     $FB
        and     #$20
        beq     LA1B7
        lda     $0987
        cmp     $0989
        sta     $0989
        beq     LA17A
        lda     $0981
        pha
        jsr     LA31A
        lda     $0985
        pha
        jsr     LA205
        lda     $0987
        jsr     LA22F
        pla
        jsr     LA205
        pla
        jsr     LA31A
LA17A:  lda     $0981
        cmp     $0982
        beq     LA197
        php
        pha
        jsr     LA31A
        pla
        plp
        bpl     LA18E
        clc
        adc     #$02
LA18E:  sec
        sbc     #$01
        sta     $0981
        jsr     LA31A
LA197:  lda     $0985
        cmp     $0986
        beq     LA1B4
        php
        pha
        jsr     LA205
        pla
        plp
        bpl     LA1AB
        clc
        adc     #$02
LA1AB:  sec
        sbc     #$01
        sta     $0985
        jsr     LA205
LA1B4:  jsr     LA4A5
LA1B7:  rts

LA1B8:  lda     $FD
        and     #$08
        beq     LA204
        lda     $097B
        bne     LA204
        lda     $0988
        cmp     $098A
        sta     $098A
        beq     LA1E2
        lda     $0983
        pha
        jsr     LA316
        lda     $0988
        clc
        adc     #$03
        jsr     LA22F
        pla
        jsr     LA316
LA1E2:  lda     $097B
        bne     LA204
        lda     $0983
        cmp     $0984
        beq     LA204
        php
        pha
        jsr     LA316
        pla
        plp
        bpl     LA1FB
        clc
        adc     #$02
LA1FB:  sec
        sbc     #$01
        sta     $0983
        jsr     LA316
LA204:  rts

LA205:  tax
        bmi     LA22E
        clc
        adc     #$76
        tax
        lda     HiresTableHi,x
        sta     $B7
        clc
        adc     $8D
        sta     $3F
        lda     HiresTableLo,x
        sta     $B6
        sta     $3E
        ldy     #$17
        jsr     LA225
        jsr     LA225
LA225:  iny
        lda     #$7F
        eor     ($B6),y
        sta     ($B6),y
        sta     ($3E),y
LA22E:  rts

LA22F:  asl     a
        asl     a
        asl     a
        ldx     #$88
        clc
        adc     #$FE
        bcc     LA23A
        inx
LA23A:  jmp     DrawMessage2

LA23D:  lda     $63
        sec
        sbc     $08FE,x
        tay
        lda     $64
        sbc     $08FF,x
        sta     $BE
        lda     $65
        sbc     $0900,x
        stx     $C0
        ldx     $BE
        jsr     LA2C6
        sta     $098D
        stx     $098C
        sta     $BB
        stx     $BA
        sty     $B7
        ldx     $C0
        lda     $5B
        sec
        sbc     $08FA,x
        tay
        lda     $5C
        sbc     $08FB,x
        sta     $BE
        lda     $5D
        sbc     $08FC,x
        ldx     $BE
        jsr     LA2C6
        sta     $098F
        stx     $098E
        sta     $B9
        stx     $B8
        sty     $BD
LA289:  lda     $BB
        clc
        adc     #$10
        cmp     #$21
        bcs     LA2AB
        lda     $B9
        clc
        adc     #$10
        cmp     #$21
        bcs     LA2AB
        sec
        rol     $B7
        rol     $BA
        rol     $BB
        asl     $BD
        rol     $B8
        rol     $B9
        jmp     LA289

LA2AB:  jsr     LA3EF
        sec
        sbc     $0848
        tay
        txa
        sbc     $0849
        tax
        tya
        sec
        sbc     $0846
        sta     $B6
        txa
        sbc     $0847
        sta     $B7
        rts

LA2C6:  jsr     LA2CF
        jsr     LA2CF
        jsr     LA2CF
LA2CF:  pha
        tya
        asl     a
        tay
        txa
        rol     a
        tax
        pla
        rol     a
        rts

LA2D9:  inx
        dex
        bmi     LA2E9
        cpx     #$01
        bcc     LA30C
        bne     LA2F5
        cmp     #$2C
        bcc     LA30F
        bcs     LA2F5
LA2E9:  .byte   $E0
LA2EA:  inc     $0E90,x
        bne     LA30C
        cmp     #$D4
        bcc     LA2FB
        bcs     LA30F
LA2F5:  lda     #$1C
        ldx     #$02
        bne     LA2FF
LA2FB:  lda     #$E4
        ldx     #$FD
LA2FF:  sec
        sbc     $B6
        sta     $B6
        txa
        sbc     $B7
        sta     $B7
        lda     #$01
        rts

LA30C:  lda     #$02
        rts

LA30F:  lda     #$00
        sta     $B7
        sta     $B6
        rts

LA316:  ldy     #$A1
        bne     LA31C
LA31A:  ldy     #$76
LA31C:  tax
        bmi     LA32C
        clc
        adc     #$A5
        tax
        lda     #$B1
        sta     $9C
        lda     #$A0
        jmp     L1A6E

LA32C:  rts

LA32D:  lda     $B6
        ldx     $B7
        bmi     LA33D
        bne     LA339
        cmp     #$1E
        bcc     LA346
LA339:  lda     #$1E
        bne     LA346
LA33D:  inx
        bne     LA344
        cmp     #$E2
        bcs     LA346
LA344:  lda     #$E2
LA346:  clc
        adc     #$1E
        lsr     a
        rts

LA34B:  lda     $0850
        beq     LA3A5
        ldx     $0851
        sta     $9E
        stx     $9F
        lsr     $9F
        ror     $9E
        jsr     LA4D2
        lda     $0A3A
        lsr     a
        tax
        lda     $0A39
        ror     a
        cpx     $BF
        bcc     LA375
        bne     LA371
        cmp     $BE
        bcc     LA375
LA371:  ldy     #$12
        bne     LA3A2
LA375:  sta     $98
        lda     $BE
        sta     $C4
        lda     $BF
        sta     $C5
        txa
        ldx     $98
        jsr     L16A2
        lda     $C2
        sec
        sbc     $9E
        tax
        lda     $C3
        sbc     $9F
        clc
        adc     #$12
        cmp     #$24
        bcc     LA39E
        ldy     #$24
        and     #$FF
        bpl     LA39F
        lda     #$00
LA39E:  tay
LA39F:  tya
        lsr     a
        tay
LA3A2:  sty     $0986
LA3A5:  ldy     #$00
        sty     $0850
        sty     $0851
        lda     $08F4
        ror     a
        bcs     LA3BA
        lda     #$01
        sta     $097D
        bne     LA3E9
LA3BA:  lda     #$00
        sta     $097D
        jsr     LA4D2
        lda     $BE
        ldx     $BF
        sta     $C2
        stx     $C3
        lda     #$1B
        ldx     #$01
        jsr     L1735
        asl     a
        tay
        txa
        rol     a
        sta     $0980
        tya
        lsr     a
        tay
        ldx     #$14
        jsr     L180C
        tya
        cmp     $097F
        sta     $097F
        beq     LA3EE
LA3E9:  lda     #$01
        sta     $097E
LA3EE:  rts

LA3EF:  lda     $B9
        bpl     LA3FE
        ldx     #$B8
        jsr     LA497
        jsr     LA3FE
        jmp     L1880

LA3FE:  lda     $BB
        bpl     LA414
        ldx     #$BA
        jsr     LA497
        jsr     LA414
        jsr     L1880
        tay
        txa
        eor     #$80
        tax
        tya
        rts

LA414:  lda     $B8
        ldx     $B9
        cpx     $BB
        bcc     LA448
        bne     LA42A
        cmp     $BA
        bcc     LA448
        bne     LA42A
        inc     $B8
        bne     LA42A
        inc     $B9
LA42A:  lda     $B8
        ldx     $BA
        sta     $BA
        stx     $B8
        lda     $B9
        ldx     $BB
        sta     $BB
        stx     $B9
        jsr     LA448
        jsr     L1880
        tay
        txa
        clc
        adc     #$40
        tax
        tya
        rts

LA448:  lda     $BA
        ldx     $BB
        sta     $C4
        stx     $C5
        lda     $B9
        ldx     $B8
        jsr     L16A2
        lda     $C3
        lsr     a
        lsr     a
        and     #$FE
        tay
        lda     $C2
        lsr     a
        lsr     a
        lsr     a
        sta     $C2
        lda     $C3
        asl     a
        asl     a
        asl     a
        asl     a
        and     #$60
        clc
        adc     $C2
        sta     $C3
        lda     LA08F,y
        sta     $BE
        sec
        sbc     LA091,y
        pha
        lda     LA090,y
        sta     $BF
        sbc     LA092,y
        tax
        pla
        jsr     L168F
        sec
        sbc     $BE
        eor     #$FF
        tay
        txa
        sbc     $BF
        eor     #$FF
        tax
        tya
LA496:  rts

LA497:  lda     #$00
        sec
        sbc     $00,x
        sta     $00,x
        lda     #$00
        sbc     $01,x
        sta     $01,x
        rts

LA4A5:  lda     #$00
        lsr     $084E
        rol     a
        lsr     $084C
        rol     a
        cmp     $098B
        sta     $098B
        beq     LA496
        ldx     #$30
        lsr     a
        bcc     LA4BE
        ldx     #$58
LA4BE:  stx     L8930
        ldx     #$30
        lsr     a
        bcc     LA4C8
        ldx     #$58
LA4C8:  stx     L8931
        JUMPAX  DrawMessage2, $892E

LA4D2:  lda     $098C
        ldx     $098D
        bpl     LA4DD
        jsr     L1880
LA4DD:  sta     $BE
        stx     $BF
        lda     $098E
        ldx     $098F
        bpl     LA4EC
        jsr     L1880
LA4EC:  cpx     $BF
        bcc     LA4F6
        bne     LA500
        cmp     $BE
        bcs     LA500
LA4F6:  tay
        lda     $BF
        stx     $BF
        tax
        lda     $BE
        sty     $BE
LA500:  sta     $C0
        stx     $C1
        asl     a
        sta     $C4
        txa
        rol     a
        sta     $C5
        ldx     $BE
        lda     $BF
        jsr     L16A2
        lda     $BE
        ldx     $BF
        jsr     L168F
        clc
        adc     $C0
        sta     $BE
        txa
        adc     $C1
        sta     $BF
        rts

LA524:  lda     $0940
        clc
        adc     #$09
        sta     $C2
        lda     $0941
        adc     #$00
        sta     $C3
        lda     #$0C
        ldx     #$4E
        jsr     L1735
        txa
        sec
        sbc     $0A36
        tay
        lda     $C9
        sbc     $0A37
        bmi     LA54D
        bne     LA551
        cpy     #$03
        bcs     LA551
LA54D:  lda     #$00
        ldy     #$03
LA551:  sty     $5F
        sta     $60
        lda     #$00
        sta     $61
        rts

LA55A:  lda     $0A6F
        lsr     a
        tay
        ldx     $0997
        lda     $0998
        bne     LA56A
        ldx     $0994
LA56A:  dex
        bpl     LA56F
        ldy     #$00
LA56F:  sty     $0990
        tya
        asl     a
        sta     $C3
        lda     #$00
        sta     $C2
        lda     #$20
        ldx     #$03
        jsr     L1696
        lda     $09A9
        ldx     $09AA
        jsr     L168F
        sta     $0A0D
        stx     $0A0E
        lda     $0938
        bne     LA59E
        lda     $0990
        cmp     #$0D
        bcs     LA59E
        lda     #$0D
LA59E:  sta     $0990
        lda     $31
        and     #$1F
        bne     LA5D8
        ldx     #$F2
        ldy     $0A6F
        jsr     L180C
        sta     L00A5
        sty     $A6
        ldx     #$00
        lda     $0998
        beq     LA5BC
        ldx     #$03
LA5BC:  lda     L00A5
        clc
        adc     $0992,x
        sta     $0992,x
        tya
        bpl     LA5D8
        adc     $0993,x
        sta     $0993,x
        lda     #$FF
        adc     $0994,x
        bmi     LA5D8
        sta     $0994,x
LA5D8:  lda     #$05
        sta     $099C
        sta     $099D
        rts

LA5E1:  ldx     #$01
        lda     $0954
        cmp     #$05
        bcc     LA5F6
        cmp     #$06
        bcc     LA5FA
        cmp     #$13
        bcc     LA5FC
        cmp     #$14
        bcc     LA5FA
LA5F6:  ldx     #$04
        bne     LA5FC
LA5FA:  ldx     #$02
LA5FC:  stx     $083C
        ldx     $0956
        lda     #$01
LA604:  sta     $0884
        asl     a
        dex
        bne     LA604
        rts

LA60C:  nop
        nop
        rts

LA60F:  .byte   $22
LA610:  .byte   $03
LA611:  .byte   $25
LA612:  .byte   $06
LA613:  .byte   $2D
LA614:  .byte   $03
LA615:  .byte   $2B
LA616:  .byte   $01
LA617:  .byte   $42
LA618:  .byte   $01
LA619:  .byte   $2C
LA61A:  .byte   $01
LA61B:  lda     LA7E0
        ldx     LA7E1
        sta     $8B
        stx     $8C
        lda     $1E0E
        beq     LA639
        lda     $5F
        bmi     LA632
        lda     $2B
        bpl     LA639
LA632:  nop
        jsr     ClearViewportsToBlack
        jmp     LA632

LA639:  rts

LA63A:  ldx     $08E9
        lda     $08E5
        cmp     $08EA,x
        beq     LA66A
        sta     $08EA,x
        sta     $9E
        lda     #$00
LA64C:  inx
        cpx     #$04
        bcs     LA656
        sta     $08EA,x
        bcc     LA64C
LA656:  lda     $08E6
        sta     $9F
        lda     $08E7
        ldx     $08E8
        sta     $1E03
        stx     $1E04
        jsr     LA6CD
LA66A:  rts

LA66B:  lda     LA60F
        ldx     LA610
        jmp     LA698

LA674:  lda     LA611
        ldx     LA612
        jmp     LA698

LA67D:  lda     LA613
        ldx     LA614
        jmp     LA698

LA686:  lda     LA615
        ldx     LA616
        jmp     LA698

LA68F:  lda     LA617
        ldx     LA618
        jmp     LA698

LA698:  sta     $9E
        stx     $9F
        lda     #$E0
        sta     $1E03
        lda     #$A7
        sta     $1E04
        jsr     LA6CD
        lda     #$00
        sta     $08EA
        sta     $08EB
        sta     $08EC
        sta     $08ED
        lda     LA619
        ldx     LA61A
        sta     $9E
        stx     $9F
        lda     LA7E0
        ldx     LA7E1
        sta     $1E03
        stx     $1E04
LA6CD:  lda     $C055
LA6D0:  lda     $9E
        sta     $1E01
        jsr     L1EC4
        bcs     LA6F3
        lda     #$01
        sta     $08A3
LA6DF:  jsr     L1EAD
        bcs     LA6F3
        dec     $9F
        bne     LA6DF
        jsr     LA6F9
        bcs     LA6F3
        lda     #$00
        sta     $08A3
        rts

LA6F3:  lda     $1E01
        jmp     L1F89

LA6F9:  jsr     L1EBC
        bcs     LA6F3
        lda     #$00
        sta     L00A5
        lda     #$40
        sta     $A6
        lda     #$00
        sta     $A7
        lda     #$20
        sta     $A8
        ldx     #$20
        ldy     #$00
LA712:  lda     (L00A5),y
        sta     ($A7),y
        iny
        bne     LA712
        inc     $A6
        inc     $A8
        dex
        bne     LA712
        lda     $0A41
        sta     $0A40
        clc
        rts

        tax
        sta     $B5C1
        lda     L9D06
        sta     $B5C3
        lda     L9D07
        sta     $B5C4
        lda     $40
        sta     LAA4F
        lda     $41
        sta     LAA50
        rts

        ldy     #$1D
LA745:  lda     LAA75,y
        sta     ($40),y
        dey
        bpl     LA745
        rts

        ldy     #$1E
LA750:  lda     ($40),y
        sta     $B5A9,y
        iny
        cpy     #$26
        bne     LA750
        rts

        ldy     #$00
        sty     LAA51
        sty     LAA52
        rts

        lda     #$00
        .byte   $85
LA767:  eor     $20
        .byte   $92
        .byte   $A7
        jmp     LA773

LA76E:  jsr     LA79A
        beq     LA790
LA773:  jsr     LA7AA
        bne     LA782
        lda     $40
        sta     $44
        lda     $41
        sta     $45
        bne     LA76E
LA782:  ldy     #$1D
LA784:  lda     ($40),y
        cmp     LAA75,y
        bne     LA76E
        dey
        bpl     LA784
        clc
        rts

LA790:  sec
        rts

        lda     L9D00
        ldx     L9D01
        bne     LA7A4
LA79A:  ldy     #$25
        lda     ($40),y
        beq     LA7A9
        tax
        dey
        lda     ($40),y
LA7A4:  stx     $41
        sta     $40
        txa
LA7A9:  rts

LA7AA:  ldy     #$00
        lda     ($40),y
        rts

        lda     LAAB3
        beq     LA7C2
        lda     LAAB4
        cmp     $40
        bne     LA7C3
        lda     LAAB5
        cmp     $41
        beq     LA7C3
LA7C2:  dex
LA7C3:  rts

        eor     $B5C2
        beq     LA7D3
        and     #$7F
        beq     LA7D3
        jsr     LA2EA
        jmp     LA6D0

LA7D3:  rts

        sec
        lda     L9D00
        sta     $40
        lda     L9D01
        .byte   $DF
        .byte   $A7
        .byte   $41
LA7E0:  brk
LA7E1:  .byte   $B0
        jmp     LAB91
        jmp     LAB91

LA7E8:  jsr     LA674
        brk
        brk
        brk
LA7EE:  jsr     LA67D
        brk
        brk
        brk
LA7F4:  jsr     LA686
        brk
        brk
        brk
        jsr     LA68F
        brk
        brk
        brk

        ;; This memory is re-used after the simulation starts
LA800   := $A800
LA802   := $A802
LA803   := $A803
LA804   := $A804
LA805   := $A805
LA806   := $A806
LA807   := $A807
LA808   := $A808
LA809   := $A809
LA80A   := $A80A
LA80B   := $A80B
LA80C   := $A80C
LA80D   := $A80D

        ;; Also this, but less certain
LA95B   := $A95B
LA95C   := $A95C
LA95D   := $A95D
LA95E   := $A95E
LA95F   := $A95F
LA960   := $A960
LA961   := $A961
LA962   := $A962
LA963   := $A963

LAA4F   := $AA4F
LAA50   := $AA50
LAA51   := $AA51
LAA52   := $AA52

LAA75   := $AA75

LAAB3   := $AAB3
LAAB4   := $AAB4
LAAB5   := $AAB5

        .assert * = $A800, error, "location mismatch"

msg_intro:
        MESSAGE $0C, $0D, "SUBLOGIC FLIGHT SIMULATOR II"
        MESSAGE $14, $2D, "VERSION 2.0"
        MESSAGE $1C, $08, "COPYRIGHT 1984 BY BRUCE ARTWICK"
        MESSAGE $24, $07, "PRODUCED BY SUBLOGIC CORPORATION"
        MESSAGE $32, $0A, "WHAT DISPLAY ARE YOU USING?"
        MESSAGE $3C, $0A, "A. COLOR TV OR COMPOSITE MONITOR"
        MESSAGE $44, $0A, "B. BLACK AND WHITE TV OR MONITOR"
        MESSAGE $58, $0A, "(TYPE A OR B)"
        .byte   0, 0

msg_select_mode:
        MESSAGE $28, $0A, "SELECT OPERATING MODE"
        MESSAGE $30, $0A, "A. DEMO MODE"
        MESSAGE $38, $0A, "B. REGULAR FLIGHT MODE"
        MESSAGE $4C, $0A, "(TYPE A OR B)"
        .byte   0, 0

msg_lowercase:
        MESSAGE $0C, $0A, "A LOWER CASE CHARACTER WAS TYPED."
        MESSAGE $14, $0A, "IF YOU ARE USING AN APPLE IIE"
        MESSAGE $1C, $0A, "MAKE SURE THE CAPS LOCK KEY"
        MESSAGE $24, $0A, "IS PRESSED."

        MESSAGE $32, $0A, "WHAT DISPLAY ARE YOU USING?"
        MESSAGE $3C, $0A, "A. COLOR TV OR COMPOSITE MONITOR"
        MESSAGE $44, $0A, "B. BLACK AND WHITE TV OR MONITOR"
        MESSAGE $58, $0A, "(TYPE A OR B)"
        .byte   0, 0

msg_demo:
        MESSAGE $0C, $0A, "DEMO RUNS CONTINUOUSLY. PRESS"
        MESSAGE $14, $0A, "THE K KEY TO BREAK OUT OF DEMO"
        MESSAGE $1C, $0A, "AND RESUME NORMAL FLIGHT."
        MESSAGE $32, $0A, "PRESS ANY KEY TO CONTINUE....."
        .byte   0, 0

msg_48k_demo:
        MESSAGE $0C, $0A, "SIMPLE 48K DEMO ACTIVATED. THE"
        MESSAGE $14, $0A, "AIRCRAFT WILL TAKE OFF AND FLY"
        MESSAGE $1C, $0A, "STRAIGHT ONLY. A BETTER DEMO IS"
        MESSAGE $24, $0A, "AVAILABLE WITH 64K. PRESS"
        MESSAGE $2C, $0A, "THE K KEY TO BREAK OUT OF DEMO."
        MESSAGE $3C, $0A, "PRESS ANY KEY TO CONTINUE....."
        .byte   0, 0

        .byte   $BB
        .byte   $BB
        .byte   $77
        .byte   $77
        ora     ($11),y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $22
        .byte   $22
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $22
        .byte   $22
        ora     ($11),y
        .byte   $FF
        .byte   $FF
        ora     ($11),y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        ora     ($11),y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
LAB91:  nop
        ldx     #$3F
        txs
        jsr     L1EC4
        bcs     LABB4
        jsr     LABEC
        bcs     LABB4
        jsr     LAD15
        bcs     LABB4
        jsr     LAE0F
        bcs     LABB4
        jsr     LA6F9
        bcs     LABB4

.assert * = $ABAE, error, "mismatch"

;;; Per @qkumba, this is entry point after all chunks are loaded
        jsr     LAE9F
        jmp     LABBA

LABB4:  lda     $1E01
        jmp     L1F89

LABBA:  jsr     LAE44
        jsr     LAD32
        jsr     LAC3A
        jsr     LACBA
        jsr     LAEAA
        jmp     L877F

LABCC:  brk
        bcs     LAC1B
        sta     ($AB),y
        jmp     LAB91

        jsr     LA674
        brk
        brk
        brk
        jsr     LA67D
        brk
        brk
        brk
        jsr     LA686
        brk
        brk
        brk
        jsr     LA68F
        brk
        brk
        brk
LABEC:  ldx     #$1F
LABEE:  lda     LA7E0,x
        sta     LABCC,x
        dex
        bpl     LABEE
        lda     #$00
        sta     $1E03
        lda     #$02
        sta     $1E04
        lda     #$00
        sta     $1E01
LAC06:  jsr     L1EAD
        bcs     LAC39
        lda     $1E01
        cmp     #$07
        bcc     LAC06
        lda     #$00
        sta     $1E03
        lda     #$60
        .byte   $8D
        .byte   $04
LAC1B:  asl     $08A9,x
        sta     $1E01
LAC21:  jsr     L1EAD
        bcs     LAC39
        lda     $1E01
        cmp     #$1A
        bcc     LAC21
        ldx     #$1F
LAC2F:  lda     LABCC,x
        sta     LA7E0,x
        dex
        bpl     LAC2F
        clc
LAC39:  rts

LAC3A:  jsr     ClearViewportsToBlack
        CALLAX  DrawMessage4, msg_intro
LAC44:  jsr     L89D0
        cmp     #'a'
        beq     LAC59
        cmp     #'b'
        beq     LAC59
        cmp     #'A'
        beq     LAC66
        cmp     #'B'
        beq     LAC6D
        bne     LAC44
LAC59:  jsr     ClearViewportsToBlack
        CALLAX  DrawMessage4, msg_lowercase
        jmp     LAC44

LAC66:  lda     #$65
        ldx     #$AB
        jmp     LAC71

LAC6D:  lda     #$7B
        ldx     #$AB
LAC71:  ldy     #$00
        sta     $BE
        stx     $BF
LAC77:  lda     ($BE),y
        sta     $0800,y
        iny
        cpy     #$16
        bne     LAC77
        jsr     ClearViewportsToBlack
        CALLAX  DrawMessage4, msg_select_mode
LAC8B:  jsr     L89D0
        cmp     #$41
        beq     LAC98
        cmp     #$42
        beq     LACB4
        bne     LAC8B
LAC98:  inc     $092C
        jsr     ClearViewportsToBlack
        CALLAX  DrawMessage4, msg_demo
        lda     $08C6
        bne     LACB1
        CALLAX  DrawMessage4, msg_48k_demo
LACB1:  jsr     L89D0
LACB4:  lda     #$00
        sta     $08A6
        rts

LACBA:  lda     #$01
        sta     $08BE
        lda     $0A33
        jsr     L18CB
        lda     $2A
        jsr     L1907
        lda     #$00
        jsr     L192D
        lda     #$0A
        jsr     L1A45
        lda     #$0F
        jsr     L1A5F
        lda     #$0F
        jsr     L1A80
        lda     #$00
        jsr     L1A94
        lda     #$00
        jsr     L1AB4
        lda     #$05
        jsr     L1AC7
        lda     #$00
        jsr     L1ADA
        lda     #$00
        jsr     L1AFA
        lda     #$00
        jsr     L1B1E
        lda     #$00
        jsr     L1B38
        lda     #$00
        jsr     L1B67
        lda     #$00
        jsr     L1B80
        jsr     L9E29
        .byte   $20
LAD0F:  .byte   $7C
        .byte   $9E
        jsr     L8933
        rts

LAD15:  lda     #$00
        sta     $1E03
        lda     #$40
        sta     $1E04
        lda     #$1A
        sta     $1E01
LAD24:  jsr     L1EAD
        bcs     LAD31
        lda     $1E01
        cmp     #$22
        bcc     LAD24
        clc
LAD31:  rts

LAD32:  lda     $C050
        lda     $C052
        lda     $C057
        lda     $C054
        ldy     #$00
        ldx     #$BF
LAD42:  lda     HiresTableLo,x
        sta     $B8
        sta     $C0
        lda     HiresTableHi,x
        sta     $B9
        clc
        adc     #$20
        cmp     #$60
        bcc     LAD58
        sec
        sbc     #$40
LAD58:  sta     $C1
        lda     ($B8),y
        and     #$7F
        sta     ($B8),y
        sta     ($C0),y
        dex
        cpx     #$63
        bne     LAD42
LAD67:  rts

LAD68:  .byte   $C3
        .byte   $8F
        jmp     LDB99

        .byte   $27
        dey
        jsr     LDC3D
        and     ($60,x)
        jmp     LDB48

        eor     ($88),y
        jsr     LD9F1
        ora     ($8D,x)
        jsr     LDBB1
        .byte   $27
        stx     $E320
        .byte   $DB
        beq     LAD0F
        jsr     LDF65
        .byte   $3C
        dey
        jsr     LF97A
        eor     $88
        jsr     LDC59
        sbc     $87
        jsr     LDD7A
        .byte   $5A
        lda     $4C
        .byte   $9F
        cpx     #$36
        .byte   $9F
        jmp     LE2D1

        dec     $8C
        jmp     LE2B3

        .byte   $FC
        bcc     LADF8
        inc     $E2
        ora     $91
        jmp     LE2FA

        sbc     $2087,y
        sbc     LADE5
        asl     $D04C,x
        .byte   $D3
        bcs     LADDD
        jmp     LD3D3

        .byte   $B3
        asl     $D64C,x
        .byte   $D3
        ldx     $1E,y
        jmp     LD3D9

        lda     $4C1E,y
        .byte   $DC
        .byte   $D3
        ldy     $4C1E,x
        .byte   $DF
        .byte   $D3
        cmp     ($1E,x)
        jmp     LD3E2

        .byte   $9B
        .byte   $90
LADDD:  jmp     LF71C

        .byte   $C7
        .byte   $87
        jsr     LF7E2
LADE5:  .byte   $73
        .byte   $9C
        jsr     LDD50
        .byte   $0C
        ldx     $4C
        cmp     $26E4,x
        rts

        jmp     LE40E

        sbc     (L00A5,x)
        .byte   $4C
        .byte   $72
LADF8:  dec     L87A5,x
        jsr     LF9B5
        ora     $88,x
        jsr     LFA56
        ora     ($88,x)
        jsr     LFAEC
        ldx     $2087,y
        .byte   $FC
        cmp     a:$00,x
LAE0F:  lda     $C083
        lda     $C083
        ldx     #$00
LAE17:  stx     $D000
        cpx     $D000
        bne     LAE9E
        dex
        bne     LAE17
        lda     #$00
        sta     $1E03
        lda     #$D0
        sta     $1E04
        lda     #$00
        sta     $1E01
        jsr     L1EB3
        bcs     LAE43
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        lda     #$01
        sta     $08C6
        clc
LAE43:  rts

LAE44:  lda     $08C6
        beq     LAE9E
        ldx     #$00
LAE4B:  ldy     #$00
        lda     LAD68,x
        inx
        sta     L00A5
        lda     LAD68,x
        inx
        sta     $A6
        ora     L00A5
        beq     LAE74
        lda     LAD68,x
        inx
        sta     (L00A5),y
        iny
        lda     LAD68,x
        inx
        sta     (L00A5),y
        iny
        lda     LAD68,x
        inx
        sta     (L00A5),y
        jmp     LAE4B

LAE74:  lda     #$00
        ldx     #$D0
        sta     $0932
        stx     $0933
        lda     #$19
        sta     $0931
        lda     #$01
        sta     $1E07
        lda     #$E2
        ldx     #$A7
        sta     $FFFA
        stx     $FFFB
        sta     $FFFC
        stx     $FFFD
        sta     $FFFE
        stx     $FFFF
LAE9E:  rts

LAE9F:  ldx     #$00
LAEA1:  lda     LAF00,x
        sta     $00,x
        inx
        bne     LAEA1
        rts

LAEAA:  lda     $0932
        ldx     $0933
        sta     $B8
        stx     $B9
        lda     #$0A
LAEB6:  ldy     #$40
LAEB8:  sta     ($B8),y
        dey
        bpl     LAEB8
        clc
        adc     #$01
        pha
        lda     $B8
        clc
        adc     #$41
        sta     $B8
        bcc     LAECC
        inc     $B9
LAECC:  pla
        cmp     $0931
        bne     LAEB6
        rts

        tay
        jsr     DrawMessage4
        lda     $0A72
        cmp     #$01
        bne     LAEF4
        lda     #$03
        sta     $0A72
        CALLAX  DrawMessage4, $A83B ; In middle of another MESSAGE ???
        ldx     #$00
        ldy     #$00
LAEEE:  inx
        bne     LAEEE
        iny
        bne     LAEEE
LAEF4:  rts

        lda     $0A60
        beq     LAF39
        dec     $0A60
        jsr     LB025
LAF00:  jmp     L003C

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        plp
        brk
        eor     $2A,x
        brk
        brk
        brk
        ora     ($22),y
        .byte   $4F
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $9E
        .byte   $81
LAF39:  .byte   $9E
        tax
        eor     #$00
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        and     L6000
        brk
        rol     $2E,x
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        asl     $56
        brk
        cli
        .byte   $AF
        brk
        brk
        .byte   $1F
        ora     ($00,x)
        .byte   $03
        brk
        brk
        brk
        brk
        bit     $03
        brk
        inc     $1000,x
        brk
        inc     a:$00,x
        brk
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
        inc     a:$08,x
        .byte   $FF
        brk
        php
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
        brk
        brk
        brk
        .byte   $FF
        jsr     L0300
        jmp     LE646

        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     #$01
        brk
        brk
        brk
        brk
        .byte   $02
        .byte   $AB
        jsr     LE22C
        and     ($55),y
        and     $11,x
        ora     #$15
        brk
LAFB1:  brk
        brk
        brk
LAFB4:  brk
        brk
        .byte   $02
        brk
        eor     $FC,x
LAFBA:  cmp     #$3A
        bcs     LAFC8
        cmp     #$20
LAFC0:  beq     LAFB1
        sec
        sbc     #$30
        sec
        sbc     #$D0
LAFC8:  rts

        .byte   $80
LAFCA:  brk
LAFCB:  .byte   $C7
        .byte   $52
        .byte   $FF
        brk
        brk
        .byte   $FF
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        .byte   $FF
        brk
        brk
        brk
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        .byte   $FF
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
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
        brk
        brk
        adc     $C908,y
        inx
        lda     $08C1
        sbc     #$03
        bcc     LB013
        lda     #$00
        sta     $08C0
        sta     $08C1
LB013:  lda     $08C0
        ldx     $08C1
        sta     $B6
        stx     $B7
        lda     #$DF
        ldx     #$08
        jsr     L8773
        rts

LB025:  lda     $0A54
        sec
        sbc     #$01
        sta     $0A54
        bcs     LB042
        lda     $0A55
        sbc     #$00
        sta     $0A55
        bcs     LB042
        lda     #$00
        sta     $0A54
        sta     $0A55
LB042:  lda     $0A54
        ldx     $0A55
        sta     $B6
        stx     $B7
        lda     #$7B
        ldx     #$A8
        jsr     L8773
        rts

        lda     LA802
        ldx     LA803
        sta     $098C
        stx     $098D
        lda     LA805
        ldx     LA806
        sta     $098E
        stx     $098F
        jsr     L8770
        lda     $BE
        ldx     $BF
        sta     $098C
        stx     $098D
        lda     LA808
        ldx     LA809
        sta     $098E
        stx     $098F
        jsr     L8770
        lda     LA804
        eor     LA807
        eor     LA80A
        beq     LB09A
        tay
        iny
        tya
        beq     LB09A
        lda     #$7F
LB09A:  sta     LA80D
        lda     $BE
        ldx     $BF
        sta     LA80B
        stx     LA80C
        ldx     LA800
        rts

        ldy     #$6B
        sty     $B6
LB0AF:  lda     HiresTableHi,y
        sta     $A6
        lda     HiresTableLo,y
        sta     L00A5
        ldy     #$1D
        lda     #$82
        sta     (L00A5),y
        lda     #$80
LB0C1:  iny
        cpy     #$28
        bcs     LB0CA
        sta     (L00A5),y
        bcc     LB0C1
LB0CA:  inc     $B6
        ldy     $B6
        cpy     #$9B
        bcc     LB0AF
        lda     #$BE
        sta     $3472
        sta     $5472
        lda     #$88
        sta     $3072
        sta     $3872
        sta     $3C72
        sta     $5072
        sta     $5872
        sta     $5C72
        rts

        ldy     #$01
        sec
        lda     (L00A5),y
        sbc     LA95B,x
        sta     LA802
        iny
        lda     (L00A5),y
        sbc     LA95C,x
        sta     LA803
        iny
        lda     (L00A5),y
        sbc     LA95D,x
        sta     LA804
        iny
        iny
        sec
        lda     (L00A5),y
        sbc     LA95E,x
        sta     LA805
        iny
        lda     (L00A5),y
        sbc     LA95F,x
        sta     LA806
        iny
        lda     (L00A5),y
LB123:  sbc     LA960,x
        sta     LA807
        iny
        iny
        sec
        lda     (L00A5),y
        sbc     LA961,x
        sta     LA808
        iny
        lda     (L00A5),y
        sbc     LA962,x
        sta     LA809
        iny
        lda     (L00A5),y
        sbc     LA963,x
        sta     LA80A
        iny
        rts

        lda     $FC
        and     #$7F
        sta     $FC
        .byte   $AD
        sei
LB150:  ora     #$29
        .byte   $7F
        sta     $0978
        ldy     #$65
        sty     $B6
LB15A:  lda     HiresTableHi,y
        sta     $A6
        clc
        adc     $8D
        sta     $A8
        lda     HiresTableLo,y
        sta     L00A5
        sta     $A7
        ldy     #$1D
        lda     #$83
        and     (L00A5),y
        sta     (L00A5),y
        sta     ($A7),y
        lda     #$80
LB177:  iny
        cpy     #$28
        bcs     LB182
        sta     (L00A5),y
        sta     ($A7),y
        bcc     LB177
LB182:  inc     $B6
        ldy     $B6
        cpy     #$A1
        bcc     LB15A
        rts

        ldy     $08A4
        lda     $0898
        cmp     #$04
        lda     #$00
        bcs     LB1AD
        cpy     #$3C
        bcs     LB1BB
        cpy     #$28
        bcs     LB1BE
        cpy     #$23
        bcs     LB1C0
        cpy     #$14
        bcs     LB1C2
        cpy     #$07
        bcs     LB1CA
        bcc     LB1D0
LB1AD:  cpy     #$14
        bcs     LB1BB
        cpy     #$07
        bcs     LB1BE
        cpy     #$01
        bcs     LB1C2
        bcc     LB1D0
LB1BB:  inc     $08C3
LB1BE:  ora     #$01
LB1C0:  ora     #$02
LB1C2:  ldy     $2B
        cpy     #$3F
        bcs     LB1CA
        ora     #$08
LB1CA:  .byte   $A4
LB1CB:  .byte   $2B
        cpy     #$3F
        ora     #$04
LB1D0:  ora     $0991
        sta     $0991
        rts

        adc     $B920,y
        asl     $EEB0,x
        jsr     LB238
        jsr     L1EB0
        bcs     LB1CB
        bit     $1FBD
        lda     #$00
        sta     $1E0E
        jmp     LB1F4

        cmp     #$30
        bcs     LB1F7
LB1F4:  jmp     LB150

LB1F7:  cmp     #$3A
        bcs     LB1F4
        ldy     $092A
        cpy     #$0B
        beq     LB1F4
        inc     $0921
        sta     $AF
        lda     $0923
        bne     LB217
        ldy     #$0C
        lda     #$A0
LB210:  sta     ($3E),y
        dey
        cpy     #$04
        bne     LB210
LB217:  ldx     #$04
LB219:  lda     $0924,x
        sta     $0925,x
        dex
        bpl     LB219
        lda     $AF
        sta     $0924
        inc     $0923
        ldy     $092A
        ora     #$80
        sta     ($3E),y
        iny
        sty     $092A
        jmp     LB1F4

LB238:  lda     $0932
        ldx     $0933
        sta     $1E03
        stx     $1E04
        lda     #$40
        sta     $1E01
        rts

        ldx     #$00
        stx     $091C
        stx     $091D
        stx     $091E
LB255:  lda     $0924,x
        and     #$7F
        sec
        sbc     #$30
        tay
        beq     LB27F
        clc
LB261:  lda     LAFB4,x
        adc     $091C
        sta     $091C
        lda     LAFBA,x
        adc     $091D
        sta     $091D
        lda     LAFC0,x
        adc     $091E
        sta     $091E
        dey
        bne     LB261
LB27F:  inx
        cpx     #$06
        bne     LB255
        rts

LB285:  jsr     LB123
        lda     #$00
        sta     $0922
        lda     #$05
        sta     $092A
        ldy     #$05
        lda     #$A0
LB296:  sta     ($3E),y
        iny
        cpy     #$0B
        bne     LB296
        ldx     #$05
LB29F:  lda     #$30
        sta     $092D
LB2A4:  lda     $091C
        sec
        sbc     LAFB4,x
        sta     $092E
        lda     $091D
        sbc     LAFBA,x
        sta     $092F
        lda     $091E
        sbc     LAFC0,x
        bmi     LB2D3
        sta     $091E
        lda     $092F
        sta     $091D
        lda     $092E
        sta     $091C
        inc     $092D
        bne     LB2A4
LB2D3:  lda     $092D
        cpx     #$00
        beq     LB2E3
        cmp     #$30
        bne     LB2E3
        lda     $0922
        beq     LB2F3
LB2E3:  inc     $0922
        ldy     $092A
        lda     $092D
        ora     #$80
        sta     ($3E),y
        inc     $092A
LB2F3:  dex
        bpl     LB29F
        rts

        sta     L003C
        stx     $3D
        lda     #$00
        ldx     #$04
        sta     $3E
        stx     $3F
LB303:  ldy     #$00
LB305:  lda     (L003C),y
        ora     #$80
        sta     ($3E),y
        iny
        cpy     #$28
        bne     LB305
        tya
        clc
        adc     L003C
        sta     L003C
        bcc     LB31A
        inc     $3D
LB31A:  lda     $3E
        clc
        adc     #$80
        sta     $3E
        lda     $3F
        adc     #$00
        sta     $3F
        cmp     #$08
        bmi     LB303
        lda     $3E
        sec
        sbc     #$D8
        cmp     #$78
        bne     LB335
        rts

LB335:  sta     $3E
        lda     $3F
        sbc     #$03
        sta     $3F
        bne     LB303
        lda     $091F
        sta     $A9
        jsr     LB849
        lda     $0976
        cmp     #$D2
        bcs     LB385
        cmp     $0934
        beq     LB385
        cmp     #$6E
        bcs     LB36B
        cmp     $0931
        bcs     LB385
        sta     $0934
        jsr     LB9CE
        lda     $0934
        sta     $0976
        jmp     LB37C

LB36B:  sec
        sbc     #$64
        cmp     $0931
        bcs     LB385
        sta     $0934
        sta     $0976
        jsr     LB9C3
LB37C:  jsr     LB38E
        lda     $A9
        sta     $091F
        rts

LB385:  lda     $0934
        sta     $0976
        jmp     LB37C

LB38E:  ldx     $0920
        lda     LAFCA,x
        sta     L00A5
        lda     LAFCB,x
        sta     $A6
LB39B:  ldy     #$00
        lda     (L00A5),y
        sta     $092E
        bne     LB3A5
        rts

LB3A5:  jsr     LB808
        ldy     #$00
        sty     $091C
        sty     $091D
        sty     $091E
LB3B3:  lda     ($3E),y
        sta     $091C,y
        iny
        cpy     $092E
        bne     LB3B3
        jsr     LB285
        jmp     LB39B

        jsr     L874C
        clc
        lda     $5F
        adc     $0A36
        sta     $C2
        lda     $60
        adc     $0A37
        sta     $C3
        lda     #$EB
        ldx     #$D1
        jsr     L1735
        asl     a
        rol     $C8
