From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ISST: Use dev_get_drvdata
Date: Thu, 25 Jul 2019 21:00:16 +0300
Message-ID: <CAHp75VdpEZbBTw3vsvreeyWAANo=ZDtooqbChe0fF4ALQsstGw@mail.gmail.com>
References: <20190724122320.21802-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724122320.21802-1-hslester96@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuhong Yuan <hslester96@gmail.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 24, 2019 at 3:23 PM Chuhong Yuan <hslester96@gmail.com> wrote:
>
> Instead of using to_pci_dev + pci_get_drvdata,
> use dev_get_drvdata to make code simpler.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> index f7266a115a08..ad8c7c0df4d9 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> @@ -132,11 +132,9 @@ static void isst_if_remove(struct pci_dev *pdev)
>
>  static int __maybe_unused isst_if_suspend(struct device *device)
>  {
> -       struct pci_dev *pdev = to_pci_dev(device);
> -       struct isst_if_device *punit_dev;
> +       struct isst_if_device *punit_dev = dev_get_drvdata(device);
>         int i;
>
> -       punit_dev = pci_get_drvdata(pdev);
>         for (i = 0; i < ARRAY_SIZE(punit_dev->range_0); ++i)
>                 punit_dev->range_0[i] = readl(punit_dev->punit_mmio +
>                                                 mmio_range[0].beg + 4 * i);
> @@ -149,11 +147,9 @@ static int __maybe_unused isst_if_suspend(struct device *device)
>
>  static int __maybe_unused isst_if_resume(struct device *device)
>  {
> -       struct pci_dev *pdev = to_pci_dev(device);
> -       struct isst_if_device *punit_dev;
> +       struct isst_if_device *punit_dev = dev_get_drvdata(device);
>         int i;
>
> -       punit_dev = pci_get_drvdata(pdev);
>         for (i = 0; i < ARRAY_SIZE(punit_dev->range_0); ++i)
>                 writel(punit_dev->range_0[i], punit_dev->punit_mmio +
>                                                 mmio_range[0].beg + 4 * i);
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
