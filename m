Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0A1E009C;
	Sun, 19 Jan 2025 22:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324381; cv=none; b=Sx5ea1OShLp6RPqRXldjZnaszs2hWsA1MlLuR5SzukmYmvpiYpsGwJjMd5Nlm+DtjGtaJfs3E6kVXt+1CrxnsdNS2bYxX3Y71IhtqFRR73qOPVITia5bY1PMNnDHTGGAeKHimEQfbJLWZ04NKd6DjsHW4c/QoTFlS52T5KyXqac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324381; c=relaxed/simple;
	bh=M0iJhPMOT5SYnjt7HCSYgSI3eJfzZrDBKsjTW5Rm9bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tG0CNq4qbnnahk9w1pBf+n9YKMuerEj/pQN6rU4ne1zYwn21NtrIPs8Z1IwMeAXx/JpgHY9jvDorz3Gmnq7uFXP+G0EgUpLZff10VKLaxH2Fo7olPJuy6pHnFxoPv5V4zAchvr+HSkUNI0U7swSXZqnftOtmUZyjUOGmAULsZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3WxCFex; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3WxCFex"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6e9db19c8so359129685a.3;
        Sun, 19 Jan 2025 14:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324378; x=1737929178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDCBc//p7CnObRY4MayGE5FBduWZCOcw1cvtwYkmsXY=;
        b=b3WxCFexd58McRrOPirfRGapgzrwYIt/dIS7SAG+8iBypXggP7D5VTZU2QaFyQOTP3
         4JEvTj3IYhO8u3PoMDrpfk7okFb7wx5RAhgb4MRDdfse5ccx8Z0yd2rO1mq0gfZll5FF
         ZxzEX5pSSmjbt9N5iaFQsxm9y5WSj6ov+Zp+5tnpY8J0B97vK/4dzaUSPQgFsN2EvXeL
         +6ppY8M39hjJSqScu1dx/0meeX6tAYQtcqYy1Ys/BBpye0ftJV2/duPZ59ybss4LaLUH
         ZiTvONIps1N9XgmSK35cC5GBgx3+LbdpQ/aCbnZhIPz6S3y6KFJBBC9bC6qY2pkfBUQP
         Mrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324378; x=1737929178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDCBc//p7CnObRY4MayGE5FBduWZCOcw1cvtwYkmsXY=;
        b=u0i2WLgjUFbMcBWJNPhseR7Z0GBFtuE7244pOAj/cMzx6JgZHEc1jXj2T6PiaQH2/3
         QtJw4GhsSF1W5Bx8KBEJUW4uGR32OSzlMhgUPKCPJqRNqiv6XiS1yegQZdzFKXXHsvgF
         UiZINgVCbXcPO3urwXmt1BzXJHgBWuFm/j/4Lau41pV+E9BGWww37+Hnz9ZSbL5q5Yq/
         5gL4ZTfit8ns/5o8UDk9R66YKc8iVU8YhIqDvStadm6dLF3gJU/BWUuwL+swsJ+GeUry
         S0v/JqLcDwFiIGahsqKmk6FO7y/Potzyr7k3/gi1fxSKbu93EXZfMOwtRJmphXNCmF+e
         KJTg==
X-Forwarded-Encrypted: i=1; AJvYcCV60yY1nGCG3+2sdKDhZnrSP9Hp7JFm/SgE2zC9sTowGeRqG1DvKloNGy1h9L0KH4L/cPbMifvYhcT0tY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJynsR1a/VpY0rH2q236iIee92V0D+0gl7zi+FW7xj6qEzKGuI
	4PNpXCz/b9DXsteZAaBZaZAr5JphXp53sWqkwAL0nLTfWLSX+kKH0dkd7w==
X-Gm-Gg: ASbGnculJ+Nt1nt5IX3DoUEVd4p4iTChMHDrgyTbDtd7rEssKgr0aV89YMNWa5TFOyQ
	y7UVfmDRlZXu5qgYeVK+w7T5Ym7UiSx/LRDGTnuxosi7CqfaLQZDi5ktbyGrT7hhNp+lJ99Apy5
	YLbM4MQCSIO0gzI2xUwbQEcwBniiMcDaXikQYOvCWwavgZJQvkKo18fbi/C84KnOXYZkptkrS3E
	C8OLlejctei5mZAMftDHw4nND/c0Uf+efPumymY0F6F4LMzixUO/3Eez/s1Ly7ulHmmvJRLtubA
	7A==
X-Google-Smtp-Source: AGHT+IH88BeK25rxvt0LFTkZvCXueb1AJbudzoH2ayjAGQIW2YFdhKrgJ8XE7CXYs2kx/+i4jFYx2w==
X-Received: by 2002:a05:620a:2496:b0:7bc:dc89:3703 with SMTP id af79cd13be357-7be6323b5b3mr1795418285a.14.1737324378492;
        Sun, 19 Jan 2025 14:06:18 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:18 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 10/14] platform/x86: Add alienware-wmi.h
Date: Sun, 19 Jan 2025 17:05:38 -0500
Message-ID: <20250119220542.3136-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
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
 .../platform/x86/dell/alienware-wmi-base.c    | 69 +++-------------
 drivers/platform/x86/dell/alienware-wmi.h     | 80 +++++++++++++++++++
 2 files changed, 90 insertions(+), 59 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 6b19b35dc5b9..f6001c53d631 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -17,10 +17,7 @@
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
@@ -55,18 +52,6 @@ enum INTERFACE_FLAGS {
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
@@ -114,15 +99,7 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
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
@@ -246,12 +223,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
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
@@ -286,26 +257,6 @@ struct awcc_priv {
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
@@ -405,8 +356,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 static struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1130,7 +1081,7 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct platform_device *pdev;
 
@@ -1143,7 +1094,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 	return PTR_ERR_OR_ZERO(pdev);
 }
 
-static void alienware_alienfx_exit(struct wmi_device *wdev)
+void alienware_alienfx_exit(struct wmi_device *wdev)
 {
 	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
 
@@ -1223,12 +1174,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
 	.no_singleton = true,
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
@@ -1319,7 +1270,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.no_singleton = true,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1340,7 +1291,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
new file mode 100644
index 000000000000..00b7505e1073
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -0,0 +1,80 @@
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
2.48.1

