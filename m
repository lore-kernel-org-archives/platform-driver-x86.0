From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v5 3/3] platform/x86: intel_pmc_core: Instantiate pmc_core
 device on legacy platforms
Date: Wed, 17 Apr 2019 16:05:37 -0700
Message-ID: <CACK8Z6EjGSCapBARvPPXuLg-iQ24oKhWpqLskzwV1w6VFhJAWQ@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190411003738.55073-1-rajatja@google.com>
 <20190411003738.55073-3-rajatja@google.com> <CAHp75VeSUVzzcRRsrDKg6KnTXptB5_fgQUk_jYiFwziimS8D2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeSUVzzcRRsrDKg6KnTXptB5_fgQUk_jYiFwziimS8D2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rafael J Wysocki <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 11, 2019 at 6:46 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 11, 2019 at 3:38 AM Rajat Jain <rajatja@google.com> wrote:
> >
> > Add code to instantiate the pmc_core platform device and thus attach to
> > the driver, if the ACPI device for the same ("INT33A1") is not present
> > in a system where it should be. This was discussed here:
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1966991.html
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v5: Remove the gerrit id from commit log
> > v4: Rename file, remove dummy arg, 1 conditional per if statement,
> >     simplify init / exit calls..
> > v3: (first version of *this* patch -to go with rest of v3 patchset)
> > v2: (does not exist)
> > v1: (does not exist)
> >
> >  drivers/platform/x86/Makefile                 |  2 +-
> >  .../platform/x86/intel_pmc_core_plat_drv.c    | 60 +++++++++++++++++++
> >  2 files changed, 61 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/platform/x86/intel_pmc_core_plat_drv.c
> >
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index 86cb76677bc8..7041a88c34c7 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -89,7 +89,7 @@ obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)    += intel_bxtwc_tmu.o
> >  obj-$(CONFIG_INTEL_TELEMETRY)  += intel_telemetry_core.o \
> >                                    intel_telemetry_pltdrv.o \
> >                                    intel_telemetry_debugfs.o
> > -obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
> > +obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o intel_pmc_core_plat_drv.o
> >  obj-$(CONFIG_PMC_ATOM)         += pmc_atom.o
> >  obj-$(CONFIG_MLX_PLATFORM)     += mlx-platform.o
> >  obj-$(CONFIG_INTEL_TURBO_MAX_3) += intel_turbo_max_3.o
> > diff --git a/drivers/platform/x86/intel_pmc_core_plat_drv.c b/drivers/platform/x86/intel_pmc_core_plat_drv.c
> > new file mode 100644
> > index 000000000000..7f5af5bd7f1f
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_pmc_core_plat_drv.c
> > @@ -0,0 +1,60 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Intel PMC Core platform init
> > + * Copyright (c) 2019, Google Inc.
> > + * Author - Rajat Jain
> > + *
> > + * This code instantiates platform devices for intel_pmc_core driver, only
> > + * on supported platforms that may not have the ACPI devices in the ACPI tables.
> > + * No new platforms should be added here, because we expect that new platforms
> > + * should all have the ACPI device, which is the preferred way of enumeration.
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <asm/cpu_device_id.h>
> > +#include <asm/intel-family.h>
> > +
> > +static struct platform_device pmc_core_device = {
> > +       .name = "pmc_core",
>
> This name is too generic. Better to use the current module name, i.e.
> "intel_pmc_core".

done


>
> However, see my comment to the first patch in the series.
>
> > +};
> > +
> > +/*
> > + * intel_pmc_core_platform_ids is the list of platforms where we want to
> > + * instantiate the platform_device if not already instantiated. This is
> > + * different than intel_pmc_core_ids in intel_pmc_core.c which is the
> > + * list of platforms that the driver supports for pmc_core device. The
> > + * other list may grow, but this list should not.
> > + */
> > +static const struct x86_cpu_id intel_pmc_core_platform_ids[] = {
> > +       INTEL_CPU_FAM6(SKYLAKE_MOBILE, pmc_core_device),
> > +       INTEL_CPU_FAM6(SKYLAKE_DESKTOP, pmc_core_device),
> > +       INTEL_CPU_FAM6(KABYLAKE_MOBILE, pmc_core_device),
> > +       INTEL_CPU_FAM6(KABYLAKE_DESKTOP, pmc_core_device),
> > +       INTEL_CPU_FAM6(CANNONLAKE_MOBILE, pmc_core_device),
> > +       INTEL_CPU_FAM6(ICELAKE_MOBILE, pmc_core_device),
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
> > +
> > +static int __init pmc_core_platform_init(void)
> > +{
> > +       /* Skip creating the platform device if ACPI already has a device */
> > +       if (acpi_dev_present("INT33A1", NULL, -1))
> > +               return -ENODEV;
> > +
> > +       if (!x86_match_cpu(intel_pmc_core_platform_ids))
> > +               return -ENODEV;
> > +
> > +       return platform_device_register(&pmc_core_device);
> > +}
> > +
> > +static void __exit pmc_core_platform_exit(void)
> > +{
> > +       platform_device_unregister(&pmc_core_device);
> > +}
> > +
> > +module_init(pmc_core_platform_init);
> > +module_exit(pmc_core_platform_exit);
> > --
> > 2.21.0.392.gf8f6787159e-goog
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko
