        .org $f600

;;; Some functionality that is only present in the "64k" mode
;;; of the original FS2 (per Appendix 3):
;;; * Altimeter 3rd hand.
;;; * Course plotter system.
;;; * Improved demo mode.

;;; ============================================================
;;; Course Plotting

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

CoursePlotterSampleRate:
        .byte   10
CoursePlotterSampleCounter:
        .byte   1               ; reset to above; sample at 0
CoursePlotterState:
        .byte   0               ; 0 = off; 1 = record; 2 = display
CoursePlotterRecordPos:
        .word   0               ; pointer to data pos ($D000...$DFFF)
CoursePlotterSampleRange:
        .byte   0               ; 6 = normal, 4 = precision
CoursePlotterAnyData:
        .byte   0               ; 0 = not data, 1 = some data

CoursePlottingMenu:
        jsr     ClearViewportsToBlack
        CALLAX  DrawMultiMessage, msg_courseplotter
        jsr     TogglePause
        cmp     #'A'
        beq     BeginNormalCourseRecording
        cmp     #'B'
        beq     DisplayCoursePlot
        cmp     #'C'
        beq     BootDOS
        cmp     #'D'
        beq     BeginPrecisionRecording
        cmp     #'E'
        beq     TurnOffCoursePlotter
        cmp     #$1B            ; Escape
        bne     CoursePlottingMenu
        rts

BeginNormalCourseRecording:
        ldx     #$06            ; range
        lda     #$0A            ; rate
        bne     BeginRecordingCommon ; always

DisplayCoursePlot:
        lda     CoursePlotterAnyData
        beq     CoursePlottingMenu
        lda     #$02
        sta     CoursePlotterState
        jmp     CoursePlottingMenu

BootDOS:
        lda     BootSlot
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        ora     #$C0
        sta     RebootVector+1
        lda     #$00
        sta     RebootVector
        lda     #OPC_NOP
        sta     MaybeBootDOS    ; override RTS
        jmp     CoursePlottingMenu ; ???

TurnOffCoursePlotter:
        lda     #$00
        sta     CoursePlotterState
        jmp     CoursePlottingMenu

BeginPrecisionRecording:
        ldx     #$04            ; range
        lda     #$02            ; rate

BeginRecordingCommon:
        stx     CoursePlotterSampleRange
        sta     CoursePlotterSampleRate
        lda     #$01
        sta     CoursePlotterState
        jsr     EnableLCBank1
        LDAX    #$D000
        STAX    $B8
        ldy     #$00
        lda     #$07
        sta     ($B8),y
        iny
        lda     CoursePlotterSampleRange
        sta     ($B8),y
        iny

        ldx     #$00
:       lda     $5A,x
        sta     ($B8),y
        inx
        iny
        cpx     #$0C
        bne     :-

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
        sta     CoursePlotterRecordPos
        lda     $B9
        sta     CoursePlotterRecordPos+1
        lda     #$01
        sta     CoursePlotterAnyData
        jsr     EnableLCBank2
        jmp     CoursePlottingMenu

;;; ============================================================
;;; Course Plotting - Record State

LF7E2:  lda     CoursePlotterState
        bne     :+
        rts
:
        cmp     #$01            ; recording?
        beq     MaybeRecord     ; yes, maybe grab a sample
        cmp     #$02
        beq     Display
        rts

Display:
        LDAX    #$D000
        STAX    $8B
        jsr     EnableLCBank1
        jsr     L6006
        jsr     EnableLCBank2
        rts

MaybeRecord:
        dec     CoursePlotterSampleCounter
        beq     :+
        rts
:
        ;; Is there room?
        lda     CoursePlotterSampleRate
        sta     CoursePlotterSampleCounter
        lda     #<$DFE0
        sec
        sbc     CoursePlotterRecordPos
        lda     #>$DFE0
        sbc     CoursePlotterRecordPos+1
        bpl     :+
        rts                     ; nope
:
        jsr     EnableLCBank1
        LDAX    CoursePlotterRecordPos
        STAX    $B8
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
        jsr     AdjustForRange
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
        jsr     AdjustForRange
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
        jsr     AdjustForRange
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
        sta     CoursePlotterRecordPos
        lda     $B9
        adc     #$00
        sta     CoursePlotterRecordPos+1
        jsr     EnableLCBank2
        rts

EnableLCBank1:
        lda     #$01
        sta     $08B0
        lda     LCBANK1
        lda     LCBANK1
        rts

EnableLCBank2:
        lsr     $08B0
        lda     LCBANK2
        lda     LCBANK2
        rts

