Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794854270;
	b=XocFn/s053nVWmOBQVgiULlKxF8xrIFxFLiHrwo1/y3mlGOQ1mH8wW797XOJ8tQkeM5u
	 z+RDGVmyS9JZH75cKf8k2JAb1g0NSLgFVagSfdOiKMNLr9r1DZGUz0COrplRKpLM+oR4+
	 FRMToDyR8eOG6PbDLlbSa7dU6B3VRSuEUaXK9DJ7iNXgNhX4QW3ULui6t8AUB/9tfkzwp
	 P+oSjQVi4Iwhg5hrpoO2a/0GCNeUsc8v1/EF1DRtIi4srx2vNanKIG6rpqZVbh8aVXiZx
	 LYjo91AxhrBwBP4Vz2Sn/dJ7+0BzjXwRA41ERmz6xsbmDM3P/FXo2ErqjjT8ire1Iyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854270;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eZRYoDVRGgqESVbGH6I15qHUQiQKuFeRk7kJ1rFYIak=;
	b=hQAfFasSTo/B5H6U5/DyhnT2QfSnl7s0r4o8Fs4t8ATOT1Hojan844RSvkVEDPnKguV0
	 ns/7b74eaf37qwl206tgoN8BorrIOpVGthOSHbVPtasAVFIgNiouU8kXhhyKfT8EY3Vv1
	 oWA4ff2rS6lAdtpOpzZjNXALH8WsoMKdYRsySAe4jDhwEurR7js8mDwBxLaG354pyncaK
	 vSkYljbxy3099VQ0UnC1H4Wih0wvP3vMlajoUMBkK+GNxIJ+HhwrjLRl2UMMXlqnfEug3
	 TcbNxNHK2pJ6q2dwQj87XYkonPdR6OClTgW1SAcA14CjYwibRS7PuW5L9i5mAdtIN9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CesPdyCD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA7606A886;
	Mon, 16 Nov 2026 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CesPdyCD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794854270;
	b=lt9AwG4jvhgoo8s//eq4iWre7oreekS/7Lpjw6QGn1+SY1D+6PeYuytm3ZyRG3GA0Ndj
	 jiWqaxB2S5kGJd67HlR9ZggbyVSx5eb3puSkcq91CuVoOv2utyRR97om4nwvrVTSOTVGr
	 kj7hJp8OErr2idJy+5HPGeAKTWHIQATLItwgO/8WcTp5UrLHv7+nsKpnpTkmRodaXxjft
	 vvPVHfUrT2mYwUOw4o4hAtpvXZF94LazGHaV7dRriPhgKVtIsDox1GYRs+srlD3FCAgHw
	 rYu9vma47tdwgdQhQHzUEYz86+843DYsfB7pRCjISQwgh+0XcT7YCs1j259b47h3TVw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794854270;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=eZRYoDVRGgqESVbGH6I15qHUQiQKuFeRk7kJ1rFYIak=;
	b=ONoVmmC+qn9w5Cwj0xw5nBLhv0rU0gcZNvhLt3RfGTm0LgX2m/MkgodYVyw7KeBTbsxI
	 /0CHICGIu3jfqTH/jVRpX+Ih6n3j0oITlhdMv8BjxpVA8nlKUIuS2qS+kfZ6eezabPk3r
	 FLa7BHb4c2McX82Lrs5OJzqcTQw8ti6J7Dd5DexLt/ZdFsFUyLe4LsBSop7hntsEVVKny
	 4twI5iURXIY9FdoiL3Gsu/F7GSrjm+8z69LT37+dEpMDyxixE5Ag5I+pM90PTDGs6IxG0
	 BZ4kBBEwm4NDhwvP94izr+XpbDmm81xBwBhHUMgx3UFNFrhqpDE51pQVmGI1b9Yq0Hw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 471791F000CA;
	Mon, 16 Nov 2026 18:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794854270;
	bh=eZRYoDVRGgqESVbGH6I15qHUQiQKuFeRk7kJ1rFYIak=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CesPdyCDNWmfbyZ1VZrwORJvr93YVB1FoC4suragX7YAjRJVWyaXEzJoStKNu0qnk
	 EMUcI0VvomWI/gYriyEmHHuHpRu7+bX4opTYNTUn85JTPnXr/toWXy3DnHyD5cJ3uD
	 K24/9iOzhpKIYe5/WmJChUoYw2/ZJDr7bZj9KzWGl6x9Ax4vsmHVsRMeBBOHmQsJtu
	 V6Y/pwhM1UhpENqKGnarg8We8/RzaIae3wGny7fIbCJ1zGNqdQR9ekyjsiwa+fnZHx
	 HpE6p3DGtEp7T6mtDoAytT3uTD5zTYOwTjKR07A7HrCipeP/c7uorlVVERANwZqyh0
	 NVoitmNtpryaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C53C4A57E;
	Mon, 16 Nov 2026 18:37:48 +0000 (UTC)
