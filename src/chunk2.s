; da65 V2.19 - Git 7f1dd09bc
; Created:    2024-08-24 11:55:32
; Input file: ../chunks/2_f600-fbff
; Page:       1


        .setcpu "6502"
        .org $f600

        .include "macros.inc"

        .refto __APPLE2__

;;; Possible chunk4 references
L168F           := $168F
L1763           := $1763
L1768           := $1768
L180C           := $180C
L1818           := $1818
L1A6E           := $1A6E
DrawMessage4    := $1D92
ClearViewportsToBlack   := $1DA8

;;; Possible chunk5 references
L6006           := $6006
L6C89           := $6C89
L89D0           := $89D0
L90C0           := $90C0
L90D3           := $90D3
L91F7           := $91F7
L920C           := $920C
L924C           := $924C
L92DB           := $92DB
LA23D           := $A23D
LA4D2           := $A4D2


msg_courseplotter:
        MESSAGE $0C, $0A, "**** COURSE PLOTTER SYSTEM ****"
        MESSAGE $14, $2D, " "
        MESSAGE $1C, $06, "A. BEGIN NORMAL COURSE RECORDING"
        MESSAGE $24, $06, "B. DISPLAY COURSE PLOT"
        MESSAGE $2C, $06, "C. BOOT DOS"
        MESSAGE $34, $06, "D. BEGIN PRECISION RECORDING"
        MESSAGE $3C, $06, "E. TURN OFF COURSE PLOTTER"
        MESSAGE $50, $0A, "SELECT OPTION, THEN PRESS ESC TO"
        MESSAGE $56, $0A, "RETURN TO FLIGHT, SLEW, OR RADAR"
        MESSAGE $5C, $0A, "MODE TO VIEW OR RECORD COURSE."
        .byte   $00, $00

LF715:  asl     a
LF716:  .byte   $01
LF717:  brk
LF718:  brk
LF719:  brk
LF71A:  brk
LF71B:  brk

LF71C:  jsr     ClearViewportsToBlack
        CALLAX  DrawMessage4, msg_courseplotter
        jsr     L89D0
        cmp     #$41
        beq     LF742
        cmp     #$42
        beq     LF748
        cmp     #$43
        beq     LF755
        cmp     #$44
        beq     LF776
        cmp     #$45
        beq     LF76E
        cmp     #$1B
        bne     LF71C
        rts

LF742:  ldx     #$06
        lda     #$0A
        bne     LF77A
LF748:  lda     LF71B
        beq     LF71C
        lda     #$02
        sta     LF717
        jmp     LF71C

LF755:  lda     $1E08
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        ora     #$C0
        sta     $08AE
        lda     #$00
        sta     $08AD
        lda     #$EA
        sta     $8A06
        jmp     LF71C

LF76E:  lda     #$00
        sta     LF717
        jmp     LF71C

LF776:  ldx     #$04
        lda     #$02
LF77A:  stx     LF71A
        sta     LF715
        lda     #$01
        sta     LF717
        jsr     LF8B0
        lda     #$00
        ldx     #$D0
        sta     $B8
        stx     $B9
        ldy     #$00
        lda     #$07
        sta     ($B8),y
        iny
        lda     LF71A
        sta     ($B8),y
        iny
        ldx     #$00
LF79F:  lda     $5A,x
        sta     ($B8),y
        inx
        iny
        cpx     #$0C
        bne     LF79F
        lda     #$1C
        sta     ($B8),y
        iny
        lda     #$01
        sta     ($B8),y
        iny
        lda     #$00
        sta     ($B8),y
        iny
        sta     ($B8),y
        iny
        sta     ($B8),y
        iny
        sta     ($B8),y
        iny
        sta     ($B8),y
        iny
        sta     ($B8),y
        iny
        lda     #$79
        sta     ($B8),y
        tya
        clc
        adc     $B8
        sta     LF718
        lda     $B9
        sta     LF719
        lda     #$01
        sta     LF71B
        jsr     LF8BC
        jmp     LF71C

        lda     LF717
        bne     LF7E8
        rts

LF7E8:  cmp     #$01
        beq     LF803
        cmp     #$02
        beq     LF7F1
        rts

LF7F1:  lda     #$00
        ldx     #$D0
        sta     $8B
        stx     $8C
        jsr     LF8B0
        jsr     L6006
        jsr     LF8BC
        rts

LF803:  dec     LF716
        beq     LF809
        rts

LF809:  lda     LF715
        sta     LF716
        lda     #$E0
        sec
        sbc     LF718
        lda     #$DF
        sbc     LF719
        bpl     LF81D
        rts

