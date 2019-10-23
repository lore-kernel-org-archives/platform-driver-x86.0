From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH resend] Add touchscreen platform data for the Schneider
 SCT101CTM tablet
Date: Wed, 23 Oct 2019 22:08:10 +0300
Message-ID: <CAHp75VfhKzXfJEwHLdkwJHPXmL6bCRMtvo-0aCSQxdiHQyXHHQ@mail.gmail.com>
References: <20191023185323.13552-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023185323.13552-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Gorbea Ainz <danielgorbea@hotmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 23, 2019 at 9:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> From: Daniel Gorbea Ainz <danielgorbea@hotmail.com>
>
> Add touchscreen platform data for the Schneider SCT101CTM tablet

Thanks, now patchwork sees it.

> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>

> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm not sure you need to put Rb when you have your SoB.
Do you think it's fine if I remove Rb when applying?

> ---
> hdegoede: Resend from my email address as vger.kernel.org does not like
> Daniel's emails
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 8bfef880e216..ba494ace83d4 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -549,6 +549,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p1006w_v10_data = {
>         .properties     = pov_mobii_wintab_p1006w_v10_props,
>  };
>
> +static const struct property_entry schneider_sct101ctm_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name",
> +                             "gsl1680-schneider-sct101ctm.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data schneider_sct101ctm_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = schneider_sct101ctm_props,
> +};
> +
>  static const struct property_entry teclast_x3_plus_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -968,6 +986,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>                 },
>         },
> +       {
> +               /* Schneider SCT101CTM */
> +               .driver_data = (void *)&schneider_sct101ctm_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
> +               },
> +       },
>         {
>                 /* Teclast X3 Plus */
>                 .driver_data = (void *)&teclast_x3_plus_data,
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
