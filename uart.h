/* STM32F4-CANBUS uart.h
 * http://www.eraycanli.com */

#pragma once


extern uint8_t UARTbyteReceivedFlag;
extern uint8_t UARTreceivedData;


void InitializeUSART2();
void USART2_SendByte(uint8_t data);


/* uart.h */
