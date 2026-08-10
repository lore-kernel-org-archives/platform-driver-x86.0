Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668C6382373;
	Mon, 10 Aug 2026 04:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337293; cv=none; b=YF8qlkal8+FXTFvIg1PiHkXh2jkjo31g7yCxLpKvmFep4qGCIYDAye7g03J2LfnJUQR4MemdeNnk4aIR3F+isMR6CbdaOGUK2vCuiHbtcp1DZjix8ggMBOc3T5lTHMC7I+NcXf0lEeHS5J4xTV6IKtA8kIw0UilAC95cxEUeTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337293; c=relaxed/simple;
	bh=MiRpZXCGApthpwPkYsYLOqbvBjVdnFDJ9uJQblpDmjI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=THK6PE/smZ3CdYQdi8Ycuez2fMXeNlPUB6CToVtEMau20IdoYTrSyEdiVZR8UTlEamNJlJ7+N0AFDLaqa8gMB8u9sBWHEsYIaE/sCMUpxPp9JcLC7qjc0s+how9OK8Ui296GhAMhinEVxuaKUBFUi38E3pF4PCPeNvkEgbt+JmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=lyCKLRd8; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="lyCKLRd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786337279; bh=scHnisOyhhoYBPtx+5w2McGf58gzByIYl3moSBbPVgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lyCKLRd8Q46c5iP8x+05MngTxPtkzqetImBhHEBx+HBbyq1/UfCoyWbxHWrUyx8zn
	 1HtkB3bqeeijc5nAeo/+HCtrYrsZzl1wQWOix9In5MHxPu1NTJyz94NwwcK8UpxDlO
	 QiJdNgcK57hAG7kME1G6dc6gBo3qsh9r1yvxOmFM=
Received: from kasumi-star ([14.218.70.170])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BF4AB415; Mon, 10 Aug 2026 12:47:52 +0800
X-QQ-mid: xmsmtpt1786337277t896a7grq
Message-ID: <tencent_650DD3C49A1412F97AD296E496CF5484A90A@qq.com>
X-QQ-XMAILINFO: MLKVDTX8DFmNdgEu9SEt0u6mb6d4a5frFj8oOYCf2zI1hvaMm5BUiRNuk5nwIK
	 DmU2vEO58wvUtFDmCU+i77a5jUkmSo6ID8AnBBtwVCwhzcQ+IGGUV22tZqrpyD8WcuYWaQWj6+QV
	 ULf05pMPmLl752nhOpzmRSrp1lfCIoa9vTrHM6brddpHDpAy+qUwlcy6NkG2BkrsdlOWErphrtdS
	 VnfqlqhFMWdsaccBV4xTw+M57FX7xB6321tqORSJ9pTqyfuFyfuhUgqvPxqcIpvlWpaQg95n80AS
	 icxTgrPOyF+dmt+UAXj4UjeBOnR9cI92uZqcRzaalDeT+27Y8fk9VgPC6MEiTaAs9Em3TOootoYp
	 RcAtnwaXMeLYlENXHTXJrhdbgSFWB+MoeRXiacqh/IaQfHTEeihQ0xbfsrWPsuttcMV/0KPm3mSC
	 3Kf8XylMXDblYYz0izz41BY4/T6YQ1SgTWRlGOVoJz45teypgRsDYdWxsmRdS8lszgS/Aszt64Oz
	 kyLDnFFxuvM7LZeORn3lBd5HXYPNPd4cQIUmTXtXO7mA50SCoJ/uH+gvaJij1kFjdhScXvNS5ouw
	 CM8nOcU1pdZMd9wa8dzRgyJfadd8lOd5pRFiKRwKUfat9uWOVZuxIp8kTWFe4snQrO9/cLg7m5q8
	 mDqJ4B/zfygytrHVuHF6IEBunA68sX0hjdfNoDJOVh2u9MbLpPXV04l3YBbmqp8vYcAwB82xmF+G
	 pCdj27f/P7MHp1dKBQ5OGVlpHH0nE9B0V/7JFHzpLMRpDmep4V7ArguYi/c4+7Z3gdSi7Y/rByqT
	 iZazBNOYsKeN5zf50+fxLzlR7ZQHuHGobaJu06Rv5s5wZ2xhQoLtKRivtga/O6TFwypSpc6w26gP
	 H6Tg47OaS3X0wB8unvefXzPCbhr776yxx6mpsjnE/5qoN7nIlHSX0cNPCgPjHIHj8K4laBXqqLeO
	 xdyMCA+BTaa3hXu2Y9+W+7aoxt38n5pSV3w/ZAQa2lBMHKgy42xPXRtHs3QJiqOfoV1FbSKgJz3C
	 uY/qQBw7etw7KSy5qnt7lGjinfgqY8TPpyCx2Gc9nl9fVWsp/+9mUNMzOKSMydksdOfDLSKnv59v
	 mbT0Pge9mTGzdpCpJShViCcTzwIiyvjFtK8cm/3ZI0QP53Zd9aYo2wahfLI9nMHRyYA6LV
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
Date: Mon, 10 Aug 2026 12:47:51 +0800
X-OQ-MSGID: <20260810044751.43045-6-i@rsplwe.com>
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

