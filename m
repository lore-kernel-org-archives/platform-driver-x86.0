Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44341FBC98;
	Sat, 21 Dec 2024 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760839; cv=none; b=c5oTw7E0aRbc0zFzyuWHyra+Thi7z49fN6VN0v7jNCB/wjqbavnrU97Psv+PNW2y3vxXmzIbtHgAVWYqiV26ypIg57lSAeJX7sbu7sZLlG1c1hMrasHGgQJ9l74BQzG0qTcnrZjqB7p9zHlB2mfNa78KOzjHACiOpI85L+QJmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760839; c=relaxed/simple;
	bh=5CnBe9kWF5Xd3kzhKNbLWhDPJqjruzdfhp+fY5+JcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htrCpw2K0CEVPFProN3Iy++hqM4g34ZzFYGsqhueQcIhFP6hu3/h9YRSYdHtZxfryfMRHYpjFnXdBVmPrTsBX5ZRGDM3Y+yAee0zPOsRjxuhoTbp7QSLbwL3yRyXyOQHK1ClYDYGYYRrgmSNkWcG14zFFdVGkwzpqmZprNFu7AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b58WHhll; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b58WHhll"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6efed201f1dso18687507b3.0;
        Fri, 20 Dec 2024 22:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760836; x=1735365636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ2DwnO5k7IhHUoiagUS22J7YGxdemfg2FtjCjbXNzw=;
        b=b58WHhllSkDEKiLnVNAEMtoOPYf2mfT1YT6dWM2hE9Ei5hw79p2ke763YuVCWdA0Jn
         3aMaPx8bZloIv/FkefhGaI1Iz3CKRPZ+8ssD1J3zcwWpStYQQFy9f+IINQ9/Q2uEMHlZ
         XSHSV1lCZCyMW4/snnPs2onIGrRJE5R7t/eIbKXBG+NmKCd1ln/QmKfES55m3BJbz3E+
         DmkViZ0lXhkfFuiAuHURDiwSE4lVVv9sBHyKkZ2RtWNEmMBzwpqyS3dYloyJfqujfI8U
         Sx0EdxVpeC1mL8Xpah5MZqG8MuSwy/3uw9QVxmHIO47uGXYT+ZuLSCMYjv+LwvJ8G46B
         GrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760836; x=1735365636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ2DwnO5k7IhHUoiagUS22J7YGxdemfg2FtjCjbXNzw=;
        b=xP+6dZ62ZjlymczfXXH/teyT88YfWAAQCWpp/zphrQMVdm0seiOqkWc3cPI0GfA3JD
         WBWWNp8vzJC00lYFyWNC2wLt4gBK1TDzbdXGJj3MvS6Wv8bkHX0pjW+bhFfFgmmsjtXR
         mwz7WXP7aZdeXBaScUsNtOSmbB5s4sHm7RFr10YJ693n2sFsv5jcol970Qi3l2zZeuwC
         Lo+G/W4WFON4qgO7jeZWKA94FFT3X8P0cmpP8bmffzZNU7CrIjamrgIedM/STZ/anbYz
         IWu7460/dkiJ5clXZziY/ngkLs7POipa0YbLoj4eN4w6L6tWGUhwIcCePgujD1NrNdbD
         EdMA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cxBAHsspOJfEmFV72620gS5PpR2HQvJb88ZWUllOHU0jSJmUlHq3S1W+QZZKqifjTmbtqFauVEl7aS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87m68ku2PMWsCMfWmFb7F18+MaSLbA0Sn8TRbeCLDUAL43F97
	PGemT/q32Lc1hfG0AgEas+3WRXzWr56g9ABEyHYQQO1ZM749+tS7ISX95g==
X-Gm-Gg: ASbGncsG2sZNo9y4P//On8d+gR0zJiOS5rR4PmYsTM83vfkJxlp7ozcU7LwnDsqKXRR
	lfXqeHrIflfey0iTrgezPQotoLTZp546y8fqBCW3XVeuA5kirNxnhqu5VJaNysbJv+UdFofNGBN
	9Pv7LCHrBNJ1dkM+t18CJ/iVNB37EU9VwsBn0h2E3TxJ63d5ZzELzYr/w5Wx2PO4jZP2ODwQJyu
	GJRqQnCN1998PxGxNN5h+0OzBVXlx25Nn/E9yXqA4ieNx+mLtvfIXu2RzWoJ66I
