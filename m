From: Jose Ignacio Naranjo <joseignacio.naranjo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Add hotkeys support for Toshiba Satellite U940
Date: Thu, 5 Dec 2013 07:55:17 +0100
Message-ID: <CAO0y3r5tr2mN5D12kzGnZ-Mr_YSuCc9SG2AP8K0ZKhNAK=dJZw@mail.gmail.com>
References: <1385161342-8262-1-git-send-email-joseignacio.naranjo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:51949 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398Ab3LEGzS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Dec 2013 01:55:18 -0500
Received: by mail-la0-f41.google.com with SMTP id eo20so10396935lab.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2013 22:55:17 -0800 (PST)
In-Reply-To: <1385161342-8262-1-git-send-email-joseignacio.naranjo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

Hello Matthew and list,

I didn't receive any feedback about this patch. Is there any problem?
I had to do it because I was lacking of a few scancodes and I couldn't
remap all the keys using udev

Regards,
JI


On Sat, Nov 23, 2013 at 12:02 AM, Jose Ignacio Naranjo
<joseignacio.naranjo@gmail.com> wrote:
> ---
>  drivers/platform/x86/toshiba_acpi.c | 41 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 0cfadb6..ff711d5 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -54,6 +54,7 @@
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>  #include <linux/i8042.h>
> +#include <linux/dmi.h>
>
>  #include <asm/uaccess.h>
>
> @@ -150,7 +151,7 @@ static const struct acpi_device_id toshiba_device_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, toshiba_device_ids);
>
> -static const struct key_entry toshiba_acpi_keymap[] = {
> +static const struct key_entry toshiba_acpi_default_keymap[] = {
>         { KE_KEY, 0x101, { KEY_MUTE } },
>         { KE_KEY, 0x102, { KEY_ZOOMOUT } },
>         { KE_KEY, 0x103, { KEY_ZOOMIN } },
> @@ -178,6 +179,41 @@ static const struct key_entry toshiba_acpi_keymap[] = {
>         { KE_END, 0 },
>  };
>
> +static const struct key_entry *keymap = toshiba_acpi_default_keymap;
> +
> +static struct key_entry keymap_satellite_u940[] = {
> +       { KE_KEY, 0x13c, { KEY_BRIGHTNESSDOWN } },
> +       { KE_KEY, 0x13d, { KEY_BRIGHTNESSUP } },
> +       { KE_KEY, 0x13e, { KEY_SWITCHVIDEOMODE } },
> +       { KE_KEY, 0x13f, { KEY_TOUCHPAD_TOGGLE } },
> +       { KE_KEY, 0x157, { KEY_MUTE} },
> +       { KE_KEY, 0x158, { KEY_WLAN } },
> +       { KE_KEY, 0x12c, { KEY_KBDILLUMTOGGLE } },
> +       { KE_KEY, 0x102, { KEY_ZOOMOUT } },
> +       { KE_KEY, 0x103, { KEY_ZOOMIN } },
> +       { KE_KEY, 0x139, { KEY_ZOOMRESET } },
> +       { KE_END, 0 }
> +};
> +
> +static int dmi_matched(const struct dmi_system_id *dmi)
> +{
> +       keymap = dmi->driver_data;
> +       return 1;
> +}
> +
> +static const struct dmi_system_id dmi_ids[] = {
> +       {
> +               /* Toshiba Satellite U940 */
> +               .callback = dmi_matched,
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SATELLITE U940"),
> +               },
> +               .driver_data = keymap_satellite_u940
> +       },
> +       { NULL, }
> +};
> +
>  /* utility
>   */
>
> @@ -984,7 +1020,8 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>         dev->hotkey_dev->phys = "toshiba_acpi/input0";
>         dev->hotkey_dev->id.bustype = BUS_HOST;
>
> -       error = sparse_keymap_setup(dev->hotkey_dev, toshiba_acpi_keymap, NULL);
> +       dmi_check_system(dmi_ids);
> +       error = sparse_keymap_setup(dev->hotkey_dev, keymap, NULL);
>         if (error)
>                 goto err_free_dev;
>
> --
> 1.8.3.2
>
