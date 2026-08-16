Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0780433CE9A
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786863686; cv=none; b=DxrmIAkbBzRTEjGPSKObZC6e7/a1cL52kYgDC1Th8Jw2/fdVPZdgwUuG6O/OqFNfBDx5KNAfKr4reU7+Z8nhDbpFwH+zWKPFFuzuOXjfR/+pH4wIpyw8KR2INYdVcWVhmAZfcvGlptZ7THPTZG1M453Ii4pd1DIyfR8erK6/wF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786863686; c=relaxed/simple;
	bh=7tgzoPWzFY5rR9YUevYOk6KErD2WcG+sjkxfdixHkAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owZpN6k6UPNGDL3jBQtKoi8ELkTXsuky58/t7IvL18x2pjMfgAPK4lQcFNJfrs9xYZ+snjqVkecqs9UroAewM9eWt+JJwjLorqRs8JZaGBLSjDE5QRLBSxI3i5w766Fo++XNjZiWHv7TxxUSln2Z45D0Jg4puPxV8iNF0RyRfF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omu+zczR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omu+zczR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f620399a0so2072211a91.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786863684; x=1787468484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOuZBoqirCVlxRk94H9F8kHz9mSaZAp6k7vbbQdUzuA=;
        b=Omu+zczR/jYzXsWwqOlxUdTLNnbSjdXid1XCMykp8to6LP5cc9pB6OPPXaQ6IThYHM
         A3clpxDYwKXZsPRBB9RTUc/ZyjzndX58Aus5WtoqNLf3ZiGj4SYvGBzQYCng+vPcphSA
         6AxfnayfizIaF/gyZzOib6P6CVyKX8l88hOmbF6xOD25jD9tO/L9XDtiyOx9a2cr/2pf
         MPqKsWIMKE1u1hXPHtb6dnkonpiV5sFz77YLVsxegh6wS+gO57ezuaEP/ur/oiys4O10
         cA18hoW4KGwEZbsHBalP4bSyrrekLxV21xrsYc7syX6GZyKClKnYz+N6I6CGRszJOZxf
         w0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786863684; x=1787468484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOuZBoqirCVlxRk94H9F8kHz9mSaZAp6k7vbbQdUzuA=;
        b=EKtrOlyQsQOT5Jxo15jauRiuBgiSdGC6YAeN9zLL31reLV6Wkh1rT7H/mJIsjF7uZL
         gofZzJI0FVyw/6YPpeva24HWLdN3zxBYhbpIB7akZ2IGPoUQxtTLJLohe1voKwCS+cGe
         rKluErc9iHL+wLXAtDztJGP+9xPtgkvt0x5MU/M79SfxnkD9L+MgQCI9OPc8kTvRp9k3
         R5GEnamb4+nsqULclu2YNIBm8NtiGTF89YIIiZKA2+XSQCK9jRRtq5dNEZwxKVwJgIbu
         LRKWjU1ocaUp1PxH8yn+lbt5OgD9tySMJcuJIUhJpDTHRNp3Dyke+68njjYjmYPl9UrL
         CiOQ==
X-Gm-Message-State: AOJu0Ywt0s43/JKtuta9MrHV2RryjFH1DObBWoEOvMEfPwMY5m/NZV4u
	CGH2zLoRLBgS607Gbu/+GMgZ4hx2+JjKbqJQ+heFR1M/ZB+5x2XkFjeLGh7Sqchy
X-Gm-Gg: AR+sD115XqKVVPf+TWLoXOhiX8+KbgEHiiTss33os5JBGxyXfB35N6OyiuTtMH9LarH
	0FMB+ReiFiLU9yDADph4InfSRCiLcR/tvdCjfbLtDszzD8R2DiFIFpeVT3nsvlfJy/RPHc/BtWv
	ugE9a25WLlD+Sz6/TuIWMncShaPMWyVm3f+w5muNWwFfLBDiASqUoxVNQADpeOKgK3e/8q7ebUz
	h2UyXumAGTBNWXV7rLkR2b3KIwW5g0QDdhb11t8UIUQWLdAYh/W8mvkgTtwGvF7NZVrizY6NYzw
	I6HVNcUyKHxLccZ1IWRtaDTkWB3cH+oz5r6oBgSMMZrqKKHV6T6pCiBgOmOfn0c0s2+VYjuJfpn
	VLioIkkyPI3JmOR4Ys/5MlHYUwX+U98xp46vgUZpiwnqA3pBSEUJhNiOcjYe5oJakhOuTnLWig5
	dYhFoWT0VuiLMo9pQOnsZrh+n52YcwzC4kOrD5levi36W4kNDaN1KapuiS6uovm+g6EPXDWLb4N
	B7INtl5NHzWHA==
