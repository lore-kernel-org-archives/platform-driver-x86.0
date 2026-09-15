Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28254344046;
	Tue, 15 Sep 2026 23:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514427; cv=none; b=T0/unUuaUxcVtgaJmvy29I6S3K3BfwnsKqrH0EemdYtNziwCCWHsknadB2SvJD3X4hfQywJ+HJDmw+ChsTMpPN88lKHJM8eyBNrWLFiot4RwBsnpQ9xiJ5tCm0a5aF7pNXjURK0qPibTb5Qz9Mz28f41eEePCWFhdkefFoHNCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514427; c=relaxed/simple;
	bh=gnYPtB9XFBaFYGFCEYHuAIVKpq7CyroT6AFp7THJido=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UT3jne7WH5s6QFtqjVP/iTBkBA20/UUhJ3IhKLWbGP/8S1S1D1ulkgNIcoS+DQUAhiXcWsmK+UgXgikkv0Zp6x2S6jrOry7diKlo2PvROZhVnNHZ0NcE8grnqIhJxlfO9KHFIvectFgKitzT2Ww+Ditfetg2wANneq5cIhg74Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVg9HRb1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVg9HRb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514425; x=1821050425;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gnYPtB9XFBaFYGFCEYHuAIVKpq7CyroT6AFp7THJido=;
  b=VVg9HRb1LRGJ31xK5+buD1aJb+72sQ9xn+WvrIGfUWy3tPeTfrhVsKLP
   m9i+Z/bkV6ulxXE8hjhl50y2CdenAFiDV7JLcapkLicfvOw30u692eI38
   wDdYRP46nTWmX21pwrY2YaIURZYsIXXrjd/Sc8cUPlK2JlxK9cgU3Uih2
   OfvG7P2E0GEjXI+toizAFvv/330s9CmQlUQ44qgzxh/671S80qLZqdw6V
   52o6lMNUMGbCKCbNI6YXMkMLbkREKpcChHF8km6PeigqkJ6zk/cCGVYhm
   eNJcfePHBa75uNQ/OwS/gpzSnzZFd3iy57JKe7eaM/chPXkeeq1+3XkFs
   A==;
X-CSE-ConnectionGUID: jmscT9hLQnKtr9pnIIeq1w==
X-CSE-MsgGUID: YfIex6BMRHS0KImwXX+Qqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90027130"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90027130"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:20:24 -0700
X-CSE-ConnectionGUID: f93Wam1jQa69+CQgMQOoRw==
X-CSE-MsgGUID: cu3Xw4c/TSm9sLfphy1+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296658724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:20:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Sep 2026 02:20:20 +0300 (EEST)
To: =?KOI8-R?B?68/Oxc7LzyDhzsTSxcog98nL1M/Sz9fJ3g==?= <admin@aquinas.su>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v11] platform/x86: hp-wmi: Add multicolor LED support
 for HP keyboard backlight
In-Reply-To: <b667bdb7-1820-8f5f-9ca9-a34ab84b93bf@linux.intel.com>
Message-ID: <e5f89934-2e0b-bf05-d571-b02622300595@linux.intel.com>
References: <0Ja9VPr1QTSihXZrbKAgzg@aquinas.su> <b667bdb7-1820-8f5f-9ca9-a34ab84b93bf@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1293466110-1789514420=:29492"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1293466110-1789514420=:29492
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Sep 2026, Ilpo J=C3=A4rvinen wrote:

> On Mon, 14 Sep 2026, =D0=9A=D0=BE=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE =D0=90=D0=
=BD=D0=B4=D1=80=D0=B5=D0=B9 =D0=92=D0=B8=D0=BA=D1=82=D0=BE=D1=80=D0=BE=D0=
=B2=D0=B8=D1=87 wrote:
>=20
> > Add support for the HP keyboard RGB backlight found on HP OMEN and
> > HP Victus laptops. These keyboards expose per-zone RGB control through
> > WMI commands.
> >=20
> > Register multicolor LED class devices for each keyboard zone (up to 4
> > zones, depending on the keyboard type). Each zone exposes individual
> > red, green, and blue channels via the multicolor LED subsystem.
> >=20
> > Also hardware-initiated brightness changes (e.g. via the keyboard
> > backlight hotkey, mostly fn+f4) are reported.
> >=20
> > The color data is stored in a 128-byte color table managed by the
> > firmware, with RGB values starting at offset 25, packed sequentially
> > per zone.
> >=20
> > Signed-off-by: Konenko Andrey Viktorovich <admin@aquinas.su>
> >=20
> > ---
> > Changes since v10:
> >  - adapted for current linux-next (20260914)
> >  - Added Named Constants:
> > =09HP_BACKLIGHT_EVENT_ON =E2=80=94 replaces magic number for backlight =
enable event
> > =09HP_BACKLIGHT_EVENT_OFF =E2=80=94 replaces magic number for backlight=
 disable event
