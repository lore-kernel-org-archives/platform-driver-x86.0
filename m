From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 10/11] intel_sgx: glue code for in-kernel LE
Date: Fri, 17 Nov 2017 15:07:05 -0800
Message-ID: <20171117230705.GE25974@fury>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-11-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43262 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759495AbdKQXHH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 18:07:07 -0500
Content-Disposition: inline
In-Reply-To: <20171113194528.28557-11-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 13, 2017 at 09:45:27PM +0200, Jarkko Sakkinen wrote:
> Glue code for hosting in-kernel Launch Enclave (LE) by using the user
> space helper framework.
> 
> Tokens for launching enclaves are generated with by the following
> protocol:
> 
> 1. The driver sends a SIGSTRUCT blob to the LE hosting process
>    to the input pipe.
> 2. The LE hosting process reads the SIGSTRUCT blob from the input
>    pipe.
> 3. After generating a EINITTOKEN blob, the LE hosting process writes
>    it to the output pipe.
> 4. The driver reads the EINITTOKEN blob from the output pipe.
> 
> If IA32_SGXLEPUBKEYHASH* MSRs are writable and they don't have the
> public key hash of the LE they will be updated.
> 

A few nits throughout to keep in mind:

* #includes in alphabetical order in general
* function local variables declared in order of decreasing line length
* don't insert newlines where coding_style doesn't compel you to

> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> -
...--
> diff --git a/drivers/platform/x86/intel_sgx/sgx_le.c b/drivers/platform/x86/intel_sgx/sgx_le.c
> new file mode 100644
> index 000000000000..d49c58f09db6
> --- /dev/null
> +++ b/drivers/platform/x86/intel_sgx/sgx_le.c
> @@ -0,0 +1,313 @@
...
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/kmod.h>
> +#include <linux/mutex.h>
> +#include <linux/wait.h>
> +#include <linux/pipe_fs_i.h>
> +#include <linux/sched/signal.h>
> +#include <linux/shmem_fs.h>
> +#include <linux/anon_inodes.h>

alphabetical order
...
> +static int sgx_le_create_pipe(struct sgx_le_ctx *ctx,
> +			      unsigned int fd)
> +{
> +	struct file *files[2];
> +	int ret;
> +
> +	ret = create_pipe_files(files, 0);
> +	if (ret)
> +		goto out;

Fairly inconsistent in the use of the goto out: model and returning
inline where there is no cleanup to be done. Whatever you do, please be
consistent within the file.

If there is no cleanup to do, a local return is fine.

> +
> +	ctx->pipes[fd] = files[fd ^ 1];
> +	ret = replace_fd(fd, files[fd], 0);
> +	fput(files[fd]);
> +
> +out:
> +	return ret;
> +}
> +
> +static int sgx_le_read(struct file *file, void *data, unsigned int len)
> +{
> +	ssize_t ret;
> +	loff_t pos = 0;

Decreasing line length.

> +	ret = kernel_read(file, data, len, &pos);
> +
> +	if (ret != len && ret >= 0)
> +		return -ENOMEM;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

You save a 4 lines with:

	if (ret < 0)
		return ret;
	return ret == len ? 0 : -ENOMEM;

They're common, but ternary ops aren't the most legible things in the
world, so your call.

> +}
> +
> +static int sgx_le_write(struct file *file, const void *data,
> +			unsigned int len)
> +{
> +	ssize_t ret;
> +	loff_t pos = 0;

Decreasing line length.
...
> +static int sgx_le_task_init(struct subprocess_info *subinfo, struct cred *new)
> +{
> +	struct sgx_le_ctx *ctx =
> +		(struct sgx_le_ctx *)subinfo->data;

No wrap

> +	unsigned long len;
> +	struct file *tmp_filp;
> +	int ret;
> +
> +	len = (unsigned long)&sgx_le_proxy_end - (unsigned long)&sgx_le_proxy;
> +
> +	tmp_filp = shmem_file_setup("[sgx_le_proxy]", len, 0);
> +	if (IS_ERR(tmp_filp)) {
> +		ret = PTR_ERR(tmp_filp);
> +		return ret;
> +	}
> +	ret = replace_fd(SGX_LE_PROXY_FD, tmp_filp, 0);
> +	fput(tmp_filp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sgx_le_write(tmp_filp, &sgx_le_proxy, len);
> +	if (ret)
> +		return ret;
> +
> +	tmp_filp = anon_inode_getfile("[/dev/sgx]", &sgx_fops, NULL, O_RDWR);
> +	if (IS_ERR(tmp_filp))
> +		return PTR_ERR(tmp_filp);
> +	ret = replace_fd(SGX_LE_DEV_FD, tmp_filp, 0);
> +	fput(tmp_filp);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sgx_le_create_pipe(ctx, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sgx_le_create_pipe(ctx, 1);
> +	if (ret < 0)
> +		return ret;
> +

No incremental cleanup here - appears to all be handled through
sgx_le_stop - do I have that right?
...
> diff --git a/drivers/platform/x86/intel_sgx/sgx_main.c b/drivers/platform/x86/intel_sgx/sgx_main.c
> index 636a583bad31..7931083651f5 100644
> --- a/drivers/platform/x86/intel_sgx/sgx_main.c
> +++ b/drivers/platform/x86/intel_sgx/sgx_main.c
> @@ -88,6 +88,37 @@ u64 sgx_encl_size_max_64;
>  u64 sgx_xfrm_mask = 0x3;
>  u32 sgx_misc_reserved;
>  u32 sgx_xsave_size_tbl[64];
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

We can simplify the return logic:

if (ret)
	up_read...
return ret;


-- 
Darren Hart
VMware Open Source Technology Center
