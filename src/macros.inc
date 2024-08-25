

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
