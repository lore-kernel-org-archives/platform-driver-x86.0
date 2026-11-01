Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527385;
	b=g0OOs/DX7oc1s5faGMF7RAU7effQ+cKiceUoId9zCC/1paxnXxf+3sBHGoU1t3R4STa+
	 cVS89a0v9uzxkX/BU3J4X1jekSdOUKoKWCWWxZ4UwTUVvFj4quyrgzis4ooNF7VqjdfVE
	 i9UiFCbEzRUSMI2LQ/mhVRf1UTiMRmZF0Wcva1Kdtq5DJwUOXDY39hNQQaB5MQATZGFK2
	 4irP2VHvF37ctNToH9PEzq9ZRWUxT+o0rQP2P3CTWh6JoLb2jpf8REQesR2J1nqSzeRdV
	 LJbWucQTMetkDmYFUGIwPBobZrPGqc/J0MD8APr5gWm22VX3IUa9fW8jfbyfQ6fkxzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q5FaafLK5xtQ7K9MNm9q0E/yGtjc6qv10dpGcaAe3qs=;
	b=tD6CMsd8EC6pKP45cXNe5BuZ1KIapjaiu/jyxBJV5GPZtOoC3G2fD76DuBpnGiK2r7+f
	 GbZC8xIAqwi8zaqwZDoqlzYiCf6crtqCXpKYBa9WwqbAtZOYSzaPZtfm4D1JH6S4Tz4+a
	 kZOt2W0A66/nDyWGzakVTidHYGvnOhusjCzs5kzi+F2sy8pC+Wpn64tRljGqYd48ovTrK
	 TYUNt2SJLTpVwzMUdr1gCkReaAyRcqTLLWugN282BK9QB9eyC/h9cPanMPgkGKExlFEEh
	 xuxWmohFOq1vggJGXwfDkVbRCqJBcHHZI/amPUS7odX4/X3J08gw+hUydklUpL2FxQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjqgE9GC;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79ED606A327
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 10:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79ED606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TjqgE9GC
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso67551a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793527384; x=1794132184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5FaafLK5xtQ7K9MNm9q0E/yGtjc6qv10dpGcaAe3qs=;
        b=TjqgE9GClJ+ajlyFESGvKwFAFX3sAfeBbLkRJKcRmEOBhYjl10YZS90azGI3JimPFI
         G2+l/vfm2bXb3X0DjIHg9Lax2xkIjtYyI4wTA3j1gdPpTi/kUVt+FbTBHvh0u9RmjjtB
         R1OpOOaVIpFx8KlEwXvY+piOk/c3lzDQC9PHuQw3JLb9i6bQ+XeKGDX5UWJ5nRqtl1pf
         Ruz7lYzGtKo5Rhy4egPlT9kX8yXyYXd/nHpvL3YvmwL20BrGiznjMvkBNPQhENdpauLc
         tBCdU1cMZ6X7yOQFlD16Wh6V4e4q1Uto92JFBrqFPunPkbhhMGLe+vxCFnNAlJLU6WHE
         pj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793527384; x=1794132184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5FaafLK5xtQ7K9MNm9q0E/yGtjc6qv10dpGcaAe3qs=;
        b=VgsvPkhmGGc5OauZSR0VGvEX/mrQIKdDqzuPxyyqBUUd2YMQuPrwr+QG77Hluhuesz
         8T3bdJY/hjp7p9uvHgQoPdQlolPzrGsZFeAntI8BE1U3HwNn1wTwZwbc82/qnqSizEkO
         O07bBX3Vv15rMXVdnqDL58eM5k0dLuF5fUGm1g6wjkpNSGnx/s2Cb7lV/jz+pwmiJyrD
         9kzKg2A3AHo+c63TuyEbBtWD802KrlFFgfNBigz8oGUobgrdKhxLC9Siz9XUka9xlnca
         xFu/YsQ2Ki5hgYKlFDIZS7fC8IMnZ8xuqxWx5nqX6IkG3Kspg0k1V+DdZzxoEnpNYB1a
         l2uw==
