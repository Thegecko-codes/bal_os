#include "uart.h"

void kernel_main(void){
  uart_init();
  uart_puts("Welcome to BalOS - Copyright (c) 2026 Gecko. All Rights Reserved.\n");
  while(1)
  {
    uart_puts(">>> ");
    char c = uart_getc();
    uart_putc(c);
    uart_putc('\n');
  }
}
