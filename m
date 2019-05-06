From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH next 20/25] platform/x86: asus-wmi: Use dev_get_drvdata()
Date: Mon, 6 May 2019 12:01:41 +0300
Message-ID: <CAHp75VcmM0mx7-3P96n092cz0mfV22OK+jB_Gvqsrhv2PsqEFQ@mail.gmail.com>
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com> <20190423075020.173734-21-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423075020.173734-21-wangkefeng.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Apr 23, 2019 at 10:40 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Using dev_get_drvdata directly.
>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ee1fa93708ec..fb9e4e02c068 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1361,8 +1361,7 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
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
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
