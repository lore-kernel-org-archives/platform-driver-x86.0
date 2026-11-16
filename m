Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.119
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855433;
	b=cWjcBnL7dRrqu0RKK4eIF3/rMTeupzeyLK7M06tXIyiElwKKWGhCO8iSILCyNQp2oFwa
	 sSB2l6U907JBbb0i2+Wksgb6NsDfpSwBM1dezFQTpAIUmOyYRukHuc+efutrkjVUoN5WG
	 bwXfocS39G2uckCmIJY081HRJNwb3cuNZMsdVT2Uq6L4/XssCILbwgmnX8nAt2fQ4K4GS
	 CJbiGKUKsuxN0LDFuNQUKZBvNqGkhCrTP3o53LPx45FNlHx+KSbx1ka8OJb+UjNSFeoRR
	 6c/SZkFXflbzexbuF0A7cE9h60+k9SluCdahW4e17gNReDEYxPbNcKPG8ygmdH4xxYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855433;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=XuKKkAbLVYo0BhTpkM4uJIqvxh3EQArBfKKFxsRKH0Y=;
	b=C5sGdNrRuORh9B3DUD7MwehrMU7gXPJYzI5sjFieK7jWmatbLn7A3xT6ohIdcHfjPC/8
	 0yr1PP2FAv7xib0oBLLgq6yFrxD7yhnRPkXvpzLKgeG89cqY1uiHtCit8f7fE/D31yGCH
	 GLYsZPrmO+CxIyY7Dbg8l22WCXvfa/RLnBfNcMC+VGYLdaRC4jgfacdtGqrxLeb4/LxXU
	 mohDKYftzFrizqQILVvzADX+w/v1YeApaCCgN2Dz3uKfhyEe8irOHpMYzvTKX4r8/a0G5
	 ymJuxDW67uw6/Wnmuz/m3M2AUxfwaEYSJzVngDDPFP5YcBqVs4CERqGX6EcEf0rWJlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bmYkGh1r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.119
