From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 18/19] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Tue, 24 Mar 2020 11:52:19 +0000
Message-ID: <20200324115219.GB437932@dell>
References: <20200303133649.39819-1-mika.westerberg@linux.intel.com>
 <20200303133649.39819-19-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200303133649.39819-19-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 03 Mar 2020, Mika Westerberg wrote:

> This driver only creates a bunch of platform devices sharing resources
> belonging to the PMC device. This is pretty much what MFD subsystem is
> for so move the driver there, renaming it to intel_pmc_bxt.c which
> should be more clear what it is.
> 
> MFD subsystem provides nice helper APIs for subdevice creation so
> convert the driver to use those. Unfortunately the ACPI device includes
> separate resources for most of the subdevices so we cannot simply call
> mfd_add_devices() to create all of them but instead we need to call it
> separately for each device.
> 
> The new MFD driver continues to expose two sysfs attributes that allow
> userspace to send IPC commands to the PMC/SCU to avoid breaking any
> existing applications that may use these. Generally this is bad idea so
> document this in the ABI documentation.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../ABI/obsolete/sysfs-driver-intel_pmc_bxt   |  22 +
>  arch/x86/include/asm/intel_pmc_ipc.h          |  47 --
>  arch/x86/include/asm/intel_telemetry.h        |   1 +
>  drivers/mfd/Kconfig                           |  16 +-
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/intel_pmc_bxt.c                   | 504 ++++++++++++++
>  drivers/platform/x86/Kconfig                  |  16 +-
>  drivers/platform/x86/Makefile                 |   1 -
>  drivers/platform/x86/intel_pmc_ipc.c          | 645 ------------------
>  .../platform/x86/intel_telemetry_debugfs.c    |  12 +-
>  drivers/platform/x86/intel_telemetry_pltdrv.c |   2 +
>  drivers/usb/typec/tcpm/Kconfig                |   2 +-
>  include/linux/mfd/intel_pmc_bxt.h             |  43 ++
>  13 files changed, 602 insertions(+), 710 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-driver-intel_pmc_bxt
>  delete mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
>  create mode 100644 drivers/mfd/intel_pmc_bxt.c
>  delete mode 100644 drivers/platform/x86/intel_pmc_ipc.c
>  create mode 100644 include/linux/mfd/intel_pmc_bxt.h

[...]

> +/*
> + * We use the below templates to construct MFD cells. The struct
> + * intel_pmc_dev instance holds the real MFD cells where we first copy
> + * these and then fill the dynamic parts based on the extracted resources.
> + */
> +
> +static const struct mfd_cell punit = {
> +	.name = "intel_punit_ipc",
> +};
> +
> +static int update_no_reboot_bit(void *priv, bool set)
> +{
> +	struct intel_pmc_dev *pmc = priv;
> +	u32 bits = PMC_CFG_NO_REBOOT_EN;
> +	u32 value = set ? bits : 0;
> +
> +	return intel_pmc_gcr_update(pmc, PMC_GCR_PMC_CFG_REG, bits, value);
> +}
> +
> +static const struct itco_wdt_platform_data tco_pdata = {
> +	.name = "Apollo Lake SoC",
> +	.version = 5,
> +	.update_no_reboot_bit = update_no_reboot_bit,
> +};
> +
> +static const struct mfd_cell tco = {
> +	.name = "iTCO_wdt",
> +	.ignore_resource_conflicts = true,
> +};
> +
> +static const struct resource telem_res[] = {
> +	DEFINE_RES_MEM(TELEM_PUNIT_SSRAM_OFFSET, TELEM_SSRAM_SIZE),
> +	DEFINE_RES_MEM(TELEM_PMC_SSRAM_OFFSET, TELEM_SSRAM_SIZE),
> +};
> +
> +static const struct mfd_cell telem = {
> +	.name = "intel_telemetry",
> +	.resources = telem_res,
> +	.num_resources = ARRAY_SIZE(telem_res),
> +};
> +
> +static int intel_pmc_get_tco_resources(struct platform_device *pdev,
> +				       struct intel_pmc_dev *pmc)
> +{
> +	struct itco_wdt_platform_data *pdata;
> +	struct resource *res, *tco_res;
> +
> +	if (acpi_has_watchdog())
> +		return 0;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO,
> +				    PLAT_RESOURCE_ACPI_IO_INDEX);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get IO resource\n");
> +		return -EINVAL;
> +	}
> +
> +	tco_res = devm_kcalloc(&pdev->dev, 2, sizeof(*tco_res), GFP_KERNEL);
> +	if (!tco_res)
> +		return -ENOMEM;
> +
> +	tco_res[0].flags = IORESOURCE_IO;
> +	tco_res[0].start = res->start + TCO_BASE_OFFSET;
> +	tco_res[0].end = tco_res[0].start + TCO_REGS_SIZE - 1;
> +	tco_res[1].flags = IORESOURCE_IO;
> +	tco_res[1].start = res->start + SMI_EN_OFFSET;
> +	tco_res[1].end = tco_res[1].start + SMI_EN_SIZE - 1;
> +
> +	pmc->cells[PMC_TCO].resources = tco_res;
> +	pmc->cells[PMC_TCO].num_resources = 2;
> +
> +	pdata = devm_kmemdup(&pdev->dev, &tco_pdata, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;

Why do you need to take a copy?

This can be referenced directly in 'mfd_cell tco', no?

> +	pdata->no_reboot_priv = pmc;

You're putting device data inside platform data?

This doesn't sit right with me at all.

You already saved it using platform_set_drvdata(), why do you need it
twice?  Why can't you export update_no_reboot_bit() and make it take
'struct intel_pmc_dev' or better yet 'pdev' as an argument?

> +	pmc->cells[PMC_TCO].platform_data = pdata;
> +	pmc->cells[PMC_TCO].pdata_size = sizeof(*pdata);
> +
> +	return 0;
> +}
> +
> +static int intel_pmc_get_resources(struct platform_device *pdev,
> +				   struct intel_pmc_dev *pmc,
> +				   struct intel_scu_ipc_data *scu_data)
> +{
> +	struct resource *res, *punit_res;
> +	struct resource gcr_res;
> +	size_t npunit_res = 0;
> +	int ret;
> +
> +	scu_data->irq = platform_get_irq_optional(pdev, 0);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM,
> +				    PLAT_RESOURCE_IPC_INDEX);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get IPC resource\n");
> +		return -EINVAL;
> +	}
> +
> +	/* IPC registers */
> +	scu_data->mem.flags = res->flags;
> +	scu_data->mem.start = res->start;
> +	scu_data->mem.end = res->start + PLAT_RESOURCE_IPC_SIZE - 1;
> +
> +	/* GCR registers */
> +	gcr_res.flags = res->flags;
> +	gcr_res.start = res->start + PLAT_RESOURCE_GCR_OFFSET;
> +	gcr_res.end = gcr_res.start + PLAT_RESOURCE_GCR_SIZE - 1;
> +
> +	pmc->gcr_mem_base = devm_ioremap_resource(&pdev->dev, &gcr_res);
> +	if (IS_ERR(pmc->gcr_mem_base))
> +		return PTR_ERR(pmc->gcr_mem_base);
> +
> +	pmc->cells[PMC_TCO] = tco;
> +	pmc->cells[PMC_PUNIT] = punit;
> +	pmc->cells[PMC_TELEM] = telem;

Why are you still saving these to device data?

What's stopping you operating on the structures directly?

[...]

Remainder looks half sane.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
