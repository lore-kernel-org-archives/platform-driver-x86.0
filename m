From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add entry for the Trekstor
 Primebook C13
Date: Thu, 28 Dec 2017 11:10:32 +0200
Message-ID: <CAHp75VcrX74-5OYFrTyOp2OW5=28nWE4+OZKCfw0abWrvXLvVg@mail.gmail.com>
References: <20171225124525.7536-1-hdegoede@redhat.com> <20171225124525.7536-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:44693 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdL1JKe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Dec 2017 04:10:34 -0500
In-Reply-To: <20171225124525.7536-2-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Dec 25, 2017 at 2:45 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Add touchscreen platform data for the Trekstor Primebook C13 laptop.
>

Pushed to my review and testing queue, thanks!

Note, the rest now on it's way to for-next (via testing)

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/silead_dmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
> index 09b589fb79d4..713446ee3b61 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -232,6 +232,21 @@ static const struct silead_ts_dmi_data chuwi_vi8_data = {
>         .properties     = chuwi_vi8_props,
>  };
>
> +static const struct property_entry trekstor_primebook_c13_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 2624),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
> +       PROPERTY_ENTRY_STRING("firmware-name",
> +                             "gsl1680-trekstor-primebook-c13.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct silead_ts_dmi_data trekstor_primebook_c13_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = trekstor_primebook_c13_props,
> +};
> +
>  static const struct dmi_system_id silead_ts_dmi_table[] = {
>         {
>                 /* CUBE iwork8 Air */
> @@ -365,6 +380,14 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
>                         DMI_MATCH(DMI_BIOS_VERSION, "CHUWI.D86JLBNR"),
>                 },
>         },
> +       {
> +               /* Trekstor Primebook C13 */
> +               .driver_data = (void *)&trekstor_primebook_c13_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Primebook C13"),
> +               },
> +       },
>         { },
>  };
>
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko
