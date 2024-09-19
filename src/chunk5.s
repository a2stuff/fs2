        .org $6000

L003C           := $003C
L00A5           := $00A5

;;; Possible chunk5 references - overlays?
LB808           := $B808
LB849           := $B849
LB9C3           := $B9C3
LB9CE           := $B9CE

L6000:  jmp     L610A

L6003:  jmp     L639D

        ;; Called from chunk2
L6006:  jmp     L6734

        jmp     L7988

        jmp     L7963

        jmp     L7B16

L6012:  jmp     L84B5

        jmp     L84F4

        ;; Called by chunk3
L6018:  jmp     L67FD

        ;; Called by chunk3
DrawColorSpanRelay:  jmp     DrawColorSpan

        ;; Called by chunk3
L601E:  jmp     MapColorAndPrepRowRoutine

L6021:  lda     #$09            ; 64k: Patched to JMP `LDB48`
        jmp     L67FD

L6026:  rts                     ; 64k: Patched to JMP `UpdateCOMMessageChunks`

        rts

        rts

L6029:  lda     $08F3
        beq     L6049
        lda     #$00
        sta     $08F2
        ldy     #$08
        LDAX    $08F7
        jsr     L604E
        ldy     #$00
        LDAX    $08F5
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

L607D:  iny
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

L60DB:  ldy     #$05
:       lda     ($8B),y
        sta     $08E4,y
        dey
        bne     :-
        lda     $08E9
        bmi     L60FD
        pha

        ADD16   $08E7, $8B, $08E7

        pla
L60FD:  and     #$03
        sta     $08E9
        jsr     L8776
        lda     #$06
        jmp     L67FD

L610A:  lda     RadarView
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

L612D:  lda     ViewDirection
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

L6155:  lda     ViewDirection
        asl     a
        asl     a
        asl     a
        asl     a
        sta     $3E
        LDAX    $6E
        STAX    $B6
        LDAX    $6C
        STAX    $C0
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
        STAX    $C0
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
        jsr     ZPScale

        ldx     #$B6
        ldy     #$BE
        lda     #$AD
        jsr     ZPScale

        SUB16   $98, $AD, $72

        ldx     #$B6
        ldy     #$BA
        lda     #$98
        jsr     ZPScale

        ldx     #$C0
        ldy     #$BE
        lda     #$AD
        jsr     ZPScale

        ADD16   $AD, $98, $74

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
        STAX    $CB
        ldx     $74
        lda     $75
        jsr     L1778
        STAX    $CD
        ldx     $76
        lda     $77
        jsr     L1778
        STAX    $CF
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
        jsr     ZPScale

        ldx     #$CF
        ldy     #$CD
        lda     #$1B
        jsr     ZPScale

        ldx     #$D6
        ldy     #$CD
        lda     #$DD
        jsr     ZPScale

        ldx     #$CF
        ldy     #$D4
        lda     #$DF
        jsr     ZPScale

        ldx     #$CB
        ldy     #$1B
        lda     #$E1
        jsr     ZPScale

        ldx     #$CB
        ldy     #$DF
        lda     #$1E
        jsr     ZPScale

        ldx     #$DD
        ldy     #$CB
        lda     #$4A
        jsr     ZPScale

        ldx     #$CB
        ldy     #$D8
        lda     #$4D
        jsr     ZPScale

        ADD16   $D8, $E1, $78
        SUB16   $1E, $DD, $7A

        ldx     #$CF
        ldy     #$18
        lda     #$7C
        jsr     ZPScale

        ldx     #$CD
        ldy     #$18
        lda     #$7E
        jsr     ZPScale

        ldx     #$18
        ldy     #$D4
        lda     #$80
        jsr     ZPScale

        lda     #$00
        sec
        sbc     $CB
        sta     $82
        lda     #$00
        sbc     $CC
        sta     $83

        SUB16   $4A, $DF, $84
        ADD16   $1B, $4D, $86

        ldx     #$D6
        ldy     #$18
        lda     #$88
        jsr     ZPScale

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

L631D:  LDAX    $7E
        STAX    $C2
        jsr     L6363
        lda     $C7
        sta     $4C
        LDAX    $C8
        STAX    $4A
        LDAX    $80
        STAX    $C2
        jsr     L6363
        lda     $C7
        sta     $4F
        LDAX    $C8
        STAX    $4D
        LDAX    $82
        STAX    $C2
        jsr     L6363
        lda     $C7
        sta     $52
        LDAX    $C8
        STAX    $50
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
L6379:  LDAX    $68
        jsr     MultiplyAXByC2
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

;;; ============================================================

;;; Flip pages and fill viewport with sky/ground. Also updates artificial horizon.

.proc L639D
        txa
        bne     L63BE

        ;; Point `HiresTableHi` at "other" page

        ldx     #$C0
L63A2:  lda     HiresTableHi-1,x
        clc
        adc     HiresPageDelta
        sta     HiresTableHi-1,x
        dex
        bne     L63A2
        lda     HiresPageDelta
        eor     #$C0
        sta     HiresPageDelta

        ;; Flip displayed pages
        bpl     L63BB
        sta     LOWSCR
        bmi     L63BE           ; always
L63BB:  sta     HISCR
L63BE:

        LDAX    $8B
        STAX    $35
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
        LDAX    $66
        STAX    $02
        LDAX    $6A
        STAX    $04
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
        LDAX    $02
        STAX    $66
        LDAX    $04
        STAX    $6A
        lda     #$20
        sta     L6B2C
        LDAX    $35
        STAX    $8B
        LDAX    $E9
        STAX    $D1
        LDAX    $EB
        STAX    $DA

        lda     $0882           ; override ground color ???
        beq     L644A           ; black
        cmp     #$FF
        beq     L644A           ; white
        lda     #$2A            ; green (even col)
L644A:  sta     FillColor

        lda     $0880           ; override sky color ???
        beq     L6457           ; black
        cmp     #$FF
        beq     L6457           ; white
        lda     #$D5            ; blue (even col)
L6457:  sta     AltFillColor
        beq     L6467           ; black
        cmp     #$FF
        beq     L6467           ; white

        lda     FillColor
        beq     L6467           ; black
        cmp     #$FF
        bne     L646D           ; white
L6467:  and     #$03
        tax                     ; hires color
        jsr     SetEvenAndOddColorsAndPrepRowRoutine

L646D:  lda     #$00
        sta     $F0
        lda     #$63
        sta     $EF
        lda     $EA
        bpl     L6492
        dec     $F0
        lda     $73
        bpl     L6482
        jsr     SwapFillColors
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

;;; Typical view:
;;;
;;; +----------------------------------------+
;;; |                                        |\
;;; |                                        | } solid sky
;;; |. . . . . . . . . . . . . . . . . . . . |/
;;; |                            ______,-----|\
;;; |              ______,------'            | } mix of sky/ground
;;; |______,------'                          |/
;;; |. . . . . . . . . . . . . . . . . . . . |\
;;; |                                        | } solid ground
;;; |                                        |/
;;; +----------------------------------------+
;;;
;;; NOTE: Depending on pitch/roll, this could be inverted!

;;; Fill rows of viewport *above* the sky/ground diagonal
L64B9:  lda     $EB
        beq     L64C0
L64BD:  jsr     SwapFillColors
L64C0:  ldy     $EF
        beq     L64CC
        sty     $F1
        dey
        sty     $E7
        jsr     FillViewportRows

;;; Fill rows of viewport with the sky/ground diagonal
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
L64E3:  jsr     SwapFillColors
L64E6:  jsr     FillMixedViewportRows

;;; Fill rows of viewport *below* the sky/ground diagonal
        lda     $F0
        cmp     #99             ; viewport rows
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
L6506:  jsr     SwapFillColors
L6509:  lda     #99
        sta     $E7
        sec
        sbc     $F0
        sta     $F1
        jsr     FillViewportRows

;;; Finish up - update artificial horizon too
L6515:
        jsr     UpdateArtificialHorizon
        rts
.endproc

;;; ============================================================

.proc SwapFillColors
        ldx     FillColor
        ldy     AltFillColor
        stx     AltFillColor
        sty     FillColor
        rts
.endproc

;;; ============================================================

;;; Make sky/ground edge white, to avoid color clash/black pixels
.proc TidySkyGroundEdgeInRow
        stx     TmpStash        ; self-modified opcode (RTS / STX)
        ldy     AltColorPixelToByteTable,x
        lda     PixelToBitNumberTable+4,x
        tax
        lda     L149E,x
        ora     (HiresRowPtr),y
        sta     (HiresRowPtr),y
        cpy     #39             ; max col
        bcs     :+
        iny
        lda     L14A5,x
        ora     (HiresRowPtr),y
        sta     (HiresRowPtr),y
:
        ldx     TmpStash
        rts
.endproc

;;; ============================================================

;;; Inputs:
;;;    $E7 = bottom-most row (start)
;;;    $F1 = number of rows
.proc FillViewportRows
        ldy     $E7
        lda     HiresTableLo,y
        sta     HiresRowPtr
        lda     HiresTableHi,y
        sta     HiresRowPtr+1
        lda     FillColor
        beq     L6555           ; black, so use our optimized routine
        cmp     #$FF
        bne     L6567           ; not white, so use generic routine

        ;; Optimized routine when fill is solid black or white
L6555:  ldy     #39             ; columns
L6557:  sta     (HiresRowPtr),y
        dey
        sta     (HiresRowPtr),y
        dey
        sta     (HiresRowPtr),y
        dey
        sta     (HiresRowPtr),y
        dey
        bpl     L6557
        bmi     L656A           ; always

L6567:  jsr     DrawSkyGroundRowUnrolledHelper

L656A:  dec     $E7
        dec     $F1
        bne     FillViewportRows ; loop
        rts
.endproc

;;; ============================================================

;;; Used for edge-to-edge fills of sky/ground
;;; The EOR #$7F are modified to be LDA #$xx at the transition point
;;; e.g. from the inital blue to green

DrawSkyGroundRowUnrolled:
        sta     (HiresRowPtr),y
        iny
        eor     #$7F            ; self-modified
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        iny
        eor     #$7F
        sta     (HiresRowPtr),y
        rts

L6637:  lda     FillColor
        beq     L669D
        cmp     #$FF
        beq     L669D
DrawSkyGroundRowUnrolledHelper:
        ldy     #$00
        jmp     DrawSkyGroundRowUnrolled

;;; Modify the line fill to transition sky/ground at appropriate column

DrawSkyGroundRow:
        ldy     $E7             ; self-modified; turned into JMP AltDrawSkyGroundRow
        lda     HiresTableLo,y
        sta     HiresRowPtr
        lda     HiresTableHi,y
        sta     HiresRowPtr+1
        stx     $B2

        ;; Compute transition point (sky->ground or ground->sky),
        ;; and modify `DrawSkyGroundRowUnrolled` to switch colors.
        lda     ColorPixelToByteTable,x
        cmp     #$27
        beq     L6637
        asl     a
        asl     a
        adc     ColorPixelToByteTable,x
        tay                     ; Y is offset into `DrawSkyGroundRowUnrolled`
        ror     a
        lda     AltFillColor
        bcs     :+              ; even or odd column?
        eor     #$7F            ; flip if needed
:       sta     DrawSkyGroundRowUnrolled+4,y
        lda     #OPC_LDA_imm
        sta     DrawSkyGroundRowUnrolled+3,y
        sty     TmpStash        ; stash for later
        ldy     #$00
        lda     FillColor

        jsr     DrawSkyGroundRowUnrolled

        ldy     TmpStash
        lda     #OPC_EOR_imm    ; flip even/odd
        sta     DrawSkyGroundRowUnrolled+3,y
        lda     #$7F            ; mask
        sta     DrawSkyGroundRowUnrolled+4,y
        lda     AltFillColor
        beq     L668B
        cmp     #$FF
        bne     L6695
L668B:  lda     #$8B
        sta     $27
        sec
        sbc     $B2
        jsr     DrawColorSpan
L6695:  lda     FillColor
        beq     L669D
        cmp     #$FF
        bne     L66A4
L669D:  lda     $B2
        sta     $27
        jsr     DrawColorSpan
L66A4:  ldx     $B2
        rts

;;; ============================================================

        brk

        ;; Proc table
L66A8:
        .addr   L69C8
        .addr   L6888
        .addr   L689F
        .addr   L6F8B
        .addr   L6DAF
        .addr   L6021
        .addr   L6B52
        .addr   L6BA0
        .addr   L676C
        .addr   L67AD
        .addr   L67AD
        .addr   L6D48
        .addr   L676C
        .addr   L60DB
        .addr   L67B2
        .addr   L676C
        .addr   L676C
        .addr   L67C3
        .addr   L7B07
        .addr   L6DED
        .addr   L6DF3
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L6780
        .addr   L67BA
        .addr   L6D66
        .addr   L7AB6
        .addr   L7AD4
        .addr   L6029
        .addr   L607D
        .addr   L676C
        .addr   L6E7E
        .addr   L6E89
        .addr   L6E97
        .addr   L6EF1
        .addr   L6B64
        .addr   L6D8E
        .addr   L676C
        .addr   L676C
        .addr   L6F1D
        .addr   L67C8
        .addr   L676C
        .addr   L69E6
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L67BB
        .addr   L676C
        .addr   L6947
        .addr   L68BA
        .addr   L68E9
        .addr   L676C
        .addr   L69A7
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L676C
        .addr   L688F
        .addr   L68A6
        .addr   L694E
        .addr   L676C
        .addr   L676C
        .addr   L676C

;;; ============================================================

        ;; Called by chunk3
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
        bcc     :+
        jsr     L8752
:       ldy     #$00
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
        lda     L66A8+1,x
        sta     L00A5+1
        jmp     (L00A5)

;;; Turn coordinator?
L6780:  lda     $8B
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

L67AD:  lda     #$03
        jmp     L67FD

L67B2:  lda     Has64K
        beq     L67BA
        jmp     LF3CA

L67BA:  rts

L67BB:  lda     #$FF
        sta     $2C
        lda     #$00
        sta     $B5


L67C3:  lda     #$01
        jmp     L67FD

L67C8:  lda     $2C
        bne     L67DD
        ldx     #$09
L67CE:  lda     $07,x
        sta     $D2,x
        dex
        bne     L67CE
        lda     #$01
        jsr     AddTo8B
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

;;; ============================================================

.proc AddTo8B
        clc
        adc     $8B
        sta     $8B
        bcc     :+
        inc     $8C
:       rts
.endproc

;;; ============================================================

        lda     #$02

        ;; Popular jump target???
L67FD:  jsr     AddTo8B
        jmp     L6746

;;; ============================================================


L6803:  ldy     #$D4
L6806 := *+1
        jsr     L7EBC           ; self-modified
        lda     $2C
        beq     L6839
        ldy     $B5
        cpy     #$3C
        bcs     L6843
        inc     $B5
        lda     $D4
        sta     L0AB8,y
        lda     $D5
        sta     L0AF8,y
        lda     $D6
        sta     L0B38,y
        lda     $D7
        sta     L0B78,y
        lda     $D8
        sta     L0BB8,y
        lda     $D9
        sta     L0BF8,y
        and     $D3
        sta     $D3
        jmp     L6843

L6839:  jsr     L73CB
        lda     $D3
        bne     L6843
        jsr     L7C0F
L6843:  rts

;;; ============================================================

L6844:  ldy     #$CB
L6847 := *+1
        jsr     L7EBC           ; self-modified
        lda     $2C
        beq     L6874
        ldy     $B5
        inc     $B5
        lda     $CB
        sta     L0AB8,y
        lda     $CC
        sta     L0AF8,y
        lda     $CD
        sta     L0B38,y
        lda     $CE
        sta     L0B78,y
        lda     $CF
        sta     L0BB8,y
        lda     $D0
        sta     L0BF8,y
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

L6888:  ldx     #$C5
        lda     #$80
        jmp     L6893

L688F:  ldx     #$BC
        lda     #$7E
L6893:  stx     L6847
        sta     L6847+1
        jsr     L6844
L689C:  jmp     L674D

L689F:  ldx     #$C5
        lda     #$80
        jmp     L68AA

L68A6:  ldx     #$BC
        lda     #$7E