LF81D:  jsr     LF8B0
        lda     LF718
        ldx     LF719
        sta     $B8
        stx     $B9
        ldy     #$00
        lda     #$02
        sta     ($B8),y
        iny
        lda     $5B
        sec
        sbc     $D003
        sta     $B7
        lda     $5C
        sbc     $D004
        sta     $BC
        lda     $5D
        sbc     $D005
        sta     $BD
        jsr     LF8C6
        lda     $B7
        sta     ($B8),y
        iny
        lda     $BC
        sta     ($B8),y
        iny
        lda     $5F
        sec
        sbc     $D007
        sta     $B7
        lda     $60
        sbc     $D008
        sta     $BC
        lda     $61
        sbc     $D009
        sta     $BD
        jsr     LF8C6
        lda     $B7
        sta     ($B8),y
        iny
        lda     $BC
        sta     ($B8),y
        iny
        lda     $63
        sec
        sbc     $D00B
        sta     $B7
        lda     $64
        sbc     $D00C
        sta     $BC
        lda     $65
        sbc     $D00D
        sta     $BD
        jsr     LF8C6
        lda     $B7
        sta     ($B8),y
        iny
        lda     $BC
        sta     ($B8),y
        iny
        lda     #$79
        sta     ($B8),y
        tya
        clc
        adc     $B8
        sta     LF718
        lda     $B9
        adc     #$00
        sta     LF719
        jsr     LF8BC
        rts

LF8B0:  lda     #$01
        sta     $08B0
        lda     $C08B
        lda     $C08B
        rts

LF8BC:  lsr     $08B0
        lda     $C083
        lda     $C083
        rts

LF8C6:  lda     LF71A
        cmp     #$04
        beq     LF8E5
        lsr     $BD
        ror     $BC
        ror     $B7
        lsr     $BD
        ror     $BC
        ror     $B7
        lsr     $BD
        ror     $BC
        ror     $B7
        lsr     $BD
        ror     $BC
        ror     $B7
LF8E5:  rts

LF8E6:  .byte   $FF
        .byte   $F9
LF8E8:  sed
        asl     $F9
        ora     $26F9,y
        .byte   $F9
        .byte   $33
LF8F0:  sbc     LF944,y
        .byte   $4F
        sbc     LF95C,y
        .byte   $6B
        sbc     $8006,y
        adc     #$80
        ror     a
        .byte   $82
        ror     a
        .byte   $80
        .byte   $6B
        sta     ($6B,x)
        .byte   $82
        .byte   $6B
        ora     #$8C
        .byte   $6B
        txa
        jmp     (L6C89)

        .byte   $89
        adc     $6D88
        txa
        adc     $6E89
        dey
        ror     $6E87
        asl     $8E
        adc     $6E8D
        sta     $8E6F
        .byte   $6F
        sta     $8B70
        .byte   $6F
        asl     $93
        .byte   $72
        .byte   $92
        .byte   $73
        sty     $71,x
        .byte   $92
        .byte   $73
        sta     ($73),y
        bcc     LF9A6
        php
        sta     $78,x
        tya
        sei
        stx     $79,y
        sta     $79,x
        sty     $79,x
        sty     $7A,x
        sta     $7A,x
        sta     ($79),y
LF944:  ora     $95
        adc     $7D96,x
        sty     $7D,x
        sty     $7C,x
        sty     $7E,x
        asl     $95
        sty     $94
        sty     $94
        .byte   $83
        sta     $83,x
        sta     ($83),y
        adc     ($82,x)
LF95C:  .byte   $07
        .byte   $93
        txa
        .byte   $92
        txa
        .byte   $92
        .byte   $89
        sta     ($89),y
        bcc     LF8F0
        sta     ($8A),y
        sty     $8B,x
        .byte   $07
        sty     $8D8E
        stx     $8E8E
        sty     $8B8D
        sta     $8D8A
        sta     $A58F
        rts

        clc
        adc     #$02
        ldx     #$FF
LF981:  inx
        sec
        sbc     #$06
        bcs     LF981
        cpx     #$09
        bcc     LF98D
        ldx     #$08
LF98D:  txa
        cmp     LF8E6
        bne     LF994
        rts

LF994:  ldx     LF8E6
        sta     LF8E6
        pha
        bmi     LF9A1
        txa
        jsr     LF9A2
LF9A1:  pla
LF9A2:  asl     a
        tax
        .byte   $BD
        .byte   $E7
LF9A6:  sed
        sta     $9C
        lda     LF8E8,x
        ldx     #$00
        ldy     #$00
        jmp     L1A6E

LF9B3:  brk
LF9B4:  rts

        lda     $09E3
        bne     LF9B4
        ldx     #$00
        lda     $09A3
        bpl     LF9C2
        dex
