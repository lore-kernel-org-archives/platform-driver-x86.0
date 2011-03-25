From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Fri, 25 Mar 2011 12:21:20 +0100
Message-ID: <AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
	<1301004130-3294-4-git-send-email-andy.ross@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:48935 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820Ab1CYLVW convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Mar 2011 07:21:22 -0400
Received: by eyx24 with SMTP id 24so451784eyx.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Mar 2011 04:21:20 -0700 (PDT)
In-Reply-To: <1301004130-3294-4-git-send-email-andy.ross@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Ross <andy.ross@windriver.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg@redhat.com>

Ccing Dmitry and Matthew, they may want to comment that one.

On Thu, Mar 24, 2011 at 11:02 PM, Andy Ross <andy.ross@windriver.com> w=
rote:
> Support the built-in accelerometer on the Lucid tablets as a standard
> 3-axis input device.
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
> =C2=A0drivers/platform/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
9 ++-
> =C2=A0drivers/platform/x86/asus-laptop.c | =C2=A0137 ++++++++++++++++=
+++++++++++++++++++-
> =C2=A02 files changed, 141 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index b6f983e..43906f5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -67,10 +67,11 @@ config ASUS_LAPTOP
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is a driver for Asus laptops a=
nd the Pegatron Lucid
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tablet. It may also support some ME=
DION, JVC or VICTOR
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptops. It makes all the extra but=
tons generate standard
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI events and input events. It also a=
dds support for video
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 output switching, LCD backlight control=
, Bluetooth and Wlan
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 control, and most importantly, allows y=
ou to blink those
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 fancy LEDs.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 ACPI events and input events, and on th=
e Lucid the built-in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 accelerometer appears as an input devic=
e. =C2=A0It also adds
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 support for video output switching, LCD=
 backlight control,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bluetooth and Wlan control, and most im=
portantly, allows you
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 to blink those fancy LEDs.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For more information and a userspac=
e daemon for handling the extra
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buttons see <http://acpi4asus.sf.ne=
t>.
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index 6651d8c..9b07368 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -224,6 +224,14 @@ static char *display_get_paths[] =3D {
> =C2=A0#define PEGA_READ_ALS_H =C2=A0 =C2=A0 =C2=A0 =C2=A00x02
> =C2=A0#define PEGA_READ_ALS_L =C2=A0 =C2=A0 =C2=A0 =C2=A00x03
>
> +#define PEGA_ACCEL_NAME "pega_accel"
> +#define PEGA_ACCEL_DESC "Pegatron Lucid Tablet Accelerometer"
> +#define METHOD_XLRX "XLRX"
> +#define METHOD_XLRY "XLRY"
> +#define METHOD_XLRZ "XLRZ"
> +#define PEGA_ACC_CLAMP 512 /* 1G accel is reported as ~256, so clamp=
 to 2G */
> +#define PEGA_ACC_RETRIES 3
> +
> =C2=A0/*
> =C2=A0* Define a specific led structure to keep the main structure cl=
ean
> =C2=A0*/
> @@ -249,6 +257,7 @@ struct asus_laptop {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct input_dev *inputdev;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct key_entry *keymap;
> + =C2=A0 =C2=A0 =C2=A0 struct input_polled_dev *pega_accel_poll;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_led mled;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_led tled;
> @@ -262,6 +271,10 @@ struct asus_laptop {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool have_rsts;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool have_pega_lucid;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int lcd_state;
> + =C2=A0 =C2=A0 =C2=A0 bool pega_acc_live;
> + =C2=A0 =C2=A0 =C2=A0 int pega_acc_x;
> + =C2=A0 =C2=A0 =C2=A0 int pega_acc_y;
> + =C2=A0 =C2=A0 =C2=A0 int pega_acc_z;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rfkill *gps_rfkill;
>
> @@ -390,6 +403,99 @@ static int asus_pega_lucid_set(struct asus_lapto=
p *asus, int unit, bool enable)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return write_acpi_int(asus->handle, method=
, unit);
> =C2=A0}
>
> +static int pega_acc_axis(struct asus_laptop *asus, int curr, char *m=
ethod)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i, delta;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long long val;
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < PEGA_ACC_RETRIES; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acpi_evaluate_inte=
ger(asus->handle, method, NULL, &val);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The output is n=
oisy. =C2=A0From reading the ASL
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* dissassemb=
ly, timeout errors are returned with 1's
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in the hig=
h word, and the lack of locking around
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* thei hi/lo=
 byte reads means that a transition
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* between (f=
or example) -1 and 0 could be read as
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 0xff00 or =
0x00ff. */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delta =3D abs(curr=
 - (short)val);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (delta < 128 &&=
 !(val & ~0xffff))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return clamp_val((short)val, -PEGA_ACC_CLAMP, =
PEGA_ACC_CLAMP);
> +}

Wow :/ How long is an acpi_evaluate_integer call here ?

> +static int asus_platform_probe(struct platform_device *pd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct asus_laptop *asus =3D dev_get_drvdata(&=
pd->dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* This is instantiated during platform driver=
 initialization
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* becuase if it's done from underneath a=
sus_acpi_add(), the
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* resulting input device can be grabbed =
by an early userspace
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* reader before ACPI initialization is f=
inished and something
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* oopses underneath the acpi_evaluate_in=
teger() call out of
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* pega_accel_poll(). =C2=A0Firmware bug?=
 */
> + =C2=A0 =C2=A0 =C2=A0 pega_accel_probe(asus);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}

When is asus_platform_probe called exactly ? Because I'd say it's
called during asus_platform_probe(), and that doesn't fix your issue
right ?

--=20
Corentin Chary
http://xf.iksaif.net
