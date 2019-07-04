From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Patch v2 10/10] platform/x86/asus-wmi: using dev_get_drvdata directly
Date: Thu, 4 Jul 2019 16:25:50 +0300
Message-ID: <CAHp75Vc-8cmnaKDcnWPEZAOWTF5-4p_otH=Q926BCprQaL1TkA@mail.gmail.com>
References: <20190704023647.4873-1-huangfq.daxian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704023647.4873-1-huangfq.daxian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 4, 2019 at 5:37 AM Fuqian Huang <huangfq.daxian@gmail.com> wrote:
>
> Several drivers cast a struct device pointer to a struct
> platform_device pointer only to then call platform_get_drvdata().
> To improve readability, these constructs can be simplified
> by using dev_get_drvdata() directly.

v1 had been applied.

> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
> Changes in v2:
>   - Make the commit message more clearly.
>
>  drivers/platform/x86/asus-wmi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 9b18a184e0aa..49049b02a015 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1353,8 +1353,7 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
>                                           struct attribute *attr, int idx)
>  {
>         struct device *dev = container_of(kobj, struct device, kobj);
> -       struct platform_device *pdev = to_platform_device(dev->parent);
> -       struct asus_wmi *asus = platform_get_drvdata(pdev);
> +       struct asus_wmi *asus = dev_get_drvdata(dev->parent);
>         int dev_id = -1;
>         int fan_attr = -1;
>         u32 value = ASUS_WMI_UNSUPPORTED_METHOD;
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
