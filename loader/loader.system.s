        .org    $2000

        .refto __APPLE2__

        TARGET := $2499
        MLI := $BF00

        jsr     MLI
        .byte   $C8             ; Open
        .addr   open_params

        lda     o_ref
        sta     r_ref

        jsr     MLI
        .byte   $CA             ; Read
        .addr   read_params

        jsr     MLI
        .byte   $CC             ; Close
        .addr   close_params

        jmp     TARGET

open_params:
        .byte   3               ; param count
        .addr   filename        ; filename
        .addr   $800            ; I/O buffer
o_ref:  .byte   0               ; ref num

read_params:
        .byte   4               ; param count
r_ref:  .byte   $FF             ; ref num
        .addr   TARGET          ; data buffer
        .word   $FFFF           ; read count
        .word   $FFFF           ; trans count

close_params:
        .byte   1               ; param count
        .byte   0               ; ref num

filename:
        .byte   3, "FS2"
