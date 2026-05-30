Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347D34104B;
	Sat, 30 May 2026 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160907; cv=none; b=ZXZ4EpsdWCYHhPrpxiGjV1MRIY661Rb64H1+1tWIJpy/e8EB9r9vxylRioJgCO46uAYhFTAyjkBmXEmFlKgxsvnXtj3we2PAhOVrq4F9IdURELGf7bAvyLfsR+908ZyHF26mPFar9VuR6dI/UqUp3gThqEpalYvai6V5HlfV0qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160907; c=relaxed/simple;
	bh=ompSXeXYx/a39mO1OsBxKknBFvmAevt6wFCGqlgGlgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FqNFxbvREogD2Sksee/KjXt6CgUD7jAwXgkRIS/E6QKuLO1UJlwm1VEFmI1wl+96ukHCcLQNuNsB7Ql6stpRg5O7BReBuCtYLEnb/k5qGn69iSD2xLAnN83Uk9NAe67re1f+vbBn+c6dB6Xf49YvwatGT0HaHzlUO3dpsJo6dxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VPoRcPUM; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VPoRcPUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160902; x=1780765702; i=w_armin@gmx.de;
	bh=gkRk4JY2Ksgn3gniRstDy80OcK4f5fTyJ1e1CTy7PJM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VPoRcPUMMjV2I59OWhUDjtbM91dXxyn0rb1NLme/00yOpK1piwXS4YCcI+n97hfB
	 vYA4k695Q77caokZRmJloe3uCb4giqq+oJWRqkTeJEl17o+oHap6c9ziAFliiNmwu
	 J3lvhKDJPh8nAe6QtMJu8VNzfVgrscuXw5ogPOPQCcWNznRrrXL4T/DrDwiLV7YRJ
	 ZeF0fVTItrfatrh+LtlQgXNExgVUlFDET02IDWW8Qt3LYuGd1OBT/tOEE+IDB+Lle
	 W1GULR7hprXhW3j9TrB2/Qjp76sMIJZNjRTI6o0ZRHZRvukwR/pro/m67Dt653DmS
	 zixF2TaVk8ROszUwug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1x0mNd2oBj-00fJAZ; Sat, 30
 May 2026 19:08:22 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 1/7] platform/x86: uniwill-laptop: Add keyboard backlight support
Date: Sat, 30 May 2026 19:08:07 +0200
Message-Id: <20260530170813.10166-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kx0Va9ciVLPkPec6u/HCZOThV42T+XLT0er7KJCuAWHvcWj2Y74
 uHlUkPOcvJCKeLcxXn1tAGYirf3Al2r+nJZwC5zIbxE0ZGXyXXeLIyFMgZP0OhKhiloW/mb
 W/GBBasKwLN2kOcjUhG9a8I6ccRF7l5/WaADQEzEIp9wOlFYNNDzniQABo2O5ivWmcJi4dw
 gko3QZ3uL9uZrmHHQlOdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VcwIhsUrJnY=;jAqRxmzXURK+MXI5/lBOB9ACNO7
 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
 3MwjNlZrdbLeqq096U=

Many Uniwill-based devices support either a white-only or fully
features RGB keyboard backlight. Add support for this feature
and handle the associated WMI events.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../admin-guide/laptops/uniwill-laptop.rst    |  13 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 392 +++++++++++++++++-
 2 files changed, 397 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index 24b41dbab886..2b1e5da703a5 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -77,6 +77,19 @@ LED class device. The default name of this LED class de=
vice is ``uniwill:multico
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on =
how to control the various
 animation modes of the lightbar.
=20
+Keyboard Backlight
+------------------
+
+The ``uniwill-laptop`` driver supports controlling the keyboard backlight=
 using the standard
+LED class interface. The default name of this LED class device is ``uniwi=
ll:white:kbd_backlight``
+when the keyboard backlight supports only a single color, or ``uniwill:mu=
lticolor:kbd_backlight``
+when the keyboard backlight supports RGB colors. The maximum intensity fo=
r each color channel
+in RGB mode is 50.
+
+Keep in mind that due to hardware design choices, the driver does not sup=
port the RGB value
+``0x000000`` (black), instead it will fall back to ``0x010101`` (faint wh=
ite). In order to
+disable the keyboard backlight, the standard LED brightness setting has t=
o be used instead.
+
 Configurable TGP
 ----------------
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index ab063ead45b9..fd040197b189 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -110,8 +110,31 @@
 #define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
