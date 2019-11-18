From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/7] x86/intel_pmc_core: Add Tiger Lake, Elkhart Lake
Date: Mon, 18 Nov 2019 12:50:25 +0200
Message-ID: <CAHp75Vfrd-BAZ7H_LuQfz32yaap1X3gEnqZ2-9EPQ+j_b0f93g@mail.gmail.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1573750525.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 14, 2019 at 7:02 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:
>
> Hi,
>
> Patch 1: Fix SoC naming inconsistency
> Patch 2: Cleans up termination lines
> Patch 3: Refactor driver for ease of adding new SoCs
> Patch 4: Add debugfs entry for PCH IPs only if platform supports
> Patch 5: Add Tiger Lake legacy support to pmc_core
> Patch 6: Add Elkhart Lake legacy support to pmc_core
> patch 7: Add Comet Lake legacy support to pmc_core
>
> All the information regarding the PCH IPs and names of IPs will be
> available in Intel's Platform Controller Hub (PCH) External Design
> Specification (EDS) document expected to be released in 2020 before
> product launch.

Thanks, though you forgot to fix all prefixes in the mails. We have
platform/x86: $DRIVER_NAME: ...

Also consider Mario's comment (I didn't hear back from you on it).

>
> Changes since v1:
> 1) Added a patch that fixes the naming inconsistency.
> 2) Fixed the prefix of all the patches.
>
> Changes since v2:
> 1) Add Comet Lake legacy support to pmc_core up on Dell's request
>
> Gayatri Kammela (7):
>   x86/intel_pmc_core: Fix the SoC naming inconsistency
>   x86/intel_pmc_core: Clean up: Remove comma after the termination line
>   x86/intel_pmc_core: Create platform dependent pmc bitmap structs
>   x86/intel_pmc_core: Make debugfs entry for pch_ip_power_gating_status
>     conditional
>   platform/x86: Add Tiger Lake (TGL) platform support to intel_pmc_core
>     driver
>   platform/x86: Add Atom based Elkhart Lake (EHL) platform support to
>     intel_pmc_core driver
>   platform/x86: Add Comet Lake (CML) platform support to intel_pmc_core
>     driver
>
>  drivers/platform/x86/intel_pmc_core.c | 121 ++++++++++++++++++++------
>  drivers/platform/x86/intel_pmc_core.h |   2 +-
>  2 files changed, 96 insertions(+), 27 deletions(-)
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Kan Liang <kan.liang@intel.com>
> Cc: David E. Box <david.e.box@intel.com>
> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
