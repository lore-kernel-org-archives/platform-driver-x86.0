Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37C71F869F;
	Fri, 17 Jan 2025 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101678; cv=none; b=ffzeb4Ofj6PHDrwD/NrdXpiJ9WvpJQCFeMe4NrwurufTCCWYTDpmDfIn0ms7ElkwEw7VKjmIb8ebEX84OnURBs8wQpOOv+Eb2bP2bE9c7qXCi2EM8jzGO2EDqzflcy3zsSYXR29r2Y8Bi12mKb50Rm58dXaGKGMychBn/rZ/nm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101678; c=relaxed/simple;
	bh=+KEtZiTOsYKSqAPzRCv8tqaCSBQMbnimce9GbfBVJi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIaHTNvxdXBK1nE/h5pLB5mO1PkVhWaJQOG1B0Us5uqaak2r/LPiEex29YlAmCBnvcUMcBgrE+gvlujBL9l8DmN/UGUvqimwMOd0EpzI1lVRJ+3ALJEcVasEkzGURgrYQD9Cu8TfZv8mkk9cx4ExRrdNBnCgeb1TA+Z585ABZ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTBsBfIv; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTBsBfIv"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1635813e0c.0;
        Fri, 17 Jan 2025 00:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101675; x=1737706475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MtLynpEMUIKap3+7Gl9xvdxAc71utju6jYernNpi3E=;
        b=CTBsBfIvi1bcervRn9Q5gA2VwDgBxFrax6FfxONFwx+7uwSgF6npM2eY3GgxP8oFIz
         k7X4Wbd55vxXdDu35UFqmkVT+v6aG7jRJ5ZkpP9H25/5l1a2QJOeJ7xON4LNQSGZKdV3
         GkC7lzagBvjtp41ePoSGXLAYYfsUK8KJr/MlAsnuC34DfmKNTLG62ORXy1gbTouNyUs7
         MgUsKo5kSO0ISuGk91DpUZttuWyYCbVL4Zld7m6T6NfL7RPpvChV9gLVFhbiZyjxaBfx
         DYFkcUOef0mAPZTML4lWH5JgK6Pc85uReSXrL5aiPpSmnouJOP2dClkYnTAZecth77Vd
         2CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101675; x=1737706475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MtLynpEMUIKap3+7Gl9xvdxAc71utju6jYernNpi3E=;
        b=Nj7EhyMrv4nbIuHAbuY/r78tvCvaglpEBBk0NBH2s7rKVeHL9BdOH/BuHECH6pdmfi
         U+R175F6YxW6N2DW4mKHdsBd+xA937aeQDJZMNE2zwn3cU8lNhoOUHCKl7cKUpkKgU64
         wqtF4FgUnOYgVWiCQC1xuQttcWTapLIZpdyP4XxrWnSIUH/JmphPw+/qruh9lYCgs6Xv
         gQRzW1uKsZgwraTq/V82UWY3eANvM1xwuzuUePRgwVZbtyKs0Cyd0BmByVVqLLlFubE3
         RFya7WItiS9yeOCkYuBGevB1gMMOb1+y9kh1mJNYNd+ko0BE/L84CM3UW6eItfLwK//r
         V1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL9re7VeYUo8zpjfRAG8S4Fe1C5s57J9tbYbvqZ3YMIvkdZKBov762MYXB4XYjstvVyTmCKiCe5JdtiWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/AdeAhJuUjDjNwQ/z//ekDI2MXkR90bPBT8QPNaQSx8XyhsF9
	HoVoe3ZaRpm9a0POLtN/XPwj7VKNytXFtTN1MZj90JF7G4oyBQHu/L7GZA==
X-Gm-Gg: ASbGnctY3q3xv1lGJmaZsIUjzF+wIC985XEt/SC0loVBQg9zpd3ymC2Wajq0UQcixyJ
	H/WMKeN0H4wT8hkmOY2O0qcUb3qoe2HU0tSndcThkTcDvCPheA8BoNHXU1jfYyAtXDrdhzsG/En
	SRvIUAtQ0yzn/OoqO/S3uog6LL02T9F8QekGtOiYhcInXuaS0BGwEJemgePg4UZ4MdJg7/76nlP
	h+2dX83RBuuLk9irwKjllw97mHtHzb0Ab1VNQwPaGj2MpNOUyGxERM3WhlheDRY
X-Google-Smtp-Source: AGHT+IHUbj002Fvi+CwXu8pD2pJsiEeqkSuPa4PQcqq3aAay+y5wCC0Yfl6jXKbsv02VlW0YKbI0Aw==
X-Received: by 2002:a05:6122:1783:b0:517:e7b7:d04b with SMTP id 71dfb90a1353d-51cd983d39emr8471535e0c.5.1737101674941;
        Fri, 17 Jan 2025 00:14:34 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:34 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Date: Fri, 17 Jan 2025 03:13:35 -0500
Message-ID: <20250117081347.8573-3-kuurtb@gmail.com>
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
index 5779b025761b..e1a5a867f144 100644
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
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
 static u8 interface;
@@ -1127,11 +1129,11 @@ static const struct platform_profile_ops awcc_platform_profile_ops = {
 	.profile_set = thermal_profile_set,
 };
 
-static int create_thermal_profile(struct platform_device *platform_device)
+static int create_thermal_profile(struct wmi_device *wdev)
 {
 	struct device *ppdev;
 
-	ppdev = devm_platform_profile_register(&platform_device->dev, "alienware-wmi",
+	ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
 					       NULL, &awcc_platform_profile_ops);
 
 	return PTR_ERR_OR_ZERO(ppdev);
@@ -1166,6 +1168,10 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
+	NULL
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
@@ -1180,19 +1186,150 @@ static struct platform_driver platform_driver = {
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
@@ -1207,33 +1344,14 @@ static int __init alienware_wmi_init(void)
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
 
@@ -1241,8 +1359,10 @@ module_init(alienware_wmi_init);
 
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
2.48.1

