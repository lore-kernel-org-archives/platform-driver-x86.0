Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794833675;
	b=Bwsvf/npk/2gqlW2W1dFqSFEQELUSWPOz/p7JvYPukfqtRHhhfc8MoldUMb0dUK1bC9L
	 +SZNAAHGdHIyMThNg68fjzH2YG8pt4T/N82o3bUbqjDSGpD82KxcFoVTi+ovlXsk5f71u
	 tKZFuhwjFY17Zn04ptXbvYlf461O90BTMJ0GN4wjMIkSfQlJIYhh2Fql++I+xZ1+Uta37
	 prgosKS5OPaBRZ6eJAiluXgnfPUtI5SbXZ5peTM9mZvx0b6vVjjYOgq4W5WRb8IYvzNiw
	 l7u97RozsncFDjDCGdTGkw4Ng+HsSxD5Q4IMR5hwbwTh0D2pBIA90ypG9t8DX+irT4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833675;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=5gt6Q9JpMjszwSgzJMPF75yNoCNec43vgGA2o+i5b/k=;
	b=UOORG7nco5IDFnazZvDym0kCbkF4FG3sgE9nyQppNNHEm5cmW4NGU7RL++6xvboAF2ck
	 g0XNBigXCU0v2ZXBhO9cOr5iBtxDlXgZJMQsZV2lzg6aSkU8Twg/kcr9G3gkzwk4tNsL4
	 byLxoNEkWy9l9uCV5RJAAcEmzPGnj5FvO1mbswfTQ/BC+J+4xo52UlkhjWJf6CmdXXA/Z
	 HGmCQLpDw3Me5XpC/JhNBXPD072CsyEjE8AH/hcGh4+bdzP/ayyq3rtzQ1AJ9eadvlFUq
	 a0Qtk/savNGpkDMzh66w0zJbki8jKnNragRsvH03+y89BZU9+mDkGG43h489yDeDO/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=cqNEJfsG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD2606A31C;
	Mon, 16 Nov 2026 12:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=cqNEJfsG
ARC-Seal: i=1; a=rsa-sha256; t=1794833636; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FybOP42WAEajefF/dltzLUpQ6OXACqA+W7v/fSmPEY9UJqbkhTcJOnaSOuc3cRXzV4NhJdv5ktCXwFZVyIY3zMY8rNbtmKQKrHAG7HL3vme2CxHoWrSDhk18wAdg0XJXgPmlf2x+CBvpCKoHjI5mhOJTeJFcIxaxbc0dImBa3Mg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794833636; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5gt6Q9JpMjszwSgzJMPF75yNoCNec43vgGA2o+i5b/k=; 
	b=QAek5tS1MLZkMVZphBKgTbSSaSBjuVrhBcyoGLqqgjRbBgrelz7NAsJzXQOycNbLAUELAnYJBI/8ORTa+bah/NVzJdptZFZiatowoamrynQLDX7JGV1eARhg8+mDwVWca/dmS5Fycgzw2Hw+lkCtEzoSsjwxPf7HVn8Wlw4TEh4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=cqNEJfsGSzlJkrwGmymMwLAOaDfxeXvsp2X1fj8rM2j4GonIsFD0BJLb+ap4oRmxB6JPQ7ChcLSM2+DEuhG32tV1qAfAcwWcqoweC7C3b6WkDujhVRfWkQeCOfiSxWKmB/sgx0Nee+/ED/WmzcXcIHeHpzhXNOKiBstIpqv24+WT444bTwL+wQPnRnK3hoZkRBmGUmt7sW8+PHILTKANQkI3e6AQGyIcRc6oSKouugzcmz2KWu6cpDfKxX0hdKnReONmp3O7I2ol6n/JuvhGClDJv5o+Za0isX06jAoFscIO3+4spHevN+VKm+9Y5MVzAr4AtLULUnsIpPvbXO/4kg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=5gt6Q9JpMjszwSgzJMPF75yNoCNec43vgGA2o+i5b/k=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794833626105531.9681182815148;
	Mon, 16 Nov 2026 04:53:46 -0800 (PST)
Message-ID: <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on
 Zenbook S14
From: Rong Zhang <i@rong.moe>
To: skyedryv <skyedryv@gmail.com>, git@turtledev.nz, Corentin Chary	
 <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato
	 <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues
	 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
	 <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 20:48:39 +0800
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

Hi All,

