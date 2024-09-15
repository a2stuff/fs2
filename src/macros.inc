
;;; Generic helpers
.define _is_immediate(arg)       (.match (.mid (0, 1, {arg}), #))
.define _immediate_value(arg)    (.right (.tcount ({arg})-1, {arg}))
.macro _op_lo op, arg
    .if _is_immediate {arg}
        op #<_immediate_value {arg}
    .else
        op arg
    .endif
.endmacro
.macro _op_hi op, arg
    .if _is_immediate {arg}
        op #>_immediate_value {arg}
    .else
        op arg+1
    .endif
.endmacro



;;; Emit a null-terminated string, prepended by `row`/`col` position
;;; An optional `label` parameter can be supplied, which will point
;;; at the start of the string data.

.macro MESSAGE row, col, str, label
        .byte   row, col        ; position

.if .paramcount > 3
label:                          ; optional label
.endif

        .byte   str             ; string data
        .byte   0               ; null terminator
.endmacro

;;; Load A,X with an address, and JSR a target routine
.macro CALLAX target, addr
        lda     #<addr
        ldx     #>addr
        jsr     target
.endmacro

;;; Load A,X with an address, and JMP a target routine
.macro JUMPAX target, addr
        lda     #<addr
        ldx     #>addr
        jmp     target
.endmacro

;;; Load A,X
;;;    LDAX #$1234      ; immediate
;;;    LDAX $1234       ; absolute
;;;    LDAX $1234,y     ; absolute,y
.macro LDAX arg, reg
    .if .paramcount > 1
        lda    arg, reg
        ldx    arg+1, reg
    .else
        _op_lo lda, {arg}
        _op_hi ldx, {arg}
    .endif
.endmacro

;;; Store A,X
;;;    STAX $1234       ; absolute
.macro STAX arg
        sta     arg
        stx     arg+1
.endmacro

;;; Load X,Y
;;;    LDXY #$1234      ; immediate
;;;    LDXY $1234       ; absolute
;;;    LDXY $1234,y     ; absolute,y
.macro LDXY arg, reg
    .if .paramcount > 1
        ldx    arg, reg
        ldy    arg+1, reg
    .else
        _op_lo ldx, {arg}
        _op_hi ldy, {arg}
    .endif
.endmacro

;;; Store X,Y
;;;    STXY $1234       ; absolute
.macro STXY arg
        stx     arg
        sty     arg+1
.endmacro

.macro ADD16 arg1, arg2, result
        clc
        _op_lo  lda, {arg1}
        _op_lo  adc, {arg2}
        sta     result
        _op_hi  lda, {arg1}
        _op_hi  adc, {arg2}
        sta     result+1
.endmacro

.macro SUB16 arg1, arg2, result
        sec
        _op_lo  lda, {arg1}
        _op_lo  sbc, {arg2}
        sta     result
        _op_hi  lda, {arg1}
        _op_hi  sbc, {arg2}
        sta     result+1
.endmacro

;;; Define bitmap pattern as a string
;;; * '#' is a 1 bit, anything else is a 0
;;; * must be a multiple of 7 pixels wide.
;;; * high bit is always set
;;; e.g. PIXELS "..##############....."
.macro PIXELS str, dummy
        .if .paramcount < 2

        ;; Pad out with 0 bits
        PIXELS .concat(str, "......"), 1234

        .else

        ;; Process each 7 characters into a byte.
        .repeat .strlen(str) / 7, idx
        __pixel__ .set idx * 7
        .byte ((.strat(str, __pixel__+0) = '#') << 0) | ((.strat(str, __pixel__+1) = '#') << 1) | ((.strat(str, __pixel__+2) = '#') << 2) | ((.strat(str, __pixel__+3) = '#') << 3) | ((.strat(str, __pixel__+4) = '#') << 4) | ((.strat(str, __pixel__+5) = '#') << 5) | ((.strat(str, __pixel__+6) = '#') << 6) | $80
        .endrepeat

        .endif
.endmacro
