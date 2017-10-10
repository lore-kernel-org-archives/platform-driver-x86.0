From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 12/12] intel_sgx: update IA32_SGXLEPUBKEYHASH* MSRs
Date: Tue, 10 Oct 2017 17:32:58 +0300
Message-ID: <20171010143258.21623-13-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:22285 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932202AbdJJOdf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:35 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Check if IA32_SGXLEPUBKEYHASH* MSRs match. If they do not match, allow
the driver initialization to continue only if they are writable. In this
case update them with the MRSIGNER of the launch enclave.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx/sgx.h                |  1 +
 drivers/platform/x86/intel_sgx/sgx_encl.c           | 20 ++++++++++++++++++++
 drivers/platform/x86/intel_sgx/sgx_le_proxy_piggy.S |  4 ++++
 drivers/platform/x86/intel_sgx/sgx_main.c           |  7 ++++++-
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_sgx/sgx.h b/drivers/platform/x86/intel_sgx/sgx.h
index 94b6855fdad0..cf66bda37c1f 100644
--- a/drivers/platform/x86/intel_sgx/sgx.h
+++ b/drivers/platform/x86/intel_sgx/sgx.h
@@ -178,6 +178,7 @@ extern u64 sgx_xfrm_mask;
 extern u32 sgx_misc_reserved;
 extern u32 sgx_xsave_size_tbl[64];
 extern bool sgx_locked_msrs;
+extern u64 sgx_le_pubkeyhash[4];
 
 extern const struct file_operations sgx_fops;
 extern const struct vm_operations_struct sgx_vm_ops;
diff --git a/drivers/platform/x86/intel_sgx/sgx_encl.c b/drivers/platform/x86/intel_sgx/sgx_encl.c
index aa0deed08cee..ac4c28c527c2 100644
--- a/drivers/platform/x86/intel_sgx/sgx_encl.c
+++ b/drivers/platform/x86/intel_sgx/sgx_encl.c
@@ -68,6 +68,7 @@
 #include <linux/slab.h>
 #include <linux/hashtable.h>
 #include <linux/shmem_fs.h>
+#include <linux/percpu.h>
 
 struct sgx_add_page_req {
 	struct sgx_encl *encl;
@@ -874,6 +875,17 @@ static int sgx_einit(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
 	return ret;
 }
 
+static void sgx_update_pubkeyhash(void)
+{
+	if (sgx_locked_msrs)
+		return;
+
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH0, sgx_le_pubkeyhash[0]);
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH1, sgx_le_pubkeyhash[1]);
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH2, sgx_le_pubkeyhash[2]);
+	wrmsrl(MSR_IA32_SGXLEPUBKEYHASH3, sgx_le_pubkeyhash[3]);
+}
+
 /**
  * sgx_encl_init - perform EINIT for the given enclave
  *
@@ -909,6 +921,14 @@ int sgx_encl_init(struct sgx_encl *encl, struct sgx_sigstruct *sigstruct,
 		for (j = 0; j < SGX_EINIT_SPIN_COUNT; j++) {
 			ret = sgx_einit(encl, sigstruct, token);
 
+			if (ret == SGX_INVALID_ATTRIBUTE ||
+			    ret == SGX_INVALID_EINITTOKEN) {
+				preempt_disable();
+				sgx_update_pubkeyhash();
+				ret = sgx_einit(encl, sigstruct, token);
+				preempt_enable();
+			}
+
 			if (ret == SGX_UNMASKED_EVENT)
 				continue;
 			else
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
index 0747be390570..8380ad56f6a0 100644
--- a/drivers/platform/x86/intel_sgx/sgx_main.c
+++ b/drivers/platform/x86/intel_sgx/sgx_main.c
@@ -80,6 +80,7 @@ MODULE_VERSION(DRV_VERSION);
  * Global data.
  */
 
+extern struct sgx_sigstruct sgx_le_ss;
 struct workqueue_struct *sgx_add_page_wq;
 #define SGX_MAX_EPC_BANKS 8
 struct sgx_epc_bank sgx_epc_banks[SGX_MAX_EPC_BANKS];
@@ -90,6 +91,7 @@ u64 sgx_xfrm_mask = 0x3;
 u32 sgx_misc_reserved;
 u32 sgx_xsave_size_tbl[64];
 bool sgx_locked_msrs;
+u64 sgx_le_pubkeyhash[4];
 
 #ifdef CONFIG_COMPAT
 long sgx_compat_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
@@ -267,6 +269,10 @@ static int sgx_dev_init(struct device *parent, bool locked_msrs)
 		}
 	}
 
+	ret = sgx_get_key_hash_simple(sgx_le_ss.modulus, sgx_le_pubkeyhash);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < SGX_MAX_EPC_BANKS; i++) {
 		cpuid_count(SGX_CPUID, i + SGX_CPUID_EPC_BANKS, &eax, &ebx,
 			    &ecx, &edx);
@@ -356,7 +362,6 @@ static int sgx_drv_probe(struct platform_device *pdev)
 	}
 
 	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
-
 	if (!(fc & FEATURE_CONTROL_LOCKED)) {
 		pr_err("intel_sgx: the feature control MSR is not locked\n");
 		return -ENODEV;
-- 
2.14.1
