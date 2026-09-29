Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF0250EBFE
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689568; cv=none; b=evWGGLtIGZ4/T4sNIU+wg2wxeAPsbx9+vuiZGaqUydMM67Lt6Cw2t9OzR0fmLD65ksxVkLHFIPl+2PjQ8iXxtLnPD4g064tLpQdT/aftwHOYoqCUoh5Qs7s8UycswVYZDYsu04ptke5rY0zeJVYDBAABWPjYcReFE0rXIrwXAYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689568; c=relaxed/simple;
	bh=eYx8y5ArjSRGGYgz+qVnh5swqspfKas+1pG2xeEzlYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3UmuZOEJJj5zSR4vdN9kRfVW2u6cvejabAv3YLxcqBSh7d7RaIMweR+87dyMjTmYdBEd1ScR5GmOUR9/PItGFKIQAj6r4Ri0ObnKATTz9jaXEUZtXtqdrQpfJEFAmgN3CMTuVma6qNQ6n5sMJedu/JfYCdT8+8arB5Yu7uXRTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJewiFFN; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJewiFFN"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cc70890fso218117a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689566; x=1791294366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Thel4Lv+biW9cQBcaK1vEOmT3BJPIN3J3BTQhPf+Owg=;
        b=aJewiFFNQ0emOH6T4sBggbFOXOqjYF+hDHKsay2LM3HRoUFoFVeuyk0b8qHAinjXpd
         sAZ+pRQzNX/iz2BxEVbmstgsIstZsTsSTR9GYJA9JtDwuHE8Jdb6nxii2218J2etrdZB
         2ayHmmfuBVcm/MDEFAd7YfA/GjNFH8b+p9hZA1+5Juqk9w/3VogkwanoG3syYzTTcao/
         QWhChLlwi4l98K8r2vO1mbxOhZ+NBtLfz1mjD58mkpm1y3BoUjNALToisuK2trUU3b83
         6IdAZcXTAl/mdrTHNMnlnQrvv4MplGSjNgSeN4t52Dzv0FvVey/G+m4e1bSv14ZIg8j4
         B+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689566; x=1791294366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Thel4Lv+biW9cQBcaK1vEOmT3BJPIN3J3BTQhPf+Owg=;
        b=Q8Iju89VzaDx2Xp0gWgScMJp/J482FdxN3mn5AjSn2Zd3zqvhWZTw616kxY0qaKUvc
         VRDabcpe5Scm8rETaiA0Z3Mk17LPClUqfIlZFN0rSez3LD21WazWctOj7bjrhg3AZeYI
         C1IVKw/RI8lWZKCBUFQNSUj87QoPB7+dXUdZM5lkDGCQo4nSexJzcsq3zg+dUKTjWiFD
         9EU4+LE5bRFX4abiN0VDxqYM4r7XKvF2etpv4njx1nRc1RiiqPVasCfYFvuKYIGCfGQ8
         YmBaZTgHCnzoi791E84oV2MsvsEX5ST/57TBDLMRSCLe1dBWjZFFPhPG8xtCThpbJHK4
         WTfw==
X-Forwarded-Encrypted: i=1; AKwUvBzpOd8uUip/Q2/HGgAtQeMI9lbl4exhoz5LZw+T9T7Bdnv8TVnrJ6HUbKYrG/fQIym2YGCyU6GsGceaFCUgtMIFKpAu@vger.kernel.org
X-Gm-Message-State: AFuF++mYK6DXXYBA3OxwkHV9bpx9nkPXKH0bavsQdy7/BTL1ot5vgpaV
	xkaxR+DfPJf83yREukx7btIDHaMHHS3rTt1CsB9iEaQnFJVMKZrDEgJt
X-Gm-Gg: AYBFou0KnD1p0aEvRa5J1+X6tQeDj/FV/jWclmck3UGWTYWd+2VZ7DMsfebHLNR/KKP
	fKfGwv/dWKWtpLlZnjfkstWpCULl4L1c/yI774cVjhksrJaMazjkN/Cfxnr7xEkrt4j6C8bI2he
	Iav+MMPs5RumYUmVG4k626eQtmTdwP6Ft0W0yyftw7HLH/dJQjOsXoxCQeg4F04zR00tV+LbrNE
	dPj6DUUwBpiW/D0CEFQa1RUNwa2P+poSgJS+RK0RwK/Rja5f54nAVyjJh1erqBiEoZCibijloQy
	Nn5XawwWJLQ1HFsNApB8gj7yQANo2fceXDnNc79RdrZw4AVxfkDoBN4fa4LuOJcHGKT/WxYjalE
	CTWUGlZKK60uB+c/mY/g6t1+Fhvf8un1JXxkPzXDzUu+Q1NDibZTsjGi6uqOPy51UWj6DE7d4ua
	bO6wSgADS1JzBWCeFjQAnsoHUHD/iSJBQwupwK04enEDkc2weEnXzZ
X-Received: by 2002:a05:6a21:4784:b0:3dd:a195:fa23 with SMTP id adf61e73a8af0-3de0e9cf9ecmr14510186637.72.1790689566176;
        Tue, 29 Sep 2026 06:46:06 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm919555b3a.8.2026.09.29.06.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:05 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Tue, 29 Sep 2026 13:45:03 +0000
