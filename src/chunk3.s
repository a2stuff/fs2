        .org $d300

;;; Some functionality that is only present in the "64k" mode
;;; of the original FS2 (per Appendix 3):
;;; * Instrument lights function at night. The panel can be shut off.
;;; * ADF functions.
;;; * Wingtip generation in side and back views.
;;; * North and East readouts in slew mode.
;;; * Bomb sight in war game.
;;; * War report.
;;; * COM Radio
;;; * Airplane image in center of the radar screen.

L00BA           := $00BA

;;; Uninitialized memory
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

;;; ============================================================

LD3D0:  jmp     LD41F

LD3D3:  jmp     LD3FA

LD3D6:  jmp     LD494

LD3D9:  jmp     LD507

LD3DC:  jmp     LD76F

LD3DF:  jmp     LD3E5

LD3E2:  jmp     LD95D

;;; ============================================================

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
        inc     L1E03+1
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
        sta     L1E03
        lda     $A5+1
        sta     L1E03+1
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
        sta     L1E03
        lda     $A5+1
        sta     L1E03+1
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

;;; ============================================================

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

;;; ============================================================
;;; Automatic Direction Finder (ADF)

LD9E5:  .byte   $01
LD9E6:  brk
LD9E7:  brk
LD9E8:  brk
LD9E9:  .byte   $FF

msg_adf_frequency:
        MESSAGE $88, $67, " 287", str_adf_frequency

;;; Update the ADF instrument on the panel
.proc UpdateADFIndicator
        lda     ADFMode
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
        ldx     #4              ; needle index
        jsr     DrawIndicatorDialNeedle
        lda     LD9E9
        ldx     #4              ; needle index
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
        CALLAX  Set3DigitString, str_adf_heading
        JUMPAX  DrawMessageOrange, msg_adf_heading
.endproc

;;; Used for drawing the ADF (turned on in Edit mode), like this:
;;; ┌----
;;; | ADF
;;; | 237
;;; |  |
;;; |
;;; |-   -
;;; |
;;; |  |
;;;

DrawADFPanel:
        MESSAGE $93, $4B, "      " ; start erasing VOR2
        MESSAGE $98, $4B, "      " ; continue
        MESSAGE $9C, $55, "    "   ; continue (right bit under trim)
        MESSAGE $9D, $4D, "$     " ; start left edge, more erasing
        MESSAGE $A2, $4E, "      " ; more erasing
        MESSAGE $A7, $4E, "      " ; more erasing
        MESSAGE $AC, $4D, "$     " ; restart left edge, more erasing
        MESSAGE $B1, $4D, "$     " ; more left edge, more erasing
        MESSAGE $B6, $4D, "$     " ; more left edge, more erasing
        MESSAGE $BB, $4B, "      "

        MESSAGE $93, $4D, "<----" ; back up to draw top row
        MESSAGE $98, $4D, "$    " ; more left edge
        MESSAGE $A2, $4D, "$"     ; more left edge
        MESSAGE $A7, $4D, "$"     ; more left edge

        MESSAGE $97, $4D, "$ ADF" ; back up for the label
        MESSAGE $A3, $4D, "$  $  " ; left edge, top marker
        MESSAGE $AF, $4D, "$-   -" ; left edge, left/right markers
        MESSAGE $BB, $4D, "$  $ "  ; left edge, bottom marker

        MESSAGE $82, $68, "ADF " ; replace NAV2 label in radio panel
        MESSAGE $89, $69, "    " ; clear out NAV2 numbers
        MESSAGE $88, $69, "    " ; more for good measure?
        .byte   0, 0             ; sentinel

msg_adf_heading:
        MESSAGE $9D, $55, "237", str_adf_heading

LDB28:
        CALLAX  DrawMultiMessage, DrawADFPanel
        lda     #$0A
        sta     LD9E9
        ldx     #$04            ; needle index
        jsr     DrawIndicatorDialNeedle
        CALLAX  DrawMessageOrange, msg_adf_heading
        CALLAX  DrawMessageOrange, msg_adf_frequency
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

ADFKeyboardHook:
        lda     $08F1
        beq     LDBAC
        lda     $FA
        cmp     #$0D
        bcc     LDBAC
        cmp     #$10
        bcs     LDBAC
        adc     #$01
        bne     LDBAE           ; always
LDBAC:  lda     #$0D            ; ADF
LDBAE:  jmp     SetInputModeAndCounter

KeyDecreasePatch:
        ldx     ADFMode
        beq     LDBD3
        lda     InputMode
        cmp     #$0D            ; ADF
        bcc     LDBD3
        cmp     #$10
        bcs     LDBD3
        sec
        sbc     #$0D
        tax
        lda     str_adf_frequency+1,x
        cmp     #'0'
        bne     LDBCD
        lda     #'9'+1
LDBCD:  sec
        sbc     #$01
        jsr     LDC18
LDBD3:  lda     InputMode
        cmp     #$03
        bne     LDC15
        ldx     $0A49
        inx
        cpx     #$08
        beq     LDC15
        bne     LDC11           ; always

KeyIncreasePatch:
        ldx     ADFMode
        beq     LDC05
        lda     InputMode
        cmp     #$0D            ; ADF
        bcc     LDC05
        cmp     #$10
        bcs     LDC05
        sec
        sbc     #$0D
        tax
        lda     str_adf_frequency+1,x
        cmp     #'9'
        bne     LDBFF
        lda     #'0'-1
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
        jsr     UpdateMixtureControlIndicator ; ???
LDC15:  lda     $FA
        rts

LDC18:  sta     str_adf_frequency+1,x
        CALLAX  DrawMessageOrange, msg_adf_frequency
        lda     str_adf_frequency+2
        asl     a
        asl     a
        asl     a
        asl     a
        sta     $B7             ; mid nibble
        lda     str_adf_frequency+3
        and     #$0F            ; low nibble
        ora     $B7
        sta     LD9E7
        lda     str_adf_frequency+1
        and     #$0F            ; high nibble
        sta     LD9E8

LDC3D:  ldx     #$00
        stx     LD9E6
        inx
        stx     $08A8
        jmp     LDC15

;;; ============================================================
;;; ???

        ;; Jump table
LDC49:  .addr   LDD07
        .addr   LDD10
        .addr   LDD19
        .addr   LDD1D
        .addr   LDD21
        .addr   LDD25
        .addr   LDD29
        .addr   LDD2D

;;; ============================================================

LDC59:  lda     RealityMode
        beq     $DCDA
        lda     $0937
        bne     LDC84
        lda     YokeVertPos
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
        sta     YokeVertPos
LDC81:  jsr     L91DE
LDC84:  dec     $08BC
        bpl     LDC9E
        lda     #$0A
        sta     $08BC
        lda     $63
        adc     $5B
        cmp     #100
        bcs     LDC9E
        cmp     ReliabilityFactor
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

.proc DrawSlewOverlays
        lda     ShowSlewDigits
        and     #$01
        beq     :+
        LDAX    NorthPosition
        STAX    $B6

        ;; Draw "00000 NORTH" (slew mode)
        CALLAX  DrawMessage, msg_north

        LDAX    EastPosition
        STAX    $B6

        ;; Draw "00000 EAST" (slew mode)
        CALLAX  DrawMessage, msg_east