X-Google-Smtp-Source: AGHT+IHau542g2q5qfb1affosnkKSWj4STsRwvndbP3MxFhnQJXn7J6jvIW/ULh1VgN2pIp5KqRDiA==
X-Received: by 2002:a05:690c:88c:b0:6e3:37a7:8a98 with SMTP id 00721157ae682-6f3f8114d78mr52760527b3.14.1734760836349;
        Fri, 20 Dec 2024 22:00:36 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:35 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 16/20] platform/x86: Add alienware-wmi.h
Date: Sat, 21 Dec 2024 00:59:13 -0500
Message-ID: <20241221055917.10555-17-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a header file for alienware-wmi with shared resources to support the
upcoming file split.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-base.c    |  93 ++--------------
 drivers/platform/x86/dell/alienware-wmi.h     | 103 ++++++++++++++++++
 2 files changed, 112 insertions(+), 84 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 8ea08f5f8810..e8d470bbb608 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -16,26 +16,7 @@
 #include <linux/dmi.h>
 #include <linux/leds.h>
 #include <linux/wmi.h>
-
-#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
-#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
-#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
-
-#define WMAX_METHOD_HDMI_SOURCE		0x1
-#define WMAX_METHOD_HDMI_STATUS		0x2
-#define WMAX_METHOD_BRIGHTNESS		0x3
-#define WMAX_METHOD_ZONE_CONTROL	0x4
-#define WMAX_METHOD_HDMI_CABLE		0x5
-#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
-#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
-#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
-#define WMAX_METHOD_THERMAL_INFORMATION	0x14
-#define WMAX_METHOD_THERMAL_CONTROL	0x15
-#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
-
-#define WMAX_THERMAL_MODE_GMODE		0xAB
-
-#define WMAX_FAILURE_CODE		0xFFFFFFFF
+#include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
@@ -54,18 +35,6 @@ enum INTERFACE_FLAGS {
 	WMAX,
 };
 
-enum LEGACY_CONTROL_STATES {
-	LEGACY_RUNNING = 1,
-	LEGACY_BOOTING = 0,
-	LEGACY_SUSPEND = 3,
-};
-
-enum WMAX_CONTROL_STATES {
-	WMAX_RUNNING = 0xFF,
-	WMAX_BOOTING = 0,
-	WMAX_SUSPEND = 3,
-};
-
 enum WMAX_THERMAL_INFORMATION_OPERATIONS {
 	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
 	WMAX_OPERATION_LIST_IDS			= 0x03,
@@ -122,7 +91,6 @@ struct quirk_entry {
 
 static struct quirk_entry *quirks;
 
-
 static struct quirk_entry quirk_inspiron5675 = {
 	.num_zones = 2,
 	.hdmi_mux = 0,
@@ -342,33 +310,10 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 struct awcc_features *awcc;
 
-struct color_platform {
-	u8 blue;
-	u8 green;
-	u8 red;
-} __packed;
-
-struct wmax_brightness_args {
-	u32 led_mask;
-	u32 percentage;
-};
-
 struct wmax_basic_args {
 	u8 arg;
 };
 
-struct legacy_led_args {
-	struct color_platform colors;
-	u8 brightness;
-	u8 state;
-} __packed;
-
-struct wmax_led_args {
-	u32 led_mask;
-	struct color_platform colors;
-	u8 state;
-} __packed;
-
 struct wmax_u32_args {
 	u8 operation;
 	u8 arg1;
@@ -382,30 +327,10 @@ struct awcc_priv {
 	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 };
 
-struct alienfx_priv {
-	struct platform_device *pdev;
-	struct led_classdev global_led;
-	struct color_platform colors[4];
-	u8 global_brightness;
-	u8 lighting_control_state;
-};
-
-struct alienfx_ops {
-	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
-		       u8 location);
-	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
-			      u8 brightness);
-};
-
-struct alienfx_platdata {
-	struct wmi_device *wdev;
-	struct alienfx_ops ops;
-};
-
 static u8 interface;
 
-static acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-					 void *in_args, size_t in_size, u32 *out_data)
+acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+				  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1139,7 +1064,7 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct platform_device *pdev;
 	int ret;
@@ -1162,7 +1087,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 	return 0;
 }
 