L68AA:  stx     L6806
        sta     L6806+1
        jsr     L6803
        lda     $2C
        bne     L689C
        jmp     L6AE3

L68BA:  jsr     L6987
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

L68E9:  jsr     L6987
        lda     $2C
        beq     L68FB
        jsr     L6919
        lda     #$01
        jsr     AddTo8B
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
        jsr     AddTo8B
        jmp     L6AE3

L6919:  ldy     #$00
        ldx     $B5
        inc     $B5
        lda     ($2D),y
        sta     L0AB8,x
        iny
        lda     ($2D),y
        sta     L0AF8,x
        iny
        lda     ($2D),y
        sta     L0B38,x
        iny
        lda     ($2D),y
        sta     L0B78,x
        iny
        lda     ($2D),y
        sta     L0BB8,x
        iny
        lda     ($2D),y
        sta     L0BF8,x
        and     $D3
        sta     $D3
        rts

L6947:  ldx     #$C5
        lda     #$80
        jmp     L6952

L694E:  ldx     #$BC
        lda     #$7E
L6952:  stx     L6806
        sta     L6806+1
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
        jsr     AddTo8B
        rts

L69A7:  jsr     L6987
        lda     #$01
        jsr     AddTo8B
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

L69C8:  ldx     #$C5
        lda     #$80
        stx     L6847
        sta     L6847+1
        jsr     L6844
L69D5:  lda     $CA
        beq     L69DC
        jmp     L674D

L69DC:  jsr     L7BF3
        tax
        jsr     L7963
L69E3:  jmp     L674D

L69E6:  ldx     #$BC
        lda     #$7E
        stx     L6806
        stx     L6847
        sta     L6806+1
        sta     L6847+1
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

L6A2A:  SUB16   $D4, $CB, $9E
        SUB16   $D6, $CD, $A0
        SUB16   $D8, $CF, $A2
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

        ADD16   $CB, $9E, $D4
        ADD16   $CD, $A0, $D6
        ADD16   $CF, $A2, $D8
        jsr     L6839
        jsr     L6AE3
        ADD16   $CB, $9E, $CB
        ADD16   $CD, $A0, $CD
        ADD16   $CF, $A2, $CF
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
L6B1C:  LDAX    $D1
        STAX    $E9
        LDAX    $DA
        STAX    $EB
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

L6B64:  iny
        lda     ($8B),y
        pha
        LDAX    $5A
        STAX    $18
        LDAX    $62
        STAX    $1E
        lda     RadarView
        beq     L6B8A
        LDAX    $0A73
        STAX    $1B
        jmp     L6B92

L6B8A:  LDAX    $5E
        STAX    $1B
L6B92:  lda     #$FF
        sta     $AD
        pla
        tax
        jsr     L6BB0
        lda     #$08
        jmp     L67FD

L6BA0:  iny
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
        lda     RadarView
        beq     L6BFE
        lda     $AD
        bne     L6BEB
        lda     $0A73
        iny
        sbc     ($8B),y
        sta     $1B
        lda     ZoomLevel
        iny
        sbc     ($8B),y
        sta     $1C
L6BEB:  lda     ZoomLevel+1
        iny
        sbc     ($8B),y
        sta     $68
        lda     ZoomLevel+2
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

L6C53:  LDAX    $18
        STAX    $66
        LDAX    $1B
        STAX    $68
        LDAX    $1E
        STAX    $6A
        jmp     L6D28

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

        ;; Called from chunk2
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

L6D48:  jsr     L6D56

L6D4B:  LDAX    L00A5
        STAX    $8B
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

L6D66:  iny
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

L6D8E:  iny
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

L6DAF:  jsr     L6D56
        lda     #$02
        jsr     AddTo8B
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
        jsr     AddTo8B
        lda     $DC
        beq     L6DF0
        LDAX    L00A5
        STAX    $8B
        jmp     L674D

L6DED:  jsr     L6E17
L6DF0:  jmp     L674D

L6DF3:  jsr     L6E17
        sec
        lda     RadarView
        beq     L6E07
        lda     ZoomLevel+1
        sbc     $98
        lda     ZoomLevel+2
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
        jsr     AddTo8B
        rts

L6E44:  iny
        lda     ($8B),y
        sec
L6E49 := *+1
        sbc     $64             ; self-modified
        sta     $AB
        iny
        lda     ($8B),y
L6E50 := *+1
        sbc     $65             ; self-modified
        sta     $AC
        bmi     L6E63
        lda     $98
        sec
        sbc     $AB
        lda     $99
        sbc     $AC
        bpl     L6E6E
        jmp     L6E6F

L6E63:  lda     $98
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
        LDAX    L00A5
        STAX    $8B
        jmp     L674D

L6E7E:  jsr     L6D56
        jsr     L6EA8
        lda     #$09
        jmp     L67FD

L6E89:  jsr     L6D56
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
L6ED5 := *+1
        sbc     #$00            ; self-modified
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
L6EE6:  LDAX    L00A5
        STAX    $8B
        jmp     L674D

L6EF1:  jsr     L6D56
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
        and     (HiresRowPtr),y
        bne     L6F16
        lda     $A9
        ldy     #$00
        and     (HiresRowPtr),y
        beq     L6EE6
L6F16:  ldy     $B3
        lda     #$07
        jmp     L67FD

L6F1D:  iny
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

L6F8B:  lda     Has64K
        beq     L6F93
        jmp     LF261

L6F93:  lda     #$06
        jmp     L67FD

L6F98:  inc     $B5
        ldx     $B5
        lda     L0AB8
        sta     L0AB8,x
        lda     L0AF8
        sta     L0AF8,x
        lda     L0B38
        sta     L0B38,x
        lda     L0B78
        sta     L0B78,x
        lda     L0BB8
        sta     L0BB8,x
        lda     L0BF8
        sta     L0BF8,x
        lda     L0BB8
        sec
        sbc     L0AB8
        lda     L0BF8
        sbc     L0AF8
        bmi     L6FD3
        lda     #$00
        beq     L6FD5
L6FD3:  lda     #$FF
L6FD5:  sta     $B4
        dex
        ldy     #$00
L6FDA:  lda     L0BB8,x
        sec
        sbc     L0AB8,x
        lda     L0BF8,x
        sbc     L0AF8,x
        bmi     L6FED
        lda     #$00
        beq     L6FEF
L6FED:  lda     #$FF
L6FEF:  cmp     $B4
        sta     $B4
        beq     L705F
        lda     L0AB8,x
        sta     $D4
        lda     L0AF8,x
        sta     $D5
        lda     L0B38,x
        sta     $D6
        lda     L0B78,x
        sta     $D7
        lda     L0BB8,x
        sta     $D8
        lda     L0BF8,x
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
        sta     L0D78,y
        ora     $D8
        beq     L705F
        lda     $D8
        sta     L0D38,y
        lda     $D4
        sta     L0C38,y
        lda     $D5
        sta     L0C78,y
        lda     $D6
        sta     L0CB8,y
        lda     $D7
        sta     $0CF8,y
        iny
L705F:  lda     $B4
        bne     L7088
        lda     L0AB8,x
        sta     L0C38,y
        lda     L0AF8,x
        sta     L0C78,y
        lda     L0B38,x
        sta     L0CB8,y
        lda     L0B78,x
        sta     L0CF8,y
        lda     L0BB8,x
        sta     L0D38,y
        lda     L0BF8,x
        sta     L0D78,y
        iny
L7088:  dex
        bmi     L708E
        jmp     L6FDA

L708E:  sty     $B5
        lda     $B5
        bne     L7095
        rts

L7095:  ldx     $B5
        lda     L0C38
        sta     L0C38,x
        lda     L0C78
        sta     L0C78,x
        lda     L0CB8
        sta     L0CB8,x
        lda     L0CF8
        sta     L0CF8,x
        lda     L0D38
        sta     L0D38,x
        lda     L0D78
        sta     L0D78,x
        lda     L0D38
        sec
        sbc     L0CB8
        lda     L0D78
        sbc     L0CF8
        bmi     L70CE
        lda     #$00
        beq     L70D0
L70CE:  lda     #$FF
L70D0:  sta     $B4
        dex
        ldy     #$00
L70D5:  lda     L0D38,x
        sec
        sbc     L0CB8,x
        lda     L0D78,x
        sbc     L0CF8,x
        bmi     L70E8
        lda     #$00
        beq     L70EA
L70E8:  lda     #$FF
L70EA:  cmp     $B4
        sta     $B4
        beq     L715A
        lda     L0C38,x
        sta     $D4
        lda     L0C78,x
        sta     $D5
        lda     L0CB8,x
        sta     $D6
        lda     L0CF8,x
        sta     $D7
        lda     L0D38,x
        sta     $D8
        lda     L0D78,x
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
        sta     L0BF8,y
        ora     $D8
        beq     L715A
        lda     $D8
        sta     L0BB8,y
        lda     $D4
        sta     L0AB8,y
        lda     $D5
        sta     L0AF8,y
        lda     $D6
        sta     L0B38,y
        lda     $D7
        sta     L0B78,y
        iny
L715A:  lda     $B4
        bne     L7183
        lda     L0C38,x
        sta     L0AB8,y
        lda     L0C78,x
        sta     L0AF8,y
        lda     L0CB8,x
        sta     L0B38,y
        lda     L0CF8,x
        sta     L0B78,y
        lda     L0D38,x
        sta     L0BB8,y
        lda     L0D78,x
        sta     L0BF8,y
        iny
L7183:  dex
        bmi     L7189
        jmp     L70D5

L7189:  sty     $B5
        lda     $B5
        bne     L7190
        rts

L7190:  ldx     $B5
        lda     L0AB8
        sta     L0AB8,x
        lda     L0AF8
        sta     L0AF8,x
        lda     L0B38
        sta     L0B38,x
        lda     L0B78
        sta     L0B78,x
        lda     L0BB8
        sta     L0BB8,x
        lda     L0BF8
        sta     L0BF8,x
        lda     L0AB8
        clc
        adc     L0BB8
        lda     L0AF8
        adc     L0BF8
        bpl     L71C9
        lda     #$FF
        bne     L71CB
L71C9:  lda     #$00
L71CB:  sta     $B4
        dex
        ldy     #$00
L71D0:  lda     L0AB8,x
        clc
        adc     L0BB8,x
        lda     L0AF8,x
        adc     L0BF8,x
        bpl     L71E3
        lda     #$FF
        bne     L71E5
L71E3:  lda     #$00
L71E5:  cmp     $B4
        sta     $B4
        beq     L7255
        lda     L0AB8,x
        sta     $D4
        lda     L0AF8,x
        sta     $D5
        lda     L0B38,x
        sta     $D6
        lda     L0B78,x
        sta     $D7
        lda     L0BB8,x
        sta     $D8
        lda     L0BF8,x
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
        sta     L0D78,y
        ora     $D8
        beq     L7255
        lda     $D8
        sta     L0D38,y
        lda     $D4
        sta     L0C38,y
        lda     $D5
        sta     L0C78,y
        lda     $D6
        sta     L0CB8,y
        lda     $D7
        sta     L0CF8,y
        iny
L7255:  lda     $B4
        bne     L727E
        lda     L0AB8,x
        sta     L0C38,y
        lda     L0AF8,x
        sta     L0C78,y
        lda     L0B38,x
        sta     L0CB8,y
        lda     L0B78,x
        sta     L0CF8,y
        lda     L0BB8,x
        sta     L0D38,y
        lda     L0BF8,x
        sta     L0D78,y
        iny
L727E:  dex
        bmi     L7284
        jmp     L71D0

L7284:  sty     $B5
        lda     $B5
        bne     L728B
        rts

L728B:  ldx     $B5
        lda     L0C38
        sta     L0C38,x
        lda     L0C78
        sta     L0C78,x
        lda     L0CB8
        sta     L0CB8,x
        lda     L0CF8
        sta     L0CF8,x
        lda     L0D38
        sta     L0D38,x
        lda     L0D78
        sta     L0D78,x
        lda     L0CB8
        clc
        adc     L0D38
        lda     L0CF8
        adc     L0D78
        bpl     L72C4
        lda     #$FF
        bne     L72C6
L72C4:  lda     #$00
L72C6:  sta     $B4
        dex
        ldy     #$00
L72CB:  lda     L0CB8,x
        clc
        adc     L0D38,x
        lda     L0CF8,x
        adc     L0D78,x
        bpl     L72DE
        lda     #$FF
        bne     L72E0
L72DE:  lda     #$00
L72E0:  cmp     $B4
        sta     $B4
        beq     L7350
        lda     L0C38,x
        sta     $D4
        lda     L0C78,x
        sta     $D5
        lda     L0CB8,x
        sta     $D6
        lda     L0CF8,x
        sta     $D7
        lda     L0D38,x
        sta     $D8
        lda     L0D78,x
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
        sta     L0BF8,y
        ora     $D8
        beq     L7350
        lda     $D8
        sta     L0BB8,y
        lda     $D4
        sta     L0AB8,y
        lda     $D5
        sta     L0AF8,y
        lda     $D6
        sta     L0B38,y
        lda     $D7
        sta     L0B78,y
        iny
L7350:  lda     $B4
        bne     L7379
        lda     L0C38,x
        sta     L0AB8,y
        lda     L0C78,x
        sta     L0AF8,y
        lda     L0CB8,x
        sta     L0B38,y
        lda     L0CF8,x
        sta     L0B78,y
        lda     L0D38,x
        sta     L0BB8,y
        lda     L0D78,x
        sta     L0BF8,y
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
L7470:  SUB16   $CF, $D8, $C4
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
        SUB16   $CB, $D4, $C4
        LDAX    $C2
        sta     $A9
        stx     $AA
        jsr     ZPScale::ScaleC2ByC4
        clc
        adc     $D4
        sta     $D4
        txa
        adc     $D5
        sta     $D5
        SUB16   $CF, $D8, $C4
        LDAX    $A9
        STAX    $C2
        jsr     ZPScale::ScaleC2ByC4
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
L74EE:  SUB16   $CF, $D8, $C4
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
        SUB16   $CB, $D4, $C4
        LDAX    $C2
        STAX    $A9
        jsr     ZPScale::ScaleC2ByC4
        clc
        adc     $D4
        sta     $D4
        txa
        adc     $D5
        sta     $D5
        SUB16   $CF, $D8, $C4
        LDAX    $A9
        STAX    $C2
        jsr     ZPScale::ScaleC2ByC4
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
L7576:  SUB16   $CF, $D8, $C4
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
        SUB16   $CF, $D8, $C4
        LDAX    $C2
        STAX    $A9
        jsr     ZPScale::ScaleC2ByC4
        clc
        adc     $D8
        sta     $D8
        sta     $D4
        txa
        adc     $D9
        sta     $D9
        sta     $D5
        SUB16   $CD, $D6, $C4
        LDAX    $A9
        STAX    $C2
        jsr     ZPScale::ScaleC2ByC4
        clc
        adc     $D6
        sta     $D6
        txa
        adc     $D7
        sta     $D7
        rts

L75F1:  jsr     L7679
L75F4:  SUB16   $CF, $D8, $C4
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
        SUB16   $CD, $D6, $C4
        LDAX    $C2
        STAX    $A9
        jsr     ZPScale::ScaleC2ByC4
        clc
        adc     $D6
        sta     $D6
        txa
        adc     $D7
        sta     $D7
        SUB16   $CF, $D8, $C4
        LDAX    $A9
        STAX    $C2
        jsr     ZPScale::ScaleC2ByC4
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
L7699:  lda     L0AB8,x
        sta     $C2
        lda     L0AF8,x
        sta     $C3
        lda     L0BB8,x
        sta     $C4
        lda     L0BF8,x
        sta     $C5
        ldy     L0B38,x
        lda     L0B78,x
        stx     $B2
        jsr     L7E80
        ldx     $B2
        sta     L0C78,x
        cmp     $53
        bcs     L76C3
        sta     $53
L76C3:  cmp     $54
        bcc     L76C9
        sta     $54
L76C9:  tya
        sta     L0CF8,x
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
        lda     L0C78,x
        sta     $0C77
        lda     L0CF8,x
        sta     $0CF7
        inx
        lda     L0C78
        sta     L0C78,x
        lda     L0CF8
        sta     L0CF8,x
        inx
        lda     $0C79
        sta     L0C78,x
        lda     $0CF9
        sta     L0CF8,x
        inc     $B5
        ldy     #$00
        ldx     #$00
