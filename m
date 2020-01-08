From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 35/36] mfd: intel_pmc_bxt: Switch to use
 driver->dev_groups
Date: Wed, 8 Jan 2020 19:30:48 +0200
Message-ID: <20200108173048.GW32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-36-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-36-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:42:00PM +0300, Mika Westerberg wrote:
> The driver core provides support for adding additional attributes for
> devices via new ->dev_groups member of struct device_driver.

I'm wondering if we can also do this before converting to MFD.

> Convert the
> driver to use that instead of adding the attributes manually.
> 

After addressing above and below comments,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mfd/intel_pmc_bxt.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
> index 76f166c1455b..9f2eb75bdf78 100644
> --- a/drivers/mfd/intel_pmc_bxt.c
> +++ b/drivers/mfd/intel_pmc_bxt.c
> @@ -244,6 +244,11 @@ static const struct attribute_group intel_pmc_group = {
>  	.attrs = intel_pmc_attrs,
>  };
>  
> +static const struct attribute_group *intel_pmc_groups[] = {
> +	&intel_pmc_group,

> +	NULL,

Comma is not needed for terminator lines.

> +};
> +
>  static int pmc_create_punit_device(void)
>  {
>  	struct mfd_cell punit = {
> @@ -492,27 +497,14 @@ static int intel_pmc_probe(struct platform_device *pdev)
>  	ret = pmc_create_devices();
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to create pmc devices\n");
> -		goto err_ipc;
> -	}
> -
> -	ret = sysfs_create_group(&pdev->dev.kobj, &intel_pmc_group);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to create sysfs group %d\n",
> -			ret);
> -		goto err_ipc;
> +		intel_scu_ipc_remove(scu);
>  	}
>  
> -	return 0;
> -
> -err_ipc:
> -	intel_scu_ipc_remove(scu);
> -
>  	return ret;
>  }
>  
>  static int intel_pmc_remove(struct platform_device *pdev)
>  {
> -	sysfs_remove_group(&pdev->dev.kobj, &intel_pmc_group);
>  	intel_scu_ipc_remove(platform_get_drvdata(pdev));
>  	pmcdev.dev = NULL;
>  	return 0;
> @@ -524,6 +516,7 @@ static struct platform_driver intel_pmc_driver = {
>  	.driver = {
>  		.name = "intel_pmc_bxt",
>  		.acpi_match_table = ACPI_PTR(intel_pmc_acpi_ids),
> +		.dev_groups = intel_pmc_groups,
>  	},
>  };
>  
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
