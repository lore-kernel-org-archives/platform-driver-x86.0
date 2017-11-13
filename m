From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v5 10/11] intel_sgx: glue code for in-kernel LE
Date: Mon, 13 Nov 2017 21:45:27 +0200
Message-ID: <20171113194528.28557-11-jarkko.sakkinen@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Glue code for hosting in-kernel Launch Enclave (LE) by using the user
space helper framework.

Tokens for launching enclaves are generated with by the following
protocol:

1. The driver sends a SIGSTRUCT blob to the LE hosting process
   to the input pipe.
2. The LE hosting process reads the SIGSTRUCT blob from the input
   pipe.
3. After generating a EINITTOKEN blob, the LE hosting process writes
   it to the output pipe.
4. The driver reads the EINITTOKEN blob from the output pipe.

If IA32_SGXLEPUBKEYHASH* MSRs are writable and they don't have the
public key hash of the LE they will be updated.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx/Kconfig             |   2 +
 drivers/platform/x86/intel_sgx/Makefile            |   1 +
 drivers/platform/x86/intel_sgx/sgx.h               |  23 ++
 drivers/platform/x86/intel_sgx/sgx_encl.c          |  19 ++
 drivers/platform/x86/intel_sgx/sgx_ioctl.c         |  10 +-
 drivers/platform/x86/intel_sgx/sgx_le.c            | 313 +++++++++++++++++++++
 .../platform/x86/intel_sgx/sgx_le_proxy_piggy.S    |   4 +
 drivers/platform/x86/intel_sgx/sgx_main.c          |  54 +++-
 drivers/platform/x86/intel_sgx/sgx_util.c          |  25 ++
 9 files changed, 444 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/x86/intel_sgx/sgx_le.c

diff --git a/drivers/platform/x86/intel_sgx/Kconfig b/drivers/platform/x86/intel_sgx/Kconfig
index 9c445e9f89fa..1a80ca0ddca3 100644
--- a/drivers/platform/x86/intel_sgx/Kconfig
+++ b/drivers/platform/x86/intel_sgx/Kconfig
@@ -9,6 +9,8 @@ config INTEL_SGX
 	default n
 	depends on X86_64 && CPU_SUP_INTEL
 	select MMU_NOTIFIER
+	select CRYPTO
+	select CRYPTO_SHA256
 	---help---
 	Intel(R) SGX is a set of CPU instructions that can be used by
 	applications to set aside private regions of code and data.  The code
diff --git a/drivers/platform/x86/intel_sgx/Makefile b/drivers/platform/x86/intel_sgx/Makefile
index 39c0a5ad242c..34abcdd8eb72 100644
--- a/drivers/platform/x86/intel_sgx/Makefile
+++ b/drivers/platform/x86/intel_sgx/Makefile
@@ -11,6 +11,7 @@ intel_sgx-$(CONFIG_INTEL_SGX) += \
 	sgx_page_cache.o \
 	sgx_util.o \
 	sgx_vma.o \
+	sgx_le.o \
 	sgx_le_proxy_piggy.o
 
 $(eval $(call config_filename,INTEL_SGX_SIGNING_KEY))
diff --git a/drivers/platform/x86/intel_sgx/sgx.h b/drivers/platform/x86/intel_sgx/sgx.h
index 3f018fae7ba4..e397da3b4c72 100644
--- a/drivers/platform/x86/intel_sgx/sgx.h
+++ b/drivers/platform/x86/intel_sgx/sgx.h
@@ -68,6 +68,7 @@
 #include <linux/workqueue.h>
 #include <linux/mmu_notifier.h>
 #include <linux/radix-tree.h>
+#include <crypto/hash.h>
 #include <asm/sgx.h>
 
 #define SGX_MAX_EPC_BANKS 8
@@ -170,6 +171,10 @@ struct sgx_epc_bank {
 	unsigned long size;
 };
 