From: Zane Hunt via B4 Relay <devnull+git.turtledev.nz@kernel.org>
Date: Tue, 17 Nov 2026 07:37:38 +1300
Subject: [PATCH v5] platform/x86: asus-wmi: Add support for
 ASUS_WMI_DEVID_CAMERA_LED_NEG
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-asus-wmi-camera-led-v5-1-41c47653758b@turtledev.nz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V0bU1fUHDlfxgXpQxSI2DaUh+Ef
 7fFjTHG5cncOWdGDqwBh3bZjCwE48w4RMg3GdKdGk6ATRMZMcIKSqjEyk0O33qDterBKnyBBpN
 CFUDyllBgKH5eLbTmvloPxze7qT6D9kmVFp1xfrSPNRt42v0vBI4pLkWuSsYlryq595P18QJhO
 zxRigTxqal+a0TUSCmEpiyvta6+NMuyvABK44dOEgEAAA==
X-Change-ID: 20261017-asus-wmi-camera-led-06a6e05f01e2
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 platform-driver-x86@vger.kernel.org
Cc: =?utf-8?q?Jos=C3=A9_Guilherme_de_Castro_Rodrigues?= <jose.guilherme.cr.bh@gmail.com>, 
 Rong Zhang <i@rong.moe>, linux-kernel@vger.kernel.org, 
 Zane Hunt <git@turtledev.nz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854267; l=9491;
 i=git@turtledev.nz; s=20261016; h=from:subject:message-id;
 bh=UUsKTy/TQdLhAaCeSrXCgBbDaE8tq/oTlwS/0bdAoDE=;
 b=1/3lqSAPRs6RBlhARsKbgZ08ziHV8zyWCR52WYXvKM9IZiGEiuNPf44CtfEWhLNb6afooDCFk
 fa0LTsbP8E4DXB4MgD0u09Oj1nwLayih3W7s3p9yIj5FVXMvKaccSjS
X-Developer-Key: i=git@turtledev.nz; a=ed25519;
 pk=7P3HBZD1ukp3nMYpf+9Dcl3ryKIU5pYgOUKe/HOox6c=
X-Endpoint-Received: by B4 Relay for git@turtledev.nz/20261016 with
 auth_id=1217
X-Original-From: Zane Hunt <git@turtledev.nz>
Reply-To: git@turtledev.nz
Content-Transfer-Encoding: 8bit

From: Zane Hunt <git@turtledev.nz>

On some newer Zenbooks (Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) the
camera key turns the camera off in firmware, but the LED on the key never
lights up under Linux. These machines don't have
ASUS_WMI_DEVID_CAMERA_LED, so asus-wmi never registers asus::camera. The
firmware exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG instead.

Reading CAMERA_LED_NEG is what drives the LED: the DSTS handler reads the
camera state from the EC and writes it to the LED GPIO before returning
it. The set side can't be used, the firmware only accepts DEVS on this
device once per boot.