=20
 #define EC_ADDR_PROJECT_ID		0x0740
+#define PROJECT_ID_NONE			0x00
+#define PROJECT_ID_GI			0x01
+#define PROJECT_ID_GJ			0x02
+#define PROJECT_ID_GK			0x03
+#define PROJECT_ID_GICN			0x04
+#define PROJECT_ID_GJCN			0x05
+#define PROJECT_ID_GK5CN_X		0x06
+#define PROJECT_ID_GK7CN_S		0x07
+#define PROJECT_ID_GK7CPCS_GK5CQ7Z	0x08
+#define PROJECT_ID_PF			0x09
+#define PROJECT_ID_GK5CP_4X_5X_6X	0x0A
+#define PROJECT_ID_IDP			0x0B
+#define PROJECT_ID_IDY_6Y		0x0C
+#define PROJECT_ID_IDY_7Y		0x0D
+#define PROJECT_ID_PF4MU_PF4MN_PF5MU	0x0E
+#define PROJECT_ID_CML_GAMING		0x0F
+#define PROJECT_ID_GK7NXXR		0x10
+#define PROJECT_ID_GM5MU1Y		0x11
 #define PROJECT_ID_PH4TRX1		0x12
+#define PROJECT_ID_PH4TUX1		0x13
+#define PROJECT_ID_PH4TQX1		0x14
 #define PROJECT_ID_PH6TRX1		0x15
+#define PROJECT_ID_PH6TQXX		0x16
+#define PROJECT_ID_PHXAXXX		0x17
+#define PROJECT_ID_PHXPXXX		0x18
=20
 #define EC_ADDR_AP_OEM			0x0741
 #define	ENABLE_MANUAL_CTRL		BIT(0)
@@ -214,6 +237,7 @@
 #define FAN_TABLE_OFFICE_MODE		BIT(2)
 #define FAN_V3				BIT(3)
 #define DEFAULT_MODE			BIT(4)
+#define ENABLE_CHINA_MODE		BIT(6)
=20
 #define EC_ADDR_PL1_SETTING		0x0783
=20
@@ -225,11 +249,11 @@
 #define FAN_CURVE_LENGTH		5
=20
 #define EC_ADDR_KBD_STATUS		0x078C
-#define KBD_WHITE_ONLY			BIT(0)	// ~single color
-#define KBD_SINGLE_COLOR_OFF		BIT(1)
+#define KBD_WHITE_ONLY			BIT(0)
+#define KBD_POWER_OFF			BIT(1)
 #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
 #define KBD_APPLY			BIT(4)
-#define KBD_BRIGHTNESS			GENMASK(7, 5)
+#define KBD_BRIGHTNESS_MASK		GENMASK(7, 5)
=20
 #define EC_ADDR_FAN_CTRL		0x078E
 #define FAN3P5				BIT(1)
@@ -320,6 +344,9 @@
 #define LED_CHANNELS		3
 #define LED_MAX_BRIGHTNESS	200
=20
+#define KBD_LED_CHANNELS	3
+#define KBD_LED_MAX_INTENSITY	50
+
 #define UNIWILL_FEATURE_FN_LOCK			BIT(0)
 #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
@@ -333,6 +360,7 @@
 #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
 #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
