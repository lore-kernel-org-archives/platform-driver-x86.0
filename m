Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607741B6541;
	Sun,  5 Jan 2025 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091087; cv=none; b=rs3LiR2bSxXOA9xcs0kVcdLB0JEuORc3dV8FCSqV+rNdjeVID2U94plbQhLrkSRToBSkgCWGV0VWOFDrmxd9kRIDiJ6n0v3cRrQkEK+vdU6/bG8ALf+sGCqbzldf6shj4tPc7Bl9DZVWZaCkmxitTGdsKwhZLuT+efYKt3C7eUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091087; c=relaxed/simple;
	bh=1Cs7NPQXrkmM/U3g10SmIFl0B3gjEAoITIphppnlZsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pwa8UvsSAjMGARKd6EnVZ5UIH3AAIuwRjYiWsIJ5vBYm5TJn4kr+yWL2JuWzxKea0ZJDP6+vnrG0gMEqpwKAHnfdt2+faiqJp8H2rQTsXZSLasza7kbZ2Fiu2Wd1Drr/LhnXwfxzO4/qacGWCd9edmsp+QchAKyikReHYEpSZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3T87Pia; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3T87Pia"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c61388e68so1979214241.3;
        Sun, 05 Jan 2025 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091081; x=1736695881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBEYpXNJcEwMGEbg608CUThjpKF7ebxkYAuwsXZ7cxE=;
        b=B3T87PiaLIB3SCLUsNx9aAoQXuWnVUV4muudzwoSJUpldSK9ZK5oFC57WRTAc8RrRE
         7lD9msQUhpiRZQxJ2qdCZa8zaqE67oq9k85Xitnh/oMXAmv43jxy8pwJWJlGpc6wvo/B
         TM6pNZ5fyjDUwpDRVt4Hb2Aw6mX6QxDR8Sqb0QH6bIPNhpP4NmUeVgtn8eahSYh7RVC+
         i7ZBF2/h8x4ZVmIwXfCGJxH5JCEjgDNpiX4act/I5maCBv8X/MVwV6ZlfeDxzizYuL2d
         4G2AbrTz4lkooclBO6UkkORnpifC9OQTSm33WdCOwYrQkLdiTrfqjmR1qvwUWh/Awvnj
         NqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091081; x=1736695881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBEYpXNJcEwMGEbg608CUThjpKF7ebxkYAuwsXZ7cxE=;
        b=oBjJruWd1EsX+YQ4DJf/oFbpF9hnPTgwpFN/uF3juWjMw1tQnfG56flkczqa8uDYDb
         W1jGj20sjbx/lMawChSm4zSLAjJyuOfoNE2PuCGfvBeFeiv0bmjRt9z7O24ASj9ms+c2
         q1WolPOGXRvGcuwgCso5ym0CrMC9dRHGgAN2GuVg3Ir7ZNIKfthJGW1N+docwALEcDZJ
         Io05ax/TzOttkcL0a7RYRWLWqrkDS7PwVunqyDNvdjYFXZMUCd46lUI7Ako5SmpwZ4g5
         ify8DjqOI1lHVKSEI+67CCAS9OQRTbJl91b82By9AZsVHja0BXzfKGxlt2DcbVJN9sap
         XwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpqweo4M8FYcYTM57q9gSr0kpu0szWlhRhaUIuSEN3DTvlqCxgsLjq9qkL3wq9qaJJMoYok9ObEKPezPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Md8LCeQ1Y77lyYrDZ3Uh+5ATMEdqLoz0qLUfT8qkyS5T0O5P
	vf3v/ZZnGpoiZ5dOMjAS+U1s8Cu+RBXd0DMx3L/QKkXV9bnu5vR6nCcPkQ==