When CAMERA_LED is missing but CAMERA_LED_NEG is there, register
asus::camera as a read-only LED backed by CAMERA_LED_NEG, and read it
after every camera key event, sending a brightness_hw_changed event.
Registering the LED reads it as well, which fixes the LED being dark after
a cold boot with the camera disabled. There is no brightness_set
callback, so writes to the brightness attribute are ignored, as with
other get-only LEDs.

While at it, include <linux/container_of.h>, which this file already
relied on.

Link: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221752
Assisted-by: Claude:claude-opus-5-5 iasl
Co-developed-by: José Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
Signed-off-by: José Guilherme de Castro Rodrigues <jose.guilherme.cr.bh@gmail.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Zane Hunt <git@turtledev.nz>
---
Changes in v5:
- Rebased on pdx86 for-next, asus-wmi.c has moved to
  drivers/platform/asus/
- Change the subject, this adds support for CAMERA_LED_NEG rather than
  fixing a bug in the driver (Rong)
- Drop camera_neg_led_set(), so asus::camera has no brightness_set now.
  The key event already resyncs the LED, and skyedryv's s2idle test
  showed nothing gets missed while suspended (José, Rong)
- "Returns" -> "Returns:" in the camera_neg_led_sync() comment (Ilpo)
- Kept Ilpo's Reviewed-by since the only code change is dropping the
  set callback
- Rong's idea of also sending brightness_hw_changed on machines that
  have both CAMERA_LED and CAMERA_LED_NEG is left for a follow-up, I
  only have the UX5406SA to test with
- Link to v4: https://patch.msgid.link/20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz

Changes in v4:
- Keep José's Signed-off-by from v2 and add his Co-developed-by
- Use my full name in the tags
- Include <linux/container_of.h>
- Reuse the existing asus::camera registration block, only the
  handlers and flags differ
- camera_neg_led_available is now only set when CAMERA_LED is missing,
  so asus::camera is always the CAMERA_LED_NEG one when it's set. That
  makes the LED_BRIGHT_HW_CHANGED check in the event handler unneeded,
  so it's gone
- Drop the explicit read at probe, led_classdev_register() already
  reads the state through brightness_get
- Link to v3: https://patch.msgid.link/20261017-asus-wmi-camera-led-v3-1-845a82373997@turtledev.nz