:       rts
.endproc

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
LDDFC:  lda     $0834
        bne     LDE07
        lda     OnGroundFlag
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
        jsr     Delay
        ldx     #$01
        jmp     L9093

LDE22:  lda     $2A36
        cmp     #$55
        bne     LDE4C
        lda     $083C
        and     #$01
        beq     LDE4C
        lda     $0937
        ora     RadarView
        ora     ViewDirection
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
        .byte   $15

LDE72:
        .byte   $AD
        lsr     $09,x
        and     #$03
        asl     a
        asl     a
        asl     a
        tax
        lda     Minutes
        sec
        sbc     LDE52
        lda     Hours
        sbc     LDE53,x
        bmi     LDEB7
        lda     Minutes
        sec
        sbc     LDE54
        lda     Hours
        sbc     LDE55,x
        bmi     LDEBB
        lda     Minutes
        sec
        sbc     LDE56
        lda     Hours
        sbc     LDE57,x
        bmi     LDEBF
        lda     Minutes
        sec
        sbc     LDE58
        lda     Hours
        sbc     LDE59,x
        bmi     LDEBB
LDEB7:  lda     #$04
        bne     LDEC1
LDEBB:  lda     #$02
        bne     LDEC1
LDEBF:  lda     #$01
LDEC1:  sta     $083C
        ldx     Season
        lda     #$01
LDEC9:  sta     $0884
        asl     a
        dex
        bne     LDEC9
        rts

;;; ============================================================

;;; Data for drawing wingtips / tail
;;; Word-sized values (x, w, dx, dw) are 8.8 fixed point;
;;; X values are in "color pixels" (0...139)
;;; Format:
;;;   byte 0   = w (8.8 hi, lo is 0)
;;;   byte 1/2 = dw (8.8, lo/hi)
;;;   byte 3   = y start
;;;   byte 4   = x (8.8 hi, lo is 0)
;;;   byte 5/6 = dx (8.8, lo/hi)
;;;   byte 7   = height

.macro TRAPEZOID_RECORD xstart, dx, width, dw, ystart, height
        .byte   width
        .word   dw
        .byte   ystart
        .byte   xstart
        .word   dx
        .byte   height
.endmacro

WingOrTailTrapezoids:
        TRAPEZOID_RECORD $00, $0000, $00, $0000, $00, $00 ; front (nothing)
        TRAPEZOID_RECORD $8B, $0000, $14, $0100, $46, $1E ; front right (wingtip)
        TRAPEZOID_RECORD $78, $0080, $14, $01C0, $3C, $28 ; right (wingtip)
        TRAPEZOID_RECORD $70, $0000, $02, $0000, $3C, $28 ; back right (tail)
        TRAPEZOID_RECORD $48, $0000, $02, $0000, $3C, $28 ; back (tail)
        TRAPEZOID_RECORD $20, $0000, $02, $0000, $3C, $28 ; back left (tail)
        TRAPEZOID_RECORD $28, $0140, $14, $01C0, $3C, $28 ; left (wingtip)
        TRAPEZOID_RECORD $14, $0100, $14, $0100, $46, $1E ; front left (wingtip)
        TRAPEZOID_RECORD $00, $0000, $00, $0000, $00, $00 ; down (nothing)

;;; Data for airplane image (radar view) and bomb sight (WW1 mode)
;;; Format is: addr lo, addr hi, or mask

.macro OVERLAY_RECORD addr, mask
        .addr   addr
        .byte   mask
.endmacro

ImageOverlays:
BombSightOverlayPixels:
        OVERLAY_RECORD  $2B14, $7F
        OVERLAY_RECORD  $2B13, $7F
        OVERLAY_RECORD  $2B15, $7F
        OVERLAY_RECORD  $2714, $0C
        OVERLAY_RECORD  $2314, $0C
        OVERLAY_RECORD  $3E94, $3F
        OVERLAY_RECORD  $3A94, $0C
        OVERLAY_RECORD  $2F14, $0C
        OVERLAY_RECORD  $3314, $0C
        OVERLAY_RECORD  $3714, $3F
        OVERLAY_RECORD  $3B14, $0C
        OVERLAY_RECORD  $3F14, $0C
        OVERLAY_RECORD  $3694, $0C
        OVERLAY_RECORD  $3294, $3F
        OVERLAY_RECORD  $2394, $3F
        .byte   $00, $00        ; sentinel

AirplaneOverlayPixels:
        OVERLAY_RECORD  $2B14, $7F
        OVERLAY_RECORD  $2714, $0C
        OVERLAY_RECORD  $2314, $0C
        OVERLAY_RECORD  $2F14, $0C
        OVERLAY_RECORD  $3314, $0C
        OVERLAY_RECORD  $3714, $0C
        OVERLAY_RECORD  $3B14, $3F
        OVERLAY_RECORD  $2B13, $78
        OVERLAY_RECORD  $2B15, $03
        .byte   $00, $00        ; sentinel

.proc DrawViewOverlays
        lda     RadarView
        beq     NotRadar
        ldx     #AirplaneOverlayPixels - ImageOverlays
        bne     Skip            ; always

NotRadar:
        lda     ViewDirection
        bpl     DrawWingsOrTailOverlays ; anything but down
        lda     #$10
        ldx     WW1AceMode
        beq     DrawWingsOrTailOverlays

        ;; Draw airplane image (radar view) or bomb sight (WW1 mode)
        ldx     #BombSightOverlayPixels - ImageOverlays
Skip:   ldy     #$00

Loop:   lda     ImageOverlays,x
        sta     $B8
        inx
        lda     ImageOverlays,x
        beq     Exit            ; sentinel
        sta     $B9
        inx
        lda     ImageOverlays,x
        pha
        ora     ($B8),y
        sta     ($B8),y

        lda     $B9             ; do page 2 as well
        clc
        adc     #$20
        sta     $B9

        pla
        ora     ($B8),y
        sta     ($B8),y

        inx
        bne     Loop
Exit:   rts

.proc DrawWingsOrTailOverlays
        asl     a               ; *= 4
        asl     a               ; `ViewDirection` already scaled by 2
        pha
        jsr     DrawWingsOrTail
        pla
        cmp     #$40
        beq     Exit
LDFAF:  rts

TrapezoidX:     .word   0       ; "color pixel" right pos in 8.8 form
TrapezoidDX:    .word   0       ; pos delta (8.8)
TrapezoidW:     .word   0       ; "color pixel" width in 8.8 form
TrapezoidDW:    .word   0       ; width delta (8.8)
TrapezoidY:     .byte   0       ; top
TrapezoidH:     .byte   0       ; height

DrawWingsOrTail:
        pha
        lda     #$09
        sta     $0876
        jsr     L601E
        pla
        tax
        lda     #$00
        sta     TrapezoidW     ; low byte (fraction) of 8.8 fixed
        sta     TrapezoidX     ; point values start at 0
        lda     WingOrTailTrapezoids,x
        sta     TrapezoidW+1   ; high byte - integer part
        beq     LDFAF           ; exit if sentinel

        lda     WingOrTailTrapezoids+1,x
        sta     TrapezoidDW
        lda     WingOrTailTrapezoids+2,x
        sta     TrapezoidDW+1
        lda     WingOrTailTrapezoids+3,x
        sta     TrapezoidY
        lda     WingOrTailTrapezoids+4,x
        sta     TrapezoidX+1   ; high byte - integer part
        lda     WingOrTailTrapezoids+5,x
        sta     TrapezoidDX
        lda     WingOrTailTrapezoids+6,x
        sta     TrapezoidDX+1
        lda     WingOrTailTrapezoids+7,x
        sta     TrapezoidH
