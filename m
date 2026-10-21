Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586429;
	b=EcQUOBt2gjabhGSKN/BMGLBB5UBmmqT+5ETufUb5JdgNhNxM+ESJIGkg+xnmCl0VF+ft
	 Ud48MFiu6T2DZO5Oc7+VRy6WXB86PyjF7/TmEXVsPMcXwXo5HONbf9e9yBMohXmwEpM2U
	 44xoKtcZtEpVYhY8VbzeU+Gna1lOvUd+vWduafLR67J/Hm8wNo0OxpisdjDsDVZrXsCXU
	 CUWUTzyh2LKTE3lYwGSKZ4IC2JVfnlK5lF93kDLDYDAwKwQHdqPMlvGRVyWd4ubUs+M36
	 5eVza1+CzbCqXazu43RfWDgHce0I2RU5D5bCMsLbC5rM0h1oA8mOo6B+zA7316gNEiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586429;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=XK1aAp2qUs6uW3/Kbnpg/LwGVRC8xXD4h4lCmqqhJJg=;
	b=jWbrdS98AMuJlqUnX/69o5NYK+EZU3u7zjzyjPxIVJd48UPdZGfGRzbMjVPA5a9aWiFo
	 NTPRMpDAtYylXKbaC+leoxmPwZR9H9ApRpviSQ1rBtsw9jeyssvt/qCnX0UG7yn+uwac1
	 dQVrtdQfcUNGjEEkhPZoKR8SNJeS8+1lbWMEJxRLEB3qkfhMy5gGZTwl4W1H6D0AtwEo+
	 Cz3C5yGruiQOjKNb+ila2pf2evMdeDjICiG/lioEiEh/IVSgHfkNcxOkvD3awQvs8hFMR
	 YtqQDpCYy3U5FgIsyoPR6BviiM/nivnjkzPdJ8YeVWUdUYGa9GRyeeYt/6iM1+U568A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kyBT7MIH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09E1606A31B;
	Wed, 21 Oct 2026 12:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E09E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kyBT7MIH
ARC-Seal: i=1; a=rsa-sha256; t=1792586405; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PrulwZYOz6GsbkxN5yCtCVdGL8KnpjbFYlU0UUgg1yUoBJloLxfaY7iM6ARxMTGxFnCVUW2eU4uZC1v2M2IqxL1/TGe79zBUMrskffTg199CS9cCj8IVHT+etNsrK4eCWzq9SILGQ8P4ABo/DYR10MxOtghMXelWHXDDBTJk5X4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792586405; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XK1aAp2qUs6uW3/Kbnpg/LwGVRC8xXD4h4lCmqqhJJg=; 
	b=gHKDcpzusfFq9N5ckaTXRgwmu89+SlNZHm9fiqDXrH0yXO2WeSY3zGM1Dys9XpCdWiRfUy7uAYEJl3njaopKDYA7/00udyC4swAx4iVeK5oUMKwzrqbaffmGUjR//2r2ayun+pRyj87snyorTBH/FYMfNsG6ZyiuoCIEM2X1V98=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792586405;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=XK1aAp2qUs6uW3/Kbnpg/LwGVRC8xXD4h4lCmqqhJJg=;
	b=kyBT7MIHYjryb/64EfgddoP5zM/77yBtwTwa3gnzo3bkAsjkINh8B7yQabAZQPXc
	QJLmu87zxpcd6ZGMDrsnpcyG2MRaxZSlxklKk1sMZ6Cm2yBuOtqHy6nq4pH/9j6eYmW
	jCxxKHgXvKat4TpmZCP9/0X+A89BsMKhYBUZEMsVXqETouuZnY9W/ic4dONnpGqHnuq
	kjbJ3DuFHumXbViDeNP8r/bs1hJygBKfnBjecD9hEEMzrirnbJsBUNG+sKNFsmy2Ml4
	N2E4sY7P17MlH0x85iw1tnaptmSxpBUEkeM1/SbVbM9NJbkLfYN8v+GOX7IMtHRxsJh
	DEe1dNf8Cg==