X-Received: by 2002:a17:90b:3c44:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3933bf4ac9amr19927427a91.21.1786863683967;
        Sun, 16 Aug 2026 00:01:23 -0700 (PDT)
Received: from sahan-Latitude-7320-Detachable ([203.87.98.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03e1sm22632612eec.16.2026.08.16.00.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:01:23 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@cdrolet.dev,
	linux-kernel@vger.kernel.org,
	Sahan Nissanka <adee.sahan@gmail.com>
Subject: [PATCH v2] platform/x86: int3472: Add TPS68470 board data for Dell 7320 Detachable
Date: Sun, 16 Aug 2026 17:01:03 +1000
Message-ID: <20260816070108.9308-1-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell Latitude 7320 Detachable has two MIPI cameras behind an Intel
IPU6, both powered by a TPS68470 PMIC. Without board data the PMIC
driver fails:

  int3472-tps68470 i2c-INT3472:07: error -ENODEV: No board-data found
  for this model

and because the sensors declare an ACPI _DEP on the control logic they
are never enumerated at all - no i2c client is created for either of
them, so nothing can bind them.

Add board data for the front sensor, which ACPI describes as OVTI5678.
Reset is on tps68470-gpio 5, active low. There is no powerdown pin.

On its own this patch clears the -ENODEV, registers the seven rails and
the reset lookup, and lets the two i2c clients be created. No sensor
driver binds yet: ov5675 does not recognise the OVTI5678 ACPI id, and
that is a separate change to a different subsystem which this patch does
not depend on.

The reset line was established by making the probe fail rather than by
observing that the camera works: held physically low the sensor does not
identify, held high it does, and driving tps68470-gpio 3 has no effect
either way. That distinction matters here, because the sensor probes
with no pin assignment at all - the line sits released by default - so a
wrong mapping is invisible in normal operation. Charles Drolet found
this and ran the control test; it has since been reproduced on a second
Latitude 7320 Detachable, three trials per condition, which also
confirms the board data describes the model rather than one machine.

The individual supply assignment could not be determined. The sensor's
i2c bus only responds when VSIO, AUX1 and AUX2 are all enabled together,
so no experiment here distinguishes which rail feeds avdd, dvdd or
dovdd, and the voltages suggest these rails act as enables for
regulators further down rather than as the supplies themselves. What is
established is that this set of rails must be enabled: with the
conventional ANA/CORE/VSIO mapping the sensor does not respond at all.

The rails that have no consumers are given their own regulator_init_data
rather than borrowing the Dell 7212's. They hold identical values today,
but sharing them couples two unrelated machines: the 7212 has a second
camera that is not registered yet, and adding it would mean giving those
structures consumer supplies, which this board would then silently
inherit.

Note the control logic here enumerates as INT3472:07, not :05 as on the
other Dell models in this file. The board data lookup matches on DMI and
device name, so this has to be exact. Note also that a Dell Latitude
7320 laptop exists which is a different machine without an IPU6, hence
"detachable" throughout.

The rear OVTI8856 sensor shares this PMIC. It is left out deliberately:
it needs changes to ov8856 beyond board data, and it exhibits a suspend
regression that the front sensor does not, so it belongs in its own
patch.

Co-developed-by: Charles Drolet <linux@cdrolet.dev>
Signed-off-by: Charles Drolet <linux@cdrolet.dev>
Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
---
Rebased onto v7.2-rc7; v1 was generated against v7.0, before the MSI
Prestige AI+ Evo and Intel NVL entries landed in this file.

Changes since v1 [1]:
 - Reset is on tps68470-gpio 5, not 3. Established by holding the line low
   and making the probe fail, with gpio 3 driven as a control; reproduced
   on a second Latitude 7320 Detachable, three trials per condition, which
   also shows the board data describes the model and not one machine.
 - Dropped the powerdown lookup rather than correcting it. ov5675.c only
   ever requests "reset", so no "powerdown" con_id was ever looked up.
 - Dropped the CLDB C0W4=3 corroboration from the commit message. It
   agreed with the wrong pin.
 - Rewrote the supply paragraph. v1 claimed the rail assignment was
   confirmed on hardware; it is not determinable here, because the
   sensor's i2c bus only responds when VSIO, AUX1 and AUX2 are all
   enabled together. What is established is that this set of rails must
   be enabled, not which one feeds which supply.
 - Gave the consumerless rails their own regulator_init_data instead of
   sharing the Dell 7212's. The values are identical today, but the 7212
   has a second camera that is not registered yet; adding it would mean
   giving those structures consumer supplies, which this board would then
   silently inherit. Suggested by Charles Drolet.
 - Declared VIO always_on at VSIO's voltage, as the Surface Go entry does,
   rather than valid_ops_mask = REGULATOR_CHANGE_STATUS as inherited from
   the 7212 in v1. This corrects the description, not the behaviour: VIO
   is registered with tps68470_always_on_reg_ops, which implements neither
   .enable nor .disable, so v1 declared a capability the ops do not
   provide and the rail is on either way. Confirmed on hardware - VIO
   comes up with use_count 1 and no sysfs "state" attribute, which is the
   always_on signature and not seen on the other six rails.
 - Named everything dell_7320_detachable_* rather than after the sensor.
   A product may carry several sensors, the same sensor may be wired
   differently elsewhere, and a Dell Latitude 7320 laptop exists which is
   a different machine without an IPU6. Also suggested by Charles Drolet.
 - Added Co-developed-by/Signed-off-by for Charles Drolet, who found the
   reset line and ran the control test. He also booted an earlier draft of
   this patch on v7.2-rc7, applied by hand, and confirmed the -ENODEV is
   gone with no other effect; the VIO change below postdates that test.
 - Sent standalone. Patches 2/3 and 3/3 of the v1 series are held pending
   the discussion on 2/3 [2] about non-Bayer output and the metadata
   series; this patch does not depend on them.

No tps68470_gpio_swnode: the daisy-chain-enable property exists to put
GPIOs 1 and 2 into input mode for the PMIC's i2c pass-through, which this
machine does not use - both sensors are direct ACPI i2c clients.

[1] https://lore.kernel.org/all/20260809042540.15849-1-adee.sahan@gmail.com/
[2] https://lore.kernel.org/all/anmHRjxruBaYQRaC@kekkonen.localdomain/

 .../x86/intel/int3472/tps68470_board_data.c   | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c535424..2312c26 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -369,6 +369,102 @@ static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata =
 	},
 };
 
