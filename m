From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND] platform/x86: Add support for Dollar Cove TI power button
Date: Fri, 17 Nov 2017 17:16:28 +0200
Message-ID: <CAHp75VdW6E+NRTwrqQvgHtLJwRvROw1Tt4L2og+dVFcSg84KSA@mail.gmail.com>
References: <20171116192402.22905-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46395 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757460AbdKQPQ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 10:16:29 -0500
Received: by mail-qt0-f194.google.com with SMTP id r39so6764807qtr.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Nov 2017 07:16:29 -0800 (PST)
In-Reply-To: <20171116192402.22905-1-tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Thu, Nov 16, 2017 at 9:24 PM, Takashi Iwai <tiwai@suse.de> wrote:
> This provides a new input driver for supporting the power button on
> Dollar Cove TI PMIC, found on Cherrytrail-based devices.
> The patch is based on the original work by Intel, found at:
>   https://github.com/01org/ProductionKernelQuilts
>

Pushed to my reviewing and testing queue, thanks.

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=193891
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>
> It seems that Lee forgot to apply this one while he took two other
> patches through his MFD tree.  Since the MFD part was already merged
> to Linus tree now, it's better to go through platform tree.  Could you
> guys check this one quickly?  Thanks!
>
>
>  drivers/platform/x86/Kconfig                 | 11 ++++
>  drivers/platform/x86/Makefile                |  1 +
>  drivers/platform/x86/intel_chtdc_ti_pwrbtn.c | 94 ++++++++++++++++++++++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 344c78f0a5c4..3ed042d13c45 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1181,6 +1181,17 @@ config SILEAD_DMI
>           with the OS-image for the device. This option supplies the missing
>           information. Enable this for x86 tablets with Silead touchscreens.
>
> +config INTEL_CHTDC_TI_PWRBTN
> +       tristate "Intel Cherry Trail Dollar Cove TI power button driver"
> +       depends on INTEL_SOC_PMIC_CHTDC_TI
> +       depends on INPUT
> +       ---help---
> +         This option adds a power button driver driver for Dollar Cove TI
> +         PMIC on Intel Cherry Trail devices.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called intel_chtdc_ti_pwrbtn.
> +
>  endif # X86_PLATFORM_DEVICES
>
>  config PMC_ATOM
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c32b34a72467..4eb0948086ec 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -88,3 +88,4 @@ obj-$(CONFIG_PMC_ATOM)                += pmc_atom.o
>  obj-$(CONFIG_MLX_PLATFORM)     += mlx-platform.o
>  obj-$(CONFIG_MLX_CPLD_PLATFORM)        += mlxcpld-hotplug.o
>  obj-$(CONFIG_INTEL_TURBO_MAX_3) += intel_turbo_max_3.o
> +obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)    += intel_chtdc_ti_pwrbtn.o
> diff --git a/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c b/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
> new file mode 100644
> index 000000000000..ddd5d9027e92
> --- /dev/null
> +++ b/drivers/platform/x86/intel_chtdc_ti_pwrbtn.c
> @@ -0,0 +1,94 @@
> +/*
> + * Power-button driver for Dollar Cove TI PMIC
> + * Copyright (C) 2014 Intel Corp
> + * Copyright (c) 2017 Takashi Iwai <tiwai@suse.de>
> + */
> +
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/device.h>
> +#include <linux/mfd/intel_soc_pmic.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/slab.h>
> +
> +#define CHTDC_TI_SIRQ_REG      0x3
> +#define SIRQ_PWRBTN_REL                BIT(0)
> +
> +static irqreturn_t chtdc_ti_pwrbtn_interrupt(int irq, void *dev_id)
> +{
> +       struct input_dev *input = dev_id;
> +       struct device *dev = input->dev.parent;
> +       struct regmap *regmap = dev_get_drvdata(dev);
> +       int state;
> +
> +       if (!regmap_read(regmap, CHTDC_TI_SIRQ_REG, &state)) {
> +               dev_dbg(dev, "SIRQ_REG=0x%x\n", state);
> +               input_report_key(input, KEY_POWER, !(state & SIRQ_PWRBTN_REL));
> +               input_sync(input);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int chtdc_ti_pwrbtn_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct intel_soc_pmic *pmic = dev_get_drvdata(dev->parent);
> +       struct input_dev *input;
> +       int irq, err;
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +       input = devm_input_allocate_device(dev);
> +       if (!input)
> +               return -ENOMEM;
> +       input->name = pdev->name;
> +       input->phys = "power-button/input0";
> +       input->id.bustype = BUS_HOST;
> +       input_set_capability(input, EV_KEY, KEY_POWER);
> +       err = input_register_device(input);
> +       if (err)
> +               return err;
> +
> +       dev_set_drvdata(dev, pmic->regmap);
> +
> +       err = devm_request_threaded_irq(dev, irq, NULL,
> +                                       chtdc_ti_pwrbtn_interrupt,
> +                                       0, KBUILD_MODNAME, input);
> +       if (err)
> +               return err;
> +
> +       device_init_wakeup(dev, true);
> +       dev_pm_set_wake_irq(dev, irq);
> +       return 0;
> +}
> +
> +static int chtdc_ti_pwrbtn_remove(struct platform_device *pdev)
> +{
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +       device_init_wakeup(&pdev->dev, false);
> +       return 0;
> +}
> +
> +static const struct platform_device_id chtdc_ti_pwrbtn_id_table[] = {
> +       { .name = "chtdc_ti_pwrbtn" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(platform, chtdc_ti_pwrbtn_id_table);
> +
> +static struct platform_driver chtdc_ti_pwrbtn_driver = {
> +       .driver = {
> +               .name   = KBUILD_MODNAME,
> +       },
> +       .probe          = chtdc_ti_pwrbtn_probe,
> +       .remove         = chtdc_ti_pwrbtn_remove,
> +       .id_table       = chtdc_ti_pwrbtn_id_table,
> +};
> +module_platform_driver(chtdc_ti_pwrbtn_driver);
> +
> +MODULE_DESCRIPTION("Power-button driver for Dollar Cove TI PMIC");
> +MODULE_LICENSE("GPL v2");
> --
> 2.15.0
>



-- 
With Best Regards,
Andy Shevchenko
