From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Primebook C11 convertible
Date: Fri, 19 Oct 2018 14:56:47 +0300
Message-ID: <CAHp75VepsK+3o5qH9i8x=uvCABt-QOuBq2WNiqGAQYVSFOqTyA@mail.gmail.com>
References: <20181004123445.17497-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004123445.17497-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ahormann@gmx.net
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 4, 2018 at 3:35 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add touchscreen info for the Trekstor Primebook C11 convertible.
>

Applied, thanks!

> Cc: Alicia Hormann <ahormann@gmx.net>
> Suggested-by: Alicia Hormann <ahormann@gmx.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index f30337d68007..4e6fdc1fbfdf 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -421,6 +421,22 @@ static const struct ts_dmi_data teclast_x98plus2_data = {
>         .properties     = teclast_x98plus2_props,
>  };
>
> +static const struct property_entry trekstor_primebook_c11_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1970),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1530),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name",
> +                             "gsl1680-trekstor-primebook-c11.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data trekstor_primebook_c11_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = trekstor_primebook_c11_props,
> +};
> +
>  static const struct property_entry trekstor_primebook_c13_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 2624),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
> @@ -706,6 +722,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "X98 Plus II"),
>                 },
>         },
> +       {
> +               /* Trekstor Primebook C11 */
> +               .driver_data = (void *)&trekstor_primebook_c11_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Primebook C11"),
> +               },
> +       },
>         {
>                 /* Trekstor Primebook C13 */
>                 .driver_data = (void *)&trekstor_primebook_c13_data,
> --
> 2.19.0
>


-- 
With Best Regards,
Andy Shevchenko