X-Forwarded-Encrypted: i=1; AKwUvByAxJXRDYFZ8IULRflATjyHvABNRrZi/mIIT4289ntrhLVT6xD2N1YYVrjLRoP42Ge9PJmDBI8hwrc3DN2Pjp3v4l/r@vger.kernel.org
X-Gm-Message-State: APuU4Z/bEegYN8/90orUPaXmwgiUSLfu+nAVrReiPFtE+XMjMF5DfMMq
	VTJUcfuDLh5WkpCHXEnB6VgVyFcuKheQQ8DXRASiFr+6Vf2QL4xaJnVR
X-Gm-Gg: AYBFou0h2P7tIm/aluZxUORCOtmQmJicqvMx1/Qwzb2i9lRMScctwyL4+Mw+JN13DBN
	ZeEwrWLMFaCFKIdxpFGI1L60HbEeg4i7RQFTM2HK/aGfRWouux29iNa2YXfZqIOoehoKW4wo9NC
	WMLE26GLH18WyGRh76AwPmVaNcPMckx4DHONbrhO/ONezCIp16B9QhuPleuJDW5ImG/tQ+O7LP6
	+rvrfWoGtGb2p88hHLFmGjyNhzg3ZdyhAahTsPWwKRZOARtPZc1hKE4N8hB2Qt3QAnQ/TsyMyCQ
	2fbfDVbOEa0RPWPxhYGdxxLJIdOLIXbdXqwBBouHeCRn2h7AUL96c/0QS6PVdN4T/MLq76aQrfw
	ciATUgH/gO7ery4Jm49w7jAoRb5OwCWxntxK6m3ROQtaohevfHdPUwcE3SafYQu8sCwo4DSNivh
	E0CI20O74AsgWm31HINCFdHsCg5AhI0aoVF/Vrt/jjzHoN1E7fYbAgVrEZ/OBCYgVbZjC53P5Ar
	nAgfM+e6sK+6/H22s0ROWX+mG9KYybusTMYrhS4CRRD7gsKz4h+Hu5wYPWi5e9f/M4DI93Ggp2G
	PIyLggjGkQ3cDCZfqy9mDCRUT+e4jYsJR9A=
X-Received: by 2002:a17:90b:3c44:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3ae89559f53mr3423968a91.1.1793527384220;
        Sun, 01 Nov 2026 02:03:04 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm14314906a91.14.2026.11.01.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:03:03 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH 1/1] platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
Date: Sun,  1 Nov 2026 18:01:23 +0800
Message-ID: <20261101100123.28749-2-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent ThinkPads with an ambient light sensor (ALS) support an auto mode
for the keyboard backlight: the EC controls the backlight according to
ambient light. The mode is EC keyboard backlight level 3, in addition to
the two fixed brightness levels currently exposed by the driver, and is
currently reachable only through the Fn+Space shortcut, which is handled
directly by the firmware.

Wire the auto mode up as a private hardware control trigger, named
"tpacpi-kbd-auto", on top of the LED hw control trigger framework:

  - selecting the trigger writes level 3 (activate); the offloaded state
    is derived from the current EC level
  - when Fn+Space cycles into or out of auto mode, the driver notifies
    the LED core about the hardware-initiated hardware control
    transition, so the trigger state (shown bracketed in the trigger
    sysfs attribute) follows along
  - if the hardware is already in auto mode at driver initialization,
    the trigger is set as the default one

Deliberately unchanged:

  - max_brightness stays 2, auto mode is not multiplexed into the
    brightness value
  - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL, while
    reads keep reporting the current EC level verbatim (including 3)
  - module unload still turns the keyboard backlight off

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---

Note: Documentation/admin-guide/laptops/thinkpad-acpi.rst has no kbdlight
section at all, so there is no in-tree documentation to update; the
userspace-facing semantics of hardware control triggers are documented
in Documentation/leds/leds-class.rst.

Open questions (details in the cover letter): whether a MLCG capability
bit indicates auto mode support, and the EC behavior on ALS-less models
when asked for level 3.

 drivers/platform/x86/lenovo/Kconfig         |   1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
 2 files changed, 88 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993..74fc66a44 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -75,6 +75,7 @@ config THINKPAD_ACPI
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on LEDS_TRIGGERS_HW_CHANGED
 	depends on I2C
 	depends on DRM
 	select ACPI_PLATFORM_PROFILE
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..cd5c17d5f 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+/* EC level that selects ALS-controlled auto mode for the keyboard backlight */
+#define TPACPI_KBD_LIGHT_AUTO_LEVEL	3
+
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
@@ -5197,13 +5200,33 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	return level;
 }
 
