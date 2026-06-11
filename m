Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBD379988
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166592; cv=none; b=N3sILNyWU1jn0MSfG4CYJ5gL0vbDXtkajZjcZJHmwqw5m5YNM848ZPQwfQjRF6mR+1xJT4Z6s9K8mIBVTUPGBevfwPXmiwLAuMP5VLgd2MtkHMR1w5bNGumBo565mtMLofPdg3L5MDJiebnmKqE4kdXCsdkszLv9LWl9grjch7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166592; c=relaxed/simple;
	bh=I0wm8jkWLmJkq/OxmycFrxqYsN2T26pj7RqMV2E9plA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mC8GZrW8oP1+jKiTq9NNGgxTkl5cpNr/pcQ87fATibSKRYjumj5J9gmZjnSBNTkx38fdGoK4vx+CRqSL69u6JtGM6SQnj/jH+yuwtj9uWnspiewXRDkHSotVTogycUzHySiaqZknHFvZlOWPqPAG16M8xcM87646JNxx4+Bl48Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TShwIwdA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TShwIwdA"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec450b950dso1138892266b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 01:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166589; x=1781771389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VICK7QWrxISVWmsMjJox+vSHYRFkfKTyecNbIWQbZfM=;
        b=TShwIwdAJoAkn52v5vyGs1QCrMlL//XsVbOK65NtNSFlKs4QMz9Z+P7Xn2YrNHU7Oh
         +g/Wg8owKkJ65NjW0FOBRE9iapaFcE3ZQbDHHudOxH+y2BXOSH1+tR2q7v3NC/OtWI48
         R7IQJbnngwl83qTMgqHB/AhGRL82tY41nksoWdxrzmFmMoAWX8Ym0lb4L/dBh77MtQ9u
         9OfUzAx4CczRUpD47kmV3EYlXGFd+CacJdiKCcRnQ3/qRU7oxW2NtEhOXBH1qT06ndek
         qnq41rm5YBQ3v80+BhjGSh/hncEanzVOtnuZZmpD1caE6gMVcCPD7F1Q7KC3O/BMDFk6
         IgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166589; x=1781771389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VICK7QWrxISVWmsMjJox+vSHYRFkfKTyecNbIWQbZfM=;
        b=gCbXrgeEh3yT6yClbMiCNc4DuUZRNmYPQl9HzG28v7Esxqz/8tswFdP+zEc3nhKKZp
         wxvAaP8C3BO0nnmHl0f14OhUKW3nSmdJm7xiierkelP37dI9ZEFSqBhn+jJLbxQCgLeT
         DeGrwLY9tOqpVChe40gVGWd2GYqOUSkGypUtKY7EEDcFX4XnobRVmbPgT+81qUplaPGS
         s/XBti8mpYpYXup9+4Rzh4tlHeISXwEnAhHVCw4sDutYuM6Ofj+yTOxg7J5nR02YeYS2
         QxoFiFh11M2ScGrFGGrb9aUciwu+38LzUmU8CWyhgpH70bqrpbRY4X6mmYE9Yw0DFnkI
         lJCQ==
X-Gm-Message-State: AOJu0Yz6gi1KD0pWSyGeu29Wsd8ROpJnOhJYaML1de+pg+I6MaV24W/b
	MIUUo8OHOnmOJmrKn2htKNxyPzySSJl7G6qg+wDv3X010cD5ai4CMJgRm6ioHoUn
X-Gm-Gg: Acq92OHRYwwMF6/kyXwKYGLZtNTM42apmLwGZSuY2HPRHz+ueLhBk45uiEcqP57LmPy
	0awOmJKZjEYcl+pR9OG4AIAvBljtZDUtrd7Dhy0LcFyVm3jw47AiEVKRNYZod+cVDYpU2x2Y0/v
	OL7Aw7305AiDHqtEfsLHqsjYHz+ltecRkaFb+j6SuM0DM/GNcf3ELQjNhm8PS6pawhy92qGkZPm
	RTBxumNl17R4aajP6XRBVPirWCRF403rOp1TV8eL9axXvRZTWjpKiN4H++bDEQitao2DeauzMcf
	j9j5JVZ5Aw57Vkp9vU6RQNgku8DYnAA6KXDiYqO+vLdEmOhEva/f1s6l8vVnfhJ+gDPr/v8dpt4
	gvHdIfS/L+i9VHFZ6Eg/ZUsyP8HamJBo4hUJzC5dWz0MmDpzUH4ijmEqJAL5CMPqzEAsQagZgn9
	Edw0BLzib3imMMEXzqZ0bzq3e8INNQ
X-Received: by 2002:a17:907:3f20:b0:bee:ed4:ea17 with SMTP id a640c23a62f3a-bfc86905d78mr74535566b.26.1781166588547;
        Thu, 11 Jun 2026 01:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b771bsm27347866b.54.2026.06.11.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:29:48 -0700 (PDT)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 11 Jun 2026 11:29:36 +0300
Subject: [PATCH v3 2/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book YB1 sound card info
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-x86-tablets-yogabook-v3-2-de407672e4df@gmail.com>
References: <20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com>
In-Reply-To: <20260611-x86-tablets-yogabook-v3-0-de407672e4df@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781166586; l=6687;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=I0wm8jkWLmJkq/OxmycFrxqYsN2T26pj7RqMV2E9plA=;
 b=kIN321H5QVPz8abfPPzh0KAkHSoz2XN5UFMVXKw2gZTg16BPK1JmDbiDR6R3qe9EU+59oxOT9
 qMDjC08HpgCCf+7fzwVanZwBevvYmT5tPKm+QxmJo1yNWetEuLPDuib
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
 drivers/platform/x86/x86-android-tablets/lenovo.c | 130 ++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 81453217fec5..95ed201c5cb0 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -142,6 +142,49 @@ static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
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
+	PROPERTY_ENTRY_GPIO("realtek,reset-gpios",
+			    &cherryview_gpiochip_nodes[3], 25, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("realtek,pow-ldo2-gpios",
+			    &cherryview_gpiochip_nodes[3], 18, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("speaker-enable-gpios",
+			    &cherryview_gpiochip_nodes[3], 48, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("speaker-enable2-gpios",
+			    &lenovo_yb1_rt5677_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("headphone-enable-gpios",
+			    &lenovo_yb1_rt5677_gpiochip_node, 4, GPIO_ACTIVE_HIGH),
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
@@ -231,6 +274,40 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
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
 
@@ -284,6 +361,11 @@ static const struct software_node *lenovo_yb1_x90_lid_swnodes[] = {
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
@@ -311,6 +393,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.serdev_info = lenovo_yb1_x90_serdevs,
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
 	.gpio_button_swnodes = lenovo_yb1_x90_lid_swnodes,
+	.swnode_group = lenovo_yb1_x90_swnodes,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x90_init,
 };
@@ -327,10 +410,33 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
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
@@ -372,12 +478,36 @@ static int __init lenovo_yb1_x91_init(struct device *dev)
 		return ret;
 	}
 
+	struct device *rt5677_dev __free(put_device) =
+		bus_find_device_by_name(&i2c_bus_type, NULL,
+					YB1_X91_RT5677_DEVICE);
+	if (!rt5677_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_RT5677_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(rt5677_dev,
+						  lenovo_yb1_x9x_rt5677_props,
+						  NULL);
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
2.53.0