Loop:
        lda     TrapezoidX+1
        sta     $27             ; "color pixel" (0...139) right edge
        ldy     TrapezoidY
        lda     HiresTableLo,y
        sta     HiresRowPtr
        lda     HiresTableHi,y
        sta     HiresRowPtr+1
        lda     TrapezoidW+1   ; A = "color pixel" (0...139)
        jsr     DrawColorSpanRelay

        ;; Update pos and width by delta, 8.8 fixed point math.
        ;; (Which is just 16-bit addition.)
        ADD16C  TrapezoidX, TrapezoidDX, TrapezoidX
        ADD16C  TrapezoidW, TrapezoidDW, TrapezoidW

        inc     TrapezoidY
        dec     TrapezoidH

        bne     Loop
        rts
.endproc
.endproc

;;; ============================================================

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

;;; Improved engine (magneto, mixture, prop autorotation effects). ???

;;; Magneto state

msg_O:  MESSAGE $9A, $76, "O"   ; off
msg_L:  MESSAGE $9A, $76, "L"   ; left on
msg_R:  MESSAGE $9A, $76, "R"   ; right on
msg_B:  MESSAGE $9A, $76, "B"   ; both on
msg_S:  MESSAGE $9A, $76, "S"   ; start

LE09F:  lda     WW1AceMode
        bne     LE0C8
        lda     RealityMode
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
LE0D9:  lda     RealityMode
        ora     $099B
        beq     LE10B
        lda     $099B
        bne     LE110
        lda     L0A11+1
        cmp     #$25
        bcs     LE10B

        lda     MagnetoState
        cmp     #4              ; start
        bne     LE110
        ldx     #$64
        jsr     Delay
        ldx     #3              ; both
        jsr     SetMagnetoState
        lda     Season
        cmp     #$01
        bne     LE10B
        lda     $2B
        and     #$04
        beq     LE110
LE10B:  lda     #$01
        sta     $099B
LE110:  lda     L0A11+1
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
LE1A8:  lda     RealityMode
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
        .byte   $A5             ; TODO: disasm
        lda     $18
        adc     $0995
        sta     $0995
        lda     $A6
        bpl     LE2AC
        adc     $0996
        sta     $0996
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
SetMagnetoState:
        stx     MagnetoState
        jmp     DrawCarbHeatAndLights

;;; Message table for magneto state

MagnetoStateMessageTable:
        .addr   msg_O
        .addr   msg_L
        .addr   msg_R
        .addr   msg_B
        .addr   msg_S

DrawMagnetoStateHook:
        jsr     DrawMessageWhite
        lda     MagnetoState
        asl     a
        tax
        lda     MagnetoStateMessageTable,x
        pha
        lda     MagnetoStateMessageTable+1,x
        tax
        pla
        jsr     DrawMessageWhite
        rts

;;; ============================================================

;;; 64k replacement for `SelectRadarView`
SelectRadarViewPatch:
        lda     $FA
        cmp     #$03
        bne     LE2F3
        lda     #$03
        ldx     #$03
        jmp     L8CC6

LE2F3:  ldx     #$02
        stx     $FA
LE2F7:  jmp     L9100

;;; ============================================================

;;; 64k replacement for `Select3DView`
Select3DViewPatch:
        lda     $FA
        cmp     #$03
        bne     LE307
        lda     #$03
        ldx     #$04
        jmp     L8CC6

LE307:  ldx     #$01
        lda     RadarView
        bne     LE2F7
        stx     $FA
        rts

;;; ============================================================

;;; Inputs:
;;;   X = delay length
.proc Delay
        ldy     #$FF
:       inc     $A5
        dec     $A5
        dey
        bne     :-
        dex
        bne     Delay
        rts
.endproc

;;; ============================================================
;;; COM Radio (ATIS Messages)

;;; Full message example:
;;;
;;;  OHARE INTERNATIONAL AIRPORT
;;;  INFORMATION BRAVO  13:00 ZULU
;;;   WEATHER -      VISIBILITY
;;;  10 -   TEMPERATURE 53 -
;;;  WIND  00 AT  0 -   ALTIMETER
;;;  29.95 -  LANDING AND DEPARTING
;;;  RUNWAY 04 -   ADVISE CONTROLLER
;;;   ON INITIAL CONTACT YOU HAVE
;;;  BRAVO.....
;;;
;;; A byte $80+ encodes using a chunk via the `ChunkOffsetTable`
;;; e.g. $41 $42 $20 $85 $20 $43 $44 $2E $2E $00 would emit
;;; "AB INFORMATION CD..". So the above message is encoded as:
;;; $4F $48 $41 $52 $45 $20 $49 $4E $54 $45 $52 $4E $41
;;; $54 $49 $4F $4E $41 $4C $20 $41 $49 $52 $50 $4F $52
;;; $54 $85 $42 $52 $41 $56 $4F $82 $80 $8B $89 $84 $8A
;;; $88 $86 $87 $8C $59 $4F $55 $20 $48 $41 $56 $45 $20
;;; $42 $52 $41 $56 $4F $2E $2E $2E $2E $2E $00

;;; Message fragment offsets from `MessageChunks`

ChunkOffsetTable:
        .byte   mc0 - MessageChunks
        .byte   mc1 - MessageChunks
        .byte   mc2 - MessageChunks
        .byte   mc3 - MessageChunks
        .byte   mc4 - MessageChunks
        .byte   mc5 - MessageChunks
        .byte   mc6 - MessageChunks
        .byte   mc7 - MessageChunks
        .byte   mc8 - MessageChunks
        .byte   mc9 - MessageChunks
        .byte   mcA - MessageChunks
        .byte   mcB - MessageChunks
        .byte   mcC - MessageChunks

MessageChunks:

mc0:                    .byte   "WEATHER - ", 0

mc1:                    .byte   "OBSERVATION", 0

mc2:
str_time_digits:        .byte   "12:00 ZULU", 0

mc3:                    .byte   0

mc4:                    .byte   "TEMPERATURE "
str_temp_digits:        .byte   "75 - ", 0

mc5:                    .byte   "INFORMATION", 0

mc6:                    .byte   "LANDING AND DEPARTING RUNWAY "
str_runway_digits:      .byte   "31 - ", 0

mc7:                    .byte   "ADVISE CONTROLLER", 0

mc8:                    .byte   "ALTIMETER 29.95 -", 0

mc9:                    .byte   "VISIBILITY 10 - ", 0

mcA:                    .byte   "WIND "
str_wind_dir_digits:    .byte   "330 AT "
str_wind_speed_digits:  .byte   "27 - ", 0

mcB:                    .byte   " "
str_ceiling_include:    .byte   " " ; set to $0 to skip ceiling
                        .byte   "MEASURED CEILING "
str_ceiling_digits:     .byte   "00600 OVERCAST - ", 0

mcC:                    .byte   "ON INITIAL CONTACT", 0

