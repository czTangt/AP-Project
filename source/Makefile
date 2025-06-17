ifndef TARGET_COMPILE
    $(error TARGET_COMPILE not set)
endif

ifndef KP_DIR
    KP_DIR = ../KernelPatch
endif


CC = $(TARGET_COMPILE)gcc
LD = $(TARGET_COMPILE)ld

# Kernel and user common header file
INCLUDE_PATH := ../include

CPPFLAGS := -I$(INCLUDE_PATH)
CFLAGS := -I$(INCLUDE_PATH)

INCLUDE_DIRS := . include patch/include linux/include linux/arch/arm64/include linux/tools/arch/arm64/include

INCLUDE_FLAGS := $(foreach dir,$(INCLUDE_DIRS),-I$(KP_DIR)/kernel/$(dir))

BASE_SRCS += ./ap_entry.c

SRCS += $(BASE_SRCS)

OBJS := $(SRCS:.c=.o)
OBJS := $(OBJS:.S=.o)


all: ap.kpm

ap.kpm: ${OBJS}
	${CC} -r -o $@ $^
	find . -name "*.o" | xargs rm -f

%.o: %.c
	${CC} $(CFLAGS) $(INCLUDE_FLAGS) -c -O2 -o $@ $<

.PHONY: clean
clean:
	rm -rf *.kpm
	find . -name "*.o" | xargs rm -f