L7724:  lda     #$00
        sta     L0B38,x
        lda     $0CF9,y
        sec
        sbc     L0CF8,y
        bne     L7735
        jmp     L77EA

L7735:  bcs     L775F
        eor     #$FF
        adc     #$01
        sta     L0AF8,x
        lda     $0CF9,y
        sta     L0AB8,x
        lda     $0CF7,y
        cmp     L0CF8,y
        bcc     L774F
        inc     L0B38,x
L774F:  lda     $0C79,y
        sta     L0B78,x
        lda     L0C78,y
        sec
        sbc     $0C79,y
        jmp     L7780

L775F:  sta     L0AF8,x
        lda     L0CF8,y
        sta     L0AB8,x
        lda     $0CFA,y
        cmp     $0CF9,y
        bcc     L7773
        inc     L0B38,x
L7773:  lda     L0C78,y
        sta     L0B78,x
        lda     $0C79,y
        sec
        sbc     L0C78,y
L7780:  php
        bcs     L778A
        sta     $AF
        lda     #$00
        sec
        sbc     $AF
L778A:  sta     $F5
        lda     L0AF8,x
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
        lda     L0B38,x
        beq     L77C8
        dec     L0AF8,x
L77C8:  plp
        bcs     L77DD
        lda     #$00
        sec
        sbc     $F4
        sta     L0BB8,x
        lda     #$00
        sbc     $F5
        sta     L0BF8,x
        jmp     L7831

L77DD:  lda     $F4
        sta     L0BB8,x
        lda     $F5
        sta     L0BF8,x
        jmp     L7831

L77EA:  lda     #$FF
        sta     L0AF8,x
        lda     L0CF8,y
        sta     L0AB8,x
        cmp     $0CF7,y
        php
        lda     L0C78,y
        sta     L0BF8,x
        sta     L0B78,x
L7802:  iny
        lda     L0C78,y
        cmp     L0BF8,x
        bcs     L780E
        sta     L0BF8,x
L780E:  cmp     L0B78,x
        bcc     L7816
        sta     L0B78,x
L7816:  lda     L0AB8,x
        cmp     $0CF9,y
        beq     L7802
        bcs     L7825
        plp
        bcc     L7833
        bcs     L7826
L7825:  plp
L7826:  lda     L0B78,x
        sec
        sbc     L0BF8,x
        sta     L0BF8,x
        dey
L7831:  inx
        iny
L7833:  cpy     $B5
        bpl     L783A
        jmp     L7724

L783A:  dex
        stx     $25
        jsr     MapColorAndPrepRowRoutine
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
        sta     HiresRowPtr
        lda     HiresTableHi,y
        sta     HiresRowPtr+1
L785D:  lda     $B1
        cmp     L0AB8,x
        bne     L789B
        lda     L0AF8,x
        bpl     L787B
        lda     L0B78,x
        sta     $27
        lda     L0BF8,x
        stx     $B0
        jsr     DrawColorSpan
        ldx     $B0
        jmp     L789B

L787B:  lda     L0B38,x
        clc
        adc     L0BB8,x
        sta     L0B38,x
        lda     L0B78,x
L7889 := *+1
        sta     $02             ; self-modified
        inc     L7889
        adc     L0BF8,x
        sta     L0B78,x
        dec     L0AF8,x
        bmi     L789B
        inc     L0AB8,x
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
        jsr     DrawColorSpan
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

;;; ============================================================
;;; Draw horizontal span in color
;;; Inputs:
;;;   A is width in color pixels (0...139)
;;;   $27 is right edge in color pixels (0...139)
;;;

DrawColorSpan:
        ;; Edges of span (pixel-by-pixel)
        sta     $F1
        inc     $F1
        ldx     $27
        ldy     AltColorPixelToByteTable,x
        lda     PixelToBitNumberTable,x
        tax                     ; X is bit position
        cmp     #$06
        beq     L7941
L791F:  lda     (HiresRowPtr),y
L7921:  .byte   OPC_ORA_abx     ; self-modified opcode
L7922:  .addr   OrMaskTable2    ; self-modified operand - color table
        cpx     #$03
        bne     L792D
        sta     (HiresRowPtr),y
        dey
        lda     (HiresRowPtr),y
L792D:  .byte   OPC_AND_abx     ; self-modified opcode
L792E:  .addr   AndMaskTable1   ; self-modified operand - color table
        sta     (HiresRowPtr),y
        dex
        bmi     L793A           ; switch to whole-byte mode
        dec     $F1
        bne     L791F
L7939:  rts

        ;; Middle of span (two bytes at a time)
L793A:  ldx     #$06
        dey
        dec     $F1
        beq     L7939
L7941:  lda     $F1
        sec
        sbc     #$07
        bcc     L791F           ; back to pixel-by-pixel
        beq     L7959           ; early exit path
        sta     $F1
        lda     ColorByteEven
        sta     (HiresRowPtr),y
        dey
        lda     ColorByteOdd
        sta     (HiresRowPtr),y
        dey
        jmp     L7941

L7959:  lda     ColorByteEven
        sta     (HiresRowPtr),y
        dey
        lda     ColorByteOdd
        sta     (HiresRowPtr),y
        rts

;;; ============================================================

L7963:  lda     HiresTableHi,y
        sta     HiresRowPtr+1
        lda     HiresTableLo,y
        sta     HiresRowPtr
        ldy     AltColorPixelToByteTable,x
        lda     PixelToBitNumberTable,x
        tax
        lda     (HiresRowPtr),y
L7976:  .byte   OPC_ORA_abx     ; self-modified opcode
L7977:  .addr   OrMaskTable2    ; self-modified operand
        cpx     #$03
        bne     L7982
        sta     (HiresRowPtr),y
        dey
        lda     (HiresRowPtr),y
L7982:  .byte   OPC_AND_abx     ; self-modified opcode
L7983:  .addr   AndMaskTable1   ; self-modified operand
        sta     (HiresRowPtr),y
        rts

;;; ============================================================

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
        ldy     #OPC_INC_zp
        lda     $EC
        sec
        sbc     $EA
        bcs     L79BF
        ldy     #OPC_DEC_zp
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
L7A06:  dec     $EA             ; self-modified opcode
L7A08:  .byte   OPC_STY_zp      ; self-modified opcode
L7A09:  .byte   $B1             ; self-modified operand
L7A0A:  ldy     $EA
        lda     HiresTableHi,y
        sta     HiresRowPtr+1
        lda     HiresTableLo,y
        sta     HiresRowPtr
        ldy     $B1
        lda     (HiresRowPtr),y
L7A1A:  .byte   OPC_ORA_abx     ; self-modified opcode
L7A1B:  .addr   OrMaskTable2    ; self-modified operand
        cpx     #$03
        bne     L7A2E
        sta     (HiresRowPtr),y
        dey
        lda     (HiresRowPtr),y
L7A26:  .byte   OPC_AND_abx     ; self-modified opcode
L7A27:  .addr   AndMaskTable1   ; self-modified operand
        sta     (HiresRowPtr),y
        iny
        bne     L7A33
L7A2E:  .byte   OPC_AND_abx     ; self-modified opcode
L7A2F:  .addr   AndMaskTable1   ; self-modified operand
        sta     (HiresRowPtr),y
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
        sta     HiresRowPtr+1
        lda     HiresTableLo,y
        sta     HiresRowPtr
        ldy     $B1
L7A86:  dex
        bpl     L7A8C
        ldx     #$06
        dey
L7A8C:  .byte   OPC_LDA_izy     ; self-modified opcode
L7A8D:  .byte   $8E             ; self-modified operand
L7A8E:  .byte   OPC_ORA_abx     ; self-modified opcode
L7A8F:  .addr   OrMaskTable2    ; self-modified operand
        cpx     #$03
        bne     L7A9A
        sta     (HiresRowPtr),y
        dey
        lda     (HiresRowPtr),y
L7A9A:  .byte   OPC_AND_abx     ; self-modified opcode
L7A9B:  .addr   AndMaskTable2   ; self-modified opcode
        sta     (HiresRowPtr),y
L7A9F:  dec     $F1
        bne     L7A67
        rts

        lda     $F1
        and     #$03
        bne     L7AAF
        lda     (HiresRowPtr),y
        jmp     L7A8E

L7AAF:  cpx     #$03
        bne     L7A9F
        dey
        bpl     L7A9F
L7AB6:  lda     #OPC_STY_zp
        sta     L7A08
        lda     #OPC_LDA_izy
        sta     L7A09
        lda     #OPC_LDA_izy    ; TODO: redundant
        sta     L7A8C
        lda     #$8E            ; operand
        sta     L7A8D
        lda     #$03
        jsr     L7B16
        lda     #$01
        jmp     L67FD

L7AD4:  lda     $083C
        and     #$01
        bne     L7AF2
        lda     #OPC_BPL
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

;;; ??? to hires color mapping

;;; NOTE: These differ from the Applesoft Hires colors
HIRES_BLACK1 = 0
HIRES_VIOLET = 1
HIRES_GREEN  = 2
HIRES_WHITE1 = 3
;;; HIRES_BLACK2 = 4
HIRES_BLUE   = 5
HIRES_ORANGE = 6
;;; HIRES_WHITE2 = 7

;;; Notes:
;;; * land rendered as green (day)/black (night) separately
;;; * radar and 3D view use different entries ???
;;; * day/night use different entries???
;;; * palette bit not set when rendering lines
;;; 3D View:
;;; * 1st entry used for "black" buildings (day/night) / water color (night)
;;; * 3rd entry is used for water color (day)
;;; * 10th entry used for airplane wing/tail (day/night)
;;; * 16th entry used for "city" terrain (day/night)
;;; Radar:
;;; * third entry is used for water color
;;; * last entry used for runways
ToHiresColorTable:
        .byte   HIRES_BLACK1, HIRES_GREEN, HIRES_VIOLET, HIRES_GREEN
        .byte   HIRES_VIOLET, HIRES_BLACK1, HIRES_VIOLET, HIRES_VIOLET
        .byte   HIRES_BLACK1, HIRES_WHITE1, HIRES_BLACK1, HIRES_GREEN
        .byte   HIRES_VIOLET, HIRES_WHITE1, HIRES_VIOLET, HIRES_WHITE1

L7B07:  iny
        lda     ($8B),y
        tay
        lda     ToHiresColorTable,y
        jsr     L7B16
        lda     #$02
        jmp     L67FD

L7B16:  tax
        bpl     L7B1D
        ldx     #$5D
        bne     L7B26           ; always

L7B1D:  ldx     #OPC_ORA_abx
        bit     OrMaskTable1
        bne     L7B26
        ldx     #OPC_AND_abx
L7B26:  stx     L7982
        stx     L7A2E
        stx     L7A9A
        stx     L7A26
        LDXY    #OrMaskTable1
        bit     OrMaskTable1
        bne     L7B3F
        LDXY    #AndMaskTable1
L7B3F:  STXY    L7983
        STXY    L7A2F
        STXY    L7A9B
        STXY    L7A27
        tax
        bpl     L7B5E
        ldx     #OPC_EOR_abx
        bne     L7B67
L7B5E:  ldx     #OPC_ORA_abx
        bit     OrMaskTable2
        bne     L7B67
        ldx     #OPC_AND_abx
L7B67:  stx     L7976
        stx     L7A1A
        stx     L7A8E
        LDXY    #OrMaskTable2
        bit     OrMaskTable2
        bne     L7B7D
        LDXY    #AndMaskTable2
L7B7D:  STXY    L7977
        STXY    L7A1B
        STXY    L7A8F
        rts

ColorTableEven:
        .byte   $00, $2A, $55, $7F, $80, $AA, $D5, $FF

ColorTableOdd:
        .byte   $00, $55, $2A, $7F, $80, $D5, $AA, $FF

MapColorAndPrepRowRoutine:
        lda     $0876
        and     #$0F
        tay
        ldx     ToHiresColorTable,y

SetEvenAndOddColorsAndPrepRowRoutine:
        lda     ColorTableEven,x
        sta     ColorByteEven
        lda     ColorTableOdd,x
        sta     ColorByteOdd
        txa
        ldx     #OPC_ORA_abx
        bit     OrMaskTable1
        bne     :+
        ldx     #OPC_AND_abx
:       stx     L792D
        LDXY    #OrMaskTable1
        bit     OrMaskTable1
        bne     :+
        LDXY    #AndMaskTable1
:       STXY    L792E
        ldx     #OPC_ORA_abx
        bit     OrMaskTable2
        bne     :+
        ldx     #OPC_AND_abx
:       stx     L7921
        LDXY    #OrMaskTable2
        bit     OrMaskTable2
        bne     :+
        LDXY    #AndMaskTable2
:       STXY    L7922
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

;;; 7D80

        .byte   $00, $00, $01, $01, $02, $02, $03, $03
        .byte   $04, $04, $05, $05, $06, $07, $07, $08
        .byte   $08, $09, $09, $0A, $0A, $0B, $0B, $0C
        .byte   $0D, $0D, $0E, $0E, $0F, $0F, $10, $10
        .byte   $11, $11, $12, $13, $13, $14, $14, $15
        .byte   $15, $16, $16, $17, $17, $18, $18, $19
        .byte   $1A, $1A, $1B, $1B, $1C, $1C, $1D, $1D
        .byte   $1E, $1E, $1F, $20, $20, $21, $21, $22
        .byte   $22, $23, $23, $24, $24, $25, $26, $26
        .byte   $27, $27, $28, $28, $29, $29, $2A, $2A
        .byte   $2B, $2C, $2C, $2D, $2D, $2E, $2E, $2F
        .byte   $2F, $30, $30, $31, $31, $32, $33, $33
        .byte   $34, $34, $35, $35, $36, $36, $37, $37
        .byte   $38, $39, $39, $3A, $3A, $3B, $3B, $3C
        .byte   $3C, $3D, $3D, $3E, $3F, $3F, $40, $40
        .byte   $41, $41, $42, $42, $43, $43, $44, $45
        .byte   $00, $00, $00, $01, $01, $01, $02, $02
        .byte   $03, $03, $03, $04, $04, $05, $05, $05
        .byte   $06, $06, $07, $07, $07, $08, $08, $08
        .byte   $09, $09, $0A, $0A, $0A, $0B, $0B, $0C
        .byte   $0C, $0C, $0D, $0D, $0E, $0E, $0E, $0F
        .byte   $0F, $10, $10, $10, $11, $11, $11, $12
        .byte   $12, $13, $13, $13, $14, $14, $15, $15
        .byte   $15, $16, $16, $17, $17, $17, $18, $18
        .byte   $19, $19, $19, $1A, $1A, $1A, $1B, $1B
        .byte   $1C, $1C, $1C, $1D, $1D, $1E, $1E, $1E
        .byte   $1F, $1F, $20, $20, $20, $21, $21, $21
        .byte   $22, $22, $23, $23, $23, $24, $24, $25
        .byte   $25, $25, $26, $26, $27, $27, $27, $28
        .byte   $28, $29, $29, $29, $2A, $2A, $2A, $2B
        .byte   $2B, $2C, $2C, $2C, $2D, $2D, $2E, $2E
        .byte   $2E, $2F, $2F, $30, $30, $30, $31, $31

;;; ============================================================

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
        ror     $A2
        lda     $9F
        rol     a
        ror     $9F
        ror     $9E
        jmp     L7F7F

L7EBC:  sty     $E5
        lda     $32
        clc
        adc     #$51
        sta     $32
        bcc     L7EC9
        inc     $33
