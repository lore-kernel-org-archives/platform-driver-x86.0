Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258EF426687;
	Wed, 26 Aug 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751258; cv=none; b=E6WUBu5Ipu9KblSlafAuIBSeC+2l5IKZKo7Hz+SWSLdla/+EGfeAwLhNv6z9el0AG/kCC+1bnNURv20XIKc5pwkrLLURTxTwqF8GRFgCspalHH5hEttdP2e/ISvaquynNZ9/gB2fXOV4HzUui/UMHZ5x5NTxBWli0FMbI4PR1cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751258; c=relaxed/simple;
	bh=w57QnjDHpzExAFmVk48MeLjOazGYLxPrDSZVlF5qCUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pNYwhxe1BBeWc8myX1Cg9YD5M+qAGvvIrXWR6LHg0SsMLUDlgQ+wDRjI6T43eqcRabd2iyNGNOINOn2aA9kKj/MCz6CEG4k6I8IoSotV0QxXOSwEsMbXh1nlqKOzZk0KhXFgCQwkSK1xXPm9ubeGsMzJTHaEL+K3FrfzUoDrKkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=Zu2a/rBK; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="Zu2a/rBK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93D27254A2;
	Wed, 26 Aug 2026 16:26:38 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wRphR+98q9mATkUDyP5hjp+KBrOVIz8eprnDaAFhOo8=;
	b=Zu2a/rBKfIo2F/Ui4Louu0mzDv2qZFXjQGp0rc2VbrjLNlrcO3E56JxS+MIunF0g/1KqwP
	3wmYlmOi3wRHAteHzhJFGgD/Rc3HIx9rpJrIxOt+3dLp1h5RYyamwflDa+Ebn4fT/ndcyA
	g15tYZz7rjL36DDc5iNETHn2XWcJcpbfcYqUIzpP7NMkhDn6vGhuJU+nzGpx5VdnY5D7Gd
	AyZpAtzCZfqAzckG40gKXF2LL5bhQ7n5CmuoPTs+NOR8dJuP2a3YiUygXpN4o/5yonoVyC
	WyQLIA6Kx6lJXyVeEjNLrkXewuOuLp7E66ApEjjW8SR95ED5D1M8VG2vpuyr/w==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Yuming Sun <wolf109909@outlook.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@ableh.moe>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 ops and hotkeys
Date: Wed, 26 Aug 2026 16:26:39 +0300
Message-ID: <20260826132639.177830-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816100813.300450-1-qby140326@gmail.com>
References: <20260816100813.300450-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Xiaomi Book Pro 14 2026 (DMI sys_vendor=XIAOMI, board_name=TM2424)
uses five cmd 0x08 bytes that do not fit the four-field mode_map:

  Quiet=0x02, Turbo=0x03, Full-speed=0x04, Auto=0x09, Eco=0x0A

Add a TM2424 entry to the per-machine ops table. SET maps the three
platform_profile choices to Eco / Auto / Full-speed; GET aliases Quiet
and Turbo. Full-speed falls back to Turbo when firmware NACKs.

The reduced firmware does not implement hwmon, keyboard LED or the
gpu_mode/kb_mode/fan_boost attributes.

Map remaining TM2424 HID_EVENT20 keys (projection value 0, AI break
0x24, Mi button 0x25/0x26). Mic-mute 0x21 and settings 0x1B are
already in the merged keymap.

This supersedes the standalone TM2424 quirk
<20260816215825.289356-1-kento@kekto.ru>.

Tested on TM2424-77080: performance on AC holds ~50W package power.
acpi_listen shows HID_EVENT20 as wmi PNP0C14:00 notify 0x20 for the
mic, AI, projection, settings and Mi keys (see cover letter).

Signed-off-by: KentoNion <kento@kekto.ru>
---

This is a follow-up to Mingyou's v5, not a competing rewrite.

v5's four-field mode_map cannot express TM2424: five firmware bytes
(Quiet/Turbo/Full-speed/Auto/Eco) collapse to three platform_profile
choices, GET has aliases, and SET of performance must try Full-speed
then Turbo when firmware NACKs. The new ops callbacks stay NULL on
the Bitland/Redmi paths.

DMI is XIAOMI + TM2424. Mingyou's Xiaomi Book match is TIMI, so this
SKU would otherwise keep the Bitland 0..3 defaults and stay broken.

Yuming's 2/5 names on this machine are inverted (0x03 is Turbo, 0x09
is Auto, 0x0A is Eco). Please do not take that SET mapping for TM2424.

