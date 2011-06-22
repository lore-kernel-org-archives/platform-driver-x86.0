From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/3] ideapad: add backlight driver
Date: Wed, 22 Jun 2011 11:20:16 +0200
Message-ID: <BANLkTi=fh1UTsUFQvo+66B_QaOx-mqF3kg@mail.gmail.com>
References: <1308729781-2590-1-git-send-email-ike.pan@canonical.com>
	<1308730058-2703-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60321 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162Ab1FVJUR convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2011 05:20:17 -0400
In-Reply-To: <1308730058-2703-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Richard Purdie <rpurdie@rpsys.net>

On Wed, Jun 22, 2011 at 10:07 AM, Ike Panhc <ike.pan@canonical.com> wro=
te:
> When acpi_backlight=3Dvendor in cmdline or no backlight support in ac=
pi video
> device, ideapad-laptop will register backlight device and control bri=
ghtness
> and backlight power via the command in VPC2004.
>
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
> =C2=A0drivers/platform/x86/ideapad-laptop.c | =C2=A0129 +++++++++++++=
+++++++++++++++++---
> =C2=A01 files changed, 119 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index 678bbf7..018c457 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -32,6 +32,8 @@
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/input.h>
> =C2=A0#include <linux/input/sparse-keymap.h>
> +#include <linux/backlight.h>
> +#include <linux/fb.h>
>
> =C2=A0#define IDEAPAD_RFKILL_DEV_NUM (3)
>
> @@ -44,6 +46,7 @@ struct ideapad_private {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rfkill *rfk[IDEAPAD_RFKILL_DEV_NUM]=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *platform_device;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct input_dev *inputdev;
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_device *blightdev;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long cfg;
> =C2=A0};
>
> @@ -257,9 +260,8 @@ static struct rfkill_ops ideapad_rfk_ops =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.set_block =3D ideapad_rfk_set,
> =C2=A0};
>
> -static void ideapad_sync_rfk_state(struct acpi_device *adevice)
> +static void ideapad_sync_rfk_state(struct ideapad_private *priv)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 struct ideapad_private *priv =3D dev_get_drvda=
ta(&adevice->dev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hw_blocked;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;
>
> @@ -309,8 +311,7 @@ static int __devinit ideapad_register_rfkill(stru=
ct acpi_device *adevice,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> -static void __devexit ideapad_unregister_rfkill(struct acpi_device *=
adevice,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 int dev)
> +static void ideapad_unregister_rfkill(struct acpi_device *adevice, i=
nt dev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ideapad_private *priv =3D dev_get_d=
rvdata(&adevice->dev);
>
> @@ -418,6 +419,97 @@ static void ideapad_input_report(struct ideapad_=
private *priv,
> =C2=A0}
>
> =C2=A0/*
> + * backlight
> + */
> +static int ideapad_backlight_get_brightness(struct backlight_device =
*blightdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long now;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x12, &now))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;
> + =C2=A0 =C2=A0 =C2=A0 return now;
> +}
> +
> +static int ideapad_backlight_update_status(struct backlight_device *=
blightdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (write_ec_cmd(ideapad_handle, 0x13, blightd=
ev->props.brightness))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;
> + =C2=A0 =C2=A0 =C2=A0 if (write_ec_cmd(ideapad_handle, 0x33,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0blightdev->props.power =3D=3D FB_BLANK_POWERDOWN ? 0 : 1)=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}

I don't think -EAGAIN is a good idea here ... Why not -EIO ?

> +static const struct backlight_ops ideapad_backlight_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .get_brightness =3D ideapad_backlight_get_brig=
htness,
> + =C2=A0 =C2=A0 =C2=A0 .update_status =3D ideapad_backlight_update_st=
atus,
> +};
> +
> +static int ideapad_backlight_init(struct ideapad_private *priv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_device *blightdev;
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_properties props;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long max, now, power;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x11, &max))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x12, &now))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x18, &power)=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EAGAIN;

Same

> + =C2=A0 =C2=A0 =C2=A0 memset(&props, 0, sizeof(struct backlight_prop=
erties));
> + =C2=A0 =C2=A0 =C2=A0 props.max_brightness =3D max;

