From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-laptop: fix broken kbd backlight on
 Inspiron 10xx
Date: Wed, 25 Sep 2019 18:06:40 +0300
Message-ID: <CAHp75VfkL3QGXYjeEEqr75SWCKo1SDEqS9q3YEQWYM4iXbUzcg@mail.gmail.com>
References: <20190925082149.yjhmmb64i4h6sddi@pali> <156940489220.8635.14349142383780268583@WARFSTATION>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <156940489220.8635.14349142383780268583@WARFSTATION>
Sender: linux-kernel-owner@vger.kernel.org
To: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 25, 2019 at 12:48 PM Pacien TRAN-GIRARD
<pacien.trangirard@pacien.net> wrote:
>
> This patch adds a quirk disabling keyboard backlight support for the
> Dell Inspiron 1012 and 1018.
>
> Those models wrongly report supporting keyboard backlight control
> features (through SMBIOS tokens) even though they're not equipped with
> a backlit keyboard. This led to broken controls being exposed
> through sysfs by this driver which froze the system when used.
>

Pali, are you okay with this one?

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=107651
> Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
> ---
>  drivers/platform/x86/dell-laptop.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index d27be2836bc2..ffe5abbdadda 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -33,6 +33,7 @@
>
>  struct quirk_entry {
>         bool touchpad_led;
> +       bool kbd_broken_backlight;
>         bool kbd_led_levels_off_1;
>         bool kbd_missing_ac_tag;
>
> @@ -73,6 +74,10 @@ static struct quirk_entry quirk_dell_latitude_e6410 = {
>         .kbd_led_levels_off_1 = true,
>  };
>
> +static struct quirk_entry quirk_dell_inspiron_1012 = {
> +       .kbd_broken_backlight = true,
> +};
> +
>  static struct platform_driver platform_driver = {
>         .driver = {
>                 .name = "dell-laptop",
> @@ -310,6 +315,24 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>                 },
>                 .driver_data = &quirk_dell_latitude_e6410,
>         },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "Dell Inspiron 1012",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
> +               },
> +               .driver_data = &quirk_dell_inspiron_1012,
> +       },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "Dell Inspiron 1018",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1018"),
> +               },
> +               .driver_data = &quirk_dell_inspiron_1012,
> +       },
>         { }
>  };
>
> @@ -2040,6 +2063,9 @@ static int __init kbd_led_init(struct device *dev)
>  {
>         int ret;
>
> +       if (quirks && quirks->kbd_broken_backlight)
> +               return -ENODEV;
> +
>         kbd_init();
>         if (!kbd_led_present)
>                 return -ENODEV;
> --
> 2.19.2



-- 
With Best Regards,
Andy Shevchenko
