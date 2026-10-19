Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B6339395;
	Mon, 19 Oct 2026 06:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389917; cv=none; b=c4vlBcxW+FY2fSSWT11br4niEO0HbJ4n+VKSjqKchRJUWj/suL4RDvy9MEF87S5cePS095ZDryAYb0ZIiFi8cWLVRPUcDQ0tkEmGDijUcFCFcppfkR+2ErWoZu78xpZY07r05RBFPv5Xp5zERqOhjsPLw0NMmUnighcZCjAeE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389917; c=relaxed/simple;
	bh=SOq3UNsFXxn2x4tDWqNMsKMuBE2O5h0ff5SziW/mVKQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KLBVXPBhJN1FXtkhwzM3y8foSkSDoaFpgjWmEoORqSK246nvzIGLM3SFztRWdYuo1bcjo8/IhfBtU1puFT+/EbVhKFvreNYsZLlEcXTFJzKM5VI+wtBWp9uzPHd55Rt01Km3TPgjlXKoIrzUL7xuSn7x+NZwVb0Wx/WkVCMltkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLvzXntZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLvzXntZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792389916; x=1823925916;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SOq3UNsFXxn2x4tDWqNMsKMuBE2O5h0ff5SziW/mVKQ=;
  b=lLvzXntZBcPAjCfoHJKs5gMoKm5fKZzfO/1xjfkWs+K+Bz+a1yJCGMhl
   IsXj3H/msZB8KQBODNdQwAZh83xwHOYOb+2Pdr+ySD4y958b0b/8g5QN8
   n5PKjB23yp4x0PXmSkhhQMWaAA5hTf4BQXBr18ur5lgwd8dGD+eGW6jza
   y82UBJ1XdMmlLp583V1CIh9I0jdyPN2o595nUUeD+H8jZpFKK544oEMIW
   8DSy+xv2qZTvI1QaxYSv0lWrf8r1qb1kQjQQGe2HucnFOt5vhbEqgAtd3
   0GCdCezqYUh1sfRzzsbsACo2zpBcFzFPTZc4FiaBLBLFLIz2b4IZ08G+5
   Q==;
X-CSE-ConnectionGUID: henXPy1XRLi3EKtLIiNR2Q==
X-CSE-MsgGUID: aeHg/Mf1SJWq4JafU1KQRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1058806"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1058806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:05:15 -0700
X-CSE-ConnectionGUID: 0p2wf0BUTcSKi4rdjzULxw==
X-CSE-MsgGUID: N2G/KtMBQQWJKogC3+D8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2533065"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:05:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 09:05:07 +0300 (EEST)
To: Zane <git@turtledev.nz>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    =?ISO-8859-15?Q?Jos=E9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: fix camera key LED on Zenbook
 S14
In-Reply-To: <20261017-asus-wmi-camera-led-v3-1-845a82373997@turtledev.nz>
Message-ID: <cd44cbf7-6a4a-c993-fe96-7cc913bd0608@linux.intel.com>
References: <20261017-asus-wmi-camera-led-v3-1-845a82373997@turtledev.nz>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-624579715-1792389907=:1469"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-624579715-1792389907=:1469
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 17 Oct 2026, Zane via B4 Relay wrote:

> From: Zane <git@turtledev.nz>
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
> So read it at probe, which fixes the LED being dark after a cold boot
> with the camera disabled, and after every camera key event. Also
> register a read-only asus::camera LED on these machines so userspace can
> see the camera state and gets a brightness_hw_changed event on each key
> press.
>=20
> This builds on Jos=C3=A9 Guilherme de Castro Rodrigues' v2, which added t=
he
> read after the camera key event.

You should retain his Signed-off-by tag if that's the case + add=20
Co-developed-by tag.

> Link: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221752
> Assisted-by: Claude:claude-opus-5-5 iasl
> Signed-off-by: Zane <git@turtledev.nz>

Please see what is required when you're signing off something:

Documentation/process/submitting-patches.rst

