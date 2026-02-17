Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791F3090D2
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371408; cv=none; b=EDrKONTh/Z6kCx5frDoK/QXMZNLWyT987PfQq/lUANwFyPXf8wHGYgBMnrF6DKKF1prtT7rutPLfDs9/2q+N1J9znYRFK1HTtvpThIe+1RUtjfE9HfSF7qf+wc0DqIem9prBus5GfBuQ4tjdmA8ZpPOYwDr0jA3n2N4J3/Y/uSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371408; c=relaxed/simple;
	bh=Kym5uHKZg/K+bSo4k43gho4k2QrggU7Y2CC146sLJ5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lW8dmfFKUGfUbuWAmK0mVtJQW77IGNWPPNRqkSRYtvWhljMr5/ZvyJHwIr6xBeBWZvdKgT9k7rkVl4CZo3geSa1AEUS5LOOx4fMsFM4T72VDpOhmmIr7ntnc5Wqbz6D1uF+HL5ON9hY2mfZ4fpFV63GDKTccTd1OArpeUga0/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpaqpUfM; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpaqpUfM"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65bfe9c585cso4320549a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 15:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771371393; x=1771976193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cI+N9RBipmvK8X1lsCKSLjblZsbYFgXwsy1wchMwU+0=;
        b=ZpaqpUfMH1NSGu+fTz+o0H4gHnYCyA0XPylIPhHPIF+VI9nLATshoJGXidax0AtZiG
         c6JAbkl3EwGEjTrvMduVbLMM4HBg58Ljw1NgpiH8QkfDQyKGJscpl9qfSIjxZjb0fvAh
         8rRhEsBgDhEZUPlveUJcoIkKyX0NtNotKFLxj3N2nkiduqgtwSRDejaSu96vMqGVfzW1
         6+GEpCXTxeIUfZo7/Zh801x/jdACmo6tFG4+LpXJWQ1559wghepc+5KD45bcT3TOjJwe
         iVCP8pppFvwR75WpsnK61t15k2TwOJ04F3JckJ3QAIuzudrK4H5rjFwqqyA/UMAG5tA/
         OMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771371393; x=1771976193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cI+N9RBipmvK8X1lsCKSLjblZsbYFgXwsy1wchMwU+0=;
        b=rXJTVav3m2skPiLTufMrBVoGwbK0gAv1sYy37lJ7x+u1QB37fPTIz4f84LoOMwDuV6
         +lbMzNPVItstgLKcJCUjV30rlRzkMy7eqhmRiKY/VjXTWxLTcLlIF7WbvECsgIasLLlG
         wPZP0NQO3sZ8xYULXplo4+/QhW1qhjmkttp60VFc50FR74SXP+H/hWBlLMfQKQ2Xm6kC
         5Mi6gz8pck3me+Y4GWw/WXREPIq23NHSddYo3f/nUY7+jcEUkyoZVDFBhNqKdH9Ax8Nl
         0c+dBs647GjJuyCDtJjwja2Ah0x3SreLTAkmfLQuEcWq6XagyMVKhkN1GVH677J0HmuA
         R9qA==
X-Gm-Message-State: AOJu0Yw+wUBc/9Jm3WHMpdvUz0QL6i93jv7z37FSVni7z+BmYnrRivEs
	tAlJS8hFBrcAK4WUDoK4ZANHwbKxbCJjTGku6yKfDxEAt3QGwB9yFkv6ey3U6Q==
X-Gm-Gg: AZuq6aIjhoHAMmy+rxZ8sk73ZsFFZ0qHJxu1akEjUORaH7GZJHhLlW5V51HQUfq5Z7s
	8G6nHomqFC7Kp5bGWVDsMvJoGXXEC8GSJdbNg7b/nSZrjKHQgzZ1yurykKXxqqiJ2MyjNlRifdq
	W7CLcT9IVRqkSTf3s995mE4E5LrvQ5hLl3acwvZ1rbFu5cWO+A3+Y5826C7F5OkGGwDCIuWAWnc
	CkQs9qtYDrzBeSbOqZNmXGmXzn9Y1tecJez/4hOTORTP+xzBFllPWgBGA04PYMqCZ6P12t7gZwV
	12ginLp2xbSuQ1MpZVKz6dVrFByQIOVIZKoB5gg5CslHaOpaHUSJo0vnYlBc3SBQrcU27V/aSDU
	J6tSw8QjK+BKfhPoz8SkjjF/1VQxxxlacGSb/aUX+yz7XveKak5ycUceh8ZZ5nJpejcwyqaUwgE
	f6rlu7SHOZVFgtqw==
X-Received: by 2002:a05:6402:26cb:b0:65c:9d6:82b7 with SMTP id 4fb4d7f45d1cf-65c09d68a87mr4005643a12.10.1771371393114;
        Tue, 17 Feb 2026 15:36:33 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm2858775a12.2.2026.02.17.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:36:31 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v1 2/2] platform: x86-android-tablets: lenovo: Add Yoga Book YB1 sound card info
Date: Wed, 18 Feb 2026 01:36:18 +0200
Message-ID: <20260217233618.1324550-3-jekhor@gmail.com>
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

Define I2C devices, their properties, and GPIO lookup tables for the Yoga
Book YB1-X90 sound codec and jack detection IC. The YB1-X90 doesn't have a
valid codec entry in the DSDT, while the YB1-X91 does.

