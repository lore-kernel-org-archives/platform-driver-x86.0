Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A750919C556;
	Sun, 29 Dec 2024 19:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501656; cv=none; b=nLstxJQBi6OdYtwTT7mkp0r0ydO1bZqm79pG/PP+u3y/jz/GmjQ4StK7tAmTxpymEEpP2qs8+tizGLZjRaL5dzOLQOQOp4d/ZsCbk5qLe/qImLEGO1Jx9oLXEAXbLdc3MVnYbRY1PCN3W/wgHzXOecxKEKVnWJ1aQ96G1XLc31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501656; c=relaxed/simple;
	bh=w0KS1bbq1IZPyD9oY1Zi0nfCDeMz/7f/rn7WiH0DL6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cf2DsRsXazHJL+IPfmqhMtV42eSt7lAf0G9o/O8IFNtXbs1YC4fzQ/0n090VSy91bv6PFBAzbs0/kvP8qpRba7RAobV2YIToE5lZqgjskh4twFLPZnTxlUevZuLkA/ADikHj3PJxWMqeLSlKR5HTbht6qLFsfbE43H3p+I07diM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2VGyuly; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2VGyuly"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afdf8520c2so2487024137.2;
        Sun, 29 Dec 2024 11:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501653; x=1736106453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VY2GiTDOVaSMYpHbfoKZ3MET/i1nAgd2toxnTSmI1JU=;
        b=C2VGyulycDMASvwMObyrAVq1ZQaLOK+QprVjZQgp+dQzYBJpEwouqudh1DE90Fru97
         KTqMLb9gaPu9WkmVi0rX7oTr31lUBG/Dxw/nDpxyi/NDME6fdbBbJZ2mcvFUdZqKp6Og
         uiuPLTJD92VMJvyDHDEGaPa6jTolmQWiXN31RSIQicJiHIBL7HbJPz63Mlc3aH5kOEW9
         nPl8fSBjtTcaK2CRKjTaD3UjR92iZsbPlR1O5hxr17KtQM0RfNCZP0Wa+pr+i1npXVB1
         hNs+lSO/AS3D3NGTtMcKtuOboblsIuDfWVqd646IIzQyQ/hpWrN4P03CGF30Pwdd64xQ
         dXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501653; x=1736106453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY2GiTDOVaSMYpHbfoKZ3MET/i1nAgd2toxnTSmI1JU=;
        b=GPgL8+8X1ldUDZ9N6e07Po8Kyb2dGEnT7nWPICetQkKsmDPVy9c9nOA4KC/IbPBZy1
         detQW8Tgdnicjm+kXBYNT0Q1SOpkYV+IQgUe2VdXb36cVsi2cB9vpCMv/axfrTTBoV86
         mybIFTjIwfECVegqQdEdC0WvZ36J3NmmYLcI+F1nQHv562UxCetT4om9c6k2Xb139swf
         7kP4uN0Ii6yrisZGkr0nldlkS3asmkGBaggzLgEFlnEbJ1xefDibNoUYuSln3clxJxBP
         uEENtjSLNWXgazn7Z6du6wh3xgX0GRROnhTWIz7jNb+bX8qKUVKCj+9XPo5bOGfBHVK7
         jSQA==
X-Forwarded-Encrypted: i=1; AJvYcCURVQ6/04SHBtl0PNcYJJ9CCoeF9mqQGImujejmXpOLO5NoPh5s9uO/uRMDG6qsJ+adLBsk1DamvbpNQ2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxjeyQU5VtC6wsVU5VWqYvy6m3dsqBDb4t9Y4OEXtorkH+P6V
	9egsoT/Gscqg8BpgEyDKPjvYVLmK/Pr75HNxNacPjIcQwZIa7sX00lL69A==
X-Gm-Gg: ASbGnctPd/dKhRUG8VW7bZTdk2QYaJ1mmn2JwSTpQ+tVoTnSEug91dZIUmQj2k9xlFV
	yKyZtC3x4SD0Gk7c6Shwnl4yfQt0qsKw4bwRL5E65eTydkoREUKA0ZOhw6j+y0J1c0ttW4c1GBW
	SXuBkYUT7CnE8MmSev6A1/7NNo0nd/Pvs2oSnN8Zx1T67iryplsUccBKQ9Brz5GTb7GKwBYvdB+
	m0EE6ViTihEQDeHkWvsPy46BxWVQ1Jblj5TAq7YgVtF+akrLxot2G05LRE1afSj
X-Google-Smtp-Source: AGHT+IFMduLPqTCSj2w0jvXLIUApn+FcW3Es8Dj3pJkyroQF4gkmj4+wJPNDpJzO92fBicS6jXZwzg==
X-Received: by 2002:a05:6102:f0f:b0:4b2:48af:bc84 with SMTP id ada2fe7eead31-4b2cc359f9amr27293282137.7.1735501653352;
        Sun, 29 Dec 2024 11:47:33 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:32 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 16/20] platform/x86: Add alienware-wmi.h
Date: Sun, 29 Dec 2024 14:45:03 -0500
Message-ID: <20241229194506.8268-18-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
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
 .../platform/x86/dell/alienware-wmi-base.c    | 68 +++-------------
 drivers/platform/x86/dell/alienware-wmi.h     | 78 +++++++++++++++++++
 2 files changed, 87 insertions(+), 59 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index b9daf22efdbe..a268193ad2a1 100644
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
@@ -113,16 +98,8 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
 	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-struct alienfx_quirks {
-	u8 num_zones;
-	bool hdmi_mux;
-	bool amplifier;
-	bool deepslp;
-};
-
 static struct alienfx_quirks *quirks;
 
-
 static struct alienfx_quirks quirk_inspiron5675 = {
 	.num_zones = 2,
 	.hdmi_mux = false,
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
@@ -285,27 +256,6 @@ struct awcc_priv {
 	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 };
 
-struct alienfx_priv {
-	struct platform_device *pdev;
-	struct alienfx_quirks *quirks;
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
@@ -405,8 +355,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1139,7 +1089,7 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct platform_device *pdev;
 	int ret;
@@ -1162,7 +1112,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 	return 0;
 }
 
-static void alienware_alienfx_exit(struct wmi_device *wdev)
+void alienware_alienfx_exit(struct wmi_device *wdev)
 {
 	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
 
@@ -1242,12 +1192,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
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
@@ -1330,7 +1280,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.remove = wmax_wmi_remove,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1347,7 +1297,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
new file mode 100644
index 000000000000..dccbf4f95da0
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -0,0 +1,78 @@
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

