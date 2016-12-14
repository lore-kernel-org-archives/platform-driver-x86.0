From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Add ideapad Y700 15-ACZ to the
 no_hw_rfkill DMI list
Date: Wed, 14 Dec 2016 03:42:34 +0200
Message-ID: <CAHp75VdTLb2PHde3T5griZ7B8XJAE_bm4fir=v-Ng9jZOdxOSw@mail.gmail.com>
References: <20161206221743.357426a0@fazafaka>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:32954 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753149AbcLNBnV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2016 20:43:21 -0500
Received: by mail-oi0-f66.google.com with SMTP id f201so685393oib.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2016 17:42:35 -0800 (PST)
In-Reply-To: <20161206221743.357426a0@fazafaka>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: velemas <velemas@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org

On Tue, Dec 6, 2016 at 9:17 PM, velemas <velemas@gmail.com> wrote:
> Like other Y700 models Lenovo Y700 15-ACZ does not have a physical rfkill switch.
> ideapad-laptop wrongly reports all radios as blocked by hardware which causes
> wireless network connections to fail.
>
> Add this model without an rfkill switch to the no_hw_rfkill list.

Pushed to testing with fixed Subject line (Pattern is "platform/x86:
driver: Description").
Thanks.

>
> Signed-off-by: Artiom Vaskov <velemas@gmail.com>
> ---
> --- a/drivers/platform/x86/ideapad-laptop.c     2016-10-03 02:24:33.000000000 +0300
> +++ b/drivers/platform/x86/ideapad-laptop.c     2016-11-24 23:02:08.108870266 +0300
> @@ -870,6 +870,13 @@ static const struct dmi_system_id no_hw_
>                         DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
>                 },
>         },
> +       {
> +               .ident = "Lenovo ideapad Y700-15ACZ",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-15ACZ"),
> +               },
> +       },
>         {
>                 .ident = "Lenovo ideapad Y700-15ISK",
>                 .matches = {
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With Best Regards,
Andy Shevchenko