On Wed, 2026-10-21 at 20:34 +0800, Rong Zhang wrote:
> Hi Zane, Jos=C3=A9,
>=20
> Hopefully I am not too late to show up here.
>=20
> Regarding the title, you are not fixing a bug of the driver, but adding
> support for ASUS_WMI_DEVID_CAMERA_LED_NEG.
>=20
> On Mon, 2026-10-19 at 19:35 +1300, Zane Hunt via B4 Relay wrote:
> > From: Zane Hunt <git@turtledev.nz>
> >=20
> > On some newer Zenbooks (Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) t=
he
> > camera key turns the camera off in firmware, but the LED on the key nev=
er
> > lights up under Linux. These machines don't have
> > ASUS_WMI_DEVID_CAMERA_LED, so asus-wmi never registers asus::camera. Th=
e
> > firmware exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG instea=
d.
> >=20
> > Reading CAMERA_LED_NEG is what drives the LED: the DSTS handler reads t=
he
> > camera state from the EC and writes it to the LED GPIO before returning
> > it. The set side can't be used, the firmware only accepts DEVS on this
> > device once per boot.
> >=20
> > When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
> > asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read it
> > after every camera key event, sending a brightness_hw_changed event.
> > Registering the LED reads it as well, which fixes the LED being dark af=
ter
> > a cold boot with the camera disabled.
>=20
> I agree with Jos=C3=A9 that the current ignore-anything-but-resync behavi=
or
> has a weird semantics, especially considering that writing to the
> attribute has a side-effect that updates led_cdev->brightness
> unconditionally [1].
>=20
> Unfortunately, errors from an LED driver never reach userspace through
> brightness_store(). Also, not every code path of the LED core prints set
> errors to kmsg. This is also the default behavior of the LED core when
> neither brightness_set() nor brightness_set_blocking() is implemented.
> Thus, returning an error here really doesn't make much sense here.
>=20
> If we really want to ensure the brightness and trigger attributes are
> read-only to userspace, consult LED_SYSFS_DISABLE and do not implement
> brightness_set[_blocking]() at all, but do we?
>=20
> [1]: While the cached brightness never reaches userspace because of the
> presence of brightness_get(), it's still... very weird.
>=20
> >=20
> > While at it, include <linux/container_of.h>, which this file already
> > relied on.
> >=20
> > Link: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221752
> > Assisted-by: Claude:claude-opus-5-5 iasl
> > Co-developed-by: Jos=C3=A9 Guilherme de Castro Rodrigues <jose.guilherm=
e.cr.bh@gmail.com>
> > Signed-off-by: Jos=C3=A9 Guilherme de Castro Rodrigues <jose.guilherme.=
cr.bh@gmail.com>
> > Signed-off-by: Zane Hunt <git@turtledev.nz>
> > ---
> > Changes in v4:
> > - Keep Jos=C3=A9's Signed-off-by from v2 and add his Co-developed-by
> > - Use my full name in the tags
> > - Include <linux/container_of.h>
> > - Reuse the existing asus::camera registration block, only the
> >   handlers and flags differ
> > - camera_neg_led_available is now only set when CAMERA_LED is missing,
> >   so asus::camera is always the CAMERA_LED_NEG one when it's set. That
> >   makes the LED_BRIGHT_HW_CHANGED check in the event handler unneeded,
> >   so it's gone
> > - Drop the explicit read at probe, led_classdev_register() already
> >   reads the state through brightness_get
> > - Link to v3: https://patch.msgid.link/20261017-asus-wmi-camera-led-v3-=
1-845a82373997@turtledev.nz
> >=20
> > Changes in v3 (picking up Jos=C3=A9's v2, which had stalled):
> > - Rebased on pdx86 for-next
> > - Also read CAMERA_LED_NEG at probe, so the LED is right after a cold b=
oot
> > - Register a read-only asus::camera LED when only CAMERA_LED_NEG exists=
,
> >   with brightness_hw_changed on key presses (Ilpo's suggestion on v2)
> > - Comment on why the read is what updates the LED (also from v2 review)
> > - v2: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> >=20
> > Tested again on the Zenbook S 14 UX5406SA (BIOS 309), on Fedora's 7.2.9
> > kernel with the same change applied: camera key presses keep the LED,
> > asus::camera and the camera output in sync, and with the camera disable=
d
> > and the LED forced off, loading the driver turns the LED back on.
> >=20
> > I used Claude while working on this. It helped
> > me read through the DSDT, drafted the changes on top of v2 and wrote th=
e
> > test scripts. I went through the patch myself and ran the tests on my
> > laptop.
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++=
++++++--
> >  include/linux/platform_data/x86/asus-wmi.h |  2 +-
> >  2 files changed, 73 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index fb1d4a0..93b51c8 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/backlight.h>
> >  #include <linux/bits.h>
> >  #include <linux/cleanup.h>
> > +#include <linux/container_of.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/delay.h>
> >  #include <linux/dmi.h>
> > @@ -72,6 +73,8 @@ module_param(fnlock_default, bool, 0444);
> >  #define NOTIFY_KBD_TTP=09=09=090xae
> >  #define NOTIFY_LID_FLIP=09=09=090xfa
> >  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> > +#define NOTIFY_CAMERA_TOGGLE_1=09=090x82
> > +#define NOTIFY_CAMERA_TOGGLE_2=09=090x85
> >  #define NOTIFY_KEYSTONE=09=09=090xb4
> > =20
> >  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> > @@ -312,6 +315,7 @@ struct asus_wmi {
> >  =09u32 kbd_rgb_dev;
> >  =09bool kbd_rgb_state_available;
> >  =09bool oobe_state_available;
> > +=09bool camera_neg_led_available;
> > =20
> >  =09u8 throttle_thermal_policy_mode;
> >  =09u32 throttle_thermal_policy_dev;
> > @@ -2096,6 +2100,54 @@ static int camera_led_set(struct led_classdev *l=
ed_cdev,
> >  =09return err < 0 ? err : 0;
> >  }
> > =20
> > +static bool is_camera_toggle(int code)
> > +{
> > +=09return code =3D=3D NOTIFY_CAMERA_TOGGLE_1 || code =3D=3D NOTIFY_CAM=
ERA_TOGGLE_2;
> > +}
> > +
> > +/*
> > + * Some models (e.g. Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) hav=
e no
> > + * ASUS_WMI_DEVID_CAMERA_LED. The firmware handles the camera key itse=
lf and
> > + * only exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG, and r=
eading
> > + * that has a side effect: the firmware copies the state to the LED GP=
IO.
> > + * Nothing else updates the LED, so read it after every camera key eve=
nt.
> > + * Registering asus::camera reads it too (via brightness_get), which s=
ets the
> > + * LED at probe. Setting it is no use, the firmware accepts DEVS on th=
is
> > + * device only once per boot.
> > + *
> > + * Returns 1 if the camera is disabled (LED lit), 0 if enabled, or -er=
rno.
> > + */
> > +static int camera_neg_led_sync(struct asus_wmi *asus)
> > +{
> > +=09u32 result;
> > +=09int err;
> > +
> > +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, =
&result);
> > +=09if (err)
> > +=09=09return err;
> > +
> > +=09return !(result & ASUS_WMI_DSTS_STATUS_BIT);
> > +}
> > +
> > +static enum led_brightness camera_neg_led_get(struct led_classdev *led=
_cdev)
> > +{
> > +=09struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wmi, c=
amera_led);
> > +=09int state =3D camera_neg_led_sync(asus);
> > +
> > +=09return state < 0 ? LED_OFF : state;
> > +}
> > +
> > +/* The firmware owns this LED; a write just resyncs it with the camera=
 state. */
> > +static int camera_neg_led_set(struct led_classdev *led_cdev,
> > +=09=09=09      enum led_brightness brightness)
> > +{
> > +=09struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wmi, c=
amera_led);
> > +
> > +=09if (!(led_cdev->flags & LED_UNREGISTERING))
> > +=09=09camera_neg_led_sync(asus);
> > +=09return 0;
> > +}
>=20
> I agree with Jos=C3=A9 that this should be unnecessary considering that
> asus_wmi_handle_event_code() has handled the event.
>=20
> Still, could you confirm whether pressing the camera key during s2idle
> toggles the camera state without emitting a WMI event or not? If so, a
> resync should be performed on resume.

