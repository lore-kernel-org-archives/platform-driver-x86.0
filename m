From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 37/38] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Wed, 22 Jan 2020 12:34:54 +0000
Message-ID: <20200122123454.GL15507@dell>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-38-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200121160114.60007-38-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 21 Jan 2020, Mika Westerberg wrote:

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
> ---
>  .../ABI/obsolete/sysfs-driver-intel_pmc_bxt   |  22 +
>  arch/x86/include/asm/intel_pmc_ipc.h          |  47 --
>  arch/x86/include/asm/intel_telemetry.h        |   1 +
>  drivers/mfd/Kconfig                           |  16 +-
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/intel_pmc_bxt.c                   | 496 ++++++++++++++
>  drivers/platform/x86/Kconfig                  |  16 +-
>  drivers/platform/x86/Makefile                 |   1 -
>  drivers/platform/x86/intel_pmc_ipc.c          | 645 ------------------
>  .../platform/x86/intel_telemetry_debugfs.c    |  12 +-
>  drivers/platform/x86/intel_telemetry_pltdrv.c |   2 +
>  drivers/usb/typec/tcpm/Kconfig                |   2 +-
>  include/linux/mfd/intel_pmc_bxt.h             |  21 +
>  13 files changed, 572 insertions(+), 710 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-driver-intel_pmc_bxt
>  delete mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
>  create mode 100644 drivers/mfd/intel_pmc_bxt.c
>  delete mode 100644 drivers/platform/x86/intel_pmc_ipc.c
>  create mode 100644 include/linux/mfd/intel_pmc_bxt.h

[...]

> +static int intel_pmc_probe(struct platform_device *pdev)
> +{
> +	struct intel_scu_ipc_pdata pdata = {};
> +	struct intel_pmc_dev *pmc;
> +	int ret;
> +
> +	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
> +	if (!pmc)
> +		return -ENOMEM;
> +
> +	pmc->dev = &pdev->dev;
> +	spin_lock_init(&pmc->gcr_lock);
> +
> +	ret = intel_pmc_get_resources(pdev, pmc, &pdata);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request resources\n");
> +		return ret;
> +	}
> +
> +	pmc->scu = devm_intel_scu_ipc_register(&pdev->dev, &pdata);
> +	if (IS_ERR(pmc->scu))
> +		return PTR_ERR(pmc->scu);

*_register is better than *_probe.  If it was called that (or maybe
*_init) initially I may have missed the issue altogether ...

However, I still think it the SCU IPC *device* needs to be a device
driver and abide by the rules, ensuring it uses the device driver
model/API.  As such, it should be registered and probed as a device.

If you require something from it you should call into it (perhaps
using a register function like above), but that should be done *after*
the device has been bound and probed.

> +	platform_set_drvdata(pdev, pmc);
> +
> +	ret = intel_pmc_create_devices(pmc);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create PMC devices\n");
> +
> +	return ret;
> +}

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