Changes in v3 (picking up José's v2, which had stalled):
- Rebased on pdx86 for-next
- Also read CAMERA_LED_NEG at probe, so the LED is right after a cold boot
- Register a read-only asus::camera LED when only CAMERA_LED_NEG exists,
  with brightness_hw_changed on key presses (Ilpo's suggestion on v2)
- Comment on why the read is what updates the LED (also from v2 review)
- v2: https://lore.kernel.org/r/adg6GzkykThAB_4u@djouze-zen

Tested v5 on the Zenbook S 14 UX5406SA (BIOS 309), on Fedora's 7.2.15
kernel with the same change applied: camera key presses keep the LED,
asus::camera, brightness_hw_changed and the camera output in sync, also
with nothing reading the brightness attribute, so the key event alone is
what updates the LED. Writing 0 or 1 to brightness changes nothing.

I used Claude while working on this. It helped
me read through the DSDT, drafted the changes on top of v2 and wrote the
test scripts. I went through the patch myself and ran the tests on my
laptop.
---
 drivers/platform/asus/asus-wmi.c           | 63 ++++++++++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  2 +-
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index b33ebdb21aa..991e5b36664 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -17,6 +17,7 @@
 #include <linux/backlight.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -72,6 +73,8 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_CAMERA_TOGGLE_1		0x82
+#define NOTIFY_CAMERA_TOGGLE_2		0x85
 #define NOTIFY_KEYSTONE			0xb4
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
@@ -312,6 +315,7 @@ struct asus_wmi {
 	u32 kbd_rgb_dev;
 	bool kbd_rgb_state_available;
 	bool oobe_state_available;
+	bool camera_neg_led_available;
 
 	u8 throttle_thermal_policy_mode;
 	u32 throttle_thermal_policy_dev;
@@ -2105,6 +2109,43 @@ static int camera_led_set(struct led_classdev *led_cdev,
 	return err < 0 ? err : 0;
 }
 
+static bool is_camera_toggle(int code)
+{
+	return code == NOTIFY_CAMERA_TOGGLE_1 || code == NOTIFY_CAMERA_TOGGLE_2;
+}
+
+/*
+ * Some models (e.g. Zenbook S 14 UX5406SA, Zenbook S 16 UM5606WA) have no
+ * ASUS_WMI_DEVID_CAMERA_LED. The firmware handles the camera key itself and
+ * only exposes the state through ASUS_WMI_DEVID_CAMERA_LED_NEG, and reading
+ * that has a side effect: the firmware copies the state to the LED GPIO.
+ * Nothing else updates the LED, so read it after every camera key event.
+ * Registering asus::camera reads it too (via brightness_get), which sets the
+ * LED at probe. Setting it is no use, the firmware accepts DEVS on this
+ * device only once per boot.
+ *
+ * Returns: 1 if the camera is disabled (LED lit), 0 if enabled, or -errno.
+ */
+static int camera_neg_led_sync(struct asus_wmi *asus)
+{
+	u32 result;
+	int err;
+
+	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG, &result);
+	if (err)
+		return err;
+
+	return !(result & ASUS_WMI_DSTS_STATUS_BIT);
+}
+
+static enum led_brightness camera_neg_led_get(struct led_classdev *led_cdev)
+{
+	struct asus_wmi *asus = container_of(led_cdev, struct asus_wmi, camera_led);
+	int state = camera_neg_led_sync(asus);
+
+	return state < 0 ? LED_OFF : state;
+}
+
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
 	scoped_guard(spinlock_irqsave, &asus_ref.lock)
@@ -2236,11 +2277,17 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
+	if (asus->camera_neg_led_available ||
+	    asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED)) {
 		asus->camera_led.name = "asus::camera";
 		asus->camera_led.max_brightness = 1;
-		asus->camera_led.brightness_get = camera_led_get;
-		asus->camera_led.brightness_set_blocking = camera_led_set;
+		if (asus->camera_neg_led_available) {
+			asus->camera_led.flags = LED_BRIGHT_HW_CHANGED;
+			asus->camera_led.brightness_get = camera_neg_led_get;
+		} else {
+			asus->camera_led.brightness_get = camera_led_get;
+			asus->camera_led.brightness_set_blocking = camera_led_set;
+		}
 
 		rv = led_classdev_register(&asus->platform_device->dev,
 						&asus->camera_led);
@@ -4742,6 +4789,13 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
 		return;
 
+	if (is_camera_toggle(code) && asus->camera_neg_led_available) {
+		int state = camera_neg_led_sync(asus);
+
+		if (state >= 0)
+			led_classdev_notify_brightness_hw_changed(&asus->camera_led, state);
+	}
+
 	if (!sparse_keymap_report_event(asus->inputdev, code,
 					key_value, autorelease))
 		pr_info("Unknown key code 0x%x\n", code);
@@ -5219,6 +5273,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
+	asus->camera_neg_led_available =
+		!asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED) &&
+		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CAMERA_LED_NEG);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 66c7ab35d6c..1f7efaf0984 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -57,7 +57,7 @@
 #define ASUS_WMI_DEVID_MUTE_LED	0x0004001C
 
 /* Disable Camera LED */
-#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on (unused) */
+#define ASUS_WMI_DEVID_CAMERA_LED_NEG	0x00060078 /* 0 = on */
 #define ASUS_WMI_DEVID_CAMERA_LED	0x00060079 /* 1 = on */
 
 /* Backlight and Brightness */

---
base-commit: a362539b42193dcdb17f8fba40031a515c53885c
change-id: 20261017-asus-wmi-camera-led-06a6e05f01e2

Best regards,
--  
Zane Hunt <git@turtledev.nz>


