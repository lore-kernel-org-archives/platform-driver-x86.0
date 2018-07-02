From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the "Connect
 Tablet 9" tablet
Date: Mon, 2 Jul 2018 15:24:19 +0300
Message-ID: <CAHp75VeTumJKZA5P6U9pU8m11WSUc5PMxDzmntxuzyRapc6zTQ@mail.gmail.com>
References: <20180701093256.7043-1-hdegoede@redhat.com> <20180701093256.7043-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180701093256.7043-2-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jul 1, 2018 at 12:32 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Add touchscreen info for the "Connect Tablet 9" tablet. This appears to be
> a variant of the same hardware as the ITworks TW891 tablet, but it needs
> different firmware for the touchscreen to fonction properly.
>

Pushed to my review and testing queue, thanks!

P.S. Renaming now in our for-next branch.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 8578f9e28ee0..8086e01e069e 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -119,6 +119,23 @@ static const struct ts_dmi_data chuwi_vi10_data = {
>         .properties     = chuwi_vi10_props,
>  };
>
> +static const struct property_entry connect_tablet9_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
> +       PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1664),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 878),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-connect-tablet9.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       { }
> +};
> +
> +static const struct ts_dmi_data connect_tablet9_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = connect_tablet9_props,
> +};
> +
>  static const struct property_entry cube_iwork8_air_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 1660),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 900),
> @@ -470,6 +487,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "S165"),
>                 },
>         },
> +       {
> +               /* Connect Tablet 9 */
> +               .driver_data = (void *)&connect_tablet9_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Connect"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Tablet 9"),
> +               },
> +       },
>         {
>                 /* CUBE iwork8 Air */
>                 .driver_data = (void *)&cube_iwork8_air_data,
> --
> 2.17.1
>



-- 
With Best Regards,
Andy Shevchenko
