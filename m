Received: from hope.aquinas.su (hope.aquinas.su [82.148.24.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A68832C8B;
	Sun, 14 Jun 2026 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.148.24.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781445839; cv=none; b=oedOswU54Wec3kXQRkjrL0If7aObx9X3mnfG6rLMAYE9jcjEFFIFxIqerkqH4QCza3tFNTMxpnQTVW/wyxrGxgoOjXPnIsu1Gv9S/dSz7QRz6C1yk20uKmtvtsZJBkE8oHel/6tmxbCCexDkifmAYd8VIYKWaL6sd9VtgAPUxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781445839; c=relaxed/simple;
	bh=oVsRmjo1oVIBOiOSNe89vWaxp4kiMY/x+ZYoGAclor0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AiA7fIHqebwnlhAkhiMY5h49zTd+smAI81hQ7jIebHxPRhmLBegtqJk1FrdJp0BNy0mp1lAjLhKxkvD+m418u03cNMDFUXU6IWm5LqBchCCaaIeIo+uvdRR+eoTN66BCubdrt4k4CBA/JXM9GVcLCkIXlEB9/jcycSnHu1TwjwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aquinas.su; spf=pass smtp.mailfrom=aquinas.su; dkim=pass (2048-bit key) header.d=aquinas.su header.i=@aquinas.su header.b=lfSrng7j; arc=none smtp.client-ip=82.148.24.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aquinas.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aquinas.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aquinas.su header.i=@aquinas.su header.b="lfSrng7j"
Received: from woolf.localdomain (unknown [158.46.243.40])
	(Authenticated sender: admin@aquinas.su)
	by hope.aquinas.su (Postfix) with ESMTPSA id 570C66DC04;
	Sun, 14 Jun 2026 17:03:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aquinas.su; s=default;
	t=1781445835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/cLSKcK3fBg6I0ddqMzOflGKITLD3GRptiZZiwHG8I=;
	b=lfSrng7jjADCIwj0h/Ovp0ogLuiJOHrBDphfFyHG8REMkpqXQBEPdm30xeSAzt4qSJbC3P
	5DYZLjDNJSibug9pKds03mDJkzE0aUx/2xbAh8KG7Jh1GJSAS+EydRDTcGS8JwE6xySxgQ
	D02LqHE818/Op+ROqJesYn2e4EL2JtXkOiqB7HD9/iCV45qohEBGpQ1aNccVQVNhHysFVF
	7O/Z4lCtn+ujQkjep/XAC+ASjh62AsQBZ9V5ZtsflDeFqbVVBHkwYuy3wxAuVgj14FEV+Z
	85lMtDFZD8xVh4luA1HAfKHLmCh5XNR8wzW85jIaUCVtLhp5W95Ii5odCNYQQA==
Authentication-Results: hope.aquinas.su;
	auth=pass smtp.auth=admin@aquinas.su smtp.mailfrom=admin@aquinas.su
From:
 =?UTF-8?B?0JrQvtC90LXQvdC60L4g0JDQvdC00YDQtdC5INCS0LjQutGC0L7RgNC+0LLQuNGH?=
 <admin@aquinas.su>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
Subject:
 [PATCH v10] platform/x86: hp-wmi: Add multicolor LED support for HP keyboard
 backlight
Date: Sun, 14 Jun 2026 21:03:53 +0700
Message-ID: <B3i0fyryR3yLLMsNVCrg3Q@aquinas.su>
In-Reply-To: <1f323c53-4328-dd15-2f8d-04b041cc0e6b@linux.intel.com>
References:
 <9VMMQwZjRUOGJGZr-0_YbA@aquinas.su> <Jhl3t35KQoOh1UjBI9iDGA@aquinas.su>
 <1f323c53-4328-dd15-2f8d-04b041cc0e6b@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=46rom: Edip Hazuri <edip@medip.dev>

Add support for the HP keyboard RGB backlight found on HP OMEN and
HP Victus laptops. These keyboards expose per-zone RGB control through
WMI commands.

Register multicolor LED class devices for each keyboard zone (up to 4
zones, depending on the keyboard type). Each zone exposes individual
red, green, and blue channels via the multicolor LED subsystem.

Also hardware-initiated brightness changes (e.g. via the keyboard
backlight hotkey, mostly fn+f4) are reported.

The color data is stored in a 128-byte color table managed by the
firmware, with RGB values starting at offset 25, packed sequentially
per zone.

Signed-off-by: Konenko Andrey Viktorovich <admin@aquinas.su>

=2D--
Changes since v9:
 - Fixed corrupted long lines
 - Fixed changelog

Changes since v8:
 - No changes (It was mistake to resend email without any fix)

Changes since v7:
 - The LED class device names changed to be consistent with the documentati=
on.

Changes since v6:
 - The LED class device names have been made more consistent with the=20
documentation, in accordance with patch https://lore.kernel.org/linux-leds/
20260504145434.12746-1-johannes.goede@oss.qualcomm.com/
underscores have been replaced with dashes where indicated.

Changes since v5:
 - LED class device names changed from a number to using a descriptive name=
=20
for each zone.

v4: https://lore.kernel.org/all/20260303084022.7223-3-edip@medip.dev/

Changes since v4:
 - Fix circular dependencies

Changes since v3:
 - Merge the changes into a single commit

Changes since v1:
 - Fix mentioned style errors
 - Add Kconfig dependencies


=2D--

diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kcon=
fig
index dd51491b9bcd..2a1841cbec76 100644
=2D-- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -45,6 +45,8 @@ config HP_WMI
        select INPUT_SPARSEKMAP
        select ACPI_PLATFORM_PROFILE
        select HWMON
+       select LEDS_CLASS
+       select LEDS_CLASS_MULTICOLOR
        help
          Say Y here if you want to support WMI-based hotkeys on HP laptops=
 and
          to read data from WMI such as docking or ambient light sensor sta=
te.
diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-=
wmi.c
index d1cc6e7d176c..19da18f68337 100644
=2D-- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -14,6 +14,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/dmi.h>
@@ -23,6 +24,8 @@
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
@@ -57,6 +60,7 @@ enum hp_ec_offsets {
=20
 #define HP_FAN_SPEED_AUTOMATIC  0x00
 #define HP_POWER_LIMIT_DEFAULT  0x00
+#define HP_COLOR_TABLE_PADDING  25
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
=20
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when z=
ero insize is required
@@ -97,6 +101,14 @@ enum hp_thermal_profile {
        HP_THERMAL_PROFILE_QUIET                        =3D 0x03,
 };
=20
+enum hp_keyboard_type {
+       HP_KEYBOARD_TYPE_NOBACKLIGHT                =3D 0x0,
+       HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD       =3D 0x1,
+       HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD    =3D 0x2,
+       HP_KEYBOARD_TYPE_RGB_PER_KEY                =3D 0x3,
+       HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD     =3D 0x4,
+       HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD  =3D 0x5,
+};
=20
 struct thermal_profile_params {
        u8 performance;
@@ -338,16 +350,27 @@ enum hp_wmi_gm_commandtype {
        HPWMI_GET_GPU_THERMAL_MODES_QUERY       =3D 0x21,
        HPWMI_SET_GPU_THERMAL_MODES_QUERY       =3D 0x22,
        HPWMI_SET_POWER_LIMITS_QUERY            =3D 0x29,
+       HPWMI_GET_KEYBOARD_TYPE_QUERY           =3D 0x2b,
        HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY      =3D 0x2D,
        HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY      =3D 0x2E,
        HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY      =3D 0x2F,
 };
=20
+enum hp_wmi_backlight_commandtype {
+       HPWMI_BACKLIGHT_COLOR_GET_QUERY         =3D 0x02,
+       HPWMI_BACKLIGHT_COLOR_SET_QUERY         =3D 0x03,
+       HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY    =3D 0x04,
+       HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY    =3D 0x05,
+       HPWMI_BACKLIGHT_SET_OFF_QUERY           =3D 0x64,
+       HPWMI_BACKLIGHT_SET_ON_QUERY            =3D 0xE4,
+};
+
 enum hp_wmi_command {
        HPWMI_READ      =3D 0x01,
        HPWMI_WRITE     =3D 0x02,
        HPWMI_ODM       =3D 0x03,
        HPWMI_GM        =3D 0x20008,
+       HPWMI_BACKLIGHT =3D 0x20009,
 };
=20
 enum hp_wmi_hardware_mask {
@@ -355,6 +378,24 @@ enum hp_wmi_hardware_mask {
        HPWMI_TABLET_MASK       =3D 0x04,
 };
=20
+struct hp_kbd_led_priv {
+       int zone;               /* Zone index (0-3) */
+       enum led_brightness last_brightness;  /* Brightness before turning =
off */
+};
+
+struct hp_mc_leds {
+       struct led_classdev_mc devices[4];
+       struct hp_kbd_led_priv priv[4];
+};
+
+/* zone naming for 4-zone keyboards (HP Omen) */
+static const char *const hp_zone_names_4[] =3D {
+       [0] =3D "zoned_backlight-right",
+       [1] =3D "zoned_backlight-center",
+       [2] =3D "zoned_backlight-left",
+       [3] =3D "zoned_backlight-wasd",
+};
+
 struct bios_return {
        u32 sigpass;
        u32 return_code;
@@ -435,6 +476,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
 static struct input_dev *hp_wmi_input_dev;
 static struct input_dev *camera_shutter_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
+static struct hp_mc_leds hp_multicolor_leds;
 static struct device *platform_profile_device;
 static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
@@ -1122,6 +1164,8 @@ static struct attribute *hp_wmi_attrs[] =3D {
 };
 ATTRIBUTE_GROUPS(hp_wmi);
=20
+static void hp_kbd_brightness_set_by_hwd(u32 event_data);
+
 static void hp_wmi_notify(union acpi_object *obj, void *context)
 {
        u32 event_id, event_data;
@@ -1222,6 +1266,7 @@ static void hp_wmi_notify(union acpi_object *obj, voi=
d *context)
        case HPWMI_PROXIMITY_SENSOR:
                break;
        case HPWMI_BACKLIT_KB_BRIGHTNESS:
+               hp_kbd_brightness_set_by_hwd(event_data);
                break;
        case HPWMI_PEAKSHIFT_PERIOD:
                break;
@@ -1484,6 +1529,241 @@ static int __init hp_wmi_rfkill2_setup(struct platf=
orm_device *device)
        return err;
 }
=20
+static struct hp_kbd_led_priv *hp_led_get_priv(struct led_classdev *led_cd=
ev)
+{
+       struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
+       int zone =3D mc_cdev - hp_multicolor_leds.devices;
+
+       return &hp_multicolor_leds.priv[zone];
+}
+
+static int hp_kbd_backlight_set_rgb_color(int zone, int red, int green, in=
t blue)
+{
+       u8 color_table[128];
+       int ret;
+
+       /*
+        * Get the current color table and then change only the relevant pa=
rts.
+        */
+       ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY,
+                                  HPWMI_BACKLIGHT, color_table,
+                                  zero_if_sup(color_table),
+                                  sizeof(color_table));
+       if (ret)
+               return ret;
+
+       /*
+        * RGB color data starts at offset 25 +3 per zone (r g b)
+        * e.g. if zone 1 starts in 25 zone 2 starts in 28
+        */
+       color_table[HP_COLOR_TABLE_PADDING + zone * 3]     =3D red;
+       color_table[HP_COLOR_TABLE_PADDING + zone * 3 + 1] =3D green;
+       color_table[HP_COLOR_TABLE_PADDING + zone * 3 + 2] =3D blue;
+
+       ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, HPWMI=
_BACKLIGHT,
+                                  color_table, sizeof(color_table), sizeof=
(color_table));
+       if (ret < 0)
+               return ret;
+       if (ret)
+               return -EINVAL;
+
+       return 0;
+}
+
+static bool hp_kbd_backlight_is_on(void)
+{
+       u8 data;
+       int ret;
+
+       ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, =
HPWMI_BACKLIGHT, &data,
+                               sizeof(data), sizeof(data));
+       if (ret)
+               return false;
+
+       return data =3D=3D HPWMI_BACKLIGHT_SET_ON_QUERY;
+}
+
+static int hp_kbd_set_brightness(struct led_classdev *led_cdev,
+                                       enum led_brightness brightness)
+{
+       struct hp_kbd_led_priv *priv =3D hp_led_get_priv(led_cdev);
+       struct led_classdev_mc *mc_cdev;
+       struct led_classdev_mc *device;
+       int red, green, blue;
+       int ret;
+
+       if (!hp_kbd_backlight_is_on()) {
+               u8 data =3D HPWMI_BACKLIGHT_SET_ON_QUERY;
+
+               ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_SET=
_QUERY,
+                                          HPWMI_BACKLIGHT, &data,
+                                          sizeof(data), sizeof(data));
+               if (ret)
+                       return ret;
+
+               /*
+                * Turning the backlight on via WMI turns all zones,
+                * so we need to restore the other zones' off state.
+                */
+               for (int i =3D 0; i < ARRAY_SIZE(hp_multicolor_leds.devices=
); i++) {
+                       if (i =3D=3D priv->zone)
+                               continue;
+
+                       device =3D &hp_multicolor_leds.devices[i];
+                       if (!device->led_cdev.name)
+                               continue;
+                       hp_kbd_backlight_set_rgb_color(i,
+                               device->subled_info[0].brightness,
+                               device->subled_info[1].brightness,
+                               device->subled_info[2].brightness);
+               }
+       }
+
+       led_cdev->brightness =3D brightness;
+
+       mc_cdev =3D lcdev_to_mccdev(led_cdev);
+       led_mc_calc_color_components(mc_cdev, brightness);
+
+       red =3D mc_cdev->subled_info[0].brightness;
+       green =3D mc_cdev->subled_info[1].brightness;
+       blue =3D mc_cdev->subled_info[2].brightness;
+
+       return hp_kbd_backlight_set_rgb_color(priv->zone, red, green, blue);
+}
+
+static void hp_kbd_brightness_set_by_hwd(u32 event_data)
+{
+       struct device *dev =3D &hp_wmi_platform_dev->dev;
+       struct led_classdev *led_cdev;
+       struct hp_kbd_led_priv *priv;
+       u8 brightness;
+
+       for (int zone =3D 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices);=
 zone++) {
+               if (!hp_multicolor_leds.devices[zone].led_cdev.name)
+                       continue;
+
+               led_cdev =3D &hp_multicolor_leds.devices[zone].led_cdev;
+               if (!led_cdev->dev)
+                       continue;
+
+               priv =3D hp_led_get_priv(led_cdev);
+
+               if (event_data =3D=3D 0x2) {
+                       brightness =3D priv->last_brightness ? : LED_FULL;
+               } else if (event_data =3D=3D 0x0) {
+                       priv->last_brightness =3D led_cdev->brightness;
+                       brightness =3D LED_OFF;
+               } else {
+                       dev_warn(dev, "Unknown keyboard backlight event - 0=
x%x\n",
+                                event_data);
+                       return;
+               }
+
+               led_cdev->brightness =3D brightness;
+               led_classdev_notify_brightness_hw_changed(led_cdev, brightn=
ess);
+       }
+}
+
+static int __init hp_mc_leds_register(int num_zones)
+{
+       u8 color_table[128];
+       int ret;
+
+       ret =3D hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY, HPWMI=
_BACKLIGHT,
+                                  color_table, zero_if_sup(color_table),
+                                  sizeof(color_table));
+       if (ret)
+               return ret;
+
+       for (int zone =3D 0; zone < num_zones; zone++) {
+               struct led_classdev_mc *multicolor_led_dev;
+               struct led_classdev *led_cdev;
+               struct mc_subled *mc_subled_info;
+               struct hp_kbd_led_priv *priv;
+               struct device *dev;
+
+               dev =3D &hp_wmi_platform_dev->dev;
+               multicolor_led_dev =3D &hp_multicolor_leds.devices[zone];
+               led_cdev =3D &multicolor_led_dev->led_cdev;
+               priv =3D &hp_multicolor_leds.priv[zone];
+
+               if (num_zones =3D=3D 1)
+                       led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
+                                                       "hp::kbd_backlight"=
);
+               else if (num_zones =3D=3D 4 && zone < ARRAY_SIZE(hp_zone_na=
mes_4))
+                       led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
+                                                       "hp::kbd_%s",
+                                                       hp_zone_names_4[zon=
e]);
+               else if (num_zones > 1)
+                       led_cdev->name =3D devm_kasprintf(dev, GFP_KERNEL,
+                                                       "hp::kbd_zoned_back=
light-%d",
+                                                       zone);
+
+               if (!led_cdev->name)
+                       return -ENOMEM;
+               led_cdev->brightness =3D hp_kbd_backlight_is_on() ?
+                                      LED_FULL : LED_OFF;
+               led_cdev->max_brightness =3D LED_FULL;
+               led_cdev->brightness_set_blocking =3D hp_kbd_set_brightness;
+               led_cdev->flags =3D LED_CORE_SUSPENDRESUME |
+                                 LED_RETAIN_AT_SHUTDOWN |
+                                 LED_BRIGHT_HW_CHANGED;
+
+               mc_subled_info =3D devm_kzalloc(dev, sizeof(*mc_subled_info=
) * 3,
+                                             GFP_KERNEL);
+               if (!mc_subled_info)
+                       return -ENOMEM;
+
+               mc_subled_info[0].color_index =3D LED_COLOR_ID_RED;
+               mc_subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
+               mc_subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
+
+               for (int i =3D 0; i < 3; i++) {
+                       int off =3D HP_COLOR_TABLE_PADDING + zone * 3 + i;
+
+                       mc_subled_info[i].channel =3D zone * 3 + i;
+                       mc_subled_info[i].intensity =3D color_table[off];
+                       mc_subled_info[i].brightness =3D LED_FULL;
+               }
+
+               multicolor_led_dev->subled_info =3D mc_subled_info;
+               multicolor_led_dev->num_colors =3D 3;
+
+               ret =3D devm_led_classdev_multicolor_register(dev, multicol=
or_led_dev);
+               if (ret) {
+                       dev_err(dev, "Failed to register multicolor RGB bac=
klight\n");
+                       return ret;
+               }
+
+               /* Initialize private data */
+               priv->zone =3D zone;
+               priv->last_brightness =3D LED_FULL;
+       }
+       return 0;
+}
+
+static int __init hp_kbd_rgb_setup(void)
+{
+       u8 keyboard_type;
+       int ret;
+
+       ret =3D hp_wmi_perform_query(HPWMI_GET_KEYBOARD_TYPE_QUERY, HPWMI_G=
M, &keyboard_type,
+                                  sizeof(keyboard_type), sizeof(keyboard_t=
ype));
+       if (ret)
+               return ret;
+
+       switch (keyboard_type) {
+       case HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD:
+       case HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD:
+               return hp_mc_leds_register(4);
+       case HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD:
+       case HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD:
+               return hp_mc_leds_register(1);
+       default:
+               return 0;
+       }
+}
+
 static int platform_profile_omen_get_ec(enum platform_profile_option *prof=
ile)
 {
        int tp;
@@ -2285,7 +2565,9 @@ static int __init hp_wmi_bios_setup(struct platform_d=
evice *device)
                return err;
=20
        thermal_profile_setup(device);
=2D
+       err =3D hp_kbd_rgb_setup();
+       if (err)
+               dev_err(&device->dev, "Failed to initialize keyboard RGB\n"=
);
        return 0;
 }
