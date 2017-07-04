From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] ideapad-laptop: Add several models to no_hw_rfkill
Date: Tue, 4 Jul 2017 17:21:45 +0300
Message-ID: <CAHp75VeehPzhDJ81PGB1Y-DFu5fT+jLmMXmdgKh3et=KF1YZdg@mail.gmail.com>
References: <5829bc60-f22f-f298-006e-0711763b0e1f@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:32917 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752159AbdGDOVr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jul 2017 10:21:47 -0400
In-Reply-To: <5829bc60-f22f-f298-006e-0711763b0e1f@flygoat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Yang Jiaxun <yjx@flygoat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 4, 2017 at 5:06 PM, Yang Jiaxun <yjx@flygoat.com> wrote:
> From daaa74f5b5f8ecfad4d452af787276f8c43f79b9 Mon Sep 17 00:00:00 2001
> From: Yang Jiaxun <yjx@flygoat.com>
> Date: Tue, 4 Jul 2017 13:49:41 +0000
> Subject: [PATCH v2] ideapad-laptop: Add several models to no_hw_rfkill

Something is still wrong with the method how you send patches. The
above should be absent in usual case.

I would recommend to use git send-email tool.

If it sounds a big deal I would apply it manually.

>
> Some Lenovo ideapad models do not have hardware rfkill switches, but
> trying to read the rfkill switches through the ideapad-laptop module.
> It caused to always reported blocking breaking wifi.
>
> Fix it by adding those models to no_hw_rfkill_list.
>
> Signed-off-by: Yang Jiaxun <yjx@flygoat.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 70
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c
> b/drivers/platform/x86/ideapad-laptop.c
> index 24ca9fbe31cc..5f4515b88a18 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -869,6 +869,27 @@ static const struct dmi_system_id no_hw_rfkill_list[] =
> {
>
>          },
>      },
>      {
> +        .ident = "Lenovo V310-14IKB",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14IKB"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo V310-14ISK",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14ISK"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo V310-15IKB",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-15IKB"),
> +        },
> +    },
> +    {
>          .ident = "Lenovo V310-15ISK",
>          .matches = {
>                  DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> @@ -876,6 +897,48 @@ static const struct dmi_system_id no_hw_rfkill_list[] =
> {
>          },
>      },
>      {
> +        .ident = "Lenovo ideapad 300-15IBR",
>
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300-15IBR"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad 300-15IKB",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300-15IKB"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad 300S-11IBR",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300S-11BR"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad 310-15ABR",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ABR"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad 310-15IAP",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IAP"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad 310-15ISK",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ISK"),
> +        },
> +    },
> +    {
>          .ident = "Lenovo ideapad 310-15IKB",
>          .matches = {
>                  DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> @@ -883,6 +946,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] =
> {
>          },
>      },
>      {
> +        .ident = "Lenovo ideapad Y700-14ISK",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-14ISK"),
> +        },
> +    },
> +    {
>          .ident = "Lenovo ideapad Y700-15ACZ",
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.13.2
>



-- 
With Best Regards,
Andy Shevchenko
