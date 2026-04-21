Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05423A7826
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811964; cv=none; b=hDc8LROonu3w71bdzugOpLyu1eMGiO0ObuVtZF2RNVTKmLiZpCVroMUl7a7GIAo8bvy/EMex3l+22o8dNCDEMjc+1BAs5lGeQLaUECD4vmrbHWO4aLfLyj2Haw0M0lMe5vW1zR0uJgEUJPtlmFtkEoCkVkLKim+zE2m4EaCbscM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811964; c=relaxed/simple;
	bh=oCnOvcvyB5Q5+CMfPe8RbKAt5UgH4Q8QeBB9wZgxNgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8fzeT8zugEb7I7vJWDnteQFaK4fUCodbtlbCuLnb/3AzxeXJCjIV/eTWQX/oVputJpZpdiff2aIHrD35RTWl5qTAbHZJaT0dys4n/k/D+83p0M0lXISqnP6XHDlRMcXs/rOQFeEpp0BOGFENfEv34tjEtbbrUl5VV0Xv0l1P3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfcToyWv; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfcToyWv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d9916deb14so8831594eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811958; x=1777416758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbcbMd28r+rmUyZ8KhlCo0GdQR1hCRYbQzQN370ZlHo=;
        b=nfcToyWvPz38AoQm946PLdUy78gvB3p4U0hKNzPzEDTOTTldD17OCwwxVmZjisvQ+D
         tbq8pKa0bEw2Zbe8SkNV604GNbuwjcFBgp8eaJiRlpq2st/RpBgODARKUbkVe2cBCjvY
         PvaTGBvHclvWl0L7MzQW/XJPfQwgk5ylAwoFcNzDYOu54nIX9ZQwqOx5/Q9Um6ly0I+N
         qClnpfBXBk/5Mfo0pxOVH3AJKM38gN2YOV28wFapyyNQZYh9grTfg/P7Frk2qiz9hW+w
         cZOIaI+DTEdmpVB0nVJwgdP6KHyNGidiVpbOrwzgjWq+7mbWndDF9W58pYsT4MV3TfYT
         cuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811958; x=1777416758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbcbMd28r+rmUyZ8KhlCo0GdQR1hCRYbQzQN370ZlHo=;
        b=C2EEyYOeZMm+nQ1IN0sdA+LEVnfpv599ahZvNEWQK0HFtSX/NINRLt122KpfNqwsdL
         mrdkpk0nSYTDM19RlcQvpBgeC6ZTvQb0WX2sMluOoEin7lzScBSp9+sNQyCY5Mq3OkjC
         2fmODf/XcWgV9a7wpiJyYxRUOfXG6qjqEuLXBwqalEJKwbAoz4nqoEWlB3G4+lq3JrHv
         HDPsEYAmB75F3mLS86so26R+wZudiv4NYfKsEaTCSjwubmvtkPNlLIRueB5vNXIpuEn0
         o78btx1Tf/qcrCSBXf8AJVRcV3RymPTKNtqtsa+hOkdWiBQS39JusmZ1QjVXuYsYB1ga
         PY/Q==
X-Forwarded-Encrypted: i=1; AFNElJ93XTGRQGJ97uENRTJS/vA73adr3kDv6EcZsTxbELCUBdOmNP7HJpZMwT1RC9yG0c1rOk1qu9ylcbnuvXVZVZCRmFy2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2891Hwwo/+I0a8zSz1HgmfSjcedKZ2jEmN18Ddyc8/YVa7O7z
	ue0qvcm+egqRccSOtvHLzf02pnKYwQOc2+03tF2Gf8xf/G5E+LjdMQZi
