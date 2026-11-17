Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794923900;
	b=qLDNW/SyTM0kqVbuo1C7IHOSTbDeXTt4iee4g/QXXOeuUMVqqjdTKRTItgbhf/4CTcuB
	 dVhoaUbrUxFPrFaC1/a/T7Nh5m6uSTD0GWrvHO4JgCrZzUYZcEn0UOIRqqZ8y8DzYjUkl
	 rPC3D54oZ6viZzsAizHH15BBI5CcLdKXai7EkZ01ExhcvOhngUjQgeAyjeOIfK19AvID/
	 icK45ZxVSOhy7m7uZo6RIFra+3je3jJb2wWu1zqTjWkGVcPeBFc4L65AwPCXpKWqa3QPH
	 i6a58ZHHIbt519CXHSEf184A9RDgIhRsuu6awR97FecATAOUs5MsD8J0mh2mUP5Cy1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923900;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=OAnHAfEKufEpwvDS1EQh2CZyy+R6dQeJh+/sGB7EqQk=;
	b=objAh8M4VRQn8kT6Y+q3rzLzsXTJtwKf143+n2ByuR9pS/WVQGSNJbSbNqEZKKLu/MdC
	 Tq83E/zdOWAxU8bb0eQDkNxiSEwJMptwCMGKkGqSwS7kPTrZW8s3dfK/xcWzvbe60L5af
	 p9bS1JOeOS87m5O3B0+A5VnGFTtfnJpM61D9K4Y0kzt0hWlGqrIuSWADsfX/Y5HPxlypM
	 28htzwaZMrdyLcZrEPMYUYYtx0c0RFmCRoTpSIh6UfQWa3uZhZtDy+6RTULVNwP3IJKMP
	 YLZU0oUV5HTN3NSqwde3Ms9Wim5WMk/xaQxOKKHa/7NOrlpITRul6eB/Y4IQCQEywsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=m+iiC+JQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09CB606A333;
	Tue, 17 Nov 2026 13:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09CB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=m+iiC+JQ
ARC-Seal: i=1; a=rsa-sha256; t=1794923876; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jUhS3HOMAC5lBOrUbaecd/+KJ7f7/EhgmuhIVI/8BY/NwlET8dXTyIgrBd/rKfgF07L6QrB/96WpePKUzKWQWEiYDA85YafAjcfsoa9dFSG1klOQlHYotvONltwy0SYEkYqboI8AvP/9u2+hpDkDf0MLfLcRsVHhygGEoxKSFyI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794923876; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OAnHAfEKufEpwvDS1EQh2CZyy+R6dQeJh+/sGB7EqQk=; 
	b=ZnrxcWaErDWMD4o/EBC4Jogc6Uf6btw4YYjd9C0yyfuzdVPGbTitxr1OxrxPg4Cv74xcuhMDkC+gKrhbP8qAZq9JlZhMlTHBMFaPfIv6oqjyumZqnAWY8qj30IE0EB0AjWLwqkxc2YlwYgAOcZJZus+5EIGqABWZNM+K8Fp2EA4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=m+iiC+JQ8nCoxReqgWgqGcJjaVxy7CYsrJRHlKuX0FTXCgHgWFT3HXHkaBDqBiQhykP7tGy1QHWsLjXGBa846RdffE3J/33G3HhB+96jBqHOjUq7S9Yowna5lH2kU6ze8r7Og9MeEHkxkAmwcM8NthmHp2yBwJqo9P08LpukZYw2/3YyhAni1o+Kx2BGMnmcfN4Ytm3n5Fckdwv7okc1uoEs7BoVjAvfmHixSuRJBjRgoqO6m1lvgX09tyh0epYh4NO0PlMb2KcGDA4E+XaeUG04mKis/kH3OIJ8bRRXIltV2tauSqQSQh0Ox9cXpyAiunTCui+DvbzIdgz3Aczbsw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=OAnHAfEKufEpwvDS1EQh2CZyy+R6dQeJh+/sGB7EqQk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794923874411495.00478689166914;
	Tue, 17 Nov 2026 05:57:54 -0800 (PST)
Message-ID: <4c7d100f18820cba7c4fe6f6fe50c6e3324504cc.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on
 Zenbook S14