+extern unsigned char sgx_le_proxy[];
+extern unsigned char sgx_le_proxy_end[];
+extern struct sgx_sigstruct sgx_le_ss;
+
 extern struct workqueue_struct *sgx_add_page_wq;
 extern struct sgx_epc_bank sgx_epc_banks[];
 extern int sgx_nr_epc_banks;
@@ -178,7 +183,10 @@ extern u64 sgx_encl_size_max_64;
 extern u64 sgx_xfrm_mask;
 extern u32 sgx_misc_reserved;
 extern u32 sgx_xsave_size_tbl[64];
+extern u64 sgx_le_pubkeyhash[4];
+extern bool sgx_unlocked_msrs;
 
+extern const struct file_operations sgx_fops;
 extern const struct vm_operations_struct sgx_vm_ops;
 
 #define sgx_pr_ratelimited(level, encl, fmt, ...)			  \
@@ -237,6 +245,9 @@ struct sgx_encl_page *sgx_fault_page(struct vm_area_struct *vma,
 				     unsigned int flags);
 
 
+int sgx_get_key_hash(struct crypto_shash *tfm, const void *modulus, void *hash);
+int sgx_get_key_hash_simple(const void *modulus, void *hash);
+
 extern struct mutex sgx_tgid_ctx_mutex;
 extern struct list_head sgx_tgid_ctx_list;
 extern atomic_t sgx_va_pages_cnt;
@@ -251,4 +262,16 @@ void sgx_put_page(void *epc_page_vaddr);
 void sgx_eblock(struct sgx_encl *encl, struct sgx_epc_page *epc_page);
 void sgx_etrack(struct sgx_encl *encl);
 
+extern struct sgx_le_ctx sgx_le_ctx;
+
+int sgx_le_init(struct sgx_le_ctx *ctx);
+void sgx_le_exit(struct sgx_le_ctx *ctx);
+void sgx_le_stop(struct sgx_le_ctx *ctx);
+int sgx_le_start(struct sgx_le_ctx *ctx);
+
+int sgx_le_get_token(struct sgx_le_ctx *ctx,
+		     const struct sgx_encl *encl,
+		     const struct sgx_sigstruct *sigstruct,
+		     struct sgx_einittoken *token);
+
 #endif /* __ARCH_X86_INTEL_SGX_H__ */
diff --git a/drivers/platform/x86/intel_sgx/sgx_encl.c b/drivers/platform/x86/intel_sgx/sgx_encl.c
index 5ed9ceb01f1f..c175b540e607 100644
--- a/drivers/platform/x86/intel_sgx/sgx_encl.c
+++ b/drivers/platform/x86/intel_sgx/sgx_encl.c
@@ -68,6 +68,7 @@
 #include <linux/slab.h>
 #include <linux/hashtable.h>
 #include <linux/shmem_fs.h>