.proc UpdateCOMMessageChunks
        ldx     Season
        lda     SeasonTempTable,x
        clc
        adc     BaseTemp
        jsr     ATo2Digits
        sta     str_temp_digits   ; temperature 10s digit
        stx     str_temp_digits+1 ; temperature 1s digit

        lda     #<360
        sta     $C2
        lda     #>360
        sta     $C2+1
        LDAX    WindDirection
        jsr     MultiplyAXByC2
        txa
        ldx     $C9
        jsr     AXTo3Digits
        sta     str_wind_dir_digits+1 ; wind direction 10s digit
        stx     str_wind_dir_digits+2 ; wind direction 1s digit
        cpy     #$30
        bne     LE444
        ldy     #$20
LE444:  sty     str_wind_dir_digits ; wind direction 100s digit

        lda     WindSpeed
        jsr     ATo2Digits
        cmp     #$30
        bne     LE453
        lda     #$20
LE453:  sta     str_wind_speed_digits   ; wind speed 10s digit
        stx     str_wind_speed_digits+1 ; wind speed 1s digit

        lda     Hours
        clc
        adc     $0854
        cmp     #$18
        bcc     LE467
        sec
        sbc     #24
LE467:  jsr     ATo2Digits
        STAX    str_time_digits ; start of "12:00 ZULU"

        lda     #<$0866
        sta     $C2
        lda     #>$0866
        sta     $C3
        LDAX    $0856
        jsr     MultiplyAXByC2
        ldy     #$00            ; exclude ceiling message
        sty     str_ceiling_include
        txa
        ldx     $C9
        bne     LE48E
        tay
        beq     LE4AB
LE48E:  ldy     #' '            ; include ceiling message
        sty     str_ceiling_include
        jsr     AXTo3Digits
        cpy     #$30
        bne     LE4A2
        ldy     #$20
        cmp     #$30
        bne     LE4A2
        lda     #$20
LE4A2:  sty     str_ceiling_digits   ; ceiling 10000s digit
        sta     str_ceiling_digits+1 ; ceiling 1000s digit
        stx     str_ceiling_digits+2 ; ceiling 100s digit
LE4AB:  lda     WindDirection+1
        lsr     a               ; /= 64
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        tax
        lda     RunwaysTable,x
        jsr     ATo2Digits
        sta     str_runway_digits   ; runway 10s digit
        stx     str_runway_digits+1 ; runway 1s digit
        rts
.endproc

;;; ============================================================


TmpStr: .res    3, 0

ATo2Digits:
        ldx     #$00
AXTo3Digits:
        STAX    $B6
        CALLAX  Set3DigitString, TmpStr
        ldy     TmpStr+0
        lda     TmpStr+1
        ldx     TmpStr+2
        rts

;;; ============================================================

;;; Output message 1 character at a time, constructing a temporary
;;; MESSAGE at $B8 (row, col, character, null)

        MsgPtr       := $B6

        CharMsg      := $B8
        CharMsgRow   := CharMsg+0
        CharMsgCol   := CharMsg+1
        CharMsgChar  := CharMsg+2
        CharMsgNull  := CharMsg+3

LE4DC:  rts

.proc LE4DD
        lda     $0913
        bne     LE4DC
        inc     $0913
        sta     CharMsgNull     ; A = $00
        lda     #$03
        sta     CharMsgRow
        sta     CharMsgCol
        jsr     ClearViewportsToBlack
        LDAX    $092A           ; points at airport name
        STAX    MsgPtr
IncPtr:
        ldy     #$00
        lda     (MsgPtr),y
        inc     MsgPtr
        bne     LE504
        inc     MsgPtr+1
LE504:  tay
        bne     :+
        rts
:
        bpl     DoChar          ; simple char
        lda     MsgPtr+1
        pha
        lda     MsgPtr
        pha
        lda     ChunkOffsetTable-$80,y ; ignore high bit
        clc
        adc     #<MessageChunks
        sta     MsgPtr
        lda     #>MessageChunks
        adc     #$00
        sta     MsgPtr+1
        lda     #$20
        jsr     LE504
        jsr     AdvanceCursor
        pla
        sta     MsgPtr
        pla
        sta     MsgPtr+1
IncRelay:
        bne     IncPtr          ; always

DoChar:
        cmp     #' '
        beq     SkipDraw

        sta     CharMsgChar
        CALLAX  DrawMessageWhite, CharMsg

        ;; Delay for a few milliseconds
        lda     #$00
        sec
        sbc     ATISPacing
        tax
l1:     ldy     #$78
l2:     dey
        bne     l2
        dex
        bne     l1

        jsr     Advance
        bne     IncRelay        ; always

SkipDraw:
        jsr     AdvanceCursor
        bne     IncRelay        ; always

AdvanceCursor:
        lda     CharMsgCol
        cmp     #100
        bcc     Advance

        lda     CharMsgRow      ; wrap, maybe clear
        adc     #7
        cmp     #90
        bcc     SetRow
        jsr     ClearViewportsToBlack
        lda     #$03
SetRow:
        sta     CharMsgRow
        lda     #$03
        bne     SetCol           ; always

Advance:
        lda     CharMsgCol
        clc
        adc     #4
SetCol:
        sta     CharMsgCol
        rts
.endproc

;;; ============================================================

;;; Instrument Save Record:
;;;   byte 0 = XStart
;;;   byte 1 = bit0   = XStart high byte low bit
;;;            bit1-7 = YSize
;;;   byte 2 = YStart
;;;   byte 3 = XSize
;;;   byte 4/5 = storage buffer

;;; The macro takes care of the funky order and bit-sharing
.macro SAVE_RECORD xstart, ystart, xsize, ysize, bufptr
        .byte   xstart & $FF, (ysize << 1) | (xstart >> 8), ystart, xsize
        .addr   bufptr
.endmacro

LE575:
        SAVE_RECORD $00, $68, $33, $2D, LE800
        SAVE_RECORD $03, $96, $2D, $29, $E91F
        SAVE_RECORD $35, $96, $2D, $29, $EA06
        SAVE_RECORD $68, $68, $33, $2D, $EAED
        SAVE_RECORD $34, $68, $33, $2D, $EC0C
        SAVE_RECORD $9C, $6A, $2F, $29, $ED2B
        SAVE_RECORD $DC, $B3, $15, $05, $EE1C
        SAVE_RECORD $6B, $96, $2D, $29, $EE2A

LE5A5:
        SAVE_RECORD $CE, $8F, $16, $07, $EF11
        SAVE_RECORD $F3, $82, $22, $05, $EF25
        SAVE_RECORD $CF, $74, $1C, $05, $EF3B
        SAVE_RECORD $CF, $66, $1A, $05, $EF4D
        SAVE_RECORD $31, $64, $03, $06, $EF5E
        SAVE_RECORD $D0, $A2, $45, $07, $EF61
        SAVE_RECORD $D6, $AA, $3E, $07, $EF9E
        SAVE_RECORD $CE, $65, $02, $02, $FC00
LE5D5:
        SAVE_RECORD $DA, $BA, $3B, $06, $FC01
        SAVE_RECORD $CF, $82, $1D, $05, $FC2E
        SAVE_RECORD $F6, $74, $14, $05, $FC41
        SAVE_RECORD $9C, $95, $30, $2B, $FC4E

