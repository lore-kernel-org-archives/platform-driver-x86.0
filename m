From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/3] asus-wmi: add scalar board brightness adj. support
Date: Fri, 9 Mar 2012 11:58:49 +0100
Message-ID: <CAHR064gjubUS-4OXLW9a2tfM72VNEOhmjbZdvT+2ZK1e=rcc2g@mail.gmail.com>
References: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
	<1331259429-6216-2-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:57908 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751244Ab2CIK6y convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Mar 2012 05:58:54 -0500
Received: by bkcik5 with SMTP id ik5so1054324bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Mar 2012 02:58:52 -0800 (PST)
In-Reply-To: <1331259429-6216-2-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Fri, Mar 9, 2012 at 3:17 AM, AceLan Kao <acelan.kao@canonical.com> w=
rote:
> Some of the ASUS ET2012 All-in-One machines that use a scalar board
> to control the brightness, and it only accepts brightness up or down
> comm. So, I introduced a get_scalar_command() function to pass the
> command to the scalar board through WMI.
>
> Besides, we have to store the brightness value locally, for we need t=
he
> old value to know the brightness is increasing or decreasing.
>
> BTW, since there is no way to retrieve the actual brightness(it would=
 be
> a fixed value), and the max brightness value would be fixed to 1, so =
we
> have to keep passing the brightness up/down command when we reached t=
he
> max brightness value or 0.
>
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0| =C2=A0 21 +++++++++++++=
++++++++
> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 13 +++++++++++++
> =C2=A03 files changed, 35 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 72d731c..48e96f3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1116,6 +1116,25 @@ static int read_brightness(struct backlight_de=
vice *bd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval & ASUS_WMI_DSTS_BRIGHTNESS_M=
ASK;
> =C2=A0}
>
> +static u32 get_scalar_command(struct backlight_device *bd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct asus_wmi *asus =3D bl_get_data(bd);
> + =C2=A0 =C2=A0 =C2=A0 u32 ctrl_param =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 static int brightness_old =3D -1;

Please add brightness_old to "struct asus_wmi" instead of using a stati=
c.

> +
> + =C2=A0 =C2=A0 =C2=A0 if (brightness_old =3D=3D -1)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness_old =3D=
 bd->props.brightness;
> +
> + =C2=A0 =C2=A0 =C2=A0 if ((brightness_old < bd->props.brightness) ||=
 bd->props.brightness =3D=3D read_brightness_max(asus))

Use bd->props.max_brightness instead of read_brightness_max()

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D 0x0=
0008001;
> + =C2=A0 =C2=A0 =C2=A0 else if ((brightness_old > bd->props.brightnes=
s) || bd->props.brightness =3D=3D 0)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D 0x0=
0008000;
> +
> + =C2=A0 =C2=A0 =C2=A0 brightness_old =3D bd->props.brightness;
> +
> + =C2=A0 =C2=A0 =C2=A0 return ctrl_param;
> +}
> +
> =C2=A0static int update_bl_status(struct backlight_device *bd)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct asus_wmi *asus =3D bl_get_data(bd);
> @@ -1123,6 +1142,8 @@ static int update_bl_status(struct backlight_de=
vice *bd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int power, err;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl_param =3D bd->props.brightness;
> + =C2=A0 =C2=A0 =C2=A0 if (unlikely(asus->driver->scalar_panel_bright=
ness))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctrl_param =3D get=
_scalar_command (bd);

I think I prefer a if (scala) ctrl_param =3D ; else ctrl_param =3D ; co=
nstruct here.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D asus_wmi_set_devstate(ASUS_WMI_DEV=
ID_BRIGHTNESS,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctrl_param, NUL=
L);
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/a=
sus-wmi.h
> index 8147c10..45fb62c 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -37,6 +37,7 @@ struct asus_wmi;
>
> =C2=A0struct asus_wmi_driver {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hotplug_wireless;
> + =C2=A0 =C2=A0 =C2=A0 bool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0scalar_panel_brightness;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wapf;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*name;
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 9f6e643..c5f4c64 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -161,11 +161,24 @@ static void eeepc_dmi_check(struct asus_wmi_dri=
ver *driver)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->hotplu=
g_wireless =3D true;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info("wlan =
hotplug enabled\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 =C2=A0 if (strncmp(model, "ET2012", 6) =3D=3D 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct dmi_d=
evice *dev =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char oemstring[30]=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while ((dev =3D dm=
i_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (sscanf(dev->name, "AEMS%24c", oemstring) =3D=3D 1) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oemstring[18] =3D=3D '3')
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver-=
>scalar_panel_brightness =3D true;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0}

Can't this be done using real DMI matching functions ? Like
dmi_check_system() + a DMI table ? Could be used to clean the current
eeepc_dmi_check() too.

> =C2=A0static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->hotplug_wireless =3D hotplug_wirel=
ess;
> + =C2=A0 =C2=A0 =C2=A0 driver->scalar_panel_brightness =3D false;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0driver->wapf =3D -1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0eeepc_dmi_check(driver);
> =C2=A0}
> --
> 1.7.9
>

Thanks !

--=20
Corentin Chary
http://xf.iksaif.net
