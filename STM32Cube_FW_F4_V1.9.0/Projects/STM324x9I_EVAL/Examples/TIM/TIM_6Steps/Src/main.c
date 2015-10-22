/**
  ******************************************************************************
  * @file    TIM/TIM_6Steps/Src/main.c 
  * @author  MCD Application Team
  * @version V1.3.1
  * @date    09-October-2015
  * @brief   This example shows how to use TIM1 peripheral to generate 6 Steps.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2015 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/** @addtogroup STM32F4xx_HAL_Examples
  * @{
  */

/** @addtogroup TIM_6Steps
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
 
/* Step Index */
 __IO uint32_t uwStep = 0;

/* Timer handler declaration */
TIM_HandleTypeDef    TimHandle;

/* Timer Output Compare Configuration Structure declaration */
TIM_OC_InitTypeDef sConfig;

/* Timer Break Configuration Structure declaration */
TIM_BreakDeadTimeConfigTypeDef sConfigBK;

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void Error_Handler(void);

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main(void)
{
  /* STM32F4xx HAL library initialization:
       - Configure the Flash prefetch, instruction and Data caches
       - Configure the Systick to generate an interrupt each 1 msec
       - Set NVIC Group Priority to 4
       - Global MSP (MCU Support Package) initialization
     */
  HAL_Init();
  
  /* Configure the system clock to 180 MHz */
  SystemClock_Config();
  
  /* Configure LED3 */
  BSP_LED_Init(LED3);
  
  /*##-1- Configure the TIM peripheral #######################################*/ 
  /* Initialize TIMx peripheral as follow:
       + Prescaler = 0
       + Period = 4095
       + ClockDivision = 0
       + Counter direction = Up
  */
  TimHandle.Instance = TIM1;
  
  TimHandle.Init.Period            = 4095;
  TimHandle.Init.Prescaler         = 0;
  TimHandle.Init.ClockDivision     = 0;
  TimHandle.Init.CounterMode       = TIM_COUNTERMODE_UP;
  TimHandle.Init.RepetitionCounter = 0;  
  
  if(HAL_TIM_OC_Init(&TimHandle) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
  
  /*##-2- Configure the output channels ######################################*/ 
  /* Common configuration for all channels */
  sConfig.OCMode       = TIM_OCMODE_TIMING;
  sConfig.OCPolarity   = TIM_OCPOLARITY_HIGH;
  sConfig.OCNPolarity  = TIM_OCNPOLARITY_HIGH;
  sConfig.OCIdleState  = TIM_OCIDLESTATE_SET;
  sConfig.OCNIdleState = TIM_OCNIDLESTATE_SET;
  sConfig.OCFastMode   = TIM_OCFAST_DISABLE;

  /* Set the pulse value for channel 1 */
  sConfig.Pulse = 2047;  
  if(HAL_TIM_OC_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_1) != HAL_OK)
  {
    /* Configuration Error */
    Error_Handler();
  }
  
  /* Set the pulse value for channel 2 */
  sConfig.Pulse = 1023;
  if(HAL_TIM_OC_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_2) != HAL_OK)
  {
    /* Configuration Error */
    Error_Handler();
  }
  
  /* Set the pulse value for channel 3 */
  sConfig.Pulse = 511;
  if(HAL_TIM_OC_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_3) != HAL_OK)
  {
    /* Configuration Error */
    Error_Handler();
  }

  /*##-3- Configure the Break stage ##########################################*/
  sConfigBK.OffStateRunMode  = TIM_OSSR_ENABLE;
  sConfigBK.OffStateIDLEMode = TIM_OSSI_ENABLE;
  sConfigBK.LockLevel        = TIM_LOCKLEVEL_OFF;
  sConfigBK.BreakState       = TIM_BREAK_ENABLE;
  sConfigBK.BreakPolarity    = TIM_BREAKPOLARITY_HIGH;
  sConfigBK.AutomaticOutput  = TIM_AUTOMATICOUTPUT_ENABLE;
  sConfigBK.DeadTime         = 1;
  
  if(HAL_TIMEx_ConfigBreakDeadTime(&TimHandle, &sConfigBK) != HAL_OK)
  {
    /* Configuration Error */
    Error_Handler();
  }
  
  /*##-4- Configure the commutation event: software event ####################*/
  HAL_TIMEx_ConfigCommutationEvent_IT(&TimHandle, TIM_TS_NONE, TIM_COMMUTATION_SOFTWARE);
  
  /*##-5- Start signals generation ###########################################*/ 
  /*--------------------------------------------------------------------------*/
  /* Start channel 1 */
  if(HAL_TIM_OC_Start(&TimHandle, TIM_CHANNEL_1) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  }  
  /* Start channel 1N */
  if(HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_1) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  } 
  /*--------------------------------------------------------------------------*/
  
  
  /*--------------------------------------------------------------------------*/
  /* Start channel 2 */
  if(HAL_TIM_OC_Start(&TimHandle, TIM_CHANNEL_2) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  }
  /* Start channel 2N */
  if(HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_2) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  } 
  /*--------------------------------------------------------------------------*/
  
  
  /*--------------------------------------------------------------------------*/
  /* Start channel 3 */
  if(HAL_TIM_OC_Start(&TimHandle, TIM_CHANNEL_3) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  }
  /* Start channel 3N */
  if(HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_3) != HAL_OK)
  {
    /* Starting Error */
    Error_Handler();
  } 
  /*--------------------------------------------------------------------------*/
  
  /* Infinite loop */
  while (1)
  {
  }
}

