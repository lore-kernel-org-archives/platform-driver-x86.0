From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Primebook C11B 2-in-1
Date: Sat, 7 Sep 2019 19:59:22 +0300
Message-ID: <CAHp75VehBvaPHSQS3wMWKEXWDC_e3a_7w0V6YJkmyrSE5Pa=RQ@mail.gmail.com>
References: <20190818110451.20571-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190818110451.20571-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Hiller <thomas.hiller@gmx.de>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Aug 18, 2019 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add touchscreen info for the Trekstor Primebook C11B 2-in-1, note the C11B
> used the same touchscreen as the regular C11, so we only add a new DMI
> match.
>

Pushed to my review and testing queue, thanks!

> Cc: Thomas Hiller <thomas.hiller@gmx.de>
> Reported-and-tested-by: Thomas Hiller <thomas.hiller@gmx.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 20a943f519dd..8255273b6972 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -981,6 +981,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Primebook C11"),
>                 },
>         },
> +       {
> +               /* Trekstor Primebook C11B (same touchscreen as the C11) */
> +               .driver_data = (void *)&trekstor_primebook_c11_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "PRIMEBOOK C11B"),
> +               },
> +       },
>         {
>                 /* Trekstor Primebook C13 */
>                 .driver_data = (void *)&trekstor_primebook_c13_data,
> --
> 2.23.0.rc2
>


-- 
With Best Regards,
Andy Shevchenko
