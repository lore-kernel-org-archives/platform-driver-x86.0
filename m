Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93053C9441
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475122; cv=none; b=jrMUau+joD0Vs2zn8IdzK9Q1za2lINUhWiM6pI9amI+/Doo+pdOJf3qIKJEv5eV/N/q3HHBF5EPMav6BmlcT5aJmveIj/vj+l+RQcCOd033psi3QY5QNhnIOktyb4GExkXMjV2MCFeyF9S64AvN25OYbarxhHaJY+kFBfC2pQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475122; c=relaxed/simple;
	bh=6kQq0eBdfXAkv1SL5/Nq9NKsnudYGCxJ+9hkw1kl1RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWkjh0YgUXVvGEWIKA1yJkg20h7jeicZGeZzav1jnpZh2nRhpIqBjNECngTuznPQG4IZxypzEeW4M5Uc6XbTSGG1d4FCIDi4SBY1kQGl4xGS/w3lw2lTI9Vy/zS5Vjbj6C42+rZhmRbRr02LGUtXrHGg/6xJqJFJBxiGS01/EOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbodKbXN; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbodKbXN"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso233926a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 14:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774475120; x=1775079920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au6WsPXcZDQIoCXv0m7SupOuS35o9BWi7swluP7o1Uc=;
        b=DbodKbXN8u660spP0qtNec8jsEfGlh4740bWGbEhfuY0bWIjLbusDg91U2vrDjQUci
         0ft90JovVuHn4gw7NTkhTIhBllndd1Ec+X8nOzruOyHG59S3WbtqmRaBa4qUF78YDunA
         tdkJxOxY0QXUWmfo73Nr4Xq1ETHBlrwkiI/yRWhYu1UQmldi/IuDqVtC3S0GPFPzdpmg
         PrabMzMCfOyyGCrCN2aga+QV9HeWR3xhbs4xdAjqCDpu4OuFOuY6ESSD0xNnu7WPxiO2
         GfHyVRf5YgiQDD0HJ92F9L9yBDQfkaQ58uW/TsdIgmjgkIlufj7ZkUo/i1BCAtm8IK1W
         jfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774475120; x=1775079920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Au6WsPXcZDQIoCXv0m7SupOuS35o9BWi7swluP7o1Uc=;
        b=iJPDVaiF8PvNBY7iqiPXMtf3dn2OGk+oVRFcLHHvJ2E+OThOycdOBWhzgxRwTPebEz
         vZEqfcNGWhn3fiyB8MbHrm3gp5i40P/60aoLKCNclrVXpnRtPp8fhMvorSVufuPaziLQ
         UpOvDNkY6wNNTqKHKos/gpJD2VcZBkc76Un+Hp4Oqc/LUoLAN1CVFHqCp7LMHL12EAun
         qsG3bac/T2DPIuXbvY2nZfIWQqRkfRTIaHOrANDM0SuX0LOl5wuUoBYSo9nq+0usfPFW
         knoJFuD7zmDAIseP2jhg2+UY5EnnP+dLmW9yKS60yRliy8Im/c7rxXAFiupQztyLv9W/
         +sgg==
X-Forwarded-Encrypted: i=1; AJvYcCVXS8i0dUBB+mmVn5WxjT/ebYJCyrY6meN3yeJCOhNCg4bDVGIza5RBmmhNkNFfRRfQYCZbh/JDqQxusdJnVdgbqYd5@vger.kernel.org
X-Gm-Message-State: AOJu0YwjNO+lJH9hF/ZTVevJQUIZvcSiulK565FsF7tjSUZIkslqyzda
	Xcyla5Mcw1DPIkDd+y1jHWrU2eMs3vR1xOD/hQcEBCvkGPqSGeqLVpbW
X-Gm-Gg: ATEYQzzcLjcvgfvG/LjD+B8n/WCYAXE+tN4NOBW0zjkAMnvvf0Kh+n9RjRYEK/QrM5n
	drWjuV1UpUT27ULWcWnbM9KSXnri7vkiirp4Kjf9dO1UcvneS+z2y/bianT3ywCQ1pxML2/ncnr
	7pHSEwocVhE9YR9sKD05Ghct5MN7HD3F1B4Qvaw+eVXuv4S/X6HXChVzahVUihbwpNmNAQMdHqS
	hQowg1fVhkW9fqza/cxNVSCSOtK9k8gU79QhZbWvjnaE+OOM1Vb4BcDrR+cKFN3y6mWuU0E7cqO
	hWRSIzps3UlEdf9dobMwOX5h7ZhKIGilAmFjk1Z7wMPcscGCihgDmhdN0X4hXweD5jA6Cd0D3ip
	6MqumEITIQpRnSdiV7L5hJ+UPhxDm/aVpXyAKiTz78IUXcn7MEO5XJpWbVleZkwr37ZhqzdhFF7
	Y4CT6QN0XANhjHIRRy22FVk0lZr/knUrPQFoCbGeow4J0=
X-Received: by 2002:a17:90b:35cf:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-35c0dd6a759mr4579469a91.19.1774475118091;
        Wed, 25 Mar 2026 14:45:18 -0700 (PDT)
Received: from gb5.tail50fddd.ts.net ([139.5.199.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0ac5b287sm4533982a91.4.2026.03.25.14.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:45:17 -0700 (PDT)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: ayaanmirza788@gmail.com,
	ayaanmirzabaig85@gmail.com,
	josh@joshuagrisham.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3] platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications
Date: Thu, 26 Mar 2026 03:15:06 +0000
Message-ID: <20260326031506.35280-1-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <8e55cf70-5147-849a-ad5c-24a32727e620@linux.intel.com>
References: <8e55cf70-5147-849a-ad5c-24a32727e620@linux.intel.com>
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
respectively, all of which previously fell through to the default
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
index 755cb82bdb60..fe549e224c17 100644
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
+#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  0x7d
+#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         0x6f
+#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        0x6e
 
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
+		if (galaxybook->has_block_recording) {
+			schedule_work(&galaxybook->block_recording_hotkey_work);
+		} else if (galaxybook->hotkey_dev) {
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

