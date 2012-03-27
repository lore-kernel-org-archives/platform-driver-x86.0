From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] samsung-laptop: unregister ACPI video module for some
 well known laptops
Date: Tue, 27 Mar 2012 11:11:18 +0200
Message-ID: <CAHR064hc4AdFUeoO8Szg0FG6CwLK+xauGn9VMJntWV1Gik=ACQ@mail.gmail.com>
References: <20120320163002.GB6811@srcf.ucam.org>
	<1332421699-5315-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:37315 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757926Ab2C0JLT convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Mar 2012 05:11:19 -0400
In-Reply-To: <1332421699-5315-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 22, 2012 at 2:08 PM, Corentin Chary <corentincj@iksaif.net>=
 wrote:
> On these laptops, the ACPI video is not functional, and very unlikely
> to be fixed by the vendor. Note that intel_backlight works for some
> of these laptops, and the backlight from samsung-laptop always work.
>
> The good news is that newer laptops have functional ACPI video device
> and won't end up growing this list.
>
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> ---
> =C2=A0drivers/platform/x86/samsung-laptop.c | =C2=A0 80 +++++++++++++=
++++++++++++++++++--
> =C2=A01 files changed, 76 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index 4787afd..e2a34b4 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -26,6 +26,9 @@
> =C2=A0#include <linux/seq_file.h>
> =C2=A0#include <linux/debugfs.h>
> =C2=A0#include <linux/ctype.h>
> +#if (defined CONFIG_ACPI_VIDEO || defined CONFIG_ACPI_VIDEO_MODULE)
> +#include <acpi/video.h>
> +#endif
>
> =C2=A0/*
> =C2=A0* This driver is needed because a number of Samsung laptops do =
not hook
> @@ -336,6 +339,7 @@ struct samsung_laptop {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct work_struct kbd_led_work;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct samsung_laptop_debug debug;
> + =C2=A0 =C2=A0 =C2=A0 struct samsung_quirks *quirks;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool handle_backlight;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_stepping_quirk;
> @@ -343,7 +347,15 @@ struct samsung_laptop {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0char sdiag[64];
> =C2=A0};
>
> +struct samsung_quirks {
> + =C2=A0 =C2=A0 =C2=A0 bool broken_acpi_video;
> +};
> +
> +static struct samsung_quirks samsung_unknown =3D {};
>
> +static struct samsung_quirks samsung_broken_acpi_video =3D {
> + =C2=A0 =C2=A0 =C2=A0 .broken_acpi_video =3D true,
> +};
>
> =C2=A0static bool force;
> =C2=A0module_param(force, bool, 0);
> @@ -1416,6 +1428,14 @@ static int __init samsung_platform_init(struct=
 samsung_laptop *samsung)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +static struct samsung_quirks *quirks;
> +
> +static int __init samsung_dmi_matched(const struct dmi_system_id *d)
> +{
> + =C2=A0 =C2=A0 =C2=A0 quirks =3D d->driver_data;
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> =C2=A0static struct dmi_system_id __initdata samsung_dmi_table[] =3D =
{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.matches =3D {
> @@ -1445,6 +1465,47 @@ static struct dmi_system_id __initdata samsung=
_dmi_table[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DMI_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> + =C2=A0 =C2=A0 =C2=A0 /* Specific DMI ids for laptop with quirks */
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.callback =3D samsung_dmi_matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.ident =3D "N150P",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_SYS_=
VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_PROD=
UCT_NAME, "N150P"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_BOAR=
D_NAME, "N150P"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_data =3D &samsung_broken_acpi_vi=
deo,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.callback =3D samsung_dmi_matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.ident =3D "N145P/N250P/N260P",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_SYS_=
VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_PROD=
UCT_NAME, "N145P/N250P/N260P"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_BOAR=
D_NAME, "N145P/N250P/N260P"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_data =3D &samsung_broken_acpi_vi=
deo,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.callback =3D samsung_dmi_matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.ident =3D "N150/N210/N220",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_SYS_=
VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_PROD=
UCT_NAME, "N150/N210/N220"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_BOAR=
D_NAME, "N150/N210/N220"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_data =3D &samsung_broken_acpi_vi=
deo,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.callback =3D samsung_dmi_matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.ident =3D "NF110/NF210/NF310",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_SYS_=
VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_PROD=
UCT_NAME, "NF110/NF210/NF310"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMI_MATCH(DMI_BOAR=
D_NAME, "NF110/NF210/NF310"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_data =3D &samsung_broken_acpi_vi=
deo,
> + =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ },
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
> @@ -1456,6 +1517,7 @@ static int __init samsung_init(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct samsung_laptop *samsung;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>
> + =C2=A0 =C2=A0 =C2=A0 quirks =3D &samsung_unknown;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!force && !dmi_check_system(samsung_dm=
i_table))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV=
;
>
> @@ -1465,12 +1527,21 @@ static int __init samsung_init(void)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&samsung->sabi_mutex);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0samsung->handle_backlight =3D true;
> + =C2=A0 =C2=A0 =C2=A0 samsung->quirks =3D quirks;
>
> -#ifdef CONFIG_ACPI
> +
> +#if (defined CONFIG_ACPI_VIDEO || defined CONFIG_ACPI_VIDEO_MODULE)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don't handle backlight here if the acpi=
 video already handle it */
> - =C2=A0 =C2=A0 =C2=A0 if (acpi_video_backlight_support())
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 samsung->handle_ba=
cklight =3D false;
> + =C2=A0 =C2=A0 =C2=A0 if (acpi_video_backlight_support()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (samsung->quirk=
s->broken_acpi_video) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 pr_info("Disabling ACPI video driver\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 acpi_video_unregister();
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 samsung->handle_backlight =3D false;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0#endif
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D samsung_platform_init(samsung);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error_pla=
tform;
> @@ -1481,7 +1552,8 @@ static int __init samsung_init(void)
>
> =C2=A0#ifdef CONFIG_ACPI
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Only log that if we are really on a sab=
i platform */
> - =C2=A0 =C2=A0 =C2=A0 if (acpi_video_backlight_support())
> + =C2=A0 =C2=A0 =C2=A0 if (acpi_video_backlight_support() &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !samsung->quirks->broken_acpi_vi=
deo)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info("Backl=
ight controlled by ACPI video driver\n");
> =C2=A0#endif
>
> --
> 1.7.3.4
>

Matthew, is this one ok ? I really hope this patch can go in 3.4 so we
don't introduce a regression for old laptops.
Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
