From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add IdeaPad V510-15IKB to no_hw_rfkill
Date: Mon, 3 Jul 2017 14:54:02 +0300
Message-ID: <CAHp75Vej1MgBYyxPwZ8rDJUHKVzDeSa77vJWjJG+8-JPmjodiQ@mail.gmail.com>
References: <20170701062018.6493-1-sven@narfation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35445 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753736AbdGCLyO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jul 2017 07:54:14 -0400
Received: by mail-qt0-f194.google.com with SMTP id w12so23075197qta.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jul 2017 04:54:13 -0700 (PDT)
In-Reply-To: <20170701062018.6493-1-sven@narfation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Sat, Jul 1, 2017 at 9:20 AM, Sven Eckelmann <sven@narfation.org> wrote:
> Like other Lenovo models the IdeaPad V510-15IKB does not have an hw
> rfkill switch. This results in hard-blocked radios after boot, resulting
> in always blocked radios rendering them unusable.
>
> Add the IdeaPad V510-15IKB to the no_hw_rfkill DMI list and allows using
> the built-in radios.
>

Pushed for testing, thanks!

> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> ---
> Commit message "borrowed" from
> ccc7179f4d94 ("platform/x86: ideapad-laptop: Add IdeaPad V310-15ISK to no_hw_rfkill")
>
>
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 527e5d9ab9bf..f23e4ad7c564 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -916,6 +916,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo V510-15IKB",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V510-15IKB"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo ideapad 310-15IKB",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
