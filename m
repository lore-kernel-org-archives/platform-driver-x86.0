From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH RFC v3 07/12] intel_sgx: driver
 for Intel Software Guard Extensions
Date: Thu, 12 Oct 2017 09:48:15 -0700
Message-ID: <20171012164815.GA8145@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
 <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:49102 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753174AbdJLQu1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2017 12:50:27 -0400
Content-Disposition: inline
In-Reply-To: <20171010143258.21623-8-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org

On Tue, Oct 10, 2017 at 05:32:53PM +0300, Jarkko Sakkinen wrote:
> diff --git a/drivers/platform/x86/intel_sgx/sgx_main.c b/drivers/platform/x86/intel_sgx/sgx_main.c
> new file mode 100644
> index 000000000000..2ad2dc88edff
> --- /dev/null
> +++ b/drivers/platform/x86/intel_sgx/sgx_main.c
>
> +static dev_t sgx_devt;
> +
> +static void sgx_dev_release(struct device *dev)
> +{
> +	struct sgx_context *ctx = container_of(dev, struct sgx_context, dev);
> +	kfree(ctx);
> +}
> +
> +static struct sgx_context *sgx_ctx_alloc(struct device *parent)
> +{
> +	struct sgx_context *ctx;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	device_initialize(&ctx->dev);
> +
> +	ctx->dev.bus = &sgx_subsys;
> +	ctx->dev.parent = parent;
> +	ctx->dev.devt = MKDEV(MAJOR(sgx_devt), 0);
> +	ctx->dev.release = sgx_dev_release;
> +
> +	dev_set_name(&ctx->dev, "sgx");

/dev/sgx is created with 0600 permissions, does access to SGX really
need to be restricted to root by default?

> +
> +	cdev_init(&ctx->cdev, &sgx_fops);
> +	ctx->cdev.owner = THIS_MODULE;
> +
> +	dev_set_drvdata(parent, ctx);
> +
> +	return ctx;
> +}
> +
