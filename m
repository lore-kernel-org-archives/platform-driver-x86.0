From: David Herrmann <dh.herrmann@googlemail.com>
Subject: Re: [PATCH 03/15] samsung-laptop: don't handle backlight if handled
 by acpi/video
Date: Wed, 23 Nov 2011 17:01:26 +0100
Message-ID: <CANq1E4QoBk1oPT8z2-2hHeXkKa8K34hhwZrMqXOknmtEY1ghBw@mail.gmail.com>
References: <1321999366-23784-1-git-send-email-corentincj@iksaif.net>
	<1321999366-23784-4-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:39829 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab1KWQB2 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Nov 2011 11:01:28 -0500
In-Reply-To: <1321999366-23784-4-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org

Hi Corentin

On Tue, Nov 22, 2011 at 11:02 PM, Corentin Chary <corentincj@iksaif.net=
> wrote:
> samsung-laptop is not at all related to ACPI, but since this interfac=
e
> is not documented at all, and the driver has to use it at load to
> understand how it works on the laptop, I think it's a good idea to
> disable it if a better solution is available.
>
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
> =A0drivers/platform/x86/samsung-laptop.c | =A0 20 ++++++++++++++++++-=
-
> =A01 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index be96910..49933d2 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -21,6 +21,7 @@
> =A0#include <linux/dmi.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/rfkill.h>
> +#include <linux/acpi.h>
>
> =A0/*
> =A0* This driver is needed because a number of Samsung laptops do not=
 hook
> @@ -230,6 +231,7 @@ struct samsung_laptop {
> =A0 =A0 =A0 =A0struct backlight_device *backlight_device;
> =A0 =A0 =A0 =A0struct rfkill *rfk;
>
> + =A0 =A0 =A0 bool handle_backlight;
> =A0 =A0 =A0 =A0bool has_stepping_quirk;
> =A0};
>
> @@ -616,6 +618,9 @@ static int __init samsung_backlight_init(struct s=
amsung_laptop *samsung)
> =A0 =A0 =A0 =A0struct backlight_device *bd;
> =A0 =A0 =A0 =A0struct backlight_properties props;
>
> + =A0 =A0 =A0 if (!samsung->handle_backlight)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> =A0 =A0 =A0 =A0memset(&props, 0, sizeof(struct backlight_properties))=
;
> =A0 =A0 =A0 =A0props.type =3D BACKLIGHT_PLATFORM;
> =A0 =A0 =A0 =A0props.max_brightness =3D samsung->config->max_brightne=
ss -
> @@ -698,7 +703,8 @@ static void __init samsung_sabi_selftest(struct s=
amsung_laptop *samsung,
> =A0 =A0 =A0 =A0printk(KERN_DEBUG "ifaceP =3D 0x%08x\n", ifaceP);
> =A0 =A0 =A0 =A0printk(KERN_DEBUG "sabi_iface =3D %p\n", samsung->sabi=
_iface);
>
> - =A0 =A0 =A0 test_backlight(samsung);
> + =A0 =A0 =A0 if (samsung->handle_backlight)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 test_backlight(samsung);
> =A0 =A0 =A0 =A0test_wireless(samsung);
>
> =A0 =A0 =A0 =A0sabi_get_command(samsung, config->commands.get_brightn=
ess, &sretval);
> @@ -771,7 +777,8 @@ static int __init samsung_sabi_init(struct samsun=
g_laptop *samsung)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Check for stepping quirk */
> - =A0 =A0 =A0 check_for_stepping_quirk(samsung);
> + =A0 =A0 =A0 if (samsung->handle_backlight)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_for_stepping_quirk(samsung);
>
> =A0exit:
> =A0 =A0 =A0 =A0if (ret)
> @@ -1059,6 +1066,15 @@ static int __init samsung_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>
> =A0 =A0 =A0 =A0mutex_init(&samsung->sabi_mutex);
> + =A0 =A0 =A0 samsung->handle_backlight =3D true;
> +
> +#ifdef CONFIG_ACPI
> + =A0 =A0 =A0 /* Don't handle backlight here if the acpi video alread=
y handle it */
> + =A0 =A0 =A0 if (acpi_video_backlight_support()) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("Backlight controlled by ACPI v=
ideo driver\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 samsung->handle_backlight =3D false;
> + =A0 =A0 =A0 }
> +#endif
>
> =A0 =A0 =A0 =A0ret =3D samsung_platform_init(samsung);
> =A0 =A0 =A0 =A0if (ret)
> --
> 1.7.5.4

My Samsung model has an intel card which previously did not support
the acpi video backlight so I needed the samsung driver.
However, with this patch I couldn't find the samsung backlight and so
I tried the intel back light again and now it works.
So:
Tested-by: David Herrmann <dh.herrmann@googlemail.com>

My model is Samsung N210 btw.

Regards
David
