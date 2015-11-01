
OBJECTS = \
        main.o \
        canbus.o \
        uart.o \
        leds.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_can.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_usart.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.o \
        STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.o \
        Src/lwip.o \
        Src/ethernetif.o \
        Src/stm32f4xx_it.o \
        Src/stm32f4xx_hal_msp.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/etharp.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/slipif.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chap.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chpms.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o \
		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o \
		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o \
		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/md5.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/pap.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp_oe.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/randm.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_lib.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_msg.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/err.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netbuf.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netdb.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netifapi.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/sockets.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/tcpip.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/def.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dhcp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dns.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/init.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/lwip_timers.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/mem.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/memp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/netif.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/pbuf.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/raw.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/stats.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/sys.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_in.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_out.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/udp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_dec.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_enc.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib2.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib_structs.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_in.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_out.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet_chksum.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_addr.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_frag.o \
 		STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.o \
 		STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/iar/startup_stm32f407xx.s \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/etharp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/slipif.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chap.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/chpms.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/md5.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/pap.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp_oe.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/randm.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_lib.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/api_msg.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/err.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netbuf.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netdb.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/netifapi.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/sockets.o \
 		STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/api/tcpip.o \
    	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/def.o \
    	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dhcp.o \
     	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/dns.o \
      	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/init.o \
       	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/lwip_timers.o \
       	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/mem.o \
       	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/memp.o \
       	STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/netif.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/pbuf.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/raw.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/stats.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/sys.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_in.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/tcp_out.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/udp.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_dec.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/asn1_enc.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib2.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/mib_structs.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_in.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/snmp/msg_out.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/inet_chksum.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_addr.o \
        STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/core/ipv4/ip_frag.o








INCLUDE_PATHS = \
    -I. \
    -I./STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc \
    -I./STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Include \
    -I./STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Include \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include/lwip \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include/ipv4 \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/src/include/ipv6 \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/test/unit \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_party/LwIP/system \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/system \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/ipv4 \
    -I./STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc \
    -I./STM32Cube_FW_F4_V1.9.0/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/system/arch \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/ipv4/lwip \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/lwip \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/netif \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/posix \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/include/posix/sys \
    -I./STM32Cube_FW_F4_V1.9.0/Middlewares/Third_Party/LwIP/src/netif/ppp \
    -I./Src \


LINKER_SCRIPT = ./STM32Cube_FW_F4_V1.9.0/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/STM32F407XG.ld


#directory where the binary files go
BUILD_DIR = build

#name of the project. This name gets used to generate the .o, .bin, and .hex files
PROJECT = main

#these are the variables that will store the .o and .cpp files of the libraries that you create

SOURCE = source

LIB_SRC = $(wildcard $(SOURCE)/*.cpp)

LIB_OBJ = $(LIB_SRC:$(SOURCE)/%.cpp=$(BUILD_DIR)/%.o)


###############################################################################
AS      = $(GCC_BIN)arm-none-eabi-as
CC      = $(GCC_BIN)arm-none-eabi-gcc
CPP     = $(GCC_BIN)arm-none-eabi-g++
LD      = $(GCC_BIN)arm-none-eabi-gcc
OBJCOPY = $(GCC_BIN)arm-none-eabi-objcopy
OBJDUMP = $(GCC_BIN)arm-none-eabi-objdump
SIZE    = $(GCC_BIN)arm-none-eabi-size

#compiling flags needed by the boards
CPU = -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
CC_FLAGS = $(CPU) -c -g -fno-common -fmessage-length=0 -Wall -Wextra -fno-exceptions -ffunction-sections -fdata-sections -fomit-frame-pointer -MMD -MP -fdiagnostics-color=auto
CC_SYMBOLS = \
        -DSTM32F407xx           \
        -DSTM32F4               \
        -DSTM32F407VG

LD_FLAGS = $(CPU) -Wl,--gc-sections --specs=nano.specs -u _printf_float -u _scanf_float -Wl,-Map=$(BUILD_DIR)/$(PROJECT).map,--cref
LD_SYS_LIBS = -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys

CC_FLAGS += -DNDEBUG -Os

#the actual portion of the make file

.PHONY: all compile clean burn dfu

all: compile

compile: $(PROJECT).bin $(PROJECT).hex
	@echo " ### Compiled $(PROJECT).bin & $(PROJECT).hex"

.c.o:
	@$(CC)  $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu99   $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	@$(CPP) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu++98 -fno-rtti $(INCLUDE_PATHS) -o $@ $<


$(LIB_OBJ): $(LIB_SRC)
	@$(CPP) $(CC_FLAGS) $(CC_SYMBOLS) -std=gnu++98 -fno-rtti $(INCLUDE_PATHS)  $(LIB_SRC)
	@mv *.o ./$(BUILD_DIR)

$(PROJECT).elf: $(OBJECTS) $(SYS_OBJECTS)
	@$(LD) $(LD_FLAGS) -T$(LINKER_SCRIPT)  -o $(BUILD_DIR)/$@ $^ $(LIB_OBJ) $(LD_SYS_LIBS) $(LD_SYS_LIBS)
	@rm *.o

$(PROJECT).bin: $(PROJECT).elf
	@rm *.d
	@$(OBJCOPY) -O binary $(BUILD_DIR)/$< $(BUILD_DIR)/$@

$(PROJECT).hex: $(PROJECT).elf
	@$(OBJCOPY) -g -O ihex $(BUILD_DIR)/$< $(BUILD_DIR)/$@


clean:
	@rm $(BUILD_DIR)/*
	@echo " ### Cleaned build directory"

burn:
	@echo " ### Flashing $(BUILD_DIR)/$(PROJECT).bin to device with st-flash...\n"
	@st-flash --reset write $(BUILD_DIR)/$(PROJECT).bin 0x8000000

dfu:
	@echo " ### Flashing $(BUILD_DIR)/$(PROJECT).bin to device with dfu-util...\n"
	@dfu-util -a 0 --dfuse-address 0x08000000 -D $(BUILD_DIR)/$(PROJECT).bin