Received: by smtp.zohomail.com with SMTPS id 1792586401907139.97660660185863;
	Wed, 21 Oct 2026 05:40:01 -0700 (PDT)
Message-ID: <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on
 Zenbook S14
From: Rong Zhang <i@rong.moe>
To: git@turtledev.nz, Corentin Chary <corentin.chary@gmail.com>, "Luke D.
 Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de
 Goede <hansg@kernel.org>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues
	 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 20:34:53 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Zane, Jos=C3=A9,

Hopefully I am not too late to show up here.

Regarding the title, you are not fixing a bug of the driver, but adding
support for ASUS_WMI_DEVID_CAMERA_LED_NEG.

On Mon, 2026-10-19 at 19:35 +1300, Zane Hunt via B4 Relay wrote:
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

I agree with Jos=C3=A9 that the current ignore-anything-but-resync behavior
has a weird semantics, especially considering that writing to the
attribute has a side-effect that updates led_cdev->brightness
unconditionally [1].

Unfortunately, errors from an LED driver never reach userspace through
brightness_store(). Also, not every code path of the LED core prints set
errors to kmsg. This is also the default behavior of the LED core when
neither brightness_set() nor brightness_set_blocking() is implemented.
Thus, returning an error here really doesn't make much sense here.

If we really want to ensure the brightness and trigger attributes are
read-only to userspace, consult LED_SYSFS_DISABLE and do not implement
brightness_set[_blocking]() at all, but do we?

[1]: While the cached brightness never reaches userspace because of the
presence of brightness_get(), it's still... very weird.

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
.bh@gmail.com>
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
>  #define NOTIFY_KBD_TTP			0xae
>  #define NOTIFY_LID_FLIP			0xfa
>  #define NOTIFY_LID_FLIP_ROG		0xbd
> +#define NOTIFY_CAMERA_TOGGLE_1		0x82
> +#define NOTIFY_CAMERA_TOGGLE_2		0x85
>  #define NOTIFY_KEYSTONE			0xb4
> =20
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
> @@ -312,6 +315,7 @@ struct asus_wmi {
>  	u32 kbd_rgb_dev;
>  	bool kbd_rgb_state_available;
>  	bool oobe_state_available;
> +	bool camera_neg_led_available;
> =20
>  	u8 throttle_thermal_policy_mode;
>  	u32 throttle_thermal_policy_dev;
> @@ -2096,6 +2100,54 @@ static int camera_led_set(struct led_classdev *led=
_cdev,
>  	return err < 0 ? err : 0;
>  }
> =20
> +static bool is_camera_toggle(int code)
> +{
> +	return code =3D=3D NOTIFY_CAMERA_TOGGLE_1 || code =3D=3D NOTIFY_CAMERA_=
TOGGLE_2;
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
.
> + * Nothing else updates the LED, so read it after every camera key event=
.
> + * Registering asus::camera reads it too (via brightness_get), which set=
s the
> + * LED at probe. Setting it is no use, the firmware accepts DEVS on this
> + * device only once per boot.
> + *
> + * Returns 1 if the camera is disabled (LED lit), 0 if enabled, or -errn=
o.
> + */
> +static int camera_neg_led_sync(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, &res=
ult);
> +	if (err)
> +		return err;
> +
> +	return !(result & ASUS_WMI_DSTS_STATUS_BIT);
> +}
> +
> +static enum led_brightness camera_neg_led_get(struct led_classdev *led_c=
dev)
> +{
> +	struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wmi, camer=
a_led);
> +	int state =3D camera_neg_led_sync(asus);
> +
> +	return state < 0 ? LED_OFF : state;
> +}
> +
> +/* The firmware owns this LED; a write just resyncs it with the camera s=
tate. */
> +static int camera_neg_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness brightness)
> +{
> +	struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wmi, camer=
a_led);
> +
> +	if (!(led_cdev->flags & LED_UNREGISTERING))
> +		camera_neg_led_sync(asus);
> +	return 0;
> +}

