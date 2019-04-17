From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v5 1/3] platform/x86: intel_pmc_core: Convert to a platform_driver
Date: Wed, 17 Apr 2019 16:03:52 -0700
Message-ID: <CACK8Z6G6o5RGKp3OzSED8KJ6SA=YGhJDrefxduQjHSjGvEa-9Q@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190411003738.55073-1-rajatja@google.com>
 <CAHp75VceZ7w33U=2Ly_qp58E=xEf4vUBEYgfHHHKgvSg2Q+yMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VceZ7w33U=2Ly_qp58E=xEf4vUBEYgfHHHKgvSg2Q+yMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rafael J Wysocki <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 11, 2019 at 6:44 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 11, 2019 at 3:37 AM Rajat Jain <rajatja@google.com> wrote:
> >
> > Convert the intel_pmc_core driver to a platform driver, and attach using
> > the ACPI enumeration method (via the ACPI device "INT33A1").
>
> >         cpu_id = x86_match_cpu(intel_pmc_core_ids);
> >         if (!cpu_id)
> >                 return -ENODEV;
> > @@ -888,28 +893,49 @@ static int __init pmc_core_probe(void)
> >         mutex_init(&pmcdev->lock);
> >         pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
> >
> > +       dmi_check_system(pmc_core_dmi_table);
> > +       platform_set_drvdata(pdev, pmcdev);
> > +
> >         err = pmc_core_dbgfs_register(pmcdev);
> >         if (err < 0) {
> > -               pr_warn(" debugfs register failed.\n");
> > +               dev_warn(&pdev->dev, "debugfs register failed.\n");
> >                 iounmap(pmcdev->regbase);
> >                 return err;
> >         }
> >
> > -       dmi_check_system(pmc_core_dmi_table);
> > -       pr_info(" initialized\n");
>
> > +       dev_info(&pdev->dev, " initialized\n");
> > +       device_initialized = true;
>
> First you do something, then print it's done, and not other way around.

done

>
> > +
> >         return 0;
> >  }
> > -module_init(pmc_core_probe)
> >
> > -static void __exit pmc_core_remove(void)
> > +static int pmc_core_remove(struct platform_device *pdev)
> >  {
> > -       struct pmc_dev *pmcdev = &pmc;
> > +       struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
> >
> > +       platform_set_drvdata(pdev, NULL);
> >         pmc_core_dbgfs_unregister(pmcdev);
> >         mutex_destroy(&pmcdev->lock);
> >         iounmap(pmcdev->regbase);
> > +       return 0;
> >  }
> > -module_exit(pmc_core_remove)
> > +
> > +static const struct acpi_device_id pmc_core_acpi_ids[] = {
> > +       {"INT33A1", 0}, /* _HID for Intel Power Engine, _CID PNP0D80*/
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, pmc_core_acpi_ids);
> > +
> > +static struct platform_driver pmc_core_driver = {
> > +       .driver = {
> > +               .name = "pmc_core",
> > +               .acpi_match_table = ACPI_PTR(pmc_core_acpi_ids),
> > +       },
> > +       .probe = pmc_core_probe,
> > +       .remove = pmc_core_remove,
> > +};
> > +
> > +module_platform_driver(pmc_core_driver);
>
> So, this patch has a bisectability issue. After it AFAIU some
> platforms will not be able to enumerate the device.
>
> To avoid such you have to reconsider logic behind this conversion, i.e.
> 1. Split the driver to core part and current initialization mechanism
> 2. Add platform driver as a separate module.

done.


>
> --
> With Best Regards,
> Andy Shevchenko
