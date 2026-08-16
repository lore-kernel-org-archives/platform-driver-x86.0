Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6023793B8
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786839156; cv=none; b=NSyR5YhkRjT6y0z5C9xug5Jdu0OlsNCgOUmOgsTws9hR9HNemJzEQ2xYpGqVdtT7zckdPQv9VlnTgiEB3KHlB0+rQwH9MQqeMjiaf5ICiZ74mML52mL7xm4w1OSzoPYIxjbdm4Itkb5ytRswPkd0Lk1IRwmJNA6DKisQb1DnhYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786839156; c=relaxed/simple;
	bh=rz/N6YjVafxuJ7l7ui4YPxX1PJNihBUbWeyPN273N3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imhMBK2VhwA6RnJh7vF4igr5vZH7climJGps4CkgX3hpRqzRcpW+Mv2C7IkI8h16+2wpU1pDXnz1cE+eAZy4/SGz/RW66S95JKGsmiHHU9eIWBTjoBohknyhepwkft+WDf96lyVOMk2TApW3yzIhkVFRpvP09YGdWHrcCoKx2oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcN9nv6N; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcN9nv6N"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1636141a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 17:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786839151; x=1787443951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSkR9tIKiTyiThY12Ko2HUffdRvYZARmMC0w+0N9FPw=;
        b=kcN9nv6Nn0QIR8cCWmAdp7ovFgAsBNsWJhs7SAxmxsKlj82RjoI5Hvk1kSWaNiwjXX
         ixg5uQSbfMsgqL59GG1r8Bj51qwtQW03Xlj/lfaHIxdANIhXOkTC0Oi/A5Enq8/mynbG
         3Pj6pFVqYG9f4l+H+lJW0NoiMfUxIHWbcrqWXD0EXLdAC4PUe0seD/ReuEw29hkzGDkj
         J80+XLPjJrWNsHepV3ja1w95+5NZTrNRNeWdjmHpqCPXxAg70OpCefGZkbRTesSvX/jY
         s0QCs9aOXKdVviTx6C9t63w08tfVd+t+Pk1Cf0+LCSQaW9XmNeSHRdLceq6coCqEODFl
         1QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786839151; x=1787443951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSkR9tIKiTyiThY12Ko2HUffdRvYZARmMC0w+0N9FPw=;
        b=ILNxmCbilXwR/QN87TEelIrwGz6pDLS7+O4w9osktX6UR9ujO4DVcLkXaUXFoRRwAa
         59ucvOqCei39hcHKNdUTRSnVDwWeEGmTrULPbq5d0c+5p/Cgl5t4DolSKks67B48skL7
         G1KTstFxZEg2yFsI2U+vghioXZ0Hf0Glzy4dI5FNgjQ+wIg+/sPQuUQ7e4sRPdzYO9RA
         Ss9rVfioaF4/qiSyeMClmNYZLmB0OCqh00FNBMLfHyEk7cqpzCLiWPx3sgEVO4FPSp6K
         trw0h6Wv2UnzjjUQGYMmgGxD75JjDff36qrLl+nx9YmzLq6vbpjX0whPBZUPV1bQbXdF
         s5mA==
X-Forwarded-Encrypted: i=1; AHgh+Rrsn5Bs5qPLRK0S8UAPcRb3IeO8MYDHjoBWq4H5CV8IKbklsxC17/DgKUWh4q+Eh+pNBA35SDTxvbH+h798Hoi55xx7@vger.kernel.org
X-Gm-Message-State: AOJu0Yze+9T1fHKSDorQ9+pWENprQVw3688QjjgE/mWoy3oTFo63/2F0
	rg3TuxhNbFb5vChPchDK1/8OVUboL9/AHwmFnAKlxX6PhUsEDjr/8Vi4
X-Gm-Gg: AR+sD12gbE8AvvWj3UmN+u2GdIXqIBasxEf/HcMR46qsfKc5LaWUr3UhQVNZEV5UtBb
	tnDPLNQ8JVe9QBXyk/0r0gdXFCL2CprF2vjCC40pINUMt2GgXsF4KjvzLyCsX/mMUKrHez5cP5+
	60YzIPhNNa/D9hlC8aMasyAE7HtQsm/rRe0J/1CrrvzO1OwQyDlliuRYBBDGwTm1/Xn9W1UmS4Z
	QZrYM9oD7nlNCij6sdphcMa4xQs+aGkyU2T+uqNrnCsXhjjgBdwRnJPzudqSK+ZfI49hq+TF1P7
	EW5ekpszgSrBAt8AXCBN7fZOfK+Oj7e4gWKn5OuUJ3T0vyOqyU78nLgfxXBfr8DsdpuX4KPb9OY
	DUZuXGFJBN9Vfk9eMrw4t4UlC0/ZO/Es2GdezNliVNkWm+l0/lvwToNvRBAmohbnPkz4Sy4ymHf
	rrJkEYEJU5SmfCYnrrztehNgAPvHwg37deBvw=
X-Received: by 2002:a17:90b:2248:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-3933b87a743mr15027563a91.11.1786839150806;
        Sat, 15 Aug 2026 17:12:30 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm7409320a91.4.2026.08.15.17.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:12:30 -0700 (PDT)
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
Subject: [PATCH v4 5/6] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Sun, 16 Aug 2026 08:11:28 +0800
Message-ID: <20260816001129.16998-6-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816001129.16998-1-qby140326@gmail.com>
References: <20260816001129.16998-1-qby140326@gmail.com>
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

