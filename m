From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: intel_mid_thermal: Remove duplicated
 platform device ID
Date: Tue, 3 Jan 2017 22:46:15 +0200
Message-ID: <CAHp75Vd1ESu5Ej_vcWx5=tB4cGuXR4Um5tMoyV=SNK=9c2orNw@mail.gmail.com>
References: <1483370456-30786-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34746 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965918AbdACUqQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Jan 2017 15:46:16 -0500
In-Reply-To: <1483370456-30786-1-git-send-email-javier@osg.samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Mon, Jan 2, 2017 at 5:20 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Commit 3fca3d3d5075 ("platform-x86: intel_mid_thermal: add msic_thermal
> alias") added a "msic_thermal" entry to the driver's platform device ID
> table since that was the platform dev name registered in some platforms
> and the only dev in the platform table was "msic_sensor" (DRIVER_NAME).
>
> But then commit 634830704d80 ("x86/mid/thermal: Add msic_thermal alias")
> changed DRIVER_NAME from "msic_sensor" to "msic_thermal", and so there's
> now duplicated entries in the platform device ID table.
>

Both patches pushed to testing.
Thanks!

> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
>  drivers/platform/x86/intel_mid_thermal.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
> index 0df3c9d37509..05ac7203806d 100644
> --- a/drivers/platform/x86/intel_mid_thermal.c
> +++ b/drivers/platform/x86/intel_mid_thermal.c
> @@ -549,7 +549,6 @@ static int mid_thermal_remove(struct platform_device *pdev)
>
>  static const struct platform_device_id therm_id_table[] = {
>         { DRIVER_NAME, 1 },
> -       { "msic_thermal", 1 },
>         { }
>  };
>
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With Best Regards,
Andy Shevchenko
