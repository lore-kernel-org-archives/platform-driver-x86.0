Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F286157A67;
	Sun,  5 Jan 2025 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091107; cv=none; b=Z8xPcthxcDk88VsjtA8W+JBfFQ5YR6RXZzwfrTdfGgA5jagpPY3GoptR1nu39O8xjUdgw4uXwQKsaErxMvXg9RCkSP5wCZqEdttcebO6BI3m7NLAQ1Fc9o/ztJCE6zLRZTnSvH2QxJREDEwd7onnbneJl4QogrVariV+VOSUZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091107; c=relaxed/simple;
	bh=URAXz2YLX0FC0hhGt9g0ulSYUFXSov2cJdXLWAiZLoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6G1Ns29B2RHBtQkm7TtOtexovghcTuVJ+DdaAnSfvkFL9VJAQUj0tB6OChBudyINiTvV8RFleJaUQlYo4bffNToz7vlM3xRaxnBlANa02mAK8Lg+vnS0EcgNuvRjg13TYh1pRdbh/fP6uLcMgqA8OqBNVhYy3L4rfZssFRVZpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maRjAxMb; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maRjAxMb"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5174f9c0e63so4286091e0c.1;
        Sun, 05 Jan 2025 07:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091101; x=1736695901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAr4bH7tFXBmndl5zVqSa4Vf7TM9vEDhhvRekL30iQo=;
        b=maRjAxMbAEj/hvS2xU17b+VgbDw5PvbZVKdIKkMwIaBjV40YpyVmErYOGLFO7qwyDI
         NEydsv9fk9mIY+UXK4SS3VXIiXr6EK6MkfiLt4tYWuXs+pUIlE0LqLKeyB6NREfeX6Ts
         NTdurwcdwvwDRi1YwgQ46YA54DAf2OfA02FiwzkqKq2ozX7u8d7IE5qAVbduOReU0RgY
         98pkkxFPM7rY+XeJTKoDrEaRmE8R4e8HKUIezNjnxm375QknJ1E1ZNZ1m+BdvjUye5qa
         v8QWTyZlpqAi/QVU3VNXzrOHCnDBVtqWQ6siI+TYHYpz05nx6pNLAZmoM99kbbnUQSdW
         Mhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091101; x=1736695901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAr4bH7tFXBmndl5zVqSa4Vf7TM9vEDhhvRekL30iQo=;
        b=fa2oWBTlKt9Zbe5JKXiBHTnMey3zMP+n1GvU8JURFunf5xWiwEmCjbV9V3C91QQ0rN
         9NeIF7s3O0wmXGXY1ss/tmDHKcbtqNg9T/MAsY0GrSNokMJpmQC0zFIPm91VrGMElUQL
         jkOOMZntiRdygdjq598r1xvK/6ADryxfuTH3yNi35KP1BBiUhTRiBc6VEbLT+frZQnc8
         86lQXVl+F4/iIspK5D2ErXitFcpX+oH/uEyE1CSw9UJw/St/wqokW6vERQTPN7nUBnjD
         PVZijGu7aVpRGVbc7qnSE9Ju/X4yXFoIL1a2/cZQ6SY9Q4vdbql7iWEpqVru6sJL6Lko
         9YDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVekUObtiwxAunZSzDyPSdd6wWOrF4hlkTWPBxh1cIrYuhin+8c0aoZX7iXK8IF0xGEkaGZ1q4f/JmNKrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ISS5IuAKiMB0wXj53pC0Gu775OiRBHYC3lF+SpehuTwFSZfN
	KmqME/yPHowwr9ocHJENN2N22o9QTtKYMGUW7E9zWCMmaU9hU8R71VZuBg==
X-Gm-Gg: ASbGncug9GNSRHDza7xffxWmmiRQDd6B4ph0ENgmF0eZQ3rKNc2rSN9rnlm5DlLmv0C
	eifZ2KyUF5OgHj9Uc/wyx7Utm89XbHgCgaIGA0ZkGg+7ShFlsIzxCT7Tj3OHuCwefzjbmTeykq9
	99jQhKb//ZydmSLoRxU4kjSal6lMTxxKx8B4NPAZR2I7iok7JqXsVNVXNPLt38L0ijDHHZObv8Z
	yFAE27z2T5uMpWOtIQOeR/xzYzPu+TxnKHL+mu0QqQnaCFvITLlBvvFlw1dQp65
X-Google-Smtp-Source: AGHT+IEJjeTTOvXdGlGTBsHmyzBS6dO4BCp6iq/6oEsMTDucD/L8yf1xPHXoMROp59ZMkTSb8jMx/A==
X-Received: by 2002:a05:6122:659b:b0:516:2d4e:4493 with SMTP id 71dfb90a1353d-51b75c3d499mr39491539e0c.1.1736091100908;
        Sun, 05 Jan 2025 07:31:40 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:40 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 16/20] platform/x86: Add alienware-wmi.h
Date: Sun,  5 Jan 2025 10:30:16 -0500
Message-ID: <20250105153019.19206-18-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a header file for alienware-wmi with shared resources to support the
upcoming file split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-base.c    | 71 +++-------------
 drivers/platform/x86/dell/alienware-wmi.h     | 82 +++++++++++++++++++
 2 files changed, 92 insertions(+), 61 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index e2fcb95b506c..9fa5ac48436e 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -16,10 +14,7 @@
 #include <linux/dmi.h>
 #include <linux/leds.h>
 #include <linux/wmi.h>
-
-#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
-#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
-#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
+#include "alienware-wmi.h"
 
 #define WMAX_METHOD_HDMI_SOURCE		0x1
 #define WMAX_METHOD_HDMI_STATUS		0x2
@@ -54,18 +49,6 @@ enum INTERFACE_FLAGS {
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
@@ -113,15 +96,7 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
 	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-struct alienfx_quirks {
-	u8 num_zones;
-	bool hdmi_mux;
-	bool amplifier;
-	bool deepslp;
-};
-
-static struct alienfx_quirks *alienfx;
-
+struct alienfx_quirks *alienfx;
 
 static struct alienfx_quirks quirk_inspiron5675 = {
 	.num_zones = 2,
@@ -245,12 +220,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{}
 };
 
-struct color_platform {
-	u8 blue;
-	u8 green;
-	u8 red;
-} __packed;
-
 struct wmax_brightness_args {
 	u32 led_mask;
 	u32 percentage;
@@ -285,26 +254,6 @@ struct awcc_priv {
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
 
 struct awcc_quirks {
@@ -404,8 +353,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1126,7 +1075,7 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct platform_device *pdev;
 	int ret;
@@ -1149,7 +1098,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 	return 0;
 }
 
-static void alienware_alienfx_exit(struct wmi_device *wdev)
+void alienware_alienfx_exit(struct wmi_device *wdev)
 {
 	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
 
@@ -1229,12 +1178,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
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
@@ -1324,7 +1273,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.remove = wmax_wmi_remove,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1345,7 +1294,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
new file mode 100644
index 000000000000..427203821967
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Alienware WMI special features driver
+ *
+ * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
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
+extern struct alienfx_quirks *alienfx;
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
+struct alienfx_quirks {
+	u8 num_zones;
+	bool hdmi_mux;
+	bool amplifier;
+	bool deepslp;
+};
+
+struct color_platform {
+	u8 blue;
+	u8 green;
+	u8 red;
+} __packed;
+
+struct alienfx_priv {
+	struct platform_device *pdev;
+	struct alienfx_quirks *quirks;
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
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data);
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