From: Rong Zhang <i@rong.moe>
To: Denis Benato <denis.benato@linux.dev>, skyedryv <skyedryv@gmail.com>, 
	git@turtledev.nz, Corentin Chary <corentin.chary@gmail.com>, "Luke D.
 Jones"	 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: Devin Bayer <dev@doubly.so>, =?ISO-8859-1?Q?Jos=E9?= Guilherme de
 Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <a35a487b-7932-41f7-bbd5-0d0fad2035c4@linux.dev>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
	 <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
	 <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
	 <a35a487b-7932-41f7-bbd5-0d0fad2035c4@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 21:52:45 +0800
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

Hi Denis,

On Tue, 2026-11-17 at 02:09 +0100, Denis Benato wrote:
> On 11/16/26 13:48, Rong Zhang wrote:
> > Hi All,
> >=20
> > On Wed, 2026-10-21 at 20:34 +0800, Rong Zhang wrote:
> > > Hi Zane, Jos=C3=A9,
> > >=20
> > > Hopefully I am not too late to show up here.
>=20
> Hi all,
>=20
> I have been watching this silently for a while and I think I have a gener=
al
> understanding of the problem...
>=20
> > > Regarding the title, you are not fixing a bug of the driver, but addi=
ng
> > > support for ASUS_WMI_DEVID_CAMERA_LED_NEG.
> > >=20
> > > On Mon, 2026-10-19 at 19:35 +1300, Zane Hunt via B4 Relay wrote:
> > > > From: Zane Hunt <git@turtledev.nz>
> > > >=20
> > > > On some newer Zenbooks (Zenbook S 14 UX5406SA, Zenbook S 16 UM5606W=
A) the
> > > > camera key turns the camera off in firmware, but the LED on the key=
 never
