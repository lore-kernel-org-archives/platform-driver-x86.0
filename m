From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add wapf=4 quirk for Asus X302UA
Date: Tue, 4 Apr 2017 18:30:34 +0300
Message-ID: <CAHp75VdO7NojMOJmSSFmWQyGKjCOcc7C8BTfTQMi0oibNrY4Pw@mail.gmail.com>
References: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
 <20170403230540.GC17322@fury> <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
 <1491306253.708.116.camel@linux.intel.com> <01385ec9-b40c-a680-e9e2-7ab29b322056@vatsul.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33093 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754571AbdDDPak (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 11:30:40 -0400
Received: by mail-qk0-f195.google.com with SMTP id p22so24203891qka.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 08:30:40 -0700 (PDT)
In-Reply-To: <01385ec9-b40c-a680-e9e2-7ab29b322056@vatsul.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Santeri Toivonen <santeri.toivonen@vatsul.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Apr 4, 2017 at 4:35 PM, Santeri Toivonen
<santeri.toivonen@vatsul.com> wrote:

> There were indeed some issues wit hthe mail client ruining the formatting
> which should finally be fixed in the following:

Now, patch looks indeed good.Though I need a better commit message.
Please, resend
- as a separate mail
- having clear commit message.

Thanks!

>
> Signed-off-by: Santeri Toivonen <santeri.toivonen@vatsul.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index dea98ffb6f60..1ae58d906536 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] = {
>         },
>         {
>                 .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. X302UA",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
> +               },
> +               .driver_data = &quirk_asus_wapf4,
> +       },
> +       {
> +               .callback = dmi_matched,
>                 .ident = "ASUSTeK COMPUTER INC. X401U",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> --
> 2.11.0.windows.3



-- 
With Best Regards,
Andy Shevchenko
