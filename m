Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4990A3603E1
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134718; cv=none; b=pEJR77YexZkTK09FIhdi+nY7i5d9Bao7c2gCN5kvcG0ytsrEgEgqxKLrqvsae+G1eR7eepT8DlH53ykxrA2vEiqjXMIPTITXei9UK/T7aCHNbwZL2u+dGcSgVJs/2su9lhMHAwc2/Crkd05ttBU26x0f6nfTd/rBB+EzYVcJXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134718; c=relaxed/simple;
	bh=tQVCUWPnmz+z7EC2JTxwJEAG8ApFHBzBlwu6BgQuJ4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcNHQ+XWY2B3vlc4D/4OwzC5Mill4D64cA7+1EJArnUOb82bZEEebLv8AmNoCanKrXb55hAUz9YxhN42yKsW5Vf8AI+LLqbUqSxvwg7BXSYrPIuvvIM2An6YnsZ+5JmJVD+nunrDGc6ZXaKgjbw9owoD3XvEhLiJ6VoET0nMjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/EFiqXD; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/EFiqXD"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba895adfeaso9591748eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134716; x=1777739516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWN0v5UH0k+rxliqf8aJrBdp3hf7DtwmTD7oZK678to=;
        b=P/EFiqXD1u6ma3wcxy4CIMr0iTw1+cPQkNBkYK2Vv0HjhPG4lXqMCD6+xYAybcxkzo
         fZ83jy1p2SX+zK0Dy3ynVFtJTWc+B9qY/QidQyn+PnmfyInXLw4nZ+hhE27Eii4Kqnk7
         0aBrPTCJaHzgyq9nR44uh3XeoWBZOXkmCdOsAwIKQd25jArQxJOk6uAN7SwDffEBN/m5
         c/7ZmJyePIT+vs1ltBBq7EBDMWZwT1CNca6DE7/yITGt87PHVVoi0RbnGIHA9000IU60
         p6IxqShiJYqR05GlZW1PVd9VauNKAk7y0UN7GKZKbzDR2yHPZF4IzhLEc6DwwffEW+DP
         xwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134716; x=1777739516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWN0v5UH0k+rxliqf8aJrBdp3hf7DtwmTD7oZK678to=;
        b=MmIpLeGve2x/Y/8di2k+OsGpVzMYc73Kq0q14jHr/MrLkOQgDk5gVeExOwJGQemrfr
         TbzA3FQaI9PjIdrF78D72L4dSQ6d0kSqEp6Zk+kzLARPkSPejyCTQ4QuAEqGd6+5sRiI
         PCU94Za7gce4wx8c8EA/jmBeYHFE8d4h74bPzVSDhjXi0zn2gxguqUo0Uw1VBYXgrDHs
         5AVeKTJlSl72VEl9+ux2KhGCtrxL+sd2P5j1gwmTNfNmDFxH/O09KjcKUXMG6PK/LX7s
         DCwMh5hTUF8AVRWSuwvO9Mdq+K7x56zdmZT2Q93TMmNDS7nBumnghg3MOL3Kr3r6yMNt
         Vi4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zdm1aSXZKVlKiofMHnQ0keha5RyN63R3nnmyby3cixTiYGFsMTPDcko4hog2+BpTC/kF1HFRTO5wF/Ic5Gkv+u0H9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzswPdp1u4fIie5Q2++SWlabqoSTlz64x18KM4S6qCzzgW3Smu
	T9tHjr/PV3BaLTUdghvo0/N+0xOo6DwFzX+jlCoEwvtNu04yysoy/FzA
X-Gm-Gg: AeBDieuRd0r9uiCdmjPeOBgffJmt+zH3nOjYGsauYkMI2oUQabAghlaK0v6dVqOog7n
	YNxq6LC57zMw7prgYMcSCva26KARtHweJGYywX/9ngGLRbSub5qb0poIfa0huITK2mFD1EMbs17
	6Gi3NjO76Aw9k7x4pmS+4LetzI62Dn2eDmL5NAbhuqVE19xpqo8MSopsLVv/l/NAmngmR97cLFM
	cGnCe6lH9SJZ2cR3XGWAbm4alm6u2ontOvd+IAGIRTApT7OYwBH0qpx/RUWtsVJdfPF+P+tVq44
	lb4h8teMnyXpzB58AdsWW5hT/waNfdDw53eR4qthAwhF4zAJIsdFlLP/eF2WlQmEyjfiG7JNvmh
	6NJa1U49vZtm3eeNCWe64hFRZrFwDEBFxqH/T4ZS41GbNd81CnQrj41bVEfyLvkHFD9rkUypAtw
	Q1s6lE31k9bVGZwgDVPGnaJ5B3EDhXfEp1YQ==
X-Received: by 2002:a05:693c:2b04:b0:2e2:a4ba:84ae with SMTP id 5a478bee46e88-2e479017499mr19781483eec.25.1777134716446;
        Sat, 25 Apr 2026 09:31:56 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:56 -0700 (PDT)
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
Subject: [PATCH v6 3/5] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Sat, 25 Apr 2026 09:31:43 -0700
Message-ID: <20260425163145.8474-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
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

