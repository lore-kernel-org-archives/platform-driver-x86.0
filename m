From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/4]  pvpanic: add pvpanic support for arm64
Date: Tue, 23 Oct 2018 11:38:58 +0100
Message-ID: <20181023103858.v4rqg646u7roszla@lakrids.cambridge.arm.com>
References: <1540315537-70007-1-git-send-email-peng.hao2@zte.com.cn>
 <1540315537-70007-2-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1540315537-70007-2-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Hao <peng.hao2@zte.com.cn>
Cc: robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 24, 2018 at 01:25:35AM +0800, Peng Hao wrote:
> pvpanic device is a qemu-specific emulation device. Pvpanic
> devices are now available for ARM64. This patch supports the APCI
> way to get device information.


This woule be better described as:

pvpanic: add MMIO support

On some architectures (e.g. arm64), it's preferable to use MMIO, since
this can be used standalone. Add MMIO support to the pvpanic driver.

> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 22 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index fd86dab..bdcff8b 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -35,13 +35,16 @@
>  
>  static const struct acpi_device_id pvpanic_device_ids[] = {
>  	{ "QEMU0001", 0 },
> +	{ "PVPANIC01", 0 },
>  	{ "", 0 },

Why do we need the new ACPI ID?

Can't QEMU0001 cover both the ioport and MMIO versions, given they can
be distinguished based on the associated resources?

Otherwise, this looks sane to me.

Thanks,
Mark.

>  };
>  MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
>  
>  #define PVPANIC_PANICKED	(1 << 0)
>  
> +
> +static void __iomem *base;
>  
>  static struct acpi_driver pvpanic_driver = {
>  	.name =		"pvpanic",
> @@ -57,7 +60,10 @@
>  static void
>  pvpanic_send_event(unsigned int event)
>  {
> -	outb(event, port);
> +	if (port)
> +		outb(event, port);
> +	else if (base)
> +		writeb(event, base);
>  }
>  
>  static int
> @@ -77,6 +83,8 @@
>  static acpi_status
>  pvpanic_walk_resources(struct acpi_resource *res, void *context)
>  {
> +	struct acpi_resource_fixed_memory32 *fixmem32;
> +
>  	switch (res->type) {
>  	case ACPI_RESOURCE_TYPE_END_TAG:
>  		return AE_OK;
> @@ -84,7 +92,11 @@
>  	case ACPI_RESOURCE_TYPE_IO:
>  		port = res->data.io.minimum;
>  		return AE_OK;
> -
> +
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		fixmem32 = &res->data.fixed_memory32;
> +		base = ioremap(fixmem32->address, fixmem32->address_length);
> +		return AE_OK;
>  	default:
>  		return AE_ERROR;
>  	}
> @@ -104,7 +116,7 @@ static int pvpanic_add(struct acpi_device *device)
>  	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
>  			    pvpanic_walk_resources, NULL);
>  
> -	if (!port)
> +	if (!port && !base)
>  		return -ENODEV;
>  
>  	atomic_notifier_chain_register(&panic_notifier_list,
> @@ -118,6 +130,8 @@ static int pvpanic_remove(struct acpi_device *device)
>  
>  	atomic_notifier_chain_unregister(&panic_notifier_list,
>  					 &pvpanic_panic_nb);
> +	if (base)
> +		iounmap(base);
>  	return 0;
>  }
>  
> -- 
> 1.8.3.1
> 