Received: from sender6-pp-f119.zoho.com (sender6-pp-f119.zoho.com [165.173.180.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC7606A31C;
	Mon, 16 Nov 2026 18:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bmYkGh1r
ARC-Seal: i=1; a=rsa-sha256; t=1794855410; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Oad6pBaK9FfabIg74oZWBRjv6nbuUqSvnyYc1GQaz9e/mEODUoLg8st22sQx2pOldfqTFVsQE8epay7jiH/urO3kboAWVFadHWoO43drGCU7Xb7zW/UTw8PH6+lfM7Glas/4q7RFDRqBdPq8BhS02cxEKrePZG+hExneGN3Vmac=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794855410; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XuKKkAbLVYo0BhTpkM4uJIqvxh3EQArBfKKFxsRKH0Y=; 
	b=P1kQUfmfA1sVsaWPhi/JKzq0/kzFFH32l4T/a73PfpHU92Re9H2Ay6ZuVu+X0/zsDux5svLSzvoqy/VS25Z4KT0euW64sc7ZbePj2CqU3VEnVJ+9nrY7NK8HYdYE3Clke97NWUJnmBTIWpyql8qKLuEQJnAekGO0VqMPwMuek0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=bmYkGh1rSucB6deKcfRkmIa4YV9EydO9IbFNeR+po2LlmYw4kIKI7SZtqbBjhGZA1OeX+PNP9yp1WuCApsc5hvVJKINVwrMSX4ziDCAMFcLUVsATelVNo6A1GrFBihqVwxt+ZArpJ0fTzRsae0N5JXYZQZ4/XWP8deEzJYuvBX8pBGk8lTnlrDMbjaojGzToQYJoGlXPhxFxrxY6x9Z9Xs5FYiuEqqECInmMaFrHsKdEEiyY9A5voDgKxlpqkqMCW+L+75gQhAbTMSfdnot7CTRnHupXbAvxk2EZ7uWo1eTqWE0iYzuZbRQ4aB4iLAvT1JmFht6nYcZ8oBu/sevTWg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=XuKKkAbLVYo0BhTpkM4uJIqvxh3EQArBfKKFxsRKH0Y=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794855408497536.0911974283522;
	Mon, 16 Nov 2026 10:56:48 -0800 (PST)
Message-ID: <173bed0f4e42a85087766a8e8cce8557115f2ccf.camel@rong.moe>
Subject: Re: [PATCH v5] platform/x86: asus-wmi: Add support for
 ASUS_WMI_DEVID_CAMERA_LED_NEG
From: Rong Zhang <i@rong.moe>
To: git@turtledev.nz, Corentin Chary <corentin.chary@gmail.com>, "Luke D.
 Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de
 Goede <hansg@kernel.org>,  Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues
	 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261117-asus-wmi-camera-led-v5-1-41c47653758b@turtledev.nz>
References: <20261117-asus-wmi-camera-led-v5-1-41c47653758b@turtledev.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 02:51:44 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Zane,

On Tue, 2026-11-17 at 07:37 +1300, Zane Hunt via B4 Relay wrote:
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
> a cold boot with the camera disabled. There is no brightness_set
> callback, so writes to the brightness attribute are ignored, as with
> other get-only LEDs.
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
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Zane Hunt <git@turtledev.nz>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
> Changes in v5:
> - Rebased on pdx86 for-next, asus-wmi.c has moved to
>   drivers/platform/asus/
> - Change the subject, this adds support for CAMERA_LED_NEG rather than
>   fixing a bug in the driver (Rong)
> - Drop camera_neg_led_set(), so asus::camera has no brightness_set now.
>   The key event already resyncs the LED, and skyedryv's s2idle test
>   showed nothing gets missed while suspended (Jos=C3=A9, Rong)
> - "Returns" -> "Returns:" in the camera_neg_led_sync() comment (Ilpo)
> - Kept Ilpo's Reviewed-by since the only code change is dropping the
>   set callback
> - Rong's idea of also sending brightness_hw_changed on machines that
>   have both CAMERA_LED and CAMERA_LED_NEG is left for a follow-up, I
>   only have the UX5406SA to test with
> - Link to v4: https://patch.msgid.link/20261019-asus-wmi-camera-led-v4-1-=
7744c125bcc9@turtledev.nz
>=20
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
> Tested v5 on the Zenbook S 14 UX5406SA (BIOS 309), on Fedora's 7.2.15
> kernel with the same change applied: camera key presses keep the LED,
> asus::camera, brightness_hw_changed and the camera output in sync, also
> with nothing reading the brightness attribute, so the key event alone is
> what updates the LED. Writing 0 or 1 to brightness changes nothing.
>=20
> I used Claude while working on this. It helped
> me read through the DSDT, drafted the changes on top of v2 and wrote the
> test scripts. I went through the patch myself and ran the tests on my
> laptop.
> ---
>  drivers/platform/asus/asus-wmi.c           | 63 ++++++++++++++++++++++++=
++++--
>  include/linux/platform_data/x86/asus-wmi.h |  2 +-
>  2 files changed, 61 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asu=
s-wmi.c
> index b33ebdb21aa..991e5b36664 100644
> --- a/drivers/platform/asus/asus-wmi.c
> +++ b/drivers/platform/asus/asus-wmi.c
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
> @@ -2105,6 +2109,43 @@ static int camera_led_set(struct led_classdev *led=
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
.
> + * Nothing else updates the LED, so read it after every camera key event=
.
> + * Registering asus::camera reads it too (via brightness_get), which set=
s the
> + * LED at probe. Setting it is no use, the firmware accepts DEVS on this
> + * device only once per boot.
> + *
> + * Returns: 1 if the camera is disabled (LED lit), 0 if enabled, or -err=
no.
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
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
>  =09scoped_guard(spinlock_irqsave, &asus_ref.lock)
> @@ -2236,11 +2277,17 @@ static int asus_wmi_led_init(struct asus_wmi *asu=
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
> +=09=09} else {
> +=09=09=09asus->camera_led.brightness_get =3D camera_led_get;
> +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> +=09=09}
> =20
>  =09=09rv =3D led_classdev_register(&asus->platform_device->dev,
>  =09=09=09=09=09=09&asus->camera_led);
> @@ -4742,6 +4789,13 @@ static void asus_wmi_handle_event_code(int code, s=
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
> @@ -5219,6 +5273,9 @@ static int asus_wmi_add(struct platform_device *pde=
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
> index 66c7ab35d6c..1f7efaf0984 100644
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
> base-commit: a362539b42193dcdb17f8fba40031a515c53885c
> change-id: 20261017-asus-wmi-camera-led-06a6e05f01e2
>=20
> Best regards,
> -- =20
> Zane Hunt <git@turtledev.nz>
>=20