L7EC9:  LDAX    $4A
        STAX    $18
        lda     $4C
        sta     $1A
        LDAX    $4D
        STAX    $1B
        lda     $4F
        sta     $1D
        LDAX    $50
        STAX    $1E
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
        jmp     AddTo8B

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
        jsr     AddTo8B
        ldx     #$9E
        ldy     #$78
        lda     #$A9
        jsr     ZPScale
        ldx     #$A0
        ldy     #$7E
        lda     #$AB
        jsr     ZPScale
        LDAX    $A2
        STAX    $C2
        LDAX    $84
        STAX    $C4
        jsr     ZPScale::ScaleC2ByC4
        jsr     L8234
        ldx     #$9E
        ldy     #$7A
        lda     #$A9
        jsr     ZPScale
        ldx     #$A0
        ldy     #$80
        lda     #$AB
        jsr     ZPScale
        LDAX    $A2
        STAX    $C2
        LDAX    $86
        STAX    $C4
        jsr     ZPScale::ScaleC2ByC4
        jsr     L8234
        ldx     #$9E
        ldy     #$7C
        lda     #$A9
        jsr     ZPScale
        ldx     #$A0
        ldy     #$82
        lda     #$AB
        jsr     ZPScale
        LDAX    $A2
        STAX    $C2
        LDAX    $88
        STAX    $C4
        jsr     ScaleC2ByC4
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
        iny
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



;;; ============================================================
;;; Draw Artificial Horizon

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

;;; ============================================================

.proc UpdateArtificialHorizon
        ldx     #$06
        lda     $6D
        bpl     L8280
        ldx     #HIRES_BLUE
L8280:  jsr     SetEvenAndOddColorsAndPrepRowRoutine
        lda     #$8D
        sta     $E7
        lda     #$1F
        jsr     L8387

        lda     $6D
        clc
        adc     #$20
        cmp     #$40
        bcc     L8298
        jmp     ApplyArtificialHorizonMasks

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
L82FD:  ldx     #HIRES_BLUE
        lda     $6D
        bpl     L830B
        lda     $8A
        eor     #$FF
        sta     $8A
        ldx     #HIRES_ORANGE
L830B:  jsr     SetEvenAndOddColorsAndPrepRowRoutine

        ;; Modify routines
        lda     #OPC_RTS
        sta     TidySkyGroundEdgeInRow

        lda     #OPC_JMP_abs
        sta     DrawSkyGroundRow
        lda     #<AltDrawSkyGroundRow
        sta     DrawSkyGroundRow+1
        lda     #>AltDrawSkyGroundRow
        sta     DrawSkyGroundRow+2

        jsr     FillMixedViewportRows

        ;; Restore routines
        lda     #OPC_STX_zp
        sta     TidySkyGroundEdgeInRow

        lda     #OPC_LDY_zp
        sta     DrawSkyGroundRow
        lda     #$E7
        sta     DrawSkyGroundRow+1
        lda     #OPC_LDA_aby
        sta     DrawSkyGroundRow+2

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
L8365:  jmp     ApplyArtificialHorizonMasks

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
L8384:  jmp     ApplyArtificialHorizonMasks

L8387:  sta     $B5
        ldx     $E7
L838B:  lda     HiresTableLo,x
        sta     HiresRowPtr
        lda     HiresTableHi,x
        sta     HiresRowPtr+1
        ldy     #$08
        lda     ColorByteOdd
        sta     (HiresRowPtr),y
        iny
        iny
        sta     (HiresRowPtr),y
        iny
        iny
        sta     (HiresRowPtr),y
        ldy     #$09
        lda     ColorByteEven
        sta     (HiresRowPtr),y
        iny
        iny
        sta     (HiresRowPtr),y
        iny
        iny
        sta     (HiresRowPtr),y
        dex
        dec     $B5
        bpl     L838B
        rts
.endproc

;;; ============================================================

;;; Apply AND / OR mask to artificial horizon

.proc ApplyArtificialHorizonMask
        ldx     #$6E
row:
        lda     HiresTableLo,x
        sta     HiresRowPtr
        lda     HiresTableHi,x
        sta     HiresRowPtr+1
        stx     $B0
        ldx     #$00
        ldy     #$08
col:
        lda     ($2D,x)
MaskOpCode:
        ora     (HiresRowPtr),y ; self-modified (AND/ORA)
        sta     (HiresRowPtr),y
        inc     $2D
        bne     :+
        inc     $2E
:       iny
        cpy     #$0E
        bne     col
        ldx     $B0
        inx
        cpx     #$8E
        bne     row
        rts
.endproc

;;; ============================================================

.proc ApplyArtificialHorizonMasks
        lda     #>HorizonANDMask
        sta     $2E
        lda     #<HorizonANDMask
        sta     $2D
        lda     #OPC_AND_izy
        sta     ApplyArtificialHorizonMask::MaskOpCode
        jsr     ApplyArtificialHorizonMask

        lda     #>HorizonORAMask
        sta     $2E
        lda     #<HorizonORAMask
        sta     $2D
        lda     #OPC_ORA_izy
        sta     ApplyArtificialHorizonMask::MaskOpCode
        jsr     ApplyArtificialHorizonMask

        rts
.endproc

;;; ============================================================

;;; `DrawSkyGroundRow` sometimes turned into JMP here
.proc AltDrawSkyGroundRow
        stx     $B2
        ldy     $E7
        lda     HiresTableLo,y
        sta     HiresRowPtr
        lda     HiresTableHi,y
        sta     HiresRowPtr+1
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
L8425:  jsr     DrawColorSpan
        ldx     $B2
        rts
.endproc

;;; ============================================================

;;; Draw viewport lines that have mix of sky+ground

.proc FillMixedViewportRows
        ldx     #$E8
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
        jsr     DrawSkyGroundRow
        jsr     TidySkyGroundEdgeInRow
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
        jsr     DrawSkyGroundRow
        jsr     TidySkyGroundEdgeInRow
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
        jsr     DrawSkyGroundRow
        jsr     TidySkyGroundEdgeInRow
L84B0:  dec     $93
        bne     L849A
        rts
.endproc

;;; ============================================================

.proc L84B5
        lda     $FB
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
        lda     #$0F
        bne     L84DE
L84DC:  lda     #$00
L84DE:  sta     $AF
        lda     $0A40
        ldx     HiresPageDelta
        bpl     L84EA
        lda     $0A41
L84EA:  cmp     $AF
        bne     L84EF
        rts

L84EF:  jsr     L8505
        lda     $AF

::L84F4 := *
        ldx     HiresPageDelta
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
        lda     $0DE0,x
        clc
        adc     #$0C
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
.endproc

        ;; Bitmap for artificial horizon

        ;; stride is 6 bytes
        ;; height is 32 rows

        ;; $854D - ORA mask
HorizonORAMask:
        PIXELS "...#..........##.....#.....##..........#.."
        PIXELS "..#.........##......###......##.........#."
        PIXELS ".##.......##.......#####.......##.......##"
        PIXELS "##......##.......................##......#"
        PIXELS "#......#..........................##......"
        PIXELS "......#.............................#....."
        PIXELS ".....#...............................#...."
        PIXELS "....#.................................#..."
        PIXELS "...##.................................##.."
        PIXELS "...#...................................#.."
        PIXELS "...#...............#####...............#.."
        PIXELS "..#.....................................#."
        PIXELS "..#.....................................#."
        PIXELS "..#................#####................#."
        PIXELS "..#.....................................#."
        PIXELS "..#.....................................#."
        PIXELS "..#.......#########..#..#########.......#."
        PIXELS "..#.....................................#."
        PIXELS "..#.....................................#."
        PIXELS "..#................#####................#."
        PIXELS "..#....................................#.."
        PIXELS "...#...................................#.."
        PIXELS "...#...............#####...............#.."
        PIXELS "....#.................................#..."
        PIXELS "....#.................................#..."
        PIXELS ".....#...............................#...."
        PIXELS ".....##.............................##...."
        PIXELS "......#.............................#....."
        PIXELS "#......#...........................#......"
        PIXELS ".#......##.........####..........##......#"
        PIXELS "..#.......##.....##....##......##.......##"
        PIXELS "..##.......######........######........##."

HorizonANDMask:
        PIXELS "...#..........###############..........#.."
        PIXELS "..#.........###################.........#."
        PIXELS ".##.......#######################.......##"
        PIXELS "##......###########################......#"
        PIXELS "#......#############################......"
        PIXELS "......###############################....."
        PIXELS ".....#################################...."
        PIXELS "....###################################..."
        PIXELS "...#####################################.."
        PIXELS "...#####################################.."
        PIXELS "...#####################################.."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..#######################################."
        PIXELS "..######################################.."
        PIXELS "...#####################################.."
        PIXELS "...#####################################.."
        PIXELS "....###################################..."
        PIXELS "....###################################..."
        PIXELS ".....#################################...."
        PIXELS ".....#################################...."
        PIXELS "......###############################....."
        PIXELS "#......#############################......"
        PIXELS ".#......###########################......#"
        PIXELS "..#.......#########....##########.......##"
        PIXELS "..##.......######........######........##."

;;; ============================================================

        ;; Uninitialized memory???

        .byte   $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00, $FF, $FF, $00, $00, $FF, $FF
        .byte   $00, $00

;;; ============================================================

        jmp     L8AC4

        ;; Called from chunk3
TogglePauseRelay:
        jmp     TogglePause

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

Set3DigitStringRelay:
        jmp     Set3DigitString

L8776:  jmp     LA63A

        jmp     LA6F9

        jmp     L915D

L877F:  jsr     LA7F4
L8782:  lda     $33
        clc
        adc     #$0D
        sta     $33
        lda     EditModeFlag
        ora     $08A7
        beq     L8794
        jsr     LA7E8
L8794:  jsr     LA7F4
        lda     SlewMode
        beq     L87A2
        jsr     L9B47
        jmp     L87A8

L87A2:  jsr     L97BF
L87A5:  jsr     NoOp            ; 64k: Patched to JSR `LF9B5`
L87A8:  jsr     LA60C
        jsr     LA61B
        jsr     L6000
        ldx     #$00
        lsr     $089A
        bcc     L87BE
        lda     $0899
        bne     L87BE
        inx
L87BE:  jsr     L89B6           ; 64k: Patched to JSR `LDDFC`
        jsr     L6003
        jsr     L6006
P64K_9: jsr     NoOp            ; 64k: Patched to JSR `LF7E2`
        jsr     LA1E2
        jsr     DrawRPM
        jsr     LA14D
        jsr     LA1B8
        jsr     L8943
        jsr     L9C6E
        jsr     L6012
        jsr     DrawHeading
        jsr     DrawMagCompass
P64K_6: jsr     NoOp            ; 64K: Patched to JSR `LDD7A`
        lda     WW1AceMode
        beq     :+
        jsr     LA7EE
:
P64K_3: jsr     NoOp            ; 64K: Patched to JSR `DrawViewOverlays`
        jsr     L9F6B
        jsr     L9FE9
P64K_8: jsr     NoOp            ; 64k: Patched to JSR `HideOrShowInstruments`
        lda     DemoMode
        beq     L8804
P64K_C: jsr     DemoMode48K     ; 64k: Patched to JSR `DemoMode64K`
L8804:  lda     $2B
        lsr     a
        bcs     L8836
        lsr     a
        bcs     L882D
        jsr     LA5E1
        jsr     MaybeBootDOS
        jsr     UpdateFuelTankGauges::Left
P64K_B: jsr     NoOp            ; 64k: Patched to JSR `LFA56`
        lda     $2B
        and     #$04
        beq     L8863
        jsr     DrawDME
        jsr     L9DDA
        jsr     L9DFB
P64K_1: jsr     NoOp            ; 64k: Patched to JSR `LDC3D`
        jmp     L8863

L882D:  jsr     UpdateOilTempAndPressureGauges::Temp
        jsr     L9AA3
        jmp     L8863

L8836:  lsr     a
        bcs     L8842
        jsr     UpdateFuelTankGauges::Right
P64K_4: jsr     NoOp            ; 64k: Patched to JSR `UpdateAltimeter10K`
        jmp     L8848

L8842:  jsr     UpdateOilTempAndPressureGauges::Pressure
P64K_5: jsr     NoOp            ; 64k: Patched to JSR `LDC59`
L8848:  jsr     LA0D0
        jsr     LA139
        jsr     LA021
P64K_2: jsr     NoOp            ; 64k: Patched to JSR `UpdateADFIndicator`
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
        jsr     ReadPaddlesIfButtonDown
L8871:  inc     $2B
        jmp     L8782

;;; Keyboard input ring buffer

KeyBufWritePos: .byte   0       ; write position
KeyBufReadPos:  .byte   0       ; read position
KeyBuffer:      .byte   $FF, $FF, $00, $00, $BF, $FF, $00, $00


L8880:  brk
L8881:  .byte   $FF
L8882:  brk
L8883:  brk
        brk
        brk

;;; Instrument panel displays

msg_heading:            MESSAGE $A1, $20, "000", str_heading
msg_recip:              MESSAGE $B1, $20, "000", str_recip
msg_magcompass:         MESSAGE $5F, $65, "000", str_magcompass
msg_com1:               MESSAGE $6C, $69, "2485", str_com1
msg_nav1:               MESSAGE $7A, $69, "1000", str_nav1
msg_nav2:               MESSAGE $88, $69, "1135", str_nav2
msg_vor1_course:        MESSAGE $6C, $54, "000", str_vor1_course
msg_vor1_recip:         MESSAGE $8C, $54, "000", str_vor1_recip
msg_vor2_course:        MESSAGE $97, $54, "000", str_vor2_course
msg_vor2_recip:         MESSAGE $B7, $54, "000", str_vor2_recip
msg_xpndr:              MESSAGE $88, $7B, "1200", str_xpndr
msg_rpm:                MESSAGE $B3, $7B, "2370", str_rpm
msg_clock_hh:           MESSAGE $91, $72, "00", str_clock_hh
msg_clock_mm:           MESSAGE $91, $7B, "00", str_clock_mm
msg_clock_ss:           MESSAGE $91, $84, "00", str_clock_ss
msg_dme:                MESSAGE $7A, $7D, "000", str_dme
msg_lights_on:          MESSAGE $9A, $87, "1"
msg_lights_off:         MESSAGE $9A, $87, "O"
msg_carbheat_on:        MESSAGE $BB, $6E, "HEAT"
msg_carbheat_off:       MESSAGE $BB, $6E, "C.H."

        ;; Indexed, 8 bytes apart
msg_vor_flags:
        ;; VOR1 flag
        MESSAGE $82, $54, "OFF"
        .byte   $07, $08
        MESSAGE $82, $54, "TO "
        .byte   $07, $08
        MESSAGE $82, $54, "FR "
        .byte   $07, $08

        ;; VOR2 flag
        MESSAGE $AD, $54, "OFF"
        .byte   $07, $08
        MESSAGE $AD, $54, "TO "
        .byte   $07, $08
        MESSAGE $AD, $54, "FR "
        .byte   $07, $08

msg_omi:  MESSAGE $6C, $7D, "XX", str_omi

L8933:  jsr     DrawNav1
        jsr     DrawNav2
        jsr     DrawCom1
        jsr     DrawXPNDR
        jsr     L8AC4
        rts

L8943:  LDAX    $0843
        ldy     $0A12
        cpy     #$0A
        bcs     L8956
        sta     $0A36
        stx     $0A37
L8956:  jsr     L8959
L8959:  ldy     #$00
        LDAX    $0843
        cpx     $0A37
        bcc     L8971
        bne     L8972
        cmp     $0A36
        bcc     L8971
        .byte   $F0
        .byte   $3A
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

msg_crash2:     MESSAGE $32, $14, "CRASH !!!"

L89B6:  lda     $0834
        bne     :+
        rts

:       lda     #$00
        sta     $0834
        jsr     ClearViewportsToBlack
        CALLAX  DrawMessageWhite, msg_crash2
        ldx     #$01
        jmp     L9093

;;; Ctrl+P / P key
TogglePause:
        lda     EditModeFlag
        pha
        inc     $08BB
        lda     #$01
        sta     EditModeFlag
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
        sta     EditModeFlag
        txa
        and     #$7F
        lsr     $08BB
L8A05:  rts

;;; Course Plotter replaces this with a NOP...
MaybeBootDOS:
        rts
;;; Which falls into this
        ror     RebootFlag
        bcs     L8A05           ; ignore!
        lda     RdROMWrRAM1
        lda     RdROMWrRAM1
        jmp     (RebootVector)

L8A15:  sbc     #$11
        sta     $33
        lda     SoundMode
        beq     L8A26
        lda     $099B
        beq     L8A26
        lda     SPKR
L8A26:  inc     $34

        lda     KBD
        bpl     :+
        and     #$7F
        jsr     WriteKeyBuffer
        sta     KBDSTRB