AdjustForRange:
        lda     CoursePlotterSampleRange
        cmp     #$04            ; reduced range?
        beq     :+
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
:       rts

;;; ============================================================
;;; Altimeter - Third Hand (10k)

LF8E6:  .byte   $FF

        ;; Table of PixelLists for altimeter's "third hand"
PixelListAltimeter10KTable:
        .addr   PLF8F9
        .addr   PLF906
        .addr   PLF919
        .addr   PLF926
        .addr   PLF933
        .addr   PLF944
        .addr   PLF94F
        .addr   PLF95C
        .addr   PLF96B

PLF8F9: .byte   6, $80,$69, $80,$6A, $82,$6A, $80,$6B, $81,$6B, $82,$6B

PLF906: .byte   9, $8C,$6B, $8A,$6C, $89,$6C, $89,$6D, $88,$6D, $8A,$6D, $89,$6E
        .byte   $88,$6E, $87,$6E

PLF919: .byte   6, $8E,$6D, $8D,$6E, $8D,$6F, $8E,$6F, $8D,$70, $8B,$6F

PLF926: .byte   6, $93,$72, $92,$73, $94,$71, $92,$73, $91,$73, $90,$73

PLF933: .byte   8, $95,$78, $98,$78, $96,$79, $95,$79, $94,$79, $94,$7A, $95,$7A, $91,$79

PLF944: .byte   5, $95,$7D, $96,$7D, $94,$7D, $94,$7C, $94,$7E

PLF94F: .byte   6, $95,$84, $94,$84, $94,$83, $95,$83, $91,$83, $61,$82

PLF95C: .byte   7, $93,$8A, $92,$8A, $92,$89, $91,$89, $90,$89, $91,$8A, $94,$8B

PLF96B: .byte   7, $8C,$8E, $8D,$8E, $8E,$8E, $8C,$8D, $8B,$8D, $8A,$8D, $8D,$8F

        ;; Draw's altimeter's "third hand" (10k, arrow by outside)
.proc UpdateAltimeter10K
        lda     $60
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
        lda     PixelListAltimeter10KTable,x
        sta     PixelListData
        lda     PixelListAltimeter10KTable+1,x
        ldx     #$00
        ldy     #$00
        jmp     DrawPixelListHelper
.endproc

;;; ============================================================
;;; ???

LF9B3:  brk

LF9B4:  rts

LF9B5:  lda     $09E3
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
        jsr     ScaleC2ByAX
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
        jsr     ScaleC2ByAX
LFA4F:  sta     $08A1
        stx     $08A2
        rts

LFA56:  lda     $5F
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

        LDAX    #$0965
        jmp     LFA96

LFA81:  LDAX    #$0969
        jmp     LFA96

LFA88:  LDAX    #$096D
        jmp     LFA96

LFA8F:  LDAX    #$0971
        inc     $09A6

LFA96:  STAX    $BE
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

;;; ============================================================
;;; Demo Mode

DemoModeParam1:  .byte   $01    ; constant
DemoModeParam2:  .byte   $06    ; constant
DemoModeParam3:  .byte   $02

.proc DemoMode64K
        lda     YokeVertPos
        cmp     #$18
        bcs     :+
        jsr     YokeUp
:       lda     $60
        cmp     DemoModeParam1
        bcs     :+
        jsr     MoreThrottle
        jmp     Common
:
        cmp     DemoModeParam2
        bcc     Common
        jsr     LessThrottle

Common:
        lda     #$24
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
        cmp     DemoModeParam3
        bcc     LFB66
        lda     #$01
        sta     DemoModeParam3
        lda     $B7
        eor     #$80
        tax
        lda     $B6
        sbc     $09E4
        txa
        sbc     $09E5
        bpl     :+

        ;; Maybe turn left
        lda     $09B0
        eor     #$80
        cmp     #$72
        bcc     Center
        jsr     YokeLeft
        jsr     YokeLeft
        rts
:
        ;; Maybe turn right
        lda     $09B0
        eor     #$80
        cmp     #$8E
        bcs     Center
        jsr     YokeRight
        jsr     YokeRight
        rts

LFB66:  lda     #$02
        sta     DemoModeParam3
        ldx     $09B0
        beq     Exit
        bpl     LFB74
        inx
        inx
LFB74:  dex
        stx     $09B0
Center:
        jsr     YokeCenter

Exit:   rts
.endproc

;;; ============================================================

        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $00, $FF, $FF, $00, $00
        .byte   $FF, $FF, $00, $76

        .assert * = $FC00, error, "EOF mismatch"

;;; $FC00 is used for instrument save buffers
