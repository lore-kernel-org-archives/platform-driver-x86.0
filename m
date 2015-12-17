From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Thu, 17 Dec 2015 19:47:41 +0100
Message-ID: <20151217184741.GG13531@pali>
References: <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
 <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
 <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com>
 <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
 <567284E7.3050103@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35312 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626AbbLQSro (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Dec 2015 13:47:44 -0500
Received: by mail-wm0-f46.google.com with SMTP id l126so34344297wml.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Dec 2015 10:47:43 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <567284E7.3050103@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Hans! See my comments below about your patches.

> From 9355058f5c1d7c815a293e0c0731d85f0a59b4a1 Mon Sep 17 00:00:00 200=
1
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Thu, 17 Dec 2015 09:59:01 +0100
> Subject: [PATCH 2/4] dell-wmi: Use acpi_video_handles_brightness_key_=
presses()
>=20
> Use the new acpi_video_handles_brightness_key_presses function to che=
ck
> if we should report brightness key-presses.
>=20
> This makes the code both easier to read and makes it properly report
> key-presses when acpi-video is not reporting them for reasons other
> then the backlight type being vendor.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index f2d77fe..cb8a9c2 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -43,8 +43,6 @@ MODULE_LICENSE("GPL");
> =20
>  #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
> =20
> -static int acpi_video;
> -
>  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
> =20
>  /*
> @@ -159,7 +157,8 @@ static void dell_wmi_process_key(int reported_key=
)
> =20
>  	/* Don't report brightness notifications that will also come via AC=
PI */
>  	if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
> -	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video)
> +	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) &&
> +	    acpi_video_handles_brightness_key_presses())

I do not like this, because that function uses mutex and is called ever=
y
time when brightness key event is received by wmi notify handler.

>  		return;
> =20
>  	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
> @@ -398,7 +397,6 @@ static int __init dell_wmi_init(void)
>  	}
> =20
>  	dmi_walk(find_hk_type, NULL);
> -	acpi_video =3D acpi_video_get_backlight_type() !=3D acpi_backlight_=
vendor;
> =20
>  	err =3D dell_wmi_input_setup();
>  	if (err)
> --=20
> 2.5.0
>=20

> From 5e7ff99407aeb60c2f1516cdd80d7859646497dd Mon Sep 17 00:00:00 200=
1
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Wed, 16 Dec 2015 11:19:00 +0100
> Subject: [PATCH 4/4] acpi-video: Add a module option to disable the r=
eporting
>  of keypresses
>=20
> Add a module option to disable the reporting of keypresses, in some b=
uggy
> firmware implementatinon, the reported events are wrong. E.g. they la=
g
> reality by one event in the case triggering the writing of this patch=
=2E
>=20
> In this case it is better to not forward these wrong events to usersp=
ace
> (esp.) when there is another source of the same events which is not b=
uggy.
>=20
> Note this is only intended to work around implementations which send
> events which are plain wrong. In some cases we get double events, e.g=
=2E
> from both acpi-video and the atkbd driver, in this case acpi-video is
> considered the canonical source, and the events from the other source
> should be filtered (using e.g. /lib/udev/hwdb.d/60-keyboard.hwdb).
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/acpi_video.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 2a649f3e..2971154 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -77,6 +77,13 @@ module_param(allow_duplicates, bool, 0644);
>  static int disable_backlight_sysfs_if =3D -1;
>  module_param(disable_backlight_sysfs_if, int, 0444);
> =20
> +#define REPORT_OUTPUT_KEY_EVENTS		0x01
> +#define REPORT_BRIGHTNESS_KEY_EVENTS		0x02
> +static int report_key_events =3D -1;
> +module_param(report_key_events, int, 0644);
> +MODULE_PARM_DESC(report_key_events,
> +	"0: none, 1: output changes, 2: brightness changes, 3: all");
> +

-1 is default value? Should not be it 3? Or -1 as some default which us=
e
quirks?

>  static bool device_id_scheme =3D false;
>  module_param(device_id_scheme, bool, 0444);
> =20
> @@ -1480,7 +1487,7 @@ static void acpi_video_bus_notify(struct acpi_d=
evice *device, u32 event)
>  		/* Something vetoed the keypress. */
>  		keycode =3D 0;
> =20
> -	if (keycode) {
> +	if (keycode && (report_key_events & REPORT_OUTPUT_KEY_EVENTS)) {
>  		input_report_key(input, keycode, 1);
>  		input_sync(input);
>  		input_report_key(input, keycode, 0);
> @@ -1544,7 +1551,7 @@ static void acpi_video_device_notify(acpi_handl=
e handle, u32 event, void *data)
> =20
>  	acpi_notifier_call_chain(device, event, 0);
> =20
> -	if (keycode) {
> +	if (keycode && (report_key_events & REPORT_BRIGHTNESS_KEY_EVENTS)) =
{
>  		input_report_key(input, keycode, 1);
>  		input_sync(input);
>  		input_report_key(input, keycode, 0);
> @@ -2080,7 +2087,8 @@ bool acpi_video_handles_brightness_key_presses(=
void)
>  	have_video_busses =3D !list_empty(&video_bus_head);
>  	mutex_unlock(&video_list_lock);
> =20
> -	return have_video_busses;
> +	return have_video_busses &&
> +	       (report_key_events & REPORT_BRIGHTNESS_KEY_EVENTS);
>  }
>  EXPORT_SYMBOL(acpi_video_handles_brightness_key_presses);
> =20
> --=20
> 2.5.0
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