:
        lda     KeyBufReadPos
        cmp     KeyBufWritePos
        beq     L8A45

        lda     $08B0
        bne     L8A45
        jsr     MaybeProcessKey

L8A45:  lda     $097A
        beq     L8A4D
        jsr     ReadPaddleDeltas
L8A4D:  inc     $31
        lda     $31
        lsr     a
        bcc     L8A55
L8A54:  rts

L8A55:  lda     $08BB
        bne     L8A54
        lda     InputCounter
        beq     L8A62
        dec     InputCounter
L8A62:  jsr     L93CA
        jsr     UpdateAirspeedIndicator
        jsr     UpdateVerticalSpeedIndicator
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

        ;; Update clock seconds display
        jsr     CheckForAbort
        txa
        ldx     #'0'-1
:       inx
        sec
        sbc     #10
        bcs     :-
        clc
        adc     #'0'+10
        stx     str_clock_ss
        sta     str_clock_ss+1
        CALLAX  DrawMessageOrange, msg_clock_ss

        ;; ???
        lda     $08F0
        bne     NoOp
L8AC4:  jsr     CheckForAbort

        ;; Update clock minutes display
        lda     $0955
        ldx     #'0'-1
:       inx
        sec
        sbc     #10
        bcs     :-
        clc
        adc     #'0'+10
        stx     str_clock_mm
        sta     str_clock_mm+1
        CALLAX  DrawMessageOrange, msg_clock_mm

        ;; Update clock hours display
        lda     $0954
        ldx     #'0'-1
:       inx
        sec
        sbc     #10
        bcs     :-
        clc
        adc     #'0'+10
        stx     str_clock_hh
        sta     str_clock_hh+1
        CALLAX  DrawMessageOrange, msg_clock_hh

NoOp:   rts

LastElevatorPosition:   .byte   0
LastAileronPosition:    .byte   0


;;; Indexed by ASCII code, $00 through $5F
KeyTable:

        .addr   Ignore          ; Ctrl+@
        .addr   ADF             ; Ctrl+A
        .addr   AltimeterAdjust ; Ctrl+B
        .addr   ComRadio        ; Ctrl+C
        .addr   HeadingAdjust   ; Ctrl+D
        .addr   LogSceneryDisk  ; Ctrl+E
        .addr   FuelTankSelect  ; Ctrl+F
        .addr   Ignore          ; Ctrl+G
        .addr   LessThrottle    ; Ctrl+H Left Arrow
        .addr   CarbHeat        ; Ctrl+I
        .addr   Ignore          ; Ctrl+J Down Arrow
        .addr   Ignore          ; Ctrl+K Up Arrow
        .addr   ToggleLights    ; Ctrl+L
        .addr   MagsAndMixture  ; Ctrl+M Return
        .addr   NavRadio        ; Ctrl+N
        .addr   Ignore          ; Ctrl+O
        .addr   TogglePause     ; Ctrl+P
        .addr   Ignore          ; Ctrl+Q
        .addr   Ignore          ; Ctrl+R
        .addr   Ignore          ; Ctrl+S
        .addr   Transponder     ; Ctrl+T
        .addr   MoreThrottle    ; Ctrl+U Right Arrow
        .addr   VORS            ; Ctrl+V
        .addr   Ignore          ; Ctrl+W
        .addr   ReadModeFromDisk    ; Ctrl+X
        .addr   Ignore          ; Ctrl+Y
        .addr   Ignore          ; Ctrl+Z
        .addr   EditMode        ; Ctrl+[ Escape
        .addr   Ignore          ; Ctrl+\
        .addr   Ignore          ; Ctrl+]
        .addr   Ignore          ; Ctrl+^
        .addr   Ignore          ; Ctrl+_
        .addr   BrakesOrGuns    ; Space
        .addr   Ignore          ; !
        .addr   Ignore          ; "
        .addr   Ignore          ; #
        .addr   Ignore          ; $
        .addr   Ignore          ; %
        .addr   Ignore          ; &
        .addr   Ignore          ; '
        .addr   Ignore          ; (
        .addr   Ignore          ; )
        .addr   Ignore          ; *
        .addr   ReadModeFromLibrary ; +
        .addr   KeyDecrease     ; , (a.k.a. unshifted <)
        .addr   Ignore          ; -
        .addr   KeyIncrease     ; . (a.k.a. unshifted >)
        .addr   ToggleThrottle  ; /
        .addr   Ignore          ; 0
        .addr   Select1         ; 1
        .addr   Select2         ; 2
        .addr   MagnetosLeft    ; 3
        .addr   SelectRadarView ; 4
        .addr   Select3DView    ; 5
        .addr   Ignore          ; 6
        .addr   Ignore          ; 7
        .addr   SlewPitchUp     ; 8
        .addr   SlewPitchDown   ; 9
        .addr   Ignore          ; :
        .addr   Ignore          ; ;
        .addr   Ignore          ; <
        .addr   Ignore          ; =
        .addr   Ignore          ; >
        .addr   Ignore          ; ?
        .addr   Ignore          ; @
        .addr   ADF             ; A
        .addr   YokeUp          ; B
        .addr   RudderLeft      ; C
        .addr   L91F3           ; D
        .addr   Ignore          ; E
        .addr   YokeLeft        ; F
        .addr   YokeCenter      ; G
        .addr   YokeRight       ; H
        .addr   Ignore          ; I
        .addr   Ignore          ; J
        .addr   ExitDemoMode    ; K
        .addr   ToggleLights    ; L
        .addr   RudderRight     ; M
        .addr   FlapsDown       ; N
        .addr   Ignore          ; O
        .addr   TogglePause     ; P
        .addr   CoursePlotting  ; Q
        .addr   TrimDown        ; R
        .addr   SaveModeToLibrary ; S
        .addr   YokeDown        ; T
        .addr   Ignore          ; U
        .addr   TrimUp          ; V
        .addr   DeclareWar      ; W
        .addr   DropBomb        ; X
        .addr   FlapsUp         ; Y
        .addr   SlewResetAngles ; Z
        .addr   Ignore          ; [
        .addr   Ignore          ; \
        .addr   Ignore          ; ]
        .addr   Ignore          ; ^
        .addr   Ignore          ; _

;;; ============================================================

;;; $8BC0

        pha
        txa
        pha
        lda     KBD
        bpl     :+
        and     #$7F
        jsr     WriteKeyBuffer
        sta     KBDSTRB
:
        pla
        tax
        pla
        rts

;;; ============================================================

;;; Output: C=0 if buffer empty, otherwise C=1, A=key
.proc ReadKeyBuffer
        lda     KeyBufReadPos
        cmp     KeyBufWritePos
        bne     :+
        clc
        rts

:       inc     KeyBufReadPos
        lda     KeyBufReadPos
        and     #$07
        tax
        lda     KeyBuffer,x
        sec
        rts
.endproc

;;; ============================================================

;;; Input: A = key (high bit stripped)

.proc WriteKeyBuffer
        pha
        inc     KeyBufWritePos
        lda     KeyBufWritePos
        and     #$07
        tax
        pla
        sta     KeyBuffer,x
        rts
.endproc

;;; ============================================================

Paddle1Reading: .byte   $40
Paddle0Readng:  .byte   $40

.proc ReadPaddleDeltas
        jsr     ReadPaddles
        tya
        sec
        sbc     Paddle1Reading
        jsr     MapPaddleDelta
        pha
        txa
        sec
        sbc     Paddle0Readng
        jsr     MapPaddleDelta
        cmp     #$80
        ror     a
        jsr     L9259
        pla
        cmp     #$80
        ror     a
        jmp     L91D6
.endproc

;;; ============================================================

;;; If either button is down, read paddles.

.proc ReadPaddlesIfButtonDown
        lda     BUTN0
        ora     BUTN1
        bpl     :+
        jsr     ReadPaddles
        sty     Paddle1Reading
        stx     Paddle0Readng
:       rts
.endproc

;;; ============================================================

.proc ReadPaddles
        ldy     #$00
        ldx     #$00
        sta     PTRIG
loop:
        lda     PADDL0
        bpl     L8C49
        inx
        bne     L8C41
        beq     L8C53
L8C41:  lda     PADDL1
        bpl     L8C56
        iny
        bne     loop
L8C49:  nop
        nop
        lda     PADDL1
        bpl     L8C5A
        iny
        bne     loop
L8C53:  pla
        pla
        rts

L8C56:  nop
        jmp     loop

L8C5A:  rts

.endproc

;;; ============================================================

;;; Uses: $C6

.proc MapPaddleDelta
        sta     $C6
        clc
        adc     $C6
        bvc     L8C69
        bpl     L8C67
        lda     #$7F
        rts

L8C67:  lda     #$81
L8C69:  rts
.endproc

;;; ============================================================

.proc DemoMode48K
        lda     YokeVertPos
        cmp     #$18
        bcs     :+
        jsr     YokeUp
:       jsr     MoreThrottle
        rts
.endproc

;;; ============================================================

.proc MaybeProcessKey
        jsr     ReadKeyBuffer
        bcc     :+
        ldx     EditModeFlag
        beq     L8C88
        ora     #$80
        sta     $08B1
:       rts

L8C88:  cmp     #'`'            ; ignore lower-case range
        bcc     :+
        rts

:       asl     a               ; *= 2
        clc
        adc     #<KeyTable
        sta     @mod+1
        lda     #>KeyTable
        adc     #$00
        sta     @mod+2
@mod:   jmp     ($0000)         ; self-modified
.endproc

;;; ============================================================

.proc EditMode
        lda     #$01
        sta     EditModeFlag
        rts
.endproc

;;; 1 key
;;; Magnetos: off
;;; Nav Radio / VORS: Select 1
Select1:
        ldx     #$01
        lda     InputMode
        cmp     #$03            ; Magnetos ?
        bne     L8CB2
        lda     #$00
        ldx     #$00
        beq     L8CC6           ; always
L8CB2:  cmp     #$06            ; Nav Radio (upper) ?
        beq     L8CBA
        cmp     #$07            ; Nav Radio (lower) ?
        bne     L8CBE
L8CBA:  stx     $0A63
        rts

L8CBE:  cmp     #$0C            ; VORS ?
        bne     L8CC5
        stx     $0A71
L8CC5:  rts

L8CC6:  ldy     #$00            ; 64k: Patched to JMP `LE2B3`
        sty     InputMode
        rts

;;; 2 key
;;; Magnetos: Right
;;; Nav Radio / VORS: Select 2
Select2:
        lda     InputMode
        ldx     #$02
        cmp     #$03            ; Magnetos
        bne     L8CD9
        lda     #$01
        ldx     #$01
        bne     L8CC6           ; always

L8CD9:  cmp     #$06            ; Nav Radio (upper digits)
        beq     L8CE1
        cmp     #$07            ; Nav Radio (lower digits)
        bne     L8CE5
L8CE1:  stx     $0A63
        rts

L8CE5:  cmp     #$0C
        bne     L8CEC
        stx     $0A71
L8CEC:  rts

;;; 3 key
MagnetosLeft:
        lda     #$01
        ldx     #$02
        bne     L8CC6           ; always

;;; 8 key
SlewPitchUp:
        dec     SlewPitchRate
        rts

;;; 9 key
SlewPitchDown:
        inc     SlewPitchRate
        rts

;;; ???
        lda     #$00
        ldx     #$05
        bne     L8CC6

;;; , key
KeyDecrease:
        lda     InputMode       ; 64k: patched to JSR `KeyDecreasePatch`
        nop
        ldx     #$00
        stx     InputCounter
        sec
        sbc     #$02
        bne     L8D20           ; not Radar View

        ;; Radar View - Zoom Out
        sec
        rol     ZoomLevel
        rol     ZoomLevel+1
        rol     ZoomLevel+2
        rol     ZoomLevel+2
        clc
        ror     ZoomLevel+2
        rts

L8D20:  ldx     WW1AceMode
        beq     L8D28
        jmp     L8DEA

L8D28:  sec
        sbc     #$02
        tax
        bne     L8D4F

        ;; Com Radio (upper digits)
        lda     str_com1
        ldx     str_com1+1
        cmp     #'1'
        bne     L8D42
        cpx     #'8'
        bne     L8D42
        lda     #'3'
        ldx     #'5'
        bne     L8D4C
L8D42:  dex
        cpx     #'0'-1
        bne     L8D4C
        ldx     #'9'
        sec
        sbc     #1
L8D4C:  jmp     L8E73

L8D4F:  dex
        bne     L8D5E

        ;; Com Radio (lower digits)
        lda     str_com1+2
        ldx     str_com1+3
        jsr     DecComOrNavLowerDigits
        jmp     L8E88

L8D5E:  dex
        bne     L8D80

        ;; Nav Radio (upper digits)
        lda     $0A63
        cmp     #$02
        beq     L8D74
        lda     str_nav1
        ldx     str_nav1+1
        jsr     DecNavDigits
        jmp     L8EA4

L8D74:  lda     str_nav2
        ldx     str_nav2+1
        jsr     DecNavDigits
        jmp     L8EB6

L8D80:  dex
        bne     L8DA2

        ;; Nav Radio (lower digits)
        lda     $0A63
        cmp     #$02
        beq     L8D96
        lda     str_nav1+2
        ldx     str_nav1+3
        jsr     DecComOrNavLowerDigits
        jmp     L8ED2

L8D96:  lda     str_nav2+2
        ldx     str_nav2+3
        jsr     DecComOrNavLowerDigits
        jmp     L8EE4

L8DA2:  dex
        cpx     #$04
        bcs     L8DB9
        lda     str_xpndr,x
        cmp     #'0'
        bne     L8DB0
        lda     #'8'
L8DB0:  sec
        sbc     #1
        sta     str_xpndr,x
        jmp     DrawXPNDR

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
L8DD5:  jmp     DrawVOR1

L8DD8:  dec     L8883
        lda     L8883
        cmp     #$FF
        bne     L8DE7
        lda     #$B3
        sta     L8883
L8DE7:  jmp     DrawVOR2

L8DEA:  lda     InputMode
        cmp     #$10            ; Fuel Tank Select
        bne     L8DFB


        lda     $0998
        beq     L8DF8
        dec     $0998
L8DF8:  jmp     UpdateFuelTankIndicator

L8DFB:  rts

.proc DecComOrNavLowerDigits
        cpx     #'0'
        bne     L8E09
        ldx     #'5'
        cmp     #'0'
        bne     L8E0C
        lda     #'9'
        rts

L8E09:  ldx     #'0'
        rts

L8E0C:  sec
        sbc     #1
        rts
.endproc

.proc DecNavDigits
        cmp     #'0'
        bne     :+
        cpx     #'8'
        bne     :+
        lda     #'1'
        ldx     #'7'
        rts
:
        dex
        cpx     #'0'-1
        bne     :+
        ldx     #'9'
        lda     #'0'
:
        rts
.endproc

;;; . key
KeyIncrease:                    ; 64k: Patched to JSR `KeyIncreasePatch`
        lda     InputMode
        nop
        ldx     #$00
        stx     InputCounter
        sec
        sbc     #$02
        bne     L8E47           ; not Radar View

        ;; Radar View - Zoom In
        clc
        ror     ZoomLevel+2
        ror     ZoomLevel+1
        ror     ZoomLevel

        lda     #$1F
        ora     ZoomLevel
        sta     ZoomLevel
        rts

L8E47:  ldx     WW1AceMode
        beq     L8E4F
        jmp     L8F35

L8E4F:  sec
        sbc     #$02
        tax
        bne     L8E7C
        lda     str_com1
        ldx     str_com1+1
        cmp     #'3'
        bne     L8E69
        cpx     #'5'
        bne     L8E69
        lda     #'1'
        ldx     #'8'
        bne     L8E73
L8E69:  inx
        cpx     #'9'+1
        bne     L8E73
        ldx     #'0'
        clc
        adc     #1
L8E73:  sta     str_com1
        stx     str_com1+1
        jmp     L8E8E

L8E7C:  dex
        bne     L8E91
        lda     str_com1+2
        ldx     str_com1+3
        jsr     IncComOrNavLowerDigits
L8E88:  sta     str_com1+2
        stx     str_com1+3
L8E8E:  jmp     DrawCom1

