#ifndef HEADER_FILE_H
#define MY_HEADER_FILE_H

#include <ktypes.h>
#include <kpmodule.h>
#include <linux/printk.h>

#endif

#include "utils/ap_syscall.h"

KPM_NAME("Test");
KPM_VERSION("1.0.0");
KPM_LICENSE("");
KPM_AUTHOR("czTang");
KPM_DESCRIPTION("Apatch Project Module");

static long kernel_init(const char *args, const char *event, void *__user reserved)
{
    // pr_info("kpm hello init, event: %s, args: %s\n", event, args);
    // pr_info("kernelpatch version: %x\n", kpver);
    pr_info("ap_kernel: hello world kernel init 3333\n");
    syscall_install();
    return 0;
}

static long kernel_control0(const char *args, char *__user out_msg, int outlen)
{
    return 0;
}

static long kernel_exit(void *__user reserved)
{
    pr_info("ap_kernel: hello world kernel exit\n");
    return 0;
}

KPM_INIT(kernel_init);
KPM_CTL0(kernel_control0);
KPM_EXIT(kernel_exit);