I did not include lid polling or EC fan tachs. On this BIOS the ACPI
EC still starts and Lid Switch already binds; ECON is an unresolved
External used only by _STA (not defined in DSDT or any SSDT). That
is an ACPI firmware bug, not a WMI one. Decoded excerpts and dmesg
are a reply on Yuming's 0/5, In-Reply-To Armin.

I also left the v5 suspend hook alone. Ilpo already nacked the
profile_valid pattern on Yuming 1/5. With this mapping GET no longer
returns unmapped cmd 0x08 bytes on TM2424, so the existing hook
should not abort sleep here. A global never-abort plus a status-word
check still belongs in a separate patch; please take Ilpo's union +
endianness nits there. This patch only looks at output.operation ==
0x80 on TM2424 SET (the accepted byte; same field Yuming packs as
0x8000) so Full-speed can fall back to Turbo.

One regression to watch when v5 is rebased: e0d6312578e1 turned some
redmi-wmi KE_IGNORE entries into KEY_KBDILLUMTOGGLE / KEY_PERFORMANCE
/ KEY_FN_ESC. v5 2/6 still KE_IGNOREs those; please carry Musaev's
mappings into the merged keymap in v6.

The LKP const-qualifier error on the old standalone quirk is obsolete
once v5's non-const DEVICE_ATTR is the base.

Tested on Xiaomi Book Pro 14 2026, SKU TM2424-77080, BIOS XMAPT4B0P0707.

acpi_listen on that machine (HID_EVENT20 is notify 0x20 on PNP0C14:00).
Volume and panel brightness are standard ACPI and do not go through
this driver. The WMI-backed keys with this keymap:

  FN+F4 mic:
    wmi PNP0C14:00 00000020 00000000
    button/micmute MICMUTE 00000080 00000000 K

  FN+F7 AI (make KEY_PROG1; break is KE_IGNORE):
    wmi PNP0C14:00 00000020 00000000
    button/prog1 PROG1 00000080 00000000 K
    wmi PNP0C14:00 00000020 00000000

  FN+F8 projection:
    wmi PNP0C14:00 00000020 00000000
    video/switchmode VMOD 00000080 00000000 K

  FN+F9 settings (KEY_CONFIG, evdev only):
    wmi PNP0C14:00 00000020 00000000

  Mi button (make KEY_VENDOR; break is KE_IGNORE):
    wmi PNP0C14:00 00000020 00000000
    button/vendor VNDR 00000080 00000000 K
    wmi PNP0C14:00 00000020 00000000

Raw session (including power/mute/volume/brightness):

  button/power PBTN 00000080 00000000
  button/power LNXPWRBN:00 00000080 00000001
  button/mute MUTE 00000080 00000000 K
  button/volumeup VOLUP 00000080 00000000 K
  button/volumeup VOLUP 00000080 00000000 K
  button/volumedown VOLDN 00000080 00000000 K
  wmi PNP0C14:00 00000020 00000000
  button/micmute MICMUTE 00000080 00000000 K
  wmi PNP0C14:00 00000020 00000000
  button/micmute MICMUTE 00000080 00000000 K
  video/brightnessdown BRTDN 00000087 00000000
  video/brightnessup BRTUP 00000086 00000000
  wmi PNP0C14:00 00000020 00000000
  button/prog1 PROG1 00000080 00000000 K
  wmi PNP0C14:00 00000020 00000000
  wmi PNP0C14:00 00000020 00000000
  video/switchmode VMOD 00000080 00000000 K
  wmi PNP0C14:00 00000020 00000000
  wmi PNP0C14:00 00000020 00000000
  wmi PNP0C14:00 00000020 00000000
  wmi PNP0C14:00 00000020 00000000
  button/vendor VNDR 00000080 00000000 K
  wmi PNP0C14:00 00000020 00000000

diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
index 9e86ecc..a89f872 100644
--- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
+++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
@@ -93,8 +93,13 @@ The following Command IDs are used in the third byte of the buffer:
 +----------+-----------------------+------------------------------------------+
 | ID       | Name                  | Values / Description                     |
 +==========+=======================+==========================================+