L8E91:  dex
        bne     L8EBF
        lda     $0A63
        cmp     #$02
        beq     L8EAD
        lda     str_nav1
        ldx     str_nav1+1
        jsr     IncNavDigits
L8EA4:  sta     str_nav1
        stx     str_nav1+1
        jmp     DrawNav1

L8EAD:  lda     str_nav2
        ldx     str_nav2+1
        jsr     IncNavDigits
L8EB6:  sta     str_nav2
        stx     str_nav2+1
        jmp     DrawNav2

L8EBF:  dex
        bne     L8EED
        lda     $0A63
        cmp     #$02
        beq     L8EDB
        lda     str_nav1+2
        ldx     str_nav1+3
        jsr     IncComOrNavLowerDigits
L8ED2:  sta     str_nav1+2
        stx     str_nav1+3
        jmp     DrawNav1

L8EDB:  lda     str_nav2+2
        ldx     str_nav2+3
        jsr     IncComOrNavLowerDigits
L8EE4:  sta     str_nav2+2
        stx     str_nav2+3
        jmp     DrawNav2

L8EED:  dex
        cpx     #$04
        bcs     L8F04
        lda     str_xpndr,x
        cmp     #'7'
        bne     L8EFB
        lda     #'0'-1
L8EFB:  clc
        adc     #$01
        sta     str_xpndr,x
        jmp     DrawXPNDR

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
L8F20:  jmp     DrawVOR1

L8F23:  inc     L8883
        lda     L8883
        cmp     #$B4
        bne     L8F32
        lda     #$00
        sta     L8883
L8F32:  jmp     DrawVOR2

L8F35:  lda     InputMode
        cmp     #$10
        bne     L8F46
        lda     $0998
        bne     L8F43
        inc     $0998
L8F43:  jsr     UpdateFuelTankIndicator
L8F46:  rts

;;; A = 10s digit, X = 1s digit
.proc IncComOrNavLowerDigits
        cpx     #'5'
        bne     L8F53
        ldx     #'0'
        cmp     #'9'
        bne     L8F56
        txa
        rts

L8F53:  ldx     #'5'
        rts

L8F56:  ldx     #'0'
        clc
        adc     #1
        rts
.endproc

;;; A = 10s digit, X = 1s digit
.proc IncNavDigits
        cmp     #'1'
        bne     :+
        cpx     #'7'
        bne     :+
        lda     #'0'
        inx
        rts
:
        inx
        cpx     #'9'+1
        bne     :+
        ldx     #'0'
        clc
        adc     #$01
:       rts
.endproc

;;; W key
DeclareWar:
        lda     #$01
        ora     WarDeclared
        sta     WarDeclared
        rts

        rts                     ; ???

Transponder:
        lda     SlewMode
        beq     ReadModeFromDisk
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
        LDAX    $70
        STAX    $09E4
        rts

;;; Ctrl+X
ReadModeFromDisk:
        lda     InputCounter
        beq     L8FBE
        lda     InputMode
        cmp     #$08
        bcc     L8FBE
        cmp     #$0C
        bcs     L8FBE
        adc     #$01
        bne     L8FC0
L8FBE:  lda     #$08            ; Transponder
L8FC0:  jmp     SetInputModeAndCounter

;;; Ctrl+A / A key
ADF:    nop                     ; 64k: Patched to JMP `ADFKeyboardHook`
        nop
        nop

;;; Ctrl+B
AltimeterAdjust:
        lda     #$00
        sta     $099E
        sta     $099F
        sta     $09A0
        sta     $09A1
        rts

;;; Ctrl+D
HeadingAdjust:
        LDAX    $08B2
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

;;; Ctrl+I
CarbHeat:
        lda     $0A58
        eor     #$FF
        sta     $0A58
        jmp     DrawCarbHeatAndLights

;;; K key
ExitDemoMode:
        lsr     DemoMode
        rts

;;; Ctrl+L / L key
ToggleLights:
        lda     PanelLights
        eor     #$FF
        sta     PanelLights
        jmp     DrawCarbHeatAndLights

;;; X key
DropBomb:
        lda     WW1AceMode
        cmp     #$01
        bne     :+
        lda     WW1AceBombsStr
        cmp     #'0'
        beq     :+
        lda     $0A56
        ora     $0A57
        bne     :+
        dec     WW1AceBombsStr
        LDAX    $0A39
        STAX    $0A56
:       rts


;;; Ctrl+C
ComRadio:
        lda     #$01            ; ???
        lda     InputCounter
        beq     :+
        lda     InputMode
        cmp     #$04            ; Com Radio (upper digits)
        bne     :+
        inc     InputMode       ; set to lower digits
        rts
:
        cmp     #$05            ; lower digits?
        bne     :+
        inc     $0909
:       lda     #$04            ; upper digits
        bne     SetInputModeAndCounter

;;; Ctrl+V
VORS:
        lda     #$0C            ; VORS
        sta     InputMode
        rts

;;; Ctrl+N
NavRadio:
        lda     InputCounter
        beq     L906F
        lda     InputMode
        cmp     #$06            ; Nav Radio (upper digits)
        bne     L906F
        inc     InputMode       ; set to lower digits
        rts

L906F:  lda     #$06            ; upper digits

SetInputModeAndCounter:
        sta     InputMode
        lda     #$03
        sta     InputCounter
        rts

;;; Ctrl+M
MagsAndMixture:
        lda     #$03            ; Magnetos / Fuel Mixture
        sta     InputMode
        rts

;;; Space
BrakesOrGuns:
        lda     $09E3
        beq     L90B2
        dec     $0A12
        bpl     L9090
        lda     #$00
        sta     $0A11
        sta     $0A12
L9090:  rts

;;; + key
ReadModeFromLibrary:
        ldx     #$01
L9093:  stx     $08A7
        rts

;;; S key
SaveModeToLibrary:
        ldx     #$02
        bne     L9093           ; always

;;; Q key
CoursePlotting:
        jmp     NoOp            ; 64k: Patched to JMP `CoursePlottingSystem`

;;; Z key
SlewResetAngles:
        lda     SlewMode
        beq     :+
        lda     #$00
        sta     $6E
        sta     $6F
        sta     $70
        sta     $71
        sta     $6C
        sta     $6D
:       rts

L90B2:  lda     $0A54
        ora     $0A55
        beq     L90BF
        lda     #$03
        sta     $0A60
L90BF:  rts

;;; Ctrl+U
MoreThrottle:
        inc     SlewAltRate
        lda     #$78
        lsr     $08C5
        bcs     L90E5
        lda     $0A6F
        clc
        adc     #$08
        bpl     L90E5
L90D2:  rts

;;; Ctrl+H
LessThrottle:
        dec     SlewAltRate
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
        jmp     UpdateThrottleIndicator

;;; / key
ToggleThrottle:
        lda     #$01
        sta     $08C5
        rts

;;; Ctrl+F
FuelTankSelect:
        lda     #$10            ; Fuel Tank Select
        sta     InputMode
        rts

;;; 4 key
;;; Magnetos: Both
;;; Otherwise: Radar View
SelectRadarView:                ; 64k: Patched to JMP `SelectRadarViewPatch`
        ldx     #$02            ; Radar View
        stx     InputMode
L9100:  dex
        stx     RadarView
        rts

;;; 5 key
;;; Magnetos: Start
;;; Otherwise: 3D View
Select3DView:                   ; 64k: Patched to JMP `Select3DViewPatch`
        ldx     #$01            ; 3D View
        lda     RadarView
        bne     L9100
        stx     InputMode
        rts

;;; V key
TrimUp:
        ldx     #$0A            ; back left
        jsr     MaybeSetViewDirectionAndAbort

        inc     SlewYawRate
        lda     ElevatorTrim
        clc
        adc     #4
        cmp     #84
        jmp     L9135

;;; R key
TrimDown:
        ldx     #$0E            ; front left
        jsr     MaybeSetViewDirectionAndAbort

        inc     $08C8
        inc     SlewRollRate
        lda     ElevatorTrim
        sec
        sbc     #4
        cmp     #AS_BYTE(-84)
L9135:  beq     L913A
        sta     ElevatorTrim
L913A:  lda     #$50
        sec
        sbc     ElevatorTrim
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        jsr     UpdateTrimIndicator

Ignore:  rts                    ; Used as no-op in `KeyTable`

;;; Y key
FlapsUp:
        ldx     #$02            ; front right
        jsr     MaybeSetViewDirectionAndAbort

        dec     SlewRollRate
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
        jsr     UpdateFlapsIndicator
        LDAX    $0A5E
        STAX    $C2
        LDAX    $0A31
        jsr     ScaleC2ByAX
        STAX    $09F0
        jsr     L9386
        LDAX    $0A5E
        STAX    $C2
        LDAX    $09DA
        jsr     ScaleC2ByAX
        stx     $09D9
        rts

;;; N key
FlapsDown:
        ldx     #$06            ; back right
        jsr     MaybeSetViewDirectionAndAbort

        dec     SlewYawRate
        lda     SlewMode
        bne     L91B0
        lda     $0A5F
        clc
        adc     #$20
        bpl     L915A
        lda     #$60
        bpl     L915A
L91B0:  rts

;;; T key
YokeDown:
        ldx     #$00            ; front
        jsr     MaybeSetViewDirectionAndAbort

        lda     YokeVertPos
        sec
        sbc     #4
        ldx     SlewMode
        bne     L91C9
        ldx     InputCounter
        beq     L91C9
        sec
        sbc     #$0C
L91C9:  sta     YokeVertPos
        ora     #$00
        bpl     L91D6
        cmp     #$B0
        bcs     L91D6
        lda     #$B0
L91D6:  sta     YokeVertPos
        lda     #$03
        sta     InputCounter
L91DE:  lda     #$50
        sec
        sbc     YokeVertPos
        lsr     a
        lsr     a
        lsr     a
        cmp     LastElevatorPosition
        beq     L91F2
        sta     LastElevatorPosition
        jsr     UpdateElevatorPositionIndicator
L91F2:  rts

;;; D key
L91F3:  inc     $08B4
        rts

;;; F key
YokeLeft:
        ldx     #$0C            ; left
        jsr     MaybeSetViewDirectionAndAbort

        lda     YokeHorizPos
        sec
        sbc     #4
        cmp     #AS_BYTE(-128)
        beq     L91F2
        sta     YokeHorizPos
        jmp     L925C

;;; G key
YokeCenter:
        ldx     #$FF            ; down
        jsr     MaybeSetViewDirectionAndAbort

L9211:  lda     #$00
        ldx     SlewMode
        beq     :+
        sta     YokeVertPos
        sta     SlewPitchRate
        sta     SlewRollRate
        sta     SlewYawRate
        sta     SlewAltRate
:
        sta     YokeHorizPos
        sta     RudderPos
        lda     $097C
        lsr     a
        clc
        adc     $09CC
        cmp     $097C
        bcc     L9246
        LDAX    $09CB
        STAX    $08B9
L9246:  jsr     L925C
        jmp     L92B7

;;; H key
YokeRight:
        ldx     #$04            ; right
        jsr     MaybeSetViewDirectionAndAbort

        lda     YokeHorizPos
        clc
        adc     #$04
        bvs     L92A0
L9259:  sta     YokeHorizPos
L925C:  lda     AutoCoordinationMode
        beq     L9270
        LDAX    $0A52           ; includes `YokeHorizPos`
        STAX    $0A64           ; includes `RudderPos`
        jsr     L92CB
L9270:  lda     YokeHorizPos
        clc
        adc     #$7F            ; map -$80...$7F to 0...255
        lsr     a
        lsr     a
        lsr     a
        cmp     LastAileronPosition
        sta     LastAileronPosition
        beq     L9284
        jsr     UpdateAileronPositionIndicator
L9284:  LDAX    $0A52           ; includes `YokeHorizPos`
        STAX    $C2
        LDAX    $0A2F
        jsr     ScaleC2ByAX
        STAX    $09E8
        jsr     L9311
L92A0:  rts

;;; C key
RudderLeft:
        lda     RudderPos
        sec
        sbc     #4
        cmp     #AS_BYTE(-128)
        bne     L92B4
        rts

;;; M key
RudderRight:
        lda     RudderPos
        clc
        adc     #4
        bvs     L92DA

L92B4:
        sta     RudderPos
L92B7:  lda     AutoCoordinationMode
        beq     L92CB
        LDAX    $0A64           ; includes `RudderPos`
        STAX    $0A52           ; includes `YokeHorizPos`
        jsr     L9270
L92CB:  lda     RudderPos
        clc
        adc     #$7F            ; map -$80...$7F to 0...255
        lsr     a
        lsr     a
        lsr     a
        jsr     UpdateRudderPositionIndicator
        jsr     L9311
L92DA:  rts

;;; B key
YokeUp:
        ldx     #$08            ; back
        jsr     MaybeSetViewDirectionAndAbort

        lda     YokeVertPos
        clc
        adc     #$04
        ldx     SlewMode
        bne     L92F3
        ldx     InputCounter
        beq     L92F3
        clc
        adc     #$0C
L92F3:  sta     YokeVertPos
        ora     #$00
        bmi     L9300
        cmp     #$50
        bcc     L9300
        lda     #$50
L9300:  jmp     L91D6

;;; ============================================================

;;; Inputs: X = view direction
;;; If `InputMode` is 3D View, this aborts caller steps.

.proc MaybeSetViewDirectionAndAbort
        lda     InputMode
        cmp     #$01            ; 3D View?
        bne     :+

        dec     InputMode       ; return to Normal Flight mode
        stx     ViewDirection
        pla                     ; abort caller steps
        pla
:
        rts
.endproc

;;; ============================================================

L9311:  ldx     RudderPos
        jsr     AXDiv2
        stx     $B7
        ldx     YokeHorizPos
        jsr     AXDiv2
        txa
        sec
        sbc     $B7
        sta     $09C2
        sta     $C3
        lda     #$00
        sta     $C2
        LDAX    $0A29
        jsr     ScaleC2ByAX
        STAX    $09E6
        LDAX    $09C1
        STAX    $C2
        LDAX    $0A25
        jsr     ScaleC2ByAX
        STAX    $09C3
        LDAX    $09C1
        STAX    $C2
        LDAX    $0A27
        jsr     ScaleC2ByAX
        STAX    $0A0B
        LDAX    $09C1
        STAX    $C2
        LDAX    $0A23
        jsr     ScaleC2ByAX
        STAX    $09C5
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

L93CA:  lda     SlewMode
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
        jsr     UpdateAltimeterIndicator
        tax
        ldy     RudderPos
        jsr     L180C
        sty     $09D4
        sta     $09D3
        lda     #$B8
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     UpdateAltimeterIndicator
        LDAX    $0A5A
        jsr     ScaleC2ByAX
        sta     $09AB
        sta     $C2
        txa
        clc
        adc     #$07
        sta     $09AC
        sta     $C3
        LDAX    $0A2D
        jsr     ScaleC2ByAX
        STAX    $09EA
        lda     #$BF
        sta     $B8
        lda     #$93
        sta     $B9
        jsr     UpdateAltimeterIndicator
        LDAX    $C2
        sta     L00A5
        stx     $A6
        LDAX    L00A5
        STAX    $C2
        LDAX    $09EC
        jsr     ScaleC2ByAX
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
L9493:  LDAX    L00A5
        STAX    $C2
        LDAX    $09EE
        jsr     ScaleC2ByAX
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
L94E7:  LDAX    $0A11
        STAX    $C2
        jsr     ScaleC2ByAX
        STAX    $0A13
        STAX    $C2
        LDAX    $0A19
        jsr     ScaleC2ByAX
        stx     $09F7
        asl     a
        rol     $09F7
        asl     a
        rol     $09F7
        sta     $09F6
        LDAX    $0A13
        STAX    $C2
        LDAX    $0A1B
        jsr     ScaleC2ByAX
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
        LDAX    $09A9
        jsr     ScaleC2ByAXIntoC2
        pla
        clc
        adc     $09F3
        tax
        lda     $09F2
        jsr     ScaleC2ByAX
        STAX    $09F4
        lda     $08B6
        beq     L9582
        dec     $08B6
        lda     #$00
        sta     $09F4
        sta     $09F5
