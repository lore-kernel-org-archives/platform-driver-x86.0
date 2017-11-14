From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v5 10/11] intel_sgx: glue code
 for in-kernel LE
Date: Tue, 14 Nov 2017 10:16:43 -0800
Message-ID: <1510683403.11044.2.camel@intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
         <20171113194528.28557-11-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:34095 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755291AbdKNSU1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 13:20:27 -0500
In-Reply-To: <20171113194528.28557-11-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, intel-sgx-kernel-dev@lists.01.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, 2017-11-13 at 21:45 +0200, Jarkko Sakkinen wrote:
> --- a/drivers/platform/x86/intel_sgx/sgx_main.c
> +++ b/drivers/platform/x86/intel_sgx/sgx_main.c
> @@ -88,6 +88,37 @@ u64 sgx_encl_size_max_64;
>  u64 sgx_xfrm_mask = 0x3;
>  u32 sgx_misc_reserved;
>  u32 sgx_xsave_size_tbl[64];
> +bool sgx_unlocked_msrs;
> +u64 sgx_le_pubkeyhash[4];
> +
> +static DECLARE_RWSEM(sgx_file_sem);
> +
> +static int sgx_open(struct inode *inode, struct file *file)
> +{
> +	int ret;
> +
> +	down_read(&sgx_file_sem);
> +
> +	ret = sgx_le_start(&sgx_le_ctx);
> +	if (ret) {
> +		up_read(&sgx_file_sem);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sgx_release(struct inode *inode, struct file *file)
> +{
> +	up_read(&sgx_file_sem);
> +
> +	if (down_write_trylock(&sgx_file_sem)) {
> +		sgx_le_stop(&sgx_le_ctx);
> +		up_write(&sgx_file_sem);
> +	}
> +
> +	return 0;
> +}

This semaphore approach is broken due to the LE process using an anon inode for
/dev/sgx, which results in sgx_release being called without an accompanying call
to sgx_open.  This causes deadlocks due to a semaphore underrun.

https://lists.01.org/pipermail/intel-sgx-kernel-dev/2017-November/000901.html

[  242.659272] INFO: task lsdt:9425 blocked for more than 120 seconds.
[  242.659783]       Not tainted 4.14.0-rc4+ #18
[  242.660063] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this 
[  242.660558] lsdt            D    0  9425      1 0x00000004
[  242.660559] Call Trace:
[  242.660564]  __schedule+0x3c2/0x8b0
[  242.660567]  schedule+0x36/0x80
[  242.660568]  rwsem_down_read_failed+0x10a/0x170
[  242.660569]  call_rwsem_down_read_failed+0x18/0x30
[  242.660570]  ? call_rwsem_down_read_failed+0x18/0x30
[  242.660571]  down_read+0x20/0x40
[  242.660572]  sgx_open+0x19/0x40 [intel_sgx]
[  242.660574]  chrdev_open+0xbf/0x1b0
[  242.660576]  do_dentry_open+0x1f8/0x300
[  242.660577]  ? cdev_put+0x30/0x30
[  242.660578]  vfs_open+0x4f/0x70
[  242.660579]  path_openat+0x2ae/0x13a0
[  242.660581]  ? mem_cgroup_uncharge_swap+0x60/0x90
[  242.660582]  do_filp_open+0x99/0x110
[  242.660583]  ? __check_object_size+0xfc/0x1a0
[  242.660585]  ? __alloc_fd+0xb0/0x170
[  242.660586]  do_sys_open+0x124/0x210
[  242.660587]  ? do_sys_open+0x124/0x210
[  242.660588]  SyS_open+0x1e/0x20
[  242.660589]  entry_SYSCALL_64_fastpath+0x1e/0xa9
[  242.660590] RIP: 0033:0x7f426cf9ec7d
[  242.660591] RSP: 002b:00007f426b31ea60 EFLAGS: 00000293 ORIG_RAX: 
[  242.660592] RAX: ffffffffffffffda RBX: 000000c4200ba000 RCX: 00007f426cf9ec7d
[  242.660592] RDX: 0000000000000000 RSI: 0000000000000002 RDI: 000000000068cca7
[  242.660593] RBP: 00007f426b31ec10 R08: 0000000000f6bc30 R09: 0000000000000000
[  242.660593] R10: 00007f4264000078 R11: 0000000000000293 R12: 0000000000000001
[  242.660594] R13: 0000000000000000 R14: 00007f426d31b13d R15: 00007f42640008c0

>  #ifdef CONFIG_COMPAT
>  long sgx_compat_ioctl(struct file *filep, unsigned int cmd, unsigned long
> arg)
> @@ -141,8 +172,10 @@ static unsigned long sgx_get_unmapped_area(struct file
> *file,
>  	return addr;
>  }
>  
> -static const struct file_operations sgx_fops = {
> +const struct file_operations sgx_fops = {
>  	.owner			= THIS_MODULE,
> +	.open			= sgx_open,
> +	.release		= sgx_release,
>  	.unlocked_ioctl		= sgx_ioctl,
>  #ifdef CONFIG_COMPAT
>  	.compat_ioctl		= sgx_compat_ioctl,