> > > > lights up under Linux. These machines don't have
> > > > ASUS_WMI_DEVID_CAMERA_LED, so asus-wmi never registers asus::camera=
. The
> > > > firmware exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG in=
stead.
> > > >=20
> > > > Reading CAMERA_LED_NEG is what drives the LED: the DSTS handler rea=
ds the
> > > > camera state from the EC and writes it to the LED GPIO before retur=
ning
> > > > it. The set side can't be used, the firmware only accepts DEVS on t=
his
> > > > device once per boot.
> > > >=20
> > > > When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
> > > > asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read =
it
> > > > after every camera key event, sending a brightness_hw_changed event=
.
> > > > Registering the LED reads it as well, which fixes the LED being dar=
k after
> > > > a cold boot with the camera disabled.
> > > I agree with Jos=C3=A9 that the current ignore-anything-but-resync be=
havior
> > > has a weird semantics, especially considering that writing to the
> > > attribute has a side-effect that updates led_cdev->brightness
> > > unconditionally [1].
> > >=20
> > > Unfortunately, errors from an LED driver never reach userspace throug=
h
> > > brightness_store(). Also, not every code path of the LED core prints =
set
> > > errors to kmsg. This is also the default behavior of the LED core whe=
n
> > > neither brightness_set() nor brightness_set_blocking() is implemented=
.
> > > Thus, returning an error here really doesn't make much sense here.
> > >=20
> > > If we really want to ensure the brightness and trigger attributes are
> > > read-only to userspace, consult LED_SYSFS_DISABLE and do not implemen=
t
> > > brightness_set[_blocking]() at all, but do we?
> > >=20
> > > [1]: While the cached brightness never reaches userspace because of t=
he
> > > presence of brightness_get(), it's still... very weird.
> > >=20
> > > > While at it, include <linux/container_of.h>, which this file alread=
y
> > > > relied on.
> > > >=20
> > > > Link: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> > > > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221752
> > > > Assisted-by: Claude:claude-opus-5-5 iasl
> > > > Co-developed-by: Jos=C3=A9 Guilherme de Castro Rodrigues <jose.guil=
herme.cr.bh@gmail.com>
> > > > Signed-off-by: Jos=C3=A9 Guilherme de Castro Rodrigues <jose.guilhe=
rme.cr.bh@gmail.com>
> > > > Signed-off-by: Zane Hunt <git@turtledev.nz>
> > > > ---
> > > > Changes in v4:
> > > > - Keep Jos=C3=A9's Signed-off-by from v2 and add his Co-developed-b=
y
> > > > - Use my full name in the tags
> > > > - Include <linux/container_of.h>
> > > > - Reuse the existing asus::camera registration block, only the
> > > >   handlers and flags differ
> > > > - camera_neg_led_available is now only set when CAMERA_LED is missi=
ng,
> > > >   so asus::camera is always the CAMERA_LED_NEG one when it's set. T=
hat
> > > >   makes the LED_BRIGHT_HW_CHANGED check in the event handler unneed=
ed,
> > > >   so it's gone
> > > > - Drop the explicit read at probe, led_classdev_register() already
> > > >   reads the state through brightness_get
> > > > - Link to v3: https://patch.msgid.link/20261017-asus-wmi-camera-led=
-v3-1-845a82373997@turtledev.nz
> > > >=20
> > > > Changes in v3 (picking up Jos=C3=A9's v2, which had stalled):
> > > > - Rebased on pdx86 for-next
> > > > - Also read CAMERA_LED_NEG at probe, so the LED is right after a co=
ld boot
> > > > - Register a read-only asus::camera LED when only CAMERA_LED_NEG ex=
ists,
> > > >   with brightness_hw_changed on key presses (Ilpo's suggestion on v=
2)
> > > > - Comment on why the read is what updates the LED (also from v2 rev=
iew)
> > > > - v2: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
> > > >=20
> > > > Tested again on the Zenbook S 14 UX5406SA (BIOS 309), on Fedora's 7=
.2.9
> > > > kernel with the same change applied: camera key presses keep the LE=
D,
> > > > asus::camera and the camera output in sync, and with the camera dis=
abled
> > > > and the LED forced off, loading the driver turns the LED back on.
> > > >=20
> > > > I used Claude while working on this. It helped
> > > > me read through the DSDT, drafted the changes on top of v2 and wrot=
e the
> > > > test scripts. I went through the patch myself and ran the tests on =
my
> > > > laptop.
> > > > ---
> > > >  drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++=
++++++++++--
> > > >  include/linux/platform_data/x86/asus-wmi.h |  2 +-
> > > >  2 files changed, 73 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86=
/asus-wmi.c
> > > > index fb1d4a0..93b51c8 100644
> > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > @@ -17,6 +17,7 @@
> > > >  #include <linux/backlight.h>
> > > >  #include <linux/bits.h>
> > > >  #include <linux/cleanup.h>
> > > > +#include <linux/container_of.h>
> > > >  #include <linux/debugfs.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/dmi.h>
> > > > @@ -72,6 +73,8 @@ module_param(fnlock_default, bool, 0444);
> > > >  #define NOTIFY_KBD_TTP=09=09=090xae
> > > >  #define NOTIFY_LID_FLIP=09=09=090xfa
> > > >  #define NOTIFY_LID_FLIP_ROG=09=090xbd
> > > > +#define NOTIFY_CAMERA_TOGGLE_1=09=090x82
> > > > +#define NOTIFY_CAMERA_TOGGLE_2=09=090x85
> > > >  #define NOTIFY_KEYSTONE=09=09=090xb4
> > > > =20
> > > >  #define ASUS_WMI_FNLOCK_BIOS_DISABLED=09BIT(0)
> > > > @@ -312,6 +315,7 @@ struct asus_wmi {
> > > >  =09u32 kbd_rgb_dev;
> > > >  =09bool kbd_rgb_state_available;
> > > >  =09bool oobe_state_available;
> > > > +=09bool camera_neg_led_available;
> > > > =20
> > > >  =09u8 throttle_thermal_policy_mode;
> > > >  =09u32 throttle_thermal_policy_dev;
> > > > @@ -2096,6 +2100,54 @@ static int camera_led_set(struct led_classde=
v *led_cdev,
> > > >  =09return err < 0 ? err : 0;
> > > >  }
> > > > =20
> > > > +static bool is_camera_toggle(int code)
> > > > +{
> > > > +=09return code =3D=3D NOTIFY_CAMERA_TOGGLE_1 || code =3D=3D NOTIFY=
_CAMERA_TOGGLE_2;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Some models (e.g. Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA)=
 have no
> > > > + * ASUS_WMI_DEVID_CAMERA_LED. The firmware handles the camera key =
itself and
> > > > + * only exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG, a=
nd reading
> > > > + * that has a side effect: the firmware copies the state to the LE=
D GPIO.
> > > > + * Nothing else updates the LED, so read it after every camera key=
 event.
> > > > + * Registering asus::camera reads it too (via brightness_get), whi=
ch sets the
> > > > + * LED at probe. Setting it is no use, the firmware accepts DEVS o=
n this
> > > > + * device only once per boot.
> > > > + *
> > > > + * Returns 1 if the camera is disabled (LED lit), 0 if enabled, or=
 -errno.
> > > > + */
> > > > +static int camera_neg_led_sync(struct asus_wmi *asus)
> > > > +{
> > > > +=09u32 result;
> > > > +=09int err;
> > > > +
> > > > +=09err =3D asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_N=
EG, &result);
> > > > +=09if (err)
> > > > +=09=09return err;
> > > > +
> > > > +=09return !(result & ASUS_WMI_DSTS_STATUS_BIT);
> > > > +}
> > > > +
> > > > +static enum led_brightness camera_neg_led_get(struct led_classdev =
*led_cdev)
> > > > +{
> > > > +=09struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wm=
i, camera_led);
> > > > +=09int state =3D camera_neg_led_sync(asus);
> > > > +
> > > > +=09return state < 0 ? LED_OFF : state;
> > > > +}
> > > > +
> > > > +/* The firmware owns this LED; a write just resyncs it with the ca=
mera state. */
> > > > +static int camera_neg_led_set(struct led_classdev *led_cdev,
> > > > +=09=09=09      enum led_brightness brightness)
> > > > +{
> > > > +=09struct asus_wmi *asus =3D container_of(led_cdev, struct asus_wm=
i, camera_led);
> > > > +
> > > > +=09if (!(led_cdev->flags & LED_UNREGISTERING))
> > > > +=09=09camera_neg_led_sync(asus);
> > > > +=09return 0;
> > > > +}
> > > I agree with Jos=C3=A9 that this should be unnecessary considering th=
at
> > > asus_wmi_handle_event_code() has handled the event.
> > >=20
> > > Still, could you confirm whether pressing the camera key during s2idl=
e
> > > toggles the camera state without emitting a WMI event or not? If so, =
a
> > > resync should be performed on resume.
> > skyedryv tested this on their device, see
> > https://msgid.link/CA+Bqb3R2ZCrZZr6pUqLmw3qXMSA13Ft3nYqCx7jv+5PDEuH0uw@=
mail.gmail.com
> >=20
> > According to the result, camera_neg_led_set() should be completely
> > useless. I'd prefer to remove it.
> >=20
> > We don't need to set LED_SYSFS_DISABLE either. There has been a lot of
> > get-only LED drivers, none of them sets it.
> >=20
> > As for my proposal...
>=20
> I agree here.
>=20
> I would throw an idea, perhaps not the best one but I want to hear what y=
ou think:
> what if you setup a kthread that periodically sync the device?

My two cents: as long as the device properly emits WMI notifications
whenever the camera key is pressed, doing so is more like an expensive
no-op.

From my experience, it could be very tricky to actively evaluate ACPI
methods (including WMI methods) periodically. The consequence really
depends on how broken (or not) the firmware is, as it's not uncommon for
manufacturers to mess things up.

>=20
> > > If there is really a need to preserve the manual resync functionality=
,
> > > it'd be better to use custom LED attributes to achieve sensible
> > > semantics, see led_cdev->groups.
> > >=20
> > > > +
> > > >  static void asus_wmi_led_exit(struct asus_wmi *asus)
> > > >  {
> > > >  =09scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > > > @@ -2227,11 +2279,18 @@ static int asus_wmi_led_init(struct asus_wm=
i *asus)
> > > >  =09=09=09goto error;
> > > >  =09}
> > > > =20
> > > > -=09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
> > > > +=09if (asus->camera_neg_led_available ||
> > > > +=09    asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
> > > >  =09=09asus->camera_led.name =3D "asus::camera";
> > > >  =09=09asus->camera_led.max_brightness =3D 1;
> > > > -=09=09asus->camera_led.brightness_get =3D camera_led_get;
> > > > -=09=09asus->camera_led.brightness_set_blocking =3D camera_led_set;
> > > > +=09=09if (asus->camera_neg_led_available) {
> > > > +=09=09=09asus->camera_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > > > +=09=09=09asus->camera_led.brightness_get =3D camera_neg_led_get;
> > > > +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_neg_l=
ed_set;
> > > > +=09=09} else {
> > > > +=09=09=09asus->camera_led.brightness_get =3D camera_led_get;
> > > > +=09=09=09asus->camera_led.brightness_set_blocking =3D camera_led_s=
et;
> > > > +=09=09}
> > > > =20
> > > >  =09=09rv =3D led_classdev_register(&asus->platform_device->dev,
> > > >  =09=09=09=09=09=09&asus->camera_led);
> > > > @@ -4733,6 +4792,13 @@ static void asus_wmi_handle_event_code(int c=
ode, struct asus_wmi *asus)
> > > >  =09if (is_display_toggle(code) && asus->driver->quirks->no_display=
_toggle)
> > > >  =09=09return;
> > > > =20
> > > > +=09if (is_camera_toggle(code) && asus->camera_neg_led_available) {
> > > > +=09=09int state =3D camera_neg_led_sync(asus);
> > > > +
> > > > +=09=09if (state >=3D 0)
> > > > +=09=09=09led_classdev_notify_brightness_hw_changed(&asus->camera_l=
ed, state);
> > > > +=09}
> > > > +
> > > >  =09if (!sparse_keymap_report_event(asus->inputdev, code,
> > > >  =09=09=09=09=09key_value, autorelease))
> > > >  =09=09pr_info("Unknown key code 0x%x\n", code);
> > > > @@ -5210,6 +5276,9 @@ static int asus_wmi_add(struct platform_devic=
e *pdev)
> > > >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> > > > =20
> > > >  =09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, AS=
US_WMI_DEVID_OOBE);
> > > > +=09asus->camera_neg_led_available =3D
> > > > +=09=09!asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) &&
> > > > +=09=09asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG)=
;
> > > When a device has both ASUS_WMI_DEVID_CAMERA_LED and
> > > ASUS_WMI_DEVID_CAMERA_LED_NEG implemented, camera_neg_led_available i=
s
> > > false and the LED device can't benefit from brightness_hw_changed.
>=20
> Does such device even exists? Can it exists?