.proc HideOrShowInstruments
        lda     $0977
        and     $0914
        and     $0917
        cmp     $FB
        beq     :+
        sta     $9E
        ldx     $FB
        stx     $A0
        sta     $FB
        CALLAX  HideOrShow8Instruments, LE575
:
        lda     $0978
        and     $0915
        and     $0918
        cmp     $FC
        beq     :+
        sta     $9E             ; flags
        ldx     $FC
        stx     $A0             ; alt flags
        sta     $FC
        CALLAX  HideOrShow8Instruments, LE5A5
:
        lda     $0979
        and     $0916
        and     $0919
        cmp     $FD
        beq     :+
        sta     $9E             ; flags
        ldx     $FD
        stx     $A0             ; alt flags
        sta     $FD
        CALLAX  HideOrShow8Instruments, LE5D5
:
        rts
.endproc

;;; Hide/Show 8 instruments
;;; Inputs:
;;;   $BC = record list ptr (see above)
;;;   $9E = flags for hide show
;;;   $A0 = alt flags for hide/show

.proc HideOrShow8Instruments
        RecPtr := $BC
        Count := $A2
        Flags := $9E
        AltFlags := $A0

        STAX    RecPtr          ; record ptr
        lda     #8              ; number of instruments
        sta     Count
Loop:
        lda     AltFlags
        and     #$01
        sta     $B6             ; pass alt flag
        lda     Flags
        and     #$01
        sta     $B7             ; pass flag
        LDAX    RecPtr
        STAX    $B8             ; pass record ptr

        jsr     HideOrShowInstrument

        lsr     Flags           ; next bits
        lsr     AltFlags

        lda     RecPtr
        clc
        adc     #6              ; next record
        sta     RecPtr
        bcc     :+
        inc     RecPtr+1
:
        dec     Count
        bne     Loop
        rts
.endproc

;;; ============================================================

;;; Inputs:
;;;   $B6 = no-op if equal to $B7
;;;   $B7 = hide (zero) or show (non-zero)
;;;   $B8-B9 = pointer to save info record (see above)

HideOrShow:     .byte   0       ; passed in $B7
XStart:         .word   0       ; passed in ($B8) record
YStart:         .byte   0       ; passed in ($B8) record
YSize:          .byte   0       ; passed in ($B8) record
XSize:          .byte   0       ; passed in ($B8) record
XCoord:         .word   0       ; temp
XCount:         .byte   0       ; temp
BitNumber:      .byte   0       ; temp

BufPtr := L00BA

.proc HideOrShowInstrument

        lda     $B7
        cmp     $B6
        bne     :+
        rts
:
        sta     HideOrShow
        ldy     #$00
        lda     ($B8),y
        sta     XStart
        iny
        lda     ($B8),y
        sta     YSize
        lsr     YSize           ; YSize is in bits 1-7
        and     #$01
        sta     XStart+1
        iny
        lda     ($B8),y
        sta     YStart
        iny
        lda     ($B8),y
        sta     XSize
        iny
        lda     ($B8),y
        sta     BufPtr
        iny
        lda     ($B8),y
        sta     BufPtr+1

        lda     #0
        sta     BitNumber

        YCoord := YStart

YLoop:  lda     XSize
        sta     XCount
        LDAX    XStart
        STAX    XCoord

XLoop:  lda     HideOrShow
        beq     DoHide

        ;; Show
        jsr     LoadPixelState
        ldx     XCoord+1
        stx     $A5             ; x coord hi
        ldx     XCoord          ; x coord lo
        ldy     YCoord          ; y coord
        jsr     MaybeXORPixel
        jmp     Next

        ;; Hide
DoHide: lda     XCoord+1
        sta     $A5
        ldx     XCoord
        ldy     YCoord
        jsr     ErasePixelReturnIfSet
        jsr     SavePixelState

Next:   inc     XCoord
        bne     :+
        inc     XCoord+1
:       dec     XCount
        bne     XLoop

        inc     YCoord
        dec     YSize
        bne     YLoop
        lda     HideOrShow
        bne     Done

        ;; Pad to 8 bits
        ldx     BitNumber
        ldy     #0
        lda     (BufPtr),y
PadLoop:
        inx
        cpx     #9
        beq     :+
        rol     a
        jmp     PadLoop
:
        sta     (BufPtr),y
Done:   rts
.endproc

;;; ============================================================

;;; Clear a pixel, but return whether or not it was set
;;; Inputs:
;;;   Y = y coord
;;;   X = x coord lo
;;;   $A5 = x coord hi
;;; Output:
;;;   A = 1 if pixel was set, 0 otherwise
.proc ErasePixelReturnIfSet
        jsr     CalcPixelAddrAndMask
        and     ($B8),y
        beq     LE72A
        iny                     ; pixel is set
LE72A:  sty     $A7             ; stash ("pixel was set")
        txa
        eor     #$FF            ; invert mask
        ldy     #$00
        and     ($B8),y         ; clear the pixel
        sta     ($B8),y
        tax                     ; TODO: Use two pointers!
        lda     $B9
        clc
        adc     #$20
        cmp     #$60
        bcc     :+
        sec
        sbc     #$40
:       sta     $B9
        txa
        sta     ($B8),y         ; update the other graphics page
        lda     $A7             ; unstash ("pixel was set")
        rts
.endproc

;;; ============================================================

;;; XOR pixel on both hires screens
;;;   A = toggle pixel?
;;;   Y = y coord
;;;   X = x coord lo
;;;   $A5 = x coord hi
.proc MaybeXORPixel
        pha
        jsr     CalcPixelAddrAndMask
        pla
        ora     #$00            ; TODO: Skip this???
        beq     LE759           ; no-op
        txa                     ; A = bit mask
        eor     ($B8),y         ; invert
        jmp     LE75B           ; ... and store

LE759:  lda     ($B8),y
LE75B:  sta     ($B8),y
        tax                     ; stash...
        lda     $B9             ; TODO: Use two pointers!
        clc
        adc     #$20
        cmp     #$60
        bcc     :+
        sec
        sbc     #$40
:       sta     $B9
        txa                     ; unstash...
        sta     ($B8),y         ; and update other graphics page
        rts
.endproc

;;; ============================================================

;;; Map pixel to row/byte/mask
;;; Input:
;;;   Y = y coord
;;;   X = x coord lo
;;;   $A5 = x coord hi
;;; Output:
;;;   $B8-B9 = byte ptr (NOTE: not row ptr!)
;;;   Y = 0
;;;   X = A = bit mask
.proc CalcPixelAddrAndMask
        lda     HiresTableHi,y
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
.endproc

;;; ============================================================

.proc SavePixelState
        sta     $A5             ; pixel was set

        inc     BitNumber
        lda     BitNumber
        cmp     #9
        bne     :+
        lda     #1
        sta     BitNumber
        inc     BufPtr
        bne     :+
        inc     BufPtr+1
:
        lda     $A5
        ldy     #$00            ; Pixel was set
        ror     a
        lda     (BufPtr),y
        rol     a
        sta     (BufPtr),y
        rts
.endproc

;;; ============================================================

.proc LoadPixelState
        inc     BitNumber
        lda     BitNumber
        cmp     #9
        bne     :+
        lda     #1
        sta     BitNumber
        inc     BufPtr
        bne     :+
        inc     BufPtr+1
