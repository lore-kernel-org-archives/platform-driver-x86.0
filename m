From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo ideapad 310-15IKB to
 no_hw_rfkill dmi list
Date: Wed, 8 Mar 2017 15:48:19 +0200
Message-ID: <CAHp75VdTjH89Ra2bipL5GaojUv5O9aaOw3wkBtMKoHeYeWFOeg@mail.gmail.com>
References: <20170221195348.GA4998@Hugin.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:36707 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753234AbdCHNuu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2017 08:50:50 -0500
In-Reply-To: <20170221195348.GA4998@Hugin.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sven Rebhan <sven.rebhan@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 21, 2017 at 9:53 PM, Sven Rebhan <sven.rebhan@gmail.com> wrote:
> Like other Lenovo models the Lenovo ideapad 310-15IKB does not have a
> hw rfkill switch. This results in hard-blocked radios after boot,
> resulting in always blocked radios rendering them unusable.
>
> The attached patch adds the ideapad 310-15IKB to the no_hw_rfkill
> dmi list and allows using the built-in radios.

Thanks.
Pushed to testing with massaged commit message.

>
> Signed-off-by: Sven Rebhan <Sven.Rebhan@googlemail.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index f46ece2ce3c4..cc6d91e18683 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -872,6 +872,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenovo ideapad 310-15IKB",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15IKB"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo ideapad Y700-15ACZ",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.11.1
>



-- 
With Best Regards,
Andy Shevchenko
