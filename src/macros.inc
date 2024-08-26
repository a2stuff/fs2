
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