X-Gm-Gg: ASbGncvgnjfdn1BbkWnNsQcT9bFdZ1Ruwu89eZnd2EVXQ/f2hDlISs2JCMpxqOijhEk
	WuiOMjMyg/lRXgBUbq4XhLyRpilMtT7IaI8+vi1LOKuFOR1WQV1uneZ7daqAYvsULeVqYLxMVG+
	ACAaaUBAY3xfy1ijitylBOYdNzusRo5T/zFOF+VOP8zTAMhaqO0a/9P7lmDPp4qa48Ny/EZxDNl
	um9rIxLgqDhYbpHZ7sIPpC+Qfv+haglWT9vGgMi+RT6Sii5eqt57QLW6xrU/ZtO
X-Google-Smtp-Source: AGHT+IFYWq8aNAUNm5YK8qdR86+N3EmNexioWdrvHfik/IFDXX9xPl9+Js260DDVfKhtxChbzrqCxA==
X-Received: by 2002:a05:6102:c8f:b0:4af:e5fd:77fc with SMTP id ada2fe7eead31-4b2cc31f963mr46101484137.3.1736091081125;
        Sun, 05 Jan 2025 07:31:21 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:20 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 08/20] platform/x86: alienware-wmi: Add WMI Drivers
Date: Sun,  5 Jan 2025 10:30:08 -0500
Message-ID: <20250105153019.19206-10-kuurtb@gmail.com>
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

Add WMI drivers for LEGACY and WMAX devices.

This involves moving platform driver and device registration to a helper
function, which is now called from the driver's preferred WMI device
driver probe. However this is only done if !quirks->thermal because
newer WMAX interface doesn't support any of the features exposed by this
device.

Only one driver is registered on module initialization to prevent
registering duplicate platform driver and device.

Additionally, create_thermal_profile() now takes wmi_device * instead of
platform_device *.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 200 +++++++++++++++++-----
 1 file changed, 160 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ca7b9f649541..d7b322be6c19 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -15,6 +15,7 @@
 #include <linux/platform_profile.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
+#include <linux/wmi.h>
 
 #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
 #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
@@ -39,8 +40,6 @@
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
-MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
 
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
@@ -412,7 +411,10 @@ struct alienfx_priv {
 	u8 lighting_control_state;
 };
 
-static struct platform_device *platform_device;
+struct alienfx_platdata {
+	struct wmi_device *wdev;
+};
+
 static struct platform_profile_handler pp_handler;
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
@@ -1068,7 +1070,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 	return wmax_thermal_control(supported_thermal_profiles[profile]);
 }
 
-static int create_thermal_profile(struct platform_device *platform_device)
+static int create_thermal_profile(struct wmi_device *wdev)
 {
 	enum platform_profile_option profile;
 	enum wmax_thermal_mode mode;
@@ -1117,7 +1119,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
 	pp_handler.profile_get = thermal_profile_get;
 	pp_handler.profile_set = thermal_profile_set;
 	pp_handler.name = "alienware-wmi";
-	pp_handler.dev = &platform_device->dev;
+	pp_handler.dev = &wdev->dev;
 
 	return devm_platform_profile_register(&pp_handler);
 }
@@ -1153,6 +1155,10 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
+	NULL
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
@@ -1167,19 +1173,150 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int __init alienware_wmi_init(void)
+static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
+	struct platform_device *pdev;
 	int ret;
 
-	if (wmi_has_guid(LEGACY_CONTROL_GUID))
-		interface = LEGACY;
-	else if (wmi_has_guid(WMAX_CONTROL_GUID))
-		interface = WMAX;
-	else {
-		pr_warn("alienware-wmi: No known WMI GUID found\n");
-		return -ENODEV;
+	ret = platform_driver_register(&platform_driver);
+	if (ret < 0)
+		return ret;
+
+	pdev = platform_device_register_data(NULL, "alienware-wmi",
+					     PLATFORM_DEVID_NONE, pdata,
+					     sizeof(*pdata));
+
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&platform_driver);
+		return PTR_ERR(pdev);
 	}
 