Message-ID: <20260929134503.17249-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929134503.17249-1-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIFS WMI interface is shared by several Bitland ODM laptops which
differ in the layout of the performance mode values of
WMI_FN_SYSTEM_PER_MODE and in the capability checks.

Introduce a machine ops table to support multiple machine families
without sprinkling model checks over the driver:

struct bitland_mifs_ops {
        const char *name;
        const struct bitland_profile_mode_map *mode_map;
        int (*check_performance_capability)(
                struct bitland_mifs_wmi_data *data);
        bool has_full_speed;
};

The default ops instance keeps the current Bitland behavior, so this
change is a pure refactor without any functional changes.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 108 +++++++++++++++++++-----
 1 file changed, 86 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index df317aa6f555..d092bf07b7f7 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
+#include <linux/dmi.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
 #include <linux/err.h>
@@ -84,6 +85,50 @@ enum bitland_mifs_power_profile {
 	WMI_PP_FULL_SPEED	= 3,
 };
 
+struct bitland_mifs_wmi_data;
+
+/*
+ * Value layout of WMI_FN_SYSTEM_PER_MODE.
+ */
+struct bitland_profile_mode_map {
+	u8 balanced;
+	u8 performance;
+	u8 quiet;
+	u8 full_speed;
+};
+
+static const struct bitland_profile_mode_map bitland_mode_map = {
+	.balanced	= WMI_PP_BALANCED,
+	.performance	= WMI_PP_PERFORMANCE,
+	.quiet		= WMI_PP_QUIET,
+	.full_speed	= WMI_PP_FULL_SPEED,
+};
+
+static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data);
+
+/*
+ * Machine-specific operations. The MIFS WMI interface is shared by
+ * several Bitland ODM laptops which differ in the layout of the
+ * performance mode values and in the capability checks.
+ */
+struct bitland_mifs_ops {
+	const char *name;
+	const struct bitland_profile_mode_map *mode_map;
+	int (*check_performance_capability)(struct bitland_mifs_wmi_data *data);
+	bool has_full_speed;
+};
+
+static const struct bitland_mifs_ops bitland_ops = {
+	.name = "Bitland",
+	.mode_map = &bitland_mode_map,
+	.check_performance_capability = bitland_pp_check_capability,
+	.has_full_speed = true,
+};
+
+static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{}
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_RESERVED_1		= 1,
 	WMI_EVENT_RESERVED_2		= 2,
@@ -165,6 +210,7 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	const struct bitland_mifs_ops *ops;
 	enum platform_profile_option saved_profile;
 };
 
@@ -207,37 +253,35 @@ static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_profile_mode_map *map = data->ops->mode_map;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
 	struct bitland_mifs_output result;
+	u8 mode;
 	int ret;
 
 	ret = bitland_mifs_wmi_call(data, &input, &result);
 	if (ret)
 		return ret;
 
-	switch (result.data[0]) {
-	case WMI_PP_BALANCED:
+	mode = result.data[0];
+	if (mode == map->quiet)
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+	else if (mode == map->balanced)
 		*profile = PLATFORM_PROFILE_BALANCED;
-		break;
-	case WMI_PP_PERFORMANCE:
+	else if (mode == map->performance)
 		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
-		break;
-	case WMI_PP_QUIET:
-		*profile = PLATFORM_PROFILE_LOW_POWER;
-		break;
-	case WMI_PP_FULL_SPEED:
+	else if (mode == map->full_speed)
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
-		break;
-	default:
+	else
 		return -EINVAL;
-	}
+
 	return 0;
 }
 
-static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
+static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 {
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_GET),
@@ -268,47 +312,52 @@ static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_profile_mode_map *map = data->ops->mode_map;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_SET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
 	int ret;
-	u8 val;
+	u8 mode;
 
 	switch (profile) {
 	case PLATFORM_PROFILE_LOW_POWER:
-		val = WMI_PP_QUIET;
+		mode = map->quiet;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		val = WMI_PP_BALANCED;
+		mode = map->balanced;
 		break;
 	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
+		ret = data->ops->check_performance_capability(data);
 		if (ret)
 			return ret;
-		val = WMI_PP_PERFORMANCE;
+		mode = map->performance;
 		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
-		ret = bitland_check_performance_capability(data);
+		ret = data->ops->check_performance_capability(data);
 		if (ret)
 			return ret;
-		val = WMI_PP_FULL_SPEED;
+		mode = map->full_speed;
 		break;
 	default:
 		return -EOPNOTSUPP;
 	}
 
-	input.payload[0] = val;
+	input.payload[0] = mode;
 
 	return bitland_mifs_wmi_call(data, &input, NULL);
 }
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
 {
+	struct bitland_mifs_wmi_data *data = drvdata;
+
 	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
-	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+
+	if (data->ops->has_full_speed)
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
 	return 0;
 }
@@ -706,6 +755,19 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static void bitland_detect_ops(struct bitland_mifs_wmi_data *data)
+{
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(bitland_mifs_dmi_table);
+	if (id)
+		data->ops = id->driver_data;
+	else
+		data->ops = &bitland_ops;
+
+	dev_dbg(&data->wdev->dev, "Detected machine ops: %s\n", data->ops->name);
+}
+
 static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct bitland_mifs_wmi_data *drv_data;
@@ -730,6 +792,8 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	bitland_detect_ops(drv_data);
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
-- 
2.55.0

