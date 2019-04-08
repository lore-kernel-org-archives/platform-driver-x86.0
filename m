From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 3/3] platform/x86: intel_pmc_core: Instantiate pmc_core
 device on legacy platforms
Date: Mon, 8 Apr 2019 20:07:19 +0300
Message-ID: <CAHp75VcB=gBa01UJLYVzApZ-2g745zX=mEtE9nJUyfzFdk3-pw@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190405203558.19160-1-rajatja@google.com>
 <20190405203558.19160-3-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405203558.19160-3-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wysocki@google.com, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, furquan@google.com, evgreen@google.com, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 5, 2019 at 11:36 PM Rajat Jain <rajatja@google.com> wrote:
>
> Add code to instantiate the pmc_core platform device and thus attach to
> the driver, if the ACPI device for the same ("INT33A1") is not present
> in a system where it should be. This was discussed here:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1966991.html
>



> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +static struct platform_device pmc_core_device = {
> +       .name = "pmc_core",
> +};
> +

> +static int dummy;
> +/*
> + * INTEL_CPU_FAM6 macro won't take NULL for driver_data (uses &driver_data),
> + * thus provide a dummy driver_data.
> + */

You may use pmc_core_device instead, right?

> +static const struct x86_cpu_id intel_pmc_core_ids[] = {
> +       INTEL_CPU_FAM6(SKYLAKE_MOBILE, dummy),
> +       INTEL_CPU_FAM6(SKYLAKE_DESKTOP, dummy),
> +       INTEL_CPU_FAM6(KABYLAKE_MOBILE, dummy),
> +       INTEL_CPU_FAM6(KABYLAKE_DESKTOP, dummy),
> +       INTEL_CPU_FAM6(CANNONLAKE_MOBILE, dummy),
> +       INTEL_CPU_FAM6(ICELAKE_MOBILE, dummy),
> +       {}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
> +
> +static int __init pmc_core_platform_init(void)
> +{
> +       int ret;
> +
> +       /* Skip creating the platform device if ACPI already has a device */
> +       if (acpi_dev_present("INT33A1", NULL, -1) ||
> +           !x86_match_cpu(intel_pmc_core_ids))
> +               return -ENODEV;

Split it to one conditional per line.

> +
> +       ret = platform_device_register(&pmc_core_device);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static void __exit pmc_core_platform_exit(void)
> +{

> +       if (!acpi_dev_present("INT33A1", NULL, -1) &&
> +           x86_match_cpu(intel_pmc_core_ids))

Redundant check.

> +               platform_device_unregister(&pmc_core_device);
> +}

-- 
With Best Regards,
Andy Shevchenko