skyedryv tested this on their device, see
https://msgid.link/CA+Bqb3R2ZCrZZr6pUqLmw3qXMSA13Ft3nYqCx7jv+5PDEuH0uw@mail=
.gmail.com

According to the result, camera_neg_led_set() should be completely
useless. I'd prefer to remove it.

We don't need to set LED_SYSFS_DISABLE either. There has been a lot of
get-only LED drivers, none of them sets it.

As for my proposal...

>=20
> If there is really a need to preserve the manual resync functionality,
> it'd be better to use custom LED attributes to achieve sensible
> semantics, see led_cdev->groups.
>=20
> > +
> >  static void asus_wmi_led_exit(struct asus_wmi *asus)
> >  {
> >  =09scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > @@ -2227,11 +2279,18 @@ static int asus_wmi_led_init(struct asus_wmi *a=
sus)
> >  =09=09=09goto error;
> >  =09}
> > =20
> > -=09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
> > +=09if (asus->camera_neg_led_available ||
> > +=09    asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
> >  =09=09asus->camera_led.name =3D "asus::camera";
> >  =09=09asus->camera_led.max_brightness =3D 1;
> > -=09=09asus->camera_led.brightness_get =3D camera_led_get;
> > -=09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> > +=09=09if (asus->camera_neg_led_available) {
> > +=09=09=09asus->camera_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > +=09=09=09asus->camera_led.brightness_get =3D camera_neg_led_get;
> > +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_neg_led_s=
et;
> > +=09=09} else {
> > +=09=09=09asus->camera_led.brightness_get =3D camera_led_get;
> > +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> > +=09=09}
> > =20
> >  =09=09rv =3D led_classdev_register(&asus->platform_device->dev,
> >  =09=09=09=09=09=09&asus->camera_led);
> > @@ -4733,6 +4792,13 @@ static void asus_wmi_handle_event_code(int code,=
 struct asus_wmi *asus)
> >  =09if (is_display_toggle(code) && asus->driver->quirks->no_display_tog=
gle)
> >  =09=09return;
> > =20
> > +=09if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> > +=09=09int state =3D camera_neg_led_sync(asus);
> > +
> > +=09=09if (state >=3D 0)
> > +=09=09=09led_classdev_notify_brightness_hw_changed(&asus->camera_led, =
state);
> > +=09}
> > +
> >  =09if (!sparse_keymap_report_event(asus->inputdev, code,
> >  =09=09=09=09=09key_value, autorelease))
> >  =09=09pr_info("Unknown key code 0x%x\n", code);
> > @@ -5210,6 +5276,9 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> > =20
> >  =09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_W=
MI_DEVID_OOBE);
> > +=09asus->camera_neg_led_available =3D
> > +=09=09!asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) &&
> > +=09=09asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);
>=20
> When a device has both ASUS_WMI_DEVID_CAMERA_LED and
> ASUS_WMI_DEVID_CAMERA_LED_NEG implemented, camera_neg_led_available is
> false and the LED device can't benefit from brightness_hw_changed.
>=20
> It'd be better to decouple the brightness_hw_changed path from
> !ASUS_WMI_DEVID_CAMERA_LED, since devices with both IDs should be able to
> emit the WMI event.
>=20
> With that, how about adding a wrapper function that dispatches call to
> either asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED) or
> asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED_NEG) according to the
> IDs' presence? Then you can share the same brightness_hw_changed path by
> calling the wrapper function and eliminate the need of adding a dedicated
> brightness_get() callback in the same manner.
>=20
> IOW, the presence of ASUS_WMI_DEVID_CAMERA_LED determines the
> availability of brightness_set_blocking(), and
> ASUS_WMI_DEVID_CAMERA_LED_NEG determines brightness_hw_changed. The
> brightness_get() callback is the same thanks to the wrapper function.

...it can be implemented in a follow-up series if you don't want to make
the next revision too complicated.

As long as camera_neg_led_set() is gone, I will be OK with the patch.

Thanks,
Rong

>=20
> Thanks,
> Rong
>=20
> > =20
> >  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_P=
OLICY))
> >  =09=09asus->throttle_thermal_policy_dev =3D ASUS_WMI_DEVID_THROTTLE_TH=
ERMAL_POLICY;
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux=
/platform_data/x86/asus-wmi.h
> > index 4ea1ccc..5964063 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -57,7 +57,7 @@
> >  #define ASUS_WMI_DEVID_MUTE_LED=090x0004001C
> > =20
> >  /* Disable Camera LED */
> > -#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on (unused=
) */
> > +#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on */
> >  #define ASUS_WMI_DEVID_CAMERA_LED=090x00060079 /* 1 =3D on */
> > =20
> >  /* Backlight and Brightness */
> >=20
> > ---
> > base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
> > change-id: 20261017-asus-wmi-camera-led-06a6e05f01e2
> >=20
> > Best regards,
> > -- =20
> > Zane Hunt <git@turtledev.nz>
> >=20
