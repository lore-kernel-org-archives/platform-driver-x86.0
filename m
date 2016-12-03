From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] x86/intel_mid_thermal: Fix suspend handlers unused warning
Date: Sat, 3 Dec 2016 16:31:36 +0200
Message-ID: <CAHp75Ve2asqJox+x7dVm0r=j4EWZQ80hL7-RD8vw5ae4QL9dwg@mail.gmail.com>
References: <20161126160151.25745-1-bp@alien8.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36343 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbcLCObi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Dec 2016 09:31:38 -0500
In-Reply-To: <20161126160151.25745-1-bp@alien8.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Sat, Nov 26, 2016 at 6:01 PM, Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> Fix:
>
>   drivers/platform/x86/intel_mid_thermal.c:424:12: warning: =E2=80=98mid_=
thermal_resume=E2=80=99
>   defined but not used [-Wunused-function]
>    static int mid_thermal_resume(struct device *dev)
>               ^
>   drivers/platform/x86/intel_mid_thermal.c:436:12: warning: =E2=80=98mid_=
thermal_suspend=E2=80=99
>   defined but not used [-Wunused-function]
>    static int mid_thermal_suspend(struct device *dev)
>               ^
>
> which I see during randbuilds here.

Thanks!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  drivers/platform/x86/intel_mid_thermal.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/=
x86/intel_mid_thermal.c
> index 9f713b832ba3..0df3c9d37509 100644
> --- a/drivers/platform/x86/intel_mid_thermal.c
> +++ b/drivers/platform/x86/intel_mid_thermal.c
> @@ -415,6 +415,7 @@ static struct thermal_device_info *initialize_sensor(=
int index)
>         return td_info;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
>  /**
>   * mid_thermal_resume - resume routine
>   * @dev: device structure
> @@ -442,6 +443,7 @@ static int mid_thermal_suspend(struct device *dev)
>          */
>         return configure_adc(0);
>  }
> +#endif
>
>  static SIMPLE_DEV_PM_OPS(mid_thermal_pm,
>                          mid_thermal_suspend, mid_thermal_resume);
> --
> 2.10.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver=
-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
With Best Regards,
Andy Shevchenko
