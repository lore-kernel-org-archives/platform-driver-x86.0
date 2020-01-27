From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/7] platform/x86: intel_pmc_core: Add debugfs entries
Date: Mon, 27 Jan 2020 12:49:16 +0200
Message-ID: <CAHp75Vfb38BEh2OZkO2EoQgCyBxaLoiwh8S_qKiPQRX1g+ZA2Q@mail.gmail.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Mika Westerberg <mika.westerberg@intel.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 24, 2020 at 10:59 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:
>
> Hi,
>
> Tiger Lake platform supports 8 sub-states/low power modes of S0ix. Add
> debugfs entries to pmc_core driver to access low power mode registers
> and residencies.
>
> Patch 1: Add debugfs entry to access sub-state residencies
> Patch 2: Add debugfs entry for low power mode status registers
> Patch 3: Refactor the driver by removing redundant code
> Patch 4: Remove slp_s0 attributes from tgl_reg_map
> Patch 5: Add an additional parameter to pmc_core_lpm_display_map()
> Patch 6: Dump low power status registers on an S0ix.y failure
> Patch 7: Add debugfs support to access live status registers

It doesn't apply to our for-next branch.

>
> Gayatri Kammela (7):
>   platform/x86: intel_pmc_core: Add debugfs entry to access sub-state
>     residencies
>   platform/x86: intel_pmc_core: Add debugfs entry for low power mode
>     status registers
>   platform/x86: intel_pmc_core: Refactor the driver by removing
>     redundant code
>   platform/x86: intel_pmc_core: Remove slp_s0 attributes from
>     tgl_reg_map
>   platform/x86: intel_pmc_core: Add an additional parameter to
>     pmc_core_lpm_display()
>   platform/x86: intel_pmc_core: Dump low power status registers on an
>     S0ix.y failure
>   platform/x86: intel_pmc_core: Add debugfs support to access live
>     status registers
>
>  drivers/platform/x86/intel_pmc_core.c | 301 +++++++++++++++++++++++---
>  drivers/platform/x86/intel_pmc_core.h |  28 +++
>  2 files changed, 302 insertions(+), 27 deletions(-)
>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
