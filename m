Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552272F39A1
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160998; cv=none; b=Fr8Tgya+U3gg5vKp9/UepQ4Ajma6ZMw25H3GqfABuOWVGCiMPLPSSvakJ+yUcbYclDy/Tj8QXA5zTIDWLSHfKYCxcSpF9cqewIVz1c87yDXK0+gcrn0hlydXcFky6WM+UqfxyFOgRtEv1Y7Xo0UTUWzz0lTsDjmTqvpU5KzpCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160998; c=relaxed/simple;
	bh=HuhbY99Tq9VwNi9U76ty6UFssfROtOoK1TQIkve2QvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uyA9qvmj25OwPFZzmk0DfQQP73RvEnqoxkAiUzDntU3RYKbKE5RkViQlYW+RUEMaB6z/1N0mgUlTaAn404xwDX4xW27HUpzlmgAnGvt8QNKH/m8snxAZ0PMPSTuYrYv7d/cuoYCD2BU28c8JcdDXfhwhi/5efInAoLODZUIGOMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9/KSv4p; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9/KSv4p"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82318b640beso3485615b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Feb 2026 15:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770160997; x=1770765797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnLsAvIXI2gtIdacW08fZdIldb2Dd1l/yO41kdLPKAY=;
        b=S9/KSv4pE1XNytKqlMEReYLZtKInfL0CVwyGG3aXuUmsVQtKD0W39y5FLKHOKqBLRB
         20aZU17ByubPMm9PDDMIBV38KBNEnuiER1nB8F1z8fMJmheTwD/UsfVH3k/NSXk9yhDg
         mS7fWH5IIAyjWq8binqMzEn9THPOl20yaBmCAQk8tVaKGTJSRWvESYE5gON3PMKXl7Za
         j0jY3eNw4ORpoa3VJIKosZui4lwtT13QRnQvvSQGR/4WAvhwjX+qsVHYShNHNsovUAj7
         13W3hj5Y2llX4oj7mpLVUpOCvp4TRPgep7FVrY3fItQIAHlhZ0vHMl5/DyNNNrKgcYhF
         xWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160997; x=1770765797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnLsAvIXI2gtIdacW08fZdIldb2Dd1l/yO41kdLPKAY=;
        b=FdhxduQBqd20DDjBcJ12Innqoc3hTdM4tYW8+/QfD5zcrgd6b+ezqutd8VRkJ2lIKy
         Hro+UNhkeOsQIBVRGJPLCAnM+l47E0Z+TAYJgh3PDQoEJ650MEfCvihsyOK1FF4fmsiJ
         W7DAWn/7idhOwzZh6AiS3at96u0j+52WSMasH5hKhT5kJh+ipNMmWmdeyVNuTDTB6A55
         WKRCzQ2Y6dWFwJU4Obt86A7hn56EG7WRCXLgSf3pqvYlfY/Sf06afycwdv35/A8IY3AC
         x6QyrDm0fHmOaAntDn8ZgmFrSSk1FY01dT/PczjCWrz0FID+2SL0XlpTRge5gTB79+Dm
         Xt4A==
X-Forwarded-Encrypted: i=1; AJvYcCXCil4UzLyJslbRiGEsBbDLNZMCV87BVNfshcYidA2s0R518Vars9gDH4aeCEQoTlYU9Q6Cf5mn2KNqsbIgStrmd8qh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwg66IxyXwJLwGzDH3f9rGmxkuj52pFlUBU0rDyxudtpUW+PnK
	vTgMfG3GO3iX9eDQ+qVuuCamiVglxx1Q+DJ7sX6oGKfqUMKn0IdMNB5M
X-Gm-Gg: AZuq6aJxxZ3bJnCnZ1H2iczWzLFB6FVOtK9Eqm6zugmqid2BJLF3vRPXEx8/aSLSOa8
	/fAt62nLwp6aT5Hu9ByVqX3i7/tYs8CDAqRrGE9DdJqkSE7ZjX2KfoNcKSFDJGPKhaY0PlVFSAD
	ISwaT+nubTZMqqtwSqIVac8gTJ7YrrVksF0zKY9879yMHzrVBYqmuvBHunqpwUeOujeBYlfIe/J
	j8Z8X3N250cL0zuu1UBCNqmYjn2e7v/cZIJlffOj0j3qPuY3pwb6Hr47rGd8rq0jramefGYtZ41
	e0cSbzWuKFc1SBJcTFTJc17sBH+rG8W9o2+QzwNMoUAz8RgX4RFkCnPIxD4gmrrM5TnQ4Loyzbr
	pGS9llnn2SgsasCpJB9NCvnJc9pZvRpP/sr9BTnBSu0uDZdu5gc31VsGJRYFI3fGB0T/EpxStxu
	IgCL+fkv5HNdG4LNdBpfsF5r3OxV7scZpxnqMMbaZy6onBbBca/HEs
