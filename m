Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C713DBA0
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 00:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965406; cv=none; b=lCY5DKN0K/WzrKr9VtOgB2RVlwyBuNR5qGyGvjJYHI4FzapBuN9O3KNtebpwn3H/YQY8703K0vDAY2fn0za7vGF/3eMkpLRJ/nSWSmCR6EApkBF5VQ/kqhISZYR2GCcAPV2dZucJWjd2zuBqmCStAv/I4f2N2YRcdrwTXRTO/rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965406; c=relaxed/simple;
	bh=0Gwtc1Aw3N0kKl6UBYxX38wZYxqXLGfLSaCSDBMFI/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gy+mKKvzjhLZwTauidNu4dmPoLjbHREzobtF3hwX9hYNbvSTXjSbmVNX3fjtqC3tYhCOhcyWoPl2J7rowy8AMJhKjD4OGZLm+b1T6ak1xxgF8+49CwqMx6m87yV3iYnDZFXNphGxnqcawvwyWkI1AIp20/xT63X/7xZt/t26SdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcY7hPIT; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcY7hPIT"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0bcd8f194so2138806eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965402; x=1774570202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wfzgvzVMeg4WQczJDrBbctjHV7qEIQWsbnU0+vLey0=;
        b=AcY7hPIT6oHCWrGBq1eZ2qxY5H0f3XAMYvkj2nenJ9sAhQvOAQBXn0fLCNZqrHw+hR
         K1t/BpvoqJdlsUApZqd5Q/QGXkz+yayWbbUOKKYZ+ThOWDaDwJBbFUYdJzLKTJEvSkh2
         nNrGwSu34oWdv98q7GSJuU3R/chp347q9rpTm6SaEGkzkMQSQsJ73sLwH2QPJTvMuZ1N
         SAmsrrd+afnQ8L/sHtJeaFjg3UHq8o+sswLBn3x8xi8qPK8iv5IM+6YhLC/hA59bHdQs
         MIr/ayBlGHyF1YZtqYZT0jrBrif+gokuZYXb6wrhsfRJmMOFcC7KCqNVCvzoER4mnYDa
         vDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965402; x=1774570202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wfzgvzVMeg4WQczJDrBbctjHV7qEIQWsbnU0+vLey0=;
        b=cj7+arMNozR/7odaIygGH2IeoqmGJ3JB5N+DJDtU8SmE1ZeaZ8aEcMOVBmPsLm8+ap
         f7KLUYo6+lPpmMb/UkUreVvPkzauaZ/D3/KQxtvw+4lXpKBduBoEc7gZbI2MvpLVZ8M7
         DqW7B5TtiDXioueGF77mo/D+of5sxUW9nwXnunOifpENPhkIdyXX9STecAOun0eH6DBh
         heXmYyBJNu0z8Aw3DBBBUk8caH1Sa8ChdSSJf104WCBs0iZi0A80JywrPwySuYymu3JM
         VN0xaRw1AjTgVfyULrr07cxmDB43ix04NZE/ARg3x6tQSHTxWasCZ8lVoo4+LCINACxf
         aL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWJfaSeqCR0s0rqM+jan/ssqhAbZ3xD8uQcEuBxaZR528BV6sPNpAnrjgK3V8mdr78extdpInPgabdyX/HzIX0+C48@vger.kernel.org
X-Gm-Message-State: AOJu0YydjlJC0RN9rjsn6i02wyIbQrBeLBoUWqveEwFBPKyu/C+tFrQa
	yj0QZzTusILCHwvcmAIlo7Xn5d6CPSnsMx3AtAb2WHZRnTkoy0Ixvf0j
X-Gm-Gg: ATEYQzxZ1RUtJ8feQGjOWjZ4+MPiCfPh/x9u/kjYR1qtFzonuq+xrrG/bSxLXI0VFaI
	SlyrCPUGpbDbEzUWllnLN8+mMyMnbji1lImNr1YFb6PdgOAuILV/hlXvJBm4l0BItOGQo7Niqkk
	/Zra4CkvVAIgz0O2JHf7Kr5UFRQ67YDNVBszFZTunaDm3KIuOJ0ffWeB1jr+M3+8+yi4X0IO00+
	+NuST5TQX0L1WnFsjJ+MYIXoFXjbM0i6rKJ4Ix4jsC1uAC0h0be7nwYEozyzIVoSp8MhjoLHPcE
	0YDgLabl1K4pVsDrVhm9z8WH+APlxWh3azjHBzhPvQmkGMkzaoqpjOcErAq+LR7/bxDlCyVGLzC
	nJhhCkpG8DPhief8DT5pqAVy+5acfPEVTe+ibwajNXUY61vsdMPfcZ3WC0sv+4RrdK2sqdmBYzH
	Od5KBzu/u1bbrXtscn7Y4UfQ==
X-Received: by 2002:a05:7300:7fa2:b0:2c0:c482:7ed with SMTP id 5a478bee46e88-2c109567b49mr625937eec.7.1773965402272;
        Thu, 19 Mar 2026 17:10:02 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:10:01 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH 3/5] platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
Date: Thu, 19 Mar 2026 17:09:31 -0700
Message-ID: <20260320000937.9177-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
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
  INT3479 (OV5670): GPIO3 = reset (active-low), GPIO4 = powerdown (active-low)
  INT3477 (OV8858): GPIO9 = s_resetn (active-low), GPIO7 = s_enable (active-low)
    GPIO9 and GPIO7 are the TPS68470 secondary-port GPIOs (SGPO reg 0x22
    bits 2 and 0), not regular GPDO outputs.

Regulator mapping:
  CORE  -> dvdd  / INT3477
  ANA   -> avdd  / INT3477
  VIO   -> dovdd / INT3477
  VSIO  -> avdd  / INT3479 and vsio / INT3477 (always_on: keeps S_I2C_CTL
           non-zero from boot so OV8858 is reachable on I2C2 at any time)
  AUX1  -> dvdd  / INT3479
  AUX2  -> dovdd / INT3479

Marking VSIO always_on ensures the TPS68470 S_I2C passthrough is active
from the moment the PMIC driver probes, eliminating a timing dependency
between TPS68470 and ov8858 probe ordering.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a036..a5b469dcb 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -287,6 +287,162 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+/* Settings for Dell Latitude 5285 2-in-1 */
+
+static struct regulator_consumer_supply dell_5285_int3477_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3477_vio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT3477:00"),
+};
+
+static struct regulator_consumer_supply dell_5285_int3479_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT3479:00"),
+	/* S_I2C_CTL: must be enabled for OV8858 I2C daisy-chain access */
+	REGULATOR_SUPPLY("vsio", "i2c-INT3477:00"),
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
+static const struct regulator_init_data dell_5285_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3477_vio_consumer_supplies),
+	.consumer_supplies = dell_5285_int3477_vio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_5285_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+		/*
+		 * Keep S_I2C_CTL enabled from boot so OV8858 I2C daisy-chain
+		 * is accessible before ov8858 driver probes.
+		 */
+		.always_on = 1,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_5285_int3479_vsio_consumer_supplies),
+	.consumer_supplies = dell_5285_int3479_vsio_consumer_supplies,
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
+		[TPS68470_VIO]  = &dell_5285_tps68470_vio_reg_init_data,
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