+/* Settings for Dell Latitude 7320 Detachable */
+
+static struct regulator_consumer_supply dell_7320_detachable_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI5678:00"),
+};
+
+static struct regulator_consumer_supply dell_7320_detachable_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5678:00"),
+};
+
+static struct regulator_consumer_supply dell_7320_detachable_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI5678:00"),
+};
+
+static const struct regulator_init_data dell_7320_detachable_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+};
+
+static const struct regulator_init_data dell_7320_detachable_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+};
+
+static const struct regulator_init_data dell_7320_detachable_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+};
+
+/* Ensure the always-on VIO regulator has the same voltage as VSIO */
+static const struct regulator_init_data dell_7320_detachable_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.always_on = 1,
+	},
+};
+
+static const struct regulator_init_data dell_7320_detachable_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_7320_detachable_vsio_consumer_supplies),
+	.consumer_supplies = dell_7320_detachable_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_7320_detachable_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 1213200,
+		.max_uV = 1213200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_7320_detachable_aux1_consumer_supplies),
+	.consumer_supplies = dell_7320_detachable_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_7320_detachable_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(dell_7320_detachable_aux2_consumer_supplies),
+	.consumer_supplies = dell_7320_detachable_aux2_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data dell_7320_detachable_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &dell_7320_detachable_core_reg_init_data,
+		[TPS68470_ANA]  = &dell_7320_detachable_ana_reg_init_data,
+		[TPS68470_VCM]  = &dell_7320_detachable_vcm_reg_init_data,
+		[TPS68470_VIO]  = &dell_7320_detachable_vio_reg_init_data,
+		[TPS68470_VSIO] = &dell_7320_detachable_vsio_reg_init_data,
+		[TPS68470_AUX1] = &dell_7320_detachable_aux1_reg_init_data,
+		[TPS68470_AUX2] = &dell_7320_detachable_aux2_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -411,6 +507,14 @@ static struct gpiod_lookup_table intel_nvl_tps68470_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table dell_7320_detachable_gpios = {
+	.dev_id = "i2c-OVTI5678:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 5, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct property_entry int3472_tps68470_daisy_chain_gpio_props[] = {
 	PROPERTY_ENTRY_BOOL("daisy-chain-enable"),
 	{ }
@@ -469,6 +573,15 @@ static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data =
 	},
 };
 
+static const struct int3472_tps68470_board_data dell_7320_detachable_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:07",
+	.tps68470_regulator_pdata = &dell_7320_detachable_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&dell_7320_detachable_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -529,6 +642,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&intel_nvl_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7320 Detachable"),
+		},
+		.driver_data = (void *)&dell_7320_detachable_tps68470_board_data,
+	},
 	{ }
 };
 

base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
-- 
2.53.0

