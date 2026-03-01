Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E081311957
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772402608; cv=none; b=C+qL6uTLPQYBcg6hdESbX4h6DAnuzGcGKTYeBfxDcmFC8DGKsh30kdvrmxsAsimMJ47uDbW6Nx6jht629B9J6yZ0MLB1FhAe6Y/zWf9R0am9gfA9/FqivfubfYhika5GEqUTPnWtFGdZUGL9o+8nMpRl1rQJdYTBuY3MtEFSWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772402608; c=relaxed/simple;
	bh=8CaRRVYQAWdhwxPlCQv5QyS+FWeQjLNGSv3kwyBqokA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kB1ZtlBGUeIjtTIn4fEsLYt1EGh5W7XOna5ihWz20pu5/gNztkjTMjyA1CFjUZjfu5PocyeBCrv3z+wQbRo52z9hJGjertV/gpeMP0d7ClpnramjkW1pq37oW0cTVllkuxoWrakyGWCHF3bLU3p3n357UChcTBZn8LARCFIrflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZEPjcdM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZEPjcdM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b936b85cc71so415257866b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Mar 2026 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402605; x=1773007405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vu71svIllNIZ+Xzig1JgC/nicq10GD51e1cjSo9CeI=;
        b=kZEPjcdM6YVqtuL5dQa+aVu/BdE3YFe1Gv4kBqoGGkpRhm8m9vCw/0DO84vyqSekAB
         pPwYqpTHyRoBsy63TesGXNfkrPjrr2epsSZ4WFZ6BmCKln9vN2ZCcfHF4JiUhUdng6zm
         1Ws0ZqHRVnHxpiLb/wvrjYYvGyioMrQAmogHbCUyc5JXX4ne4jOFjyPsSnA4wLCqF5pQ
         Gc+TxzM12uqrTGzj+mRKD1ns4+UdunsJGKm4xtEY4QozrTW+xMNxdE7QZcd0Tsjj883m
         vGrGUcCCywJSorVIGlK2z+Q557t857UZXyyFoT7zslrj6yfs5bOkrzzBkBytuxJknPmi
         N15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402605; x=1773007405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2vu71svIllNIZ+Xzig1JgC/nicq10GD51e1cjSo9CeI=;
        b=h0fMuwC6NeZXCQw8oMDmcqoIQz6xmybFdrgfJ3T/nC+AUGy3dQhBOvS38+Xpxj9tXn
         2crflj8gkn9U8ABJdbNgUjxFomEzju+7POfU0AK9/cu9U+/xqXKDVdyiBKTdH5yWRxIh
         HnOnDuusn6vaG5AmT8GKTEzfNg3/zaLlC2Kwe+4jLLBmjYzwEcD3JUA+3f/1Efvl9/Ea
         7hUDw39UK3IZC42OdkGwubb5f/5Zo0StH9ucU+EPnLaB+LD1j5B8Bn2QEGt0FqIBdy8R
         /4om3n6kp7WBs+qvL9Iafp3aV5tg8apfoWSRVAV62dHovQoq17xhkz2pZJ/tfmTlHED1
         sq7A==
X-Gm-Message-State: AOJu0Yy5yNfTPBH2JA2ww4pdHO79aGFGIfy1Yg8M3CIcmfNH+8HIVgsx
	S0P8ZKzJaK3uINGS5HZ0wPaYO7gaLFnsFK00bmI7VX9ggojOHnZGX8/1
X-Gm-Gg: ATEYQzwmE1zdoRa3r+mqxTZgGGEgqCqMrka6tCLq7I2Hakiuqo12VgUaJ86annnKcMj
	uiFxXL9zuxCBP6c0Qsj8fyLqVCcnNDDrthmo0chcXO6XrxpAalc2NPuC5Ha+xHGNoQ40FjuCho7
	zcXwxzEFG8sO0MIOvB+HmGxGxhAphw0yJKFDku5zmXJas1+L6rJtW+amXAjSH9igcCaQRDS06KP
	AJxYdExDtip70Epy23iCjw8jBSHwHtg3/6IFf412swMnNFvKclM9JbdIKnggDbMK3SMJdWrv3Vm
	HoJVHPLPBo7/HMkb4/AYquKfjYxjNlnYzLGSajarnmO/6bKW3CxurJOERq3J/bhF9XufXUVbzkV
	8/H3rx6KvisKz3O8cnabLGcQdaad7J4dqL04LV/hp1+xbkBzt2HhatW0wj1Z9iwJHWjMKgm0CN8
	LWACq1SWd7lPQcmuGkCA==
X-Received: by 2002:a17:907:3f87:b0:b8d:9bcc:9016 with SMTP id a640c23a62f3a-b93764b8182mr570180966b.37.1772402605194;
        Sun, 01 Mar 2026 14:03:25 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm400915866b.3.2026.03.01.14.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:03:24 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Mon, 02 Mar 2026 00:03:15 +0200
Subject: [PATCH v2 2/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book YB1 sound card info
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-x86-tablets-yogabook-v2-2-061768d5c9e7@gmail.com>
References: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com>
In-Reply-To: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772402602; l=6856;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=8CaRRVYQAWdhwxPlCQv5QyS+FWeQjLNGSv3kwyBqokA=;
 b=VA6nOfTFcDrQP7NIXIHwSUiGQ6AQ2M36xJPZeLvQKvkJVZ9ZOpTyDJ0HzEs8xhNAO4eXsXM5+
 RIZ+eIi9yzPBm3FCFva6FWzfEmxqS1f3VOjO5n0jdV50Qp9LDfAt74O
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Define I2C devices, their properties, and GPIO lookup tables for the Yoga
Book YB1-X90 sound codec and jack detection IC. The YB1-X90 doesn't have a
valid codec entry in the DSDT, while the YB1-X91 does.

The YB1-X91 includes additional information in the ACPI _CRS method
regarding the jack detection IC connection, but it is also defined in this
driver to simplify the unification of the sound driver for both tablet
versions.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 124 ++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index bc10f00da8c6..e28e1442115b 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -142,6 +142,44 @@ static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
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
+	/* MICBIAS is 2.5V */
+	PROPERTY_ENTRY_U32("ti,micbias", 4),
+	PROPERTY_ENTRY_U32("ti,debounce-insertion-ms", 2000),
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
@@ -231,6 +269,40 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
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
 
@@ -284,6 +356,11 @@ static const struct software_node *lenovo_yb1_x90_lid_swnodes[] = {
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
@@ -311,6 +388,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.serdev_info = lenovo_yb1_x90_serdevs,
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
 	.gpio_button_swnodes = lenovo_yb1_x90_lid_swnodes,
+	.swnode_group = lenovo_yb1_x90_swnodes,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x90_init,
 };
@@ -327,15 +405,39 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
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
 	struct device *drv2604l_0_dev __free(put_device) = NULL;
 	struct device *drv2604l_1_dev __free(put_device) = NULL;
+	struct device *rt5677_dev __free(put_device) = NULL;
 	int ret = 0;
 
 	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
@@ -370,12 +472,34 @@ static int __init lenovo_yb1_x91_init(struct device *dev)
 		return ret;
 	}
 
+	rt5677_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+					     YB1_X91_RT5677_DEVICE);
+	if (!rt5677_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_RT5677_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(rt5677_dev,
+					lenovo_yb1_x9x_rt5677_props, NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s\n",
+		       YB1_X91_RT5677_DEVICE);
+		return ret;
+	}
+
 	return 0;
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