+#include <linux/percpu.h>
 
 struct sgx_add_page_req {
 	struct sgx_encl *encl;
@@ -873,6 +874,14 @@ static int sgx_einit(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
 	return ret;
 }
 
+static void sgx_update_pubkeyhash(void)
+{
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH0, sgx_le_pubkeyhash[0]);
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH1, sgx_le_pubkeyhash[1]);
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH2, sgx_le_pubkeyhash[2]);
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH3, sgx_le_pubkeyhash[3]);
+}
+
 /**
  * sgx_encl_init - perform EINIT for the given enclave
  *
@@ -908,6 +917,16 @@ int sgx_encl_init(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
 		for (j = 0; j < SGX_EINIT_SPIN_COUNT; j++) {
 			ret = sgx_einit(encl, sigstruct, token);
 
+			if (ret == SGX_INVALID_ATTRIBUTE ||
+			    ret == SGX_INVALID_EINITTOKEN) {
+				if (sgx_unlocked_msrs) {
+					preempt_disable();
+					sgx_update_pubkeyhash();
+					ret = sgx_einit(encl, sigstruct, token);
+					preempt_enable();
+				}
+			}
+
 			if (ret == SGX_UNMASKED_EVENT)
 				continue;
 			else
diff --git a/drivers/platform/x86/intel_sgx/sgx_ioctl.c b/drivers/platform/x86/intel_sgx/sgx_ioctl.c
index 3fcef914005f..1f14d31690ca 100644
--- a/drivers/platform/x86/intel_sgx/sgx_ioctl.c
+++ b/drivers/platform/x86/intel_sgx/sgx_ioctl.c
@@ -69,7 +69,7 @@
 #include <linux/hashtable.h>
 #include <linux/shmem_fs.h>
 
-static int sgx_get_encl(unsigned long addr, struct sgx_encl **encl)
+static int sgx_encl_get(unsigned long addr, struct sgx_encl **encl)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
@@ -156,7 +156,7 @@ static long sgx_ioc_enclave_add_page(struct file *filep, unsigned int cmd,
 	void *data;
 	int ret;
 
-	ret = sgx_get_encl(addp->addr, &encl);
+	ret = sgx_encl_get(addp->addr, &encl);
 	if (ret)
 		return ret;
 
@@ -227,11 +227,13 @@ static long sgx_ioc_enclave_init(struct file *filep, unsigned int cmd,
 	if (ret)
 		goto out;
 
-	ret = sgx_get_encl(encl_id, &encl);
+	ret = sgx_encl_get(encl_id, &encl);
 	if (ret)
 		goto out;
 
-	ret = sgx_encl_init(encl, sigstruct, einittoken);
+	ret = sgx_le_get_token(&sgx_le_ctx, encl, sigstruct, einittoken);
+	if (!ret)
+		ret = sgx_encl_init(encl, sigstruct, einittoken);
 
 	kref_put(&encl->refcount, sgx_encl_release);
 
diff --git a/drivers/platform/x86/intel_sgx/sgx_le.c b/drivers/platform/x86/intel_sgx/sgx_le.c
new file mode 100644
index 000000000000..d49c58f09db6
--- /dev/null
+++ b/drivers/platform/x86/intel_sgx/sgx_le.c
@@ -0,0 +1,313 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * Contact Information:
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ * Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
+ *
+ * BSD LICENSE
+ *
+ * Copyright(c) 2016-2017 Intel Corporation.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Authors:
+ *
+ * Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+ */
+
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/kmod.h>
+#include <linux/mutex.h>
+#include <linux/wait.h>
+#include <linux/pipe_fs_i.h>
+#include <linux/sched/signal.h>
+#include <linux/shmem_fs.h>
+#include <linux/anon_inodes.h>
+#include "sgx.h"
+
+#define SGX_LE_PROXY_PATH "/proc/self/fd/3"
+#define SGX_LE_PROXY_FD 3
+#define SGX_LE_DEV_FD 4
+
+struct sgx_le_ctx {
+	struct pid *tgid;
+	char *argv[2];
+	struct file *pipes[2];
+	struct crypto_shash *tfm;
+	struct mutex lock;
+};
+
+struct sgx_le_ctx sgx_le_ctx;
+
+static int sgx_le_create_pipe(struct sgx_le_ctx *ctx,
+			      unsigned int fd)
+{
+	struct file *files[2];
+	int ret;
+
+	ret = create_pipe_files(files, 0);
+	if (ret)
+		goto out;
+
+	ctx->pipes[fd] = files[fd ^ 1];
+	ret = replace_fd(fd, files[fd], 0);
+	fput(files[fd]);
+
+out:
+	return ret;
+}
+
+static int sgx_le_read(struct file *file, void *data, unsigned int len)
+{
+	ssize_t ret;
+	loff_t pos = 0;
+
+	ret = kernel_read(file, data, len, &pos);
+
+	if (ret != len && ret >= 0)
+		return -ENOMEM;
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int sgx_le_write(struct file *file, const void *data,
+			unsigned int len)
+{
+	ssize_t ret;
+	loff_t pos = 0;
+
+	ret = kernel_write(file, data, len, &pos);
+
+	if (ret != len && ret >= 0)
+		return -ENOMEM;
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int sgx_le_task_init(struct subprocess_info *subinfo, struct cred *new)
+{
+	struct sgx_le_ctx *ctx =
+		(struct sgx_le_ctx *)subinfo->data;
+	unsigned long len;
+	struct file *tmp_filp;
+	int ret;
+
+	len = (unsigned long)&sgx_le_proxy_end - (unsigned long)&sgx_le_proxy;
+
+	tmp_filp = shmem_file_setup("[sgx_le_proxy]", len, 0);
+	if (IS_ERR(tmp_filp)) {
+		ret = PTR_ERR(tmp_filp);
+		return ret;
+	}
+	ret = replace_fd(SGX_LE_PROXY_FD, tmp_filp, 0);
+	fput(tmp_filp);
+	if (ret < 0)
+		return ret;
+
+	ret = sgx_le_write(tmp_filp, &sgx_le_proxy, len);
+	if (ret)
+		return ret;
+
+	tmp_filp = anon_inode_getfile("[/dev/sgx]", &sgx_fops, NULL, O_RDWR);
+	if (IS_ERR(tmp_filp))
+		return PTR_ERR(tmp_filp);
+	ret = replace_fd(SGX_LE_DEV_FD, tmp_filp, 0);
+	fput(tmp_filp);
+	if (ret < 0)
+		return ret;
+
+	ret = sgx_le_create_pipe(ctx, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = sgx_le_create_pipe(ctx, 1);
+	if (ret < 0)
+		return ret;
+
+	ctx->tgid = get_pid(task_tgid(current));
+
+	return 0;
+}
+
+static void __sgx_le_stop(struct sgx_le_ctx *ctx)
+{
+	int i;
+
+	if (ctx->tgid)
+		kill_pid(ctx->tgid, SIGKILL, 1);
+
+	for (i = 0; i < ARRAY_SIZE(ctx->pipes); i++) {
+		if (ctx->pipes[i]) {
+			fput(ctx->pipes[i]);
+			ctx->pipes[i] = NULL;
+		}
+	}
+
+	if (ctx->tgid) {
+		put_pid(ctx->tgid);
+		ctx->tgid = NULL;
+	}
+}
+
+
+void sgx_le_stop(struct sgx_le_ctx *ctx)
+{
+	mutex_lock(&ctx->lock);
+	__sgx_le_stop(ctx);
+	mutex_unlock(&ctx->lock);
+}
+
+static int __sgx_le_start(struct sgx_le_ctx *ctx)
+{
+	struct subprocess_info *subinfo;
+	int ret;
+
+	if (ctx->tgid)
+		return 0;
+
+	ctx->argv[0] = SGX_LE_PROXY_PATH;
+	ctx->argv[1] = NULL;
+
+	subinfo = call_usermodehelper_setup(ctx->argv[0], ctx->argv,
+					    NULL, GFP_KERNEL, sgx_le_task_init,
+					    NULL, &sgx_le_ctx);
+	if (!subinfo)
+		return -ENOMEM;
+
+	ret = call_usermodehelper_exec(subinfo, UMH_WAIT_EXEC);
+	if (ret) {
+		__sgx_le_stop(ctx);
+		return ret;
+	}
+
+	return 0;
+}
+
+int sgx_le_start(struct sgx_le_ctx *ctx)
+{
+	int ret;
+
+	mutex_lock(&ctx->lock);
+	ret = __sgx_le_start(ctx);
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
+
+int sgx_le_init(struct sgx_le_ctx *ctx)
+{
+	struct crypto_shash *tfm;
+
+	tfm = crypto_alloc_shash("sha256", 0, CRYPTO_ALG_ASYNC);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	ctx->tfm = tfm;
+	mutex_init(&ctx->lock);
+
+	return 0;
+}
+
+void sgx_le_exit(struct sgx_le_ctx *ctx)
+{
+	mutex_lock(&ctx->lock);
+	crypto_free_shash(ctx->tfm);
+	mutex_unlock(&ctx->lock);
+}
+
+static int __sgx_le_get_token(struct sgx_le_ctx *ctx,
+			      const struct sgx_encl *encl,
+			      const struct sgx_sigstruct *sigstruct,
+			      struct sgx_einittoken *token)
+{
+	u8 mrsigner[32];
+	ssize_t ret;
+
+	if (!ctx->tgid)
+		return -EIO;
+
+	ret = sgx_get_key_hash(ctx->tfm, sigstruct->modulus, mrsigner);
+	if (ret)
+		return ret;
+
+	if (!memcmp(mrsigner, sgx_le_pubkeyhash, 32))
+		return 0;
+
+	ret = sgx_le_write(ctx->pipes[0], sigstruct->body.mrenclave, 32);
+	if (ret)
+		return ret;
+
+	ret = sgx_le_write(ctx->pipes[0], mrsigner, 32);
+	if (ret)
+		return ret;
+
+	ret = sgx_le_write(ctx->pipes[0], &encl->attributes, sizeof(uint64_t));
+	if (ret)
+		return ret;
+
+	ret = sgx_le_write(ctx->pipes[0], &encl->xfrm, sizeof(uint64_t));
+	if (ret)
+		return ret;
+
+	return sgx_le_read(ctx->pipes[1], token, sizeof(*token));
+}
+
+int sgx_le_get_token(struct sgx_le_ctx *ctx,
+		     const struct sgx_encl *encl,
+		     const struct sgx_sigstruct *sigstruct,
+		     struct sgx_einittoken *token)
+{
+	int ret;
+
+	mutex_lock(&ctx->lock);
+	ret = __sgx_le_get_token(ctx, encl, sigstruct, token);
+	mutex_unlock(&ctx->lock);
+
+	return ret;
+}
diff --git a/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S b/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S
index faced8a9a75a..e1e3742a0c93 100644
--- a/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S
+++ b/drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S
@@ -9,3 +9,7 @@ GLOBAL(sgx_le_proxy)
 END(sgx_le_proxy)
 
 GLOBAL(sgx_le_proxy_end)
+
+GLOBAL(sgx_le_ss)
+	.incbin	"drivers/platform/x86/intel_sgx/le/enclave/sgx_le.ss"
+END(sgx_le_ss)
diff --git a/drivers/platform/x86/intel_sgx/sgx_main.c b/drivers/platform/x86/intel_sgx/sgx_main.c
index 636a583bad31..7931083651f5 100644
--- a/drivers/platform/x86/intel_sgx/sgx_main.c
+++ b/drivers/platform/x86/intel_sgx/sgx_main.c
@@ -88,6 +88,37 @@ u64 sgx_encl_size_max_64;
 u64 sgx_xfrm_mask = 0x3;
 u32 sgx_misc_reserved;
 u32 sgx_xsave_size_tbl[64];
+bool sgx_unlocked_msrs;
+u64 sgx_le_pubkeyhash[4];
+
+static DECLARE_RWSEM(sgx_file_sem);
+
+static int sgx_open(struct inode *inode, struct file *file)
+{
+	int ret;
+
+	down_read(&sgx_file_sem);
+
+	ret = sgx_le_start(&sgx_le_ctx);
+	if (ret) {
+		up_read(&sgx_file_sem);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sgx_release(struct inode *inode, struct file *file)
+{
+	up_read(&sgx_file_sem);
+
+	if (down_write_trylock(&sgx_file_sem)) {
+		sgx_le_stop(&sgx_le_ctx);
+		up_write(&sgx_file_sem);
+	}
+
+	return 0;
+}
 
 #ifdef CONFIG_COMPAT
 long sgx_compat_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
@@ -141,8 +172,10 @@ static unsigned long sgx_get_unmapped_area(struct file *file,
 	return addr;
 }
 
-static const struct file_operations sgx_fops = {
+const struct file_operations sgx_fops = {
 	.owner			= THIS_MODULE,
+	.open			= sgx_open,
+	.release		= sgx_release,
 	.unlocked_ioctl		= sgx_ioctl,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl		= sgx_compat_ioctl,
@@ -235,6 +268,7 @@ static int sgx_dev_init(struct device *parent)
 {
 	struct sgx_context *sgx_dev;
 	unsigned int eax, ebx, ecx, edx;
+	unsigned long fc;
 	int ret;
 	int i;
 
@@ -242,6 +276,10 @@ static int sgx_dev_init(struct device *parent)
 
 	sgx_dev = sgxm_ctx_alloc(parent);
 
+	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
+	if (fc & FEATURE_CONTROL_SGX_LAUNCH_CONTROL_ENABLE)
+		sgx_unlocked_msrs = true;
+
 	cpuid_count(SGX_CPUID, SGX_CPUID_CAPABILITIES, &eax, &ebx, &ecx, &edx);
 	/* Only allow misc bits supported by the driver. */
 	sgx_misc_reserved = ~ebx | SGX_MISC_RESERVED_MASK;
@@ -262,6 +300,10 @@ static int sgx_dev_init(struct device *parent)
 		}
 	}
 
+	ret = sgx_get_key_hash_simple(sgx_le_ss.modulus, sgx_le_pubkeyhash);
+	if (ret)
+		return ret;
+
 	ret = sgx_page_cache_init(parent);
 	if (ret)
 		return ret;
@@ -274,11 +316,17 @@ static int sgx_dev_init(struct device *parent)
 		goto out_page_cache;
 	}
 
-	ret = cdev_device_add(&sgx_dev->cdev, &sgx_dev->dev);
+	ret = sgx_le_init(&sgx_le_ctx);
 	if (ret)
 		goto out_workqueue;
 
+	ret = cdev_device_add(&sgx_dev->cdev, &sgx_dev->dev);
+	if (ret)
+		goto out_le;
+
 	return 0;
+out_le:
+	sgx_le_exit(&sgx_le_ctx);
 out_workqueue:
 	destroy_workqueue(sgx_add_page_wq);
 out_page_cache:
@@ -305,7 +353,6 @@ static int sgx_drv_probe(struct platform_device *pdev)
 	}
 
 	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
-
 	if (!(fc & FEATURE_CONTROL_LOCKED)) {
 		pr_err("intel_sgx: the feature control MSR is not locked\n");
 		return -ENODEV;
@@ -337,6 +384,7 @@ static int sgx_drv_remove(struct platform_device *pdev)
 	struct sgx_context *ctx = dev_get_drvdata(parent);
 
 	cdev_device_del(&ctx->cdev, &ctx->dev);
+	sgx_le_exit(&sgx_le_ctx);
 	destroy_workqueue(sgx_add_page_wq);
 	sgx_page_cache_teardown();
 
diff --git a/drivers/platform/x86/intel_sgx/sgx_util.c b/drivers/platform/x86/intel_sgx/sgx_util.c
index 6ef79499100f..6c1f06d1978a 100644
--- a/drivers/platform/x86/intel_sgx/sgx_util.c
+++ b/drivers/platform/x86/intel_sgx/sgx_util.c
@@ -370,3 +370,28 @@ void sgx_etrack(struct sgx_encl *encl)
 		sgx_invalidate(encl, true);
 	}
 }
+
+int sgx_get_key_hash(struct crypto_shash *tfm, const void *modulus, void *hash)
+{
+	SHASH_DESC_ON_STACK(shash, tfm);
+
+	shash->tfm = tfm;
+	shash->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	return crypto_shash_digest(shash, modulus, SGX_MODULUS_SIZE, hash);
+}
+
+int sgx_get_key_hash_simple(const void *modulus, void *hash)
+{
+	struct crypto_shash *tfm;
+	int ret;
+
+	tfm = crypto_alloc_shash("sha256", 0, CRYPTO_ALG_ASYNC);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	ret = sgx_get_key_hash(tfm, modulus, hash);
+
+	crypto_free_shash(tfm);
+	return ret;
+}
-- 
2.14.1
