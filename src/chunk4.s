; da65 V2.19 - Git 7f1dd09bc
; Created:    2024-08-24 11:58:16
; Input file: ../chunks/4_0200-25ff
; Page:       1

        .setcpu "6502"
        .org $200
        .include "macros.inc"

        .refto __APPLE2__

OPC_ADC_izy = $71
OPC_SBC_izy = $F1
OPC_CLC     = $18
OPC_SEC     = $38
OPC_DEX     = $CA
OPC_INX     = $E8
OPC_DEC_zp  = $C6
OPC_INC_zp  = $E6

L002D           := $002D

ValueForString  := $B6          ; $B6-B7
;;; Used by `DivideByAXAndSetDigitY`

;;; chunk5 references
LA7E2           := $A7E2        ; reset (etc) handler)
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
        ora     ($06,x)
        brk
        brk
        ora     ($00,x)
        brk
        ora     ($01,x)
        ora     ($00,x)
        .byte   $02
        ora     ($02,x)
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
        ora     #$00
        brk
        ora     ($00,x)
        .byte   $02
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        ora     ($01,x)
        .byte   $02
        ora     ($03,x)
        ora     ($02,x)
        .byte   $02
        .byte   $0C
        ora     ($00,x)
        .byte   $02
        brk
        brk
        ora     ($01,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($00,x)
        .byte   $02
        ora     ($02,x)
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $02
        ora     ($03,x)
        .byte   $02
        .byte   $03
        .byte   $0C
        brk
        brk
        brk
        ora     ($00,x)
        .byte   $02
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        ora     $01
        brk
        ora     ($01,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($04,x)
        ora     ($05,x)
L02A2:  brk
        brk
        brk
        brk
        brk
L02A7:  .byte   $82
        .byte   $82
        .byte   $1A
        .byte   $82
        .byte   $B4
L02AC:  ror     $7E7E,x
        tax
        .byte   $AF
L02B1:  brk
        ora     ($00,x)
        ora     ($01,x)
        .byte   $14
        .byte   $03
        .byte   $1B
        .byte   $03
        .byte   $22
        .byte   $03
        and     $3A03
        .byte   $03
        eor     #$03
        .byte   $5C
        .byte   $03
        adc     ($03),y
        dey
        .byte   $03
        lda     ($03,x)
        ldy     a:$03,x
        .byte   $04
        .byte   $1F
        .byte   $04
        rti

        .byte   $04
        .byte   $63
        .byte   $04
        dey
        .byte   $04
        .byte   $AF
        .byte   $04
        dec     $04,x
        .byte   $FF
        .byte   $04
        plp
        ora     $53
        ora     $7E
        ora     $A9
        ora     $D4
        ora     $D4
        ora     $DD
        ora     $E8
        ora     $F5
        ora     $04
        asl     $13
        asl     $24
        asl     $37
        asl     $4C
        asl     $63
        asl     $7C
        asl     $95
        asl     $B0
        asl     $CD
        asl     $EC
        asl     $0B
        .byte   $07
        bit     $4F07
        .byte   $07
        .byte   $72
        .byte   $07
        sta     $07,x
        tsx
        .byte   $07
        bvc     L0320
        adc     $0E,x
        ora     ($0A,x)
        brk
        ora     $01,x
        asl     a
        .byte   $FF
        ora     ($05,x)
        brk
        bpl     L0321
L0320:  .byte   $14
L0321:  .byte   $FF
        ora     ($03,x)
        brk
        ora     #$01
        .byte   $0C
        asl     $0C
        bpl     L0331
        .byte   $FF
        ora     ($02,x)
        brk
        .byte   $07
L0331:  ora     ($0A,x)
        ora     $0A
        .byte   $0B
        php
        ora     ($04),y
        .byte   $FF
        brk
        .byte   $03
        ora     ($05,x)
        ora     ($08,x)
        .byte   $04
        php
        php
        .byte   $07
        ora     $1105
        .byte   $03
        .byte   $FF
        brk
        .byte   $03
        ora     ($04,x)
        ora     ($06,x)
        .byte   $03
        asl     $06
        asl     $09
        ora     $0C
        .byte   $04
        .byte   $0F
        .byte   $03
        .byte   $12
        .byte   $02
        .byte   $FF
        brk
        .byte   $02
        ora     ($03,x)
        ora     ($05,x)
        .byte   $03
        ora     $05
        ora     $08
        .byte   $04
        asl     a
        .byte   $04
        .byte   $0C
        .byte   $04
        .byte   $0F
        .byte   $03
        ora     ($02),y
        .byte   $FF
        brk
        .byte   $02
        ora     ($03,x)
        ora     ($05,x)
        .byte   $03
        .byte   $04
        ora     $04
        .byte   $07
        .byte   $04
        ora     #$04
        .byte   $0B
        .byte   $03
        ora     $0F03
        .byte   $03
        ora     ($02),y
        .byte   $FF
        brk
        .byte   $03
        brk
        ora     $00
        asl     $01
        asl     $03
        asl     $05
        ora     $07
        .byte   $04
        ora     #$04
        .byte   $0B
        .byte   $03
        ora     $0F02
        .byte   $02
        ora     ($01),y
        .byte   $FF
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        ora     $01
        asl     $03
        ora     $04
        ora     $06
        .byte   $04
        php
        .byte   $03
        ora     #$03

        ;; $03D0 - warm start jump vector
        .byte   $0B
        .byte   $03
        .byte   $0C
        .byte   $03
        asl     $1002
        ora     ($FF,x)
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        ora     $01
        ora     $03
        .byte   $04
        .byte   $04
        .byte   $04
        ora     $04
        .byte   $07
        .byte   $03
        php
        .byte   $03
        ora     #$03
        .byte   $0B
        .byte   $02
        .byte   $0C
        .byte   $02
        ora     $0F02
        ora     ($FF,x)
        jmp     $B7B5

        lda     $9D0F
        ldy     $9D0E
        rts

        lda     $AAC2
        ldy     $AAC1
        rts

        jmp     LA851

        nop
        nop

        .byte   $4c             ; JMP ???
        .addr   $ED98           ; BRK vector
        .addr   LA7E2           ; Reset vector
        .byte   $02             ; PWRUP byte
        jmp     L1F89           ; Applesoft & vector
        jmp     L1F89           ; Monitor Ctrl-Y vector
        jmp     LA7E2           ; NMI vector
        .addr   LA7E2           ; IRQ vector


        ;; Text page 1 - and screen holes!

        brk
L0401:  .byte   $03
        brk
        .byte   $04
        brk
        ora     $01
        ora     $02
        .byte   $04
        .byte   $03
        .byte   $04
        ora     $03
        asl     $03
        .byte   $07
        .byte   $03
        php
        .byte   $03
        ora     #$03
        asl     a
        .byte   $02
        .byte   $0C
        ora     ($0D,x)
        ora     ($0E,x)
        ora     ($FF,x)
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        .byte   $04
        ora     ($04,x)
        .byte   $02
        .byte   $04
        .byte   $03
        .byte   $04
        .byte   $04
        .byte   $03
        ora     $03
        asl     $03
        .byte   $07
        .byte   $03
        php
        .byte   $02
        ora     #$02
        asl     a
        .byte   $02
        .byte   $0B
        .byte   $02
        .byte   $0C
        ora     ($0D,x)
        ora     ($FF,x)
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        .byte   $04
        ora     ($04,x)
        .byte   $02
        .byte   $04
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        .byte   $03
        ora     $03
        asl     $03
        .byte   $07
        .byte   $02
        php
        .byte   $02
        ora     #$02
        ora     #$02
        asl     a
        .byte   $02
        .byte   $0B
        ora     ($0C,x)
        ora     ($FF,x)
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        .byte   $04
        ora     ($04,x)
        ora     ($04,x)
        .byte   $02
        .byte   $04
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $03
        .byte   $04
        .byte   $03
        ora     $03
        asl     $02
        .byte   $07
        .byte   $02
        .byte   $07
        .byte   $02
        php
        .byte   $02
        ora     #$01
        asl     a
        ora     ($0A,x)
        ora     ($0B,x)
        ora     ($FF,x)
        brk
        ora     ($00,x)
        .byte   $03
        ora     ($02,x)
        ora     ($03,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $02
        .byte   $04
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $02
        ora     $02
        asl     $02
        asl     $02
        .byte   $07
        .byte   $02
        php
        ora     ($08,x)
        .byte   $02
        ora     #$01
        ora     #$02
        asl     a
        ora     ($FF,x)
        brk
        ora     ($00,x)
        .byte   $03
        ora     ($02,x)
        ora     ($03,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $02
        ora     $02
        asl     $02
        asl     $02
        .byte   $07
        ora     ($07,x)
        .byte   $02
        php
        ora     ($08,x)
        .byte   $02
        ora     #$01
        .byte   $FF
        brk
        ora     ($00,x)
        .byte   $03
        brk
        .byte   $03
        ora     ($03,x)
        ora     ($03,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        .byte   $02
        .byte   $04
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $02
        ora     $02
        asl     $01
        asl     $02
        .byte   $07
        ora     ($07,x)
        ora     ($08,x)
        ora     ($08,x)
        ora     ($FF,x)
        brk
        ora     ($00,x)
        .byte   $03
        brk
        .byte   $03
        ora     ($02,x)
        ora     ($03,x)
        .byte   $01
L050A:  .byte   $03
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        ora     ($04,x)
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $01
        ora     $01
        ora     $02
        asl     $01
        asl     $01
        .byte   $FF
        ora     ($01,x)
        brk
        .byte   $03
        brk
        .byte   $03
        ora     ($02,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($03,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        ora     ($04,x)
        ora     ($04,x)
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $01
        ora     $01
        .byte   $FF
        ora     ($01,x)
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        ora     ($02,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($03,x)
        ora     ($03,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        ora     ($03,x)
        ora     ($03,x)
        ora     ($03,x)
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        ora     ($04,x)
        ora     ($04,x)
        ora     ($FF,x)
        ora     ($01,x)
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        .byte   $02
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($FF,x)
        ora     ($01,x)
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        .byte   $FF
        .byte   $07
        php
        brk
        .byte   $12
        .byte   $04
        ora     L050A
        .byte   $FF
        .byte   $07
        .byte   $07
        brk
        bpl     L05E5
        .byte   $0F
        .byte   $07
        asl     a
L05E5:  .byte   $0B
        .byte   $04
        .byte   $FF
        brk
        ora     ($00,x)
        asl     L0E02
        ora     $0D
        ora     #$08
        .byte   $0C
        .byte   $03
        .byte   $FF
        brk
        ora     ($00,x)
        .byte   $07
        .byte   $02
        .byte   $0C
        .byte   $04
        .byte   $0C
        asl     $0C
        ora     #$07
        .byte   $0B
        .byte   $03
        .byte   $FF
        brk
        .byte   $04
L0606:  ora     ($09,x)
        .byte   $03
        .byte   $0B
        ora     $0A
        .byte   $07
        ora     #$09
        .byte   $07
        .byte   $0B
        asl     $FF
        brk
        .byte   $03
        ora     ($06,x)
        .byte   $03
        php
        ora     $09
        asl     $09
        php
        php
        asl     a
        asl     $0C
        ora     $FF
        brk
        .byte   $02
        ora     ($04,x)
        .byte   $03
        asl     $04
        php
        ora     $09
        .byte   $07
        php
        php
        php
        ora     #$07
        .byte   $0B
        asl     $FF
        brk
        .byte   $02
        ora     ($03,x)
        .byte   $02
        .byte   $04
        .byte   $04
        ora     $05
        asl     $06
        .byte   $07
        .byte   $07
        .byte   $07
        php
        .byte   $07
        asl     a
        ora     $0B
        ora     $FF
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
        asl     $08
        asl     $09
        ora     $0A
        ora     $0C
        .byte   $03
        .byte   $FF
        brk
        ora     ($01,x)
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        ora     $05
        ora     $07
        asl     $07
        .byte   $07
        .byte   $07
        php
        asl     $09
        asl     $0C
        .byte   $03
        .byte   $FF
        brk
        ora     ($01,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        ora     $04
        ora     $06
        asl     $06
        .byte   $07
        asl     $08
        ora     $09
        ora     $0B
        .byte   $03
        .byte   $FF
        brk
        ora     ($01,x)
        .byte   $02
        ora     ($03,x)
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        ora     $05
        asl     $06
        asl     $07
        ora     $07
        asl     $08
        ora     $0A
        .byte   $03
        .byte   $FF
        brk
        ora     ($01,x)
        ora     ($01,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        ora     $05
        ora     $06
        ora     $06
        ora     $07
        ora     $08
        .byte   $04
        asl     a
        .byte   $02
        .byte   $FF
        brk
        ora     ($01,x)
        ora     ($01,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        ora     $05
        ora     $05
        asl     $06
        ora     $06
        ora     $07
        ora     $08
        .byte   $04
        asl     a
        .byte   $02
        .byte   $FF
        brk
        ora     ($01,x)
        ora     ($01,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $03
        .byte   $04
        .byte   $04
        ora     $04
        ora     $05
        asl     $04
        asl     $05
        .byte   $07
        .byte   $04
        ora     #$02
        .byte   $FF
        brk
        ora     ($00,x)
        .byte   $02
        ora     ($02,x)
        ora     ($02,x)
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $03
        ora     $04
        .byte   $04
        .byte   $04
        ora     $05
        ora     $05
        ora     $06
        .byte   $04
        .byte   $07
        .byte   $03
        ora     #$01
        .byte   $FF
        brk
        ora     ($00,x)
        .byte   $02
        ora     ($01,x)
        ora     ($02,x)
        ora     ($03,x)
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $03
        ora     $03
        ora     $03
        asl     $04
        ora     $04
        ora     $05
        .byte   $04
        asl     $03
        php
        ora     ($FF,x)
        brk
        ora     ($00,x)
        .byte   $02
        brk
        .byte   $02
        ora     ($02,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($04,x)
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $03
        .byte   $04
        .byte   $03
        ora     $03
        ora     $04
        .byte   $04
        ora     $03
        .byte   $07
        ora     ($FF,x)
        brk
        ora     ($00,x)
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $03
        ora     ($02,x)
        ora     ($03,x)
        ora     ($03,x)
        ora     ($04,x)
        ora     ($04,x)
        ora     ($05,x)
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $02
        ora     $02
        ora     $03
        .byte   $04
        .byte   $04
        .byte   $03
        asl     $01
        .byte   $FF
        ora     ($01,x)
        ora     ($01,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($03,x)
        ora     ($04,x)
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $04
        .byte   $02
        .byte   $04
        .byte   $02
        ora     $02
        ora     $02
        ora     $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $04
        ora     ($04,x)
        ora     ($FF,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($03,x)
        ora     ($03,x)
        ora     ($03,x)
        ora     ($03,x)
        ora     ($04,x)
        ora     ($04,x)
        ora     ($04,x)
        ora     ($05,x)
        ora     ($05,x)
        .byte   $02
        .byte   $03
        .byte   $02
        .byte   $03
        .byte   $03
        ora     ($03,x)
        ora     ($FF,x)
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
        brk
        brk
        brk
        brk
        brk
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
        brk
        brk
        ora     ($00,x)
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
        brk
        brk
        brk
        brk
        brk
        brk
        ora     ($00,x)
        brk

        ;; $8C9
        MESSAGE $9B, $68, "BOMBS: 5 " ; modified in chunk5
        brk
        brk

        ;; $8D7
        MESSAGE $9B, $68, "SCORE:000" ; modified in chunk5

        brk
        brk
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
        brk
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
        ora     ($00,x)
        brk
        brk
        brk
        iny
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
L0A3B:  brk
L0A3C:  brk
L0A3D:  brk
        brk
L0A3F:  brk
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
        brk
        .byte   $64
        brk
        brk
        brk
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
        .byte   $03
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
        ora     ($00,x)
        .byte   $FF
        .byte   $FF
        .byte   $03
        brk
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
        inc     L1F40,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        ldx     $AEAB,y
        tsx
        nop
        tax
        inc     $AEAA
        .byte   $EB
        ldx     $AEAA
        .byte   $EB
        .byte   $BB
        tax
        ldx     $BAEB
        tax
        ldx     $EAEA,y
        inc     $BABB
        tsx
        inc     $EAAE,x
        .byte   $AF
        inc     $EAEF,x
        .byte   $FA
        .byte   $FB
        .byte   $FA
        inc     $BFAE
        inc     $EAFE,x
        inc     $FEAF,x
        tax
        nop
        tax
        ldx     $BEEE
        ldx     $AAEA
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        tax
        cmp     $DA,x
        .byte   $EB
        .byte   $97
        .byte   $D7
        .byte   $CB
        .byte   $BF
        .byte   $F3
        .byte   $AB
        ldx     $96B7
        stx     $96,y
        stx     $AE,y
        sta     $BEEF,x
        tax
        tax
        tsx
        .byte   $AB
        tax
        .byte   $EF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
L0B1F:  .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        ldx     $BFFA,y
        inc     $FFEE
        tax
        .byte   $BB
        tsx
        ldx     $FEAF
        .byte   $AB
        inc     $BAAB,x
        nop
        nop
        .byte   $AB
        tax
        .byte   $AF
        .byte   $EB
        .byte   $FA
        .byte   $FA
        .byte   $FB
        nop
        .byte   $FA
        tsx
        .byte   $AB
        nop
        .byte   $FB
        tsx
        .byte   $AB
        .byte   $FF
        ldx     $BEAA,y
        tsx
        nop
        .byte   $AF
        tax
        .byte   $AF
        tax
        .byte   $AF
        .byte   $FB
        tsx
        ldx     $BFFA,y
        .byte   $FB
        tax
        .byte   $FA
        tsx
        .byte   $AB
        .byte   $FA
        tsx
        .byte   $AF
        .byte   $AB
        .byte   $BF
        inc     $FEFA,x
        .byte   $FF
        inc     $FABA,x
        tsx
        ldx     $FEFB,y
        inc     $EEAB
        .byte   $FB
        .byte   $AB
        .byte   $FA
        tax
        nop
        ldx     $AEFE,y
        inc     $EAAA,x
        ldx     $AFFE,y
        ldx     $ABAB,y
        .byte   $AF
        nop
        .byte   $BB
        .byte   $AF
        .byte   $EB
        .byte   $BB
        .byte   $AF
        .byte   $AB
        tax
        .byte   $AB
        tsx
        nop
        tsx
        .byte   $FF
        nop
        nop
        .byte   $FA
        tsx
        tax
        ldx     $BBBB,y
        tax
        .byte   $BF
        .byte   $BB
        .byte   $BB
        tax
        .byte   $BB
        .byte   $BB
        .byte   $BB
        inc     $ABEA
        .byte   $BB
        ldx     $BFEA
        tax
        tsx
        nop
        .byte   $AB
        ldx     $EEAA
        .byte   $AB
        .byte   $FB
        ldx     $AAFE
        tsx
        tax
        inc     $BAFF
        tax
        inc     $BAFF
        tax
        inc     $EEFF
        tax
        inc     $EAFA
        nop
        ldx     $FFAA
        .byte   $AB
        .byte   $AF
        .byte   $AF
        inc     $AFBB,x
        .byte   $FA
        ldx     $BABF
        .byte   $BB
        .byte   $AB
        nop
        .byte   $BF
        .byte   $AF
        inc     $FAAF
        .byte   $EF
        .byte   $AF
        tsx
        .byte   $EF
        tsx
        .byte   $FA
        .byte   $AB
        ldx     $97FA
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        tax
        tax
        .byte   $EB
        .byte   $AF
        .byte   $9B
        .byte   $97
        .byte   $9F
        inc     $FA
        .byte   $B3
        txs
        .byte   $F3
        stx     $96,y
        stx     $9B,y
        stx     $9D,y
        ldx     $AEFA
        .byte   $AF
        .byte   $AF
        .byte   $AF
        tax
        tax
        .byte   $FF
        tax
        .byte   $BF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        .byte   $EF
        ldx     $FEEF,y
        inc     $AFFA,x
        tax
        tsx
        inc     $BFAE
        tsx
        .byte   $FB
        .byte   $AF
        nop
        tax
        nop
        nop
        tax
        inc     $FBBA,x
        .byte   $FA
        tsx
        nop
        .byte   $FA
        .byte   $AF
        nop
        .byte   $AB
        tsx
        tax
        .byte   $AF
        .byte   $FF
        inc     $AFAE,x
        nop
        inc     $AABE
        ldx     $BFAF,y
        .byte   $FB
        tax
        tsx
        tax
        .byte   $FA
        inc     $AFEA
        .byte   $BB
        tax
        tax
        tax
        ldx     $FEAA
        .byte   $AB
        .byte   $AB
        tax
        .byte   $FA
        tax
        nop
        .byte   $AF
        .byte   $BF
        .byte   $EB
        tsx
        .byte   $AB
        tax
        .byte   $AB
        .byte   $AF
        ldx     $AFFF,y
        .byte   $FB
        tsx
        .byte   $AF
        .byte   $AB
        .byte   $FA
        .byte   $AB
        nop
        .byte   $FA
        nop
        nop
        inc     $AAFF,x
        inc     $BAFB,x
        inc     $BBBE,x
        .byte   $FA
        inc     $AFFE,x
        inc     $ABFB,x
        inc     $FFFF,x
        .byte   $FA
        .byte   $BB
        .byte   $FA
        tsx
        tax
        tax
        .byte   $AB
        tsx
        .byte   $AF
        tax
        .byte   $AB
        tsx
        ldx     $ABAA,y
        nop
        nop
        inc     $EAAB,x
        nop
        tax
        tax
        inc     $AAFA,x
        nop
        .byte   $FA
        .byte   $EB
        tsx
        .byte   $BF
        inc     $FEBF,x
        tax
        .byte   $BB
        .byte   $BB
        tsx
        tax
        .byte   $BF
        .byte   $BB
        tsx
        tax
        tsx
        .byte   $BB
        tsx
        nop
        .byte   $BF
        nop
        .byte   $FB
        .byte   $FA
        tax
        .byte   $EB
        nop
        .byte   $FB
        tax
        .byte   $FA
        .byte   $FB
        tsx
        inc     $ABFA,x
        tax
        nop
        ldx     $FFAB
        .byte   $BF
        .byte   $BB
        .byte   $AF
        .byte   $AF
        .byte   $AF
        .byte   $AF
        .byte   $AF
        ldx     $FEAB,y
        tsx
        .byte   $AF
        .byte   $AB
        tax
        .byte   $AB
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        .byte   $97
        tax
        lda     $9EAE
        .byte   $97
        txs
        ldy     $E9D7
        .byte   $B2
        ldx     $96FA
        stx     $96,y
        sta     $9D96,x
        ldx     $AFBA
        ldx     $BFEA,y
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        tax
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        .byte   $BF
        .byte   $FA
        .byte   $EB
        inc     $FFEF
        ldx     $AAAF,y
        .byte   $EF
        tsx
        .byte   $EF
        tax
        .byte   $AF
        ldx     $BAFB,y
        inc     $EAEA
        .byte   $AB
        nop
        .byte   $FB
        tax
        .byte   $AF
        tax
        .byte   $EB
        .byte   $FB
        .byte   $FA
        nop
        tax
        ldx     $BABF
        .byte   $BF
        .byte   $AF
        tax
        inc     $FFAF,x
        tax
        inc     $BABE,x
        inc     $EAFB
        .byte   $FB
        .byte   $AB
        .byte   $FA
        .byte   $FA
        .byte   $FB
        ldx     $AEEA
        inc     $AFAB,x
        .byte   $AB
        .byte   $BF
        tax
        nop
        .byte   $FA
        ldx     $FBFA
        tax
        .byte   $AB
        tax
        tax
        .byte   $AB
        .byte   $AF
        .byte   $BF
        .byte   $FA
        tax
        ldx     $EAEE
        nop
        inc     $AABB,x
        .byte   $FA
        .byte   $FF
        .byte   $AF
        nop
        .byte   $AB
        .byte   $BB
        tax
        .byte   $BF
        .byte   $BF
        ldx     $EAAB
        ldx     $BABB,y
        .byte   $BF
        inc     $FBBF
        .byte   $FF
        .byte   $BF
        inc     $FEEA
        .byte   $AB
        .byte   $BB
        inc     $AABA,x
        inc     $BAFA,x
        tax
        inc     $BAFA,x
        tax
        inc     $AFEA,x
        .byte   $AB
        inc     $AEEA,x
        .byte   $FF
        nop
        .byte   $AB
        .byte   $FB
        tax
        tsx
        tsx
        brk
        .byte   $37
        bvc     L0DFD
        .byte   $32
        rol     a
        asl     L191B,x
        ora     $3264,y
        asl     $12,x
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        sei
        sei
        .byte   $3C
        .byte   $27
        .byte   $0F
        clc
        ora     $12,x
        .byte   $0F
        .byte   $0F
        brk
        sei
        lsr     L002D
        .byte   $23
        ora     $1214,y
        ora     ($11),y
        asl     $F8
        .byte   $FF
        sbc     $F906,x
        .byte   $FF
        sbc     $FA06,x
        .byte   $FF
        sbc     $FB06,x
        .byte   $FF
        sbc     $FC07,x
        brk
        .byte   $FC
        .byte   $07
        sbc     $FC00,x
        .byte   $07
        inc     $FC00,x
        .byte   $07
L0DFD:  .byte   $FF
        brk
        .byte   $FC
        .byte   $07
        brk
L0E02:  brk
        .byte   $FC
        .byte   $07
        ora     ($00,x)
        .byte   $FC
        .byte   $07
        .byte   $02
        brk
        .byte   $FC
        .byte   $07
        .byte   $03
        brk
        .byte   $FC
        .byte   $07
        .byte   $04
        brk
        .byte   $FC
        .byte   $07
        ora     $01
        sbc     L0606,x
        ora     ($FD,x)
        asl     $07
        ora     ($FD,x)
        .byte   $FF
        tax
        .byte   $FF
        .byte   $FF
        tax
        .byte   $FF
        tax
        tax
        .byte   $FF
        tax
        .byte   $FF
        tsx
        tax
        .byte   $FF
        tax
        tax
        tax
        tax
        .byte   $FF
        .byte   $FB
        .byte   $BF
        inc     $FFFF
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
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        brk
        .byte   $04
        brk
        .byte   $04
        brk
        .byte   $04
        brk
        .byte   $04
        brk
        ora     $00
        ora     $00
        ora     $01
        .byte   $03
        ora     ($03,x)
        .byte   $02
        ora     ($02,x)
        ora     ($FF,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($02,x)
        ora     ($02,x)
        ora     ($02,x)
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $03
        brk
        .byte   $04
        brk
        .byte   $04
        brk
        .byte   $04
        brk
        .byte   $04
        brk
        .byte   $03
        ora     ($02,x)
        ora     ($01,x)
        ora     ($01,x)
        .byte   $FF

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

L123C:
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

;;; Pre-shift tables for drawing text???

L1354:  .byte   0, 1, 2, 3, 4, 5, 6
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
        ora     ($04,x)
        bpl     L143A
        .byte   $02
        php
        jsr     L0401
        bpl     L1441
        .byte   $02
        php
        jsr     $FBFE
        .byte   $EF
        .byte   $BF
        sbc     $DFF7,x
        inc     $EFFB,x
        .byte   $BF
        sbc     $DFF7,x
        brk
        rol     a
        eor     $7F,x
        brk
        eor     $2A,x
        .byte   $7F
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
L143A:  rti

        ror     $03,x
        adc     $B5,x
        .byte   $73
        .byte   $54
L1441:  .byte   $72
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
        ora     L0B1F,y
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
        .byte   $3F
        .byte   $7C
        bvs     $14E2
        ror     $6078,x
        brk
        ora     ($07,x)
        .byte   $1F
        brk
        .byte   $03
        .byte   $0F
        .byte   $04
        brk
        brk
        ora     ($00,x)
        brk
        ora     ($01,x)
        ora     ($04,x)
        brk
        brk
        .byte   $02
        brk
        brk
        ora     ($02,x)
        .byte   $01

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


;;; Inputs are 16-bit signed numbers; scales X by (Y / $7FFF)
;;; Input: ZP locations specified by X, Y
;;; Output: ZP location specified by A
;;; Uses $C2-C6, $A5, $A7
.scope ZPScale
        ;; $154A

        ;; $C2-C3 = $00,X
        ;; $C4-C5 = $00,Y
        ;; $00,A = (result of jsr ScaleC2byC4)
        sta     $A5
        lda     $00,x
        sta     $C2
        lda     $01,x
        sta     $C3
        lda     $00,y
        sta     $C4
        lda     $01,y
        sta     $C5
        jsr     ScaleC2byC4
        ldy     $A5
        sta     $00,y
        stx     $01,y
        rts

ScaleC2byC4:
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
.endscope

;;; ============================================================

.proc ScaleC2ByAX
        sta     $C4
        stx     $C5
        jmp     ZPScale::ScaleC2byC4
.endproc

.proc ScaleC2ByAXIntoC2
        .refto ScaleC2ByAXIntoC2
        sta     $C4
        stx     $C5
        jsr     ZPScale::ScaleC2byC4
        sta     $C2
        stx     $C3
        rts
.endproc

;;; ============================================================

        ;; 16-bit signed division val1 / val2 ???
.scope
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
.endscope

;;; Divide A,X by 2, signed
;;; Trashes Y
.proc AXDiv2
        .refto AXDiv2
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
        .refto MultiplyAXByC2
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

        ldx     #$00
        jmp     L177B

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

        eor     #$FF
        tay
        txa
        eor     #$FF
        tax
        iny
        tya
        bne     L188C
        inx
L188C:  rts

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

        ldx     #$00
        lda     L02A2,x
        cmp     $28
        bne     L18C0
        rts

L18C0:  jsr     L1931
        ldx     #$01
        lda     L02A2,x
        jsr     L1931
        lda     $29
        ldx     #$01
        jsr     L18D6
        lda     $28
        ldx     #$00
L18D6:  sta     L02A2,x
        jsr     L1931
L18DC:  rts

        lda     $FB
        lsr     a
        bcc     L18DC
        ldx     #$02
        lda     L02A2,x
        cmp     L0A33
        beq     L18DC
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
        ldx     #$02
        sta     L02A2,x
L190C:  cmp     #$58
        bcc     L1912
        sbc     #$58
L1912:  jmp     L1931

        ldx     #$03
        .byte   $BD
        .byte   $A2
        .byte   $02
        .byte   $C5
L191B:  rol     a
        beq     L18DC
        php
        pha
        jsr     L1931
        pla
        plp
        bcc     L192A
        sec
        sbc     #$02
L192A:  clc
        adc     #$01
        ldx     #$03
        bne     L18D6
L1931:  sta     L0A3B
        stx     L0A3C
        lda     #$B6
        sta     $94
        lda     #$02
        sta     $95
        lda     L02B1,x
        beq     L194C
        lda     #$E6
        sta     $94
        lda     #$02
        sta     $95
L194C:  lda     L02A7,x
        sta     $A5
        lda     L02AC,x
        sta     $A7
        lda     L0A3B
        cmp     #$42
        bcs     L198F
        cmp     #$2C
        bcs     L1980
        cmp     #$16
        bcs     L1971
        jsr     L19A9
        jsr     L19DB
        lda     L0A3B
        jmp     L199B

L1971:  jsr     L19C2
        jsr     L19DB
        lda     #$2C
        sec
        sbc     L0A3B
        jmp     L199B

L1980:  jsr     L19C2
        jsr     L19EA
        lda     L0A3B
        sec
        sbc     #$2C
        jmp     L199B

L198F:  jsr     L19A9
        jsr     L19EA
        lda     #$58
        sec
        sbc     L0A3B
L199B:  asl     a
        tay
        lda     ($94),y
        sta     $96
        iny
        lda     ($94),y
        sta     $97
        jmp     L19F6

L19A9:  lda     #OPC_INX
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

L19C2:  lda     #OPC_DEX
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

L19DB:  lda     #OPC_DEC_zp
        sta     L1A38
        lda     $A7
        clc
        adc     #$EC
        sta     $E7
        inc     $A7
        rts

L19EA:  lda     #OPC_INC_zp
        sta     L1A38
        dec     $A7
        lda     $A7
        sta     $E7
        rts

L19F6:  ldy     #$00
        sty     $E7
L19FA:  ldy     $E7
        lda     ($96),y
        bpl     L1A01
        rts

;;; Airspeed indicator ??? Generic instrument EOR code?

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
        adc     $8D
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

        pha
        lda     L0A42
        jsr     L1A48
        pla
        sta     L0A42
L1A48:  ldx     #$64
        clc
        adc     #$9F
        tay
        lda     #$40
        sta     $9C
        lda     #$02
        jmp     L1A6E

        pha
        lda     L0A43
        jsr     L1A62
        pla
        sta     L0A43
L1A62:  clc
        adc     #$55
        tax
        ldy     #$94
L1A68:  lda     #$5D
        sta     $9C
        lda     #$02
L1A6E:  sta     $9D
        lda     #$00
        sta     L0A3F
        jmp     L1BAC

        pha
        lda     L0A45
        jsr     L1A83
        pla
        sta     L0A45
L1A83:  clc
        adc     #$55
        tax
        ldy     #$BC
        jmp     L1A68

        pha
        lda     L0A46
        jsr     L1A97
        pla
        sta     L0A46
L1A97:  eor     #$FF
        clc
        clc
        adc     #$10
        ldx     #$CA
        clc
        adc     #$AF
        tay
        lda     #$AC
        sta     $9C
        lda     #$14
        jmp     L1A6E

        pha
        lda     L0A47
        jsr     L1AB7
        pla
        sta     L0A47
L1AB7:  ldx     #$C8
        clc
        adc     #$66
        jmp     L1AE2

        pha
        lda     L0A48
        jsr     L1ACA
        pla
        sta     L0A48
L1ACA:  ldx     #$C8
        clc
        adc     #$8E
        jmp     L1AE2

        pha
        lda     L0A49
        jsr     L1ADD
        pla
        sta     L0A49
L1ADD:  ldx     #$D0
        clc
        adc     #$AF
L1AE2:  tay
        lda     #$B5
        sta     $9C
        lda     #$14
        jmp     L1A6E

        cmp     L0A44
        bne     L1AF2
        rts

L1AF2:  pha
        lda     L0A44
        jsr     L1AFD
        pla
        sta     L0A44
L1AFD:  clc
        adc     #$0E
        tax
        ldy     #$B4
        lda     #$70
        sta     $9C
        lda     #$02
        jmp     L1A6E

        lda     L0994
        lsr     a
        cmp     L0A4A
        bne     L1B16
L1B15:  rts

L1B16:  pha
        lda     L0A4A
        jsr     L1B3E
        pla
        sta     L0A4A
        jmp     L1B3E

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
        sta     L0A4B
        clc
        adc     #$1E
L1B3E:  clc
        adc     #$E8
        tax
        lda     #$00
        adc     #$00
        sta     L0A3F
        ldy     #$A2
L1B4B:  lda     #$89
        sta     $9C
        lda     #$02
        sta     $9D
        jmp     L1BAC

        lda     L099C
        cmp     L0A4C
        bne     L1B5F
L1B5E:  rts

L1B5F:  pha
        lda     L0A4C
        jsr     L1B86
        pla
        sta     L0A4C
        jmp     L1B86

        lda     L099D
        cmp     L0A4D
        beq     L1B5E
        pha
        lda     L0A4D
        clc
        adc     #$1E
        jsr     L1B86
        pla
        sta     L0A4D
        clc
        adc     #$1E
L1B86:  clc
        adc     #$E8
        tax
        lda     #$00
        adc     #$00
        sta     L0A3F
        ldy     #$AA
        jmp     L1B4B

        .byte   $04
        brk
        brk
        .byte   $03
        brk
        brk
        .byte   $02
        .byte   $03
        .byte   $02
        ldx     #$FB
        ldy     #$A4
        lda     #$96
        sta     $9C
        lda     #$1B
        jmp     L1A6E

L1BAC:  stx     L0A4E
        sty     L0A4F
        ldy     #$00
        lda     ($9C),y
        sta     $F1
        iny
        sty     L0A50
L1BBC:  ldy     L0A50
        lda     ($9C),y
        clc
        adc     L0A4E
        tax
        lda     L0A3F
        adc     #$00
        sta     L0A3F
        iny
        lda     ($9C),y
        iny
        sty     L0A50
        clc
        adc     L0A4F
        tay
        lda     HiresTableHi,y
        sta     $8F
        clc
        adc     $8D
        sta     $BB
        lda     HiresTableLo,y
        sta     $8E
        sta     $BA
        lda     L0A3F
        beq     L1BFB
        ldy     HiresPixelToByteTable+256,x
        lda     ($8E),y
        eor     HiresPixelToBitMaskTable+242,x
        jmp     L1C03

L1BFB:  ldy     HiresPixelToByteTable,x
        lda     ($8E),y
        eor     HiresPixelToBitMaskTable,x
L1C03:  sta     ($8E),y
        sta     ($BA),y
        dec     $F1
        bne     L1BBC
        rts

;;; Draw message to both hires screens
;;; A,X = message (row, col, null-terminated string)

.proc DrawMessage
        .refto DrawMessage

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
        .refto DrawMessageWhite

        sta     msg_ptr
        stx     msg_ptr+1
L1C9A:  lda     #$7F
        tax
        bne     L1CAD           ; always

;;; Color mask is orange
DrawMessageOrange:
        .refto DrawMessageOrange

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
        ldy     L1354,x         ; pre-shift ???
        ldx     L13EE,y
        stx     $A9
        lda     LeftMaskTable,x
        sta     $AD
        lda     RightMaskTable,x
        sta     $AE
        ldy     msg_col
        lda     L123C,y
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
        ldy     L123C,x

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
        and     ($8E),y
        ora     $AC
        sta     ($8E),y
        sta     ($3C),y
        iny
        lda     $AE
        and     ($8E),y
        ora     $AB
        sta     ($8E),y
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
        .refto DrawMultiMessage

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

;;; Clear viewport on both hires screens
.proc ClearViewportsToBlack
        .refto ClearViewportsToBlack

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
        rts

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

        jmp     $203A           ; becomes D3D0
        jmp     $2015           ; becomes D3D3
        jmp     $20AF           ; becomes D3D6
        jmp     $2122           ; becomes D3D9
        jmp     $238A           ; becomes D3DC
        jmp     $2000           ; becomes D3DF

        sec
        rts

        jmp     $2578           ; becomes D3E2

        clc
        rts

        jsr     L1EE9
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
        jsr     L1EFA

L1EE9:  ldx     #$1F
L1EEB:  lda     $40,x
        ldy     $FF40,x
        sta     $FF40,x
        sty     $40,x
        dex
        bpl     L1EEB
        clc
        rts

L1EFA:  sta     $5E
        lda     #$26
        sta     $45
        lda     #$00
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
        .byte   $BE
        .byte   $75
        .byte   $D7
        lda     $D875,y
        jsr     L1F5F
        pla
        sta     $44
        pla
        sta     $45
L1F2C:  ldy     $5E
        inc     $5E
        bne     L1F34
        inc     $5A
L1F34:  ldx     $D575,y
        lda     $D675,y
        pha
        ora     $D575,y
        tay
        pla
L1F40:  dey
        iny
        beq     L1F52
        jsr     L1F67
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
L1F5F:  ldy     #$75
        sty     $44
        ldy     #$D5
        sty     $45
L1F67:  ldy     #$01
        sty     L1F82
        stx     L1FB2
        sta     L1FB3
        jsr     L1F85
        lda     $45
        sta     L1FB1
        lda     $44
        sta     L1FB0
        jsr     $C70D
L1F82:  ora     ($AE,x)
        .byte   $1F
L1F85:  lda     #$04
        sta     $49
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

        .byte   $03
        .byte   $01
L1FB0:  .byte   $DF
L1FB1:  .byte   $95
L1FB2:  .byte   $02
L1FB3:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk

        lda     L1E03
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

        lda     $1E01
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

        .assert * = $2000, error, "mismatch"
        .incbin "../res/c4_hires.bin"
