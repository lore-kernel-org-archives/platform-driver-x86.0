Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D942C08BB
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231817; cv=none; b=c6TGyO9h9ZCsyTdbo0AqKKHULk0lSY+issrNU9okYaqRq61QVkjssMcQpxGmKUmwID05vBDwwSf81DYblGstucw4/hQOI1nxNS4N+b5bSOGFERaoet01aHOjc0W4xKtf8VMbyAPDsi4vGa82tYDkWBp2EaG+6IPDse1GZyQLHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231817; c=relaxed/simple;
	bh=VHsJNyEFwIH8XfOekA32ValOXFyXwoT1K4MWfyyd9BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/lGMzzYJ1V8Hd1o5yqzDqkk50Fld5BdzbOoQdSPVKzzlegnzDV44SgGb+FkDYGrlqqlXhSSlHyA+tK5R5v3bsZgS7MczWb+ijmlOpZ4SbfAhufDoAoqBsq1Flz7uEHQzuEBoFB+n4vO0Ly9Zf74Zl40XJD4SOSs69b8Eis/hkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38c551f2497so19436211fa.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 08:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775231814; x=1775836614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G4+y8ZDf16bPcmZBwQVrQJZZDmLHCg7+9AfKHFcD4T0=;
        b=A+n9HctDDLX1zc+WVC7hYMCL/XNEHQxHNWtivfWYD/IjMpPSiHdZrHpiVwAwbtUboq
         rIkK0/OkWh+/yVYQkLj/qDPeqi0DmddE/B0VHiUuHT9PhATKJhRkgVyB2xVVESQPPc1D
         FFrbaJnTSd8wTEgHlquULIZS2UYl2IpXv7jz7P8nl3hKW4G56ZEA1wR/LnqVUiG/J4t5
         2iw+cB169J57Xojp03zsjuQForg8U3HMVKib3HwKkux/fmYKUWfP2USwbKmUHfz0SeWo
         I7WEKZoex5IxmfUWyvx3l+VPNtWVQKeoB6x6NYtzKOJwHoC6cwpGY8UDFyM2HA0zJ/ke
         rSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAH+Bx/k7BDW5sGriCF/vWVcwuITMu4hxFB3ftnsZ0ygMM0WtQmQ07+f+uXb+U9H4f8cQJi2AoxMkpvRBxQqUwoSYk@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk8M/MkKxJYpBFsOBBvqbm21m7V0CDCOE2TzxEobwFvaOS83Vz
	xpFPjwXkloOeB+sdGy3p4j7xrCXL3EhoLfpMkl4k63kcpeXA6eI7nKVOGdaZvkzH
X-Gm-Gg: AeBDieuEWzK1Avr3ipHhtjPmr8udwMvFB0683BiH2XSmiV7JljQisIHiyP+IdhdT9US
	92pr5U3aTfDFparyIPCJm+TUT7b9QIaeoaTGehSrWkKYHC978E4xXRwwMwwsjpBjTu4mEeI5FVT
	eHxHKs9wY37TfzT4VPBCgfsuzUZUTiDZuXx85wIKMnnkoQiav22uHYWT19Yi5rDiucnJjo8igA2
	9XjORW4ghiBmubvDLxCO9YRGHWg4biwUvtUWnBVI1HTqL0IRDSkMJcdvBJ32QxwCV5D3eygO8jF
	bQgbbt9QyRnQDH1vP516KNCjdwh00ovDTzyqnbyNOtq4R4Yk+g0lNg8isVwkLVyhLC8dk1JrJkQ
	pFBBPdji55pdID8rkcMs3+UVgGwhCzFVJHmGMdXr+/znZjfC1wsg6PiGAUJ+nwSQHpPmwRxiXkq
	mO+xgz7AgQz0jtJREsOkbCMV46PhyuoTlFcz7TQ0V/qie/OO7kwMI=
X-Received: by 2002:a05:6512:a88:b0:5a1:1496:922 with SMTP id 2adb3069b0e04-5a3375852aemr1050922e87.33.1775231813616;
        Fri, 03 Apr 2026 08:56:53 -0700 (PDT)
