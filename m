Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7541F36E
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800394; cv=none; b=XvRnJX55lOghzkliGa0VDz4YaE4QSqnCfUCTfMWoKDGVF5xJt5S/g4fTbNkgFi6lSjAo1L4ixlyqcYPWldMyGoe9VCTWQYv5dce55d8/XEhm9f0ED62uA/lcHTx55alQU5Yk/9z8MDkAHu23cEpmdBI+Qn4FwazVjxckr2uXKb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800394; c=relaxed/simple;
	bh=Noll+n4mh7IdMjSlR3SppaxcvwV8Z7jrNgTa77SYxD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8Qs14oBTr7oofQmJbjphigngZA51tTBHW6/xrCP0LY701i1+C5QcWyddWKfoiVCiFhyfeqCSjSHEaF9ofQtT8dDQSig/+s6nDhEQHNv2kNXVNzFtI22ge6Da9YrzgkiNHaz/w/lMnnE+SodfIzzFwcBcgjFO+iUQ+07E6kqXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld9a6fqb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld9a6fqb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacb8416a1so19224125ad.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800393; x=1787405193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4S32keuGTlYKlN8742IXc7eWzNigh/W8rHNIKZ+kMk=;
        b=ld9a6fqbYmJdb1r+pUaLNqeKGNUdImsuxLJ5B4q0dOEI1tuYP0hN9DeaIcqHtqngm9
         9UJVGAMpMg7e761VqrYo4QqzN6/UBEWmITBiIjDJXij9GpSJubiOHX6hZ6C95mDwUQ6T
         C5cxLLkcMaHsoNXGHBO+u8RoI1cHd1Jf48UxEe30vPQPvDGoVKpWpOUy3QLvPnJMalck
         f0N/zyKU7XPhRDlX1+ISu/QuNlDk087+PsGaxxKg3VHcYkWrJTygD6ABP7anVmquPF5F
         mqkFsjI6ic8zByR//HtrFbSyVSbPJRtip5FNT2d/g5D/KGgNvbwW23/wnhjLu7kuQOja
         f6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800393; x=1787405193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4S32keuGTlYKlN8742IXc7eWzNigh/W8rHNIKZ+kMk=;
        b=XyX+Riy6XnY0ZULY88uFTNxNTRSRsw9HeTBSu/0IGoqENUOJGvnfMay6nCogqULyLF
         09Z5GzbMDqd8pkuvutn5X+85Rrro4vHDoRXFsdkl2AaXgLRKAJ39M0fKzrEzdh+LubEF
         xOGy8YApAHaUCauu0kngO24cYJjZbMsiTrASnCFEdepJYDHf0Scer5MyD7trdpFe8WaY
         ZxGjotvwfyhnFYm34ExcxVYkMXJ7Ex+BTRC4cZ/uB4uQpuhZE+1pRhaC7leGPxdS/lp/
         eC1xmq7X2/qapeSxtrTCuUxn7Auw54pSlJ6inyiv2mSVSMCamyRXfqwperSNdRk+JnT9
         RMNA==
X-Forwarded-Encrypted: i=1; AHgh+RrULd0oCczAaIr/yXPytFeDy/g+VYy9bMk8Kw98hYbLYff1ahXIa4/6MkiTYhb7JBInsZz5z+1Ykqb2YmojI5EXZAFq@vger.kernel.org
X-Gm-Message-State: AOJu0YzpLfRSN+zHEgwDTMr5In4YycrOjXWyj1UOYACL2psn+osreGFh
	Di4bRcAa/doTkHVTCDWJ+4YP+rGtEhox4mKBsXLmaT7KU7ytJbhElQrW
X-Gm-Gg: AR+sD13gTkdyF+mc4JnGPwCYxL+sH7YFULGtGUf0yBPwfXJaoPDQlN7Y3U3pdNU/yb3
	jSrf/Yyap1wQl2NCEZ5qGd2hjI8hqbWWnDSXr1qP6u40GyhO1DRv3nBLSBkHk+iEVErNV4oQgBI
	p0s4vLpfgVa/iONqi05TxbyiAaM1ucoSCfhPhcyfFQ60+kKh85SPjR9nN1lpZSxR3vANaW1xC3S
	Qhvt32M6mDOz67OEkj+rX3hAFVvjyPogqfKCr497dStmcL3whEzPSG9UUOMjlR3bB9Wdxu6qc0x
	YVxcWMNXiCBzKPLF3l+DNlXdr26VqqY8NaW2RufjytsmMHVM+gHjNhFJ1qUMzD0SlOe3yXs7ysx
	I8Fgmgb+HSSeacCxJhbv8nELdBFgrWV1Sprk+z8qUmQ1Z2dHx5wCwewbTRDMtuo13FYCj7Z5eMO
	56K4DlFTdw/njCbEOfcpPIQW04tXNT1sxb48hpYSiB
X-Received: by 2002:a17:903:3c4d:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d3b0ad30e8mr146623605ad.5.1786800392473;
        Sat, 15 Aug 2026 06:26:32 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm19433245ad.72.2026.08.15.06.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:31 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v3 5/6] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Sat, 15 Aug 2026 21:25:46 +0800
Message-ID: <20260815132547.29022-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815132547.29022-1-qby140326@gmail.com>
References: <20260815132547.29022-1-qby140326@gmail.com>
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
        int (*check_performance_capability)(struct bitland_mifs_wmi_data *data);
        bool has_full_speed;
};

The default ops instance keeps the current Bitland behavior, so this
change is a pure refactor without any functional changes.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 89 +++++++++++++++++++------
 1 file changed, 67 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 179e72516c71..39824bba49fe 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -78,6 +78,46 @@ enum bitland_mifs_power_profile {
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
 enum bitland_mifs_event_id {
 	WMI_EVENT_RESERVED_1		= 1,
 	WMI_EVENT_RESERVED_2		= 2,
@@ -163,6 +203,7 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	const struct bitland_mifs_ops *ops;
 	enum platform_profile_option saved_profile;
 };
 
@@ -193,6 +234,7 @@ static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_profile_mode_map *map = data->ops->mode_map;
 	struct bitland_mifs_input input = {
 		.reserved1 = 0,
 		.operation = WMI_METHOD_GET,
@@ -200,32 +242,29 @@ static int laptop_profile_get(struct device *dev,
 		.function = WMI_FN_SYSTEM_PER_MODE,
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
 		.operation = WMI_METHOD_GET,
@@ -252,6 +291,7 @@ static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	const struct bitland_profile_mode_map *map = data->ops->mode_map;
 	struct bitland_mifs_input input = {
 		.reserved1 = 0,
 		.operation = WMI_METHOD_SET,
@@ -259,42 +299,46 @@ static int laptop_profile_set(struct device *dev,
 		.function = WMI_FN_SYSTEM_PER_MODE,
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
@@ -717,6 +761,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return -ENOMEM;
 
 	drv_data->wdev = wdev;
+	drv_data->ops = &bitland_ops;
 
 	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
 	if (ret)
-- 
2.55.0