> > =09HP_KBD_RGB_COLORS =E2=80=94 replaces universally used literal 3 as R=
GB color/channel count
> >  - Refactored hp_kbd_brightness_set_by_hwd Function - Eliminated relian=
ce on magic numbers in event handling logic (bugfix)
> >  - Event Filtering (critical bugfix):
> > =09Added event type filtering in hp_wmi_notify() before calling hp_kbd_=
brightness_set_by_hwd()
> > =09This prevents EC flooding and keyboard malfunction on some devices
> >=20
> > Changes since v9:
> >  - Fixed corrupted long lines
> >  - Fixed changelog
> >=20
> > Changes since v8:
> >  - No changes (It was mistake to resend email without any fix)
> >=20
> > Changes since v7:
> >  - The LED class device names changed to be consistent with the documen=
tation.
> >=20
> > Changes since v6:
> >  - The LED class device names have been made more consistent with the=
=20
> > documentation, in accordance with patch https://lore.kernel.org/linux-l=
eds/
> > 20260504145434.12746-1-johannes.goede@oss.qualcomm.com/
> > underscores have been replaced with dashes where indicated.
> >=20
> > Changes since v5:
> >  - LED class device names changed from a number to using a descriptive =
name=20
> > for each zone.
> >=20
> > v4: https://lore.kernel.org/all/20260303084022.7223-3-edip@medip.dev/
> >=20
> > Changes since v4:
> >  - Fix circular dependencies
> >=20
> > Changes since v3:
> >  - Merge the changes into a single commit
> >=20
> > Changes since v1:
> >  - Fix mentioned style errors
> >  - Add Kconfig dependencies
> >=20
> > ---
> >  drivers/platform/x86/hp/Kconfig  |   2 +
> >  drivers/platform/x86/hp/hp-wmi.c | 298 ++++++++++++++++++++++++++++++-
> >  2 files changed, 299 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/=
Kconfig
> > index dd51491b9bcd..2a1841cbec76 100644
> > --- a/drivers/platform/x86/hp/Kconfig
> > +++ b/drivers/platform/x86/hp/Kconfig
> > @@ -45,6 +45,8 @@ config HP_WMI
> >  =09select INPUT_SPARSEKMAP
> >  =09select ACPI_PLATFORM_PROFILE
> >  =09select HWMON
> > +=09select LEDS_CLASS
> > +=09select LEDS_CLASS_MULTICOLOR
> >  =09help
> >  =09  Say Y here if you want to support WMI-based hotkeys on HP laptops=
 and
