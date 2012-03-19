From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/3 v3] asus-nb-wmi: move WAPF variable into quirks_entry
Date: Mon, 19 Mar 2012 10:09:27 +0100
Message-ID: <CAHR064jE6auZFvkQYJ0hELcBaWNWDCv=CkOt2W4QZODDmpLowQ@mail.gmail.com>
References: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
	<1332138824-9673-3-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:51092 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754726Ab2CSJJ3 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 05:09:29 -0400
Received: by bkcik5 with SMTP id ik5so4072983bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 02:09:27 -0700 (PDT)
In-Reply-To: <1332138824-9673-3-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 19, 2012 at 7:33 AM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> Some models work better with different values of wapf, so move the
> variable into quriks_entry to make it more easy to give a specific
> value to different models.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-nb-wmi.c | =C2=A0 =C2=A02 +-
> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0 =C2=A0| =C2=A0 =C2=A04 +=
+--
> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0 =C2=A0| =C2=A0 =C2=A02 +=
-
> =C2=A0drivers/platform/x86/eeepc-wmi.c =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A04 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x8=
6/asus-nb-wmi.c
> index 396dafc..9dd7b93 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -53,7 +53,7 @@ MODULE_PARM_DESC(wapf, "WAPF value");
>
> =C2=A0static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
> =C2=A0{

Missing "driver->quirks =3D asus_unknown_quriks" (or similar). quirks i=
s
NULL here, and the module will segfault (unfortunatly I tried without
reading the code and it did :p).

> - =C2=A0 =C2=A0 =C2=A0 driver->wapf =3D wapf;
> + =C2=A0 =C2=A0 =C2=A0 driver->quirks->wapf =3D wapf;
> =C2=A0}
>
> =C2=A0static const struct key_entry asus_nb_wmi_keymap[] =3D {
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 9cd459a..1d2047d 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1471,9 +1471,9 @@ static int asus_wmi_platform_init(struct asus_w=
mi *asus)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* CWAP allow to define the behavior of th=
e Fn+F2 key,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this method doesn't seems to be present=
 on Eee PCs */
> - =C2=A0 =C2=A0 =C2=A0 if (asus->driver->wapf >=3D 0)
> + =C2=A0 =C2=A0 =C2=A0 if (asus->driver->quirks->wapf >=3D 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0asus_wmi_set_d=
evstate(ASUS_WMI_DEVID_CWAP,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus->driver->=
wapf, NULL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus->driver->=
quirks->wapf, NULL);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return asus_wmi_sysfs_init(asus->platform_=
device);
> =C2=A0}
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/a=
sus-wmi.h
> index 35003e4..d43b667 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -39,10 +39,10 @@ struct quirk_entry {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool hotplug_wireless;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool scalar_panel_brightness;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool store_backlight_power;
> + =C2=A0 =C2=A0 =C2=A0 int wapf;
> =C2=A0};
>
> =C2=A0struct asus_wmi_driver {
> - =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wapf;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_power;
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index c1a0ac0..7e15d54 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -207,10 +207,10 @@ static int eeepc_wmi_probe(struct platform_devi=
ce *pdev)
> =C2=A0static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0quirks =3D driver->quirks;
> - =C2=A0 =C2=A0 =C2=A0 driver->wapf =3D -1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->panel_power =3D FB_BLANK_UNBLANK;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->quirks =3D &quirk_asus_unknown;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->quirks->hotplug_wireless =3D hotpl=
ug_wireless;
> + =C2=A0 =C2=A0 =C2=A0 driver->quirks->wapf =3D -1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dmi_check_system(asus_quirks);
> =C2=A0}
>
> --
> 1.7.9.1
>



--=20
Corentin Chary
http://xf.iksaif.net