L9582:  LDAX    $0A03
        STAX    $C2
        LDAX    $0A17
        jsr     ScaleC2ByAX
        STAX    $0A09
        LDAX    $09B7
        STAX    $C2
        LDAX    $0A17
        jsr     ScaleC2ByAX
        STAX    $09BF
        LDAX    $09F4
        STAX    $C2
        LDAX    $09C7
        jsr     ScaleC2ByAX
        sec
        sbc     $09BF
        sta     $0A0F
        txa
        sbc     $09C0
        sta     $0A10
        LDAX    $0A19
        STAX    $C2
        jsr     ScaleC2ByAX
        STAX    $0A1D
        LDAX    $0A1B
        STAX    $C2
        jsr     ScaleC2ByAX
        STAX    $0A1F
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
        LDAX    $09B5
        jsr     ScaleC2ByAX
        clc
        adc     $09B3
        sta     $C2
        txa
        adc     $09B4
        sta     $C3
        LDAX    $0A13
        jsr     ScaleC2ByAXIntoC2
        LDAX    $09A9
        jsr     ScaleC2ByAX
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
        LDAX    $09FB
        jsr     ScaleC2ByAX
        STAX    $09D1
        lda     #$CC
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     UpdateAltimeterIndicator
        LDAX    $0A05
        jsr     ScaleC2ByAXIntoC2
        LDAX    $09F4
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
        LDAX    $0A64
        jsr     AXDiv2
        jsr     AXDiv2
        jsr     AXDiv2
        sta     $09CD
        stx     $09CE
L96E0:  lda     #$C2
        sta     $B8
        lda     #$0D
        sta     $B9
        jsr     UpdateAltimeterIndicator
        lda     $0899
        beq     L96F9
        LDAX    $0A0F
        jmp     L9704

L96F9:  lda     $0A10
        cmp     #$80
        ror     a
        tax
        lda     $0A0F
        ror     a
L9704:  jsr     ScaleC2ByAX
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
        LDAX    $09C9
        jsr     ScaleC2ByAX
        clc
        adc     $09D1
        tay
        txa
        adc     $09D2
        tax
        tya
        ldy     $0899
        beq     L9745
        LDAX    $09D1
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

L97B0:  jsr     ScaleC2ByAX
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
        LDAX    $09CD
        jsr     ScaleC2ByAX
        clc
        adc     $09E4
        sta     $09E4
        txa
        adc     $09E5
        sta     $09E5
        LDAX    $09DE
        STAX    $C2
        LDAX    $0A11
        jsr     ScaleC2ByAX
        STAX    $09E0
        LDAX    $0A0B
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
        STAX    $09BD
        LDAX    $09B7
        STAX    $C2
        LDAX    $09E0
        jsr     ScaleC2ByAX
        STAX    $09B9
        STAX    $C2
        LDAX    $0A07
        jsr     ScaleC2ByAX
        STAX    $09D5
        LDAX    $0A03
        STAX    $C2
        LDAX    $09E0
        jsr     ScaleC2ByAX
        clc
        adc     $08A1
        tay
        txa
        adc     $08A2
        tax
        tya
        STAX    $09A7
        LDAX    $09BD
        STAX    $C2
        LDAX    $09B9
        jsr     ScaleC2ByAX
        STAX    $0A01
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
        LDAX    $09FD
        jsr     ScaleC2ByAX
        STAX    $09CB
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
L990E:  LDAX    $09E0
        STAX    $C2
        LDAX    $09CB
        jsr     ScaleC2ByAX
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
L99A1:  LDAX    $09AB
        STAX    $C2
        LDAX    $0A21
        jsr     ScaleC2ByAX
        sec
        sbc     $09AD
        pha
        txa
        sbc     $09AE
        ldy     ViewDirection
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
        LDAX    $09E4
        STAX    $70
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
        jsr     BrakesOrGuns
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
L9A85:  LDAX    $09DE
        STAX    $C4
        lda     $09A8
        ldx     $09A7
        jsr     L16A2
        LDAX    $C2
        STAX    $0A15
L9AA2:  rts

L9AA3:  lda     SlewMode
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
        lda     RudderPos
        bne     L9AFB
        LDAX    $09AF
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
        sta     WW1AceBombsStr
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

L9B4F:  lda     YokeHorizPos
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
        sbc     YokeVertPos
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
        lda     SlewAltRate
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
        sta     $60             ; ???
        lda     SlewPitchRate
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
L9BE8:  lda     SlewRollRate
        clc
        adc     $6F
        sta     $6F
        lda     $71
        sec
        sbc     SlewYawRate
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

L9C6E:  lda     SlewMode
        beq     L9C76
P64K_A: nop                     ; 64k: Patched to JSR `DrawSlewOverlays`
        nop
        nop
L9C76:  rts

.proc DrawHeading
        lda     $FB
        and     #$04
        beq     L9C76
        LDAX    $70
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
        CALLAX  Set3DigitString, str_heading
        CALLAX  DrawMessageOrange, msg_heading
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
L9CD4:  STAX    ValueForString
        CALLAX  Set3DigitString, str_recip
        JUMPAX  DrawMessageOrange, msg_recip
.endproc

L9CE6:  tay
        txa
        lsr     a
        tax
        tya
        ror     a
        sta     $C2
        stx     $C3
        LDAX    #$168
        jsr     ScaleC2ByAX
        STAX    ValueForString
        rts

;;; Inputs: A,X = output string addr
;;;         $B6-B7 = value
;;; Output: string set to 3-digit number
.proc Set3DigitString
        ptr := $B8

        sta     ptr
        stx     ptr+1

        LDAX    #100
        ldy     #0
        jsr     DivideByAXAndSetDigitY
        LDAX    #10
        ldy     #1
        jsr     DivideByAXAndSetDigitY
        lda     ValueForString
        ora     #'0'
        ldy     #2
        sta     (ptr),y
        rts
.endproc

.proc DrawMagCompass
        lda     $FC
        and     #$10
        beq     L9D6A
        lda     ViewDirection
        bne     L9D6A           ; skip unless forward
        LDAX    $08B2
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
        CALLAX  Set3DigitString, str_magcompass
        JUMPAX  DrawMessageWhite, msg_magcompass
.endproc

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

DrawNav1:
        jsr     CheckForAbort
        CALLAX  DrawMessageOrange, msg_nav1
        LDAX    #str_nav1
        jsr     L9D9C
        sta     $08F7
        stx     $08F8
L9DDA:  lda     #$FE
        jmp     L9DFD

DrawNav2:
        jsr     CheckForAbort
        lda     $097B
        bne     L9E08
        CALLAX  DrawMessageOrange, msg_nav2
        LDAX    #str_nav2
        jsr     L9D9C
        sta     $08F5
        stx     $08F6
L9DFB:  lda     #$FD
L9DFD:  and     $08F4
        sta     $08F4
        lda     #$01
        sta     $08F2
L9E08:  rts

.proc DrawCom1
        jsr     CheckForAbort
        CALLAX  DrawMessageOrange, msg_com1
        LDAX    #str_com1
        jsr     L9D9C
        sta     $089F
        stx     $08A0
        lda     #$01
        sta     $0913
        sta     $0909
        rts
.endproc

.proc DrawVOR1
        lda     $FB
        and     #$20
        beq     L9E63
        lda     L8880
        jsr     ATo3Digits
        sty     str_vor1_course
        stx     str_vor1_course+1
        sta     str_vor1_course+2
        lda     L8880
        sec
        sbc     #$5A
        bcs     L9E49
        clc
        adc     #$B4
L9E49:  jsr     ATo3Digits
        sty     str_vor1_recip
        stx     str_vor1_recip+1
        sta     str_vor1_recip+2
        CALLAX  DrawMessageWhite, msg_vor1_course
        CALLAX  DrawMessageWhite, msg_vor1_recip
L9E63:  rts
.endproc

;;; A to 3-digit string in A,X,Y
;;; Input: A
;;; Output: "YXA" (Y is most significant digit, A is least)
.proc ATo3Digits
        ldy     #'0'-1
:       iny
        sec
        sbc     #50             ; not 100 ???
        bcs     :-
        clc
        adc     #50

        asl     a               ; *= 2 (because 50 I guess)

        ldx     #'0'-1
:       inx
        sec
        sbc     #10
        bcs     :-
        clc
        adc     #'0'+10
        rts
.endproc

.proc DrawVOR2
        lda     $097B
        bne     L9EBB
        lda     $FD
        and     #$08
        beq     L9EBB
        lda     L8883
        jsr     ATo3Digits
        sty     str_vor2_course
        stx     str_vor2_course+1
        sta     str_vor2_course+2
        lda     L8883
        sec
        sbc     #$5A
        bcs     L9EA1
        clc
        adc     #$B4
L9EA1:  jsr     ATo3Digits
        sty     str_vor2_recip
        stx     str_vor2_recip+1
        sta     str_vor2_recip+2
        CALLAX  DrawMessageWhite, msg_vor2_course
        CALLAX  DrawMessageWhite, msg_vor2_recip
L9EBB:  rts
.endproc

.proc DrawDME
        jsr     CheckForAbort
        lsr     $097E
        bcc     L9EED
        lda     $097D
        bne     L9EEE
        lda     $097F
        clc
        adc     #'0'
        sta     str_dme+2
        lda     $0980
        ldx     #$2F
L9ED7:  inx
        sec
        sbc     #$0A
        bcs     L9ED7
        clc
        adc     #$3A
        stx     str_dme
        sta     str_dme+1
L9EE6:
        CALLAX  DrawMessageOrange, msg_dme
L9EED:  rts

L9EEE:  lda     #' '
        sta     str_dme
        sta     str_dme+1
        sta     str_dme+2
        jmp     L9EE6
.endproc

;;; ??? - maybe for WWI Ace Combat mode?
.proc CheckForAbort
        lda     $FC
        and     #$80
        bne     :+
        pla
        pla
:       rts
.endproc

.proc DrawXPNDR
        jsr     CheckForAbort
        CALLAX  DrawMessageOrange, msg_xpndr
        rts
.endproc

DrawCarbHeatAndLights:
        LDAX    #msg_carbheat_on
        ldy     $0A58
        bne     :+
        CALLAX  DrawMessageWhite, msg_carbheat_off
        jmp     DrawLights

:       jsr     DrawMessageOrange

DrawLights:
        jsr     CheckForAbort
        LDAX    #msg_lights_on
        ldy     PanelLights
        bne     :+
        LDAX    #msg_lights_off
:
P64K_7: jmp     DrawMessageWhite    ; 64k: Patched to JMP `DrawMagnetoStateHook`

.proc DrawRPM
        lda     $0990
        tax
        cmp     L8882
        beq     L9F6A
        stx     L8882
        txa
        lsr     a
        tax
        lda     #'0'
        bcc     L9F4E
        lda     #'5'
L9F4E:  sta     str_rpm+2
        txa
        ldx     #'0'-1
L9F54:  inx
        sec
        sbc     #10
        bcs     L9F54
        clc
        adc     #'0' + 10
        stx     str_rpm
        sta     str_rpm+1
        CALLAX  DrawMessageOrange, msg_rpm
L9F6A:  rts
.endproc

;;; ============================================================

L9F6B:  lda     $FB
        and     #$08
        bne     :+
        rts

:       lda     $5F
        sta     $0A39
        clc
        adc     $0A36
        sta     $0830
        lda     $60
        sta     $0A3A
        adc     $0A37
        sta     $0831
        ADD16   $0830, $099E, $C2
        LDAX    #$24F4
        jsr     ScaleC2ByAX
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

L9FB3:  LDAX    L00A5
        STAX    $C2
        LDAX    #$CCC
        jsr     ScaleC2ByAX
        eor     #$FF
        clc
        adc     #$16
        bpl     L9FCC
        clc
        adc     #$58
L9FCC:  sta     $29
        LDAX    L00A5
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
        jmp     UpdateAltimeterIndicator::Init2

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
        sbc     RudderPos
LA070:  clc
        adc     #$7F            ; map -$80...$7F to 0...255
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
        jmp     UpdateSlipSkidIndicator

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
        cpx     $12
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
        .byte   $20

PLVORNeedle:
        .byte   14
        .byte   0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,7
        .byte   1,1, 1,2, 1,3, 1,4, 1,5, 1,6, 1,7

        .byte   $00, $00

LA0D0:  lda     #$01
        ldy     L8880
        ldx     $0905
        beq     LA0EE
        pha
        LDAX    $0852
        STAX    $C2
        LDAX    #$1555
        jsr     ScaleC2ByAX
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
        jsr     MultiplyAXByC2
        ldx     $C6
        tay
        txa
        sec
        sbc     $B6
        sta     $C2
        tya
        sbc     $B7
        sta     $C3
        LDAX    #$21C
        jsr     ScaleC2ByAX
        STAX    $B6
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
        jsr     DrawVOR1CourseDeviationIndicatorNeedle
        lda     $0985
        pha
        jsr     LA205
        lda     $0987
        jsr     DrawVORFlag
        pla
        jsr     LA205
        pla
        jsr     DrawVOR1CourseDeviationIndicatorNeedle
LA17A:  lda     $0981
        cmp     $0982
        beq     LA197
        php
        pha
        jsr     DrawVOR1CourseDeviationIndicatorNeedle
        pla
        plp
        bpl     LA18E
        clc
        adc     #$02
LA18E:  sec
        sbc     #$01
        sta     $0981
        jsr     DrawVOR1CourseDeviationIndicatorNeedle
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
LA1B4:  jsr     DrawOMI
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
        jsr     DrawVOR2CourseDeviationIndicatorNeedle
        lda     $0988
        clc
        adc     #$03
        jsr     DrawVORFlag
        pla
        jsr     DrawVOR2CourseDeviationIndicatorNeedle
LA1E2:  lda     $097B
        bne     LA204
        lda     $0983
        cmp     $0984
        beq     LA204
        php
        pha
        jsr     DrawVOR2CourseDeviationIndicatorNeedle
        pla
        plp
        bpl     LA1FB
        clc
        adc     #$02
LA1FB:  sec
        sbc     #$01
        sta     $0983
        jsr     DrawVOR2CourseDeviationIndicatorNeedle
LA204:  rts

LA205:  tax
        bmi     LA22E
        clc
        adc     #$76
        tax
        lda     HiresTableHi,x
        sta     $B7
        clc
        adc     HiresPageDelta
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

.proc DrawVORFlag
        asl     a               ; *= 8
        asl     a
        asl     a
        ldx     #>msg_vor_flags
        clc
        adc     #<msg_vor_flags
        bcc     :+
        inx
:       jmp     DrawMessageWhite
.endproc

        ;; Called from chunk3
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
        bne     LA2FF           ; always

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

;;; ============================================================

;;; Draw VOR1/2 course deviation indicator needle
;;; Inputs: A = needle position

;;; VOR2
DrawVOR2CourseDeviationIndicatorNeedle:
        ldy     #$A1            ; y pos
        bne     LA31C           ; always

;;; VOR1
DrawVOR1CourseDeviationIndicatorNeedle:
        ldy     #$76            ; y pos

LA31C:  tax
        bmi     LA32C
        clc
        adc     #$A5            ; x base pos
        tax
        lda     #<PLVORNeedle
        sta     PixelListData
        lda     #>PLVORNeedle
        jmp     DrawPixelListHelper

LA32C:  rts

;;; ============================================================


LA32D:  LDAX    $B6
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
        LDAX    $BE
        STAX    $C2
        lda     #$1B
        ldx     #$01
        jsr     MultiplyAXByC2
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

LA414:  LDAX    $B8
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

LA448:  LDAX    $BA
        STAX    $C4
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
        jsr     ScaleC2ByAX
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

.proc DrawOMI
        lda     #$00
        lsr     $084E
        rol     a
        lsr     $084C
        rol     a
        cmp     $098B
        sta     $098B
        beq     LA496
        ldx     #'0'
        lsr     a
        bcc     LA4BE
        ldx     #'X'
LA4BE:  stx     str_omi
        ldx     #'0'
        lsr     a
        bcc     LA4C8
        ldx     #'X'
LA4C8:  stx     str_omi+1
        JUMPAX  DrawMessageWhite, msg_omi
.endproc

LA4D2:  LDAX    $098C
        bpl     LA4DD
        jsr     L1880
LA4DD:  sta     $BE
        stx     $BF
        LDAX    $098E
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
        LDAX    $BE
        jsr     ScaleC2ByAX
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
        jsr     MultiplyAXByC2
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

