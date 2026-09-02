Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C0382F07
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371269; cv=none; b=hTYA25tHmp3v8PMOKdo0AD42MqV4BVY2ryl9h63XCPJv7o7SHJJSnYOh+NyfYDbO7epMn+bOYd6UI9EACCvypE53pCwbzCGCvOo6368DoUoXlOLemiQ2rX35LgHdCIQZNasu5Zpslsob2hpsdxD2W+KMZo4DNBC7Q/P+kfvIN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371269; c=relaxed/simple;
	bh=l4BWUyVmdw3bRhpu4w/TpdB1tZZEAfrwW7TjVYO4510=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSEfSp8SeO7eM9jEQq3jSHppBHeax7AYvmnJQvyr76jbx/3pdJAVO57u4utxHUlvUWi/Fh7lF4lo4vKF/BZtnY9A+CuC3OtJ0l6HWZRiidaAZDcTCdiE1FYkLiXagHHCWchCAbKFwFNJl7t4i7636tE4o4LMvG+AzQ+N5aOPxkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cz+zPtaX; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cz+zPtaX"
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2d6fff25530so4504925ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371267; x=1788976067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hgiYD9mAy7lLdpoQ7MWx+A7lz5nT32B2WH2DceHLJ4=;
        b=Cz+zPtaXWApdZ0v6C98cSj5sRMjHcf5hxOqgMLuskIPUpmibhBuyWFUKu1QhnbOgGp
         WtrlV5CIfGLghePSCCw7QDjOC/9cJ9lKdnZcnUGoBN4/UBhQR2/Px+JhD6T9hbywopUx
         66mHHpnoT0hLZDJwwKQW5Nqy0kbVPmtDz6iOOTXcbWOUsr7EKXMrRMOYMTWHc94qw9+W
         Z3PaDinM7hHRm3d6FPR/OzF2LhpS7T1MRcMfo4+f109KpTyksR8TUuRPoq6TWY5YE7h+
         iIdZMSFvUWPr6gqqgJG3MxWJN4hy4U6h+kjhUeD/JsoYWxouv8tPPRYbUNNdG5/x1xDT
         VZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371267; x=1788976067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9hgiYD9mAy7lLdpoQ7MWx+A7lz5nT32B2WH2DceHLJ4=;
        b=d2uYYvHv9f/GQuh77XJWiuOjKoO5Z0MvQGFneRui7QV0B255sj0n11TB3elV+w/Dk5
         drFmcv0H98/qgKeM+21oTFW6BZ8uQHdGrkp8a6cHCcZDibnhSZxHOcB9qiISQEGrjhxC
         Ppt/SjtY4o2lmNmlGkMGiw6w+ZZABagJ01C0ZZgPaOEPajBlH0JGiexNgTULaxOgqLDf
         0BPdBkVLGGPIxi3LkVIHUNrNHuITmJludU/qOCXUwKZ8DLUfhya2TKyBV+dJymxn52xr
         i97qL/7BnTBpp26HplhhGu4lP3KiKzhujfnBuJ4jZWcXW8X9ZKdDv3dv9RmnQP+Mykd7
         ECtg==
X-Gm-Message-State: AFuF++lroxFD1CSVuvR05Re93Ymv2JTLEuW71ypvejpR2/WgdeEOFMlW
	GVpvNVzFDue5Leb9ka/ueA5OdtS8Sl3r2hxLuOiA2PY1Juqhak0id6SAQatRIdIaSzU=
X-Gm-Gg: AYBFou3t6yRS/pwrmpUsQlZtGxHu8Pcb+OO2+9DU1D70IKnl5ryfTTgZ6/8o54wx87M
	t8y/ncVNDLc/lpBJe+dsEiHvKNBSFXXhzhVBmb16MBBeXwzONXor7p4fWVvWKosNsQw9tdQps/E
	1hcebYIro7Xmfgq8xQgSEthgtgIgt7ddwhfad+bioW30riTBomY5DzufFKg8tdarFUD+y2ZdKJH
	p4drfZkceDU1qxcrDGoPtOn4typ7cWvIDOVD0pvVJin+z8Xns61V9ywh/dqzRFRJ7Gjv3UKQFTM
	z/EkmGZUG3l/auMFQxz/BFIQ/mDqPyTPbbXSpY01IhTBHL7n7vBvEzBVCGz/jlnQZHRDlnQCgqp
	3aRlW3SQAnRISSKZ6yBg62KYJVGMzjTAT7OA8ww+Ze5rBwAuTNuQ5zR9McdBMOnOMUPjlkFUouw
	g2dHoKXstVzTAQqdu/QaymYowQS2QX4YMlpmdB7V1+kjZguh/MrJRfD0400L2wQcwmV2D71Qd5t
	tA+TRS/hiWkBTWO
