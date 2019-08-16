From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Irbis
 TW90 tablet
Date: Fri, 16 Aug 2019 12:59:38 +0300
Message-ID: <CAHp75VcmBdO8Wr95-p7xOfdhG4KwfSyCwQOUQnrThLhw_h7Yjw@mail.gmail.com>
References: <20190804134023.3495-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190804134023.3495-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "russianneuromancer @ ya . ru" <russianneuromancer@ya.ru>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Aug 4, 2019 at 4:40 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add touchscreen info for the Irbis TW90 tablet.
>

Pushed to my review and testing queue, thanks!

> Reported-by: russianneuromancer@ya.ru
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 83dd6df674e8..20a943f519dd 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -273,6 +273,24 @@ static const struct ts_dmi_data gp_electronic_t701_data = {
>         .properties     = gp_electronic_t701_props,
>  };
>
> +static const struct property_entry irbis_tw90_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1720),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1138),
> +       PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
> +       PROPERTY_ENTRY_U32("touchscreen-min-y", 14),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-irbis_tw90.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data irbis_tw90_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = irbis_tw90_props,
> +};
> +
>  static const struct property_entry itworks_tw891_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
>         PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
> @@ -780,6 +798,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_BIOS_VERSION, "itWORKS.G.WI71C.JGBMRB"),
>                 },
>         },
> +       {
> +               /* Irbis TW90 */
> +               .driver_data = (void *)&irbis_tw90_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "IRBIS"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "TW90"),
> +               },
> +       },
>         {
>                 /* I.T.Works TW891 */
>                 .driver_data = (void *)&itworks_tw891_data,
> --
> 2.22.0
>


-- 
With Best Regards,
Andy Shevchenko
