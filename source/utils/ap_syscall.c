#ifndef HEADER_FILE_H
#define MY_HEADER_FILE_H

#include <ktypes.h>
#include <kpmodule.h>
#include <linux/printk.h>
#include <syscall.h>
#endif

#include "ap_syscall.h"

void syscall_install(void){
    pr_info("ap_kernel: syscall 222\n");
}