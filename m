From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the MP-man
 MPWIN895CL tablet
Date: Fri, 17 Apr 2020 16:30:00 +0300
Message-ID: <CAHp75VcO=cePNRmJGmvGPcD=CBD9kkXJyKqK7yMKNYrpKWSwuw@mail.gmail.com>
References: <20200401080348.5128-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200401080348.5128-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 1, 2020 at 11:03 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add touchscreen info for the MP-man MPWIN895CL tablet.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 6ec8923dec1a..931814e62454 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -373,6 +373,23 @@ static const struct ts_dmi_data jumper_ezpad_mini3_data = {
>         .properties     = jumper_ezpad_mini3_props,
>  };
>
> +static const struct property_entry mpman_mpwin895cl_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-min-x", 3),
> +       PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-mpman-mpwin895cl.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data mpman_mpwin895cl_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = mpman_mpwin895cl_props,
> +};
> +
>  static const struct property_entry myria_my8307_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 1720),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -908,6 +925,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "FlexBook edge11 - M-FBE11"),
>                 },
>         },
> +       {
> +               /* MP Man MPWIN895CL */
> +               .driver_data = (void *)&mpman_mpwin895cl_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "MPMAN"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "MPWIN8900CL"),
> +               },
> +       },
>         {
>                 /* Myria MY8307 */
>                 .driver_data = (void *)&myria_my8307_data,
> --
> 2.26.0
>


-- 
With Best Regards,
Andy Shevchenko