-| 8        | SystemPerMode         | 0: Balance, 1: Performance, 2: Quiet,    |
-|          |                       | 3: Full-speed                            |
+| 8        | SystemPerMode         | Bitland gaming: 0 Balance, 1             |
+|          |                       | Performance, 2 Quiet, 3 Full-speed.      |
+|          |                       | Redmi: 0 Performance, 1 Balanced, 2      |
+|          |                       | Quiet, 4 Full-speed.                     |
+|          |                       | TM2424 (Xiaomi Book Pro 14): 0x02        |
+|          |                       | Quiet, 0x03 Turbo, 0x04 Full-speed,      |
+|          |                       | 0x09 Auto, 0x0A Eco.                     |
 +----------+-----------------------+------------------------------------------+
 | 9        | GPUMode               | 0: Hybrid, 1: Discrete, 2: UMA           |
 +----------+-----------------------+------------------------------------------+
@@ -188,11 +193,8 @@ Performance Modes
 -----------------
 Changing the performance mode via Command ID 0x08 (SystemPerMode) affects the
 power limits (PL1/PL2) and fan curves managed by the Embedded Controller (EC).
-Note that the "Full-speed" and "Performance" mode (1, 3) is typically only
-available when the system is connected to a DC power source (not USB-C/PD).
-
-In the driver implementation, switch to performance/full-speed mode without
-DC power connected will throw the EOPNOTSUPP error.
+The value encoding and the AC-power requirement are machine-specific (see
+Command ID 8 and the driver ops table).
 
 Graphics Switching
 ------------------
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 6031b1c..b49a6fb 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -44,6 +44,9 @@
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
 #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
 
+/* Firmware status in output.operation (wire OutData[1]): request accepted. */
+#define MIFS_STATUS_OK		0x80
+
 enum bitland_mifs_operation {
 	WMI_METHOD_GET	= 250,
 	WMI_METHOD_SET	= 251,
@@ -110,8 +113,21 @@ static const struct bitland_profile_mode_map redmi_mode_map = {
 	.full_speed	= 4,
 };
 
+/* TM2424 SystemPerMode bytes (Eco/Auto/Full-speed; Quiet/Turbo are GET aliases). */
+enum bitland_mifs_tm2424_perf_mode {
+	WMI_TM2424_QUIET	= 0x02,
+	WMI_TM2424_TURBO	= 0x03,
+	WMI_TM2424_FULL_SPEED	= 0x04,
+	WMI_TM2424_AUTO		= 0x09,
+	WMI_TM2424_ECO		= 0x0A,
+};
+
 static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data);
 static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *data);