X-Received: by 2002:a17:90b:5908:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39aedec4caamr10276108a91.3.1788371264027;
        Wed, 02 Sep 2026 10:47:44 -0700 (PDT)
Received: from mizar.onca-liberty.ts.net ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm470584a91.8.2026.09.02.10.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:47:43 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	"Luke D . Jones" <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Subject: [PATCH v3 3/3] platform/x86: asus-wmi: re-assert FA401 keyboard state before S0ix
Date: Thu,  3 Sep 2026 00:47:18 +0700
Message-ID: <20260902174718.16228-4-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902174718.16228-1-idotohors@gmail.com>
References: <20260902174718.16228-1-idotohors@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ASUS TUF Gaming FA401 laptops, the display server or graphics driver
blanks the keyboard backlight (brightness=0) during suspend. When the EC
enters S0ix with brightness=0, it disables the sleep-strobe effect.

Track the last user-configured non-zero keyboard backlight level in
asus->kbd_led_last_level, and re-assert it with the light-on bit (0x80)
along with the configured TUF RGB power state in both .prepare and the
LPS0 s2idle .prepare hook. Hooking LPS0 ensures the re-assertion happens
after all devices (including DRM and display managers) have suspended,
immediately prior to low-power S0 idle entry.

Only re-assert if the TUF sleep flag is active in kbd_rgb_state_flags,
respecting any user decision to disable sleep LEDs. Initialize default
flags at probe so the strobe functions out of the box.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 68 ++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e7b2402c9..03d2af604 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -257,6 +257,7 @@ struct asus_wmi {
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
 	int kbd_led_wk;
+	int kbd_led_last_level;
 	bool kbd_led_notify;
 	bool kbd_led_avail;
 	bool kbd_led_registered;
@@ -310,6 +311,7 @@ struct asus_wmi {
 
 	u32 kbd_rgb_dev;
 	bool kbd_rgb_state_available;
+	u32 kbd_rgb_state_flags;
 	bool oobe_state_available;
 
 	u8 throttle_thermal_policy_mode;
@@ -344,6 +346,7 @@ struct asus_wmi {
 
 /* Global to allow setting externally without requiring driver data */
 static enum asus_ally_mcu_hack use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_INIT;
+static struct asus_wmi *asus_hotk;
 
 #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static void asus_wmi_show_deprecated(void)
@@ -1146,6 +1149,8 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
+	struct led_classdev *led = dev_get_drvdata(dev);
+	struct asus_wmi *asus = container_of(led, struct asus_wmi, kbd_led);
 	u32 cmd, boot, awake, sleep, keyboard;
 	u32 arg0;
 	int err;
@@ -1172,6 +1177,8 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 	if (err)
 		return err;
 
+	asus->kbd_rgb_state_flags = arg0;
+
 	return count;
 }
 static DEVICE_ATTR_WO(kbd_rgb_state);
@@ -1944,8 +1951,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
-	scoped_guard(spinlock_irqsave, &asus_ref.lock)
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
 		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
+		if (asus->kbd_led_wk > 0)
+			asus->kbd_led_last_level = asus->kbd_led_wk;
+	}
 
 	if (asus->kbd_led_avail)
 		kbd_led_update(asus);
@@ -2155,6 +2165,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 
 	if (asus->kbd_led_avail) {
 		asus->kbd_led_wk = led_val;
+		asus->kbd_led_last_level = led_val > 0 ? led_val : ASUS_EV_MAX_BRIGHTNESS;
 		if (num_rgb_groups != 0)
 			asus->kbd_led.groups = kbd_rgb_mode_groups;
 	} else {
@@ -5146,6 +5157,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->platform_device = pdev;
 	wdrv->platform_device = pdev;
 	platform_set_drvdata(asus->platform_device, asus);
+	asus_hotk = asus;
 
 	if (wdrv->detect_quirks)
 		wdrv->detect_quirks(asus->driver);
@@ -5184,6 +5196,14 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->kbd_rgb_state_available =
 		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
 		asus->driver->quirks->kbd_rgb_state_available;
+	if (asus->kbd_rgb_state_available) {
+		asus->kbd_rgb_state_flags =
+			ASUS_WMI_TUF_RGB_STATE_CMD_ID |
+			FIELD_PREP(TUF_RGB_STATE_BOOT, 1) |
+			FIELD_PREP(TUF_RGB_STATE_AWAKE, 1) |
+			FIELD_PREP(TUF_RGB_STATE_SLEEP, 1) |
+			FIELD_PREP(TUF_RGB_STATE_KEYBOARD, 1);
+	}
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -5324,6 +5344,7 @@ static void asus_wmi_remove(struct platform_device *device)
 	struct asus_wmi *asus;
 
 	asus = platform_get_drvdata(device);
+	asus_hotk = NULL;
 	if (asus->driver->i8042_filter)
 		i8042_remove_filter(asus->driver->i8042_filter);
 	wmi_remove_notify_handler(asus->driver->event_guid);
@@ -5424,17 +5445,54 @@ static int asus_hotk_restore(struct device *device)
 	return 0;
 }
 
+static void asus_tuf_reassert_sleep_rgb_state(struct asus_wmi *asus)
+{
+	if (asus && asus->driver->quirks->kbd_rgb_state_available &&
+	    asus->kbd_rgb_state_available &&
+	    (asus->kbd_rgb_state_flags & TUF_RGB_STATE_SLEEP)) {
+		int level;
+		u32 arg0;
+
+		/*
+		 * Re-assert keyboard backlight using the last user-configured
+		 * brightness level (falling back to max brightness) with the
+		 * light-on bit (0x80) set.
+		 */
+		level = asus->kbd_led_last_level ?
+			asus->kbd_led_last_level : ASUS_EV_MAX_BRIGHTNESS;
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
+				      0x80 | (level & 0x7f), NULL);
+
+		/* Re-assert the last user-configured TUF RGB power state */
+		arg0 = asus->kbd_rgb_state_flags |
+		       FIELD_PREP(TUF_RGB_STATE_SAVE, 1);
+		asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
+					  ASUS_WMI_DEVID_TUF_RGB_STATE,
+					  arg0, 0, NULL);
+	}
+}
+
 static int asus_hotk_prepare(struct device *device)
 {
+	struct asus_wmi *asus = dev_get_drvdata(device);
+
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
 		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
 					   ASUS_USB0_PWR_EC0_CSEE_OFF);
 		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
 	}
+
+	asus_tuf_reassert_sleep_rgb_state(asus);
+
 	return 0;
 }
 
 #if defined(CONFIG_SUSPEND)
+static void asus_s2idle_prepare(void)
+{
+	asus_tuf_reassert_sleep_rgb_state(asus_hotk);
+}
+
 static void asus_ally_s2idle_restore(void)
 {
 	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
@@ -5444,20 +5502,20 @@ static void asus_ally_s2idle_restore(void)
 	}
 }
 
-/* Use only for Ally devices due to the wake_on_ac */
-static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
+static struct acpi_s2idle_dev_ops asus_s2idle_dev_ops = {
+	.prepare = asus_s2idle_prepare,
 	.restore = asus_ally_s2idle_restore,
 };
 
 static void asus_s2idle_check_register(void)
 {
-	if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
+	if (acpi_register_lps0_dev(&asus_s2idle_dev_ops))
 		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
 }
 
 static void asus_s2idle_check_unregister(void)
 {
-	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
+	acpi_unregister_lps0_dev(&asus_s2idle_dev_ops);
 }
 #else
 static void asus_s2idle_check_register(void) {}
-- 
2.55.0