+	dev_set_drvdata(&pdata->wdev->dev, pdev);
+
+	return 0;
+}
+
+static void alienware_alienfx_exit(struct wmi_device *wdev)
+{
+	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
+
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&platform_driver);
+}
+
+/*
+ * Legacy WMI driver
+ */
+static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+	};
+
+	return alienware_alienfx_setup(&pdata);
+}
+
+static void legacy_wmi_remove(struct wmi_device *wdev)
+{
+	alienware_alienfx_exit(wdev);
+}
+
+static struct wmi_device_id alienware_legacy_device_id_table[] = {
+	{ LEGACY_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
+
+static struct wmi_driver alienware_legacy_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-alienfx",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_legacy_device_id_table,
+	.probe = legacy_wmi_probe,
+	.remove = legacy_wmi_remove,
+};
+
+static int __init alienware_legacy_wmi_init(void)
+{
+	return wmi_driver_register(&alienware_legacy_wmi_driver);
+}
+
+static void __exit alienware_legacy_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_legacy_wmi_driver);
+}
+
+/*
+ * WMAX WMI driver
+ */
+static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+	};
+	struct platform_device *pdev;
+	int ret;
+
+	if (quirks->thermal) {
+		return create_thermal_profile(wdev);
+	} else {
+		ret = alienware_alienfx_setup(&pdata);
+		if (ret < 0)
+			return ret;
+
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
+		if (ret < 0)
+			alienware_alienfx_exit(wdev);
+
+		return ret;
+	}
+}
+
+static void wmax_wmi_remove(struct wmi_device *wdev)
+{
+	struct platform_device *pdev;
+
+	if (!quirks->thermal) {
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
+		alienware_alienfx_exit(wdev);
+	}
+}
+
+static struct wmi_device_id alienware_wmax_device_id_table[] = {
+	{ WMAX_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
+
+static struct wmi_driver alienware_wmax_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-wmax",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_wmax_device_id_table,
+	.probe = wmax_wmi_probe,
+	.remove = wmax_wmi_remove,
+};
+
+static int __init alienware_wmax_wmi_init(void)
+{
+	return wmi_driver_register(&alienware_wmax_wmi_driver);
+}
+
+static void __exit alienware_wmax_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_wmax_wmi_driver);
+}
+
+static int __init alienware_wmi_init(void)
+{
+	int ret;
+
 	dmi_check_system(alienware_quirks);
 	if (quirks == NULL)
 		quirks = &quirk_unknown;
@@ -1194,33 +1331,14 @@ static int __init alienware_wmi_init(void)
 			pr_warn("force_gmode requires platform profile support\n");
 	}
 
-	ret = platform_driver_register(&platform_driver);
-	if (ret)
-		goto fail_platform_driver;
-	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
-	if (!platform_device) {
-		ret = -ENOMEM;
-		goto fail_platform_device1;
-	}
-	ret = platform_device_add(platform_device);
-	if (ret)
-		goto fail_platform_device2;
-
-	if (quirks->thermal) {
-		ret = create_thermal_profile(platform_device);
-		if (ret)
-			goto fail_prep_thermal_profile;
+	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
+		interface = WMAX;
+		ret = alienware_wmax_wmi_init();
+	} else {
+		interface = LEGACY;
+		ret = alienware_legacy_wmi_init();
 	}
 
-	return 0;
-
-fail_prep_thermal_profile:
-	platform_device_del(platform_device);
-fail_platform_device2:
-	platform_device_put(platform_device);
-fail_platform_device1:
-	platform_driver_unregister(&platform_driver);
-fail_platform_driver:
 	return ret;
 }
 
@@ -1228,8 +1346,10 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	platform_device_unregister(platform_device);
-	platform_driver_unregister(&platform_driver);
+	if (interface == WMAX)
+		alienware_wmax_wmi_exit();
+	else
+		alienware_legacy_wmi_exit();
 }
 
 module_exit(alienware_wmi_exit);
-- 
2.47.1