=20
=2D-=20
2.54.0



=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 =D1=81=D1=80=D0=B5=
=D0=B4=D0=B0, 10 =D0=B8=D1=8E=D0=BD=D1=8F 2026=E2=80=AF=D0=B3. 19:18:39 =D0=
=9A=D1=80=D0=B0=D1=81=D0=BD=D0=BE=D1=8F=D1=80=D1=81=D0=BA, =D1=81=D1=82=D0=
=B0=D0=BD=D0=B4=D0=B0=D1=80=D1=82=D0=BD=D0=BE=D0=B5 =D0=B2=D1=80=D0=B5=D0=
=BC=D1=8F =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=
=BB=D1=8C Ilpo J=C3=A4rvinen =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On Mon, 18 May 2026, =D0=9A=D0=BE=D0=BD=D0=B5=D0=BD=D0=BA=D0=BE =D0=90=D0=
=BD=D0=B4=D1=80=D0=B5=D0=B9 =D0=92=D0=B8=D0=BA=D1=82=D0=BE=D1=80=D0=BE=D0=
=B2=D0=B8=D1=87 wrote:
>=20
> > >=20
> > > I'm afraid the names are still wrong. Your patch results in e.g. :
> > >=20
> > > hp::kbd_backlight_zone-right
> > >=20
> > > where as per:
> > >=20
> > > https://lore.kernel.org/linux-leds/20260504145434.12746-1-johannes.go=
ede@oss
> > > .qualcomm.com/
> > >=20
> > > this should be:
> > >=20
> > > hp::kbd_zoned_backlight-right
> > >=20
> > > Regards,
> > >=20
> > > Hans
> > >=20
> >=20
> > I would like to sincerely apologize for the mistake in understanding th=
e=20
> > documentation. I received feedback pointing out my error, corrected it=
=20
> > accordingly, but unfortunately, there was still an oversight. After bei=
ng=20
> > notified of the second error, I have now thoroughly reviewed everything=
 again=20
