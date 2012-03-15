From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] asus-wmi: store backlight power status for AIO machine
Date: Thu, 15 Mar 2012 11:01:53 +0100
Message-ID: <CAHR064itHdch6MEFxyHqQYv2Wpo3HQ2RU8BRH0Xfa-GBvWSM5A@mail.gmail.com>
References: <1331801480-20664-1-git-send-email-acelan.kao@canonical.com>
	<1331801480-20664-2-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:44577 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752649Ab2COKBz convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 06:01:55 -0400
Received: by bkcik5 with SMTP id ik5so1952962bkc.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Mar 2012 03:01:53 -0700 (PDT)
In-Reply-To: <1331801480-20664-2-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

Hello,


On Thu, Mar 15, 2012 at 9:51 AM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> Due to some implementation reasons, ASUS ET2012 All-in-One machines
> can't report the correct backlight power status, it will always retur=
n
> 1. To track the backlight power status correctly, we have to store th=
e
> status by ourselves.
>
> BTW, by the BIOS design, the backlight power will be turn on/off
> sequently, no matter what the value of the parameter will be.
> More over, the brightness adjustment command will turn on the backlig=
ht
> power. Those behaviors will make us fail to track the backlight power
> status.
> For example, While we are trying to turn on the backlight power,
> we will send out the brightness adjustment command and then trying to
> figure out if we have to turn on the backlight power, then send out
> the command. But, the real case is that, the backlight power turns on
> while sending the brightness adjustment command, and then we send out
> the command to turn on the backlight power, it actually will turn off
> the backlight power and the backlight power status we recorded become=
s
> wrong. So, we have to seperate these two commands by a if statement.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0| =C2=A0 34 +++++++++++++=
+++++++--------------
> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0| =C2=A0 =C2=A02 ++
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 12 +++++++++++-
> =C2=A03 files changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 584db8a..0ec1b13 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1075,7 +1075,11 @@ static int asus_wmi_hwmon_init(struct asus_wmi=
 *asus)
> =C2=A0*/
> =C2=A0static int read_backlight_power(struct asus_wmi *asus)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 int ret =3D asus_wmi_get_devstate_simple(asus,=
 ASUS_WMI_DEVID_BACKLIGHT);
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 if (unlikely(asus->driver->asus_quirks->store_=
backlight_power))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D !asus->dri=
ver->panel_power;
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D asus_wmi_g=
et_devstate_simple(asus, ASUS_WMI_DEVID_BACKLIGHT);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret < 0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> @@ -1135,24 +1139,23 @@ static int update_bl_status(struct backlight_=
device *bd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_wmi *asus =3D bl_get_data(bd);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl_param;
> - =C2=A0 =C2=A0 =C2=A0 int power, err;
> -
> - =C2=A0 =C2=A0 =C2=A0 if (unlikely(asus->driver->asus_quirks->scalar=
_panel_brightness))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D get=
_scalar_command (bd);
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D bd-=
>props.brightness;
> -
> - =C2=A0 =C2=A0 =C2=A0 err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_B=
RIGHTNESS,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param, NULL);
> -
> - =C2=A0 =C2=A0 =C2=A0 if (err < 0)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;
> + =C2=A0 =C2=A0 =C2=A0 int power, err =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0power =3D read_backlight_power(asus);
> - =C2=A0 =C2=A0 =C2=A0 if (power !=3D -ENODEV && bd->props.power !=3D=
 power) {
> + =C2=A0 =C2=A0 =C2=A0 if (unlikely(power !=3D -ENODEV && bd->props.p=
ower !=3D power)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl_param =3D=
 !!(bd->props.power =3D=3D FB_BLANK_UNBLANK);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D asus_w=
mi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ctrl_param, NULL);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asus->driver->=
asus_quirks->store_backlight_power)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 asus->driver->panel_power =3D bd->props.power;
> + =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(asus-=
>driver->asus_quirks->scalar_panel_brightness))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ctrl_param =3D get_scalar_command (bd);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ctrl_param =3D bd->props.brightness;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D asus_wmi_s=
et_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ctrl_param, NULL);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;
> =C2=A0}
> @@ -1214,6 +1217,9 @@ static int asus_wmi_backlight_init(struct asus_=
wmi *asus)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0asus->backlight_device =3D bd;
>
> + =C2=A0 =C2=A0 =C2=A0 if (asus->driver->asus_quirks->store_backlight=
_power)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus->driver->pane=
l_power =3D power;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bd->props.brightness =3D read_brightness(b=
d);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bd->props.power =3D power;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0backlight_update_status(bd);
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/a=
sus-wmi.h
> index c593d05..7d499b1 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -38,11 +38,13 @@ struct asus_wmi;
> =C2=A0struct quirk_entry {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool hotplug_wireless;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool scalar_panel_brightness;
> + =C2=A0 =C2=A0 =C2=A0 bool store_backlight_power;
> =C2=A0};
>
> =C2=A0struct asus_wmi_driver {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wapf;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness_old;
> + =C2=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 panel_power;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*name;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct module =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *owner;
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 83c33a6..64b0c10 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -32,6 +32,7 @@
> =C2=A0#include <linux/input.h>
> =C2=A0#include <linux/input/sparse-keymap.h>
> =C2=A0#include <linux/dmi.h>
> +#include <linux/fb.h>
> =C2=A0#include <acpi/acpi_bus.h>
>
> =C2=A0#include "asus-wmi.h"
> @@ -95,8 +96,13 @@ static struct quirk_entry quirk_asus_1000h =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.hotplug_wireless =3D true,
> =C2=A0};
>
> +static struct quirk_entry quirk_asus_et2012_type1 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .store_backlight_power =3D true,
> +};
> +
> =C2=A0static struct quirk_entry quirk_asus_et2012_type3 =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.scalar_panel_brightness =3D true,
> + =C2=A0 =C2=A0 =C2=A0 .store_backlight_power =3D true,
> =C2=A0};
>
> =C2=A0static int dmi_matched(const struct dmi_system_id *dmi)
> @@ -110,8 +116,11 @@ static int dmi_matched(const struct dmi_system_i=
d *dmi)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char oemstring=
[30];
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while ((dev =3D=
 dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (sscanf(dev->name, "AEMS%24c", oemstring) =3D=3D 1) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oemstring[18] =3D=3D '3')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oemstring[18] =3D=3D '1') {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asus_wm=
i->asus_quirks =3D &quirk_asus_et2012_type1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (oemstring[18] =3D=3D '3'=
) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a=
sus_wmi->asus_quirks =3D &quirk_asus_et2012_type3;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> @@ -198,6 +207,7 @@ static void eeepc_wmi_quirks(struct asus_wmi_driv=
er *driver)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0asus_wmi =3D driver;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->wapf =3D -1;
> + =C2=A0 =C2=A0 =C2=A0 driver->panel_power =3D FB_BLANK_UNBLANK;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->asus_quirks =3D &quirk_asus_unknow=
n;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->asus_quirks->hotplug_wireless =3D =
hotplug_wireless;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dmi_check_system(asus_quirks);
> --
> 1.7.9.1
>

I'm not sure "unlikely" is really needed here, since the code path is
clearly not performance critical.
Except from that, this patch looks ok (if you fix issues pointed in
the first patch).

Thanks !

--=20
Corentin Chary
http://xf.iksaif.net
