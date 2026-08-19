Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452B34DB56
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148087; cv=none; b=ldy5dKXs+iee98McsKl/uXVFJPsg0XaCpwph5NbaLIIQMgsqGv5r2izV7CIYnToCvNNsPeNHQwGV6fEsd3zp1U28MtItcMmhegp37EwQBQ+GeBgeA6jirNKkE2GppYlz6B0OiVKOwpChJ9t9LJo/gABMbK9iQ+LV+aPyrSOtH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148087; c=relaxed/simple;
	bh=tQVCUWPnmz+z7EC2JTxwJEAG8ApFHBzBlwu6BgQuJ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdozWvw/S98HJ2ye+f31vpfAPpXrvZWFYCa/Dl6BBErUDsN/8GEKtcKNs+jGlxYd52kMB7X45Dt74YRCCEoHoSs+v5mvyZ4JdqI8F31+dJedgNFT/8awPGyLl8mZiWaiVUnicQrvHd+UyjmSxGVi3lCIEOdYdkLUSi4cyH9bjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpjBToLh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpjBToLh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so11208575e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148082; x=1787752882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWN0v5UH0k+rxliqf8aJrBdp3hf7DtwmTD7oZK678to=;
        b=UpjBToLhIlz+UwWG1okY/5uzLg+Be/Q9QT7ysQj420D42A+lcxhERxqC7rFYoYd0aM
         LnPK0egKdQIdJWXyUGWLhmlnEBGguYKF7LUkpMbX8Nh5GYkkHejhhFkpwpEPQh0srJAL
         p32KUWf7GLmS5vQk/StWmXKp6ANTJSxJ5J69O+K19d0jq7p0bf5z35DH1e1ULv2u/Wzk
         HD9aKCCYpA0gM2Nw1LwqMLyJyAGZU6WZGTTN7p6y2KI8yAlO2xnrs16pJxvial1AWr9M
         +XN1rfH7lSHj4oDmfAfsOVzMrRzMzoV/al5xq6ZiXp7pYdCKQ5VttlTOm4yxsibDU1H1
         3U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148082; x=1787752882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWN0v5UH0k+rxliqf8aJrBdp3hf7DtwmTD7oZK678to=;
        b=qo2EV3KA3QEZl1ZlXTx4TwMzk4sPrnYsNYdquNCLQhNcLI6PIAz+MA681F/xI0WLxq
         5Hs7B3V7CgXEiHFnXroH2lCjWM2OaQRUPsfvFECbw7bzl2NN1E4aPuyd/M8eqtFS2puo
         ELT547JCQYhijvSxwoOq4OcJOcK5zocHfhzIED8UsKYEuDM6H8bQsURDAvidkdWFdNGn
         bTX1pulCvrIg7i67nVx5DRsD+P4CNXHs2CKE5VKOM7eAOyxa/Cl0Mmdzmi9WBa2wJaMn
         u7UV3SXsnmlwuEBUUmnWNWjslac0hrSxK6vQXolltaXrqVYkwjXPsRxIJrTp6h8BEmzz
         L0Aw==
X-Forwarded-Encrypted: i=1; AHgh+RohH30Kvb2PNACoGYY9gChEFjQ6bdqJhr0mHV9TJBUE4ObI+ClQKyRlawdcEpfeFxA+QyfVIIDPG3qq1EtVPsQ8kfz+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7g/NNh3Vx4c6pO1CWCmSDT9lvrmv91umxDu57BjH0SKa8JMW
	02Fhag71c6K3OEsZEvvxSPNiX9hBU1nQGM/jaL6td7wVl6YH1DVO4NO0
X-Gm-Gg: AR+sD12n25gCd9hHDrvOXaB3m2I2bUZZYMPkjbEk+UpXfflMMxq6TfK1RSI5n/mNcDS
	h1yBQ4Wo5a/AHFRUZDlOaj0ro71oK5VLcO08kBnCsyRKvFz5yDVJwlTmXCPL6DqrFLrLFcByo1X
	fAtVT679JIrGMMvwYHG1vYzzC5HBwkomRW8kwv9qKklXUIbK6OZ8ra+/0JWk+KzzD7hmEybAD91
	sisyyBzKoybyIkjgLr2gUeC7dptv6/WVNnI6kWaP8joU5hS9wOgYbp9cjjXqr7Kwue51KwTeYmF
	Nnm8DD8kwdqeWnNtMu9zgJ/t5x/8gdnjVpI4AVDbkOsesbV6vF/XlGuz56pUonEseSfBcKFJoje
	8AvBZ/9C9/ZizpeMB6IXWJOJtpDtYxGWL15a7+fql99D4XS6AaezWSFdTdLpvorSVKc0kDTDQLd
	2fm1+bG/bIsJrWgy6o4TCsrIBrMRfgVz7I4haqimOB8yw6QcG5eNKEbDM=
X-Received: by 2002:a05:600c:3f19:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499aa1499ecmr106433105e9.1.1787148082217;
        Wed, 19 Aug 2026 07:01:22 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:21 -0700 (PDT)
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
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v7 3/5] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Wed, 19 Aug 2026 16:01:05 +0200
Message-ID: <20260819140107.1329091-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819140107.1329091-1-tchatard@gmail.com>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
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
  VIO   -> generic (kept always_on; no direct consumers)
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
 .../x86/intel/int3472/tps68470_board_data.c   | 170 +++++++++++++++++-
 1 file changed, 167 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036..6961e2926 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -74,8 +74,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
 	.consumer_supplies = int347a_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
+/*
+ * Keep VIO always_on.  Its voltage must exactly match VSIO on any board
+ * using the TPS68470 I2C pass-through, and must never have direct consumers
+ * (all I2C-path outputs are gated through VSIO).
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
@@ -287,6 +291,159 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
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
+ * VSIO controls the S_I2C_CTL passthrough; its voltage must match VIO
+ * (both 1800600 uV).  dovdd/INT3477 enables the passthrough when OV8858
+ * opens its I2C path.  avdd/INT3479 provides the OV5670 analog supply.
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
@@ -316,6 +473,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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

