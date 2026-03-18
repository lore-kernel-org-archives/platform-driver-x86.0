Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9027081F
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792772; cv=none; b=URsYR3pWK3hG4yYygBJe75STDy7nRSxgwr7ityPwdHNBOiE6N7w+/eEOkn1xPa91Rakc6E9bEl4Zybkpg8aruGicGmIGJusbkiyJ0s7S3FIwXOoSGdq2YTqriGz/pqyWwNMmWBsRVo5xqEIndcIMICKwv+kKpk9IXbpymiFq+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792772; c=relaxed/simple;
	bh=MWjXifQpj9hFXf0AoP6SntMDp5UQPcMWbEWb4L6sXwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkYeOCZg+gmBKwGvUGAQYJO6u11C5G8c/kcOcIhwZyjUpPWnZp8yiqS0AwGA78a1dG6ZpcWm7Wt3Odb4DSO6KYPyvVE178GuUMHhFqk35wUNTSZ8QKU3pLCfLVExusoXS9wthVFaoS9Tpb5YrhFqtTE9NukIPFL8hcSI709PZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtSttKGo; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtSttKGo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35bb7afdc38so473280a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 17:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773792771; x=1774397571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Za1lY/7aQh0EQCGQeO+Jd7bBG80nrCu15hfnp5dkMM=;
        b=NtSttKGoLMNdrVFOrwO6rth15v6Gjb3GlebHRUZIUP1RnCpH7z4GAD2XQDf9TuI64Y
         ZSRm5tnGn+dT7puagsDGIUA3bWdPIZkq+0Qhu8XmpqJZf52127b/FroPGoLu71uWDe8H
         6SqteNTsjOpwA2+Mzyb5jwRmMrZXD4NqrC9hrAr3LXdhCQjByMh+7FVlMNZ756FXYnu9
         rF1A2VUbYO4cgqjAXAV8G2tQ8FrzuaXP8s/dWmgswzu/PWOEaj4aovpS5TGbLUhbldOT
         lyrlCW1EKKM2kpjqhA0ripxC3EM+o4fp5AZocEZkm0GZDgOonpCOXUm1JlmP/ksnHoj3
         Z5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773792771; x=1774397571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Za1lY/7aQh0EQCGQeO+Jd7bBG80nrCu15hfnp5dkMM=;
        b=QEuDh981DvVliwW42Ybtr68R+SIIhSevqMWUHTqQJ9T1DNlYCdcWEi+tv0uuY6l6/r
         0UjYT5nDTSr0KW0MgsexqO9aB+eBTM9L5QAbvbsb34KWkrnS++axw4CEXlKcWYlQEVSw
         IojKF+JOqGCt91jar+e9/j+A2bt+mMBWlKyogG6IO6N8eDIMnGQNXUm64W+HREtwGFSy
         lG6Sqi6A6NHQfv1D5HTz2DORCFjmkCz5Sqh+TbDpZlPZmx4DwTX/Qf/D2W0+GrnXho3t
         IohGIfHRIOGF95ga9CX4BC8JEDZuLfMpo4/zI0l6ZCMQXoDjKA8uIhp05rVaTwF4q+XV
         2taQ==
X-Forwarded-Encrypted: i=1; AJvYcCWymu4HwKR3ylLq1ECxPHnU4bQ1TxtAwFGDX/iaBHmPhIuS6w3uQsOl2fH1BCIAVpBH2KMClHZqjq+doHvhsNbyQ4Nf@vger.kernel.org
X-Gm-Message-State: AOJu0YzmU/ndvPq50g34kgECa14rOVDIVcvMAXJAUFlxDxaHGUcEm3k1
	E8b54VZgoTBK0mKY+DcSzOJd3qAT4Jil9v9lLhtlCnGOiIONcITXVbkBjWwoAJgm
X-Gm-Gg: ATEYQzwFPj4hdZCbCYaHDNP5+w/z7JQ6wdSBkM0DDqt5dSRR5hIjHiEy/u3uN/mciik
	ekBPhEyw1NeTgSJbwDwuGpneQBqLFG3MEelAHjRZCXHj3LLSqS8AxDS8uXJOD3l65Zfk+7oCNTJ
	30688HoyJRLaKm3VdhES1/vTCneVbWKjMzuoFV63hPzpynXZxiF8Lm4lydv9z2u27f1znpNePhg
	zHmuYaD3kohX1CHXksWHDq/Ue5IOWrPDtNuxO87PCl378xpjvWv5lfctNb8V9iAjGoon7PW9bNf
	u56Emb6i5cHI6zItpEHCCM1uDd+IFoB2phnwEGkQsCk6UoCVmcVW53waRCG9+PdClFflIr5YAtl
	YT8MvkHRGKZ7dx1hoZ7XLzDzsfvM0TztL4L03xvobvmnNsANHSSQ5+a49piBiA50E2jGcH7r6nK
	ZiuvTMOScvFu/uW/ZIo1nyNUinu6zxQjb6BChJdc81/a8=
