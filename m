Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7518A33DEF7;
	Tue, 15 Sep 2026 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468533; cv=none; b=p53BA+it3sskn/m1mPi7s+FYSkT12hu0i0D0Y/xFhiPgQFiLicYQqEPQfqmKpYmWWvBiYRkBaoS+7YYFIO4tQo+37XA1A9pKHaYmOyxu/7bPvciPE9g/4b8exhe21lCeQf5MWKF7La3SMT/3oqWZBdErFfyRc5NJaIzkkIL4JRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468533; c=relaxed/simple;
	bh=bM81tirtSmwGyjBwmoXV8Yupepz8ZpEgzZNcnp1pKa8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SQs1r7Q+B1JadF0xSpU9gxv95GAsGPIBJgHlxcQJnbB+z5p2XVKBQvlbgxD2cHlBUKLg7DkHzvTnUj3vn5f/vDnU3Sco/NUwu+KpVHNDzb99naWA4ji6Mr/h1CRML8AWkSqcPu5JkAIBzxvUtlAbzQPUXUnG2ixOv6nZmUlmZeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l33ystsO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l33ystsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789468531; x=1821004531;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=bM81tirtSmwGyjBwmoXV8Yupepz8ZpEgzZNcnp1pKa8=;
  b=l33ystsO1/78UJ9gceX8lTSoPPed0p2096Ttx6gaOIG3kMPbBvewGoHk
   jCKNgpXyvMBHd83vCVxggwnYpzOgObnYY+kyQIgdy06KSDy32hA7iOaZg
   haGwe/TMh7UiuBJiPYzniwwTuN17Je/0wkb08tMS0P6Yo0nesf8WUP8Jd
   FrKNg7gzWp2TCBPxR35UcLSovOYD7rgsekN+YlNs9xk3lO10yYcbxwZf8
   Vgk1xzv8TRzJ1B3wRrDza038Ok9GOLTwT/q9V/3BT2gCHo1BpqT6qnaEk
   PiMJC8/gsYh1Uh4fmJagtLnlKSCNUnq9Uq6yA5dkvXp1+hMQDgrZYbpil
   Q==;
X-CSE-ConnectionGUID: wW3Ozep/RcmlaSo++9tGTw==
X-CSE-MsgGUID: 5wtT7MimT06fbl96gHFfFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93527036"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93527036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:35:30 -0700
X-CSE-ConnectionGUID: EtaKCYlMSa2dRYet//d2dA==
X-CSE-MsgGUID: E2UZQzUKQN6mwumDHV0EXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268678181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:35:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 13:35:24 +0300 (EEST)
To: =?KOI8-R?B?68/Oxc7LzyDhzsTSxcog98nL1M/Sz9fJ3g==?= <admin@aquinas.su>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v11] platform/x86: hp-wmi: Add multicolor LED support
 for HP keyboard backlight
In-Reply-To: <0Ja9VPr1QTSihXZrbKAgzg@aquinas.su>
Message-ID: <b667bdb7-1820-8f5f-9ca9-a34ab84b93bf@linux.intel.com>
References: <0Ja9VPr1QTSihXZrbKAgzg@aquinas.su>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-22868414-1789467513=:1365"
Content-ID: <12930871-30b1-147a-6a60-0e291293e71d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-22868414-1789467513=:1365
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0035d782-7438-ce1c-4361-d2045b467d6d@linux.intel.com>

On Mon, 14 Sep 2026, =D0=9A=D0=BE=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE =D0=90=D0=
=BD=D0=B4=D1=80=D0=B5=D0=B9 =D0=92=D0=B8=D0=BA=D1=82=D0=BE=D1=80=D0=BE=D0=
=B2=D0=B8=D1=87 wrote:

