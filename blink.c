#include <avr/io.h>
#include <util/delay.h>

#define BBLED 3

int main(void)
{
  DDRB  = _BV(BBLED);

  for(;;){
    PORTB ^= _BV(BBLED);
    _delay_ms(250);
  }
}
