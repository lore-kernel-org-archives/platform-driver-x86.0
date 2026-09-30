Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E94A52FE32
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804637; cv=none; b=pdosM71S9aotVVdArf2HRDaS628a6lcXdRP9YK27AUZVivZoHjDuskjROZ0txujyv5hCarU+mUTgfNuMOwvxANkbWfDVjtFX5X7LuyxCuOYc/ZBQUtIBv7H5LON25mnK1ei3ASapqdqv/zyL2BShvoqKF5db4diRWFEKKuG2Mow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804637; c=relaxed/simple;
	bh=IwCTugM3mjPuURRqtrz1hORwvnQKSw/5SkjF1rNUpyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hxg4ViVD5Or6eOx6TjZnxOTNn8/19EfBvK8uP77Ba/TrrspmJlscQOrZrfh8yqSD3dYvZIAZcHfQK3Prs8JIBNXQw6tkADH7+FXdUcp2WjQTQOLcOI7OTx6CR06EOQcoVOWSZHzg+oxxiwerba3zy2SPS/2Fjx8wn1ixyqBlZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2MA0PBF; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2MA0PBF"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso2327061a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804634; x=1791409434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WsXujz7R4efhoK7sl7ef3qnJw5lVz7LOB8cSfJteVw=;
        b=M2MA0PBF3ed9VtyTp2mwlwu+Bfyr2iPDlC3mBOEpPEVl35UktXhsiZqOPKCHMQMoFz
         39FEoHg0SjFzrmkJxc7IGOAPkU1scHU1ugq8FkdyybXAnbYXKLOR35ehD7dQHgMuiMSt
         niahnPQwyhp0vqxU6JsBQGDlfp8yueet+2sjVaAopKlute5/balYte5Lk6iEolRXlXo0
         NuQbdk3nlcW4MDFduUQ3tEXj/CDmyaXzhVh3/1CKkZJry+d2eqDqeUshWHLbcJl5DZ8s
         wHYj2mw+T4VKXJ3Q6gpA9pkzBiKXRbWJllfxCcqj3IzwJAjJse69iVGfUMXYqctBcnzc
         frjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804634; x=1791409434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WsXujz7R4efhoK7sl7ef3qnJw5lVz7LOB8cSfJteVw=;
        b=IcXlDFjaX+zxO1sjnFLoegz4n7FyU9e33Ny1OhaTG69VP3hsGuim+wgsVVeQNHb1VS
         AkRd66yQLQs2Cs6xZD6UYQPERnSaqK3SipPg35aE4Fe3zdSTEWoi9BTrpMMnuS0e8dNb
         0v73qbt2tT1y6JAAfhqntOPvvwA5+SZOJlgVcoJcnZz3uzlp09jkWl5pxREkI6NLybXI
         /HepGN3s1ze5KOYktGlEl1r6paWTOhup82Yy0UMqzOm09AXdtbp09dBjMq1GlUSHSd+K
         5czb74Dpxq3Fz8BCHR1LFKtxn95U5qMX17Nj8aNhM2ZyihugwJDdcjZ4tWyUtz42RC4v
         M6Wg==
X-Forwarded-Encrypted: i=1; AKwUvBymYG8N79wzu003IT1sg/LX1azR/DGPWio0Ef5wfkFvJalGE4rrRkS85i/K68aEJSz4wRSMvRHbXEIQnzyGj3RPYirY@vger.kernel.org
X-Gm-Message-State: AFq9FYLzO94rQYO/LOWEFIMv6DwXWUO31iDzaO7y495lpCEQzKCBXk7J
	jjeXuoiWiLMTQfv9jwRER5uR4Whsyi+0ofm4vstZkI5PoFQXS9FnL4hXIGH0vn/U
X-Gm-Gg: AYBFou2Oxeh4hv/rh5EsL3xgvnvdYiU0jUyhKmIkaG7U3gmkhInbKCdaIa29kZv9r8F
	vtqYjvdCIpqB1BmnlIFEWrtWcdLGa0hFxnevOqcnIeUvTSRQOwjVwBBk244dhjmnmkh+WdVZxJ9
	coDgDo4USTXRqLr2CiUOl6enzCeAm8aFHwPhTmPL8W24an9mH/MTeNiCFer4VSDKBDOoNjZtDuz
	LRlWJmtpkulIZfhz1/RTSxKNew4CWB3e+oB/NAjIuJ47IWRGhqOt+MXSLM17rH4zVegdb3A/6xG
	5ag4cNWzqICTwQ0m7KJGRZR5RPyMmPYwjc97sNEPYPvcMVeK2ScQm0C3cuVyZUVF2+rV7/gysG4
	1pt9ty7u/B+PtysEfyC+Y7xf2G84q3LwJQUoYI96sAMYaBv8Vkq/kIOan5Tc5SqIRTexgS/+fu7
	bQZF6NeEyolJaCdhpKPg5RIZlJ1Rv2fJu4/472ECpwJ9/UxxsT1UZm3R/JH4K7UbhT3Rk=