/**
  * @brief  Commutation event callback in non blocking mode 
  * @param  htim : Timer handle
  * @retval None
  */
void HAL_TIMEx_CommutationCallback(TIM_HandleTypeDef *htim)
{
  /* Entry state */
  if (uwStep == 0)
  {
    /* Next step: Step 1 Configuration -------------------------------------- */
    sConfig.OCMode     = TIM_OCMODE_PWM1;
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&TimHandle, TIM_CHANNEL_1);
    HAL_TIMEx_OCN_Stop(&TimHandle, TIM_CHANNEL_1);
    
    /*  Channel3 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1; 
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_3);
    HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_3);
    HAL_TIM_PWM_Stop(&TimHandle, TIM_CHANNEL_3);
    
    /*  Channel2 configuration */
    HAL_TIM_OC_Stop(&TimHandle, TIM_CHANNEL_2);
    HAL_TIMEx_OCN_Stop(&TimHandle, TIM_CHANNEL_2);
    uwStep = 1;
  }
  
  if (uwStep == 1)
  {
    /* Next step: Step 2 Configuration -------------------------------------- */
    /*  Channel1 configuration */
    /* Same configuration as the previous step */  
    
    /*  Channel2 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1; 
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_2);
    HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_2);

    /*  Channel3 configuration */
    HAL_TIMEx_OCN_Stop(&TimHandle, TIM_CHANNEL_3);
    
    uwStep++;
  }
  
  else if (uwStep == 2)
  {
    /* Next step: Step 3 Configuration -------------------------------------- */
    /*  Channel2 configuration */
    /* Same configuration as the previous step */
    
    /*  Channel3 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1; 
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_3);
    HAL_TIM_PWM_Start(&TimHandle, TIM_CHANNEL_3);
   
    /*  Channel1 configuration */
    HAL_TIM_OC_Stop(&TimHandle, TIM_CHANNEL_1);
    
    uwStep++;
  }
  
  else if (uwStep == 3)
  {
    /* Next step: Step 4 Configuration -------------------------------------- */
    /*  Channel3 configuration */
    /* Same configuration as the previous step */
    
    /*  Channel2 configuration */
    HAL_TIMEx_OCN_Stop(&TimHandle, TIM_CHANNEL_2);
    
    /*  Channel1 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1; 
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_1);
    HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_1);
    
    uwStep++;
  }
  else if (uwStep == 4)
  {
    /* Next step: Step 5 Configuration -------------------------------------- */
    /*  Channel3 configuration */
    HAL_TIM_OC_Stop(&TimHandle, TIM_CHANNEL_3);
  
    /*  Channel1 configuration */
    /* Same configuration as the previous step */
    
    /*  Channel2 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1;
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_2);
    HAL_TIM_PWM_Start(&TimHandle, TIM_CHANNEL_2);

    uwStep++;
  }
  
  else if (uwStep == 5)
  {
    /* Next step: Step 6 Configuration -------------------------------------- */
    /*  Channel3 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1; 
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_3);
    HAL_TIMEx_OCN_Start(&TimHandle, TIM_CHANNEL_3);
  
    /*  Channel1 configuration */
    HAL_TIMEx_OCN_Stop(&TimHandle, TIM_CHANNEL_1);
    
    /*  Channel2 configuration */
    /* Same configuration as the previous step */
    
    uwStep++;
  }
  
  else
  {
    /* Next step: Step 1 Configuration -------------------------------------- */
    /*  Channel1 configuration */
    sConfig.OCMode     = TIM_OCMODE_PWM1;
    HAL_TIM_PWM_ConfigChannel(&TimHandle, &sConfig, TIM_CHANNEL_1);
    HAL_TIM_PWM_Start(&TimHandle, TIM_CHANNEL_1);
    
    /*  Channel3 configuration */
    /* Same configuration as the previous step */
    
    /*  Channel2 configuration */
    HAL_TIM_OC_Stop(&TimHandle, TIM_CHANNEL_2);
    
    uwStep = 1;
  }
}  
  
/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
static void Error_Handler(void)
{
  /* Turn LED3 on */
  BSP_LED_On(LED3);
  while(1)
  {
  }
}

/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow : 
  *            System Clock source            = PLL (HSE)
  *            SYSCLK(Hz)                     = 180000000
  *            HCLK(Hz)                       = 180000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 4
  *            APB2 Prescaler                 = 2
  *            HSE Frequency(Hz)              = 25000000
  *            PLL_M                          = 25
  *            PLL_N                          = 360
  *            PLL_P                          = 2
  *            PLL_Q                          = 7
  *            VDD(V)                         = 3.3
  *            Main regulator output voltage  = Scale1 mode
  *            Flash Latency(WS)              = 5
  * @param  None
  * @retval None
  */
static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable Power Control clock */
  __HAL_RCC_PWR_CLK_ENABLE();

  /* The voltage scaling allows optimizing the power consumption when the device is 
     clocked below the maximum system frequency, to update the voltage scaling value 
     regarding system frequency refer to product datasheet.  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /* Enable HSE Oscillator and activate PLL with HSE as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 360;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);
  
  /* Activate the Over-Drive mode */
  HAL_PWREx_EnableOverDrive();
  
  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 
  clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;  
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;  
  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