(+CC Devin)

Both macros were added together, i.e., in commit 4bf1ea3fc914
("platform/x86: asus-wmi: support the disable camera LED on F10 of
Zenbook 2023") for Zenbook UX3404VC, so I assume it has both implemented.

Plus, the name "_NEG" sounds like it was concluded through trial-and-
error.

I suspect that the two devids were defined for different purposes, i.e.,
0x00060078 for notification and 0x00060079 for query.

>=20
> > > It'd be better to decouple the brightness_hw_changed path from
> > > !ASUS_WMI_DEVID_CAMERA_LED, since devices with both IDs should be abl=
e to
> > > emit the WMI event.
> > >=20
> > > With that, how about adding a wrapper function that dispatches call t=
o
> > > either asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED) or
> > > asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED_NEG) according to the
> > > IDs' presence? Then you can share the same brightness_hw_changed path=
 by
> > > calling the wrapper function and eliminate the need of adding a dedic=
ated
> > > brightness_get() callback in the same manner.
>=20
> I'm not understanding this: first the discussion moves toward "what if on=
e
> device has both" and then you ask about reusing the code for the non-neg
> dev id.... What am I missing here?

Because I assume such devices exist. Perhaps Devin can give us some
clues...

>=20
> > > IOW, the presence of ASUS_WMI_DEVID_CAMERA_LED determines the
> > > availability of brightness_set_blocking(), and
> > > ASUS_WMI_DEVID_CAMERA_LED_NEG determines brightness_hw_changed. The
> > > brightness_get() callback is the same thanks to the wrapper function.
> > ...it can be implemented in a follow-up series if you don't want to mak=
e
> > the next revision too complicated.
> >=20
> > As long as camera_neg_led_set() is gone, I will be OK with the patch.
>=20
> Pretty much the same, but if you find evidence that windows is polling
> that devid I think we should be doing the same.