> Add support for the HP keyboard RGB backlight found on HP OMEN and
> HP Victus laptops. These keyboards expose per-zone RGB control through
> WMI commands.
>=20
> Register multicolor LED class devices for each keyboard zone (up to 4
> zones, depending on the keyboard type). Each zone exposes individual
> red, green, and blue channels via the multicolor LED subsystem.
>=20
> Also hardware-initiated brightness changes (e.g. via the keyboard
> backlight hotkey, mostly fn+f4) are reported.
>=20
> The color data is stored in a 128-byte color table managed by the
> firmware, with RGB values starting at offset 25, packed sequentially
> per zone.
>=20
> Signed-off-by: Konenko Andrey Viktorovich <admin@aquinas.su>
>=20
> ---
> Changes since v10:
>  - adapted for current linux-next (20260914)
>  - Added Named Constants:
> =09HP_BACKLIGHT_EVENT_ON =E2=80=94 replaces magic number for backlight en=
able event
> =09HP_BACKLIGHT_EVENT_OFF =E2=80=94 replaces magic number for backlight d=
isable event
> =09HP_KBD_RGB_COLORS =E2=80=94 replaces universally used literal 3 as RGB=
 color/channel count
>  - Refactored hp_kbd_brightness_set_by_hwd Function - Eliminated reliance=
 on magic numbers in event handling logic (bugfix)
