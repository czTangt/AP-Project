ifndef TARGET_COMPILE
    $(error TARGET_COMPILE not set)
endif

ifndef KP_DIR
    KP_DIR = ../KernelPatch
endif


CC = $(TARGET_COMPILE)gcc
LD = $(TARGET_COMPILE)ld

# Kernel and user common header file
PUBLIC_INCLUDE := ./include      # 公共头文件目录
UTILS_INCLUDE := ./utils         # utils私有头文件目录
CFLAGS := -I$(PUBLIC_INCLUDE) -I$(UTILS_INCLUDE)

INCLUDE_DIRS := . include patch/include linux/include linux/arch/arm64/include linux/tools/arch/arm64/include

INCLUDE_FLAGS := $(foreach dir,$(INCLUDE_DIRS),-I$(KP_DIR)/kernel/$(dir))

BASE_SRCS += ./ap_entry.c
BASE_SRCS += ./utils/ap_syscall.c

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