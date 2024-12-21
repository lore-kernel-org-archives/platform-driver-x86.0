Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6B1F239A;
	Sat, 21 Dec 2024 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760814; cv=none; b=bCGEvnRzh6WqaTT0xfPQhLB0UB0sjIC6kjt7/PYIGLEvhXLSdKtpdOHHI8T/GlI7ZLNfbPdlZVKlGoBjlm9WZ6FqfaejqrTy3v+VRcPmnYPAy8+okl8mutRMT2YZyeu3SdQ3O+b4KWGoZOwBLZ6DaGCnNXrasvgKuHTdueQl0pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760814; c=relaxed/simple;
	bh=KWSjED2M9VhxuG0YPDnuQVf4o/CtNCseKxfCVgaN0xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pjP8FEVcTiB3h2fWMNUt9oeuBzJlrJAVpGUYK7yU9S3RAU+0/YY74v35zBTGrGjpfs8SPckrAlmW6QHJ2Hhj3Co0uHbZJV3ChxZlfpurDjvvxhbbbwVSWNR+odHhwPgMDr68l9ujCVfyUsfZ5X4svFZmhNQ5a7oOGmeMVmjyvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xx2QYnwz; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xx2QYnwz"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ef66a7ac14so36381967b3.0;
        Fri, 20 Dec 2024 22:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760811; x=1735365611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EECUPqqs1VW7VoOaUFJwBnnyz+A6MswrqziHXXocFBs=;
        b=Xx2QYnwzHKESWm/Vx2nWdE4V8Sav0AqNmr88qX07w/uwosp+Xg3Jf+lWo4UEwzSQKY
         Jn54MReZpoyYY4c9QnokDrm5KVCBghBQTSxt8RAsIIcRbYjnqagAoWvloGIjP3n9H/m6
         YhMiHgaZG9/zVCJ6uvLDxifThMtWtAjWBXv2d2zR7xITB1lVtEaPlKE1l5lokPXONq1v
         aGQGXFQemZXZGzEa/R36Nay4zrYXl9llcXWjWPa1vhc11mdfKtCi/xelJZIOMOlGEyRc
         W0izJ3tq1MBCL8P1JeyqpUuC5GexZpuBdMu9YO1yMjAZXxucn1GEKijuFVXLuh98f8ji
         jHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760811; x=1735365611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EECUPqqs1VW7VoOaUFJwBnnyz+A6MswrqziHXXocFBs=;
        b=RMwTqEMDoN/vKjmsTklsxASlLiyXsclIIMt7/sqyz+SJsWR5NjfVTb1dvJOzsEqocH
         U/Qz8Fa1UB5cn0lvJbEMGCAyKnRSnwE75bzW92efFtpxGtPy7tyTXmIxtd+KnNMCDd96
         j8K7aoM2KOxK/zMmG2/hAihP76nw84+CLmamy/rjInU90eVxYnvjU5qWFngs/fMp5EIP
         hpEOS0803rBHkNSTUflgRDooS29hZGIoeHXdnltnoVBMjmYxLvpJDD+Z8wk+wclpPXam
         AOUsyeEfaa+CetVE6eaUbskb0PKR0YZCc57rJoSEu1OVh/vc8mX1czzehTAw0hpjH3JK
         S8wA==
X-Forwarded-Encrypted: i=1; AJvYcCVap8ntJrPplqD5UNJJ2WmTpxYKcdifNoeNSJln8irtpGemSop7+EllMqNEAo9hMtZZFE4VE1jeI8Dugxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYw7tJA2MX9J9JgfoFpt/xpesA+cJGmWMv4LLMtxEp+y24h93z
	Xryx5gFwplO/7Ug5t6y9Oshw5nThEAUAV9dvTHjEFahVfcrRFF+gbH2LuQ==
X-Gm-Gg: ASbGncs0xyq2Ry1HB+2z4RCvGcEnNt1PuKq7kvL6sBsGZEHMcHRRJp6ZJe0ZuOcjp7A
	hKQo8VaJHgC7Sjw2GG8IJptu4QlDJbqRIiSIWxpJeAazKotOcPR6fgtZQ3hejF+5BCP+eHaasCO
	z9Wms8aGPF7gY9eKznG/oEoOGczTyr4hgrFxga181FA+4mbr6clm3fyq743tA4bJFi86SI+W5rO
	D19XdJCHO9mK/7EZXaM15mT38mAxHCm30CnbA02zjGjzk1BHvqljO5s20ZgD9Xp
X-Google-Smtp-Source: AGHT+IHkz2kHfNrKKA4gxVTu2oa2s67/Xj8hDADRS038Rf9r+2M7hkkNwaO8kt3auFJ0MbsxheVt+w==
X-Received: by 2002:a05:690c:6f89:b0:6ef:f1be:5b5f with SMTP id 00721157ae682-6f3e2a8a911mr88283707b3.5.1734760811208;
        Fri, 20 Dec 2024 22:00:11 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:10 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 08/20] alienware-wmi: Add WMI Drivers
Date: Sat, 21 Dec 2024 00:59:05 -0500
Message-ID: <20241221055917.10555-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
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

Aditionally, create_thermal_profile() now takes wmi_device * instead of
platform_device *.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 186 +++++++++++++++++-----
 1 file changed, 146 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 4b68d64bd742..f2f6842e27e6 100644
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
 
@@ -1048,7 +1050,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 	return wmax_thermal_control(supported_thermal_profiles[profile]);
 }
 
-static int create_thermal_profile(struct platform_device *platform_device)
+static int create_thermal_profile(struct wmi_device *wdev)
 {
 	enum platform_profile_option profile;
 	enum wmax_thermal_mode mode;
@@ -1097,7 +1099,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
 	pp_handler.profile_get = thermal_profile_get;
 	pp_handler.profile_set = thermal_profile_set;
 	pp_handler.name = "alienware-wmi";
-	pp_handler.dev = &platform_device->dev;
+	pp_handler.dev = &wdev->dev;
 
 	return platform_profile_register(&pp_handler);
 }
@@ -1153,19 +1155,138 @@ static struct platform_driver platform_driver = {
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
+	struct platform_device *pdev;
+
+	pdev = dev_get_drvdata(&wdev->dev);
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
+	int ret = 0;
+
+	if (quirks->thermal)
+		ret = create_thermal_profile(wdev);
+	else
+		ret = alienware_alienfx_setup(&pdata);
+
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
@@ -1180,43 +1301,28 @@ static int __init alienware_wmi_init(void)
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

