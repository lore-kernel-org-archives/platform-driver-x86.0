From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/5] Add Tiger Lake/Elkhart Lake support to pmc_core driver
Date: Fri, 27 Sep 2019 09:01:07 +0300
Message-ID: <CAHp75Vcrp2ffDCE=tm2dwSEhwfPCPWGhb-Nw0v-7ga2y=_dL8w@mail.gmail.com>
References: <20190926192603.18647-1-gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926192603.18647-1-gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, charles.d.prestopine@intel.com, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 26, 2019 at 9:43 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:

Thank you for the series, I'll comment them later.

For now, check how to properly setup prefix for all patches. The Title
all broken.

> Patch 1: Cleans up termination lines
> Patch 2: Refactor driver for ease of adding new SoCs
> Patch 3: Refactor debugfs entry for PCH IPs power gating status
> Patch 4: Add Tiger Lake legacy support to pmc_core
> Patch 5: Add Elkhart Lake legacy support to pmc_core
>
> All the information regarding the PCH IPs and names of IPs will be available
> in *future* Intel's Platform Controller Hub (PCH) External Design Specification
> (EDS) document.

When?

> Gayatri Kammela (5):
>   x86/intel_pmc_core: Clean up: Remove comma after the termination line
>   x86/intel_pmc_core: Create platform dependent pmc bitmap structs
>   x86/intel_pmc_core: Make debugfs entry for pch_ip_power_gating_status
>     conditional
>   platform/x86: Add Tiger Lake(TGL) platform support to intel_pmc_core
>     driver
>   platform/x86: Add Atom based Elkhart Lake(EHL) platform support to
>     intel_pmc_core driver
>
>  drivers/platform/x86/intel_pmc_core.c | 108 +++++++++++++++++++++-----
>  drivers/platform/x86/intel_pmc_core.h |   2 +-
>  2 files changed, 88 insertions(+), 22 deletions(-)
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Kan Liang <kan.liang@intel.com>
> Cc: David E. Box <david.e.box@intel.com>
> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
