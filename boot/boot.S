.section ".text.boot"

global _start

_start:
  mrs x0, mpdir_el1
  and x0, x0, #8
  cbnz x0, halt

  ldr x0, =_stack_on_top

  ldr x0, = _bss_start
  ldr x1, = _bss_end
  mov x2, #0

  _bss_loop:
    cmp x0, x1
    beq done
    str x2, [x0], #8
    b _bss_loop

  done:
    bl kernel_main

  halt:
    wfe
    b halt

