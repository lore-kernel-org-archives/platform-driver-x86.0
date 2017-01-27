From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: fix out-of-bounds accesses
 on stack
Date: Fri, 27 Jan 2017 17:42:56 +0200
Message-ID: <CAHp75VfV3T546uZbctMBtdd55R06KHsynRP=fP06fBLLEs3Sgw@mail.gmail.com>
References: <20170126142723.23886-1-aryabinin@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126142723.23886-1-aryabinin@virtuozzo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 26, 2017 at 4:27 PM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
> pmc_core_mtpmc_link_status() an pmc_core_check_read_lock_bit() use
> test_bit() on local 32-bit variable. This causes out-of-bounds
> access since test_bit() expects object at least of 'unsigned long' size:
>
>    BUG: KASAN: stack-out-of-bounds in pmc_core_probe+0x3aa/0x3b0
>     Call Trace:
>      __asan_report_load_n_noabort+0x5c/0x80
>      pmc_core_probe+0x3aa/0x3b0
>      local_pci_probe+0xf9/0x1e0
>      pci_device_probe+0x27b/0x350
>      driver_probe_device+0x419/0x830
>      __driver_attach+0x15f/0x1d0
>      bus_for_each_dev+0x129/0x1d0
>      driver_attach+0x42/0x70
>      bus_add_driver+0x385/0x690
>      driver_register+0x1a9/0x3d0
>      __pci_register_driver+0x1a2/0x290
>      intel_pmc_core_driver_init+0x19/0x1b
>      do_one_initcall+0x12e/0x280
>      kernel_init_freeable+0x57c/0x623
>      kernel_init+0x13/0x140
>      ret_from_fork+0x2e/0x40
>
> Fix this by open coding bit test. While at it, also refactor this code
> a little bit.
>
> Fixes: 173943b3dae5 ("platform/x86: intel_pmc_core: ModPhy core lanes pg status")
> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index b130b8c..2fb5747 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -184,12 +184,8 @@ DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu
>
>  static int pmc_core_check_read_lock_bit(void)
>  {
> -       struct pmc_dev *pmcdev = &pmc;
> -       u32 value;
> -
> -       value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_CFG_OFFSET);
> -       return test_bit(SPT_PMC_READ_DISABLE_BIT,
> -                       (unsigned long *)&value);
> +       u32 value = pmc_core_reg_read(&pmc, SPT_PMC_PM_CFG_OFFSET);
> +       return value & (1U << SPT_PMC_READ_DISABLE_BIT);
>  }
>
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
> @@ -234,12 +230,8 @@ static const struct file_operations pmc_core_ppfear_ops = {
>  /* This function should return link status, 0 means ready */
>  static int pmc_core_mtpmc_link_status(void)
>  {
> -       struct pmc_dev *pmcdev = &pmc;
> -       u32 value;
> -
> -       value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
> -       return test_bit(SPT_PMC_MSG_FULL_STS_BIT,
> -                       (unsigned long *)&value);
> +       u32 value = pmc_core_reg_read(&pmc, SPT_PMC_PM_STS_OFFSET);
> +       return value & (1U << SPT_PMC_MSG_FULL_STS_BIT);
>  }

Thanks for the patch. IIRC I told (or may be forgot to tell) them
during internal review about the nasty casting.

Btw, have you checked this will work in the same way, since test_bit()
is atomic?
And if it's okay, why not to use BIT() macro?

-- 
With Best Regards,
Andy Shevchenko