X-Received: by 2002:a17:90b:518e:b0:3a0:c22d:fbe8 with SMTP id 98e67ed59e1d1-3a4d1b115d2mr2091942a91.38.1790804634005;
        Wed, 30 Sep 2026 14:43:54 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:53 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 7/9] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Wed, 30 Sep 2026 14:43:19 -0700
Message-ID: <20260930214321.600863-8-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 5285 2-in-1 has two cameras connected through a TPS68470
PMIC/clock/GPIO hub:

  Front: OV5670 (ACPI INT3479) on I2C4
  Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind the TPS68470
         S_I2C port (controlled by reg 0x43 S_I2C_CTL)

Add the regulator supply map, GPIO lookup tables and a static clock
consumer list (for both sensors, to work around the broken INT3479 _DEP)
for this machine, and wire it into the board-data DMI table.

Regulator mapping:
  CORE -> dvdd/INT3477, ANA -> avdd/INT3477, VSIO -> dovdd/INT3477 (opens
  the S_I2C passthrough), AUX1 -> dvdd/INT3479, AUX2 -> dovdd/INT3479,
  VIO kept always_on. VSIO also supplies avdd for INT3479 (OV5670).

Assisted-by: Claude Code:claude-opus-4-8
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c2ec802fc..90094732e 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -464,6 +464,159 @@ static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data =
 	},
 };
 
+/* Settings for Dell Latitude 5285 2-in-1 */
+
+/*
+ * The BIOS leaves GNVS field C0TP at zero, which causes INT3479's _DEP to
+ * resolve to PCI0 instead of the INT3472 device. Provide a static clock
+ * consumer list so probe registers MCLK lookups for both sensors regardless
+ * of the broken _DEP traversal.
+ */
+static const struct tps68470_clk_consumer dell_5285_clk_consumers[] = {
+	{ .consumer_dev_name = "i2c-INT3477:00" },	/* OV8858 rear camera */
+	{ .consumer_dev_name = "i2c-INT3479:00" },	/* OV5670 front camera */
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3477:00"),
+};
+
+/*
+ * VSIO controls the S_I2C_CTL passthrough; its voltage must match VIO
+ * (both 1800600 uV). dovdd/INT3477 enables the passthrough when OV8858
+ * opens its I2C path. avdd/INT3479 provides the OV5670 analog supply.
+ */
+static struct regulator_consumer_supply dell_5285_int3477_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
+	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3479:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
+};
+
+static const struct regulator_init_data dell_5285_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_core_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_core_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_ana_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_ana_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = 0,
+	.consumer_supplies = NULL,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vsio_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 1213200,
+		.max_uV = 1213200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux1_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_aux2_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_aux2_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data dell_5285_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &dell_5285_tps68470_core_reg_init_data,
+		[TPS68470_ANA] = &dell_5285_tps68470_ana_reg_init_data,
+		[TPS68470_VCM] = &dell_5285_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &dell_5285_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &dell_5285_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &dell_5285_tps68470_aux2_reg_init_data,
+	},
+};
+
+static struct gpiod_lookup_table dell_5285_int3477_gpios = {
+	.dev_id = "i2c-INT3477:00",
+	.table = {
+		/*
+		 * TPS68470 GPIO9 = s_resetn (secondary camera reset, active-low)
+		 * TPS68470 GPIO7 = s_enable (secondary camera enable/powerdown)
+		 * These logic outputs are specifically designed for secondary
+		 * camera control on the TPS68470. Matches Surface Go pattern.
+		 */
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static struct gpiod_lookup_table dell_5285_int3479_gpios = {
+	.dev_id = "i2c-INT3479:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static const struct int3472_tps68470_board_data dell_5285_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:05",
+	.tps68470_regulator_pdata = &dell_5285_tps68470_pdata,
+	.n_clk_consumers = ARRAY_SIZE(dell_5285_clk_consumers),
+	.clk_consumers = dell_5285_clk_consumers,
+	.n_gpiod_lookups = 2,
+	.tps68470_gpio_lookup_tables = {
+		&dell_5285_int3477_gpios,
+		&dell_5285_int3479_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -524,6 +677,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&intel_nvl_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+		.driver_data = (void *)&dell_5285_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.53.0

