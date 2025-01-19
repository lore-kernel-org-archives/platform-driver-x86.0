Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605327450;
	Sun, 19 Jan 2025 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324362; cv=none; b=DfSbaUA7jWLyHA4uLlAv1roC7udRBgBe6Ith+qOWmhNZ5YjZnR0TbJ5l9iAPkTCxwOg2u/cjFXRsVQHBBho/Z6FGqdeTXZmhbU/OiwTum3XMjdDrPl+2MHqoZjpmnoL80OvQvxfQ1dr+4BpxILckGhoEkZtsSJoB5P1MMVAf9Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324362; c=relaxed/simple;
	bh=sOLvVTGG5cgrv9k1mP346NX/X95KFQSYoqT7c+/o7FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYmmBUp5hJs64P1zKYi66018vwOkeVvAe00NPQyoy/hD1qE/+8auezJ8Q+/bninlmk4RL2ZE8nfIFS8jW1LRd3xFtG9OdZwsxUYWUw2GQe6D/3mPpQNYzeoGgH4zp5GtUb4z0z33dRzcldvy7SnJ20r1XmnKQLyBQ18xP4R7q6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWgfW10D; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWgfW10D"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6f95d2eafso468286885a.3;
        Sun, 19 Jan 2025 14:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324359; x=1737929159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXKFTSodeU5PciNPVC4cO4ce2cKOASojNC9s4Na2q2U=;
        b=hWgfW10Dl21pdIOIJtPT4VgTGgafeSnnJP8/zzY+FJTnaSCGpMKX103wSRBvDyYL/8
         fMZT0FLp+jn44cZqdxDFlJdg4Bt5dbIgJnwdv1sJvebY/huTI42N0nhLdei6zGhGrtO3
         EqvyAW6CP3VJU0cW4GN0ob/DtjWDRTJ+IwzUksTmiC/xCgw0QW+hX5dLJKQboE55IDbr
         ZtoNnXZ13fMISuH6r5cixL+bTbvROSprVwxv5EEkMtHmZlDvMZZBj7qPtFxW6emRCSDX
         WX7orgtpeMnglNLDxmZ2bd/ItNCl2hbblDVs8PkJIjNhCj4rGcnlL0O9ks5P7+vqqd+U
         dp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324359; x=1737929159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXKFTSodeU5PciNPVC4cO4ce2cKOASojNC9s4Na2q2U=;
        b=L/2WStCJV56b1FQ9XD+EtsO4QsmG597eF8UFgc1aj6U3OlV6IZhGKys4nFNbzRKJxl
         fw7dZMmwkr9oIxIWxXmvgbfzX+ut4pSAfYbfmjHpAF+rFeX/+5una//qyRwR+4zCycLS
         K2YSpOA7JKGqfSqUPtYKJgMIB3QZfOz2qB3TFxOLeE7y1dRF3ijXjVYjZf6EeyJLfNfN
         G0g+mNQSaEQ5HmM7z9ZSB+AQDWdaHz0CClUnbk1PT476Uoi3PcXmY7QVYxny63yIWZ3i
         Rn5nKcZM7HviZhh/mTxSCXs7CqfBvv9+EQOxBFgVhTkLEAjJTMZ60G2v+2EOnTd3b3pi
         CRdA==
X-Forwarded-Encrypted: i=1; AJvYcCVGNbBjrrUaV7qi7cn44hKbPdO8cJayFX2Bx0+mzBXS+MW0WMI/9sN0lo2Xh7qz6fLJOn/oNoiqcS/VY8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeFEdijH0I5I1/3ij/7RWicsfWN6UPEfcy0vHwUedcJDPwS2oU
	3JaIS3dYhYXuiYfhO6Y3T4fcULxNZJrjr36vBDz1SY/SkDV6NKuriV4tPw==
X-Gm-Gg: ASbGnctuHYIYph7PMeJmEAOwyWaTukZGRDWfNUbxK5UsPF2riNorQ7eFlzy0/WZToyL
	b7H0bT0T6Ym/uk3vgBmY/cKba7bkmXpBjDV5kctyg1um37X7WqPTE7INpWXewFbrcI6oGQMTzSy
	a+v2Wf9m7S+PrX9618J21rVw532a3qhjYHN4iFH+52AgO9DJ0BJt1UrliZFuTGOwZt9F+Rsqw7c
	umx3izwd2brtNPi6obOSbl/aMLry97019P6d6oFsUuZcCA35ia/DMlhQkPiDdwUxGcn2FgGb+Cl
	sA==
X-Google-Smtp-Source: AGHT+IG2nFlN4pd9lMeqctVUgwP/f0RK2G6r9e515y+1zcYkfMO7Ub8yOoWAqn3zZD7jr5JuGuSYrg==
X-Received: by 2002:a05:620a:d86:b0:7a9:a883:e22b with SMTP id af79cd13be357-7be632198c3mr1944068485a.7.1737324359203;
        Sun, 19 Jan 2025 14:05:59 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:05:58 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Date: Sun, 19 Jan 2025 17:05:30 -0500
Message-ID: <20250119220542.3136-3-kuurtb@gmail.com>
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
 drivers/platform/x86/dell/alienware-wmi.c | 192 ++++++++++++++++++----
 1 file changed, 156 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 5779b025761b..5935bf74b66d 100644
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
@@ -1180,18 +1186,140 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int __init alienware_wmi_init(void)
+static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(NULL, "alienware-wmi",
+					     PLATFORM_DEVID_NONE, pdata,
+					     sizeof(*pdata));
+
+	dev_set_drvdata(&pdata->wdev->dev, pdev);
+
+	return PTR_ERR_OR_ZERO(pdev);
+}
+
+static void alienware_alienfx_exit(struct wmi_device *wdev)
+{
+	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
+
+	platform_device_unregister(pdev);
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
 {
+	alienware_alienfx_exit(wdev);
+}
+
+static const struct wmi_device_id alienware_legacy_device_id_table[] = {
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
+	.no_singleton = true,
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
 	int ret;
 
-	if (wmi_has_guid(LEGACY_CONTROL_GUID))
-		interface = LEGACY;
-	else if (wmi_has_guid(WMAX_CONTROL_GUID))
-		interface = WMAX;
-	else {
-		pr_warn("alienware-wmi: No known WMI GUID found\n");
-		return -ENODEV;
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
 	}
+}
+
+static const struct wmi_device_id alienware_wmax_device_id_table[] = {
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
+	.no_singleton = true,
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
 
 	dmi_check_system(alienware_quirks);
 	if (quirks == NULL)
@@ -1208,32 +1336,20 @@ static int __init alienware_wmi_init(void)
 	}
 
 	ret = platform_driver_register(&platform_driver);
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
+	if (ret < 0)
+		return ret;
 
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
+	if (ret < 0)
+		platform_driver_unregister(&platform_driver);
 
-fail_prep_thermal_profile:
-	platform_device_del(platform_device);
-fail_platform_device2:
-	platform_device_put(platform_device);
-fail_platform_device1:
-	platform_driver_unregister(&platform_driver);
-fail_platform_driver:
 	return ret;
 }
 
@@ -1241,7 +1357,11 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	platform_device_unregister(platform_device);
+	if (interface == WMAX)
+		alienware_wmax_wmi_exit();
+	else
+		alienware_legacy_wmi_exit();
+
 	platform_driver_unregister(&platform_driver);
 }
 
-- 
2.48.1