LF9C2:  stx     $A5
        lda     $5A
        sec
        sbc     $09A2
        sta     $5A
        lda     $5B
        sbc     $09A3
        sta     $5B
        lda     $5C
        sbc     $A5
        sta     $5C
        lda     $5D
        sbc     $A5
        sta     $5D
        ldx     #$00
        lda     $09A5
        bpl     LF9E7
        dex
LF9E7:  stx     $A5
        lda     $62
        sec
        sbc     $09A4
        sta     $62
        lda     $63
        sbc     $09A5
        sta     $63
        lda     $64
        sbc     $A5
        sta     $64
        lda     $65
        sbc     $A5
        sta     $65
        lda     $62
        sta     $C3
        lda     #$00
        sta     $C2
        ldx     LF9B3
        jsr     L168F
        clc
        adc     $09AF
        sta     $09AF
        txa
        adc     $09B0
        sta     $09B0
        lda     LF9B3
        and     #$01
        beq     LFA31
        lda     $2B
        and     #$C0
        beq     LFA3E
        cmp     #$80
        beq     LFA37
LFA31:  lda     #$00
        ldx     #$00
        beq     LFA4F
LFA37:  lda     #$00
        ldx     #$01
        jmp     LFA42

LFA3E:  lda     #$00
        ldx     #$FF
LFA42:  sta     $C2
        stx     $C3
        lda     $09DE
        ldx     $09DF
        jsr     L168F
LFA4F:  sta     $08A1
        stx     $08A2
        rts

        lda     $5F
        cmp     $095F
        lda     $60
        sbc     $0960
        bmi     LFA8F
        lda     $5F
        cmp     $0961
        lda     $60
        sbc     $0962
        bmi     LFA88
        lda     $5F
        cmp     $0963
        lda     $60
        sbc     $0964
        bmi     LFA81
        lda     #$65
        ldx     #$09
        jmp     LFA96

LFA81:  lda     #$69
        ldx     #$09
        jmp     LFA96

LFA88:  lda     #$6D
        ldx     #$09
        jmp     LFA96

LFA8F:  lda     #$71
        ldx     #$09
        inc     $09A6
LFA96:  sta     $BE
        stx     $BF
        ldy     #$01
        lda     ($BE),y
        sta     LF9B3
        ldy     #$03
        lda     ($BE),y
        clc
        adc     $0847
        lsr     $09A6
        bcc     LFAB2
        clc
        adc     $0849
LFAB2:  pha
        jsr     L1768
        stx     $A5
        pla
        jsr     L1763
        stx     $A7
        ldy     #$00
        lda     ($BE),y
        pha
        tax
        ldy     $A5
        jsr     L1818
        ldx     $09DF
        jsr     L180C
        sta     $09A2
        sty     $09A3
        pla
        tax
        ldy     $A7
        jsr     L1818
        ldx     $09DF
        jsr     L180C
        sta     $09A4
        sty     $09A5
        rts

LFAE9:  .byte   $01
LFAEA:  .byte   $06
LFAEB:  .byte   $02
        lda     $0A5B
        cmp     #$18
        bcs     LFAF6
        jsr     L92DB
LFAF6:  lda     $60
        cmp     LFAE9
        bcs     LFB03
        jsr     L90C0
        jmp     LFB0B

LFB03:  cmp     LFAEA
        bcc     LFB0B
        jsr     L90D3
LFB0B:  lda     #$24
        sta     $08FF
        lda     #$03
        sta     $0900
        lda     #$1F
        sta     $08FB
        lda     #$01
        sta     $08FC
        ldx     #$00
        jsr     LA23D
        jsr     LA4D2
        rol     $BE
        lda     $BF
        rol     a
        cmp     LFAEB
        bcc     LFB66
        lda     #$01
        sta     LFAEB
        lda     $B7
        eor     #$80
        tax
        lda     $B6
        sbc     $09E4
        txa
        sbc     $09E5
        bpl     LFB56
        lda     $09B0
        eor     #$80
        cmp     #$72
        bcc     LFB78
        jsr     L91F7
        jsr     L91F7
        rts

LFB56:  lda     $09B0
        eor     #$80
        cmp     #$8E
        bcs     LFB78
        jsr     L924C
        jsr     L924C
        rts

LFB66:  lda     #$02
        sta     LFAEB
        ldx     $09B0
        beq     LFB7B
        bpl     LFB74
        inx
        inx
LFB74:  dex
        stx     $09B0
LFB78:  jsr     L920C
LFB7B:  rts

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
        ror     $FF,x
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
        ror     $FF,x
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
        ror     $FF,x
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
        ror     $FF,x
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
        ror     $FF,x
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
        ror     $FF,x
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
        ror     $FF,x
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
