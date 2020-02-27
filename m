From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/4] platform/x86: intel_pmc_core: Add bug fixes or
 code
Date: Thu, 27 Feb 2020 11:56:43 +0200
Message-ID: <20200227095643.GB1224808@smile.fi.intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Chen Zhou <chenzhou10@huawei.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 26, 2020 at 06:43:26PM -0800, Gayatri Kammela wrote:
> Hi,
> 
> This patch series consists of bug fixes and code optimization for the
> series https://patchwork.kernel.org/patch/11365325/
> 
> Patch 1: Make pmc_core_lpm_display() generic
> Patch 2: Relocate both pmc_core_slps0_display() and pmc_core_lpm_display()
> Patch 3: Remove the duplicate if() condition to create debugfs entry
> Patch 4: Add back slp_s0_offset attribute back to tgl_reg_map

Let's do other way around, i.e. patch 2 as a first in the series, so I may fix
the current (visible) issue.

Then fix the kbuild bot complains and send the rest.

> 
> Gayatri Kammela (4):
>   platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display() generic
>     for platforms that support sub-states
>   platform/x86: intel_pmc_core: fix: Relocate pmc_core_slps0_display()
>     and pmc_core_lpm_display() to outside of CONFIG_DEBUG_FS
>   platform/x86: intel_pmc_core: fix: Remove the duplicate if() to create
>     debugfs entry for substate_live_status_registers
>   platform/x86: intel_pmc_core: fix: Add slp_s0_offset attribute back to
>     tgl_reg_map
> 
>  drivers/platform/x86/intel_pmc_core.c | 131 +++++++++++++-------------
>  1 file changed, 66 insertions(+), 65 deletions(-)
> 
> Cc: Chen Zhou <chenzhou10@huawei.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko
