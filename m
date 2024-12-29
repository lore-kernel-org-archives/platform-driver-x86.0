Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A928219AA72;
	Sun, 29 Dec 2024 19:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501636; cv=none; b=EKxLMs2k24YJvxI2+YUnTfT9VWRPnH36c3uccwoWZgLZaVVNVfV2dp4Zy9TuiUEhxIwbrPk/osYJRzZqO9BdIPYb/xpvC6Ju4GtB1kOuIl6lChJreyFOczSC5JSBboZSXO7UWpBX9xev3YCBQH7Yz5UeJMGVhFon3oEjQdvg89o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501636; c=relaxed/simple;
	bh=XK4FU/QiSLhTpnFfcV4tNp8iRSCFISRCH4SI1z+NrFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUsZT9S6q5IcLzFcPLmXHVSdbr7mPZpFvIWtDDH0c7kDUEYUH4nCCmnaoEwOprbp4g5CRhWgQuRpp6ZS2XT6T/C9IObmUY4C1jstERbESwGyksg5YIuV1Wu3NYo4L1IGvFEfdOfM/mzr1MWmv414LL/MvdAoF/AJrMVYDg5z/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBn0UwVD; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBn0UwVD"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afed12283eso5560924137.1;
        Sun, 29 Dec 2024 11:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501633; x=1736106433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgw1X8HZ7pxovhoCwy/lKDtdz5ZAZhJ8DHdGiSPigVc=;
        b=WBn0UwVDG4quCxeRrRtTxZVevu4KnR/DJdSB11leyXEgXrnmXi9/PUVNDTZcC0a4cL
         k79j2nfPXHxBJgrBMJLS/6DEi5V3hddaU+gYEaD/2/7mVBZ8VB4VeZwyf77mhtNNEEbx
         xQVt/RlnDdTlD8zfN5f/WjL/sBtYKgM2uSc+EUg9RvyQGTvUp1wT/O4J+LhowIN8KDHy
         +IL5tQMlJHqPG9Xtbxsu02/UkaiLpRX94tfR/ZcJaoCEWBpqSHATYfIdOCPuYGZKRp89
         J0id8hUrp7TdXh1OzgVlefEwK4vnqAdlRIEe+WIqH06lqd32jPcTP1t7vUexqiju43x6
         aAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501633; x=1736106433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kgw1X8HZ7pxovhoCwy/lKDtdz5ZAZhJ8DHdGiSPigVc=;
        b=eNbsRxAQE/1bvscCvPy17E3dun6jgzmIeeG07Sgps5hyqU7q+odvqWP9FII1TCcLmh
         JllQaLEqbRtI+hVq4Jxo8qI2uz+9YHaHxk8pnMK2OIa6qrr7KIrm/82v5pQsI73L4F2s
         42dO4QNT/pXCq8DBY7ZI64DMcqWisNjtHHK8HoU0dzDMYi57rVPCnudn21XGstVIJ8cz
         NBlLaPctk7Ein1P7Db7lM0l+6bCCaKfSu20EqU1EbZ6hniYFL8xtL8Z8ZQGU9NP5sZrZ
         5z2FZtydpZ43q1/4rycCoXmjHCPHr2iVwIiJlcyfkrO6x+Pf6FE6hbb7zOd8ag6wG/0T
         w4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXk+DFlD+9BVJ8QnE30j3HZ/Kq2uKMZXTjZj6wjAdgRDDiAImcpwwRB8/Frsj/n0X0nMDNl3bGcGXfn6YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrOJT4PhqIeNrkJKdotyIvrGvIzb8iOb14/yKq7zaxDuDGjBe/
	hnJ+Jdsnyz3uk+/gQfElmLYaJ/3R86jozK3FW5fJNWhkq3XMp9/kUvB45Q==
X-Gm-Gg: ASbGncsOpPN6pMUyLR8CfUfMwJIDbyQzDvQnbJCkKDCraA07jWaEsRhEhyd97OTUdcI
	I2CvD0rM1BBG19uxAhxxc+H/peFiowbIX01jFMLMZRvviXu/iAfLC8HGtNGJXZbNTgwJovhe3BS
	0O6iN76MxlDh/8/zb5axxkXhvG5irw1MgNOAv9w9g/xa4ID2OqaZR8n4VWFuUcFK974xj+RObcx
	IeQX72S+eqvq0Q6Sh7VLKDImuXPTrXiojQJpaMjL+vcp1GoM8TruAcuGSgLN63R
X-Google-Smtp-Source: AGHT+IHE9b5HCbZL6PKTpha18aG096O5nthOBFTFsJOnNpHlxnLhx8r4zDZI5IvQAuCUBEkHJt55Aw==
X-Received: by 2002:a05:6102:548f:b0:4b2:ae3e:3ff with SMTP id ada2fe7eead31-4b2cc48a5eemr25121040137.27.1735501632740;
        Sun, 29 Dec 2024 11:47:12 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:11 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 08/20] alienware-wmi: Add WMI Drivers
Date: Sun, 29 Dec 2024 14:44:55 -0500
Message-ID: <20241229194506.8268-10-kuurtb@gmail.com>
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
 drivers/platform/x86/dell/alienware-wmi.c | 195 +++++++++++++++++-----
 1 file changed, 155 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 88d4046ed45f..87a7997579c9 100644
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
@@ -413,7 +412,10 @@ struct alienfx_priv {
 	u8 lighting_control_state;
 };
 
-static struct platform_device *platform_device;
+struct alienfx_platdata {
+	struct wmi_device *wdev;
+};
+
 static struct platform_profile_handler pp_handler;
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
@@ -1072,7 +1074,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 	return wmax_thermal_control(supported_thermal_profiles[profile]);
 }
 
-static int create_thermal_profile(struct platform_device *platform_device)
+static int create_thermal_profile(struct wmi_device *wdev)
 {
 	enum platform_profile_option profile;
 	enum wmax_thermal_mode mode;
@@ -1121,7 +1123,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
 	pp_handler.profile_get = thermal_profile_get;
 	pp_handler.profile_set = thermal_profile_set;
 	pp_handler.name = "alienware-wmi";
-	pp_handler.dev = &platform_device->dev;
+	pp_handler.dev = &wdev->dev;
 
 	return platform_profile_register(&pp_handler);
 }
@@ -1164,6 +1166,10 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
+	NULL
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
@@ -1179,19 +1185,143 @@ static struct platform_driver platform_driver = {
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
+	}
+
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
+		ret = create_thermal_profile(wdev);
+	} else {
+		ret = alienware_alienfx_setup(&pdata);
+		if (ret < 0)
+			return ret;
+
+		pdev = dev_get_drvdata(&wdev->dev);
+		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
 	}
 
+	return ret;
+}
+
+static void wmax_wmi_remove(struct wmi_device *wdev)
+{
+	if (quirks->thermal)
+		remove_thermal_profile();
+	else
+		alienware_alienfx_exit(wdev);
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
@@ -1206,43 +1336,28 @@ static int __init alienware_wmi_init(void)
 			pr_warn("force_gmode requires platform profile support\n");
 	}
 
-	ret = platform_driver_register(&platform_driver);
-	if (ret)
-		goto fail_platform_driver;
-	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
-	if (!platform_device) {
-		ret = -ENOMEM;
-		goto fail_platform_device1;
+	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
+		interface = WMAX;
+		ret = alienware_wmax_wmi_init();
+	} else {
+		interface = LEGACY;
+		ret = alienware_legacy_wmi_init();
 	}
-	ret = platform_device_add(platform_device);
-	if (ret)
-		goto fail_platform_device2;
 
-	if (quirks->thermal) {
-		ret = create_thermal_profile(platform_device);
-		if (ret)
-			goto fail_prep_thermal_profile;
-	}
+	if (ret < 0)
+		return ret;
 
 	return 0;
-
-fail_prep_thermal_profile:
-	platform_device_del(platform_device);
-fail_platform_device2:
-	platform_device_put(platform_device);
-fail_platform_device1:
-	platform_driver_unregister(&platform_driver);
-fail_platform_driver:
-	return ret;
 }
 
 module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	remove_thermal_profile();
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