X-Received: by 2002:a05:6a21:3513:b0:38d:fe2a:4b0a with SMTP id adf61e73a8af0-3937211de01mr1009859637.33.1770160996523;
        Tue, 03 Feb 2026 15:23:16 -0800 (PST)
Received: from ubuntu-2504-ThinkPad-X9-14-Gen-1 ([2400:2410:5f2b:700:289b:8f4a:d72f:2990])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c70db6sm346327a12.23.2026.02.03.15.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:23:16 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic max_brightness
Date: Wed,  4 Feb 2026 08:22:18 +0900
Message-ID: <20260203232219.11683-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dynamically detect keyboard backlight capabilities and set
max_brightness correctly (2 for old models, 3 for new models
with Auto mode).

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 33 ++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..f670cdd1791e 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5043,6 +5043,9 @@ static struct ibm_struct video_driver_data = {
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
+/* Maximum level supported by hardware, will be updated in init */
+static int kbdlight_max_level = 2;
+
 static int kbdlight_set_level(int level)
 {
 	int ret = 0;
@@ -5050,6 +5053,10 @@ static int kbdlight_set_level(int level)
 	if (!hkey_handle)
 		return -ENXIO;
 
+	/* Validate against detected max level */
+	if (level < 0 || level > kbdlight_max_level)
+		return -EINVAL;
+
 	mutex_lock(&kbdlight_mutex);
 
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
@@ -5075,6 +5082,7 @@ static int kbdlight_get_level(void)
 	if (status < 0)
 		return status;
 
+	/* Status can be 0, 1, 2, or 3 (Auto) */
 	return status & 0x3;
 }
 
@@ -5143,7 +5151,7 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	.led_classdev = {
 		.name		= "tpacpi::kbd_backlight",
-		.max_brightness	= 2,
+		.max_brightness	= 2,	/*Initial value, will be updated in init*/
 		.flags		= LED_BRIGHT_HW_CHANGED,
 		.brightness_set_blocking = &kbdlight_sysfs_set,
 		.brightness_get	= &kbdlight_sysfs_get,
@@ -5167,6 +5175,17 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 	kbdlight_brightness = kbdlight_sysfs_get(NULL);
 	tp_features.kbdlight = 1;
 
+	/* Detect hardware capabilities and set max_brightness */
+	if (acpi_evalf(hkey_handle, NULL, "MLCS", "dd", 3)) {
+		/* MLCS accepts level 3 - new ThinkPad with Auto mode */
+		kbdlight_max_level = 3;
+		tpacpi_led_kbdlight.led_classdev.max_brightness = 3;
+	} else {
+		/* MLCS rejects level 3 - old ThinkPad */
+		kbdlight_max_level = 2;
+		tpacpi_led_kbdlight.led_classdev.max_brightness = 2;
+	}
+
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				   &tpacpi_led_kbdlight.led_classdev);
 	if (rc < 0) {
@@ -5201,6 +5220,7 @@ static int kbdlight_set_level_and_update(int level)
 static int kbdlight_read(struct seq_file *m)
 {
 	int level;
+	int i;
 
 	if (!tp_features.kbdlight) {
 		seq_printf(m, "status:\t\tnot supported\n");
@@ -5210,9 +5230,13 @@ static int kbdlight_read(struct seq_file *m)
 			seq_printf(m, "status:\t\terror %d\n", level);
 		else
 			seq_printf(m, "status:\t\t%d\n", level);
-		seq_printf(m, "commands:\t0, 1, 2\n");
-	}
 
+		/* Show available commands based on hardware */
+		seq_puts(m, "commands:\t0");
+		for (i = 1; i <= tpacpi_led_kbdlight.led_classdev.max_brightness; i++)
+			seq_printf(m, ", %d", i);
+		seq_puts(m, "\n");
+	}
 	return 0;
 }
 
@@ -5230,7 +5254,8 @@ static int kbdlight_write(char *buf)
 			return res;
 	}
 
-	if (level >= 3 || level < 0)
+	/* Validate against max level */
+	if (level < 0 || level > tpacpi_led_kbdlight.led_classdev.max_brightness)
 		return -EINVAL;
 
 	return kbdlight_set_level_and_update(level);
-- 
2.51.0

