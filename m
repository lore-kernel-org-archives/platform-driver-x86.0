Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D5A1F940A;
	Fri, 17 Jan 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101697; cv=none; b=OaZtrPGjqmmCtBBJJtrTpNi7ogaJmk1i/gGbzlCRNSk/ZkwaJOGrZ+iJHbUJdBypup6MTEjk3PNs4Ou6vKAIKT8ole9juSPjlswfzvKmDGoTFg+/aBqz1vnhvyyHkjePEFsKr3nsWLFNa6zgRVyK8MAqrbLnbw7JCnBhhAkZ6gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101697; c=relaxed/simple;
	bh=vPIc/yXutd/OnmfRT9aQqzFiAKP0Ln98V42abKCHO74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRscEKqzKzAkkPmxgniY79sdWHPhyH20f8/nZyKvvFq/HGcMwrSKwlkEBwzGcabf0uzsh/mpgDNAClFVTUF3yEPz6vHGyDo0BqnokCzl11dpoiJoZBkfsmJ/tIGeDp71q/4s0vkUFIkRP/KqV9Tq50XAJUv1GZBNF2rYOZ9gRGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpqxHlXt; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpqxHlXt"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4b11a110e4eso436646137.1;
        Fri, 17 Jan 2025 00:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101693; x=1737706493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXar7byBtNG/hoQ+J3Jp189G1DpBGPxaMzDqmzYfoyE=;
        b=QpqxHlXtRGwqm87OONZ9zsFgEFeoybeFSjO72KFtub47YPdU+0aoqPMIjcMHktnlSt
         zdFQJSbKGHW6TmCOddLKkWw6ZLy/z6AQCiHz448q4AIUeOp30QPCD0saMRqRNv2+bXOf
         FamtNZ+pVyDlIw9T++cwstExn5zkXpNxgLwSFUftH9DsGVqoUwo+8smTifK5x6SbZt7L
         g7JMqkIFT1S006eM19PUdAJASLS3iMoVHtCqjHrA3KS1HxFgpviI05JsUXHAY3aP1iT7
         iJfutIYJPXsH9uTBdt4RyT1fro+WVzCvrcEi32k51camhNNL+M+eHWxO1fFWLPzKMmgO
         5VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101693; x=1737706493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXar7byBtNG/hoQ+J3Jp189G1DpBGPxaMzDqmzYfoyE=;
        b=wldV8oC0Sx67qFhlbsIqrAq4SBNt6eOJO74Q7xsj/31pT4BTakLI2lpWdcPK0G6jNN
         RumHp7bKPUQgSn2CX0W3e5NHzIorDFiu1/To3rzIgtBMjf4mW3A09jkFUH1ZzxA/XsRo
         p9sJLbKoYMsn6ZiswMOX2YN6yTj+iosIcDutk1KpnUymh04xbWthJhjMMpJ+fFyFLIN0
         BNzIqmC/U3btFoGub9WnfCrMOAA9eekMPT1Y/N1geya3pLrnppebOFt5iGByXXLu2C0s
         5XZ7Cmlmg0P0G6e+ODpPiIidTAw1FU4K5xpUd5w/cAAoQi86KNhz9uml8bmmkqHnqdjK
         JdDA==
X-Forwarded-Encrypted: i=1; AJvYcCWHTuDnuV1GMkslT+GpEiV1lcyWyF9pjtVeGMIEGPtuKpzzc7ho6CfxTPJ/shA4+/URDDOn/UMW7OM/3MI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPpfwA1IJx/1zjfbl6i6fgSBO3UzBUr8vaVxVs18vrPeJiTHDB
	5581DLpwFtPM2iWnIKZ2VZjp24EVijorBWcg8kL9mwvwl9tpZiYcUflI2g==
X-Gm-Gg: ASbGncvYssgCRSzsBuq9QJwRF+ZqPEA7eOfbH6gEHtl4p68ORLFm1kwA0ox2766z4O9
	ikEMaZkaZRdDLgkZY9W4nj4pIGGWtIKjLW1f8HVigp6Ih1yZQdynxD73XJinep+tjo2yf4B6G9W
	jkeU62MJd/QAS7r7UXRDz0wbwmksI15iZUvIu9UnsDc9lfuc9j4Cm8jVf4Zrhhf+Rg7KGGBdIrs
	v1SY5V8utTrRdXPKH/YEMVcxX+nV4Snk2t1z4F9mOsl7+/3Gur6Soe8qCWuxXtD
X-Google-Smtp-Source: AGHT+IF2M0alutzsKtd3YRZa7Un6s4NNjG8UGaVPT6+ul1WRHbtHVyyWdjz0CsqxCV/LjqOlcFpNSg==
X-Received: by 2002:a05:6102:80a2:b0:4b2:ae3a:35d6 with SMTP id ada2fe7eead31-4b690c889b8mr967950137.19.1737101693544;
        Fri, 17 Jan 2025 00:14:53 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:52 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 10/14] platform/x86: Add alienware-wmi.h
Date: Fri, 17 Jan 2025 03:13:43 -0500
Message-ID: <20250117081347.8573-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
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
index 5d9816521072..702bf21988f2 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -16,10 +16,7 @@
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
@@ -54,18 +51,6 @@ enum INTERFACE_FLAGS {
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
@@ -113,15 +98,7 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
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
@@ -245,12 +222,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
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
@@ -285,26 +256,6 @@ struct awcc_priv {
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
@@ -404,8 +355,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1128,7 +1079,7 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct platform_device *pdev;
 	int ret;
@@ -1151,7 +1102,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 	return 0;
 }
 
-static void alienware_alienfx_exit(struct wmi_device *wdev)
+void alienware_alienfx_exit(struct wmi_device *wdev)
 {
 	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
 
@@ -1231,12 +1182,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
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
@@ -1326,7 +1277,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.remove = wmax_wmi_remove,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1347,7 +1298,7 @@ static int __init alienware_wmax_wmi_init(void)
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

