From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Mediacom
 Flexbook Edge 11
Date: Tue, 11 Dec 2018 12:15:01 +0200
Message-ID: <CAHp75VfHQSih1Jr-yj29MZ7s-ZoOtZ66G_eKs2d43NVM9QuF3w@mail.gmail.com>
References: <20181204092004.5033-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204092004.5033-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 4, 2018 at 11:20 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add a DMI match for the Mediacom Flexbook Edge 11, this is the same hw
> as the Trekstor Primebook C11, so we use the same settings.
>

Pushed, thanks!

> Reported-by: rmbg <alexofrichardmilitiabg@hotmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 0faf3fd895e3..ac20797af9b1 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -686,6 +686,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_BIOS_VERSION, "jumperx.T87.KFBNEEA"),
>                 },
>         },
> +       {
> +               /* Mediacom Flexbook Edge 11 (same hw as TS Primebook C11) */
> +               .driver_data = (void *)&trekstor_primebook_c11_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "MEDIACOM"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "FlexBook edge11 - M-FBE11"),
> +               },
> +       },
>         {
>                 /* Onda oBook 20 Plus */
>                 .driver_data = (void *)&onda_obook_20_plus_data,
> --
> 2.19.2
>


-- 
With Best Regards,
Andy Shevchenko
