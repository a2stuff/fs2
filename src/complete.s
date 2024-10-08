
        .setcpu "6502"
        .refto __APPLE2__

.include "macros.inc"

;;; ============================================================
;;; Subset of ca65's opcodes.inc

OPC_BPL     = $10
OPC_ORA_izy = $11
OPC_CLC     = $18
OPC_ORA_abx = $1D
OPC_AND_izy = $31
OPC_SEC     = $38
OPC_AND_abx = $3D
OPC_EOR_imm = $49
OPC_JMP_abs = $4C
OPC_EOR_abx = $5D
OPC_RTS     = $60
OPC_ADC_izy = $71
OPC_STY_zp  = $84
OPC_STX_zp  = $86
OPC_LDY_zp  = $A4
OPC_LDA_imm = $A9
OPC_LDA_izy = $B1
OPC_LDA_aby = $B9
OPC_DEC_zp  = $C6
OPC_DEX     = $CA
OPC_INC_zp  = $E6
OPC_INX     = $E8
OPC_NOP     = $EA
OPC_SBC_izy = $F1

;;; ============================================================
;;; Apple II I/O locations

KBD             := $C000
KBDSTRB         := $C010
SPKR            := $C030
TXTCLR          := $C050
MIXCLR          := $C052
LOWSCR          := $C054
HISCR           := $C055
HIRES           := $C057
BUTN0           := $C061
BUTN1           := $C062
PADDL0          := $C064
PADDL1          := $C065
PTRIG           := $C070
LCBANK2         := $C083
RdROMWrRAM1     := $C089
LCBANK1         := $C08B

;;; ============================================================
;;; Zero Page

ColorByteEven   := $23
ColorByteOdd    := $24

UpdateCounter   := $2B

InputTickCounter := $31

HiresPageDelta  := $8D          ; Either +$20 or -$20

HiresRowPtr     := $8E          ; $8E-$8F

PixelListData   := $9C          ; For `DrawPixelList`

ValueForString  := $B6     ; $B6-$B7
;;; Used by `Set3DigitString` and `DivideByAXAndSetDigitY`

FillColor       := $ED          ; e.g. ground color
AltFillColor    := $EE          ; e.g. sky color

TmpStash        := $F3

InputMode       := $FA
;;; $00 = Normal Flight
;;; $01 = 3D View
;;; $02 = Radar View
;;; $03 = Magnetos / Fuel Mixture
;;; $04 = Com Radio (upper digits)
;;; $05 = Com Radio (lower digits)
;;; $06 = Nav Radio (upper digits)
;;; $07 = Nav Radio (lower digits)
;;; $08 = Transponder
;;; $0C = VORS
;;; $0D = ADF (high digit)
;;; $0E = ADF (mid digit)
;;; $0F = ADF (low digit)
;;; $10 = Fuel Tank Select

;;; ============================================================
;;; Other locations

ZPSwapStorage := $FF40

;;; ============================================================

.include "chunk2.s"
.include "chunk3.s"
.include "chunk4.s"
.include "chunk5.s"