Also, you need to use your real name, not some nickname (basically what=20
you'd use to sign a paper document/contract/etc.

> ---
> Jos=C3=A9, this is a respin of your v2 since it had stalled, I hope that'=
s ok.
> Happy to drop it if you'd rather send v3 yourself, or to add your
> Co-developed-by/Signed-off-by if you want them on it.
>=20
> Changes in v3:
> - Rebased on pdx86 for-next
> - Also read CAMERA_LED_NEG at probe, so the LED is right after a cold boo=
t
> - Register a read-only asus::camera LED when only CAMERA_LED_NEG exists,
>   with brightness_hw_changed on key presses (Ilpo's suggestion on v2)
> - Comment on why the read is what updates the LED (also from v2 review)
>=20
> Tested on a Zenbook S 14 UX5406SA, BIOS 309, on the Fedora 7.2.9 kernel
> with the same change applied to its asus-wmi:
> - Key presses: the LED, asus::camera and the camera output (live picture
>   vs. the firmware's grey "camera disabled" frame) switch together every
>   time, and brightness_hw_changed follows.
> - Cold boot with the camera disabled: the LED is lit and asus::camera
>   reads 1 before anything is pressed. Without the patch the LED stays dar=
k
>   until the next key press.
> - Suspend/resume: the LEDs come back correctly, but that's the firmware
>   restoring them, it does the same without the patch. So nothing is done
>   on resume.
>=20
> A Zenbook S 16 UM5606WA owner reported on the bug that reading
> CAMERA_LED_NEG after the key event (WMI code 0x85 there) fixes it on that
> machine too. The DSDT details are in the bugzilla entry.
>=20
> I used Claude (Anthropic's AI assistant) while working on this. It helped
> me read through the DSDT, drafted the changes on top of v2 and wrote the
> test scripts. I went through the patch myself and ran the tests on my
> laptop.
>=20
> v2: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> ---
>  drivers/platform/x86/asus-wmi.c            | 72 ++++++++++++++++++++++++=
++++++
>  include/linux/platform_data/x86/asus-wmi.h |  2 +-
>  2 files changed, 73 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index fb1d4a0..fd2ba8c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -72,6 +72,8 @@ module_param(fnlock_default, bool, 0444);
>  #define NOTIFY_KBD_TTP=09=09=090xae
>  #define NOTIFY_LID_FLIP=09=09=090xfa
>  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> +#define NOTIFY_CAMERA_TOGGLE_1=09=090x82
> +#define NOTIFY_CAMERA_TOGGLE_2=09=090x85
>  #define NOTIFY_KEYSTONE=09=09=090xb4
> =20
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> @@ -312,6 +314,7 @@ struct asus_wmi {
>  =09u32 kbd_rgb_dev;
>  =09bool kbd_rgb_state_available;
>  =09bool oobe_state_available;
> +=09bool camera_neg_led_available;
> =20
>  =09u8 throttle_thermal_policy_mode;
>  =09u32 throttle_thermal_policy_dev;
> @@ -2096,6 +2099,53 @@ static int camera_led_set(struct led_classdev *led=
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
> + * Nothing else updates the LED, so read it at probe and after every cam=
era
> + * key event. Setting it is no use, the firmware accepts DEVS on this de=
vice
> + * only once per boot.
> + *
> + * Returns 1 if the camera is disabled (LED lit), 0 if enabled, or -errn=
o.
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

Missing include (pre-existing problem but lets finally fix it).

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
> @@ -2233,6 +2283,17 @@ static int asus_wmi_led_init(struct asus_wmi *asus=
)
>  =09=09asus->camera_led.brightness_get =3D camera_led_get;
>  =09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> =20
> +=09=09rv =3D led_classdev_register(&asus->platform_device->dev,
> +=09=09=09=09=09=09&asus->camera_led);
> +=09=09if (rv)
> +=09=09=09goto error;
> +=09} else if (asus->camera_neg_led_available) {
> +=09=09asus->camera_led.name =3D "asus::camera";
> +=09=09asus->camera_led.max_brightness =3D 1;
> +=09=09asus->camera_led.flags =3D LED_BRIGHT_HW_CHANGED;
> +=09=09asus->camera_led.brightness_get =3D camera_neg_led_get;
> +=09=09asus->camera_led.brightness_set_blocking =3D camera_neg_led_set;
> +
>  =09=09rv =3D led_classdev_register(&asus->platform_device->dev,
>  =09=09=09=09=09=09&asus->camera_led);

This duplicates code so you should mostly reuse the existing block, and=20
only branch where you really need something different (the handlers +=20
flags).

>  =09=09if (rv)
> @@ -4733,6 +4794,13 @@ static void asus_wmi_handle_event_code(int code, s=
truct asus_wmi *asus)
>  =09if (is_display_toggle(code) && asus->driver->quirks->no_display_toggl=
e)
>  =09=09return;
> =20
> +=09if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> +=09=09int state =3D camera_neg_led_sync(asus);
> +
> +=09=09if (state >=3D 0 && (asus->camera_led.flags & LED_BRIGHT_HW_CHANGE=
D))

And why is the second condition necessary??

> +=09=09=09led_classdev_notify_brightness_hw_changed(&asus->camera_led, st=
ate);
> +=09}
> +
>  =09if (!sparse_keymap_report_event(asus->inputdev, code,
>  =09=09=09=09=09key_value, autorelease))
>  =09=09pr_info("Unknown key code 0x%x\n", code);
> @@ -5210,6 +5278,10 @@ static int asus_wmi_add(struct platform_device *pd=
ev)
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> =20
>  =09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI=
_DEVID_OOBE);
> +=09asus->camera_neg_led_available =3D
> +=09=09asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);
> +=09if (asus->camera_neg_led_available)
> +=09=09camera_neg_led_sync(asus);
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
> Zane <git@turtledev.nz>
>=20
>=20

--=20
 i.

--8323328-624579715-1792389907=:1469--