I agree with Jos=C3=A9 that this should be unnecessary considering that
asus_wmi_handle_event_code() has handled the event.

Still, could you confirm whether pressing the camera key during s2idle
toggles the camera state without emitting a WMI event or not? If so, a
resync should be performed on resume.

If there is really a need to preserve the manual resync functionality,
it'd be better to use custom LED attributes to achieve sensible
semantics, see led_cdev->groups.

> +
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> @@ -2227,11 +2279,18 @@ static int asus_wmi_led_init(struct asus_wmi *asu=
s)
>  			goto error;
>  	}
> =20
> -	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
> +	if (asus->camera_neg_led_available ||
> +	    asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
>  		asus->camera_led.name =3D "asus::camera";
>  		asus->camera_led.max_brightness =3D 1;
> -		asus->camera_led.brightness_get =3D camera_led_get;
> -		asus->camera_led.brightness_set_blocking =3D camera_led_set;
> +		if (asus->camera_neg_led_available) {
> +			asus->camera_led.flags =3D LED_BRIGHT_HW_CHANGED;
> +			asus->camera_led.brightness_get =3D camera_neg_led_get;
> +			asus->camera_led.brightness_set_blocking =3D camera_neg_led_set;
> +		} else {
> +			asus->camera_led.brightness_get =3D camera_led_get;
> +			asus->camera_led.brightness_set_blocking =3D camera_led_set;
> +		}
> =20
>  		rv =3D led_classdev_register(&asus->platform_device->dev,
>  						&asus->camera_led);
> @@ -4733,6 +4792,13 @@ static void asus_wmi_handle_event_code(int code, s=
truct asus_wmi *asus)
>  	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
>  		return;
> =20
> +	if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> +		int state =3D camera_neg_led_sync(asus);
> +
> +		if (state >=3D 0)
> +			led_classdev_notify_brightness_hw_changed(&asus->camera_led, state);
> +	}
> +
>  	if (!sparse_keymap_report_event(asus->inputdev, code,
>  					key_value, autorelease))
>  		pr_info("Unknown key code 0x%x\n", code);
> @@ -5210,6 +5276,9 @@ static int asus_wmi_add(struct platform_device *pde=
v)
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> =20
>  	asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_WMI_D=
EVID_OOBE);
> +	asus->camera_neg_led_available =3D
> +		!asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) &&
> +		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);

When a device has both ASUS_WMI_DEVID_CAMERA_LED and
ASUS_WMI_DEVID_CAMERA_LED_NEG implemented, camera_neg_led_available is
false and the LED device can't benefit from brightness_hw_changed.

It'd be better to decouple the brightness_hw_changed path from
!ASUS_WMI_DEVID_CAMERA_LED, since devices with both IDs should be able to
emit the WMI event.

With that, how about adding a wrapper function that dispatches call to
either asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED) or
asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED_NEG) according to the
IDs' presence? Then you can share the same brightness_hw_changed path by
calling the wrapper function and eliminate the need of adding a dedicated
brightness_get() callback in the same manner.

IOW, the presence of ASUS_WMI_DEVID_CAMERA_LED determines the
availability of brightness_set_blocking(), and
ASUS_WMI_DEVID_CAMERA_LED_NEG determines brightness_hw_changed. The
brightness_get() callback is the same thanks to the wrapper function.

Thanks,
Rong

> =20
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLIC=
Y))
>  		asus->throttle_thermal_policy_dev =3D ASUS_WMI_DEVID_THROTTLE_THERMAL_=
POLICY;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 4ea1ccc..5964063 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -57,7 +57,7 @@
>  #define ASUS_WMI_DEVID_MUTE_LED	0x0004001C
> =20
>  /* Disable Camera LED */
> -#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 =3D on (unused) */
> +#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 =3D on */
>  #define ASUS_WMI_DEVID_CAMERA_LED	0x00060079 /* 1 =3D on */
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
