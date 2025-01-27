Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42C21FC10A;
	Mon, 27 Jan 2025 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950664; cv=none; b=iKFaJccZPNdzxTOm6lENq7rDA5VGwB52BTHsk0DX4Vsy4p8ib2drRcJuuxF2MFIVIDLPRJ6s64iKdkLJZl7CW8rVezlBaatl1fk5Fu7ARn7geUjVwiYEQuaqm2+xRV71hQbWzqPLC6CzMHBLILSC8ePRHfot2u2MbE+tfRmw9N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950664; c=relaxed/simple;
	bh=Nz6ONgylnCGIumm6z4NqRWq+4jYKATzny4AQL2IHkts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qK+ArC5BYM+8cw92pqhZlKMV1ZJPmBHluO+QVu0WAYoo+kisQX++TTVUV7q8px5wR3nmWPsFT1suJ5MsI++onYFM4R+3R6wd69goxpMtI2AZowS+XDboZSrh3xKwXb/yta0L5Ywoiq0VnmXEYSG6db4EYHM6RpntwA3xG71PYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fE6mne9S; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fE6mne9S"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c41442fdeso837794241.1;
        Sun, 26 Jan 2025 20:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950661; x=1738555461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjgDNchXmN6B6qa+3bHMzbtRh13rIGcqQh1ZeiaAbLE=;
        b=fE6mne9SaIGb3ylpKvqOvvD2HBWRNg4agJytGRpqkoY5hfNOHsRbBorPGn3b00rFlQ
         k/MuTawOK8BOYpAdnxsHvwAjIRfEX/lHLjebIGCROaeIjLBQCiEF8whiOd2LY+RxQyFb
         8Frpa0Hws9XZEqJGBfuXvB1EaSBKHnyH5kWlfOM8pNEHmMpUs6jCqGRpAHhkvLpmfJlM
         CjYzEUQapYah3KeNXqf1RWny3JoBgxMFlIWdW9kSDnPckTQslc4K/Mn5VnpozDVr5V1T
         1KYLCX0grABYrjEsMZz3L6BeMye3Qw8EHoICYyqSURZe3NA3uq98/B3FbxNtBHJhBZ/d
         NioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950661; x=1738555461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjgDNchXmN6B6qa+3bHMzbtRh13rIGcqQh1ZeiaAbLE=;
        b=pxzzSmuee+3R90pixshquju9etoyGOctHCtlKSWjc1xMY9uS6LHDrtpYOVAuLgMj7o
         zQ5Uto+t067EMKb2D+KYvCegrc80eOxRTTBMEYnJXH69C17/h4FQa4bQVpM8HMyif1Mh
         kcCz+Nx23Xf71JxukQKTVMHQf+XXGbzpxrusxUP07dDcXYIl79M1ajvRkI38EJqqpCTs
         G/yBeHR4MDwunlRWGXELm0KHENUpoCK+tQxqQ4Fib2ZtDwNMsb4NVfzQs6rBFYPwzRlz
         eChntQ7IZoAwsTI2fpJ4YK4teuD27tAftp1W96rXaRKVZLNYXXxmzNZe+2GEJxiwoFHq
         98Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVYZ+3rOynEZvEBMBpmuEQ6cntSChofteaioNnEyczxSK6zU+auWLLIPyc1a0a/fYTabk30IHtXeMZsGOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgE1YCmXh7IFqfUrlNjjPgH774BIhKMogzfFnkJ6KxofZYx+2l
	3HCXbsqVFba26j9+6/yxlAkuBQ7xbEIIcGzSNLqzulv43jiylVdr3FL6wQ==
X-Gm-Gg: ASbGncsK7keQA/0IaCZd52y3mbtW6dhiY8RieLjdGlhEp6HwR4jzxUvpwn9KghJkYgC
	PO2EilnmnQyU0SjVcBZ3HlR/y6dHpZOun4lPBFixA4rOtzUUyd84wKT/gZ3suSeRNIBJn0KBTgQ
	hmwFj3AEFNbZmw7n4+6vE+I/WpSVdsQF+th3Gkj4gcbAekI5kGcHTQEQ5VxtsAEPhGbymRQQ0fg
	GkgWEq1SAEJn1afdvOhPlSjHg0L56XKHcuwzpqfVBsagaxP9NMXWSGRc7W99EeytyMeH7Nq5+/h
	+pQ1B4BI9ib5
X-Google-Smtp-Source: AGHT+IHwhQ8FbGCKB+8Z4zwcomIlET1BYbMnq3EMhDYs9r365xANNRGKv50Qp29ArZZ1kHqt+s0sgQ==
X-Received: by 2002:a05:6102:3e0a:b0:4b2:73f7:5adf with SMTP id ada2fe7eead31-4b690be5b36mr35024778137.9.1737950661058;
        Sun, 26 Jan 2025 20:04:21 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:20 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Date: Sun, 26 Jan 2025 23:03:54 -0500
Message-ID: <20250127040406.17112-3-kuurtb@gmail.com>
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

Add WMI drivers for LEGACY and WMAX devices.

This involves moving the platform device registration to a helper
function that is now called from the driver's preferred WMI device
driver probe. In the case of the WMAX this is done only if
`!quirks->thermal` because the newer WMAX interface doesn't support any
of the LED features of this driver. This also eliminates the need to
check for `quirks->num_zones > 0` inside alienfx_probe().

Only one WMI driver is registered on module initialization to prevent
registering a duplicate platform device.

Additionally, create_thermal_profile() now takes wmi_device * instead of
platform_device *.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 195 +++++++++++++++++-----
 1 file changed, 156 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ab86deb1adb9..38a38fe394d3 100644
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
@@ -421,7 +420,10 @@ struct alienfx_priv {
 	u8 lighting_control_state;
 };
 
-static struct platform_device *platform_device;
+struct alienfx_platdata {
+	struct wmi_device *wdev;
+};
+
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
 static u8 interface;
@@ -1136,11 +1138,11 @@ static const struct platform_profile_ops awcc_platform_profile_ops = {
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
@@ -1153,9 +1155,6 @@ static int alienfx_probe(struct platform_device *pdev)
 {
 	struct alienfx_priv *priv;
 
-	if (!quirks->num_zones)
-		return -ENODEV;
-
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -1178,6 +1177,10 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
+	NULL
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
@@ -1192,18 +1195,140 @@ static struct platform_driver platform_driver = {
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
+{
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
 {
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
@@ -1220,32 +1345,20 @@ static int __init alienware_wmi_init(void)
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
 
@@ -1253,7 +1366,11 @@ module_init(alienware_wmi_init);
 
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

