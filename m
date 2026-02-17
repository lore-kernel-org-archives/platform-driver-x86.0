Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63855322A3E
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371405; cv=none; b=HyS0yTRrS7SVkBnvF4K4Igj7J2btiCKWfZc1gjt8gnivge6uXkAINTNwcPH29CjBJo9PGvrPj28Pp2z9PkZZoGgHqL+WGA7jC0BN7gGzXVo/H3mRAvqMVNIlFb73G760b6i88LbIRhDSN7cZB9O6RIPTSQ8Cp3dcyOCfXIb7WyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371405; c=relaxed/simple;
	bh=6wLV1fKHOSo50eNLzCcDqRckuzLvPYD+d6QvWDa/E38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FScDzOodx4t2Ck/ComBHiS89o/ldrRRffoPIYR/uidVRZspTzkTlQp5XM0cWPXKs7hmIpqTHNwctwoNocrQNpu3jT7CJLyL5iPA0KPw3EG3QtP93ZBSW5XyfqZUBrvxFnlP99D9SyllxbpZThNme+8ljyZX09Y13cZJQCCITE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpLtIc9j; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpLtIc9j"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c0d2f5fe1so4238814a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 15:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771371390; x=1771976190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A46avHn96e86z7iI8XFvzGuKFUIZWovxZpHz1uUZlNE=;
        b=JpLtIc9j0sfE57nDoOvdPKkVY9g9HOG0yu+oiHcO3w96iryr/4bRyYpQftgcE4kbOB
         YCO+YEDYtme/Lj4/uoJup/JYD7SCcRwLiKCwsAVyfwsdDyybkQ/wcCGnw8slQGm+0aT4
         XxeoJKDX0iaVMtrZMVklHuyR8lAYdLNBSvVgLwKNWxELguF0FNHxZU/NoyguKn9B2CwH
         +0enHkhZ9rPtskLwmAr+spV9N9CpfGhZ+cVIJI1cuEIk9GkyAA4fnhthfJ5pgD7COa9S
         vV0uRdRf/+ub2Oi5s612P7I3xdGiDSjgEjGI4fqr/Y8a8B5idpoUwNP1jgkiPWR5Jh8k
         4+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771371390; x=1771976190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A46avHn96e86z7iI8XFvzGuKFUIZWovxZpHz1uUZlNE=;
        b=osRQSC3awT8P/bXmQuZeT4KAmyEMIUWVmTtzmzSaiX6pYqcQ0DTh3HXLl1JtDdXtCk
         Iv9bztd9da5BflmYYWkQxVrgXxpc8e+Xdg8wRhrs40Y4vqIiU++LYkrEiwE0qZbi0GOf
         XpPMbIwJwDgUSQ8ySrlGNi+Qzo2fykQsSaGBcHSfAPtdu/ebgafOjvqZpOrQcsIwkw2v
         mxelDiUvMUbTqO2++0rvGAqVjx8JRg/D4HV1WKFNJU/DDcj34jzFdFSpmEsITGvLu6PE
         kp7ZJA37/w7K3+C2XxR0V1xMp52Fpj2cvMHt1LbkDeW4EBwv+i4cIH3ByxJRLRKFRuY9
         JA2Q==
X-Gm-Message-State: AOJu0Yx0wqYg6wfLoqB99a7uMJ+AsrJPb82XKJdSXN1sKaukKcT/+pHt
	eY3YcTKaWM/UEDuOQuTOndT91oRVpjPcPUbqkc7l0v9i92ap/IhkDhilmDzPUg==
