From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: Add Driver to set up lid GPEs on MS Surface device
Date: Tue, 8 Sep 2020 21:40:28 +0300
Message-ID: <CAHp75VevrwKaba_FsZj-nPqJGR9fkmFPzvdCew0wCqF_L6QLbA@mail.gmail.com>
References: <20200908171934.1661509-1-luzmaximilian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200908171934.1661509-1-luzmaximilian@gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 8, 2020 at 8:20 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> Conventionally, wake-up events for a specific device, in our case the
> lid device, are managed via the ACPI _PRW field. While this does not
> seem strictly necessary based on ACPI spec, the kernel disables GPE
> wakeups to avoid non-wakeup interrupts preventing suspend by default and
> only enables GPEs associated via the _PRW field with a wake-up capable
> device. This behavior has been introduced in commit f941d3e41da7 ("ACPI:
> EC / PM: Disable non-wakeup GPEs for suspend-to-idle") and is described
> in more detail in its commit message.
>
> Unfortunately, on MS Surface devices, there is no _PRW field present on
> the lid device, thus no GPE is associated with it, and therefore the GPE
> responsible for sending the status-change notification to the lid gets
> disabled during suspend, making it impossible to wake the device via the
> lid.
>
> This patch introduces a pseudo-device and respective driver which, based
> on some DMI matching, marks the corresponding GPE of the lid device for
> wake and enables it during suspend. The behavior of this driver models
> the behavior of the ACPI/PM core for normal wakeup GPEs, properly
> declared via the _PRW field.

...

> +#include <linux/platform_device.h>
> +
> +

One blank line is enough.

...

> +       .gpe_number = 0x17,
> +       .gpe_number = 0x4D,
> +       .gpe_number = 0x4F,
> +       .gpe_number = 0x57,

From where these numbers come from? Can we get them from firmware (ACPI)?

...

> +       { }
> +};
> +
> +

One is enough. Same for other places.

...

> +static int surface_gpe_suspend(struct device *dev)
> +{
> +       const struct surface_lid_device *lid;
> +
> +       lid = dev_get_platdata(dev);

There is enough room to put this assignment directly into definition.

> +       return surface_lid_enable_wakeup(dev, lid, true);
> +}
> +
> +static int surface_gpe_resume(struct device *dev)
> +{
> +       const struct surface_lid_device *lid;
> +
> +       lid = dev_get_platdata(dev);

Ditto.

> +       return surface_lid_enable_wakeup(dev, lid, false);
> +}

...

> +static int surface_gpe_probe(struct platform_device *pdev)
> +{
> +       const struct surface_lid_device *lid;
> +       int status;
> +

> +       lid = dev_get_platdata(&pdev->dev);
> +       if (!lid)
> +               return -ENODEV;

Can we use software nodes?

> +       status = acpi_mark_gpe_for_wake(NULL, lid->gpe_number);
> +       if (status) {
> +               dev_err(&pdev->dev, "failed to mark GPE for wake: %d\n", status);
> +               return -EINVAL;
> +       }
> +

> +       status = acpi_enable_gpe(NULL, lid->gpe_number);

Did I miss anything or all calls of enable / disable GPE are using
NULL as a first parameter? What the point in such case?

> +       if (status) {
> +               dev_err(&pdev->dev, "failed to enable GPE: %d\n", status);
> +               return -EINVAL;
> +       }
> +
> +       status = surface_lid_enable_wakeup(&pdev->dev, lid, false);
> +       if (status) {
> +               acpi_disable_gpe(NULL, lid->gpe_number);
> +               return status;
> +       }
> +
> +       return 0;
> +}

...

> +static void __exit surface_gpe_exit(void)
> +{

> +       if (!surface_gpe_device)
> +               return;

This is redundant check.

> +       platform_device_unregister(surface_gpe_device);
> +       platform_driver_unregister(&surface_gpe_driver);
> +}
> +

> +module_init(surface_gpe_init);
> +module_exit(surface_gpe_exit);

Attach each to the corresponding method w/o blank line in between.

...

> +MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro:*");
> +MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro4:*");

Can simply

MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurface*:*");

work?

-- 
With Best Regards,
Andy Shevchenko