Received: from fedora (82-183-24-76.customers.ownit.se. [82.183.24.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc888sm1522324e87.56.2026.04.03.08.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:56:53 -0700 (PDT)
From: Joshua Grisham <josh@joshuagrisham.com>
To: ayaanmirzabaig85@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: josh@joshuagrisham.com,
	ayaanmirza788@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
Date: Fri,  3 Apr 2026 17:56:20 +0200
Message-ID: <20260403155620.14276-1-josh@joshuagrisham.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAMF+KeaTRH2JGs53VSJ_WMFJQMBW4wDbCkW6u3=ySxkPknDvpQ@mail.gmail.com>
References: <CAMF+KeaTRH2JGs53VSJ_WMFJQMBW4wDbCkW6u3=ySxkPknDvpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>

On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
mute, and camera block hotkeys do not generate i8042 scancodes.
Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
respectively, all of which previously fell through to the default
"unknown" warning in galaxybook_acpi_notify().

This patch refactors the existing camera lens cover input device to a
generic input device and adds handling for these three ACPI events:

- 0x7d (Fn+F9, keyboard backlight): schedule the existing
  kbd_backlight_hotkey_work which cycles brightness.

- 0x6e (Fn+F10, microphone mute): emit KEY_MICMUTE to the driver's
  input device.

- 0x6f (Fn+F11, camera block): if block_recording is active use the
  existing block_recording_hotkey_work; otherwise emit a toggle of the
  SW_CAMERA_LENS_COVER switch event to the driver's input device.

Tested on Samsung Galaxy Book 5 (SAM0430) and Samsung Galaxy Book2 Pro
(SAM0429).

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Co-developed-by: Joshua Grisham <josh@joshuagrisham.com>
Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>

---

v3->v4: Joshua's update to Ayaan's patch with the following changes:
- refactor the camera lens cover input device to a generic input device
- use this input device for both existing camera lens cover switch and
  the new KEY_MICMUTE event
- toggle SW_CAMERA_LENS_COVER instead of emitting KEY_CAMERA event in
  case device does not support block_recording
- small comments and spacing tweaks
---
 drivers/platform/x86/samsung-galaxybook.c | 89 ++++++++++++++++-------
 1 file changed, 63 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 755cb82bdb60..360bfc1e52a9 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -35,6 +35,7 @@
 struct samsung_galaxybook {
 	struct platform_device *platform;
 	struct acpi_device *acpi;
+	struct input_dev *input;
 
 	struct device *fw_attrs_dev;
 	struct kset *fw_attrs_kset;
@@ -50,10 +51,9 @@ struct samsung_galaxybook {
 	/* block in case brightness updated using hotkey and another thread */
 	struct mutex kbd_backlight_lock;
 
-	void *i8042_filter_ptr;
-
 	struct work_struct block_recording_hotkey_work;
-	struct input_dev *camera_lens_cover_switch;
+
+	void *i8042_filter_ptr;
 
 	struct acpi_battery_hook battery_hook;
 
@@ -198,12 +198,19 @@ static const guid_t performance_mode_guid =
 #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
 #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
 
+/* ACPI hotkey notifications for devices with SAM0430 or higher */
+#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  0x7d
+#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         0x6f
+#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        0x6e
+
+/* Keyboard hotkey notifications for devices prior to SAM0430 */
 #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
 #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
 #define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
 #define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
-#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
-#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
+
+#define GB_KEY_BATTERY_NOTIFY_KEYUP    0xf
+#define GB_KEY_BATTERY_NOTIFY_KEYDOWN  0x8f
 
 /*
  * Optional features which have been determined as not supported on a particular
@@ -859,9 +866,9 @@ static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const
 	if (err)
 		return err;
 
-	input_report_switch(galaxybook->camera_lens_cover_switch,
-			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
-	input_sync(galaxybook->camera_lens_cover_switch);
+	input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
+			    value ? 1 : 0);
+	input_sync(galaxybook->input);
 
 	return 0;
 }
@@ -887,24 +894,9 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
 		return GB_NOT_SUPPORTED;
 	}
 
-	galaxybook->camera_lens_cover_switch =
-		devm_input_allocate_device(&galaxybook->platform->dev);
-	if (!galaxybook->camera_lens_cover_switch)
-		return -ENOMEM;
-
-	galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
-	galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
-	galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
-
-	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
-
-	err = input_register_device(galaxybook->camera_lens_cover_switch);
-	if (err)
-		return err;
-
-	input_report_switch(galaxybook->camera_lens_cover_switch,
-			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
-	input_sync(galaxybook->camera_lens_cover_switch);
+	input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
+			    value ? 1 : 0);
+	input_sync(galaxybook->input);
 
 	return 0;
 }
@@ -1120,6 +1112,23 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
  * Hotkeys and notifications
  */
 
+static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
+{
+	galaxybook->input =
+		devm_input_allocate_device(&galaxybook->platform->dev);
+	if (!galaxybook->input)
+		return -ENOMEM;
+
+	galaxybook->input->name = "Samsung Galaxy Book Extra Inputs";
+	galaxybook->input->phys = DRIVER_NAME "/input0";
+	galaxybook->input->id.bustype = BUS_HOST;
+
+	input_set_capability(galaxybook->input, EV_KEY, KEY_MICMUTE);
+	input_set_capability(galaxybook->input, EV_SW, SW_CAMERA_LENS_COVER);
+
+	return input_register_device(galaxybook->input);
+}
+
 static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
 {
 	struct samsung_galaxybook *galaxybook =
@@ -1260,6 +1269,29 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
 		if (galaxybook->has_performance_mode)
 			platform_profile_cycle();
 		break;
+	case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
+		if (galaxybook->has_kbd_backlight)
+			schedule_work(&galaxybook->kbd_backlight_hotkey_work);
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
+		input_report_key(galaxybook->input, KEY_MICMUTE, 1);
+		input_sync(galaxybook->input);
+		input_report_key(galaxybook->input, KEY_MICMUTE, 0);
+		input_sync(galaxybook->input);
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
+		if (galaxybook->has_block_recording) {
+			schedule_work(&galaxybook->block_recording_hotkey_work);
+		} else {
+			/* toggle switch on+off; actual state is unknown */
+			input_report_switch(galaxybook->input,
+					    SW_CAMERA_LENS_COVER, 1);
+			input_sync(galaxybook->input);
+			input_report_switch(galaxybook->input,
+					    SW_CAMERA_LENS_COVER, 0);
+			input_sync(galaxybook->input);
+		}
+		break;
 	default:
 		dev_warn(&galaxybook->platform->dev,
 			 "unknown ACPI notification event: 0x%x\n", event);
@@ -1360,6 +1392,11 @@ static int galaxybook_probe(struct platform_device *pdev)
 	galaxybook->platform = pdev;
 	galaxybook->acpi = adev;
 
+	err = galaxybook_input_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+				     "failed to initialize input device\n");
+
 	/*
 	 * Features must be enabled and initialized in the following order to
 	 * avoid failures seen on certain devices:
-- 
2.53.0