X-Gm-Gg: AZuq6aIggaRxo80w0kxVqBTsZACWk6yFe1hk+PG5c6PRIdCtPdHAMQd0/o4LOMB24Q+
	qymkcmQt9UhQQfeMiN4KizweChWE8+cVPX8SLcvWrzJe+dgKExFD/plUXmBzPfAEG1K10dw+1G5
	/+2r3yMw2rROlDwPKvIFfLHUMtU17RggFmMD/M6IntEid4XM/kV9U/Eq185OMG2AqU4tVQsWdwE
	p//5js+MDWLj3X4hkQxLmlvq/7SQYE6F/ac4d9nlpm/Dxtwzpl1jUD5doQpKgjRa5oF4pf+6Gbb
	zbTJvPsk9uYlLh2PfhZeRMu6XFwrUDcdVE9LVZKzpWFXMzGci26C/FDMpe+XGB2XWSRJOat5jvN
	aNuvO6gtVj+1mVxw/ayyFhjS+EpdVZzpFhuWKGps8HReIznM3+rRDYooXFtXC7lhz2UHq0OMxK4
	dxBkYZBVabcsSoLg==
X-Received: by 2002:a05:6402:f11:b0:64d:e1c:4c0a with SMTP id 4fb4d7f45d1cf-65c766de828mr102276a12.0.1771371389729;
        Tue, 17 Feb 2026 15:36:29 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm2858775a12.2.2026.02.17.15.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:36:27 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v1 1/2] platform: x86-android-tablets: lenovo: Add Yoga Book haptics entries
Date: Wed, 18 Feb 2026 01:36:17 +0200
Message-ID: <20260217233618.1324550-2-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260217233618.1324550-1-jekhor@gmail.com>
References: <20260217233618.1324550-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add drv2604l i2c_board_info for drv2604l haptics drivers present in
Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
initialization and self-calibration.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..926a5e292c4f 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -114,6 +114,32 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
 	.properties = lenovo_yb1_x90_hideep_ts_props,
 };
 
+static const struct property_entry lenovo_yb1_x9x_drv2604l_0_props[] = {
+	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
+	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
+	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x9x_drv2604l_0_node = {
+	.properties = lenovo_yb1_x9x_drv2604l_0_props,
+};
+
+static const struct property_entry lenovo_yb1_x9x_drv2604l_1_props[] = {
+	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
+	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
+	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
+	.properties = lenovo_yb1_x9x_drv2604l_1_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -159,6 +185,24 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.polarity = ACPI_ACTIVE_LOW,
 			.con_id = "wacom_irq",
 		},
+	}, {
+		/* Keyboard haptics driver */
+		.board_info = {
+			.type = "drv2604l",
+			.addr = 0x5a,
+			.dev_name = "drv2604l.0",
+			.swnode = &lenovo_yb1_x9x_drv2604l_0_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* Keyboard haptics driver */
+		.board_info = {
+			.type = "drv2604l",
+			.addr = 0x5a,
+			.dev_name = "drv2604l.1",
+			.swnode = &lenovo_yb1_x9x_drv2604l_1_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C4",
 	}, {
 		/* LP8557 Backlight controller */
 		.board_info = {
@@ -283,9 +327,61 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
+#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
+
+static int __init lenovo_yb1_x91_init(struct device *dev)
+{
+	struct device *drv2604l_0_dev = NULL, *drv2604l_1_dev = NULL;
+	int ret = 0;
+
+	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+						 YB1_X91_DRV2604L_0_DEVICE);
+	if (!drv2604l_0_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_DRV2604L_0_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(drv2604l_0_dev,
+					lenovo_yb1_x9x_drv2604l_0_props, NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s: %d\n",
+		       YB1_X91_DRV2604L_0_DEVICE, ret);
+		goto put_drv2604l_0;
+	}
+
+	drv2604l_1_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+						 YB1_X91_DRV2604L_1_DEVICE);
+	if (!drv2604l_1_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_DRV2604L_1_DEVICE);
+		ret = -ENODEV;
+		goto put_drv2604l_0;
+	}
+
+	ret = device_create_managed_software_node(drv2604l_1_dev,
+					lenovo_yb1_x9x_drv2604l_1_props, NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s\n",
+		       YB1_X91_DRV2604L_1_DEVICE);
+		ret = -EINVAL;
+		goto put_drv2604l_1;
+	}
+
+put_drv2604l_0:
+	put_device(drv2604l_0_dev);
+put_drv2604l_1:
+	put_device(drv2604l_1_dev);
+
+	return ret;
+}
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
+	.init = lenovo_yb1_x91_init,
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */
-- 
2.51.0

