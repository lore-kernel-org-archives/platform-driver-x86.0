Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708AF37C0FC
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 00:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814788; cv=none; b=bbsomx7+YsrEzXXP0gcvgRBWV90RtDIah8RXLUO1+RYAeWLeKG7f7RdpN8HB8ci1f6WPX5c6cKUnksKmAUg5G9AvEaIfC2RE+YO1ngzqi2+SGpJ+KHLvnM9PBSPkE6rT/xIbVA57g+4xKgUQiZ/mI0mGwJoH7sv86jlCOI05gY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814788; c=relaxed/simple;
	bh=bfsR+N3eKVurOKlSCy7ABiYbzmUmeCFH1XKVJvIertA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJYIjeNMHp7B/FPp79NazBwHvdl2wDZ6872Pd5RF22lBa4bqnQf6sMQ2UW7auPoy34lrMl/6yKbyp5IgySkqDT5jpwQhkFBqoiZvFvAan94gw/X9+VgaVMAJlT6sc9aqf9P0TSmmS5b7euLrQcOG1GfcLgRjHeRbj0VoVCKU5Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYe3MRJE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYe3MRJE"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so27779065ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814782; x=1791419582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=65QKTQg8dRKIi14/Dno/8l0Vcqg3fe6R3Gb8iOYuUTE=;
        b=kYe3MRJEfl2YJNJ/dei6vHQ105/ug07oDs0P2TY0/98NKKv8ac3ljaOpks8Hcatao+
         mkN6XWzpdLT5jJD6isT+8SYw1zxj//pm46EiYc0t0uPkzRL+Lxy2SvDecCbPeDHSbe6f
         XfSDvYHeGbEcn4VcWAFOEsCs/V1JleXhekxmdiXhAN7VysWDebGe/ziVMWabE6lPVD/j
         CrfQxGAr4Q7t+/54Q4YzK/zj0oIhUo3LrDw+09yPPquaqhN8tbuR2qNuRCLKHASjFym8
         Imy1+QQQ6E9/XleiQ/OswRMRJBvwKLvhUam9AY5XMJ946RPJAcm6XXh5krYpC7wYQCja
         rI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814782; x=1791419582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=65QKTQg8dRKIi14/Dno/8l0Vcqg3fe6R3Gb8iOYuUTE=;
        b=rj97C5kaeecGW46kBDTf3AFOCurj6GVUwDzJZqPxq5qGz7gU5Jcj8ey0+w5gD2lxUr
         ZreeuBGb9o2Nd+osxoLOOASQUDqehdQmDqzZlm+FIDQHDDj3Q0djukX/kqvjyWSYCKRX
         rGn8gsQKqmfTyKo+AgckC3dz1KFOUYLzfHfoFZ9jezBaOewMFw/TZl8GCS95Amg7kMd6
         SqrgM8jydJ3OQ2I2fSFpAUXYe0Q/hQXQqI+0eSS4ju2jHMjXUTcODTI0CYJsgNwtiH0X
         MFyuC/Owyan0xLo3dFJTrph0ueurUlnYCaDaq3M0Czi6g9upDTlrn+T6JrpLVAQl+lh9
         3rGg==
X-Forwarded-Encrypted: i=1; AKwUvBwBgyVm/gIWRWXZtoJPXY9LvMnlWnZCFNBswVw+rXuSZJTxkoURVvgzlcrJF9bgN+8CyUTWi+lk0CxJafW61E9/IT/4@vger.kernel.org
X-Gm-Message-State: AFq9FYJOACd8CQYMXfQEMSeFFASq6EcFNtZR3vUpksF0dghk0y+sR/Kt
	qFDD7BNZt7FvCnLO8zUkbLo/3IrJvtAL08PGqGs0iio/T853qW0rBgYV
X-Gm-Gg: AYBFou3PFwwhkMwJ0+oxzhShRcgDUv7NCryyNplfCTTdgd0J5zth2HzvupYnm5ssquX
	so56+CTo0mKu3WLqUaiZVFDaSFsRz3sHug9DN7g5ynw2EvqFsgDDOqQqBI/DxPgUDg3qp2Dw6B5
	K/mgxN2R0/W/0/jq69Q4wzp8eAH9hBHgTRiZc4clDTbKJQz2lrbEfhW4uIN5WYoRLKWS3+cAzF3
	wPg1tahdocAJqDwxIK7avT5NO/wS6pLbjJ5tvKQdY9D+AypEUt+tTckxIh6LwoYTmKTDu92MO6r
	LnvsTdyUnSZtN74QT9FZcGv4CbOv8fECqgnHpA3KchkoFNDWvtjFZsVG+S/05ffdgJwQNEG1x/Q
	09iXKmt+SiooPEgnrWxFvmsGIQBBpyuXzL82QNqzsxKqxaRhgsUnQcYf9FoC7r9slQ2AEAvpJZy
	yBVHg3Oh9LPFLDgdOdowxh6IQ4T8s/CxCpZuLg9ZTzxicjD3h0hsHsZKJJnvBKAls=
X-Received: by 2002:a17:903:19f0:b0:2da:e967:7953 with SMTP id d9443c01a7336-2e2e4a013e8mr23443755ad.12.1790814781901;
        Wed, 30 Sep 2026 17:33:01 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:33:01 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
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
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v8 5/5] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Thu,  1 Oct 2026 00:32:18 +0000
Message-ID: <20261001003218.39421-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001003218.39421-1-qby140326@gmail.com>
References: <20261001003218.39421-1-qby140326@gmail.com>
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
index e28df14d4b8a..69d4ce7316b0 100644
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
 	WMI_EVENT_SWITCHVIDEOMODE	= 1,
 	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
@@ -166,6 +211,7 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	const struct bitland_mifs_ops *ops;
 	enum platform_profile_option saved_profile;
 };
 
@@ -208,37 +254,35 @@ static int laptop_profile_get(struct device *dev,
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
@@ -269,47 +313,52 @@ static int laptop_profile_set(struct device *dev,
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
@@ -708,6 +757,19 @@ static int bitland_notifier_callback(struct notifier_block *nb,
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
@@ -732,6 +794,8 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	bitland_detect_ops(drv_data);
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
-- 
2.55.0