X-Gm-Gg: AeBDievXfI3PO4q1GQjWhrjh2tYtHvt7tnnyTSMgg9Z6UrnIG3F0UQisqvCfQqdguQ2
	hCqx4mZDHBGDDidbFMX5ued9b0c5bIozoy62uzeSvSsRt8ocRe3rOtdp6vYNjJT9QhOr+8//WMg
	a8OEy0WO1Ws2XrtLaso8rawwfL1QbUMlbqjSMZ31gxh7WUPjSY4YQt1SY2mUSgFw963k6kYAkaD
	GttC6wKOYperQOQM/lfAeHlzQRXkCOmNtu3Q+p5mmbB33LaA1Dt/FeNl0qikfhyH6lUJdlNZj/q
	UduncRUMRQXi51kpxbcU7277MmtaAYeJN248LPCIB3C20rv6fNGTra91IM6l9OBiCf1Z2QH58Jf
	q7GOhpknKOLe9v8Hfs4vOS1PIwruqQpxP+0iwgNC2ktCb0bOmd1MDfKAIuhGtYeclexswdj3aWK
	brJ7SKtpwVyvPKcCYf/ttrLkxkmBlvRbnP
X-Received: by 2002:a05:7300:f193:b0:2df:5715:82be with SMTP id 5a478bee46e88-2e466044880mr10177993eec.2.1776811957939;
        Tue, 21 Apr 2026 15:52:37 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:37 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 3/5] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Tue, 21 Apr 2026 15:52:15 -0700
Message-ID: <20260421225217.12472-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
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
  Back:  OV8858 (ACPI INT3477) on I2C2, daisy-chained behind TPS68470
         S_I2C port (controlled by reg 0x43 S_I2C_CTL)

GPIO mapping (TPS68470):
  INT3479 (OV5670): GPIO3 = reset, GPIO4 = powerdown (both active-low)
  INT3477 (OV8858): GPIO9 = s_resetn, GPIO7 = s_enable (both active-low)
    GPIO9 and GPIO7 are the TPS68470 secondary-port GPIOs (SGPO reg 0x22
    bits 2 and 0), not regular GPDO outputs.

Regulator mapping:
  CORE  -> dvdd  / INT3477
  ANA   -> avdd  / INT3477
  VIO   -> generic (hardware always-on, no enable register, no consumers)
  VSIO  -> dovdd / INT3477: enabling VSIO sets S_I2C_CTL (reg 0x43),
           opening the I2C passthrough to OV8858; the ov8858 driver
           enables dovdd at probe time, which naturally activates the
           passthrough before any I2C transaction to the sensor.
  AUX1  -> dvdd  / INT3479
  AUX2  -> dovdd / INT3479

A static clock consumer list is provided for both sensors (INT3477 and
INT3479) to work around the broken ACPI _DEP on INT3479 described in the
previous patch.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 169 +++++++++++++++++-
 1 file changed, 166 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036..b40ac4fc5 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -74,8 +74,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
 	.consumer_supplies = int347a_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
+/*
+ * VIO has no enable register (always on at hardware level) and must never
+ * have direct consumers -- all outputs go through VSIO.  Its voltage must
+ * exactly match VSIO on any board using the I2C pass-through.
+ */
+static const struct regulator_init_data generic_tps68470_vio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
 		.max_uV = 1800600,
@@ -122,7 +126,7 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
 		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &generic_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
 		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
 		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,
@@ -287,6 +291,158 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+/* Settings for Dell Latitude 5285 2-in-1 */
+
+/*
+ * The BIOS leaves GNVS field C0TP at zero, which causes INT3479's _DEP to
+ * resolve to PCI0 instead of the INT3472 device.  Provide a static clock
+ * consumer list so probe registers MCLK lookups for both sensors regardless
+ * of the broken _DEP traversal.
+ */
+static const struct tps68470_clk_consumer dell_5285_clk_consumers[] = {
+	{ .consumer_dev_name = "i2c-INT3477:00" },	/* OV8858 rear camera  */
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
+ * VSIO controls the S_I2C_CTL passthrough.  Its voltage must match VIO
+ * exactly (both 1800600 uV).  Mapping VSIO to dovdd/INT3477 means the
+ * passthrough is enabled when the ov8858 driver enables its dovdd supply.
+ */
+static struct regulator_consumer_supply dell_5285_int3477_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
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
+		[TPS68470_ANA]  = &dell_5285_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &dell_5285_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO]  = &generic_tps68470_vio_reg_init_data,
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
@@ -316,6 +472,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,   "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+		.driver_data = (void *)&dell_5285_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.51.0