You forgot to set backlight type, "props.type =3D BACKLIGHT_PLATFORM;"

> + =C2=A0 =C2=A0 =C2=A0 blightdev =3D backlight_device_register("ideap=
ad",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &priv->platform_device->dev,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 priv,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &ideapad_backlight_ops,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &props);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(blightdev)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Could not =
register backlight device\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(bli=
ghtdev);
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 priv->blightdev =3D blightdev;
> + =C2=A0 =C2=A0 =C2=A0 blightdev->props.brightness =3D now;
> + =C2=A0 =C2=A0 =C2=A0 blightdev->props.power =3D power ? FB_BLANK_UN=
BLANK : FB_BLANK_POWERDOWN;
> + =C2=A0 =C2=A0 =C2=A0 backlight_update_status(blightdev);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static void ideapad_backlight_exit(struct ideapad_private *priv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 if (priv->blightdev)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backlight_device_u=
nregister(priv->blightdev);
> + =C2=A0 =C2=A0 =C2=A0 priv->blightdev =3D NULL;
> +}
> +
> +static void ideapad_backlight_notify_power(struct ideapad_private *p=
riv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long power;
> + =C2=A0 =C2=A0 =C2=A0 struct backlight_device *blightdev =3D priv->b=
lightdev;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (read_ec_data(ideapad_handle, 0x18, &power)=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 blightdev->props.power =3D power ? FB_BLANK_UN=
BLANK : FB_BLANK_POWERDOWN;
> +}
> +
> +static void ideapad_backlight_notify_brightness(struct ideapad_priva=
te *priv)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned long now;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* if we control brightness via acpi video dri=
ver */
> + =C2=A0 =C2=A0 =C2=A0 if (priv->blightdev =3D=3D NULL) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_ec_data(ideap=
ad_handle, 0x12, &now);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 backlight_force_update(priv->blightdev, BACKLI=
GHT_UPDATE_HOTKEY);
> +}
> +
> +/*
> =C2=A0* module init/exit
> =C2=A0*/
> =C2=A0static const struct acpi_device_id ideapad_device_ids[] =3D {
> @@ -456,10 +548,19 @@ static int __devinit ideapad_acpi_add(struct ac=
pi_device *adevice)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0priv->rfk[i] =3D NULL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> - =C2=A0 =C2=A0 =C2=A0 ideapad_sync_rfk_state(adevice);
> + =C2=A0 =C2=A0 =C2=A0 ideapad_sync_rfk_state(priv);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!acpi_video_backlight_support()) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ideapad_ba=
cklight_init(priv);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret && ret !=3D=
 -ENODEV)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 goto backlight_failed;
> + =C2=A0 =C2=A0 =C2=A0 }
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>
> +backlight_failed:
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_unregister=
_rfkill(adevice, i);
> =C2=A0input_failed:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ideapad_platform_exit(priv);
> =C2=A0platform_failed:
> @@ -472,6 +573,7 @@ static int __devexit ideapad_acpi_remove(struct a=
cpi_device *adevice, int type)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ideapad_private *priv =3D dev_get_d=
rvdata(&adevice->dev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;
>
> + =C2=A0 =C2=A0 =C2=A0 ideapad_backlight_exit(priv);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; =
i++)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ideapad_unregi=
ster_rfkill(adevice, i);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ideapad_input_exit(priv);
> @@ -496,12 +598,19 @@ static void ideapad_acpi_notify(struct acpi_dev=
ice *adevice, u32 event)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0vpc1 =3D (vpc2 << 8) | vpc1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (vpc_bit =3D 0; vpc_bit < 16; vpc_bit+=
+) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_bit(v=
pc_bit, &vpc1)) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (vpc_bit =3D=3D 9)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_sync_rfk_state(adevice);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else if (vpc_bit =3D=3D 4)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_ec_data(handle, 0x12, &vpc2);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 switch (vpc_bit) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 case 9:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_sync_rfk_state(priv);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 case 4:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_backlight_notify_brightness=
(priv);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 case 2:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_backlight_notify_power(priv=
);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 default:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ideapad_input_report(priv, vp=
c_bit);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0}
> --
> 1.7.4.1
>
>

Otherwise, looks ok

--=20
Corentin Chary
http://xf.iksaif.net