>  - Event Filtering (critical bugfix):
> =09Added event type filtering in hp_wmi_notify() before calling hp_kbd_br=
ightness_set_by_hwd()
> =09This prevents EC flooding and keyboard malfunction on some devices
>=20
> Changes since v9:
>  - Fixed corrupted long lines
>  - Fixed changelog
>=20
> Changes since v8:
>  - No changes (It was mistake to resend email without any fix)
>=20
> Changes since v7:
>  - The LED class device names changed to be consistent with the documenta=
tion.
>=20
> Changes since v6:
>  - The LED class device names have been made more consistent with the=20
> documentation, in accordance with patch https://lore.kernel.org/linux-led=
s/
> 20260504145434.12746-1-johannes.goede@oss.qualcomm.com/
> underscores have been replaced with dashes where indicated.
>=20
> Changes since v5:
>  - LED class device names changed from a number to using a descriptive na=
me=20
> for each zone.
>=20
> v4: https://lore.kernel.org/all/20260303084022.7223-3-edip@medip.dev/
>=20
> Changes since v4:
>  - Fix circular dependencies
>=20
> Changes since v3:
>  - Merge the changes into a single commit
>=20
> Changes since v1:
>  - Fix mentioned style errors
>  - Add Kconfig dependencies
>=20
> ---
>  drivers/platform/x86/hp/Kconfig  |   2 +
>  drivers/platform/x86/hp/hp-wmi.c | 298 ++++++++++++++++++++++++++++++-
>  2 files changed, 299 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kc=
onfig
> index dd51491b9bcd..2a1841cbec76 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -45,6 +45,8 @@ config HP_WMI
>  =09select INPUT_SPARSEKMAP
>  =09select ACPI_PLATFORM_PROFILE
>  =09select HWMON
> +=09select LEDS_CLASS
> +=09select LEDS_CLASS_MULTICOLOR
>  =09help
>  =09  Say Y here if you want to support WMI-based hotkeys on HP laptops a=
nd
>  =09  to read data from WMI such as docking or ambient light sensor state=
=2E
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 615b4cf6fc45..cf57b6b00b01 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -28,6 +28,8 @@
>  #include <linux/kstrtox.h>
>  #include <linux/limits.h>
>  #include <linux/minmax.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> @@ -61,6 +63,10 @@ enum hp_ec_offsets {
>  #define HP_FAN_SPEED_AUTOMATIC=09 0x00
>  #define HP_POWER_LIMIT_DEFAULT=09 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> +#define HP_COLOR_TABLE_PADDING  25
> +#define HP_BACKLIGHT_EVENT_ON   0x2
> +#define HP_BACKLIGHT_EVENT_OFF  0x0
> +#define HP_KBD_RGB_COLORS       3
>  #define HPWMI_MUX_MODE_UMA=09=09BIT(0)
>  #define HPWMI_MUX_MODE_HYBRID=09=09BIT(1)
>  #define HPWMI_MUX_MODE_DISCRETE=09=09BIT(2)
> @@ -106,6 +112,14 @@ enum hp_thermal_profile {
>  =09HP_THERMAL_PROFILE_QUIET=09=09=09=3D 0x03,
>  };
> =20
> +enum hp_keyboard_type {
> +=09HP_KEYBOARD_TYPE_NOBACKLIGHT=09=09=3D 0x0,
> +=09HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD=09=3D 0x1,
> +=09HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD=09=3D 0x2,
> +=09HP_KEYBOARD_TYPE_RGB_PER_KEY=09=09=3D 0x3,
> +=09HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD=09=3D 0x4,
> +=09HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD=09=3D 0x5,
> +};
> =20
>  struct thermal_profile_params {
>  =09u8 performance;
> @@ -433,16 +447,27 @@ enum hp_wmi_gm_commandtype {
>  =09HPWMI_GET_GPU_THERMAL_MODES_QUERY=09=3D 0x21,
>  =09HPWMI_SET_GPU_THERMAL_MODES_QUERY=09=3D 0x22,
>  =09HPWMI_SET_POWER_LIMITS_QUERY=09=09=3D 0x29,
> +=09HPWMI_GET_KEYBOARD_TYPE_QUERY=09=09=3D 0x2b,
>  =09HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY=09=3D 0x2D,
>  =09HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY=09=3D 0x2E,
>  =09HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY=09=3D 0x2F,
>  };
> =20
> +enum hp_wmi_backlight_commandtype {
> +=09HPWMI_BACKLIGHT_COLOR_GET_QUERY=09=09=3D 0x02,
> +=09HPWMI_BACKLIGHT_COLOR_SET_QUERY=09=09=3D 0x03,
> +=09HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY=09=3D 0x04,
> +=09HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY=09=3D 0x05,
> +=09HPWMI_BACKLIGHT_SET_OFF_QUERY=09=09=3D 0x64,
> +=09HPWMI_BACKLIGHT_SET_ON_QUERY=09=09=3D 0xE4,
> +};
> +
>  enum hp_wmi_command {
>  =09HPWMI_READ=09=3D 0x01,
>  =09HPWMI_WRITE=09=3D 0x02,
>  =09HPWMI_ODM=09=3D 0x03,
>  =09HPWMI_GM=09=3D 0x20008,
> +=09HPWMI_BACKLIGHT=09=3D 0x20009,
>  };
> =20
>  enum hp_wmi_hardware_mask {
> @@ -450,6 +475,24 @@ enum hp_wmi_hardware_mask {
>  =09HPWMI_TABLET_MASK=09=3D 0x04,
>  };
> =20
> +struct hp_kbd_led_priv {
> +=09int zone;               /* Zone index (0-3) */
> +=09enum led_brightness last_brightness;  /* Brightness before turning of=
f */
> +};
> +
> +struct hp_mc_leds {
> +=09struct led_classdev_mc devices[4];
> +=09struct hp_kbd_led_priv priv[4];
> +};
> +
> +/* zone naming for 4-zone keyboards (HP Omen) */
> +static const char *const hp_zone_names_4[] =3D {
> +=09[0] =3D "zoned_backlight-right",
> +=09[1] =3D "zoned_backlight-center",
> +=09[2] =3D "zoned_backlight-left",
> +=09[3] =3D "zoned_backlight-wasd",
> +};
> +
>  struct bios_return {
>  =09u32 sigpass;
>  =09u32 return_code;
> @@ -530,6 +573,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
>  static struct input_dev *hp_wmi_input_dev;
>  static struct input_dev *camera_shutter_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
> +static struct hp_mc_leds hp_multicolor_leds;
>  static struct device *platform_profile_device;
>  static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
> @@ -1338,6 +1382,8 @@ static struct attribute *hp_wmi_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
> =20
> +static void hp_kbd_brightness_set_by_hwd(u32 event_data);
> +
>  static void hp_wmi_notify(union acpi_object *obj, void *context)
>  {
>  =09u32 event_id, event_data;
> @@ -1438,6 +1484,16 @@ static void hp_wmi_notify(union acpi_object *obj, =
void *context)
>  =09case HPWMI_PROXIMITY_SENSOR:
>  =09=09break;
>  =09case HPWMI_BACKLIT_KB_BRIGHTNESS:
> +=09=09/*
> +=09=09 * Only handle actual backlight events (0x0 and 0x2).
> +=09=09 * Other event_data values (like keyboard scan codes, e.g. 0x20 fo=
r 'd')
> +=09=09 * are keyboard events and should be handled via sparse_keymap,
> +=09=09 * not treated as brightness control commands.
> +=09=09 */
> +=09=09if (event_data !=3D HP_BACKLIGHT_EVENT_ON &&
> +=09=09    event_data !=3D HP_BACKLIGHT_EVENT_OFF)
> +=09=09=09break;
> +=09=09hp_kbd_brightness_set_by_hwd(event_data);
>  =09=09break;
>  =09case HPWMI_PEAKSHIFT_PERIOD:
>  =09=09break;
> @@ -1700,6 +1756,244 @@ static int __init hp_wmi_rfkill2_setup(struct pla=
tform_device *device)
>  =09return err;
>  }
> =20
> +static struct hp_kbd_led_priv *hp_led_get_priv(struct led_classdev *led_=
cdev)
> +{
> +=09struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +=09int zone =3D mc_cdev - hp_multicolor_leds.devices;
> +
> +=09return &hp_multicolor_leds.priv[zone];
> +}
> +
> +static int hp_kbd_backlight_set_rgb_color(int zone, int red, int green, =
int blue)
> +{
> +=09u8 color_table[128];
> +=09int ret;
> +
> +=09/*
> +=09 * Get the current color table and then change only the relevant part=
s.
> +=09 */
> +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY,
> +=09=09=09=09  HPWMI_BACKLIGHT, color_table,
> +=09=09=09=09  zero_if_sup(color_table),
> +=09=09=09=09  sizeof(color_table));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/*
> +=09 * RGB color data starts at offset 25 +3 per zone (r g b)
> +=09 * e.g. if zone 1 starts in 25 zone 2 starts in 28
> +=09 */
> +=09color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS]     =
=3D red;
> +=09color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + 1] =
=3D green;
> +=09color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + 2] =
=3D blue;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, HPWMI_B=
ACKLIGHT,
> +=09=09=09=09  color_table, sizeof(color_table), sizeof(color_table));
> +=09if (ret < 0)
> +=09=09return ret;
> +=09if (ret)
> +=09=09return -EINVAL;
> +
> +=09return 0;
> +}
> +
> +static bool hp_kbd_backlight_is_on(void)
> +{
> +=09u8 data;
> +=09int ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, HP=
WMI_BACKLIGHT, &data,
> +=09=09=09=09sizeof(data), sizeof(data));
> +=09if (ret)
> +=09=09return false;
> +
> +=09return data =3D=3D HPWMI_BACKLIGHT_SET_ON_QUERY;
> +}
> +
> +static int hp_kbd_set_brightness(struct led_classdev *led_cdev,
> +=09=09=09=09=09enum led_brightness brightness)
> +{
> +=09struct hp_kbd_led_priv *priv =3D hp_led_get_priv(led_cdev);
> +=09struct led_classdev_mc *mc_cdev;
> +=09struct led_classdev_mc *device;
> +=09int red, green, blue;
> +=09int ret;
> +
> +=09if (!hp_kbd_backlight_is_on()) {
> +=09=09u8 data =3D HPWMI_BACKLIGHT_SET_ON_QUERY;
> +
> +=09=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY,
> +=09=09=09=09=09   HPWMI_BACKLIGHT, &data,
> +=09=09=09=09=09   sizeof(data), sizeof(data));
> +=09=09if (ret)
> +=09=09=09return ret;
> +
> +=09=09/*
> +=09=09 * Turning the backlight on via WMI turns all zones,
> +=09=09 * so we need to restore the other zones' off state.
> +=09=09 */
> +=09=09for (int i =3D 0; i < ARRAY_SIZE(hp_multicolor_leds.devices); i++)=
 {
> +=09=09=09if (i =3D=3D priv->zone)
> +=09=09=09=09continue;
> +
> +=09=09=09device =3D &hp_multicolor_leds.devices[i];
> +=09=09=09if (!device->led_cdev.name)
> +=09=09=09=09continue;
> +=09=09=09hp_kbd_backlight_set_rgb_color(i,
> +=09=09=09=09device->subled_info[0].brightness,
> +=09=09=09=09device->subled_info[1].brightness,
> +=09=09=09=09device->subled_info[2].brightness);
> +=09=09}
> +=09}
> +
> +=09led_cdev->brightness =3D brightness;
> +
> +=09mc_cdev =3D lcdev_to_mccdev(led_cdev);
> +=09led_mc_calc_color_components(mc_cdev, brightness);
> +
> +=09red =3D mc_cdev->subled_info[0].brightness;
> +=09green =3D mc_cdev->subled_info[1].brightness;
> +=09blue =3D mc_cdev->subled_info[2].brightness;
> +
> +=09return hp_kbd_backlight_set_rgb_color(priv->zone, red, green, blue);
> +}
> +
> +static void hp_kbd_brightness_set_by_hwd(u32 event_data)
> +{
> +=09struct device *dev =3D &hp_wmi_platform_dev->dev;
> +=09struct led_classdev *led_cdev;
> +=09struct hp_kbd_led_priv *priv;
> +=09u8 brightness;
> +
> +=09for (int zone =3D 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices); z=
one++) {
> +=09=09if (!hp_multicolor_leds.devices[zone].led_cdev.name)
> +=09=09=09continue;
> +
> +=09=09led_cdev =3D &hp_multicolor_leds.devices[zone].led_cdev;
> +=09=09if (!led_cdev->dev)
> +=09=09=09continue;
> +
> +=09=09priv =3D hp_led_get_priv(led_cdev);
> +
> +=09=09switch (event_data) {
> +=09=09case HP_BACKLIGHT_EVENT_ON:
> +=09=09=09brightness =3D priv->last_brightness ? : LED_FULL;
> +=09=09=09break;
> +=09=09case HP_BACKLIGHT_EVENT_OFF:
> +=09=09=09priv->last_brightness =3D led_cdev->brightness;
> +=09=09=09brightness =3D LED_OFF;
> +=09=09=09break;
> +=09=09default:
> +=09=09=09dev_warn(dev, "Unknown keyboard backlight event - 0x%x\n",
> +=09=09=09=09 event_data);
> +=09=09=09return;
> +=09=09}
> +
> +=09=09led_cdev->brightness =3D brightness;
> +=09=09led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
> +=09}
> +}
> +
> +static int __init hp_mc_leds_register(int num_zones)
> +{
> +=09u8 color_table[128];
> +=09int ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY, HPWMI_B=
ACKLIGHT,
> +=09=09=09=09  color_table, zero_if_sup(color_table),
> +=09=09=09=09  sizeof(color_table));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09for (int zone =3D 0; zone < num_zones; zone++) {
> +=09=09struct led_classdev_mc *multicolor_led_dev;
> +=09=09struct led_classdev *led_cdev;
> +=09=09struct mc_subled *mc_subled_info;
> +=09=09struct hp_kbd_led_priv *priv;
> +=09=09struct device *dev;
> +
> +=09=09dev =3D &hp_wmi_platform_dev->dev;
> +=09=09multicolor_led_dev =3D &hp_multicolor_leds.devices[zone];
> +=09=09led_cdev =3D &multicolor_led_dev->led_cdev;
> +=09=09priv =3D &hp_multicolor_leds.priv[zone];
> +
> +=09=09if (num_zones =3D=3D 1)
> +=09=09=09led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
> +=09=09=09=09"hp::kbd_backlight");
> +=09=09else if (num_zones =3D=3D 4 && zone < ARRAY_SIZE(hp_zone_names_4))
> +=09=09=09led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
> +=09=09=09=09"hp::kbd_%s",
> +=09=09=09=09hp_zone_names_4[zone]);
> +=09=09else if (num_zones > 1)
> +=09=09=09led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
> +=09=09=09=09"hp::kbd_zoned_backlight-%d",
> +=09=09=09=09zone);
> +
> +=09=09if (!led_cdev->name)
> +=09=09=09return -ENOMEM;
> +=09=09led_cdev->brightness =3D hp_kbd_backlight_is_on() ?
> +=09=09=09=09       LED_FULL : LED_OFF;
> +=09=09led_cdev->max_brightness =3D LED_FULL;
> +=09=09led_cdev->brightness_set_blocking =3D hp_kbd_set_brightness;
> +=09=09led_cdev->flags =3D LED_CORE_SUSPENDRESUME |
> +=09=09=09=09  LED_RETAIN_AT_SHUTDOWN |
> +=09=09=09=09  LED_BRIGHT_HW_CHANGED;
> +
> +=09=09mc_subled_info =3D devm_kzalloc(dev, sizeof(*mc_subled_info) * HP_=
KBD_RGB_COLORS,
> +=09=09=09=09=09      GFP_KERNEL);