:
        ldy     #$00
        lda     (BufPtr),y
        rol     a
        sta     (BufPtr),y
        rol     a
        and     #$01
        rts
.endproc

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
        brk
        .byte   $FF
        .byte   $FF
        brk
        .byte   $FE
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
        inc     $FFFF,x
        brk
        brk

;;; ============================================================

;;; Save buffer for instrument bitmaps - $E800 through $F000
;;; Any data here is assumed to be garbage

LE800:
        .byte   $A9, $D5, $8D, $FE, $FF, $A9, $EF, $8D
        .byte   $FF, $FF, $4C, $31, $EA, $00, $60, $00
        .byte   $36, $30, $05, $FF, $FF, $09, $0A, $04
        .byte   $0B, $89, $1F, $43, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $D3, $AA, $80, $80, $80, $80, $C0
        .byte   $9B, $84, $80, $80, $80, $80, $A0, $D8
        .byte   $81, $80, $80, $80, $80, $80, $D0, $CD
        .byte   $80, $80, $80, $80, $80, $E4, $86, $80
        .byte   $80, $86, $80, $90, $80, $80, $C0, $81
        .byte   $A0, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $C0, $FF, $FF
        .byte   $FF, $87, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $E0, $88, $B2, $D8
        .byte   $F1, $B6, $DB, $87, $DB, $D5, $AA, $D5
        .byte   $AA, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $80, $80, $80, $80, $80
        .byte   $80, $80, $80, $82, $D5, $80, $80, $80
        .byte   $80, $F0, $91, $88, $80, $80, $80, $80
        .byte   $90, $88, $C1, $8D, $80, $80, $80, $E0
        .byte   $C6, $98, $84, $80, $80, $80, $C0, $B0
        .byte   $B6, $E7, $E7, $83, $83, $90, $B6, $C3
        .byte   $99, $80, $A0, $80, $C6, $80, $C4, $80
        .byte   $C4, $81, $B0, $B6, $83, $80, $80, $A0
        .byte   $83, $80, $80, $93, $80, $DB, $81, $E4
        .byte   $80, $98, $88, $95, $A2, $D4, $C0, $81
        .byte   $C2, $E0, $D8, $8D, $86, $83, $D4, $80
        .byte   $D1, $A2, $A5, $80, $80, $00, $04, $0B
        .byte   $00, $A9, $02, $00, $A9, $01, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $00, $00, $00
        .byte   $00, $00, $00, $00, $00, $EA, $7A, $EA
        .byte   $9E, $EA, $E4, $EA, $48, $EA, $FE, $EB
        .byte   $41, $EB, $75, $EB, $9D, $EC, $20, $EC
        .byte   $71, $EC, $B9, $ED, $47, $ED, $B3, $EE
        .byte   $FD, $08, $8D, $0D, $E8, $68, $8D, $10
        .byte   $E8, $8E, $0E, $E8, $8C, $0F, $E8, $BA
        .byte   $8E, $11, $E8, $20, $67, $EF, $20, $74
        .byte   $EF, $A0, $00, $20, $7F, $EF, $99, $17
        .byte   $E8, $AA, $CA, $F0, $0E, $C8, $C0, $FF
        .byte   $B0, $09, $20, $7F, $EF, $99, $17, $E8
        .byte   $4C, $52, $EA, $A0, $01, $B9, $17, $E8
        .byte   $C9, $0E, $90, $03, $4C, $49, $EA, $0A
        .byte   $AA, $BD, $15, $EA, $48, $E8, $BD, $15
        .byte   $EA, $48, $60, $A0, $00, $A9, $04, $99
        .byte   $16, $E9, $C8, $B9, $17, $E8, $99, $16
        .byte   $E9, $C8, $68, $99, $16, $E9, $C8, $68
        .byte   $48, $99, $16, $E9, $88, $B9, $16, $E9
        .byte   $48, $20, $4F, $EF, $4C, $49, $EA, $A0
        .byte   $00, $A9, $03, $99, $16, $E9, $C8, $B9
        .byte   $17, $E8, $99, $16, $E9, $C8, $B9, $17
        .byte   $E8, $C9, $41, $D0, $06, $AD, $0D, $E8
        .byte   $4C, $DC, $EA, $C9, $58, $D0, $06, $AD
        .byte   $0E, $E8, $4C, $DC, $EA, $C9, $59, $D0
        .byte   $06, $AD, $0F, $E8, $4C, $DC, $EA, $C9
        .byte   $53, $D0, $06, $AD, $11, $E8, $4C, $DC
        .byte   $EA, $AD, $10, $E8, $99, $16, $E9, $20
        .byte   $4F, $EF, $4C, $49, $EA, $A0, $00, $A9
        .byte   $03, $99, $16, $E9, $C8, $B9, $17, $E8
        .byte   $99, $16, $E9, $C8, $A9, $00, $99, $16
        .byte   $E9, $20, $4F, $EF, $4C, $49, $EA, $A0
        .byte   $02, $B9, $17, $E8, $C8, $C9, $41, $D0
        .byte   $09, $B9, $17, $E8, $8D, $0D, $E8, $4C
        .byte   $49, $EA, $C9, $58, $D0, $09, $B9, $17
        .byte   $E8, $8D, $0E, $E8, $4C, $49, $EA, $C9
        .byte   $59, $D0, $09, $B9, $17, $E8, $8D, $0F
        .byte   $E8, $4C, $49, $EA, $C9, $53, $D0, $09
        .byte   $B9, $17, $E8, $8D, $11, $E8, $4C, $49
        .byte   $EA, $B9, $17, $E8, $8D, $10, $E8, $4C
        .byte   $49, $EA, $A0, $02, $B9, $17, $E8, $85
        .byte   $57, $C8, $B9, $17, $E8, $85, $56, $C8
        .byte   $B9, $17, $E8, $AA, $18, $69, $02, $A0
        .byte   $00, $99, $16, $E9, $C8, $B9, $17, $E8
        .byte   $99, $16, $E9, $A0, $00, $B1, $56, $C8
        .byte   $C8, $99, $16, $E9, $88, $CA, $D0, $F5
        .byte   $20, $4F, $EF, $4C, $49, $EA, $A0, $02
        .byte   $B9, $17, $E8, $85, $57, $C8, $B9, $17
        .byte   $E8, $85, $56, $A0, $00, $B9, $17, $E8
        .byte   $8D, $12, $E8, $A2, $04, $A0, $00, $BD
        .byte   $17, $E8, $91, $56, $C8, $E8, $EC, $12
        .byte   $E8, $90, $F4, $4C, $49, $EA, $A2, $02
        .byte   $BD, $17, $E8, $85, $57, $A9, $00, $85
        .byte   $56, $E8, $BD, $17, $E8, $A8, $E8, $BD
        .byte   $17, $E8, $8D, $E0, $EB, $E8, $BD, $17
        .byte   $E8, $8D, $E4, $EB, $A2, $00, $BD, $17
        .byte   $E8, $8D, $12, $E8, $38, $E9, $07, $8D
        .byte   $FC, $EB, $A9, $02, $48, $A2, $06, $B1
        .byte   $56, $DD, $17, $E8, $F0, $14, $A2, $06
        .byte   $C8, $D0, $02, $E6, $57, $A5, $57, $C9
        .byte   $99, $90, $EC, $C0, $99, $90, $E8, $4C
        .byte   $0E, $EC, $E8, $EC, $12, $E8, $B0, $03
        .byte   $4C, $D8, $EB, $68, $C9, $FC, $B0, $17
        .byte   $AA, $98, $38, $E9, $99, $9D, $16, $E9
        .byte   $E8, $A5, $57, $E9, $00, $9D, $16, $E9
        .byte   $E8, $8A, $48, $4C, $D6, $EB, $68, $A0
        .byte   $00, $99, $16, $E9, $C8, $B9, $17, $E8
        .byte   $99, $16, $E9, $20, $4F, $EF, $4C, $49
        .byte   $EA, $A0, $02, $B9, $17, $E8, $8D, $64
        .byte   $EC, $C8, $B9, $17, $E8, $8D, $6A, $EC
        .byte   $C8, $B9, $17, $E8, $85, $57, $C8, $B9
        .byte   $17, $E8, $85, $56, $A0, $08, $B9, $17
        .byte   $E8, $85, $59, $C8, $B9, $17, $E8, $85
        .byte   $58, $A0, $00, $B1, $56, $91, $58, $C6
        .byte   $56, $A5, $56, $C9, $FF, $D0, $02, $C6
        .byte   $57, $C6, $58, $A5, $58, $C9, $FF, $D0
        .byte   $02, $C6, $59, $A9, $99, $C5, $57, $90
        .byte   $E2, $A9, $99, $C5, $56, $90, $DC, $4C
        .byte   $49, $EA, $A0, $02, $B9, $17, $E8, $85
        .byte   $57, $C8, $B9, $17, $E8, $85, $56, $C8
        .byte   $B9, $17, $E8, $8D, $AE, $EC, $C8, $B9
        .byte   $17, $E8, $8D, $B4, $EC, $C8, $B9, $17
        .byte   $E8, $85, $59, $C8, $B9, $17, $E8, $85
        .byte   $58, $A0, $00, $B1, $56, $91, $58, $E6
        .byte   $56, $D0, $02, $E6, $57, $E6, $58, $D0
        .byte   $02, $E6, $59, $A5, $57, $C9, $01, $90
        .byte   $EA, $A5, $56, $C9, $00, $90, $E4, $4C
        .byte   $49, $EA, $A0, $02, $B9, $17, $E8, $85
        .byte   $57, $C8, $B9, $17, $E8, $85, $56, $C8
        .byte   $B9, $17, $E8, $8D, $F8, $EC, $C8, $B9
        .byte   $17, $E8, $8D, $FE, $EC, $C8, $B9, $17
        .byte   $E8, $85, $59, $C8, $B9, $17, $E8, $85
        .byte   $58, $A0, $00, $B1, $56, $D1, $58, $D0
        .byte   $26, $E6, $56, $D0, $02, $E6, $57, $E6
        .byte   $58, $D0, $02, $E6, $59, $A5, $57, $C9
        .byte   $99, $90, $E8, $A5, $56, $C9, $99, $90
        .byte   $E2, $A2, $02, $A9, $FF, $9D, $16, $E9
        .byte   $E8, $9D, $16, $E9, $4C, $34, $ED, $48
        .byte   $A2, $02, $A5, $57, $9D, $16, $E9, $E8
        .byte   $A5, $56, $9D, $16, $E9, $E8, $68, $9D
        .byte   $16, $E9, $E8, $A5, $59, $9D, $16, $E9
        .byte   $E8, $A5, $58, $9D, $16, $E9, $E8, $B1
        .byte   $58, $9D, $16, $E9, $E8, $8A, $A2, $00
        .byte   $9D, $16, $E9, $E8, $BD, $17, $E8, $9D
        .byte   $16, $E9, $20, $4F, $EF, $4C, $49, $EA
        .byte   $A2, $00, $BD, $13, $E8, $95, $56, $E8
        .byte   $E0, $04, $90, $F6, $AE, $11, $E8, $9A
        .byte   $A0, $00, $B9, $17, $E8, $99, $16, $E9
        .byte   $C8, $B9, $17, $E8, $99, $16, $E9, $C8
        .byte   $B9, $17, $E8, $48, $C8, $B9, $17, $E8
        .byte   $48, $88, $AD, $F0, $03, $99, $17, $E8
        .byte   $C8, $AD, $F1, $03, $99, $17, $E8, $A9
        .byte   $98, $8D, $F0, $03, $A9, $ED, $8D, $F1
        .byte   $03, $AE, $0E, $E8, $AC, $0F, $E8, $AD
        .byte   $10, $E8, $48, $AD, $0D, $E8, $28, $60
        .byte   $EA, $4C, $A4, $EF, $BA, $8E, $11, $E8
        .byte   $88, $B9, $17, $E8, $8D, $F0, $03, $C8
        .byte   $B9, $17, $E8, $8D, $F1, $03, $20, $4F
        .byte   $EF, $4C, $49, $EA, $A2, $7C, $A9, $C0
        .byte   $8D, $12, $E8, $A9, $00, $85, $56, $85
        .byte   $57, $A8, $B1, $56, $85, $58, $C8, $D0
        .byte   $03, $20, $C7, $EE, $B1, $56, $C5, $58
        .byte   $F0, $1D, $A5, $58, $C9, $83, $D0, $0B
        .byte   $48, $20, $97, $EF, $CA, $D0, $03, $20
        .byte   $C1, $EE, $68, $20, $97, $EF, $CA, $D0
        .byte   $03, $20, $C1, $EE, $4C, $C2, $ED, $C8
        .byte   $D0, $03, $20, $C7, $EE, $B1, $56, $C5
        .byte   $58, $F0, $33, $A5, $58, $C9, $83, $D0
        .byte   $16, $48, $20, $97, $EF, $CA, $D0, $03
        .byte   $20, $C1, $EE, $68, $48, $20, $97, $EF
        .byte   $CA, $D0, $03, $20, $C1, $EE, $68, $48
        .byte   $20, $97, $EF, $CA, $D0, $03, $20, $C1
        .byte   $EE, $68, $20, $97, $EF, $CA, $D0, $03
        .byte   $20, $C1, $EE, $4C, $C2, $ED, $A9, $03
        .byte   $85, $59, $C8, $D0, $03, $20, $C7, $EE
        .byte   $B1, $56, $C5, $58, $F0, $4F, $A9, $83
        .byte   $20, $97, $EF, $CA, $D0, $03, $20, $C1
        .byte   $EE, $A5, $59, $C9, $83, $D0, $23, $A9
        .byte   $40, $20, $97, $EF, $CA, $D0, $03, $20
        .byte   $C1, $EE, $A5, $58, $20, $97, $EF, $CA
        .byte   $D0, $03, $20, $C1, $EE, $A9, $83, $20
        .byte   $97, $EF, $CA, $D0, $03, $20, $C1, $EE
        .byte   $A9, $43, $20, $97, $EF, $CA, $D0, $03
        .byte   $20, $C1, $EE, $A5, $58, $20, $97, $EF
        .byte   $CA, $D0, $03, $20, $C1, $EE, $A9, $00
        .byte   $85, $59, $4C, $C2, $ED, $A5, $59, $18
        .byte   $69, $01, $B0, $05, $85, $59, $4C, $32
        .byte   $EE, $A9, $83, $20, $97, $EF, $CA, $D0
        .byte   $03, $20, $C1, $EE, $A5, $59, $20, $97
        .byte   $EF, $CA, $D0, $03, $20, $C1, $EE, $A5
        .byte   $58, $20, $97, $EF, $CA, $D0, $03, $20
        .byte   $C1, $EE, $A9, $01, $85, $59, $4C, $32
        .byte   $EE, $20, $7F, $EF, $A2, $80, $60, $AD
        .byte   $12, $E8, $38, $E9, $01, $F0, $0B, $8D
        .byte   $12, $E8, $A5, $57, $18, $69, $01, $85
        .byte   $57, $60, $68, $68, $A5, $59, $F0, $1B
        .byte   $A9, $83, $20, $97, $EF, $CA, $D0, $03
        .byte   $20, $C1, $EE, $A5, $59, $20, $97, $EF
        .byte   $CA, $D0, $03, $20, $C1, $EE, $A5, $58
        .byte   $20, $97, $EF, $4C, $49, $EA, $A9, $C0
        .byte   $8D, $12, $E8, $A9, $00, $85, $56, $85
        .byte   $57, $A8, $20, $7F, $EF, $C9, $83, $F0
        .byte   $0B, $91, $56, $C8, $D0, $03, $20, $37
        .byte   $EF, $4C, $0A, $EF, $20, $7F, $EF, $C9
        .byte   $83, $F0, $EE, $AA, $20, $7F, $EF, $91
        .byte   $56, $C8, $D0, $05, $48, $20, $37, $EF
        .byte   $68, $CA, $D0, $F3, $4C, $0A, $EF, $AD
        .byte   $12, $E8, $38, $E9, $01, $F0, $0B, $8D
        .byte   $12, $E8, $A5, $57, $18, $69, $01, $85
        .byte   $57, $60, $68, $68, $4C, $49, $EA, $A0
        .byte   $00, $B9, $16, $E9, $AA, $20, $7F, $EF
        .byte   $C9, $FF, $F0, $0A, $B9, $16, $E9, $20
        .byte   $97, $EF, $C8, $CA, $D0, $EF, $60, $A2
        .byte   $00, $B5, $56, $9D, $13, $E8, $E8, $E0
        .byte   $04, $90, $F6, $60, $A9, $03, $8D, $B0
        .byte   $C0, $A9, $11, $8D, $B0, $C0, $60, $A9
        .byte   $70, $2C, $B0, $C0, $D0, $0C, $A9, $01
        .byte   $2C, $B0, $C0, $F0, $F2, $AD, $B1, $C0
        .byte   $18, $60, $AD, $B1, $C0, $38, $60, $48
        .byte   $A9, $02, $2C, $B0, $C0, $F0, $FB, $68
        .byte   $8D, $B1, $C0, $60, $A5, $45, $8D, $0D
        .byte   $E8, $A5, $46, $8D, $0E, $E8, $A5, $47
        .byte   $8D, $0F, $E8, $A5, $48, $8D, $10, $E8
        .byte   $A5, $49, $18, $69, $04, $8D, $11, $E8
        .byte   $A0, $02, $A5, $3A, $38, $E9, $02, $99
        .byte   $16, $E9, $C8, $A5, $3B, $E9, $00, $99
        .byte   $16, $E9, $4C, $9C, $ED, $85, $45, $28
        .byte   $86, $46, $84, $47, $08, $68, $85, $48
        .byte   $BA, $86, $49, $D8, $68, $85, $3A, $68
        .byte   $85, $3B, $6C, $F0, $03, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $FE, $FF, $FF, $00, $00

