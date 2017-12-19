From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v9 7/7] intel_sgx: in-kernel launch enclave
Date: Tue, 19 Dec 2017 15:59:28 +0200
Message-ID: <20171219135928.ospmfhabavac5gnu@linux.intel.com>
References: <20171216162200.20243-1-jarkko.sakkinen@linux.intel.com>
 <20171216162200.20243-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="dm76kltmxrcl2iua"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:16677 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1763277AbdLSN7k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 08:59:40 -0500
Content-Disposition: inline
In-Reply-To: <20171216162200.20243-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>


--dm76kltmxrcl2iua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 16, 2017 at 06:19:54PM +0200, Jarkko Sakkinen wrote:
> The Launch Enclave (LE) generates cryptographic launch tokens for user
> enclaves. A launch token is used by EINIT to check whether the enclave
> is authorized to launch or not. By having its own launch enclave, Linux
> has full control of the enclave launch process.
> 
> LE is wrapped into a user space proxy program that reads enclave
> signatures outputs launch tokens. The kernel-side glue code is
> implemented by using the user space helper framework.  The IPC between
> the LE proxy program and kernel is handled with an anonymous inode.
> 
> The commit also adds enclave signing tool that is used by kbuild to
> measure and sign the launch enclave. CONFIG_INTEL_SGX_SIGNING_KEY points
> to a PEM-file for the 3072-bit RSA key that is used as the LE public key
> pair. The default location is:
> 
>   drivers/platform/x86/intel_sgx/sgx_signing_key.pem
> 
> If the default key does not exist kbuild will generate a random key and
> place it to this location. KBUILD_SGX_SIGN_PIN can be used to specify
> the passphrase for the LE public key.
> 
> The CMAC implementation has been derived from TinyCrypt. The kernel
> AES-NI implementation is used for AES.
> 
> [1] https://github.com/01org/tinycrypt

I streamlined the IPC quite a bit. See the attached patch. Can be
applied on top of this patch.

/Jarkko

--dm76kltmxrcl2iua
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-Clean-up-IPC-of-the-launch-control.patch"

From 2854f53b8b3780a3edc4711fdeb10221cb156c11 Mon Sep 17 00:00:00 2001
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Tue, 19 Dec 2017 14:22:22 +0200
Subject: [PATCH] Clean up IPC of the launch control

Merged user_wq and kernel_wq into single wq instance. Replaced raw
buffer with struct sgx_launch_request instance in order to simplify the
code and avoid unnecessary copies.  Removed buf_lock. It is not needed
because kernel and user space parts take turns by having separate wait
conditions.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx/sgx_le.c | 63 +++++++++++++++------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/intel_sgx/sgx_le.c b/drivers/platform/x86/intel_sgx/sgx_le.c
index 842d4e03dd27..f196c7a4b609 100644
--- a/drivers/platform/x86/intel_sgx/sgx_le.c
+++ b/drivers/platform/x86/intel_sgx/sgx_le.c
@@ -72,12 +72,10 @@ struct sgx_le_ctx {
 	struct mutex hash_lock;
 	struct mutex launch_lock;
 	struct rw_semaphore users;
-	wait_queue_head_t kernel_wq;
-	wait_queue_head_t user_wq;
-	struct mutex buf_lock;
+	wait_queue_head_t wq;
 	bool kernel_read;
 	bool user_read;
-	u8 buf[PAGE_SIZE];
+	struct sgx_launch_request req;
 };
 
 struct sgx_le_ctx sgx_le_ctx;
@@ -88,14 +86,17 @@ static ssize_t sgx_le_ctx_fops_read(struct file *filp, char __user *buf,
 	struct sgx_le_ctx *ctx = filp->private_data;
 	int ret;
 
-	ret = wait_event_interruptible(ctx->user_wq, ctx->user_read);
+	if (count != sizeof(ctx->req)) {
+		pr_crit("intel_sgx: %s: invalid count %lu\n", __func__, count);
+		return -EIO;
+	}
+
+	ret = wait_event_interruptible(ctx->wq, ctx->user_read);
 	if (ret)
 		return -EINTR;
 
-	mutex_lock(&ctx->buf_lock);
-	ret = copy_to_user(buf, ctx->buf, count);
+	ret = copy_to_user(buf, &ctx->req, count);
 	ctx->user_read = false;
-	mutex_unlock(&ctx->buf_lock);
 
 	return ret ? ret : count;
 }
