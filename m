From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Y720-15IKBN to no_hw_rfkill
Date: Sun, 18 Jun 2017 15:48:21 +0300
Message-ID: <CAHp75VfM7+Bij6nCi6adHZ8gqvk5VdVyOgkNZi6COjKZWaWzsA@mail.gmail.com>
References: <20170618123758.4660-1-olle@liljenzin.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:34889 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752102AbdFRMsW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Jun 2017 08:48:22 -0400
Received: by mail-qt0-f193.google.com with SMTP id x58so16576914qtc.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2017 05:48:22 -0700 (PDT)
In-Reply-To: <20170618123758.4660-1-olle@liljenzin.se>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Olle Liljenzin <olle@liljenzin.se>
Cc: Ike Panhc <ike.pan@canonical.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Sun, Jun 18, 2017 at 3:37 PM, Olle Liljenzin <olle@liljenzin.se> wrote:
> Lenovo Legion Y720-15IKBN is yet another Lenovo model that does not
> have an hw rfkill switch, resulting in wifi always reported as hard
> blocked.
>
> Add the model to the list of models without rfkill switch.
>

Both patches pushed to testing, thanks.

> Signed-off-by: Olle Liljenzin <olle@liljenzin.se>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 4bd575d..0decfd4 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -918,6 +918,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo Legion Y720-15IKBN",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y720-15IKBN"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo Yoga 2 11 / 13 / Pro",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.9.4
>



-- 
With Best Regards,
Andy Shevchenko
