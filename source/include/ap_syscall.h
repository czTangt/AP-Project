#ifndef AP_SYSCALL_H
#define AP_SYSCALL_H

// 包含必要的系统头文件
#include <kpmodule.h>
#include <ktypes.h>
#include <linux/printk.h>
#include <syscall.h>

// 函数声明
void syscall_install(void);

#endif // AP_SYSCALL_H