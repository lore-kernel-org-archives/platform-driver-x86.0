From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Sat, 19 May 2012 09:31:27 +0200
Message-ID: <CAHR064jipUpkysfd_oQwBG9gcuViBjpHVffwo81HOUOYFLeURg@mail.gmail.com>
References: <1337328636-4196-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:61973 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752613Ab2ESHb3 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 03:31:29 -0400
Received: by bkcji2 with SMTP id ji2so2869945bkc.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 May 2012 00:31:27 -0700 (PDT)
In-Reply-To: <1337328636-4196-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

The patch is almost ok, I won't merge it as-is because I want a
cleaner mechanism to inform the kernel that the vendor backlight
should be prefered. If I can't do it before the end of the next merge
windows I'll merge it in the current form.

On Fri, May 18, 2012 at 10:10 AM, AceLan Kao <acelan.kao@canonical.com>=
 wrote:
> BugLink: https://bugs.launchpad.net/bugs/1000146
>
> Some h/w that can adjust screen brightness through ACPI functions, bu=
t
> can't turn on/off the backlight power correctly. So, we list those h/=
w in
> quirks and try to turn on/off the backlight power through WMI.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0| =C2=A0 =C2=A07 +++++++
> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 23 ++++++++++++++++++=
+++++
> =C2=A03 files changed, 31 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 77aadde..b1b8b0b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
> =C2=A0#define NOTIFY_BRNDOWN_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x2e
> =C2=A0#define NOTIFY_KBD_BRTUP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0xc4
> =C2=A0#define NOTIFY_KBD_BRTDWN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00xc5
> +#define NOTIFY_BACKLIGHT_POWER =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xe9
>
> =C2=A0/* WMI Methods */
> =C2=A0#define ASUS_WMI_METHODID_SPEC =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x43=
455053 /* BIOS SPECification */
> @@ -1288,6 +1289,12 @@ static void asus_wmi_notify(u32 value, void *c=
ontext)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (code =3D=3D NOTIFY_BRNUP_MIN || code =3D=
=3D NOTIFY_BRNDOWN_MIN) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!acpi_vide=
o_backlight_support())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0asus_wmi_backlight_notify(asus, orig_code);
> + =C2=A0 =C2=A0 =C2=A0 } else if (asus->driver->quirks->wmi_backlight=
_power &&
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code =
=3D=3D NOTIFY_BACKLIGHT_POWER) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static int backlig=
ht_power =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight_power =3D=
 !backlight_power;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus_wmi_set_devst=
ate(ASUS_WMI_DEVID_BACKLIGHT,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight_powe=
r, NULL);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (!sparse_keymap_report_event(asu=
s->inputdev, code,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 key_value, autorelease))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info("Unkno=
wn key %x pressed\n", code);
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/a=
sus-wmi.h
> index d43b667..9c1da8b 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -39,6 +39,7 @@ struct quirk_entry {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool hotplug_wireless;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool scalar_panel_brightness;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool store_backlight_power;
> + =C2=A0 =C2=A0 =C2=A0 bool wmi_backlight_power;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int wapf;
> =C2=A0};
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 6567613..8d31f4e 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -107,6 +107,11 @@ static struct quirk_entry quirk_asus_et2012_type=
3 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.store_backlight_power =3D true,
> =C2=A0};
>
> +static struct quirk_entry quirk_asus_x101ch =3D {
> + =C2=A0 =C2=A0 =C2=A0 /* We need this when ACPI function doesn't do =
this well */
> + =C2=A0 =C2=A0 =C2=A0 .wmi_backlight_power =3D true,
> +};
> +
> =C2=A0static struct quirk_entry *quirks;
>
> =C2=A0static void et2012_quirks(void)
> @@ -157,6 +162,24 @@ static struct dmi_system_id asus_quirks[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.driver_data =3D=
 &quirk_asus_unknown,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi_=
matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "ASUSTe=
K Computer INC. X101CH",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "X101CH"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_data =3D &=
quirk_asus_x101ch,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi_=
matched,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "ASUSTe=
K Computer INC. 1015CX",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "1015CX"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .driver_data =3D &=
quirk_asus_x101ch,
> + =C2=A0 =C2=A0 =C2=A0 },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{},
> =C2=A0};
>
> --
> 1.7.9.5
>



--=20
Corentin Chary
http://xf.iksaif.net