+static struct led_hw_trigger_type kbdlight_auto_trigger_type;
+
+static int kbdlight_auto_trigger_activate(struct led_classdev *led_cdev)
+{
+	return kbdlight_set_level(TPACPI_KBD_LIGHT_AUTO_LEVEL);
+}
+
+static bool kbdlight_auto_trigger_hw_offloaded(struct led_classdev *led_cdev)
+{
+	return kbdlight_get_level() == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+}
+
+static struct led_trigger kbdlight_auto_trigger = {
+	.name		= "tpacpi-kbd-auto",
+	.trigger_type	= &kbdlight_auto_trigger_type,
+	.activate	= kbdlight_auto_trigger_activate,
+	.hw_offloaded	= kbdlight_auto_trigger_hw_offloaded,
+};
+
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	.led_classdev = {
 		.name		= "tpacpi::kbd_backlight",
 		.max_brightness	= 2,
-		.flags		= LED_BRIGHT_HW_CHANGED,
+		.flags		= LED_BRIGHT_HW_CHANGED | LED_TRIG_HW_CHANGED,
 		.brightness_set_blocking = &kbdlight_sysfs_set,
 		.brightness_get	= &kbdlight_sysfs_get,
+		.trigger_type	= &kbdlight_auto_trigger_type,
 	}
 };
 
@@ -5224,6 +5247,26 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 	kbdlight_brightness = kbdlight_sysfs_get(NULL);
 	tp_features.kbdlight = 1;
 
+	/*
+	 * Register the auto-mode trigger before the LED classdev: if the
+	 * hardware is already in auto mode, the trigger can then be set as
+	 * the default one and gets activated during LED classdev
+	 * registration.
+	 */
+	rc = devm_led_trigger_register(&tpacpi_pdev->dev,
+				       &kbdlight_auto_trigger);
+	if (rc) {
+		tp_features.kbdlight = 0;
+		return rc;
+	}
+
+	tpacpi_led_kbdlight.led_classdev.hw_control_trigger =
+		kbdlight_auto_trigger.name;
+
+	if (kbdlight_brightness == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		tpacpi_led_kbdlight.led_classdev.default_trigger =
+			kbdlight_auto_trigger.name;
+
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				   &tpacpi_led_kbdlight.led_classdev);
 	if (rc < 0) {
@@ -5313,6 +5356,47 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/* Notify the LED core when the hardware cycles into or out of auto mode. */
+static void kbdlight_notify_hw_control(struct led_classdev *led_cdev,
+				       int old_level, int new_level)
+{
+	bool was_auto = old_level == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+	bool is_auto = new_level == TPACPI_KBD_LIGHT_AUTO_LEVEL;
+
+	if (is_auto != was_auto)
+		led_trigger_notify_hw_control_changed(led_cdev, is_auto);
+}
+
+/*
+ * The EC cycles the keyboard backlight level (and auto mode) itself on
+ * Fn+Space; check the current level and update the LED core state.
+ */
+static void kbdlight_notify_change(void)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	enum led_brightness brightness;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	brightness = kbdlight_sysfs_get(NULL);
+	if (kbdlight_brightness == brightness)
+		return;
+
+	/*
+	 * Calling kbdlight_notify_hw_control() is safe while holding
+	 * kbdlight_mutex: the notification is only queued, and the worker
+	 * re-acquires the mutex (if at all) after this critical section has
+	 * been left.
+	 */
+	kbdlight_notify_hw_control(led_cdev, kbdlight_brightness, brightness);
+	kbdlight_brightness = brightness;
+	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11581,22 +11665,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
-		if (tp_features.kbdlight) {
-			enum led_brightness brightness;
-
-			guard(mutex)(&kbdlight_mutex);
-
-			/*
-			 * Check the brightness actually changed, setting the brightness
-			 * through kbdlight_set_level() also triggers this event.
-			 */
-			brightness = kbdlight_sysfs_get(NULL);
-			if (kbdlight_brightness != brightness) {
-				kbdlight_brightness = brightness;
-				led_classdev_notify_brightness_hw_changed(
-					&tpacpi_led_kbdlight.led_classdev, brightness);
-			}
-		}
+		if (tp_features.kbdlight)
+			kbdlight_notify_change();
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_DFR_CHANGE_ROW:
-- 
2.56.0


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