Thanks for the update.

This looked very much devm_kcalloc() to me so I made that conversion=20
while applying.

PLEASE CHECK and yell loudly if you think I made an error while=20
converting it.

The patch is applied to the review-ilpo-next branch.

--=20
 i.

> +=09=09if (!mc_subled_info)
> +=09=09=09return -ENOMEM;
> +
> +=09=09mc_subled_info[0].color_index =3D LED_COLOR_ID_RED;
> +=09=09mc_subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +=09=09mc_subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +
> +=09=09for (int i =3D 0; i < HP_KBD_RGB_COLORS; i++) {
> +=09=09=09int off =3D HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS +=
 i;
> +
> +=09=09=09mc_subled_info[i].channel =3D zone * HP_KBD_RGB_COLORS + i;
> +=09=09=09mc_subled_info[i].intensity =3D color_table[off];
> +=09=09=09mc_subled_info[i].brightness =3D LED_FULL;
> +=09=09}
> +
> +=09=09multicolor_led_dev->subled_info =3D mc_subled_info;
> +=09=09multicolor_led_dev->num_colors =3D HP_KBD_RGB_COLORS;
> +
> +=09=09ret =3D devm_led_classdev_multicolor_register(dev, multicolor_led_=
dev);
> +=09=09if (ret) {
> +=09=09=09dev_err(dev, "Failed to register multicolor RGB backlight\n");
> +=09=09=09return ret;
> +=09=09}
> +
> +=09=09/* Initialize private data */
> +=09=09priv->zone =3D zone;
> +=09=09priv->last_brightness =3D LED_FULL;
> +=09}
> +=09return 0;
> +}
> +
> +static int __init hp_kbd_rgb_setup(void)
> +{
> +=09u8 keyboard_type;
> +=09int ret;
> +
> +=09ret =3D hp_wmi_perform_query(HPWMI_GET_KEYBOARD_TYPE_QUERY, HPWMI_GM,=
 &keyboard_type,
> +=09=09=09=09sizeof(keyboard_type), sizeof(keyboard_type));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09switch (keyboard_type) {
> +=09case HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD:
> +=09case HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD:
> +=09=09return hp_mc_leds_register(4);
> +=09case HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD:
> +=09case HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD:
> +=09=09return hp_mc_leds_register(1);
> +=09default:
> +=09=09return 0;
> +=09}
> +}
> +
>  static int platform_profile_omen_get_ec(enum platform_profile_option *pr=
ofile)
>  {
>  =09int tp;
> @@ -2541,7 +2835,9 @@ static int __init hp_wmi_bios_setup(struct platform=
_device *device)
>  =09=09return err;
> =20
>  =09thermal_profile_setup(device);
> -
> +=09err =3D hp_kbd_rgb_setup();
> +=09if (err)
> +=09=09dev_err(&device->dev, "Failed to initialize keyboard RGB\n");
>  =09return 0;
>  }
> =20
>=20
--8323328-22868414-1789467513=:1365--
