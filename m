From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add several models to no_hw_rfkill
Date: Tue, 4 Jul 2017 13:30:14 +0300
Message-ID: <CAHp75Vf9gwbf4CNMv3C942=4yQkus2ZzMeBnDYW=6f7Z3XwbGg@mail.gmail.com>
References: <17d47016-4b33-984b-7134-0ab1b237f30c@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <17d47016-4b33-984b-7134-0ab1b237f30c@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yang Jiaxun <yjx@flygoat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jul 4, 2017 at 8:26 AM, Yang Jiaxun <yjx@flygoat.com> wrote:
> From 8db74a4eef334f614bf727232e5b88f67f824862 Mon Sep 17 00:00:00 2001
> From: Yang Jiaxun <yjx@flygoat.com>
> Date: Tue, 4 Jul 2017 11:28:41 +0800
> Subject: [PATCH] ideapad-laptop: Add several models to no_hw_rfkill
>
> Some Lenovo ideapad models do not have hardware rfkill switches, but trying
> to read the rfkill switches through the ideapad-laptop module. It caused to
> always reported blocking breaking wifi.
>
> Fix it by adding those models to no_hw_rfkill list.

Thanks for the patch, though...

Please, fix your email client that our patchwork can track.

Moreover, fix the indentation in the way it's already done in the
driver (your patch should not have "-" (minus) lines AFAIU).

>
> Signed-off-by: Yang Jiaxun <yjx@flygoat.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 78
> +++++++++++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c
> b/drivers/platform/x86/ideapad-laptop.c
> index 527e5d9..3ebc5c7 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -909,17 +909,87 @@ static const struct dmi_system_id no_hw_rfkill_list[]
> = {
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
> -                DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -                DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-15ISK"),
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-15ISK"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad 300-15IBR",
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
>          },
>      },
>      {
>          .ident = "Lenovo ideapad 310-15IKB",
>          .matches = {
> -                DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -                DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IKB"),
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IKB"),
> +        },
> +    },
> +    {
> +        .ident = "Lenovo ideapad Y700-14ISK",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +            DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-14ISK"),
>          },
>      },
>      {
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