-static void alienware_alienfx_exit(struct wmi_device *wdev)
+void alienware_alienfx_exit(struct wmi_device *wdev)
 {
 	struct platform_device *pdev;
 
@@ -1242,12 +1167,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
 	.remove = legacy_wmi_remove,
 };
 
-static int __init alienware_legacy_wmi_init(void)
+int __init alienware_legacy_wmi_init(void)
 {
 	return wmi_driver_register(&alienware_legacy_wmi_driver);
 }
 
-static void __exit alienware_legacy_wmi_exit(void)
+void __exit alienware_legacy_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_legacy_wmi_driver);
 }
@@ -1333,7 +1258,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.remove = wmax_wmi_remove,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1350,7 +1275,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
new file mode 100644
index 000000000000..78ac10122155
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Alienware WMI special features driver
+ *
+ * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#ifndef _ALIENWARE_WMI_H_
+#define _ALIENWARE_WMI_H_
+
+#include <linux/leds.h>
+#include <linux/platform_device.h>
+#include <linux/wmi.h>
+
+#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
+#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
+#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
+
+#define WMAX_METHOD_HDMI_SOURCE			0x1
+#define WMAX_METHOD_HDMI_STATUS			0x2
+#define WMAX_METHOD_BRIGHTNESS			0x3
+#define WMAX_METHOD_ZONE_CONTROL		0x4
+#define WMAX_METHOD_HDMI_CABLE			0x5
+#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
+#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
+#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
+#define WMAX_METHOD_THERMAL_INFORMATION		0x14
+#define WMAX_METHOD_THERMAL_CONTROL		0x15
+#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
+
+#define WMAX_THERMAL_MODE_GMODE			0xAB
+
+#define WMAX_FAILURE_CODE			0xFFFFFFFF
+
+enum LEGACY_CONTROL_STATES {
+	LEGACY_RUNNING = 1,
+	LEGACY_BOOTING = 0,
+	LEGACY_SUSPEND = 3,
+};
+
+enum WMAX_CONTROL_STATES {
+	WMAX_RUNNING = 0xFF,
+	WMAX_BOOTING = 0,
+	WMAX_SUSPEND = 3,
+};
+
+struct color_platform {
+	u8 blue;
+	u8 green;
+	u8 red;
+} __packed;
+
+struct wmax_brightness_args {
+	u32 led_mask;
+	u32 percentage;
+};
+
+struct legacy_led_args {
+	struct color_platform colors;
+	u8 brightness;
+	u8 state;
+} __packed;
+
+struct wmax_led_args {
+	u32 led_mask;
+	struct color_platform colors;
+	u8 state;
+} __packed;
+
+struct alienfx_priv {
+	struct platform_device *pdev;
+	struct led_classdev global_led;
+	struct color_platform colors[4];
+	u8 global_brightness;
+	u8 lighting_control_state;
+};
+
+struct alienfx_ops {
+	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
+		       u8 location);
+	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
+			      u8 brightness);
+};
+
+struct alienfx_platdata {
+	struct wmi_device *wdev;
+	struct alienfx_ops ops;
+};
+
+acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+				  void *in_args, size_t in_size, u32 *out_data);
+
+int alienware_alienfx_setup(struct alienfx_platdata *pdata);
+void alienware_alienfx_exit(struct wmi_device *wdev);
+
+int __init alienware_legacy_wmi_init(void);
+void __exit alienware_legacy_wmi_exit(void);
+
+int __init alienware_wmax_wmi_init(void);
+void __exit alienware_wmax_wmi_exit(void);
+
+#endif
-- 
2.47.1