+#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
=20
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING =3D 0,
@@ -344,6 +372,7 @@ struct uniwill_data {
 	acpi_handle handle;
 	struct regmap *regmap;
 	unsigned int features;
+	u8 project_id;
 	struct acpi_battery_hook hook;
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
 	union {
@@ -362,6 +391,18 @@ struct uniwill_data {
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
 	struct led_classdev_mc led_mc_cdev;
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
+	bool single_color_kbd;
+	u8 kbd_led_max_brightness;
+	unsigned int last_kbd_status;
+	union {
+		struct {
+			/* Protects writes to the RGB keyboard backlight registers */
+			struct mutex kbd_rgb_led_lock;
+			struct led_classdev_mc kbd_led_mc_cdev;
+			struct mc_subled kbd_led_mc_subled_info[KBD_LED_CHANNELS];
+		};
+		struct led_classdev kbd_led_cdev;
+	};
 	struct mutex input_lock;	/* Protects input sequence during notify */
 	struct input_dev *input_device;
 	struct notifier_block nb;
@@ -376,6 +417,7 @@ struct uniwill_battery_entry {
=20
 struct uniwill_device_descriptor {
 	unsigned int features;
+	u8 kbd_led_max_brightness;
 	/* Executed during driver probing */
 	int (*probe)(struct uniwill_data *data);
 };
@@ -427,6 +469,9 @@ static const struct key_entry uniwill_keymap[] =3D {
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLUMDO=
WN }},
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMUP,                 { KEY_KBDILLUMUP=
 }},
=20
+	/* Reported when the EC changed the keyboard backlight brightness */
+	{ KE_IGNORE,	UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE,	{ KEY_UNKNOWN }},
+
 	/* Reported when the user wants to toggle the microphone mute status */
 	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }}=
,
=20
@@ -435,11 +480,6 @@ static const struct key_entry uniwill_keymap[] =3D {
=20
 	/* Reported when the user wants to toggle the brightness of the keyboard=
 */
 	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTO=
GGLE }},
-	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUMTO=
GGLE }},
-	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              { KEY_KBDILLUMTO=
GGLE }},
-	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              { KEY_KBDILLUMTO=
GGLE }},
-	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              { KEY_KBDILLUMTO=
GGLE }},
-	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              { KEY_KBDILLUMTO=
GGLE }},
=20
 	/* FIXME: find out the exact meaning of those events */
 	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }}=
,
@@ -547,6 +587,11 @@ static bool uniwill_writeable_reg(struct device *dev,=
 unsigned int reg)
 	case EC_ADDR_LIGHTBAR_AC_BLUE:
 	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_TRIGGER:
+	case EC_ADDR_RGB_RED:
+	case EC_ADDR_RGB_GREEN:
+	case EC_ADDR_RGB_BLUE:
+	case EC_ADDR_BIOS_OEM_2:
+	case EC_ADDR_KBD_STATUS:
 	case EC_ADDR_OEM_4:
 	case EC_ADDR_CHARGE_CTRL:
 	case EC_ADDR_LIGHTBAR_BAT_CTRL:
@@ -583,8 +628,14 @@ static bool uniwill_readable_reg(struct device *dev, =
unsigned int reg)
 	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_PWM_1:
 	case EC_ADDR_PWM_2:
+	case EC_ADDR_SUPPORT_2:
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
+	case EC_ADDR_RGB_RED:
+	case EC_ADDR_RGB_GREEN:
+	case EC_ADDR_RGB_BLUE:
+	case EC_ADDR_BIOS_OEM_2:
+	case EC_ADDR_KBD_STATUS:
 	case EC_ADDR_OEM_4:
 	case EC_ADDR_CHARGE_CTRL:
 	case EC_ADDR_LIGHTBAR_BAT_CTRL:
@@ -616,8 +667,10 @@ static bool uniwill_volatile_reg(struct device *dev, =
unsigned int reg)
 	case EC_ADDR_BIOS_OEM:
 	case EC_ADDR_PWM_1:
 	case EC_ADDR_PWM_2:
+	case EC_ADDR_SUPPORT_2:
 	case EC_ADDR_TRIGGER:
 	case EC_ADDR_SWITCH_STATUS:
+	case EC_ADDR_KBD_STATUS:
 	case EC_ADDR_OEM_4:
 	case EC_ADDR_CHARGE_CTRL:
 	case EC_ADDR_USB_C_POWER_PRIORITY:
@@ -1441,6 +1494,246 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
 							 &init_data);
 }