The YB1-X91 includes additional information in the ACPI _CRS method
regarding the jack detection IC connection, but it is also defined in this
driver to simplify the unification of the sound driver for both tablet
versions.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 926a5e292c4f..485b5ec414ee 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -140,6 +140,43 @@ static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
 	.properties = lenovo_yb1_x9x_drv2604l_1_props,
 };
 
+static const struct software_node lenovo_yb1_rt5677_gpiochip_node = {
+	.name = "rt5677",
+};
+
+/*
+ * Certain properties are used by the cht_yogabook sound platform driver. The sound
+ * configuration is defined as the RT5677 ACPI entry on YB1-X91; hence, the same
+ * approach is utilized for YB1-X90 as well.
+ */
+static const struct property_entry lenovo_yb1_x9x_rt5677_props[] = {
+	PROPERTY_ENTRY_BOOL("realtek,lout1-differential"),
+	PROPERTY_ENTRY_BOOL("realtek,lout2-differential"),
+	PROPERTY_ENTRY_BOOL("realtek,lout3-differential"),
+	PROPERTY_ENTRY_BOOL("realtek,in1-differential"),
+	PROPERTY_ENTRY_BOOL("realtek,in2-differential"),
+	PROPERTY_ENTRY_GPIO("realtek,reset-gpios", &cherryview_gpiochip_nodes[3], 25, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("realtek,pow-ldo2-gpios", &cherryview_gpiochip_nodes[3], 18, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("speaker-enable-gpios", &cherryview_gpiochip_nodes[3], 48, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("speaker-enable2-gpios", &lenovo_yb1_rt5677_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("headphone-enable-gpios", &lenovo_yb1_rt5677_gpiochip_node, 4, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x90_rt5677_node = {
+	.properties = lenovo_yb1_x9x_rt5677_props,
+};
+
+static const struct property_entry lenovo_yb1_ts3a227e_props[] = {
+	/* Got from Lenovo Android kernel code drop */
+	PROPERTY_ENTRY_U32("ti,micbias", 7),
+	{}
+};
+
+static const struct software_node lenovo_yb1_ts3a227e_node = {
+	.properties = lenovo_yb1_ts3a227e_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -229,6 +266,40 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.polarity = ACPI_ACTIVE_LOW,
 			.con_id = "hideep_ts_irq",
 		},
+	}, {
+		/* Audio codec */
+		.board_info = {
+			.type = "rt5677",
+			.addr = 0x2c,
+			.dev_name = "rt5677",
+			.swnode = &lenovo_yb1_x90_rt5677_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 91,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "rt5677_irq",
+		},
+	}, {
+		/* Audio jack detection IC */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
 	},
 };
 
@@ -282,6 +353,11 @@ static const struct software_node *lenovo_yb1_x90_lid_swnodes[] = {
 	NULL
 };
 
+static const struct software_node *lenovo_yb1_x90_swnodes[] = {
+	&lenovo_yb1_rt5677_gpiochip_node,
+	NULL
+};
+
 static int __init lenovo_yb1_x90_init(struct device *dev)
 {
 	/* Enable the regulators used by the touchscreens */
@@ -309,6 +385,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.serdev_info = lenovo_yb1_x90_serdevs,
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
 	.gpio_button_swnodes = lenovo_yb1_x90_lid_swnodes,
+	.swnode_group = lenovo_yb1_x90_swnodes,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x90_init,
 };
@@ -325,14 +402,38 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
 	},
+	{
+		/* Audio jack detection IC. Its configuration (I2C address and
+		 * IRQ) is defined as additional resources in RTEK (10EC5677)
+		 * ACPI node but define them here to simplify handling in
+		 * the driver
+		 */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
+	},
 };
 
 #define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
 #define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
+#define YB1_X91_RT5677_DEVICE     "i2c-10EC5677:00"
 
 static int __init lenovo_yb1_x91_init(struct device *dev)
 {
 	struct device *drv2604l_0_dev = NULL, *drv2604l_1_dev = NULL;
+	struct device *rt5677_dev = NULL;
 	int ret = 0;
 
 	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
@@ -369,6 +470,26 @@ static int __init lenovo_yb1_x91_init(struct device *dev)
 		goto put_drv2604l_1;
 	}
 
+	rt5677_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+					     YB1_X91_RT5677_DEVICE);
+	if (!rt5677_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_RT5677_DEVICE);
+		ret = -ENODEV;
+		goto put_rt5677;
+	}
+
+	ret = device_create_managed_software_node(rt5677_dev,
+					lenovo_yb1_x9x_rt5677_props, NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s\n",
+		       YB1_X91_RT5677_DEVICE);
+		ret = -EINVAL;
+		goto put_rt5677;
+	}
+
+put_rt5677:
+	put_device(rt5677_dev);
 put_drv2604l_0:
 	put_device(drv2604l_0_dev);
 put_drv2604l_1:
@@ -377,9 +498,15 @@ static int __init lenovo_yb1_x91_init(struct device *dev)
 	return ret;
 }
 
+static const struct software_node *lenovo_yb1_x91_swnodes[] = {
+	&lenovo_yb1_rt5677_gpiochip_node,
+	NULL
+};
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.swnode_group = lenovo_yb1_x91_swnodes,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x91_init,
 };
-- 
2.51.0

