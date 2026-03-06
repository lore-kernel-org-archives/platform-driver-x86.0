Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA33ED129;
	Fri,  6 Mar 2026 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814962; cv=none; b=dLsjlAcWRfVOzrjzshNlamOUd5vgW4BGj77+fqMSr7TXOIoUix494ANGJysOFpa28UY1N5Z1nMszj7Azd6THqA7KkRGsOimFnfxHrbMkYcOo0ngtktaCFJb8C9g17pc2N6EEK0/ZBT6fK46BD+B/8CVMv5DguIkPBdTZbH6z2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814962; c=relaxed/simple;
	bh=KWDtpoU1g8dHzuMRjZdupFSUYe+EMszFqekxgFO415g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7XxX4GsgDYnhTsx1pK7kancrXqGyUWLXvzlQiAVqBbYKdO3WDUFVDPcgscPK+l4WwEOOVGWwwHfxA9TreqbrQhnfZ9nK6P3u1f2Y8i4wGuoHFhzfFV73fN4rJdU8SnyQeTju3Dz41tWN6drm71ETguYUm8OHCgVk+M9tkjNI28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N28cD6Ib; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N28cD6Ib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772814961; x=1804350961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KWDtpoU1g8dHzuMRjZdupFSUYe+EMszFqekxgFO415g=;
  b=N28cD6IbCND4lfiZQBgsyimGAdT6q07TgrRMc9eOpggh5DAtGaQJKy4X
   V5xydGbS2RR71glEgvtm2bNoYdVUjfU4KY8GFhBOyplIAe3QMz9+GXBJP
   u1Npiu9fDfk0wfsea8K0yzyaSg+HlwN+zhh/dvhEk5XEGIMHhFBftWZlk
   mpmzENDkke09QdaSf2T16EQZp6DLbs2dBBeBG5OqnqjeazEe1pI/V61n4
   qGcSuWWcz26Nk3bFa1wX2TBMI0M0afuw8qCj2jXPYOtrqgUfw0fmoPPVB
   mp8F79S+grsBr7iYp49a3OqflAiNdX3DdEjN5cEHRbIs1di+okl/fv1Ga
   w==;
X-CSE-ConnectionGUID: rjzpYtaXQMaefBr3xdo2bA==
X-CSE-MsgGUID: ezDG09nvSyuQbLM1vlLaww==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77773865"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="77773865"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:36:01 -0800
X-CSE-ConnectionGUID: eyCyoX+dRGWF1HCb1oOX5A==
X-CSE-MsgGUID: OIRrm2jpRfKIEDWiCx/R3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219180556"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2026 08:35:58 -0800
From: Arun T <arun.t@intel.com>
To: arun.t@intel.com,
	johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com,
	arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com,
	dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehdi.djait@intel.com
Subject: [PATCH v4 1/2] platform/x86: int3472: Add TPS68470 board data for Intel nvl
Date: Fri,  6 Mar 2026 22:00:18 +0530
Message-ID: <20260306163019.1619490-2-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306163019.1619490-1-arun.t@intel.com>
References: <20260306163019.1619490-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
data to configure the GPIOs and regulators for proper camera sensor operation.

Signed-off-by: Arun T <arun.t@intel.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036292..8ae5e01f6660 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
 	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
 };
 
+/* Settings for Intel NVL platform */
+
+static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
+	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:01"),
+	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:01"),
+};
+
 static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
 	.constraints = {
 		.min_uV = 1200000,
@@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
 	.consumer_supplies = int3479_aux2_consumer_supplies,
 };
 
+static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
+	.consumer_supplies = int3472_core_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
+	.consumer_supplies = int3472_ana_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
+	.consumer_supplies = int3472_vcm_consumer_supplies,
+};
+
+/* Ensure the always-on VIO regulator has the same voltage as VSIO */
+static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.always_on = true,
+	},
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.always_on = true,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
+	.consumer_supplies = int3472_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
+	.consumer_supplies = int3472_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
+	.consumer_supplies = int3472_aux2_consumer_supplies,
+};
+
 static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
 	.reg_init_data = {
 		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
@@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
 	},
 };
 
+static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &intel_nvl_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &intel_nvl_tps68470_aux2_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table intel_nvl_int347a_gpios = {
+	.dev_id = "i2c-OVTI13B1:01",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
+static struct gpiod_lookup_table intel_nvl_int347e_gpios = {
+	.dev_id = "i2c-OVTI13B1:01",
+	.table = {
+	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
+	.n_gpiod_lookups = 2,
+	.tps68470_gpio_lookup_tables = {
+		&intel_nvl_int347a_gpios,
+		&intel_nvl_int347e_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
+		},
+	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.43.0

