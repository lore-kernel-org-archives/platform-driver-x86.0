From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Add support for Toshiba Illumination. This is a set of
	LEDs installed on some Toshiba laptops. It is controlled through ACPI, the
	commands has been found through reverse engineering. It has been tested on a
	Toshiba Qosmio G50-122.
Date: Thu, 29 Jul 2010 12:09:49 +0200
Message-ID: <AANLkTikzpUaWCqGLseOZixFmoQOPd9L-pecLNzm_aDSw@mail.gmail.com>
References: <1280397419-6799-1-git-send-email-pinaraf@pinaraf.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52354 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756166Ab0G2KJv convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Jul 2010 06:09:51 -0400
In-Reply-To: <1280397419-6799-1-git-send-email-pinaraf@pinaraf.info>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pierre Ducroquet <pinaraf@pinaraf.info>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com, akpm@linux-foundation.org, len.brown@intel.com, nm127@freemail.hu, adobriyan@gmail.com, linux-kernel@vger.kernel.org

Hum it seems that there was an issue with the changelog, you should
add some \n :p

On Thu, Jul 29, 2010 at 11:56 AM, Pierre Ducroquet <pinaraf@pinaraf.inf=
o> wrote:
> Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
> ---
> =A0drivers/platform/x86/toshiba_acpi.c | =A0117 +++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 117 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x=
86/toshiba_acpi.c
> index 37aa147..81b76a8 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -4,6 +4,7 @@
> =A0*
> =A0* =A0Copyright (C) 2002-2004 John Belmonte
> =A0* =A0Copyright (C) 2008 Philip Langdale
> + * =A0Copyright (C) 2010 Pierre Ducroquet
> =A0*
> =A0* =A0This program is free software; you can redistribute it and/or=
 modify
> =A0* =A0it under the terms of the GNU General Public License as publi=
shed by
> @@ -47,6 +48,7 @@
> =A0#include <linux/platform_device.h>
> =A0#include <linux/rfkill.h>
> =A0#include <linux/input.h>
> +#include <linux/leds.h>
> =A0#include <linux/slab.h>
>
> =A0#include <asm/uaccess.h>
> @@ -285,6 +287,7 @@ struct toshiba_acpi_dev {
> =A0 =A0 =A0 =A0struct platform_device *p_dev;
> =A0 =A0 =A0 =A0struct rfkill *bt_rfk;
> =A0 =A0 =A0 =A0struct input_dev *hotkey_dev;
> + =A0 =A0 =A0 int illumination_installed;

I don't know if this is really  needed, you can use the led_classdev
for that (if NULL, then not installed).

> =A0 =A0 =A0 =A0acpi_handle handle;
>
> =A0 =A0 =A0 =A0const char *bt_name;
> @@ -292,6 +295,110 @@ struct toshiba_acpi_dev {
> =A0 =A0 =A0 =A0struct mutex mutex;
> =A0};
>
> +/* Illumination support */
> +static int toshiba_illumination_available(void)
> +{
> + =A0 =A0 =A0 u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
> + =A0 =A0 =A0 u32 out[HCI_WORDS];
> + =A0 =A0 =A0 acpi_status status;
> +
> + =A0 =A0 =A0 in[0] =3D 0xf100;
> + =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(MY_INFO "Illumination device not=
 available\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 in[0] =3D 0xf400;
> + =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 return 1;
> +}
> +
> +static void toshiba_illumination_set(struct led_classdev *cdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0enum led_brightness brightness)
> +{
> + =A0 =A0 =A0 u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
> + =A0 =A0 =A0 u32 out[HCI_WORDS];
> + =A0 =A0 =A0 acpi_status status;
> +
> + =A0 =A0 =A0 /* First request : initialize communication. */
> + =A0 =A0 =A0 in[0] =3D 0xf100;
> + =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(MY_INFO "Illumination device not=
 available\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (brightness) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Switch the illumination on */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 in[0] =3D 0xf400;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 in[1] =3D 0x14e;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 in[2] =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(MY_INFO "ACPI ca=
ll for illumination failed.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Switch the illumination off */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 in[0] =3D 0xf400;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 in[1] =3D 0x14e;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 in[2] =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(MY_INFO "ACPI ca=
ll for illumination failed.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Last request : close communication. */
> + =A0 =A0 =A0 in[0] =3D 0xf200;
> + =A0 =A0 =A0 in[1] =3D 0;
> + =A0 =A0 =A0 in[2] =3D 0;
> + =A0 =A0 =A0 hci_raw(in, out);
> +}
> +
> +static enum led_brightness toshiba_illumination_get(struct led_class=
dev *cdev)
> +{
> + =A0 =A0 =A0 u32 in[HCI_WORDS] =3D { 0, 0, 0, 0, 0, 0 };
> + =A0 =A0 =A0 u32 out[HCI_WORDS];
> + =A0 =A0 =A0 acpi_status status;
> + =A0 =A0 =A0 enum led_brightness result;
> +
> + =A0 =A0 =A0 /*=A0First request : initialize communication. */
> + =A0 =A0 =A0 in[0] =3D 0xf100;
> + =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(MY_INFO "Illumination device not=
 available\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return LED_OFF;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Check the illumination */
> + =A0 =A0 =A0 in[0] =3D 0xf300;
> + =A0 =A0 =A0 in[1] =3D 0x14e;
> + =A0 =A0 =A0 status =3D hci_raw(in, out);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(MY_INFO "ACPI call for illuminat=
ion failed.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return LED_OFF;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 result =3D out[2] ? LED_FULL : LED_OFF;
> +
> + =A0 =A0 =A0 /* Last request : close communication. */
> + =A0 =A0 =A0 in[0] =3D 0xf200;
> + =A0 =A0 =A0 in[1] =3D 0;
> + =A0 =A0 =A0 in[2] =3D 0;
> + =A0 =A0 =A0 hci_raw(in, out);
> +
> + =A0 =A0 =A0 return result;
> +}
> +
> +static struct led_classdev toshiba_led =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "toshiba::illumination",
> + =A0 =A0 =A0 .max_brightness =3D 1,
> + =A0 =A0 =A0 .brightness_set =3D toshiba_illumination_set,
> + =A0 =A0 =A0 .brightness_get =3D toshiba_illumination_get,
> +};

Please put the led_classed in t toshiba_acpi_dev, even if the hci_raw
calls (and the whole driver) is not really reentrant.
See eeepc-laptop or asus-laptop.

> =A0static struct toshiba_acpi_dev toshiba_acpi =3D {
> =A0 =A0 =A0 =A0.bt_name =3D "Toshiba Bluetooth",
> =A0};
> @@ -914,6 +1021,9 @@ static void toshiba_acpi_exit(void)
> =A0 =A0 =A0 =A0acpi_remove_notify_handler(toshiba_acpi.handle, ACPI_D=
EVICE_NOTIFY,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t=
oshiba_acpi_notify);
>
> + =A0 =A0 =A0 if (toshiba_acpi.illumination_installed)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 led_classdev_unregister(&toshiba_led);
> +
> =A0 =A0 =A0 =A0platform_device_unregister(toshiba_acpi.p_dev);
>
> =A0 =A0 =A0 =A0return;
> @@ -1013,6 +1123,13 @@ static int __init toshiba_acpi_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 toshiba_acpi.illumination_installed =3D 0;
> + =A0 =A0 =A0 if (toshiba_illumination_available()) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!led_classdev_register(&(toshiba_ac=
pi.p_dev->dev),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0&toshiba_led))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 toshiba_acpi.illuminati=
on_installed =3D 1;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Corentin Chary
http://xf.iksaif.net
