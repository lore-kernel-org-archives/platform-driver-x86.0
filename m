Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AC1FDA78;
	Mon, 27 Jan 2025 04:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950683; cv=none; b=uBuBtWtDIniJgQJm5Ji9V9mpI3uoEAa/t+RyXq73MoBJyJ5UlN7VoUKklizqJ3d02+Jbv1R0SNrp4Wp+RzwO8/c+B5mJVDxmAExU2/vBI90MvGTE4mO3d4e0/lhZSqdG0oTZ084FaNlWqOtAKvD6gFrvfQ9urHvEEQORc/pgVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950683; c=relaxed/simple;
	bh=kL+AeccpGKBOpTj5NyyjP82JZ92HXzkXFpv00JIDCPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNhmIkksvEwLyMN5OLG0/aDztMgG3jqz5IPfgboxWu/GBiu3TVEUV/2VBdUkygd+Urea1w2NGB69rdOfQQsDgKtuBaNeaHE/pplgfW6XM/UzWdXwa35i2Ls4zhhmBA296DGzfHg43hmDiQoZ+BJDqcTKwPI50pnAj9UCz+Zi/88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRjQA0At; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRjQA0At"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso1083231137.2;
        Sun, 26 Jan 2025 20:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950680; x=1738555480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3VEsgFPjom4fznaJdTcJJcnqvZ2yVYhOQnuPC+vg2c=;
        b=dRjQA0AtEiIN2HR8QeCmbRZQ8ShogKAXgnCWt9vSMwoMYriM6PtRP7FU/BL2N8FNlB
         hHuZ8Zs/Rf2Du6rbC+Doh+DefoGNiua8Pu86J73l75XpnGuD77sLYYobPBWEkYghwkbi
         rDEBeZypsmnkZSPcEAwQNGwX4gI4Kj//UmddZ2QXDBCaKSCUf3ltaZjVaeE8zAT5AU0u
         oIm+140591wfW1GOjR5+OpxewQr3f+GI8wEOIGeNx+w+p8zpIONB3yTYtAeooV/d94V1
         1y4jwyHq5/2LHHwR01+CwniPFr0Hd+nMpT9jXajXpXdF6m9rK2UegjRtu5LCdcTvVudD
         Ofvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950680; x=1738555480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3VEsgFPjom4fznaJdTcJJcnqvZ2yVYhOQnuPC+vg2c=;
        b=baZrNyZSn/an3JaNV+X53vjb5CYoaDTrsCz1Mjvp0PqZ/23q2FJ6zAQw/vp6fqmBsB
         HPcYLPGbwARk6zpo3k5N2LP933/qog1MVn5nTt/wRoxFLJPee5MqBtVmGxco6Ufjqyka
         BzCaUyIFVwZTFIfbUIbsUPhQFv5g2MDSKBOQmsDk9WfjnHBgy3l0ZWS8k5xfPxtU9DR3
         pqovTXt+QcO4CWUedozcQEr7oBeHP2l44X5QUXSkWB0A4il1dM5P/DML6VqLysJV6N7h
         Z7zmgDfHz4obPWemMRj1sCmVPw0lp/8wi8djMLpZd4o3F7DQ6H+rdBTEqQEr+MptEqeO
         DFWg==
X-Forwarded-Encrypted: i=1; AJvYcCVA0GJuuDeV0cdL1IwsMX29QXpX0/Zkw4dxKOMjlefI/9023i+vd4txagDpgfzBpoxEKy7EkyGkW0wllZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQAeP78uF5NYX7Bvcaqcq+SeSv4aN7I3kMXb5DJ9W3KabO8/Y
	ZONUu2PhlhlscfN5eDG8vpncEDFSi5xi7bPHxOAq9HaioeTahydmYswbsQ==
X-Gm-Gg: ASbGnct6OYtODAVC5jvMpM/Wf33yGnLCPRKv0OOF/fOf09zwdvww9jzN3a8Uq+TO9sS
	OwNcWrBWHHxo1m3kfZmXmbba4TwIZWOd/XhP/c4H3CiXF90QsSY+GvPGWLOKIvRGdomoVuf2PTX
	pxNGW7Nx9reualydb01dueYkxnKvzS6p5ddv9vozxGd84DPX0pnHw69C21/YoZW1mVij0FiTwAc
	nk2p0EbI/toz2FEqQigPCIi22B0QqkuMlred7Xj4QKLvq0kDpl57Vx+vhG7/wPCL4z+EMoD1SI9
	WIGQv1BPZBbe
X-Google-Smtp-Source: AGHT+IEtUo7X7CjyP59xcwzTTDd1hSm9PXb0LD0AhrgbgAs57edxwxguXQTzX6uTUXIamInTBxa/+A==
X-Received: by 2002:a05:6102:390e:b0:4b2:5c0a:98c1 with SMTP id ada2fe7eead31-4b690cb5750mr32750023137.22.1737950680048;
        Sun, 26 Jan 2025 20:04:40 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:39 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 10/14] platform/x86: Add alienware-wmi.h
Date: Sun, 26 Jan 2025 23:04:02 -0500
Message-ID: <20250127040406.17112-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
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
index 5763f118cc3f..1302b85d3e7b 100644
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
@@ -413,8 +364,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 static struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1138,7 +1089,7 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct platform_device *pdev;
 
@@ -1151,7 +1102,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 	return PTR_ERR_OR_ZERO(pdev);
 }
 
-static void alienware_alienfx_exit(struct wmi_device *wdev)
+void alienware_alienfx_exit(struct wmi_device *wdev)
 {
 	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
 
@@ -1231,12 +1182,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
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
@@ -1327,7 +1278,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.no_singleton = true,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1348,7 +1299,7 @@ static int __init alienware_wmax_wmi_init(void)
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

