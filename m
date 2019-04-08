From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v3 3/3] platform/x86: intel_pmc_core: Instantiate pmc_core
 device on legacy platforms
Date: Mon, 8 Apr 2019 11:24:43 -0700
Message-ID: <CACK8Z6HM2zyqnROvzT1jo4-=hfzSZ8HwO73ArD96hKg-FK3NWQ@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190405203558.19160-1-rajatja@google.com>
 <20190405203558.19160-3-rajatja@google.com> <20190408180202.GA769@raj-desk2.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408180202.GA769@raj-desk2.iind.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wysocki@google.com, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 8, 2019 at 11:15 AM Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
>
> On Fri, Apr 05, 2019 at 01:35:58PM -0700, Rajat Jain wrote:
> > Add code to instantiate the pmc_core platform device and thus attach to
> > the driver, if the ACPI device for the same ("INT33A1") is not present
> > in a system where it should be. This was discussed here:
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1966991.html
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> > v3: (first version of *this* patch -to go with rest of v3 patchset)
> > v2: (does not exist)
> > v1: (does not exist)
> >
> >  drivers/platform/x86/Makefile                 |  2 +-
> >  .../platform/x86/intel_pmc_core_plat_init.c   | 64 +++++++++++++++++++
> >  2 files changed, 65 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/platform/x86/intel_pmc_core_plat_init.c
>
> Can we call this intel_pmc_core_plat_drv.c instead?

Sure.

>
> >
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > index 86cb76677bc8..83d0bb9a14bb 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -89,7 +89,7 @@ obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)  += intel_bxtwc_tmu.o
> >  obj-$(CONFIG_INTEL_TELEMETRY)        += intel_telemetry_core.o \
> >                                  intel_telemetry_pltdrv.o \
> >                                  intel_telemetry_debugfs.o
> > -obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
> > +obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o intel_pmc_core_plat_init.o
>
> ditto

Sure.

>
> >  obj-$(CONFIG_PMC_ATOM)               += pmc_atom.o
> >  obj-$(CONFIG_MLX_PLATFORM)   += mlx-platform.o
> >  obj-$(CONFIG_INTEL_TURBO_MAX_3) += intel_turbo_max_3.o
> > diff --git a/drivers/platform/x86/intel_pmc_core_plat_init.c b/drivers/platform/x86/intel_pmc_core_plat_init.c
> > new file mode 100644
> > index 000000000000..45be89e7586c
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_pmc_core_plat_init.c
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Intel PMC Core platform init
> > + * Copyright (c) 2019, Google Inc.
>
> I'd like to consult Andy and Darren if we should also have Intel Copyright
> too?
>
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
> > +     .name = "pmc_core",
> > +};
> > +
> > +static int dummy;
> > +/*
> > + * INTEL_CPU_FAM6 macro won't take NULL for driver_data (uses &driver_data),
> > + * thus provide a dummy driver_data.
> > + */
> > +static const struct x86_cpu_id intel_pmc_core_ids[] = {
> > +     INTEL_CPU_FAM6(SKYLAKE_MOBILE, dummy),
> > +     INTEL_CPU_FAM6(SKYLAKE_DESKTOP, dummy),
> > +     INTEL_CPU_FAM6(KABYLAKE_MOBILE, dummy),
> > +     INTEL_CPU_FAM6(KABYLAKE_DESKTOP, dummy),
> > +     INTEL_CPU_FAM6(CANNONLAKE_MOBILE, dummy),
> > +     INTEL_CPU_FAM6(ICELAKE_MOBILE, dummy),
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
> > +
> > +static int __init pmc_core_platform_init(void)
> > +{
> > +     int ret;
> > +
> > +     /* Skip creating the platform device if ACPI already has a device */
> > +     if (acpi_dev_present("INT33A1", NULL, -1) ||
> > +         !x86_match_cpu(intel_pmc_core_ids))
> > +             return -ENODEV;
> > +
> > +     ret = platform_device_register(&pmc_core_device);
> > +     if (ret)
> > +             return ret;
>
> we can just return platform_devie_register (...) and avoid extra lines and
> variable.

Sure.

>
> > +
> > +     return 0;
> > +}
> > +
> > +static void __exit pmc_core_platform_exit(void)
> > +{
> > +     if (!acpi_dev_present("INT33A1", NULL, -1) &&
> > +         x86_match_cpu(intel_pmc_core_ids))
> > +             platform_device_unregister(&pmc_core_device);
> > +}
> > +
> > +module_init(pmc_core_platform_init);
> > +module_exit(pmc_core_platform_exit);
> > --
> > 2.21.0.392.gf8f6787159e-goog
> >
>
> --
> Best Regards,
> Rajneesh
