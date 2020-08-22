From: Prashant Malani <pmalani-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
 (IOM) driver
Date: Sat, 22 Aug 2020 02:56:31 -0700
Message-ID: <20200822095631.GB2553024@google.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200822040508.23510-2-rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ayman Bagabas <ayman.bagabas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Masahiro Yamada <masahiroy-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jithu Joseph <jithu.joseph-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz-piQ53kQ5nys@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Rajmohan,

On Fri, Aug 21, 2020 at 09:05:06PM -0700, Rajmohan Mani wrote:
> Input Output Manager (IOM) is part of the Tiger Lake SoC that
> configures the Type-C Sub System (TCSS). IOM is a micro controller
> that handles Type-C topology, configuration and PM functions of
> various Type-C devices connected on the platform.
> 
> This driver helps read relevant information such as Type-C port
> status (whether a device is connected to a Type-C port or not) and
> the activity type on the Type-C ports (such as USB, Display Port,
> Thunderbolt), for consumption by other drivers.
> 
> Currently intel_iom_port_status() API is exported by this driver,
> that has information about the Type-C port status and port activity
> type.
> 
> Signed-off-by: Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---

Perhaps include a version log of changes since v1?
> diff --git a/drivers/platform/x86/intel_iom.c b/drivers/platform/x86/intel_iom.c
> new file mode 100644
> index 000000000000..cda7716410c6
> --- /dev/null
> +++ b/drivers/platform/x86/intel_iom.c
> +int intel_iom_port_status(u8 port, u32 *status)
> +{
> +	void __iomem *reg;
> +
> +	if (!iom || !iom->dev || !iom->regbar)

Do we need to check for !iom->dev and !iom->regbar? Is there a valid
situation where iom != NULL but iom->dev and/or iom->regbar == NULL?
Sounds like it shouldn't, but I may be missing something.

> +		return -ENODEV;
> +
> +	if (!status || (port > IOM_MAX_PORTS - 1))

I think parentheses around "port > IOM_MAX_PORT - 1" aren't required.
> +		return -EINVAL;
> +
> +	reg = iom->regbar + IOM_PORT_STATUS_OFFSET + IOM_REG_LEN * port;
> +
> +	*status = ioread32(reg);

Perhaps just inline reg within the parentheses?
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(intel_iom_port_status);
> +
> +static int intel_iom_probe(struct platform_device *pdev)
> +{
> +	void __iomem *addr;
> +
> +	/* only one IOM device is supported */

Minor nit: s/only/Only
> +	if (iom)
> +		return -EBUSY;
> +
> +	iom = devm_kzalloc(&pdev->dev, sizeof(*iom), GFP_KERNEL);
> +	if (!iom)
> +		return -ENOMEM;
> +
> +	addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +
> +	iom->regbar = addr;
> +	iom->dev = &pdev->dev;
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id intel_iom_acpi_ids[] = {
> +	{ "INTC1072" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, intel_iom_acpi_ids);
> +
> +static struct platform_driver intel_iom_driver = {
> +	.probe = intel_iom_probe,

nit: I generally see ".probe" listed below ".driver".
> +	.driver = {
> +		.name = "intel_iom",
> +		.acpi_match_table = intel_iom_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver_probe(intel_iom_driver, intel_iom_probe);
> +
> +MODULE_AUTHOR("Rajmohan Mani <rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("Intel IOM driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/platform_data/x86/intel_iom.h b/include/linux/platform_data/x86/intel_iom.h
> new file mode 100644
> index 000000000000..e4c9a305e7a9
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel_iom.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _PLATFORM_DATA_X86_INTEL_IOM_H_
> +#define _PLATFORM_DATA_X86_INTEL_IOM_H_
> +
> +
> +#define IOM_MAX_PORTS					4
> +/* Register length in bytes */
> +#define IOM_REG_LEN					4

Do these two #define's need to be in the header, instead of directly in
intel_iom.c ?

> +
> +#ifdef CONFIG_ACPI
> +
> +int intel_iom_port_status(u8 port, u32 *status);
> +
> +#else
> +
> +int intel_iom_port_status(struct intel_iom *iom, u8 port, u32 *status)

Should the function signature be the same as the #ifdef case?

Best regards,

-Prashant
