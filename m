From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: Add IdeaPad V310-14ISK
 to no_hw_rfkill
Date: Thu, 6 Jul 2017 14:48:53 +0300
Message-ID: <CAHp75VcGQ9ULH_6y1nwi=MdP3Z4GjPv+7e1U02SrnbMvEb06DQ@mail.gmail.com>
References: <1499332949-8732-1-git-send-email-bin.li@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:32892 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751994AbdGFLsz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jul 2017 07:48:55 -0400
Received: by mail-qk0-f194.google.com with SMTP id p21so2099031qke.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Jul 2017 04:48:55 -0700 (PDT)
In-Reply-To: <1499332949-8732-1-git-send-email-bin.li@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bin Li <bin.li@canonical.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, libin.charles@gmail.com

On Thu, Jul 6, 2017 at 12:22 PM, Bin Li <bin.li@canonical.com> wrote:
> Like other Lenovo models the IdeaPad V310-14ISK does not have an hw
> rfkill switch. This results in hard-blocked radios after boot, resulting
> in always blocked radios rendering them unusable.
>
> Add the IdeaPad V310-14ISK to the no_hw_rfkill DMI list and allows using
> the built-in radios.

Pushed to testing, thanks!

>
> Signed-off-by: Bin Li <bin.li@canonical.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 24ca9fb..8336af4 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -869,6 +869,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo V310-14ISK",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14ISK"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo V310-15ISK",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
