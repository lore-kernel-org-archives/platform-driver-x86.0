Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A68298CAF;
	Mon, 10 Aug 2026 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337287; cv=none; b=FRAeUIrmKK6NwIB5tiuVpbnEr45nIHg3YaxrKw5crfEHNkzi4e0N+yCLiJeYmbaxqf+n7OBeQnSsaboe7NXDVw4QoQuKSIkX3OcsGYzQXM7ZKQ/opdCPILTP/1DI6zfCs6dewx149C273vcZeu/uGhF3ZRGeaRlZ0wdOaMjF6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337287; c=relaxed/simple;
	bh=MiRpZXCGApthpwPkYsYLOqbvBjVdnFDJ9uJQblpDmjI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=M606wzW8PipXVG8J17j9JhbYHZfRiCeO8pmAHvDVLRVxntP1iLFukmPKEX1XJ/ZQK0DhV7/vm79brjF4lwFr5m73+s9jn0uNdeivK7AFxFF9CNeMUTzEsUVRU5QyJRCTWX2k33DCFt8Rp5jlkDa3WcrfdcSq11FL+caJDuE+PGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xlR793XI; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xlR793XI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786337276; bh=scHnisOyhhoYBPtx+5w2McGf58gzByIYl3moSBbPVgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xlR793XICEeWpnBlGnl5VRDJ2iTZZWiBUMOrqmpVFw/iJtA4SH0F8LX1J/rrFCeB+
	 M+XVhCIPtyBqjAf9cGMMa25ieuc7K40+Axkv0h1BaHiWKuRhNJzF3eRTN9dULnhst3
	 X0Cn5cwyXsmPfwyvfU2WfFgRrZifLokiTJY72Zag=
Received: from kasumi-star ([14.218.70.170])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BF4AB415; Mon, 10 Aug 2026 12:47:52 +0800
X-QQ-mid: xmsmtpt1786337275t3ehavbzb
Message-ID: <tencent_42266144C374B11E85F7BE04B492B9BD3308@qq.com>
X-QQ-XMAILINFO: NhKbcYr69dwuMqGsLuMQ8n9wmkT+7YPZn4oY+2KCYcyRVUSywR0SVuSbkIRP4F
	 sKvDipX2aSVKYtLvjUTTn6pTMDxmNIXRWAtllRGmV+1o0aOIRL91bfkuvX94MgO5DR0oCy0LPN/B
	 R9p7jclYx8etz7qDt5ileE+C1o5WIMZgnybJsgk2C9mR3vKCa750BA+/61qEV1E0bHIGiXv2mxUy
	 5HQXTpJ/fiAJMsLC2xVkk/zqWCSb4jqoAGthAQiHFh5s7WQgSb4M1hr3QloGAP0euP45PZrrGpiw
	 9/jinv8/iCWalowJROEFGWA569Wkp2AVqIOmzlIHOOSeoGd8Of5iA/9+tRLyNwmpnpdciwIOjiIF
	 cNVC0Zq0WQ5mFbymYeQwMUCIaeldisnohZmzdAuzXIudZEXvFVGWauNOYRVv3eAfFUo9l57fEapb
	 uZrUQXARLIJub9yNPMrl/+hjCTv1iJ2nMJtlOcCp9Oh3DoQ5o9izwhzpC9hdJrA3UI+9VibTj39t
	 U73UMKjbsHc+q7vXywIxqUquGWChx4eipJLAVlDt+NYXqgwntkBRzmIb9+AHGPz4qkIWgrv8bD3f
	 5/MT4HeIC8bmt7rhz7/1cAzcCsCytf63aDNqDcZmgxfbrKJ5j55faVkjagsZe2vGV581DhsnxQGs
	 /g436xCMw+Qv8BNrx3GSNUkrgXfsL4fUWEkyj/h9DDI5m16UkiX0g2Dp9njSynsB7nWmM7tA0A/Y
	 /3J0vn/7WabQDRLDieLAsvtxy78OIPU+voZqiafneV+prLE2Ad82YXj06Uq4gKvAXatnz/k3vUpu
	 guzQlbiZii4COOnVr0w+BN8A8LwQizCI2ziQHPBvHOY1Zr9SZ5Wjk7dROOxagl5hL+t6+oB8aqYZ
	 3qaMkNIESZzrSEa1P4atemC9hXBMqPi1yKYyYXgjy2b31Py9zjBCOtzbr1tYiNdLjpa92WNlE+6I
	 Gm9qFsfpZz8qn/n6mZb25bJkdETTYke2xUTQ3OlRIoB9Ed5movEpQWnO3lpbaFpNUW542CRnpld4
	 hlRzmsLAGXF2+3p9hfKVyQmWM+MA1UFHxnfKrhPUuDJuTvK4L/FnEBehOzhhl8i8Ayzh9WrMsTxv
	 pePccKho/w+vOWDop9gm93/cDdKfKnUg9YjFRh
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Rsplwe <i@rsplwe.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rsplwe <i@rsplwe.com>
Subject: [PATCH 2/2] platform/x86: bitland-mifs-wmi: Add quirk support for MECHREVO MRID6
Date: Mon, 10 Aug 2026 12:47:48 +0800
X-OQ-MSGID: <20260810044751.43045-3-i@rsplwe.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810044751.43045-1-i@rsplwe.com>
References: <20260810044751.43045-1-i@rsplwe.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI-based quirks for MECHREVO MRID6 laptops.