@@ -106,12 +107,15 @@ static ssize_t sgx_le_ctx_fops_write(struct file *filp, const char __user *buf,
 	struct sgx_le_ctx *ctx = filp->private_data;
 	int ret;
 
-	mutex_lock(&ctx->buf_lock);
-	ret = copy_from_user(ctx->buf, buf, count);
+	if (count != sizeof(ctx->req.token)) {
+		pr_crit("intel_sgx: %s: invalid count %lu\n", __func__, count);
+		return -EIO;
+	}
+
+	ret = copy_from_user(&ctx->req.token, buf, count);
 	if (!ret)
 		ctx->kernel_read = true;
-	wake_up_interruptible(&ctx->kernel_wq);
-	mutex_unlock(&ctx->buf_lock);
+	wake_up_interruptible(&ctx->wq);
 
 	return ret ? ret : count;
 }
@@ -241,9 +245,7 @@ int sgx_le_init(struct sgx_le_ctx *ctx)
 	mutex_init(&ctx->hash_lock);
 	mutex_init(&ctx->launch_lock);
 	init_rwsem(&ctx->users);
-	init_waitqueue_head(&ctx->kernel_wq);
-	init_waitqueue_head(&ctx->user_wq);
-	mutex_init(&ctx->buf_lock);
+	init_waitqueue_head(&ctx->wq);
 
 	return 0;
 }
@@ -257,7 +259,6 @@ void sgx_le_exit(struct sgx_le_ctx *ctx)
 
 static int __sgx_le_get_token(struct sgx_le_ctx *ctx,
 			      const struct sgx_encl *encl,
-			      struct sgx_launch_request *req,
 			      struct sgx_einittoken *token)
 {
 	ssize_t ret;
@@ -265,22 +266,15 @@ static int __sgx_le_get_token(struct sgx_le_ctx *ctx,
 	if (!ctx->tgid)
 		return -EIO;
 
-	/* write request */
-	mutex_lock(&ctx->buf_lock);
-	memcpy(ctx->buf, req, sizeof(*req));
 	ctx->user_read = true;
-	wake_up_interruptible(&ctx->user_wq);
-	mutex_unlock(&ctx->buf_lock);
+	wake_up_interruptible(&ctx->wq);
 
-	/* read token */
-	ret = wait_event_interruptible(ctx->kernel_wq, ctx->kernel_read);
+	ret = wait_event_interruptible(ctx->wq, ctx->kernel_read);
 	if (ret)
 		return -EINTR;
 
-	mutex_lock(&ctx->buf_lock);
-	memcpy(token, ctx->buf, sizeof(*token));
+	memcpy(token, &ctx->req.token, sizeof(*token));
 	ctx->kernel_read = false;
-	mutex_unlock(&ctx->buf_lock);
 
 	return 0;
 }
@@ -290,27 +284,28 @@ int sgx_le_get_token(struct sgx_le_ctx *ctx,
 		     const struct sgx_sigstruct *sigstruct,
 		     struct sgx_einittoken *token)
 {
-	struct sgx_launch_request req;
+	u8 mrsigner[32];
 	int ret;
 
 	mutex_lock(&ctx->hash_lock);
-	ret = sgx_get_key_hash(ctx->tfm, sigstruct->modulus, &req.mrsigner);
+	ret = sgx_get_key_hash(ctx->tfm, sigstruct->modulus, mrsigner);
 	if (ret) {
 		mutex_unlock(&ctx->hash_lock);
 		return ret;
 	}
-	if (!memcmp(&req.mrsigner, sgx_le_pubkeyhash, 32)) {
+	if (!memcmp(mrsigner, sgx_le_pubkeyhash, 32)) {
 		mutex_unlock(&ctx->hash_lock);
 		return 0;
 	}
 	mutex_unlock(&ctx->hash_lock);
 
-	memcpy(&req.mrenclave, sigstruct->body.mrenclave, 32);
-	req.attributes = encl->attributes;
-	req.xfrm = encl->xfrm;
-
 	mutex_lock(&ctx->launch_lock);
-	ret = __sgx_le_get_token(ctx, encl, &req, token);
+	memcpy(&ctx->req.mrenclave, sigstruct->body.mrenclave, 32);
+	memcpy(&ctx->req.mrsigner, mrsigner, 32);
+	ctx->req.attributes = encl->attributes;
+	ctx->req.xfrm = encl->xfrm;
+	memset(&ctx->req.token, 0, sizeof(ctx->req.token));
+	ret = __sgx_le_get_token(ctx, encl, token);
 	mutex_unlock(&ctx->launch_lock);
 
 	return ret;
-- 
2.14.1


--dm76kltmxrcl2iua--
