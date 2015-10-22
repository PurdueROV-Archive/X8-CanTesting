/* STM32F4-CANBUS uart.c
 * http://www.eraycanli.com */


#include "commons.h"

#include "uart.h"

#include "stm32f4xx_hal_uart.h"

#include "leds.h"


uint8_t UARTbyteReceivedFlag;
uint8_t UARTreceivedData;


UART_HandleTypeDef HUsart2; /* UART2 Handle struct */


void InitializeUSART2()
{
    __GPIOA_CLK_ENABLE(); /* Enable GPIOA clock for PA2(Tx) & PA3(Rx) */

    __USART2_CLK_ENABLE(); /* Enable USART2 clock */


    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP; /* Alternate Function Push-Pull */
    GPIO_InitStruct.Pull = GPIO_NOPULL; /* Np resistors */
    GPIO_InitStruct.Speed = GPIO_SPEED_HIGH; /* High speed */
    GPIO_InitStruct.Alternate = GPIO_AF7_USART2; /* USART2 AF */
    GPIO_InitStruct.Pin = GPIO_PIN_2 | GPIO_PIN_3; /* PA2(Tx) & PA3(Rx) */
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct); /* Initialize GPIOA register */


    HUsart2.Instance = USART2; /* Select peripheral */
    HUsart2.Init.BaudRate = 115200;
    HUsart2.Init.WordLength = UART_WORDLENGTH_8B;
    HUsart2.Init.StopBits = UART_STOPBITS_1;
    HUsart2.Init.Parity = UART_PARITY_NONE;
    HUsart2.Init.Mode = UART_MODE_TX_RX; /* Tx&Rx mode */
    HUsart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
    HUsart2.Init.OverSampling = UART_OVERSAMPLING_16;
    HAL_UART_Init(&HUsart2);


    HAL_NVIC_SetPriority(USART2_IRQn, 1, 1); /* priority 1-1 */
    HAL_NVIC_EnableIRQ(USART2_IRQn); /* Enable interrupt channel */

    __HAL_UART_ENABLE_IT(&HUsart2, UART_IT_RXNE); /* Initialize USART2 Rx interrupt */


    __HAL_UART_ENABLE(&HUsart2); /* Enable USART peripheral */


    return;
}


/* Sends 1 byte of data over UART2 */
void USART2_SendByte(uint8_t data)
{
    HAL_UART_Transmit(&HUsart2, &data, 1, 1000); /* Send a byte */

    return;
}


void USART2_IRQHandler(void)
{
    if((__HAL_UART_GET_FLAG(&HUsart2, UART_FLAG_RXNE) != RESET) && (__HAL_UART_GET_IT_SOURCE(&HUsart2, UART_IT_RXNE) != RESET)) /* Receive flag set */
    {
        if(HAL_UART_Receive(&HUsart2, &UARTreceivedData, 1, 1000) == HAL_OK) /* A byte received successfully */
        {
            LedState(LED_ORANGE, 1); /* Orange LED on */

            UARTbyteReceivedFlag = 1; /* Set a flag */
        }

        __HAL_UART_CLEAR_FLAG(&HUsart2, UART_IT_RXNE); /* Clear receive flag */
    }

    return;
}


/* uart.c */