The MRID6 firmware does not implement the WMI_PP_FULL_SPEED profile
and its WMI_FN_SYSTEM_AC_TYPE method always returns 0, making the AC
adapter type check unreliable.

Use machine-specific quirks to:
- map WMI_PP_PERFORMANCE as the highest performance profile
- skip the AC type validation for performance modes
- hide unsupported balanced-performance/full-speed distinctions

This allows platform profile switching to work correctly on affected
systems.

Signed-off-by: Rsplwe <i@rsplwe.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 62 +++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index e2652d1a1bf7..5dff4f4d923b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -14,6 +14,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -153,6 +154,11 @@ struct bitland_fan_notify_data {
 	u16 speed;
 };
 
+struct bitland_mifs_quirk {
+	bool no_full_speed;
+	bool skip_ac_type;	/* EC always returns 0 for AC type */
+};
+
 struct bitland_mifs_wmi_data {
 	struct wmi_device *wdev;
 	struct mutex lock;		/* Protects WMI calls */
@@ -162,6 +168,28 @@ struct bitland_mifs_wmi_data {
 	struct device *hwmon_dev;
 	struct device *pp_dev;
 	enum platform_profile_option saved_profile;
+	struct bitland_mifs_quirk *quirk;
+};
+
+static struct bitland_mifs_quirk bitland_quirk_mrid6 = {
+	.no_full_speed = true,
+	.skip_ac_type = true,
+};
+
+static const struct dmi_system_id bitland_quirks[] = {
+	{
+		/*
+		 * MECHREVO MRID6: does not implement WMI_PP_FULL_SPEED,
+		 * its top profile is WMI_PP_PERFORMANCE; WMI_FN_SYSTEM_AC_TYPE
+		 * always returns 0, so the adapter type check is meaningless.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "MECHREVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "MRID6"),
+		},
+		.driver_data = (void *)&bitland_quirk_mrid6,
+	},
+	{}
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -209,7 +237,10 @@ static int laptop_profile_get(struct device *dev,
 		*profile = PLATFORM_PROFILE_BALANCED;
 		break;
 	case WMI_PP_PERFORMANCE:
-		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+		if (data->quirk && data->quirk->no_full_speed)
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+		else
+			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
 		break;
 	case WMI_PP_QUIET:
 		*profile = PLATFORM_PROFILE_LOW_POWER;
@@ -236,6 +267,10 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
 
+	/* Some ECs never report a meaningful AC type (always 0), skip it */
+	if (data->quirk && data->quirk->skip_ac_type)
+		return 0;
+
 	ret = bitland_mifs_wmi_call(data, &input, &output);
 	if (ret)
 		return ret;
@@ -267,6 +302,8 @@ static int laptop_profile_set(struct device *dev,
 		val = WMI_PP_BALANCED;
 		break;
 	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		if (data->quirk && data->quirk->no_full_speed)
+			return -EOPNOTSUPP;
 		ret = bitland_check_performance_capability(data);
 		if (ret)
 			return ret;
@@ -276,7 +313,10 @@ static int laptop_profile_set(struct device *dev,
 		ret = bitland_check_performance_capability(data);
 		if (ret)
 			return ret;
-		val = WMI_PP_FULL_SPEED;
+		if (data->quirk && data->quirk->no_full_speed)
+			val = WMI_PP_PERFORMANCE;
+		else
+			val = WMI_PP_FULL_SPEED;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -289,11 +329,17 @@ static int laptop_profile_set(struct device *dev,
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	struct bitland_mifs_wmi_data *data = drvdata;
+
 	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
-	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
-	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
-
+	if (data->quirk && data->quirk->no_full_speed) {
+		/* No separate balanced-performance tier; performance is the top mode */
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	} else {
+		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+	}
 	return 0;
 }
 
@@ -815,6 +861,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
 		.devname_mandatory = true,
 	};
+	const struct dmi_system_id *match;
 	int ret;
 
 	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
@@ -829,6 +876,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	/* Apply machine-specific quirks */
+	match = dmi_first_match(bitland_quirks);
+	if (match && match->driver_data)
+		drv_data->quirk = match->driver_data;
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
-- 
2.55.0