X-Received: by 2002:a17:90b:1642:b0:359:8abc:b348 with SMTP id 98e67ed59e1d1-35bb9ef30ebmr1141198a91.18.1773792770589;
        Tue, 17 Mar 2026 17:12:50 -0700 (PDT)
Received: from gb5.tail50fddd.ts.net ([139.5.199.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada5c76csm4055358a91.6.2026.03.17.17.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:12:50 -0700 (PDT)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: ayaanmirza788@gmail.com,
	ayaanmirzabaig85@gmail.com,
	josh@joshuagrisham.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
Date: Wed, 18 Mar 2026 05:42:42 +0000
Message-ID: <20260318054242.24747-1-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <44912fc0-91fb-0a85-64fa-1b0b3661f0d8@linux.intel.com>
References: <44912fc0-91fb-0a85-64fa-1b0b3661f0d8@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
mute, and camera block hotkeys do not generate i8042 scancodes.
Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
respectively, all of which previously fell through to the deafult
"unknown" warning in galaxybook_acpi_notify().

Add handling for these three events:

- 0x7d (Fn+F9, keyboard backlight): schedule the existing
  kbd_backlight_hotkey_work which cycles brightness.

- 0x6e (Fn+F10, microphone mute): register a new hotkey input device
  and emit KEY_MICMUTE.

- 0x6f (Fn+F11, camera block): if block_recording is active use the
  existing block_recording_hotkey_work; otherwise emit KEY_CAMERA via the
  hotkey input device on models where the block_recording ACPI feature is
  not supported

Tested on Samsung Galaxy Book 5 (SAM0430).

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 47 +++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 755cb82bdb60..f6770ede62d2 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -54,6 +54,7 @@ struct samsung_galaxybook {
 
 	struct work_struct block_recording_hotkey_work;
 	struct input_dev *camera_lens_cover_switch;
+	struct input_dev *hotkey_dev;
 
 	struct acpi_battery_hook battery_hook;
 
@@ -197,6 +198,9 @@ static const guid_t performance_mode_guid =
 #define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
 #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
 #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
+#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  	0x7d
+#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         	0x6f
+#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        	0x6e
 
 #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
 #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
@@ -1223,6 +1227,22 @@ static void galaxybook_i8042_filter_remove(void *data)
 	cancel_work_sync(&galaxybook->block_recording_hotkey_work);
 }
 
+static int galaxybook_hotkey_init(struct samsung_galaxybook *galaxybook)
+{
+	galaxybook->hotkey_dev = devm_input_allocate_device(&galaxybook->platform->dev);
+	if (!galaxybook->hotkey_dev)
+		return -ENOMEM;
+
+	galaxybook->hotkey_dev->name = "Samsung Galaxy Book hotkeys";
+	galaxybook->hotkey_dev->phys = DRIVER_NAME "/input1";
+	galaxybook->hotkey_dev->id.bustype = BUS_HOST;
+
+	input_set_capability(galaxybook->hotkey_dev, EV_KEY, KEY_MICMUTE);
+	input_set_capability(galaxybook->hotkey_dev, EV_KEY, KEY_CAMERA);
+
+	return input_register_device(galaxybook->hotkey_dev);
+}
+
 static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
 {
 	int err;
@@ -1260,6 +1280,28 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
 		if (galaxybook->has_performance_mode)
 			platform_profile_cycle();
 		break;
+	case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
+		if (galaxybook->has_kbd_backlight)
+			schedule_work(&galaxybook->kbd_backlight_hotkey_work);
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
+		if (galaxybook->hotkey_dev) {
+			input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE, 1);
+			input_sync(galaxybook->hotkey_dev);
+			input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE, 0);
+			input_sync(galaxybook->hotkey_dev);
+		}
+		break;
+	case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
+		if (galaxybook->has_block_recording)
+			schedule_work(&galaxybook->block_recording_hotkey_work);
+		else if (galaxybook->hotkey_dev) {
+			input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 1);
+			input_sync(galaxybook->hotkey_dev);
+			input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 0);
+			input_sync(galaxybook->hotkey_dev);
+		}
+		break;
 	default:
 		dev_warn(&galaxybook->platform->dev,
 			 "unknown ACPI notification event: 0x%x\n", event);
@@ -1397,6 +1439,11 @@ static int galaxybook_probe(struct platform_device *pdev)
 		return dev_err_probe(&galaxybook->platform->dev, err,
 				     "failed to initialize firmware-attributes\n");
 
+	err = galaxybook_hotkey_init(galaxybook);
+	if (err)
+		return dev_err_probe(&galaxybook->platform->dev, err,
+					 "failed to initialize hotkey input device\n");
+
 	err = galaxybook_i8042_filter_install(galaxybook);
 	if (err)
 		return dev_err_probe(&galaxybook->platform->dev, err,
-- 
2.53.0