+static int tm2424_profile_get(struct bitland_mifs_wmi_data *data,
+			      enum platform_profile_option *profile);
+static int tm2424_profile_set(struct bitland_mifs_wmi_data *data,
+			      enum platform_profile_option profile);
 
 /*
  * Machine-specific operations. The MIFS WMI interface is shared by
@@ -122,9 +138,15 @@ struct bitland_mifs_ops {
 	const char *name;
 	const struct bitland_profile_mode_map *mode_map;
 	int (*check_performance_capability)(struct bitland_mifs_wmi_data *data);
+	int (*profile_get)(struct bitland_mifs_wmi_data *data,
+			   enum platform_profile_option *profile);
+	int (*profile_set)(struct bitland_mifs_wmi_data *data,
+			   enum platform_profile_option profile);
 	bool has_full_speed;
 	bool has_cpu_power;
 	bool quirk_refresh_rate_toggle;
+	/* hwmon, keyboard LED and gpu/kb/fan sysfs are unimplemented */
+	bool reduced_fw;
 };
 
 static const struct bitland_mifs_ops bitland_ops = {
@@ -151,7 +173,22 @@ static const struct bitland_mifs_ops redmi_g_ops = {
 	.quirk_refresh_rate_toggle = true,
 };
 
+static const struct bitland_mifs_ops tm2424_ops = {
+	.name = "Xiaomi Book Pro 14",
+	.profile_get = tm2424_profile_get,
+	.profile_set = tm2424_profile_set,
+	.reduced_fw = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		/* Xiaomi Book Pro 14. Vendor is XIAOMI, not TIMI. */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_MATCH(DMI_BOARD_NAME, "TM2424"),
+		},
+		.driver_data = (void *)&tm2424_ops,
+	},
 	{
 		/* Redmi G */
 		.matches = {
@@ -296,11 +333,89 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	return 0;
 }
 
+static int tm2424_wmi_perf_set(struct bitland_mifs_wmi_data *data, u8 val)
+{
+	struct bitland_mifs_input input = {
+		.operation = WMI_METHOD_SET,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	struct bitland_mifs_output output;
+	int ret;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, &output);
+	if (ret)
+		return ret;
+
+	if (output.operation != MIFS_STATUS_OK) {
+		dev_dbg(&data->wdev->dev,
+			"perf mode %#x rejected by firmware (status=%#x)\n",
+			val, output.operation);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int tm2424_profile_get(struct bitland_mifs_wmi_data *data,
+			      enum platform_profile_option *profile)
+{
+	struct bitland_mifs_input input = {
+		.operation = WMI_METHOD_GET,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	struct bitland_mifs_output output;
+	int ret;
+
+	ret = bitland_mifs_wmi_call(data, &input, &output);
+	if (ret)
+		return ret;
+
+	switch (output.data[0]) {
+	case WMI_TM2424_ECO:
+	case WMI_TM2424_QUIET:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	case WMI_TM2424_AUTO:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case WMI_TM2424_FULL_SPEED:
+	case WMI_TM2424_TURBO:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	default:
+		dev_dbg(&data->wdev->dev,
+			"unrecognized TM2424 perf mode %#x\n", output.data[0]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tm2424_profile_set(struct bitland_mifs_wmi_data *data,
+			      enum platform_profile_option profile)
+{
+	switch (profile) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		return tm2424_wmi_perf_set(data, WMI_TM2424_ECO);
+	case PLATFORM_PROFILE_BALANCED:
+		return tm2424_wmi_perf_set(data, WMI_TM2424_AUTO);
+	case PLATFORM_PROFILE_PERFORMANCE:
+		/* Full-speed is rejected on battery; fall back to Turbo. */
+		if (tm2424_wmi_perf_set(data, WMI_TM2424_FULL_SPEED) == 0)
+			return 0;
+		return tm2424_wmi_perf_set(data, WMI_TM2424_TURBO);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
-	const struct bitland_profile_mode_map *map = data->ops->mode_map;
+	const struct bitland_profile_mode_map *map;
 	struct bitland_mifs_input input = {
 		.reserved1 = 0,
 		.operation = WMI_METHOD_GET,
@@ -311,6 +426,10 @@ static int laptop_profile_get(struct device *dev,
 	u8 mode;
 	int ret;
 
+	if (data->ops->profile_get)
+		return data->ops->profile_get(data, profile);
+
+	map = data->ops->mode_map;
 	ret = bitland_mifs_wmi_call(data, &input, &result);
 	if (ret)
 		return ret;
@@ -369,7 +488,7 @@ static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
-	const struct bitland_profile_mode_map *map = data->ops->mode_map;
+	const struct bitland_profile_mode_map *map;
 	struct bitland_mifs_input input = {
 		.reserved1 = 0,
 		.operation = WMI_METHOD_SET,
@@ -379,6 +498,11 @@ static int laptop_profile_set(struct device *dev,
 	int ret;
 	u8 mode;
 
+	if (data->ops->profile_set)
+		return data->ops->profile_set(data, profile);
+
+	map = data->ops->mode_map;
+
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
 		mode = map->quiet;
@@ -897,6 +1021,7 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_3, 0, 0), { KEY_ALL_APPLICATIONS } },
 	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 0, 0), { KEY_CONFIG } },
 	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 1, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
@@ -908,6 +1033,12 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
 	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },
+	/* TM2424 AI break event (make is 0x23 / WMI_EVENT_OPEN_APP) */
+	{ KE_IGNORE, BI_HOTKEY_CODE(0x24, 1, 0), {} },
+
+	/* TM2424 Mi button: make/break pair */
+	{ KE_KEY, BI_HOTKEY_CODE(0x25, 1, 0), { KEY_VENDOR } },
+	{ KE_IGNORE, BI_HOTKEY_CODE(0x26, 1, 0), {} },
 
 	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {} },
 	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0x80), {} },
@@ -1085,6 +1216,9 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (IS_ERR(drv_data->pp_dev))
 		return PTR_ERR(drv_data->pp_dev);
 
+	if (drv_data->ops->reduced_fw)
+		return 0;
+
 	/* Detect the keyboard type */
 	ret = bitland_detect_kbd_type(drv_data);
 	if (ret)
@@ -1243,5 +1377,6 @@ static struct wmi_driver bitland_mifs_wmi_driver = {
 module_wmi_driver(bitland_mifs_wmi_driver);
 
 MODULE_AUTHOR("Mingyou Chen <qby140326@gmail.com>");
+MODULE_AUTHOR("KentoNion <kento@kekto.ru>");
 MODULE_DESCRIPTION("Bitland MIFS (MiInterface) WMI driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0
