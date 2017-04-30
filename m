From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Sun, 30 Apr 2017 15:50:40 +0300
Message-ID: <CAHp75Vch7-Mjs_70TL7-MjkZuiL=yD9p6PBZi_En0qq7Cns_nQ@mail.gmail.com>
References: <CAHp75Ve4Xh=JO3xqm1CtYuQJwU4V_fM95CRw3vknnJyK=CM+LQ@mail.gmail.com>
 <20170428141949.3459-1-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:36760 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755336AbdD3Mum (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2017 08:50:42 -0400
Received: by mail-qt0-f195.google.com with SMTP id t52so13872086qtb.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Apr 2017 05:50:42 -0700 (PDT)
In-Reply-To: <20170428141949.3459-1-linux@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Apr 28, 2017 at 5:19 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> some laptops, for example ASUS UX330UAK, have brocken als_get function
> but working als_set funktion. In this case, ALS will stay turned off.
>
>              Method (WMNB, 3, Serialized)
>             {
>             ...
>                If (Local0 == 0x53545344)
>                 {
>                 ...
>                     If (IIA0 == 0x00050001)
>                     {
>                         If (!ALSP)
>                         {
>                             Return (0x02)
>                         }
>
>                         Local0 = (GALS & 0x10)    <<<---- bug,
>                                                     should be: (GALS () & 0x10)
>                         If (Local0)
>                         {
>                             Return (0x00050001)
>                         }
>                         Else
>                         {
>                             Return (0x00050000)
>                         }
>                     }
>
>              .....
>                 If (Local0 == 0x53564544)
>                 {
>                 ...
>                     If (IIA0 == 0x00050001)
>                     {
>                         Return (ALSC (IIA1))
>                     }
>
>                   ......
>                     Method (GALS, 0, NotSerialized)
>                     {
>                         Local0 = Zero
>                         Local0 |= 0x20
>                         If (ALAE)
>                         {
>                             Local0 |= 0x10
>                         }
>
>                         Local1 = 0x0A
>                         Local1 <<= 0x08
>                         Local0 |= Local1
>                         Return (Local0)
>                     }
>
> Since it works without problems on Windows I assume ASUS WMI driver for Win
> never trying to get ALS state, and instead it is setting it by default to ON.
>
> This patch will do the same. Turn ALS on by default.
>
> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>

Pushed to testing, thanks.

> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    | 12 ++++++++++++
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 26 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index dea98ffb6f60..e030a8d470a4 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -111,6 +111,10 @@ static struct quirk_entry quirk_asus_x550lb = {
>         .xusb2pr = 0x01D9,
>  };
>
> +static struct quirk_entry quirk_asus_ux330uak = {
> +       .wmi_force_als_set = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>         pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -369,6 +373,15 @@ static const struct dmi_system_id asus_quirks[] = {
>         },
>         {
>                 .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. UX330UAK",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "UX330UAK"),
> +               },
> +               .driver_data = &quirk_asus_ux330uak,
> +       },
> +       {
> +               .callback = dmi_matched,
>                 .ident = "ASUSTeK COMPUTER INC. X550LB",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8fe5890bf539..9d3dac30cb08 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1109,6 +1109,15 @@ static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
>  }
>
>  /*
> + * Some devices dont support or have borcken get_als method
> + * but still support set method.
> + */
> +static void asus_wmi_set_als(void)
> +{
> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_ALS_ENABLE, 1, NULL);
> +}
> +
> +/*
>   * Hwmon device
>   */
>  static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
> @@ -2117,6 +2126,9 @@ static int asus_wmi_add(struct platform_device *pdev)
>                         goto fail_rfkill;
>         }
>
> +       if (asus->driver->quirks->wmi_force_als_set)
> +               asus_wmi_set_als();
> +
>         /* Some Asus desktop boards export an acpi-video backlight interface,
>            stop this from showing up */
>         chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index c9589d9342bb..6c1311f4b04d 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -44,6 +44,7 @@ struct quirk_entry {
>         bool store_backlight_power;
>         bool wmi_backlight_power;
>         bool wmi_backlight_native;
> +       bool wmi_force_als_set;
>         int wapf;
>         /*
>          * For machines with AMD graphic chips, it will send out WMI event
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
