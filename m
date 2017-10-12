From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH] intel_sgx: tie LE proxy life-cycle to the device file
Date: Thu, 12 Oct 2017 12:44:08 +0300
Message-ID: <20171012094408.10301-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:27120 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750722AbdJLJoS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2017 05:44:18 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Added sgx_file_sem to keep track of the device file. The LE proxy is
started when it is first opened and closed after no thread is using it
anymore.

By doing this LE proxy does not need to be started and stopped for every
token generated. This will also make sure that the ioctl API is
accessible if and only if the kernel is able to launch enclaves.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
This an update to the RFC v3 patch set. It will be included to v4.
 drivers/platform/x86/intel_sgx/sgx.h      |  2 +
 drivers/platform/x86/intel_sgx/sgx_le.c   | 66 ++++++++++++++++++++-----------
 drivers/platform/x86/intel_sgx/sgx_main.c | 31 +++++++++++++++
 3 files changed, 76 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/intel_sgx/sgx.h b/drivers/platform/x86/intel_sgx/sgx.h
index cf66bda37c1f..69b61c63b53d 100644
--- a/drivers/platform/x86/intel_sgx/sgx.h
+++ b/drivers/platform/x86/intel_sgx/sgx.h
@@ -255,6 +255,8 @@ extern struct sgx_le_ctx sgx_le_ctx;
 
 int sgx_le_init(struct sgx_le_ctx *ctx);
 void sgx_le_exit(struct sgx_le_ctx *ctx);
+void sgx_le_stop(struct sgx_le_ctx *ctx);
+int sgx_le_start(struct sgx_le_ctx *ctx);
 
 int sgx_le_get_token(struct sgx_le_ctx *ctx,
 		     const struct sgx_encl *encl,
diff --git a/drivers/platform/x86/intel_sgx/sgx_le.c b/drivers/platform/x86/intel_sgx/sgx_le.c
index c4ed8e1ea70b..7c78dc6bf512 100644
--- a/drivers/platform/x86/intel_sgx/sgx_le.c
+++ b/drivers/platform/x86/intel_sgx/sgx_le.c
@@ -178,7 +178,7 @@ static int sgx_le_task_init(struct subprocess_info *subinfo, struct cred *new)
 	return 0;
 }
 
-static void sgx_le_stop(struct sgx_le_ctx *ctx)
+static void __sgx_le_stop(struct sgx_le_ctx *ctx)
 {
 	int i;
 
@@ -198,7 +198,15 @@ static void sgx_le_stop(struct sgx_le_ctx *ctx)
 	}
 }
 
-static int sgx_le_start(struct sgx_le_ctx *ctx)
+
+void sgx_le_stop(struct sgx_le_ctx *ctx)
+{
+	mutex_lock(&ctx->lock);
+	__sgx_le_stop(ctx);
+	mutex_unlock(&ctx->lock);
+}
+
+static int __sgx_le_start(struct sgx_le_ctx *ctx)
 {
 	struct subprocess_info *subinfo;
 	int ret;
@@ -217,13 +225,24 @@ static int sgx_le_start(struct sgx_le_ctx *ctx)
 
 	ret = call_usermodehelper_exec(subinfo, UMH_WAIT_EXEC);
 	if (ret) {
-		sgx_le_stop(ctx);
+		__sgx_le_stop(ctx);
 		return ret;
 	}
 
 	return 0;
 }
 
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
 int sgx_le_init(struct sgx_le_ctx *ctx)
 {
 	struct crypto_shash *tfm;
@@ -241,50 +260,51 @@ int sgx_le_init(struct sgx_le_ctx *ctx)
 void sgx_le_exit(struct sgx_le_ctx *ctx)
 {
 	mutex_lock(&ctx->lock);
-	sgx_le_stop(ctx);
 	crypto_free_shash(ctx->tfm);
 	mutex_unlock(&ctx->lock);
 }
 
-int sgx_le_get_token(struct sgx_le_ctx *ctx,
-		     const struct sgx_encl *encl,
-		     const struct sgx_sigstruct *sigstruct,
-		     struct sgx_einittoken *token)
+static int __sgx_le_get_token(struct sgx_le_ctx *ctx,
+			      const struct sgx_encl *encl,
+			      const struct sgx_sigstruct *sigstruct,
+			      struct sgx_einittoken *token)
 {
 	u8 mrsigner[32];
 	ssize_t ret;
 
-	mutex_lock(&ctx->lock);
-
 	ret = sgx_get_key_hash(ctx->tfm, sigstruct->modulus, mrsigner);
 	if (ret)
-		goto out_unlock;
-
-	ret = sgx_le_start(ctx);
-	if (ret)
-		goto out_unlock;
+		return ret;
 
 	ret = sgx_le_write(ctx->pipes[0], sigstruct->body.mrenclave, 32);
 	if (ret)
-		goto out_stop;
+		return ret;
 
 	ret = sgx_le_write(ctx->pipes[0], mrsigner, 32);
 	if (ret)
-		goto out_stop;
+		return ret;
 
 	ret = sgx_le_write(ctx->pipes[0], &encl->attributes, sizeof(uint64_t));
 	if (ret)
-		goto out_stop;
+		return ret;
 
 	ret = sgx_le_write(ctx->pipes[0], &encl->xfrm, sizeof(uint64_t));
 	if (ret)
-		goto out_stop;
+		return ret;
 
-	ret = sgx_le_read(ctx->pipes[1], token, sizeof(*token));
+	return sgx_le_read(ctx->pipes[1], token, sizeof(*token));
+}
 
-out_stop:
-	sgx_le_stop(ctx);
-out_unlock:
+int sgx_le_get_token(struct sgx_le_ctx *ctx,
+		     const struct sgx_encl *encl,
+		     const struct sgx_sigstruct *sigstruct,
+		     struct sgx_einittoken *token)
+{
+	int ret;
+
+	mutex_lock(&ctx->lock);
+	ret = __sgx_le_get_token(ctx, encl, sigstruct, token);
 	mutex_unlock(&ctx->lock);
+
 	return ret;
 }
diff --git a/drivers/platform/x86/intel_sgx/sgx_main.c b/drivers/platform/x86/intel_sgx/sgx_main.c
index 8c5fbe9ee870..c15a063bfc7e 100644
--- a/drivers/platform/x86/intel_sgx/sgx_main.c
+++ b/drivers/platform/x86/intel_sgx/sgx_main.c
@@ -93,6 +93,35 @@ u32 sgx_xsave_size_tbl[64];
 bool sgx_locked_msrs;
 u64 sgx_le_pubkeyhash[4];
 
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
+
 #ifdef CONFIG_COMPAT
 long sgx_compat_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 {
@@ -147,6 +176,8 @@ static unsigned long sgx_get_unmapped_area(struct file *file,
 
 const struct file_operations sgx_fops = {
 	.owner			= THIS_MODULE,
+	.open			= sgx_open,
+	.release		= sgx_release,
 	.unlocked_ioctl		= sgx_ioctl,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl		= sgx_compat_ioctl,
-- 
2.14.1