=20
+static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightne=
ss)
+{
+	struct led_classdev *led_cdev;
+	int ret;
+
+	if (data->single_color_kbd)
+		led_cdev =3D &data->kbd_led_cdev;
+	else
+		led_cdev =3D &data->kbd_led_mc_cdev.led_cdev;
+
+	guard(mutex)(&led_cdev->led_access);
+
+	/* Sync the LED brightness with the actual hardware state */
+	ret =3D led_update_brightness(led_cdev);
+	if (ret < 0)
+		return ret;
+
+	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+
+	return 0;
+}
+
+#define KBD_LED_MASK	(KBD_BRIGHTNESS_MASK | KBD_APPLY | KBD_POWER_OFF)
+
+static int uniwill_kbd_led_write_brightness(struct uniwill_data *data, in=
t brightness)
+{
+	/* KBD_POWER_OFF is always implicitly cleared */
+	unsigned int regval =3D FIELD_PREP(KBD_BRIGHTNESS_MASK, brightness) | KB=
D_APPLY;
+
+	/* We must ensure that the "apply" bit is always written */
+	return regmap_write_bits(data->regmap, EC_ADDR_KBD_STATUS, KBD_LED_MASK,=
 regval);
+}
+
+static int uniwill_kbd_led_read_brightness(struct uniwill_data *data)
+{
+	unsigned int regval;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
+	if (ret < 0)
+		return ret;
+
+	return min(FIELD_GET(KBD_BRIGHTNESS_MASK, regval), data->kbd_led_max_bri=
ghtness);
+}
+
+static int uniwill_kbd_led_brightness_set(struct led_classdev *led_cdev,
+					  enum led_brightness brightness)
+{
+	struct uniwill_data *data =3D container_of(led_cdev, struct uniwill_data=
, kbd_led_cdev);
+
+	return uniwill_kbd_led_write_brightness(data, brightness);
+}
+
+static enum led_brightness uniwill_kbd_led_brightness_get(struct led_clas=
sdev *led_cdev)
+{
+	struct uniwill_data *data =3D container_of(led_cdev, struct uniwill_data=
, kbd_led_cdev);
+
+	return uniwill_kbd_led_read_brightness(data);
+}
+
+static const unsigned int uniwill_kbd_led_channel_to_reg[KBD_LED_CHANNELS=
] =3D {
+	EC_ADDR_RGB_RED,
+	EC_ADDR_RGB_GREEN,
+	EC_ADDR_RGB_BLUE,
+};
+
+static int uniwill_kbd_led_mc_brightness_set(struct led_classdev *led_cde=
v,
+					     enum led_brightness brightness)
+{
+	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
+	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwill_d=
ata, kbd_led_mc_cdev);
+	unsigned int min_intensity =3D 0;
+	unsigned int regval;
+	int ret;
+
+	guard(mutex)(&data->kbd_rgb_led_lock);
+
+	/*
+	 * The EC interprets a RGB value of 0x000000 as a command to restore
+	 * the device-specfic default RGB value. Work around this by writing
+	 * a RGB value of 0x010101 (faint white) instead.
+	 */
+	if (data->kbd_led_mc_subled_info[0].intensity =3D=3D 0 &&
+	    data->kbd_led_mc_subled_info[1].intensity =3D=3D 0 &&
+	    data->kbd_led_mc_subled_info[2].intensity =3D=3D 0)
+		min_intensity =3D 1;
+
+	for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
+		regval =3D max(data->kbd_led_mc_subled_info[i].intensity, min_intensity=
);
+		ret =3D regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], r=
egval);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR=
, RGB_APPLY_COLOR);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_kbd_led_write_brightness(data, brightness);
+}
+
+static enum led_brightness uniwill_kbd_led_mc_brightness_get(struct led_c=
lassdev *led_cdev)
+{
+	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
+	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwill_d=
ata, kbd_led_mc_cdev);
+
+	return uniwill_kbd_led_read_brightness(data);
+}
+
+static int uniwill_kbd_led_init(struct uniwill_data *data)
+{
+	unsigned int color_indices[KBD_LED_CHANNELS] =3D {
+		LED_COLOR_ID_RED,
+		LED_COLOR_ID_GREEN,
+		LED_COLOR_ID_BLUE,
+	};
+	struct led_init_data init_data =3D {
+		.devicename =3D DRIVER_NAME,
+		.devname_mandatory =3D true,
+	};
+	bool intensity_all_zeros =3D true;
+	bool needs_trigger =3D false;
+	unsigned int regval;
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+		return 0;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &regval);
+	if (ret < 0)
+		return ret;
+
+	if (!(regval & CHINA_MODE)) {
+		ret =3D regmap_set_bits(data->regmap, EC_ADDR_BIOS_OEM_2, ENABLE_CHINA_=
MODE);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
+	if (ret < 0)
+		return ret;
+
+	regval |=3D KBD_APPLY;
+	regval &=3D ~KBD_POWER_OFF;
+	ret =3D regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
+	if (ret < 0)
+		return ret;
+
+	switch (data->project_id) {
+	case PROJECT_ID_PF:
+	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
+	case PROJECT_ID_PH4TRX1:
+	case PROJECT_ID_PH4TUX1:
+	case PROJECT_ID_PH4TQX1:
+	case PROJECT_ID_PH6TRX1:
+	case PROJECT_ID_PH6TQXX:
+	case PROJECT_ID_PHXAXXX:
+	case PROJECT_ID_PHXPXXX:
+		data->single_color_kbd =3D true;
+		break;
+	default:
+		data->single_color_kbd =3D regval & KBD_WHITE_ONLY;
+		break;
+	}
+
+	if (data->single_color_kbd) {
+		init_data.default_label =3D "white:" LED_FUNCTION_KBD_BACKLIGHT;
+		data->kbd_led_cdev.max_brightness =3D data->kbd_led_max_brightness;
+		data->kbd_led_cdev.color =3D LED_COLOR_ID_WHITE;
+		data->kbd_led_cdev.flags =3D LED_BRIGHT_HW_CHANGED | LED_REJECT_NAME_CO=
NFLICT;
+		data->kbd_led_cdev.brightness_set_blocking =3D uniwill_kbd_led_brightne=
ss_set;
+		data->kbd_led_cdev.brightness_get =3D uniwill_kbd_led_brightness_get;
+
+		return devm_led_classdev_register_ext(data->dev, &data->kbd_led_cdev, &=
init_data);
+	}
+
+	for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
+		data->kbd_led_mc_subled_info[i].color_index =3D color_indices[i];
+
+		ret =3D regmap_read(data->regmap, uniwill_kbd_led_channel_to_reg[i], &r=
egval);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * Make sure that the initial intensity value is not greater than
+		 * the maximum intensity.
+		 */
+		if (regval > KBD_LED_MAX_INTENSITY) {
+			regval =3D KBD_LED_MAX_INTENSITY;
+			ret =3D regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], =
regval);
+			if (ret < 0)
+				return ret;
+
+			needs_trigger =3D true;
+		}
+
+		if (regval)
+			intensity_all_zeros =3D false;
+
+		data->kbd_led_mc_subled_info[i].intensity =3D regval;
+		data->kbd_led_mc_subled_info[i].max_intensity =3D KBD_LED_MAX_INTENSITY=
;
+		data->kbd_led_mc_subled_info[i].channel =3D i;
+	}
+
+	/* See uniwill_kbd_led_mc_brightness_set() for an explaination. */
+	if (intensity_all_zeros) {
+		for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
+			data->kbd_led_mc_subled_info[i].intensity =3D 1;
+			ret =3D regmap_write(data->regmap, uniwill_kbd_led_channel_to_reg[i], =
1);
+			if (ret < 0)
+				return ret;
+		}
+
+		needs_trigger =3D true;
+	}
+
+	if (needs_trigger) {
+		ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLO=
R,
+					RGB_APPLY_COLOR);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D devm_mutex_init(data->dev, &data->kbd_rgb_led_lock);
+	if (ret < 0)
+		return ret;
+
+	init_data.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT;
+	data->kbd_led_mc_cdev.led_cdev.max_brightness =3D data->kbd_led_max_brig=
htness;
+	data->kbd_led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
+	data->kbd_led_mc_cdev.led_cdev.flags =3D LED_BRIGHT_HW_CHANGED | LED_REJ=
ECT_NAME_CONFLICT;
+	data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_kbd_l=
ed_mc_brightness_set;
+	data->kbd_led_mc_cdev.led_cdev.brightness_get =3D uniwill_kbd_led_mc_bri=
ghtness_get;
+	data->kbd_led_mc_cdev.subled_info =3D data->kbd_led_mc_subled_info;
+	data->kbd_led_mc_cdev.num_colors =3D KBD_LED_CHANNELS;
+
+	return devm_led_classdev_multicolor_register_ext(data->dev, &data->kbd_l=
ed_mc_cdev,
+							 &init_data);
+}
+
 static unsigned int uniwill_sanitize_battery_threshold(unsigned int value=
)
 {
 	/* 0 means "charging threshold not active" */
@@ -1789,6 +2082,31 @@ static int uniwill_notifier_call(struct notifier_bl=
ock *nb, unsigned long action
 		sysfs_notify(&data->dev->kobj, NULL, "fn_lock");
=20
 		return NOTIFY_OK;
+	case UNIWILL_OSD_KB_LED_LEVEL0:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+			return NOTIFY_DONE;
+
+		return notifier_from_errno(uniwill_notify_kbd_led(data, 0));
+	case UNIWILL_OSD_KB_LED_LEVEL1:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+			return NOTIFY_DONE;
+
+		return notifier_from_errno(uniwill_notify_kbd_led(data, 1));
+	case UNIWILL_OSD_KB_LED_LEVEL2:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+			return NOTIFY_DONE;
+
+		return notifier_from_errno(uniwill_notify_kbd_led(data, 2));
+	case UNIWILL_OSD_KB_LED_LEVEL3:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+			return NOTIFY_DONE;
+
+		return notifier_from_errno(uniwill_notify_kbd_led(data, 3));
+	case UNIWILL_OSD_KB_LED_LEVEL4:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+			return NOTIFY_DONE;
+
+		return notifier_from_errno(uniwill_notify_kbd_led(data, 4));
 	default:
 		mutex_lock(&data->input_lock);
 		sparse_keymap_report_event(data->input_device, action, 1, true);
@@ -1842,6 +2160,7 @@ static int uniwill_ec_init(struct uniwill_data *data=
)
 	if (ret < 0)
 		return ret;
=20
+	data->project_id =3D value;
 	dev_dbg(data->dev, "Project ID: %u\n", value);
=20
 	ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL=
);
@@ -1885,6 +2204,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
 		return ret;
=20
 	data->features =3D device_descriptor.features;
+	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
=20
 	/*
 	 * Some devices might need to perform some device-specific initializatio=
n steps
@@ -1905,6 +2225,10 @@ static int uniwill_probe(struct platform_device *pd=
ev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_kbd_led_init(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_hwmon_init(data);
 	if (ret < 0)
 		return ret;
@@ -1976,6 +2300,31 @@ static int uniwill_suspend_battery(struct uniwill_d=
ata *data)
 	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge=
_ctrl);
 }
=20
+static int uniwill_suspend_kbd_led(struct uniwill_data *data)
+{
+	unsigned int regval;
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+		return 0;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Save the current keyboard backlight settings in order to restore them
+	 * during resume. We cannot use the regmap code for that since this regi=
ster
+	 * needs to be declared as volatile because the brightness can be change=
d
+	 * by the EC.
+	 */
+	data->last_kbd_status =3D regval;
+	FIELD_MODIFY(KBD_BRIGHTNESS_MASK, &regval, 0);
+	regval |=3D KBD_APPLY | KBD_POWER_OFF;
+
+	return regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
+}
+
 static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
