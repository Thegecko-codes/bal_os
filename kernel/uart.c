#include "uart.h"

#define UART_BASE 0x09000000
#define UART_FR (*((volatile unsigned int*) (UART_BASE) + 0x18))
#define UART_DR (*((volatile unsigned int*) (UART_BASE) + 0x18))

void uart_init(void)
{
  //nothing to do here...
}

void uart_putc(char c)
{
  while(UART_FR & (1 << 5));
  UART_DR = c;
}

char uart_getc(void)
{
  while (UART_FR & (1 << 4));
  return (char)(UART_DR & 0xFF);
}

void uart_puts(char* s)
{
  while(*s)
  {
    uart_putc(*s);
    s++;
  }
}