;;; ============================================================
;;; "War Report" for "World War 1 Ace" mode
;;; The whole display is rendered, then the stats are re-rendered
;;; in orange.

.assert * = $F000, error, .sprintf("placement, %04X", *)

msg_war_report: MESSAGE $00, $18, "***** WAR REPORT *****"
                MESSAGE $0C, $04, "ENEMY PLANES SHOT DOWN = "
msg_wr2:        MESSAGE $0C, $68, "000", str_enemy_shot_down
                MESSAGE $12, $04, "BOMB HITS = "
msg_wr3:        MESSAGE $12, $34, "000", str_bomb_hits
                MESSAGE $18, $04, "AIRCRAFT DAMAGE BY ENEMY = "
msg_wr4:        MESSAGE $18, $70, "000", str_damage_by_enemy
                MESSAGE $24, $04, "ENEMY STATUS: 0=SHOT DOWN"
                MESSAGE $2A, $3C, "1=RETURNING OR HOME"
                MESSAGE $30, $3C, "2=ATTACKING"

                MESSAGE $3C, $04, "ENEMY 1 = "
msg_wr5:        MESSAGE $3C, $2C, "0", str_enemy1_status

                MESSAGE $3C, $3C, "ENEMY 2 = "
msg_wr6:        MESSAGE $3C, $64, "0", str_enemy2_status

                MESSAGE $42, $04, "ENEMY 3 = "