Not necessarily. If handling the notification has made it functional as
expected, we don't need to replicate the behavior of Windows
drivers/utilities everywhere.

Thanks,
Rong

>=20
> Anyway thank you all for taking care of this :)
>=20
> Sorry for my delay, I will try to be more present now that I have some
> context.
>=20
> Best regards,
> Denis
>=20
> > Thanks,
> > Rong
> >=20
> > > Thanks,
> > > Rong
> > >=20
> > > > =20
> > > >  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERM=
AL_POLICY))
> > > >  =09=09asus->throttle_thermal_policy_dev =3D ASUS_WMI_DEVID_THROTTL=
E_THERMAL_POLICY;
> > > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/l=
inux/platform_data/x86/asus-wmi.h
> > > > index 4ea1ccc..5964063 100644
> > > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > > @@ -57,7 +57,7 @@
> > > >  #define ASUS_WMI_DEVID_MUTE_LED=090x0004001C
> > > > =20
> > > >  /* Disable Camera LED */
> > > > -#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on (un=
used) */
> > > > +#define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on */
> > > >  #define ASUS_WMI_DEVID_CAMERA_LED=090x00060079 /* 1 =3D on */
> > > > =20
> > > >  /* Backlight and Brightness */
> > > >=20
> > > > ---
> > > > base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
> > > > change-id: 20261017-asus-wmi-camera-led-06a6e05f01e2
> > > >=20
> > > > Best regards,
> > > > -- =20
> > > > Zane Hunt <git@turtledev.nz>
> > > >=20
