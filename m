From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] ideapad-laptop: Add several models to no_hw_rfkill
Date: Tue, 4 Jul 2017 18:29:16 +0300
Message-ID: <CAHp75VeX6uvLT_W3apGi07KSigezuxPozKq7RQvkNQdiE_8tsg@mail.gmail.com>
References: <20170704143919.2942-1-yjx@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33918 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752214AbdGDP3S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jul 2017 11:29:18 -0400
In-Reply-To: <20170704143919.2942-1-yjx@flygoat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Yang Jiaxun <yjx@flygoat.com>
Cc: Ike Panhc <ike.pan@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 4, 2017 at 5:39 PM,  <yjx@flygoat.com> wrote:
> From: Yang Jiaxun <yjx@flygoat.com>
>
> Some Lenovo ideapad models do not have hardware rfkill switches, but
> trying to read the rfkill switches through the ideapad-laptop module.
> It caused to always reported blocking breaking wifi.
>
> Fix it by adding those models to no_hw_rfkill_list.
>

Thanks, pushed to testing.

P.S. Patchwork still didn't catch it, I suspect it might have checked
DNSSEC which your domain has wrongly configured.
And never use Thunderbird for sending patches -- it's an awful email client.

> Signed-off-by: Yang Jiaxun <yjx@flygoat.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 70 +++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 24ca9fbe31cc..5f4515b88a18 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -869,6 +869,27 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo V310-14IKB",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14IKB"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo V310-14ISK",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14ISK"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo V310-15IKB",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-15IKB"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo V310-15ISK",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> @@ -876,6 +897,48 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo ideapad 300-15IBR",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300-15IBR"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo ideapad 300-15IKB",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300-15IKB"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo ideapad 300S-11IBR",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 300S-11BR"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo ideapad 310-15ABR",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ABR"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo ideapad 310-15IAP",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IAP"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo ideapad 310-15ISK",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ISK"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo ideapad 310-15IKB",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> @@ -883,6 +946,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo ideapad Y700-14ISK",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-14ISK"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo ideapad Y700-15ACZ",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.13.2
>



-- 
With Best Regards,
Andy Shevchenko
