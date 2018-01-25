From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v11 12/12] platform/mellanox: Add validation of return
 code of hotplug device creation routine
Date: Thu, 25 Jan 2018 14:28:44 -0800
Message-ID: <20180125222844.GF24122@fury>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
 <1516826098-125036-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47337 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751268AbeAYW2r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 17:28:47 -0500
Content-Disposition: inline
In-Reply-To: <1516826098-125036-4-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 24, 2018 at 08:34:58PM +0000, Vadim Pasternak wrote:
> Adding validation of return code of mlxreg_hotplug_device_create. It could
> fail in case the requested adapter is not available or if client can not
> be connected to the adapter. Error is to be reported in case of bad flow.
> 

I had dropped the removal of the dev_err messages patch as it was based on an
inaccurate assumption that the return codes were checked. We could just include
that change together with this change as they are tightly coupled.

But...


> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index c806451..e852219 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -263,13 +263,15 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
>  			if (item->inversed)
>  				mlxreg_hotplug_device_destroy(data);
>  			else
> -				mlxreg_hotplug_device_create(data);
> +				ret = mlxreg_hotplug_device_create(data);
>  		} else {
>  			if (item->inversed)
> -				mlxreg_hotplug_device_create(data);
> +				ret = mlxreg_hotplug_device_create(data);
>  			else
>  				mlxreg_hotplug_device_destroy(data);
>  		}
> +		if (ret)
> +			dev_err(priv->dev, "Failed to create hotplug device.\n");

So we've moved the error message - but we have affected any functional change -
we still don't DO anything (or NOT DO anything) if the create call fails. Is
that the right thing?

>  	}
>  
>  	/* Acknowledge event. */
> @@ -312,8 +314,11 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
>  		if (regval == MLXREG_HOTPLUG_HEALTH_MASK) {
>  			if ((data->health_cntr++ == MLXREG_HOTPLUG_RST_CNTR) ||
>  			    !priv->after_probe) {
> -				mlxreg_hotplug_device_create(data);
> -				data->attached = true;
> +				ret = mlxreg_hotplug_device_create(data);
> +				if (ret)
> +					dev_err(priv->dev, "Failed to create hotplug device.\n");

I meant to bring this up - rather than repeat the exact same message as above,
should this read:

"Failed to create hotplug health device.\n" Or something similar? This would
provide the user/developer with more information about what is failing.

> +				else
> +					data->attached = true;

And this does change behavior, but isn't noted in the changelog.

I have pushed my v11 including everything up to and excluding this patch here:

https://github.com/dvhart/linux-pdx86/tree/review-dvhart-mellanox-v11

(also on the original repo at infradead which appears to be back up and running,
just giving it time before switching back 100%)

-- 
Darren Hart
VMware Open Source Technology Center
