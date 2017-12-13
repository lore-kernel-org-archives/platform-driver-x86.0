From: "Christopherson, Sean J" <sean.j.christopherson@intel.com>
Subject: RE: [PATCH v6 10/11] intel_sgx: glue code for in-kernel LE
Date: Wed, 13 Dec 2017 23:34:43 +0000
Message-ID: <37306EFA9975BE469F115FDE982C075BC6B3B619@ORSMSX108.amr.corp.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-11-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:54302 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750785AbdLMXeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 18:34:44 -0500
In-Reply-To: <20171125193132.24321-11-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Sat, Nov 25, 2017 at 09:29:27PM +0200, Jarkko Sakkinen wrote:
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

Not sure what other code would need to be juggled to make it happen,
but checking the enclave's signer against sgx_le_pubkeyhash needs to
be moved outside of the sgx_le_ctx mutex, e.g. to sgx_le_get_token.
Deadlocks can occur because the kernel's LE uses the same EINIT flow
as normal enclaves.  If a userspace enclave is created immediately
after opening /dev/sgx it can race with the LE to acquire the lock.
If the userspace enclave wins, it will block indefinitely waiting
for the LE to generate the token, while the LE is blocked waiting
for the lock.

This bug is trivial to reproduce on a single threaded system/VM.

Hung task trace for the in-kernel enclave:

[  484.330510] INFO: task 3:972 blocked for more than 120 seconds.
[  484.331111]       Not tainted 4.14.0+ #21
[  484.331507] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  484.332244] 3               D    0   972      2 0x00000000
[  484.332248] Call Trace:
[  484.332265]  __schedule+0x3c2/0x890
[  484.332267]  schedule+0x36/0x80
[  484.332268]  schedule_preempt_disabled+0xe/0x10
[  484.332269]  __mutex_lock.isra.2+0x2b1/0x4e0
[  484.332274]  __mutex_lock_slowpath+0x13/0x20
[  484.332276]  mutex_lock+0x2f/0x40
[  484.332278]  sgx_le_get_token+0x3e/0x166 [intel_sgx]
[  484.332282]  sgx_ioc_enclave_init+0xd2/0x120 [intel_sgx]
[  484.332283]  sgx_ioctl+0xdc/0x180 [intel_sgx]
[  484.332306]  do_vfs_ioctl+0xa1/0x5e0
[  484.332308]  SyS_ioctl+0x79/0x90
[  484.332310]  entry_SYSCALL_64_fastpath+0x1e/0xa9


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