msg_wr7:        MESSAGE $42, $2C, "0", str_enemy3_status

                MESSAGE $42, $3C, "ENEMY 4 = "
msg_wr8:        MESSAGE $42, $64, "0", str_enemy4_status

                MESSAGE $48, $04, "ENEMY 5 = "
msg_wr9:        MESSAGE $48, $2C, "0", str_enemy5_status

                MESSAGE $48, $3C, "ENEMY 6 = "
msg_wr10:       MESSAGE $48, $64, "0", str_enemy6_status

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
        CALLAX  Set3DigitStringRelay, str_enemy_shot_down
        lda     $A81B
        sta     $B6
        lda     #$00
        sta     $B7
        CALLAX  Set3DigitStringRelay, str_bomb_hits
        lda     $08A4
        sta     $B6
        lda     #$00
        sta     $B7
        CALLAX  Set3DigitStringRelay, str_damage_by_enemy
        lda     $A972
        ora     #$30
        sta     str_enemy1_status
        lda     $A98E
        ora     #$30
        sta     str_enemy2_status
        lda     $A9AA
        ora     #$30
        sta     str_enemy3_status
        lda     $A9C6
        ora     #$30
        sta     str_enemy4_status
        lda     $A9E2
        ora     #$30
        sta     str_enemy5_status
        lda     $A9FE
        ora     #$30
        sta     str_enemy6_status
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

LF242:  .word   0
LF244:  brk
LF245:  brk
        .byte   $41
LF247:  .word   0
LF249:  .word   0
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
LF338:  ADD16C  $1B, $1E, LF247
        eor     #$FF
        sta     LF252
        lda     LF247
        eor     #$FF
        clc
        adc     #$01
        sta     LF251
        bne     LF35C
        inc     LF252
LF35C:  SUB16C  $1B, $1E, LF242
        eor     #$FF
        sta     LF24D
        lda     LF242
        eor     #$FF
        clc
        adc     #$01
        sta     LF24C
        bne     LF380
        inc     LF24D
LF380:  SUB16C  $18, $A9, LF249
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

        .assert * = $F400, error, .sprintf("EOF mismatch, %04X", *)
