From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v11 - re-ordered 03/12] FIXME platform/mellanox: Remove
 redundant dev_err messages on device_create
Date: Thu, 25 Jan 2018 13:46:43 -0800
Message-ID: <20180125214643.GB24122@fury>
References: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 24, 2018 at 08:33:37PM +0000, Vadim Pasternak wrote:
> The upper layer will manage and report errors returned by the create and
> destroy functions.
> 
> FIXME: but it doesn't - we don't even check

I think we agreed to just drop this patch entirely, since this error is not
checked elsewhere? Keeping the dev_err messages?

> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> [dvhart: refactored into smaller functional changes]
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index e55f576..0ccd327 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -187,16 +187,11 @@ static int mlxreg_hotplug_device_create(struct device *dev,
>  					struct mlxreg_hotplug_device *item)
>  {
>  	item->adapter = i2c_get_adapter(item->bus);
> -	if (!item->adapter) {
> -		dev_err(dev, "Failed to get adapter for bus %d\n",
> -			item->bus);
> +	if (!item->adapter)
>  		return -EFAULT;
> -	}
>  
>  	item->client = i2c_new_device(item->adapter, &item->brdinfo);
>  	if (!item->client) {
> -		dev_err(dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
> -			item->brdinfo.type, item->bus, item->brdinfo.addr);
>  		i2c_put_adapter(item->adapter);
>  		item->adapter = NULL;
>  		return -EFAULT;
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
