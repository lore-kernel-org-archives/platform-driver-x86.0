Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E553DDDCA
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874937; cv=none; b=SEL2EO5/+yIoexQeOfx5WqUulL7fg+7kOalNL3Ku6FfVP3uPuVeqmtv6ojjfbTVw0M/CEkIInPXpceVbAiypUx82ahGRpmF8AupiTNvg7dhhKMPpeQ+1QgxIGEyBi0xXs0n3xz6mG8GfMhQFpf0iz7pm9gJVxl5QhHtq+smmT/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874937; c=relaxed/simple;
	bh=rz/N6YjVafxuJ7l7ui4YPxX1PJNihBUbWeyPN273N3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnaEQxAXAsgj9qn595lmC+memJ9Ae5BudHpDTZQSpPA55hN6/tVL/b4Rt7MPkh5vSDDpxo1wOheUoRIoYGyadMMIQzsfQFtKCeKudHif3jFzK1UlhyB7gW75/P4mTIVZIXlexPaMg6uYonq9Q2FXUbjjcuHhhkd+iJVpcNdlSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2TGP6HD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2TGP6HD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso2400721b3a.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786874935; x=1787479735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSkR9tIKiTyiThY12Ko2HUffdRvYZARmMC0w+0N9FPw=;
        b=g2TGP6HD4RTVWj34JXQkWwvACNLNMRJKbsERvBhod8cqXhRXzvyt53NRTqcnjP8dMy
         USJJRYYn4grzVLTCnbgX/fXg9m09pjuH6p40sjA4mfjRH/ge4+DGyWQ73gerpvBcUtMd
         G6/U6SsCsfSdanybehnpn7U8EHLlaiOrXpL41rEfvZ3KgVLB0WfmsTmi1eBuf5rVU5B2
         zrRhQRBX347TRhlvT50CBvme2dKVnfTBLxyJpWR3M8blk9vGiVCFPgLzxhqvlQ6U6B/Z
         3KEx+OfPEFwCBiqZda58oyYOxJgDmdCnFBrLLy+U+wuev26NJE5xibihsp8y/hUToo3a
         mSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786874935; x=1787479735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSkR9tIKiTyiThY12Ko2HUffdRvYZARmMC0w+0N9FPw=;
        b=NozgUyvNevIaBNn7TMdCfKrfThZPMdCu3mA9EutnmoNkwCZl1JbYrTeqSOvvHoCQLu
         OBMqLmkI3llWskDnKyKRw7OFXgzcnoNd6tLIN0V/hsueb4bJAZ/HTaK8dMlK2vdjjnZx
         4tGrWtuz1ntrJ+bNOFL38KAjR3uhJmAHNk40Gvtp2LEAs0DpXbe0TdqyMkP7bWVvmikV
         oYT1zPK9Mhf0mLCCYfjf2r0j7cOEI7T6icpfBNOVfxZXYMyX+C0plcHR/iMvUMWPzACV
         CqiiZnHHat/nfp6v/vb2SPjTN9y1nnq55hpvR5eyVoXBjODWyYz8wgZF5DqzjPn7D0Qf
         O0BA==
X-Forwarded-Encrypted: i=1; AHgh+RprsMr/lYEzDU8Ov655tpzzETc33gb50alfvsvQ6Eqvl81Vru2BdLPUCCzCoWCUaiR31IV7JGYbgw8oOdTn7P0HBKEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7D3cL/Gu0LyKZ3W/ccAa3dh61AD6U27ijCT9DQ9ZX1n5hRP7C
	UE5MGa+tINUUdO0aJo34Tb4iZA9p9d81bQzAzDz8lDOLhh+Ul4yta+2m
X-Gm-Gg: AR+sD12aUBqiGZygaI07r4XBnEmv+vW8VEPDqedzEdGfzVag74LlyGAcPzEWTpyJf5L
	Rj+nZ7QlMwowOqCkxMyR1Tj5ascwalS3f6aCZmpun7VaThga5pBGzbTA7t7NKT7Q6ML05iLMIKk
	yBr0P1hm/nr9aL07fzLWlLO03wCBGb79sb4IFgDFLUwwGKLTw+0u2GbkEbZbCk7qpTS6HRakxw4
	SOIj/tYKrtqWCyCCDoMTRexzTjiI5JEhUaGPDc25fVBWOIyqXCjmgVJMAA/Ae0+SSHlE8/HqmPC
	/Mhp11LcTQGB8m+AlWaRluektVzz5TWgnDRaWlxxk3zVh1RP7lfYPZCD7aOraEAtonn1EPQZWUM
	rFQVjYhEcIm+cAQyCjyO6dJMOYy7lIBBn9PgcP/ASsPY2gOjrX/vQ2Zo8R5gyvvcF/MEuNUusba
	SvDTakh9YZOehfNqY2an6HZhRnLcZZYF4QYxE=
X-Received: by 2002:a05:6a00:4293:b0:84f:3f5e:f072 with SMTP id d2e1a72fcca58-84fde15eb90mr18799030b3a.10.1786874934591;
        Sun, 16 Aug 2026 03:08:54 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f15dsm1759601b3a.20.2026.08.16.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 03:08:54 -0700 (PDT)
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
	wolf109909@outlook.com,
	rahulbheda131313@gmail.com
Subject: [PATCH v5 5/6] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Sun, 16 Aug 2026 18:08:12 +0800
Message-ID: <20260816100813.300450-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816100813.300450-1-qby140326@gmail.com>
References: <20260816100813.300450-1-qby140326@gmail.com>
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
 drivers/platform/x86/bitland-mifs-wmi.c | 89 +++++++++++++++++++------
 1 file changed, 67 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 81dad2b65f4f..17792d8b7c29 100644
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

