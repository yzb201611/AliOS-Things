NAME := newlib_stub

$(NAME)_VERSION := 0.0.1.0
$(NAME)_SUMMARY := libc adaptation layer
$(NAME)_MBINS_TYPE := share

ifeq ($(COMPILER),armcc)
$(NAME)_SOURCES := compilers/armlibc/armcc_libc.c
GLOBAL_INCLUDES += compilers/armlibc
else ifeq ($(COMPILER),rvct)
$(NAME)_SOURCES := compilers/armlibc/armcc_libc.c
GLOBAL_INCLUDES += compilers/armlibc
else ifeq ($(COMPILER),iar)
GLOBAL_INCLUDES += compilers/iar
$(NAME)_SOURCES := compilers/iar/iar_libc.c
else ifeq ($(HOST_MCU_FAMILY),rda8955)
$(NAME)_SOURCES := mips_rda_stub.c
else ifeq ($(HOST_MCU_FAMILY),freedom-e.e310)
$(NAME)_SOURCES := newlib_riscv_stub.c
else ifneq ($(HOST_MCU_FAMILY),linux)
$(NAME)_SOURCES := newlib_stub.c
endif

ifeq ($(IDE),keil)
    $(NAME)_SOURCES += compilers/armlibc/hal_stub.c
endif

