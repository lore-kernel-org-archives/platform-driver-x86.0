From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH -next] platform/x86: intel_pmc_core: fix build error
 without CONFIG_DEBUG_FS
Date: Tue, 25 Feb 2020 12:13:16 +0200
Message-ID: <CAHp75Vf3Bsjj+0ebkxMatZfUGDJ=upOHBFHfOs_PDOnFTnRJYQ@mail.gmail.com>
References: <20200220033335.106963-1-chenzhou10@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200220033335.106963-1-chenzhou10@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Zhou <chenzhou10@huawei.com>, Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 20, 2020 at 5:40 AM Chen Zhou <chenzhou10@huawei.com> wrote:
>
> If CONFIG_DEBUG_FS is n, build fails:
>
> drivers/platform/x86/intel_pmc_core.c: In function pmc_core_resume:
> drivers/platform/x86/intel_pmc_core.c:1327:3: error: implicit declaration of function pmc_core_slps0_display; did you mean pmc_core_is_pc10_failed? [-Werror=implicit-function-declaration]
>    pmc_core_slps0_display(pmcdev, dev, NULL);
>       ^~~~~~~~~~~~~~~~~~~~~~
>
> Function pmc_core_slps0_display() is responsible for displaying debug
> registers, which is under CONFIG_DEBUG_FS.
>
> Providing the static inline stub whenever CONFIG_DEBUG_FS is disabled
> to fix this. Function pmc_core_lpm_display() is the same.

Thank you for the patch, but I think it's not the right approach.
Basically we need to move those functions outside of #if
IS_ENABLED(CONFIG_DEBUG_FS).
(Move them upper).

Also I have noticed another issue in pmc_core_lpm_display(). It uses
tgl_lpm_maps directly. It shouldn't.

Cc: Gayatri.

Gayatri, care to fix?

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index f4a36fb..939f8e0 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1117,6 +1117,20 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>         }
>  }
>  #else
> +static inline void pmc_core_slps0_display(struct pmc_dev *pmcdev,
> +                                          struct device *dev,
> +                                          struct seq_file *s)
> +{
> +}
> +
> +static inline void pmc_core_lpm_display(struct pmc_dev *pmcdev,
> +                                        struct device *dev,
> +                                        struct seq_file *s, u32 offset,
> +                                        const char *str,
> +                                        const struct pmc_bit_map **maps)
> +{
> +}
> +
>  static inline void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
>  {
>  }
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