LA55A:  lda     $0A6F           ; 64k: Patched to JMP `LE09F`
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
        LDAX    #$320
        jsr     ScaleC2ByAXIntoC2
        LDAX    $09A9
        jsr     ScaleC2ByAX
        STAX    $0A0D
        lda     RealityMode
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

LA5E1:  ldx     #$01            ; 64k: Patched to JMP `LDE72`
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

LA60C:  nop                     ; 64k: patched to JMP `LE4DD`
        nop
        rts

LA60F:  .byte   $22
        .byte   $03
LA611:  .byte   $25
        .byte   $06
LA613:  .byte   $2D
        .byte   $03
LA615:  .byte   $2B
        .byte   $01
LA617:  .byte   $42
        .byte   $01
LA619:  .byte   $2C
        .byte   $01
LA61B:  LDAX    LA7E0
        STAX    $8B
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
        LDAX    $08E7
        STAX    $1E03
        jsr     LA6CD
LA66A:  rts

LA66B:  LDAX    LA60F
        jmp     LA698

LA674:  LDAX    LA611
        jmp     LA698

LA67D:  LDAX    LA613
        jmp     LA698

LA686:  LDAX    LA615
        jmp     LA698

LA68F:  LDAX    LA617
        jmp     LA698

LA698:  STAX    $9E

        lda     #<$A7E0
        sta     L1E03
        lda     #>$A7E0
        sta     L1E03+1

        jsr     LA6CD
        lda     #$00
        sta     $08EA
        sta     $08EB
        sta     $08EC
        sta     $08ED
        LDAX    LA619
        STAX    $9E
        LDAX    LA7E0
        STAX    L1E03
LA6CD:  lda     HISCR
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
        lda     $9D06
        sta     $B5C3
        lda     $9D07
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
        eor     $20
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

        lda     $9D00
        ldx     $9D01
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
        lda     $9D00
        sta     $40
        lda     $9D01
        .byte   $DF
        .byte   $A7
        .byte   $41

        ;; The next $20 bytes here get stashed to LABCC
LA7E0:  .word   LB000

        ;; Reset/Interrupt handler
ResetInterruptHandler:
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

;;; Ctrl+E
LogSceneryDisk:
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

        .assert * = $A800, error, .sprintf("location mismatch, expected %04x,  was %04x", $A800, *)

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

;;; ============================================================

ColorModePatch:
        .byte   $BB
        .byte   $BB
        .byte   $77
        .byte   $77
        .byte   $11
        .byte   $11
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $00
        .byte   $00
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

BWModePatch:
        .byte   $11
        .byte   $11
        .byte   $FF
        .byte   $FF
        .byte   $11
        .byte   $11
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $11
        .byte   $11
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $00
        .byte   $00

;;; ============================================================

;;; Part of reset handler???
LAB91:  nop
        ldx     #$3F
        txs
        jsr     L1EC4
        bcs     LABB4
        jsr     LABEC
        bcs     LABB4
        jsr     LAD15
        bcs     LABB4
        jsr     ProbeLCMemory
        bcs     LABB4
        jsr     LA6F9
        bcs     LABB4

;;; ============================================================

.assert * = $ABAE, error, "mismatch"

;;; Per @qkumba, this is entry point after all chunks are loaded
        jsr     InitZeroPage
        jmp     LABBA

LABB4:  lda     $1E01
        jmp     L1F89

LABBA:  jsr     Apply64KPatchTable
        jsr     InitGraphicsScreens
        jsr     PromptColorOrBW
        jsr     InitInstruments
        jsr     LAEAA
        jmp     L877F

        ;; Used to stash $20 bytes from `LA7E0`
LABCC:
        brk
        bcs     $AC1B
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

LABEC:
        ;; Save `LA7E0`
        ldx     #$1F
:       lda     LA7E0,x
        sta     LABCC,x
        dex
        bpl     :-

        lda     #<$0200
        sta     L1E03
        lda     #>$0200
        sta     L1E03+1
        lda     #$00
        sta     $1E01

:       jsr     L1EAD
        bcs     LAC39
        lda     $1E01
        cmp     #$07
        bcc     :-
        lda     #$00
        sta     $1E03
        lda     #$60
        sta     $1E04
        lda     #$08
        sta     $1E01
:       jsr     L1EAD
        bcs     LAC39
        lda     $1E01
        cmp     #$1A
        bcc     :-

        ;; Restore `LA7E0`
        ldx     #$1F
:       lda     LABCC,x
        sta     LA7E0,x
        dex
        bpl     :-

        clc
LAC39:  rts

;;; ============================================================

.proc PromptColorOrBW
        jsr     ClearViewportsToBlack
        CALLAX  DrawMultiMessage, msg_intro

        ;; Color/B&W prompt

:       jsr     TogglePause
        cmp     #'a'
        beq     lower
        cmp     #'b'
        beq     lower
        cmp     #'A'
        beq     PatchInColor
        cmp     #'B'
        beq     PatchInBW
        bne     :-
lower:  jsr     ClearViewportsToBlack
        CALLAX  DrawMultiMessage, msg_lowercase
        jmp     :-

        ;; Color
PatchInColor:
        LDAX    #ColorModePatch
        jmp     Common

        ;; B&W
PatchInBW:
        LDAX    #BWModePatch

        ;; Common
Common:
        ldy     #$00
        STAX    $BE
:       lda     ($BE),y
        sta     ColorOrBWModePatch,y
        iny
        cpy     #$16
        bne     :-

        ;; fall through to Demo/Regular prompt
.endproc

        ;; Demo/Regular Flight Mode prompt

        jsr     ClearViewportsToBlack
        CALLAX  DrawMultiMessage, msg_select_mode
:       jsr     TogglePause
        cmp     #'A'
        beq     LAC98
        cmp     #'B'
        beq     LACB4
        bne     :-
LAC98:  inc     DemoMode

        ;; Demo mode

        jsr     ClearViewportsToBlack
        CALLAX  DrawMultiMessage, msg_demo
        lda     Has64K
        bne     :+
        CALLAX  DrawMultiMessage, msg_48k_demo
:       jsr     TogglePause
LACB4:  lda     #$00
        sta     EditModeFlag
        rts

;;; ============================================================

.proc InitInstruments
        lda     #$01
        sta     $08BE
        lda     $0A33
        jsr     UpdateAltimeterIndicator::Init
        lda     $2A
        jsr     UpdateAirspeedIndicator::Init
        lda     #$00
        jsr     UpdateVerticalSpeedIndicator::Init
        lda     #$0A
        jsr     UpdateElevatorPositionIndicator::Init
        lda     #$0F
        jsr     UpdateAileronPositionIndicator::Init
        lda     #$0F
        jsr     UpdateRudderPositionIndicator::Init
        lda     #$00
        jsr     UpdateThrottleIndicator::Init
        lda     #$00
        jsr     UpdateFlapsIndicator::Init
        lda     #$05
        jsr     UpdateTrimIndicator::Init
        lda     #$00
        jsr     UpdateMixtureControlIndicator::Init
        lda     #$00
        jsr     UpdateSlipSkidIndicator::Init
        lda     #$00
        jsr     UpdateFuelTankGauges::InitLeft
        lda     #$00
        jsr     UpdateFuelTankGauges::InitRight
        lda     #$00
        jsr     UpdateOilTempAndPressureGauges::InitTemp
        lda     #$00
        jsr     UpdateOilTempAndPressureGauges::InitPressure
        jsr     DrawVOR1
        jsr     DrawVOR2
        jsr     L8933
        rts
.endproc

;;; ============================================================

.proc LAD15
        lda     #$00
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
.endproc

;;; ============================================================

.proc InitGraphicsScreens
        ;; Show graphics page 1
        lda     TXTCLR
        lda     MIXCLR
        lda     HIRES
        lda     LOWSCR

        page1_ptr := $B8
        page2_ptr := $C0

        ;; Copy instrument panel from page1 to page2
        ldy     #0
        ldx     #191            ; bottom of screen
Loop:   lda     HiresTableLo,x
        sta     page1_ptr
        sta     page2_ptr
        lda     HiresTableHi,x
        sta     page1_ptr+1
        clc                     ; TODO: Just EOR with %01100000
        adc     #$20
        cmp     #$60
        bcc     :+
        sec
        sbc     #$40
:       sta     page2_ptr+1

        lda     (page1_ptr),y
        and     #$7F            ; clear high bit
        sta     (page1_ptr),y
        sta     (page2_ptr),y

        dex
        cpx     #99             ; bottom of viewport
        bne     Loop
        rts
.endproc

;;; ============================================================

;;; 64k Patch Table - each entry is 5 bytes
;;;   .addr address-to-patch
;;;   jsr (or jmp) ...

        ;; Patch table
PatchTable:
        .addr   ADF
        jmp     ADFKeyboardHook

        .addr   P64K_1
        jsr     LDC3D

        .addr   L6021
        jmp     LDB48

        .addr   P64K_2
        jsr     UpdateADFIndicator

        .addr   KeyDecrease
        jsr     KeyDecreasePatch

        .addr   KeyIncrease
        jsr     KeyIncreasePatch

        .addr   P64K_3
        jsr     DrawViewOverlays

        .addr   P64K_4
        jsr     UpdateAltimeter10K

        .addr   P64K_5
        jsr     LDC59

        .addr   P64K_6
        jsr     LDD7A

        .addr   LA55A
        jmp     LE09F

        .addr   P64K_7
        jmp     DrawMagnetoStateHook

        .addr   L8CC6
        jmp     LE2B3

        .addr   SelectRadarView
        jmp     SelectRadarViewPatch

        .addr   Select3DView
        jmp     Select3DViewPatch

        .addr   P64K_8
        jsr     HideOrShowInstruments

        ;; Jump table in chunk4
        .addr   L1EAD
        jmp     LD3D0
        .addr   L1EB0
        jmp     LD3D3
        .addr   L1EB3
        jmp     LD3D6
        .addr   L1EB6
        jmp     LD3D9
        .addr   L1EB9
        jmp     LD3DC
        .addr   L1EBC
        jmp     LD3DF

        .addr   L1EC1
        jmp     LD3E2

        .addr   CoursePlotting
        jmp     CoursePlottingMenu

        .addr   P64K_9
        jsr     LF7E2

        .addr   P64K_A
        jsr     DrawSlewOverlays

        .addr   LA60C
        jmp     LE4DD

        .addr   L6026
        jmp     UpdateCOMMessageChunks

        .addr   LA5E1
        jmp     LDE72

        .addr   L87A5
        jsr     LF9B5

        .addr   P64K_B
        jsr     LFA56

        .addr   P64K_C
        jsr     DemoMode64K

        .addr   L87BE
        jsr     LDDFC

        .word   $0000           ; sentinel

;;; ============================================================

;;; Detect 64K

ProbeLCMemory:
        lda     LCBANK2         ; turn on LCBANK2 for read/write
        lda     LCBANK2

        ldx     #$00            ; try writing/reading all 256 values
:       stx     $D000
        cpx     $D000
        bne     LAE9E           ; fail, just RTS
        dex
        bne     :-

        lda     #<$D000
        sta     L1E03
        lda     #>$D000
        sta     L1E03+1
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
        sta     Has64K
        clc
LAE43:  rts

;;; ============================================================

.proc Apply64KPatchTable
        lda     Has64K
        beq     LAE9E
        ldx     #$00
Loop:   ldy     #$00
        lda     PatchTable,x
        inx
        sta     L00A5
        lda     PatchTable,x
        inx
        sta     $A6
        ora     L00A5
        beq     LAE74
        lda     PatchTable,x
        inx
        sta     (L00A5),y
        iny
        lda     PatchTable,x
        inx
        sta     (L00A5),y
        iny
        lda     PatchTable,x
        inx
        sta     (L00A5),y
        jmp     Loop

LAE74:  LDAX    #$D000
        STAX    $0932
        lda     #$19
        sta     $0931
        lda     #$01
        sta     $1E07

        ;; Patch interrupt vectors in LC bank
        LDAX    #ResetInterruptHandler
        STAX    $FFFA           ; NMI
        STAX    $FFFC           ; Reset
        STAX    $FFFE           ; IRQ
.endproc

LAE9E:  rts

;;; ============================================================

.proc InitZeroPage
        ldx     #$00
:       lda     InitialZeroPageData,x
        sta     $00,x
        inx
        bne     :-
        rts
.endproc

;;; ============================================================

.proc LAEAA
        LDAX    $0932
        STAX    $B8

        lda     #$0A
Loop:
        ldy     #$40
:       sta     ($B8),y
        dey
        bpl     :-
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
        bne     Loop
        rts
.endproc

;;; ============================================================

;;; Unused???
        tay
        jsr     DrawMultiMessage
        lda     WarDeclared
        cmp     #$01
        bne     LAEF4
        lda     #$03
        sta     WarDeclared
        CALLAX  DrawMultiMessage, $A83B ; In middle of another MESSAGE ???
        ldx     #$00
        ldy     #$00
:       inx
        bne     :-
        iny
        bne     :-
LAEF4:  rts

;;; Unused???
        lda     $0A60
        beq     $AF39
        dec     $0A60
        jsr     LB025



;;; Intial data for zero page

InitialZeroPageData:
        .byte   $4C, $3C, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $28, $00, $55, $2A, $00, $00, $00
        .byte   $11, $22, $4F, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $9E
        .byte   $81, $9E, $AA, $49, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $2D, $00, $60, $00
        .byte   $36, $2E, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $06, $56, $00
        .byte   $58, $AF, $00, $00, $1F, $01, $00, $03
        .byte   $00, $00, $00, $00, $24, $03, $00, $FE
        .byte   $00, $10, $00, $FE, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $FF, $FE, $08, $00, $FF, $00, $08, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $00, $00, $00, $FF, $20, $00, $03
        .byte   $4C, $46, $E6, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $09
        .byte   $01, $00, $00, $00, $00, $02, $AB, $20
        .byte   $2C, $E2, $31, $55, $35, $11, $09, $15
        .byte   $00, $00, $00, $00, $00, $00, $02, $00
        .byte   $55, $FC, $C9, $3A, $B0, $0A, $C9, $20
        .byte   $F0, $EF, $38, $E9, $30, $38, $E9, $D0
        .byte   $60, $80, $00, $C7, $52, $FF, $00, $00
        .byte   $FF, $00, $00, $00, $FF, $FF, $00, $00
        .byte   $00, $FF, $00, $00, $00, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $00, $FF, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $FF, $FF, $0F, $00, $00

;;; ============================================================

LB000:
        adc     $C908,y
        inx


        lda     WW1AceScore+1
        sbc     #3
        bcc     :+
        lda     #$00
        sta     WW1AceScore
        sta     WW1AceScore+1
:       LDAX    WW1AceScore
        STAX    ValueForString
        CALLAX  Set3DigitStringRelay, WW1AceScoreStr
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
LB042:  LDAX    $0A54
        STAX    ValueForString
        CALLAX  Set3DigitStringRelay, $A87B
        rts

        LDAX    LA802
        STAX    $098C
        LDAX    LA805
        STAX    $098E
        jsr     L8770
        LDAX    $BE
        STAX    $098C
        LDAX    LA808
        STAX    $098E
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
        LDAX    $BE
        STAX    LA80B
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
        adc     HiresPageDelta
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

LB238:  LDAX    $0932
        STAX    $1E03
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
LB261:  lda     InitialZeroPageData + $B4,x
        adc     $091C
        sta     $091C
        lda     InitialZeroPageData + $BA,x
        adc     $091D
        sta     $091D
        lda     InitialZeroPageData + $C0,x
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
        sbc     InitialZeroPageData + $B4,x
        sta     $092E
        lda     $091D
        sbc     InitialZeroPageData + $BA,x
        sta     $092F
        lda     $091E
        sbc     InitialZeroPageData + $C0,x
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
        lda     InitialZeroPageData + $CA,x
        sta     L00A5
        lda     InitialZeroPageData + $CB,x
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
        ADD16   $5F, $0A36, $C2
        lda     #$EB
        ldx     #$D1
        jsr     MultiplyAXByC2
        asl     a
        rol     $C8

        .assert * = $B3E0, error, .sprintf("EOF mismatch, %04X", *)
