Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1A49503E;
	Mon, 19 Oct 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399147; cv=none; b=XncE6d/matg1YCrMWSBzdaPfxjCxnoo8uRrVyAu6fK1p5AtqrOmUYsnGYA1z02hJAcxRrtkbZidWkC4w6SvqFdjHd+84Jt7tz/ptVHISnX+CJjtuB7KJnOARt7hIc8woukmWB02JutKFiYjLiqtzKhhZ8ANhKQQoh844jxHgsL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399147; c=relaxed/simple;
	bh=venZQXPXW5PYUnoUQ/X6QXBIVXJIgvaB4iADLUpnq4A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OmCfRqBIpSpj8l8uG2x3B9+NvSn760aklf0oZHsUQR1Hbc1hwdGtifPxEYFCBgh1rAV2q4S8J5Cw5vJ9R5bPPriTVUjDSOHwG2rqi1wc/mvw2E0cQqAHnpXMaeI3FwbjdiuXnwz+ACHMlhhA1D04GavjUu0daye+6buu0JSL5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmt9e64S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmt9e64S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792399145; x=1823935145;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=venZQXPXW5PYUnoUQ/X6QXBIVXJIgvaB4iADLUpnq4A=;
  b=gmt9e64SOxrrcROoDNjH/ZkxoRqtYhSHGh9zaGBL4O6o+4pho6CyFoSf
   vGzipwXS30LDTdaVK/5RY/WFrbWFcYGWmc8PfgYNjxwyhyHPvsy/NS99+
   16BpLHw2utJIFlTowNg9GHjAWSoVCaxzfPNC98qulc8dlEXoF+oQmcmJ7
   6oklKB4fN4/umeYWjml/sEmh7mYQnmGKppTKPmzY+M2JRcsY8V093zUdD
   pR0EWJuZ5Bw+8j86TodfSoYXCWl0n2RdLeFet6HKjZPLRfqQ9AOdG1P2S
   lNk7ImDHNqzYh9i7zwtJCx8QzEamcZyqDA30zkB1yMy0pFZlx7fUj4cck
   w==;
X-CSE-ConnectionGUID: zc8pi8TcQOG6E0WoWSXdOg==
X-CSE-MsgGUID: pNR8Y3VlQoib1uQgHZ8Cxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1076010"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1076010"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:39:05 -0700
X-CSE-ConnectionGUID: HaiY17CwQvimVz1GSCoCDw==
X-CSE-MsgGUID: Yialp5LvRKWtNGSV4iDRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2467828"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:39:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 11:38:54 +0300 (EEST)
To: Zane Hunt <git@turtledev.nz>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    =?ISO-8859-15?Q?Jos=E9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook
 S14
In-Reply-To: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
Message-ID: <fdafaeae-e44d-be40-efc0-46bae9973b53@linux.intel.com>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1007985297-1792399134=:1469"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1007985297-1792399134=:1469
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 19 Oct 2026, Zane Hunt via B4 Relay wrote:

> From: Zane Hunt <git@turtledev.nz>
>=20
> On some newer Zenbooks (Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) the
> camera key turns the camera off in firmware, but the LED on the key never
> lights up under Linux. These machines don't have
> ASUS_WMI_DEVID_CAMERA_LED, so asus-wmi never registers asus::camera. The
> firmware exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG instead.
>=20
> Reading CAMERA_LED_NEG is what drives the LED: the DSTS handler reads the
> camera state from the EC and writes it to the LED GPIO before returning
> it. The set side can't be used, the firmware only accepts DEVS on this
> device once per boot.
>=20
> When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
> asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read it
> after every camera key event, sending a brightness_hw_changed event.
> Registering the LED reads it as well, which fixes the LED being dark afte=
r
> a cold boot with the camera disabled.
>=20
> While at it, include <linux/container_of.h>, which this file already
> relied on.
>=20
> Link: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221752
> Assisted-by: Claude:claude-opus-5-5 iasl
> Co-developed-by: Jos=C3=A9 Guilherme de Castro Rodrigues <jose.guilherme.=
cr.bh@gmail.com>
> Signed-off-by: Jos=C3=A9 Guilherme de Castro Rodrigues <jose.guilherme.cr=
=2Ebh@gmail.com>
> Signed-off-by: Zane Hunt <git@turtledev.nz>
> ---
> Changes in v4:
> - Keep Jos=C3=A9's Signed-off-by from v2 and add his Co-developed-by
> - Use my full name in the tags
> - Include <linux/container_of.h>
> - Reuse the existing asus::camera registration block, only the
>   handlers and flags differ
> - camera_neg_led_available is now only set when CAMERA_LED is missing,
>   so asus::camera is always the CAMERA_LED_NEG one when it's set. That
>   makes the LED_BRIGHT_HW_CHANGED check in the event handler unneeded,
>   so it's gone
> - Drop the explicit read at probe, led_classdev_register() already
>   reads the state through brightness_get
> - Link to v3: https://patch.msgid.link/20261017-asus-wmi-camera-led-v3-1-=
845a82373997@turtledev.nz
>=20
> Changes in v3 (picking up Jos=C3=A9's v2, which had stalled):
> - Rebased on pdx86 for-next
> - Also read CAMERA_LED_NEG at probe, so the LED is right after a cold boo=
t
> - Register a read-only asus::camera LED when only CAMERA_LED_NEG exists,
>   with brightness_hw_changed on key presses (Ilpo's suggestion on v2)
> - Comment on why the read is what updates the LED (also from v2 review)
> - v2: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
>=20
> Tested again on the Zenbook S 14 UX5406SA (BIOS 309), on Fedora's 7.2.9
> kernel with the same change applied: camera key presses keep the LED,
> asus::camera and the camera output in sync, and with the camera disabled
> and the LED forced off, loading the driver turns the LED back on.
>=20
> I used Claude while working on this. It helped
> me read through the DSDT, drafted the changes on top of v2 and wrote the
> test scripts. I went through the patch myself and ran the tests on my
> laptop.
> ---
>  drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++++=
++++--
>  include/linux/platform_data/x86/asus-wmi.h |  2 +-
>  2 files changed, 73 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index fb1d4a0..93b51c8 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -17,6 +17,7 @@
>  #include <linux/backlight.h>
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
> +#include <linux/container_of.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
> @@ -72,6 +73,8 @@ module_param(fnlock_default, bool, 0444);
>  #define NOTIFY_KBD_TTP=09=09=090xae
>  #define NOTIFY_LID_FLIP=09=09=090xfa
>  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> +#define NOTIFY_CAMERA_TOGGLE_1=09=090x82
> +#define NOTIFY_CAMERA_TOGGLE_2=09=090x85
>  #define NOTIFY_KEYSTONE=09=09=090xb4
> =20
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> @@ -312,6 +315,7 @@ struct asus_wmi {
>  =09u32 kbd_rgb_dev;
>  =09bool kbd_rgb_state_available;
>  =09bool oobe_state_available;
> +=09bool camera_neg_led_available;
> =20
>  =09u8 throttle_thermal_policy_mode;
>  =09u32 throttle_thermal_policy_dev;
> @@ -2096,6 +2100,54 @@ static int camera_led_set(struct led_classdev *led=
_cdev,
>  =09return err < 0 ? err : 0;
>  }
> =20
> +static bool is_camera_toggle(int code)
> +{
> +=09return code =3D=3D NOTIFY_CAMERA_TOGGLE_1 || code =3D=3D NOTIFY_CAMER=
A_TOGGLE_2;
> +}
> +
> +/*
> + * Some models (e.g. Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) have =
no
> + * ASUS_WMI_DEVID_CAMERA_LED. The firmware handles the camera key itself=
 and
> + * only exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG, and rea=
ding
> + * that has a side effect: the firmware copies the state to the LED GPIO=
=2E
> + * Nothing else updates the LED, so read it after every camera key event=
=2E
> + * Registering asus::camera reads it too (via brightness_get), which set=
s the
> + * LED at probe. Setting it is no use, the firmware accepts DEVS on this
> + * device only once per boot.
> + *
> + * Returns 1 if the camera is disabled (LED lit), 0 if enabled, or -errn=
o.

This should be Returns: to follow kerneldoc formatting (even if it's not=20
exactly 100% kerneldoc in other aspects). But no need to send another=20
version just because of it, I'll try to remember to change it while=20
applying. If you get some other comments and end up doing another version,=
=20
then make the change yourself.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

I'll wait a few days before consider this to give Jos=C3=A9 and others time=
 to=20
respond and review.

--=20
 i.

> + */
> +static int camera_neg_led_sync(struct asus_wmi *asus)
> +{
> +=09u32 result;
> +=09int err;
> +
> +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, &r=
esult);
> +=09if (err)
> +=09=09return err;
> +
> +=09return !(result & ASUS_WMI_DSTS_STATUS_BIT);
> +}
> +
> +static enum led_brightness camera_neg_led_get(struct led_classdev *led_c=
dev)
> +{
> +=09struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wmi, cam=
era_led);
> +=09int state =3D camera_neg_led_sync(asus);
> +
> +=09return state < 0 ? LED_OFF : state;
> +}
> +
> +/* The firmware owns this LED; a write just resyncs it with the camera s=
tate. */
> +static int camera_neg_led_set(struct led_classdev *led_cdev,
> +=09=09=09      enum led_brightness brightness)
> +{
> +=09struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wmi, cam=
era_led);
> +
> +=09if (!(led_cdev->flags & LED_UNREGISTERING))
> +=09=09camera_neg_led_sync(asus);
> +=09return 0;
> +}
> +
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
>  =09scoped_guard(spinlock_irqsave, &asus_ref.lock)
> @@ -2227,11 +2279,18 @@ static int asus_wmi_led_init(struct asus_wmi *asu=
s)
>  =09=09=09goto error;
>  =09}
> =20
> -=09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
> +=09if (asus->camera_neg_led_available ||
> +=09    asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
>  =09=09asus->camera_led.name =3D "asus::camera";
>  =09=09asus->camera_led.max_brightness =3D 1;
> -=09=09asus->camera_led.brightness_get =3D camera_led_get;
> -=09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> +=09=09if (asus->camera_neg_led_available) {
> +=09=09=09asus->camera_led.flags =3D LED_BRIGHT_HW_CHANGED;
> +=09=09=09asus->camera_led.brightness_get =3D camera_neg_led_get;
> +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_neg_led_set=
;
> +=09=09} else {
> +=09=09=09asus->camera_led.brightness_get =3D camera_led_get;
> +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> +=09=09}
> =20
>  =09=09rv =3D led_classdev_register(&asus->platform_device->dev,
>  =09=09=09=09=09=09&asus->camera_led);
> @@ -4733,6 +4792,13 @@ static void asus_wmi_handle_event_code(int code, s=
truct asus_wmi *asus)
>  =09if (is_display_toggle(code) && asus->driver->quirks->no_display_toggl=
e)
>  =09=09return;
> =20
> +=09if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> +=09=09int state =3D camera_neg_led_sync(asus);
> +
> +=09=09if (state >=3D 0)
> +=09=09=09led_classdev_notify_brightness_hw_changed(&asus->camera_led, st=
ate);
> +=09}
> +
>  =09if (!sparse_keymap_report_event(asus->inputdev, code,
>  =09=09=09=09=09key_value, autorelease))
>  =09=09pr_info("Unknown key code 0x%x\n", code);
> @@ -5210,6 +5276,9 @@ static int asus_wmi_add(struct platform_device *pde=
v)
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> =20
>  =09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI=
_DEVID_OOBE);
> +=09asus->camera_neg_led_available =3D
> +=09=09!asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) &&
> +=09=09asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);
> =20
>  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POL=
ICY))
>  =09=09asus->throttle_thermal_policy_dev =3D ASUS_WMI_DEVID_THROTTLE_THER=
MAL_POLICY;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 4ea1ccc..5964063 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -57,7 +57,7 @@
>  #define ASUS_WMI_DEVID_MUTE_LED=090x0004001C
> =20
>  /* Disable Camera LED */
> -#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on (unused) =
*/
> +#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on */
>  #define ASUS_WMI_DEVID_CAMERA_LED=090x00060079 /* 1 =3D on */
> =20
>  /* Backlight and Brightness */
>=20
> ---
> base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
> change-id: 20261017-asus-wmi-camera-led-06a6e05f01e2
>=20
> Best regards,
> -- =20
> Zane Hunt <git@turtledev.nz>
>=20
>=20
--8323328-1007985297-1792399134=:1469--
