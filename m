Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C64B53E6
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192495; cv=none; b=Gwz9ttmJA4AEDWnZpvAIk+83jKIJYld8nLwzOlu27OyspFlGEiItlQfVFSVHZClaGCBqa1AJFAvbRe8qmj9USfdIQDN3t5GEkNhzh602bOuSyruOU2n6cWrFjf7mXqfScCyzrtgKY+abPBDJ/Oy6azDeBh312XEn/xeYxNAYI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192495; c=relaxed/simple;
	bh=b8VRXsl0TWgM/1ckBQPbf2CpN095S1Ie1hrTY0Ozsac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aL8xCWrLIQ3GrK3mb0Keql49evnDazLVueOv4PrU0Pnm5v23CbLYS1E4H8P4IRBekAXG/L3wPSFUsGVKLbgc7Lb81YKIoUBJuWbpqWrdCgnxbhm/NbObtD3oNfbUVP/cNnAZ1nuXvwjlqtGbog91BbdxWrgaVHEw90DuVU9uICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDC53shV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDC53shV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e4998d28so2552442f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192491; x=1788797291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+wfjOQeCqu7qc7vGs3TLJKVHeguccuJtDtaJ8F90e0=;
        b=CDC53shVtIq8XYTIMd5HVfAAMx6aqrst/I0xL31EVWh4anIj60ex+O9Uaz+3agzUu7
         8FT6+C2l3nBawmltglHU/PckrxrLxwA4CKR9uXppuvGRhibb8C88qpFGepubL4DkigJi
         2MYmYzc9GvPw5U5gmoML/eq2MICY2CszL8hE1DDydtVX+wpLG9hgRDdUv63PdLnIAn3S
         ICTH2mR8EWQcrmrfxLwwtIP/XOd5YrJ7mlCrj2dX0Gp/uGKuy0S94StDctdKuFW0NBzq
         5K5IKz9D/fjZSTUgogLIJUhl+drXsROPqi+glxH/9qcqQVU41qVeP7MrhtRCTkgOuGNO
         PJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192491; x=1788797291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+wfjOQeCqu7qc7vGs3TLJKVHeguccuJtDtaJ8F90e0=;
        b=Q3TkN6LKla6NNXwFHGCCGlTtTCL2uYbLZQv8ssIt3KppA3hKNAmU7Fy7Yi9T8HBCYF
         /Dq1u+opqwaPCvyleRSxvVVPQLEn+8IeFETaPmKhcc2t6jTyqPm6p8fSeB44OrpWtGFa
         ZY2P4rmy0LNBy6LYqTvSmLJfY616IjeWo6UndswiIxujrzfyvqTEaUtpYONk2CHoXkem
         UoO8e/6Ugi10NNexIEmVUKNKZkLQIRdJN0d0udpH2YIivkFikTisSF7d74o0mGbCZUkY
         tydofDBWBrHnWqgUvNOi9yGsvyyFcMaQKp8jPI0RAOxprxCsw4VrSaJwwkaM+Ps3OpGi
         YmYA==
X-Forwarded-Encrypted: i=1; AKwUvBzwqU1ik1LRBbYDr4AB3fkguY8uk+Qy2rJUc8OnI8yDL1PTg4F4Cit92ebIe88O5yoaQ0+yktyC1DcerzP8BjoUsZJo@vger.kernel.org
X-Gm-Message-State: AFuF++kDm/KhHtrinXcLCIIFlmiz2kxgM647aDE2WafNDm4SXpHD/hDx
	Yl1bAX3woq1qrmYj++o3pSfBKY7PBnoNtSehra2sNOnzXP/5XfHU5qxj
X-Gm-Gg: AYBFou217IsYerZOEtHaxo8OQjPWBnnNa3fuXoAOZQE5MYIxln8GhrQyie+OoeqPmlo
	Fre4tKXrL42p6JhIWjN2HTzhm0k3TKBAcIhB66no4P4iqiw4QfK3ylo4OBCb4m7q+VI9sGn5kvo
	dkWRYRoQfG8sQZxIpRl0tuxKRkakvMznnOlBuEKavJNMkNpHEIxA0jQAz+i2pTy8wNs9LvJ8M3H
	bhZ9r/cQ44X33ERcJ4GpfqiPSKdo8u7YKHBG+bg11GCEY9d/uyb8pAuEWlCeCe2TnM3RDQFI74P
	xidE61GGrXxvyWzVfXNv72bFjiLjXpN51uZ6E/0AvzxhHFiw/wcfvckTDA5yEd4K3+RIjuDzyGa
	JI4nWNl2XLciXanzkDOHhnvivVfW7Uxw6WJYUYxg2ffyflGOXCXzAtT8kjBrePDFS97bh62OY8D
	XLrHDyTi2oiFu1GvhjEAwSepDGvXUhYTK8ErO7ZQtEICwml6XZJYFEFTUk
X-Received: by 2002:a05:6000:22c9:b0:482:f2c1:c721 with SMTP id ffacd0b85a97d-482f798962cmr41700703f8f.5.1788192490958;
        Mon, 31 Aug 2026 09:08:10 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:10 -0700 (PDT)
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
Subject: [PATCH v10 6/8] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Mon, 31 Aug 2026 18:07:52 +0200
Message-ID: <20260831160754.9857-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
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

