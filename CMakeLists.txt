cmake_minimum_required(VERSION 3.3)
project(CAN_Bus)
#enable_language(ASM)
SET(CMAKE_SYSTEM_PROCESSOR arm)

set(GCC_BIN /usr/local/gcc-arm-none-eabi-4_9-2015q3/bin/)
set(CMAKE_ASM_COMPILER /usr/local/gcc-arm-none-eabi-4_9-2015q3/bin/arm-none-eabi-as)
set(CMAKE_C_COMPILER /usr/local/gcc-arm-none-eabi-4_9-2015q3/bin/arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER /usr/local/gcc-arm-none-eabi-4_9-2015q3/bin/arm-none-eabi-g++)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp -fno-common -fmessage-length=0  -fno-exceptions -ffunction-sections -fdata-sections -fomit-frame-pointer -MMD -MP -fdiagnostics-color=auto -DNDEBUG -std=gnu99 -Os")
set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp  -Wl,--gc-sections --specs=nano.specs -u _printf_float -u _scanf_float -Wl,-Map=main.map,--cref -lm -lc -lgcc -lnosys")
set(CMAKE_ASM_FLAGS "")

set(SOURCE_FILES
        main.c
        commons.h
        canbus.c
        canbus.h
        uart.c
        uart.h
        leds.c
        leds.h
        stm32f4xx_hal_conf.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_crc.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_can.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_can.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_uart.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_usart.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_usart.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_cortex.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_gpio.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_rcc.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_dma.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_spi.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2c.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2c_ex.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2s.h
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.c
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_i2s_ex.h
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Include/core_cm4.h
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f407xx.h
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s
        Src/lwip.o
        Src/ethernetif.o
        Src/stm32f4xx_it.o
        Src/stm32f4xx_hal_msp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/etharp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/slipif.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chap.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chpms.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/md5.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/pap.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp_oe.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/randm.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_lib.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_msg.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/err.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netbuf.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netdb.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netifapi.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/sockets.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/tcpip.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/def.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dhcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dns.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/init.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/lwip_timers.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/mem.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/memp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/netif.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/pbuf.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/raw.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/stats.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/sys.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_in.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_out.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/udp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_dec.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_enc.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib2.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib_structs.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_in.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_out.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet_chksum.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_addr.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_frag.o
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.o
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/iar/startup_stm32f407xx.s
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/etharp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/slipif.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chap.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chpms.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/md5.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/pap.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp_oe.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/randm.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_lib.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_msg.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/err.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netbuf.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netdb.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netifapi.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/sockets.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/tcpip.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/def.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dhcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dns.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/init.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/lwip_timers.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/mem.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/memp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/netif.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/pbuf.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/raw.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/stats.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/sys.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_in.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_out.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/udp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_dec.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_enc.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib2.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib_structs.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_in.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_out.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet_chksum.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_addr.o
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_frag.o




)

add_executable(CAN_Bus ${SOURCE_FILES})

add_definitions(
        -DSTM32F407xx
        -DSTM32F4
        -DSTM32F407VG
        -DTOOLCHAIN_GCC_ARM
        -DTOOLCHAIN_GCC
)

include_directories(
        .
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Include
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include/lwip
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include/ipv4
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include/ipv6
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/test/unit
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/system
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/system
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/ipv4
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/system/arch
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/ipv4/lwip
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/lwip
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/netif
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/posix
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/posix/sys
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp
        Src
)