> > and made all necessary corrections.
> >=20
> > I truly appreciate your patience and guidance throughout this process. =
Your=20
> > feedback has been extremely helpful in helping me reach the correct=20
> > understanding. I am committed to ensuring that all future submissions a=
re=20
> > fully compliant with the documentation requirements.
> >=20
> > Thank you for your time and understanding.
> >=20
> > ---
> >=20
> > From: Edip Hazuri <edip@medip.dev>
> >=20
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
> >=20
> > Changes since v7:
> >  - The LED class device names changed to be consistent with the documen=
tation.
> >=20
> > Changes since v6:
> >  - The LED class device names have been made more consistent with the=20
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
> >=20
> >  drivers/platform/x86/hp/Kconfig  |   2 +
> >  drivers/platform/x86/hp/hp-wmi.c | 284 ++++++++++++++++++++++++++++++-
> >  2 files changed, 285 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/=
Kconfig
> > index dd51491b9bcd..2a1841cbec76 100644
> > --- a/drivers/platform/x86/hp/Kconfig
> > +++ b/drivers/platform/x86/hp/Kconfig
> > @@ -45,6 +45,8 @@ config HP_WMI
> >  	select INPUT_SPARSEKMAP
> >  	select ACPI_PLATFORM_PROFILE
> >  	select HWMON
> > +	select LEDS_CLASS
> > +	select LEDS_CLASS_MULTICOLOR
> >  	help
> >  	  Say Y here if you want to support WMI-based hotkeys on HP laptops=20
> > and
> >  	  to read data from WMI such as docking or ambient light sensor=20
> > state.
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-
> > wmi.c
> > index d1cc6e7d176c..19da18f68337 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -14,6 +14,7 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > =20
> >  #include <linux/acpi.h>
> > +#include <linux/array_size.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/compiler_attributes.h>
> >  #include <linux/dmi.h>
> > @@ -23,6 +24,8 @@
> >  #include <linux/input.h>
> >  #include <linux/input/sparse-keymap.h>
> >  #include <linux/kernel.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/leds.h>
> >  #include <linux/limits.h>
> >  #include <linux/minmax.h>
> >  #include <linux/module.h>
> > @@ -57,6 +60,7 @@ enum hp_ec_offsets {
> > =20
> >  #define HP_FAN_SPEED_AUTOMATIC	 0x00
> >  #define HP_POWER_LIMIT_DEFAULT	 0x00
> > +#define HP_COLOR_TABLE_PADDING	 25
> >  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> > =20
> >  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use wh=
en zero=20
> > insize is required
>=20
> Long lines in this patch seem corrupted.
>=20
>=20