> >  =09  to read data from WMI such as docking or ambient light sensor sta=
te.
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 615b4cf6fc45..cf57b6b00b01 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -28,6 +28,8 @@
> >  #include <linux/kstrtox.h>
> >  #include <linux/limits.h>
> >  #include <linux/minmax.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/leds.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> > @@ -61,6 +63,10 @@ enum hp_ec_offsets {
> >  #define HP_FAN_SPEED_AUTOMATIC=09 0x00
> >  #define HP_POWER_LIMIT_DEFAULT=09 0x00
> >  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> > +#define HP_COLOR_TABLE_PADDING  25
> > +#define HP_BACKLIGHT_EVENT_ON   0x2
> > +#define HP_BACKLIGHT_EVENT_OFF  0x0
> > +#define HP_KBD_RGB_COLORS       3
> >  #define HPWMI_MUX_MODE_UMA=09=09BIT(0)
> >  #define HPWMI_MUX_MODE_HYBRID=09=09BIT(1)
> >  #define HPWMI_MUX_MODE_DISCRETE=09=09BIT(2)
> > @@ -106,6 +112,14 @@ enum hp_thermal_profile {
> >  =09HP_THERMAL_PROFILE_QUIET=09=09=09=3D 0x03,
> >  };
> > =20
> > +enum hp_keyboard_type {
> > +=09HP_KEYBOARD_TYPE_NOBACKLIGHT=09=09=3D 0x0,
> > +=09HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD=09=3D 0x1,
> > +=09HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD=09=3D 0x2,
> > +=09HP_KEYBOARD_TYPE_RGB_PER_KEY=09=09=3D 0x3,
> > +=09HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD=09=3D 0x4,
> > +=09HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD=09=3D 0x5,
> > +};
> > =20
> >  struct thermal_profile_params {
> >  =09u8 performance;
> > @@ -433,16 +447,27 @@ enum hp_wmi_gm_commandtype {
> >  =09HPWMI_GET_GPU_THERMAL_MODES_QUERY=09=3D 0x21,
> >  =09HPWMI_SET_GPU_THERMAL_MODES_QUERY=09=3D 0x22,
> >  =09HPWMI_SET_POWER_LIMITS_QUERY=09=09=3D 0x29,
> > +=09HPWMI_GET_KEYBOARD_TYPE_QUERY=09=09=3D 0x2b,
> >  =09HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY=09=3D 0x2D,
> >  =09HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY=09=3D 0x2E,
> >  =09HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY=09=3D 0x2F,
> >  };
> > =20
> > +enum hp_wmi_backlight_commandtype {
> > +=09HPWMI_BACKLIGHT_COLOR_GET_QUERY=09=09=3D 0x02,
> > +=09HPWMI_BACKLIGHT_COLOR_SET_QUERY=09=09=3D 0x03,
> > +=09HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY=09=3D 0x04,
> > +=09HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY=09=3D 0x05,
> > +=09HPWMI_BACKLIGHT_SET_OFF_QUERY=09=09=3D 0x64,
> > +=09HPWMI_BACKLIGHT_SET_ON_QUERY=09=09=3D 0xE4,
> > +};
> > +
> >  enum hp_wmi_command {
> >  =09HPWMI_READ=09=3D 0x01,
> >  =09HPWMI_WRITE=09=3D 0x02,
> >  =09HPWMI_ODM=09=3D 0x03,
> >  =09HPWMI_GM=09=3D 0x20008,
> > +=09HPWMI_BACKLIGHT=09=3D 0x20009,
> >  };
> > =20
> >  enum hp_wmi_hardware_mask {
> > @@ -450,6 +475,24 @@ enum hp_wmi_hardware_mask {
> >  =09HPWMI_TABLET_MASK=09=3D 0x04,
> >  };
> > =20
> > +struct hp_kbd_led_priv {
> > +=09int zone;               /* Zone index (0-3) */
> > +=09enum led_brightness last_brightness;  /* Brightness before turning =
off */
> > +};
> > +
> > +struct hp_mc_leds {
> > +=09struct led_classdev_mc devices[4];
> > +=09struct hp_kbd_led_priv priv[4];
> > +};
> > +
> > +/* zone naming for 4-zone keyboards (HP Omen) */
> > +static const char *const hp_zone_names_4[] =3D {
> > +=09[0] =3D "zoned_backlight-right",
> > +=09[1] =3D "zoned_backlight-center",
> > +=09[2] =3D "zoned_backlight-left",
> > +=09[3] =3D "zoned_backlight-wasd",
> > +};
> > +
> >  struct bios_return {
> >  =09u32 sigpass;
> >  =09u32 return_code;
> > @@ -530,6 +573,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
> >  static struct input_dev *hp_wmi_input_dev;
> >  static struct input_dev *camera_shutter_input_dev;
> >  static struct platform_device *hp_wmi_platform_dev;
> > +static struct hp_mc_leds hp_multicolor_leds;
> >  static struct device *platform_profile_device;
> >  static struct notifier_block platform_power_source_nb;
> >  static enum platform_profile_option active_platform_profile;
> > @@ -1338,6 +1382,8 @@ static struct attribute *hp_wmi_attrs[] =3D {
> >  };
> >  ATTRIBUTE_GROUPS(hp_wmi);
> > =20
> > +static void hp_kbd_brightness_set_by_hwd(u32 event_data);
> > +
> >  static void hp_wmi_notify(union acpi_object *obj, void *context)
> >  {
> >  =09u32 event_id, event_data;
> > @@ -1438,6 +1484,16 @@ static void hp_wmi_notify(union acpi_object *obj=
, void *context)
> >  =09case HPWMI_PROXIMITY_SENSOR:
> >  =09=09break;
> >  =09case HPWMI_BACKLIT_KB_BRIGHTNESS:
> > +=09=09/*
> > +=09=09 * Only handle actual backlight events (0x0 and 0x2).
> > +=09=09 * Other event_data values (like keyboard scan codes, e.g. 0x20 =
for 'd')
> > +=09=09 * are keyboard events and should be handled via sparse_keymap,
> > +=09=09 * not treated as brightness control commands.
> > +=09=09 */
> > +=09=09if (event_data !=3D HP_BACKLIGHT_EVENT_ON &&
> > +=09=09    event_data !=3D HP_BACKLIGHT_EVENT_OFF)
> > +=09=09=09break;
> > +=09=09hp_kbd_brightness_set_by_hwd(event_data);
> >  =09=09break;
> >  =09case HPWMI_PEAKSHIFT_PERIOD:
> >  =09=09break;
> > @@ -1700,6 +1756,244 @@ static int __init hp_wmi_rfkill2_setup(struct p=
latform_device *device)
> >  =09return err;
> >  }
> > =20
> > +static struct hp_kbd_led_priv *hp_led_get_priv(struct led_classdev *le=
d_cdev)
> > +{
> > +=09struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
> > +=09int zone =3D mc_cdev - hp_multicolor_leds.devices;
> > +
> > +=09return &hp_multicolor_leds.priv[zone];
> > +}
> > +
> > +static int hp_kbd_backlight_set_rgb_color(int zone, int red, int green=
, int blue)
> > +{
> > +=09u8 color_table[128];
> > +=09int ret;
> > +
> > +=09/*
> > +=09 * Get the current color table and then change only the relevant pa=
rts.
> > +=09 */
> > +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY,
> > +=09=09=09=09  HPWMI_BACKLIGHT, color_table,
> > +=09=09=09=09  zero_if_sup(color_table),
> > +=09=09=09=09  sizeof(color_table));
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09/*
> > +=09 * RGB color data starts at offset 25 +3 per zone (r g b)
> > +=09 * e.g. if zone 1 starts in 25 zone 2 starts in 28
> > +=09 */
> > +=09color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS]     =
=3D red;
> > +=09color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + 1] =
=3D green;
> > +=09color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + 2] =
=3D blue;
> > +
> > +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, HPWMI=
_BACKLIGHT,
> > +=09=09=09=09  color_table, sizeof(color_table), sizeof(color_table));
> > +=09if (ret < 0)
> > +=09=09return ret;
> > +=09if (ret)
> > +=09=09return -EINVAL;
> > +
> > +=09return 0;
> > +}
> > +
> > +static bool hp_kbd_backlight_is_on(void)
> > +{
> > +=09u8 data;
> > +=09int ret;
> > +
> > +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, =
HPWMI_BACKLIGHT, &data,
> > +=09=09=09=09sizeof(data), sizeof(data));
> > +=09if (ret)
> > +=09=09return false;
> > +
> > +=09return data =3D=3D HPWMI_BACKLIGHT_SET_ON_QUERY;
> > +}
> > +
> > +static int hp_kbd_set_brightness(struct led_classdev *led_cdev,
> > +=09=09=09=09=09enum led_brightness brightness)
> > +{
> > +=09struct hp_kbd_led_priv *priv =3D hp_led_get_priv(led_cdev);
> > +=09struct led_classdev_mc *mc_cdev;
> > +=09struct led_classdev_mc *device;
> > +=09int red, green, blue;
> > +=09int ret;
> > +
> > +=09if (!hp_kbd_backlight_is_on()) {
> > +=09=09u8 data =3D HPWMI_BACKLIGHT_SET_ON_QUERY;
> > +
> > +=09=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUER=
Y,
> > +=09=09=09=09=09   HPWMI_BACKLIGHT, &data,
> > +=09=09=09=09=09   sizeof(data), sizeof(data));
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +
> > +=09=09/*
> > +=09=09 * Turning the backlight on via WMI turns all zones,
> > +=09=09 * so we need to restore the other zones' off state.
> > +=09=09 */
> > +=09=09for (int i =3D 0; i < ARRAY_SIZE(hp_multicolor_leds.devices); i+=
+) {
> > +=09=09=09if (i =3D=3D priv->zone)
> > +=09=09=09=09continue;
> > +
> > +=09=09=09device =3D &hp_multicolor_leds.devices[i];
> > +=09=09=09if (!device->led_cdev.name)
> > +=09=09=09=09continue;
> > +=09=09=09hp_kbd_backlight_set_rgb_color(i,
> > +=09=09=09=09device->subled_info[0].brightness,
> > +=09=09=09=09device->subled_info[1].brightness,
> > +=09=09=09=09device->subled_info[2].brightness);
> > +=09=09}
> > +=09}
> > +
> > +=09led_cdev->brightness =3D brightness;
> > +
> > +=09mc_cdev =3D lcdev_to_mccdev(led_cdev);
> > +=09led_mc_calc_color_components(mc_cdev, brightness);
> > +
> > +=09red =3D mc_cdev->subled_info[0].brightness;
> > +=09green =3D mc_cdev->subled_info[1].brightness;
> > +=09blue =3D mc_cdev->subled_info[2].brightness;
> > +
> > +=09return hp_kbd_backlight_set_rgb_color(priv->zone, red, green, blue)=
;
> > +}
> > +
> > +static void hp_kbd_brightness_set_by_hwd(u32 event_data)
> > +{
> > +=09struct device *dev =3D &hp_wmi_platform_dev->dev;
> > +=09struct led_classdev *led_cdev;
> > +=09struct hp_kbd_led_priv *priv;
> > +=09u8 brightness;
> > +
> > +=09for (int zone =3D 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices);=
 zone++) {
> > +=09=09if (!hp_multicolor_leds.devices[zone].led_cdev.name)
> > +=09=09=09continue;
> > +
> > +=09=09led_cdev =3D &hp_multicolor_leds.devices[zone].led_cdev;
> > +=09=09if (!led_cdev->dev)
> > +=09=09=09continue;
> > +
> > +=09=09priv =3D hp_led_get_priv(led_cdev);
> > +
> > +=09=09switch (event_data) {
> > +=09=09case HP_BACKLIGHT_EVENT_ON:
> > +=09=09=09brightness =3D priv->last_brightness ? : LED_FULL;
> > +=09=09=09break;
> > +=09=09case HP_BACKLIGHT_EVENT_OFF:
> > +=09=09=09priv->last_brightness =3D led_cdev->brightness;
> > +=09=09=09brightness =3D LED_OFF;
> > +=09=09=09break;
> > +=09=09default:
> > +=09=09=09dev_warn(dev, "Unknown keyboard backlight event - 0x%x\n",
> > +=09=09=09=09 event_data);
> > +=09=09=09return;
> > +=09=09}
> > +
> > +=09=09led_cdev->brightness =3D brightness;
> > +=09=09led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
> > +=09}
> > +}
> > +
> > +static int __init hp_mc_leds_register(int num_zones)
> > +{
> > +=09u8 color_table[128];
> > +=09int ret;
> > +
> > +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY, HPWMI=
_BACKLIGHT,
> > +=09=09=09=09  color_table, zero_if_sup(color_table),
> > +=09=09=09=09  sizeof(color_table));
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09for (int zone =3D 0; zone < num_zones; zone++) {
> > +=09=09struct led_classdev_mc *multicolor_led_dev;
> > +=09=09struct led_classdev *led_cdev;
> > +=09=09struct mc_subled *mc_subled_info;
> > +=09=09struct hp_kbd_led_priv *priv;
> > +=09=09struct device *dev;
> > +
> > +=09=09dev =3D &hp_wmi_platform_dev->dev;
> > +=09=09multicolor_led_dev =3D &hp_multicolor_leds.devices[zone];
> > +=09=09led_cdev =3D &multicolor_led_dev->led_cdev;
> > +=09=09priv =3D &hp_multicolor_leds.priv[zone];
> > +
> > +=09=09if (num_zones =3D=3D 1)
> > +=09=09=09led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
> > +=09=09=09=09"hp::kbd_backlight");
> > +=09=09else if (num_zones =3D=3D 4 && zone < ARRAY_SIZE(hp_zone_names_4=
))
> > +=09=09=09led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
> > +=09=09=09=09"hp::kbd_%s",
> > +=09=09=09=09hp_zone_names_4[zone]);
> > +=09=09else if (num_zones > 1)
> > +=09=09=09led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
> > +=09=09=09=09"hp::kbd_zoned_backlight-%d",
> > +=09=09=09=09zone);
> > +
> > +=09=09if (!led_cdev->name)
> > +=09=09=09return -ENOMEM;
> > +=09=09led_cdev->brightness =3D hp_kbd_backlight_is_on() ?
> > +=09=09=09=09       LED_FULL : LED_OFF;
> > +=09=09led_cdev->max_brightness =3D LED_FULL;
> > +=09=09led_cdev->brightness_set_blocking =3D hp_kbd_set_brightness;
> > +=09=09led_cdev->flags =3D LED_CORE_SUSPENDRESUME |
> > +=09=09=09=09  LED_RETAIN_AT_SHUTDOWN |
> > +=09=09=09=09  LED_BRIGHT_HW_CHANGED;
> > +
> > +=09=09mc_subled_info =3D devm_kzalloc(dev, sizeof(*mc_subled_info) * H=
P_KBD_RGB_COLORS,
> > +=09=09=09=09=09      GFP_KERNEL);
>=20
> Thanks for the update.
>=20
> This looked very much devm_kcalloc() to me so I made that conversion=20
> while applying.
>=20
> PLEASE CHECK and yell loudly if you think I made an error while=20
> converting it.
>=20
> The patch is applied to the review-ilpo-next branch.

A time out. I've pulled this change from review-ilpo-next because of the=20
reported config issue.

--=20
 i.

--8323328-1293466110-1789514420=:29492--
