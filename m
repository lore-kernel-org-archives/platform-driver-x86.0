From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: GPD pocket fan: Stop work on suspend
Date: Fri, 26 Jan 2018 17:29:41 +0200
Message-ID: <CAHp75VfOE+L3V9qCsGqjeXPYJqSX0YrEhxNddXTwSoVWGZ0qGQ@mail.gmail.com>
References: <20180119204709.16240-1-hdegoede@redhat.com> <20180119204709.16240-3-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:44910 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbeAZP3n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 10:29:43 -0500
In-Reply-To: <20180119204709.16240-3-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 19, 2018 at 10:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Stop the work on suspend, otherwise it may run between our suspend method
> running and the system suspending, possibly restarting the fan which
> we've just stopped.
>
> Note we already requeue the work on resume, so that we get a fresh speed
> at resume.

All three pushed to my reviewing and testing queue, thanks!

>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/gpd-pocket-fan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
> index f7b4980c0aa6..6425c9b49caa 100644
> --- a/drivers/platform/x86/gpd-pocket-fan.c
> +++ b/drivers/platform/x86/gpd-pocket-fan.c
> @@ -177,6 +177,7 @@ static int gpd_pocket_fan_suspend(struct device *dev)
>  {
>         struct gpd_pocket_fan_data *fan = dev_get_drvdata(dev);
>
> +       cancel_delayed_work_sync(&fan->work);
>         gpd_pocket_fan_set_speed(fan, gpd_pocket_fan_min_speed());
>         return 0;
>  }
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko
