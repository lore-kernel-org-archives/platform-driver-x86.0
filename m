Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0B3FBB66;
	Fri, 15 May 2026 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867582; cv=none; b=i5zCBddthxg/EXC2X+WNxOkcDGrwlp5PZHK3TRSIcHEPfuqaKCkx4/VxbDSodwmm1eZWGdjqdtYjgmH0xvGgglzyeq8WjBPXqQkb74cxdlGD40dxLHKO/X8VdYAbD0VBflvKoXgPEG2AeX8UYVkTnU3FlrENKKljqKmsz2MO4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867582; c=relaxed/simple;
	bh=jjZZM6lfryfZRg5sp4iuDZP4QyiveQTpOU0OLsemFWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyYPdms3nrp/yLHEuekK3ldElP28hh9yXPwF2ptc2aooTWjH91M4z+qMZUZXg60kpfOkQrN6c0jxI4mGOsmLeMGm5dId9bC0wFMfT4J7OiaUZBrGqXmTDViQE4waUtyN9kBl3P9z6r+g1cAYesEysb4BT4IC/zGL170i1PC3/Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYjOBPPb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYjOBPPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778867582; x=1810403582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jjZZM6lfryfZRg5sp4iuDZP4QyiveQTpOU0OLsemFWc=;
  b=KYjOBPPbWCLKmbZJfNracZY9CIFHZgLLVB3rBSCPHKCcO8FeUt/qNSiE
   QF9D/+tL4ISvx/DIPGflbRj8661xZGVifQYdZjJbL6RAu8KcBQt3gNtu8
   KBb6+8PP7A1/Ny15hPbfk4TZlVu2g7gGe7TH8v/Wo/H7bQ7ckYzk6KVZf
   pycik9tHs6/y1/N4iLQdAnh/TH+J3QvLXUyt9nWpwDP6Znyk8zk86e1cV
   1Dy8faEyaW4rWXLBCvtiPYt/OgWLZVY6kUYXZVXp4FPQ9bwYh36qJILEw
   AvYpwersO54XTt498ep9zUXpZdfD6p3yd/KXDVVn5WCwJ9FYBZ1dPOS/R
   Q==;
X-CSE-ConnectionGUID: Msk/pC0GRZaSqro6GVY6aw==
X-CSE-MsgGUID: 8o+sLiZbTeiERIjkdbl5+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90931344"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90931344"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 10:53:02 -0700
X-CSE-ConnectionGUID: jUbLgxZhQN6x16fAW11Ppw==
X-CSE-MsgGUID: c3pRk4kcT3eDXg4zWOx8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237760918"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.35])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2026 10:52:58 -0700
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
Subject: [PATCH v11 2/3] platform/x86: int3472: Add TPS68470 board data for intel nvl
Date: Fri, 15 May 2026 23:15:11 +0530
Message-ID: <20260515174514.3752028-3-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515174514.3752028-1-arun.t@intel.com>
References: <20260515174514.3752028-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel NVL platform uses IPU8 powered by a TPS68470 PMIC,
requiring board data to configure the GPIOs and regulators for
proper camera sensor operation.

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 4358dc601923..c53542465fb4 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -289,6 +289,86 @@ static const struct tps68470_regulator_platform_data msi_prestige_ai_evo_tps6847
 	},
 };
 
+/* Settings for Intel NVL platform */
+
+static struct regulator_consumer_supply ovti13b1_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply ovti13b1_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
+};
+
+static struct regulator_consumer_supply ovti13b1_vcm_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vcc", "i2c-OVTI13B1:01-VCM"),
+};
+
+static struct regulator_consumer_supply ovti13b1_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
+		.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_core_consumer_supplies),
+	.consumer_supplies = ovti13b1_core_consumer_supplies,
+};
+
+static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_ana_consumer_supplies),
+	.consumer_supplies = ovti13b1_ana_consumer_supplies,
+};
+static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vcm_consumer_supplies),
+	.consumer_supplies = ovti13b1_vcm_consumer_supplies,
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
+static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vsio_consumer_supplies),
+	.consumer_supplies = ovti13b1_vsio_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -323,6 +403,14 @@ static struct gpiod_lookup_table msi_prestige_ai_evo_ovti5675_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table intel_nvl_tps68470_gpios = {
+	.dev_id = "i2c-OVTI13B1:01",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct property_entry int3472_tps68470_daisy_chain_gpio_props[] = {
 	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
 	{ }
@@ -371,6 +459,16 @@ static const struct int3472_tps68470_board_data msi_prestige_ai_evo_tps68470_boa
 	},
 };
 
+static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:04",
+	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
+	.tps68470_gpio_swnode = &int3472_tps68470_daisy_chain_gpio_swnode,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&intel_nvl_tps68470_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -424,6 +522,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
+		},
+		.driver_data = (void *)&intel_nvl_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.43.0