@@ -2006,6 +2355,10 @@ static int uniwill_suspend(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_suspend_kbd_led(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_suspend_nvidia_ctgp(data);
 	if (ret < 0)
 		return ret;
@@ -2052,6 +2405,23 @@ static int uniwill_resume_battery(struct uniwill_da=
ta *data)
 	return 0;
 }
=20
+static int uniwill_resume_kbd_led(struct uniwill_data *data)
+{
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+		return 0;
+
+	ret =3D regmap_write(data->regmap, EC_ADDR_KBD_STATUS, data->last_kbd_st=
atus | KBD_APPLY);
+	if (ret < 0)
+		return ret;
+
+	if (data->single_color_kbd)
+		return 0;
+
+	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR,=
 RGB_APPLY_COLOR);
+}
+
 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
 {
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
@@ -2096,6 +2466,10 @@ static int uniwill_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
=20
+	ret =3D uniwill_resume_kbd_led(data);
+	if (ret < 0)
+		return ret;
+
 	ret =3D uniwill_resume_nvidia_ctgp(data);
 	if (ret < 0)
 		return ret;
@@ -2745,6 +3119,8 @@ static int __init uniwill_init(void)
 	if (force) {
 		/* Assume that the device supports all features except the charge limit=
 */
 		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
+		/* Some models only support 3 brightness levels */
+		device_descriptor.kbd_led_max_brightness =3D 4;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
=2D-=20
2.39.5

