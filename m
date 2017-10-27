From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add entry for the Digma e200 tablet
Date: Fri, 27 Oct 2017 19:45:24 +0300
Message-ID: <CAHp75VeP-WFkLOGyw4n4OSFFetndLCz67onuTu96C9dF5qSdiA@mail.gmail.com>
References: <20171027102707.8313-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171027102707.8313-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sergey Tshovrebov <sinxwal@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Oct 27, 2017 at 1:27 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> From: Sergey Tshovrebov <sinxwal@gmail.com>
>
> Add touchscreen platform data for the Digma e200 tablet.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Sergey Tshovrebov <sinxwal@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/silead_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
> index ac304f2318cc..266535c2a72f 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -155,6 +155,22 @@ static const struct silead_ts_dmi_data chuwi_hi8_pro_data = {
>         .properties     = chuwi_hi8_pro_props,
>  };
>
> +static const struct property_entry digma_citi_e200_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name",
> +                             "gsl1686-digma_citi_e200.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct silead_ts_dmi_data digma_citi_e200_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = digma_citi_e200_props,
> +};
> +
>  static const struct dmi_system_id silead_ts_dmi_table[] = {
>         {
>                 /* CUBE iwork8 Air */
> @@ -246,6 +262,15 @@ static const struct dmi_system_id silead_ts_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "X1D3_C806N"),
>                 },
>         },
> +       {
> +               /* Digma Citi E200 */
> +               .driver_data = (void *)&digma_citi_e200_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Digma"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "CITI E200"),
> +                       DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> +               },
> +       },
>         { },
>  };
>
> --
> 2.14.2
>



-- 
With Best Regards,
Andy Shevchenko
