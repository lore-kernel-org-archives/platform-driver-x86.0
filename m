Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495019F121
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Aug 2026 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249613; cv=none; b=sN9Tx66GL4hLtRM6tp8GTS9zBd4ieaN54/s16gE+AOzoEpwGiZwPZ+XJKFsq1neVjdaMOtM72JFCAzRnR4vmgHldeXDEaF66BYuO37tXxvo1HJNvsQ0Ek9eIKYRjcNdmjTIqxUlJ/F2zgPlqElDzhyO4kU/hlOCnChLDHtqY65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249613; c=relaxed/simple;
	bh=ouw44kHGedVeO0E+hLA3fb+FxAY3evm4VsKzPJMMlpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eekgHTEwjG3hWLPXHLoyquD0/Sm65qWqAE5XwSBWTmte+FMeKtVsWpzKR0hr9XAgP5Hw45CBiYrLShSQAAYubtpUvZPTZNapcb5Pyo08/s1wKTdMZlQH8XzxTsLVVGTPZyaPnzMWvu1iRoPaYL2880lmSkKq37dpmOSgKk4ELc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEV1LNeI; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEV1LNeI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e58034d05so764858a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Aug 2026 21:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786249611; x=1786854411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGeSbVJTIYqzecVclabk6CPYlIjPO3PArrjverwRDGI=;
        b=ZEV1LNeIQSQpAJeWQFEPIe7fZFsu3HLT9fQa/W37rjWm+TydYLH4/8gGDHnp3ptDZh
         Xxt2JBORx9GxIZo9t4L5iG5kw7sMM1yCmtvpCiR1Uxa99LCIdk30IJJyGtxQZjRGrQlr
         VqClo+JrSTy9fFe3/1dPcMxwuHh4XZJF4F2o92Sf5E/e00I6L8cFgCMVrmjbjvTgMp9d
         RYkrJkn6elyT2NZk8eMdA+sPClgrzfHM8gmnP/ux/ayh5oloa3uXSo6bWcLbYebU4lT1
         5hB7ERY5w8zR5FyjtjXfA5TpVMJlIU3D0sD/waleTzd18Q+hxZ8rZi57DhTLReTgr1VN
         uN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786249611; x=1786854411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGeSbVJTIYqzecVclabk6CPYlIjPO3PArrjverwRDGI=;
        b=Ku2OM3b4I2kXoGQ45xO1ZDuHONtO2TUkQewgH1OG8sf/ywD1yKVW5m524Fym/qgUBY
         Dg0XRfcUOz2t/LKVOXouVN87DnO1ermk6w7a7v4/O9Qpxekeq4y4OzVDrK3rE2abiiGp
         MktTgOqf6POw4QNjmj6ZUYw98o+Xg6QWTfaqKlx0KrZOe/Fe911gwol4ebOKjLV2JgVg
         eLR8kjGTXZnW08A5dHthl5tU4MoGGBGBdn8nbYYtZJJqEOh6Ta904REleRb+scrYacaP
         AXVBRzagMdgoUiOGEeIMPlxF8as/1+5eJtfC/SLcU44WfEUsjIcjV/qFWZ/mJjdXThtd
         LHzg==
X-Gm-Message-State: AOJu0YwyeVFEzwiEg4uGep1/qUJ7LMcR3iyWyFe91HaJPtrK3Od0+lMd
	x/j+jY4JhJrbge4ERzrUdq20q/B+Fw+VedZDw1HnQHA8VTCjx3X7JP8dvDxYjvps
X-Gm-Gg: AR+sD11gk9BuHLDZBFeJMj6ukoNk27Pkv+ndyMyd+e7FYVYqdPpMKQ+snudb4MJJj7Z
	87qcSDEX5nxI/TR8Ek8mnAh0SNOrfDELBOaXyxQnTjTmobgUKXvfjYWntfyeA4JvH7ljyoa6+fM
	PVFHY+G4nmpxV5tceATkIkFsWKZXxUmK2sLhM4olaSDpjpJMUOpkfkukAOMXT6gDrjpS2/uOPJ9
	2QOC1IeVjys3NNyP4PL38f1VpgzLuiKzD5ZdSibr7ilBPbdRJSX2wtYOFmfF/2gLlwFuA6Xjb9Z
	KYNJ0ZAA6cWUcjFnFOcnYpECEE7MgO5ulTY+TuRbdVmh07CEZJbzCioWHTthzDhF1eTb+ahXAPl
	wtaAyLPMyTMqoGXulDWBFUmGNp4HAtwlYEt1qTE+sqap7MH1LTl0US2XRmlk67+DwA180Buwiau
	JdEF+219c74Khcy3vnGuU6IoKBqZfpCa9d092uTYsZNZz0QjbfsXZ6B9D7jwbkXUZglEhEBhaeu
	Hn6hzAeJweM70IG/N/QXPhvKE053/KoeuglCbrYaaTb4VJq8aeItdT5lN0Nlys=
X-Received: by 2002:a17:90a:da83:b0:38e:2c8f:a01a with SMTP id 98e67ed59e1d1-3903c5d2f8bmr34453647a91.11.1786249611305;
        Sat, 08 Aug 2026 21:26:51 -0700 (PDT)
Received: from prof-g-y-land-Latitude-7320-Detachable (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm21659516c88.3.2026.08.08.21.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 21:26:50 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: int3472: Add TPS68470 board data for Dell 7320 Detachable
Date: Sun,  9 Aug 2026 14:25:17 +1000
Message-ID: <20260809042540.15849-2-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809042540.15849-1-adee.sahan@gmail.com>
References: <20260809042540.15849-1-adee.sahan@gmail.com>
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
The GPIO and rail assignments are the same as on the Dell 7212 and the
Dell 5290 2-in-1: reset on tps68470-gpio 3, powerdown on 4, and
VSIO/AUX1/AUX2 feeding avdd/dvdd/dovdd. This was confirmed on the
hardware - with these settings the sensor powers up and acknowledges on
i2c, and with the conventional ANA/CORE/VSIO mapping it does not. The
CLDB buffer read from this machine also carries C0W4=3, agreeing with
reset on GPIO 3.

The rails that have no consumers are wired as on the Dell 7212, so reuse
those regulator_init_data rather than duplicating them.

Note the control logic here enumerates as INT3472:07, not :05 as on the
other Dell models in this file. The board data lookup matches on DMI and
device name, so this has to be exact.

The rear OVTI8856 sensor shares this PMIC but its GPIO assignment is not
yet known, so it is left out for now.

Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 71357a0..f32a884 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -232,6 +232,69 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
 	},
 };
 
+/* Settings for Dell Latitude 7320 Detachable */
+
+static struct regulator_consumer_supply ovti5678_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-OVTI5678:00"),
+};
+
+static struct regulator_consumer_supply ovti5678_aux1_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-OVTI5678:00"),
+};
+
+static struct regulator_consumer_supply ovti5678_aux2_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-OVTI5678:00"),
+};
+
+static const struct regulator_init_data dell_7320_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti5678_vsio_consumer_supplies),
+	.consumer_supplies = ovti5678_vsio_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_7320_tps68470_aux1_reg_init_data = {
+	.constraints = {
+		.min_uV = 1213200,
+		.max_uV = 1213200,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti5678_aux1_consumer_supplies),
+	.consumer_supplies = ovti5678_aux1_consumer_supplies,
+};
+
+static const struct regulator_init_data dell_7320_tps68470_aux2_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = 1,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(ovti5678_aux2_consumer_supplies),
+	.consumer_supplies = ovti5678_aux2_consumer_supplies,
+};
+
+/*
+ * The rails without consumers are wired the same way as on the Dell 7212, so
+ * reuse those init_data rather than duplicating them.
+ */
+static const struct tps68470_regulator_platform_data dell_7320_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &dell_7212_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &dell_7212_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO]  = &dell_7212_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &dell_7320_tps68470_vsio_reg_init_data,
+		[TPS68470_AUX1] = &dell_7320_tps68470_aux1_reg_init_data,
+		[TPS68470_AUX2] = &dell_7320_tps68470_aux2_reg_init_data,
+	},
+};
+
 static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.dev_id = "i2c-INT347A:00",
 	.table = {
@@ -258,6 +321,15 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
 	}
 };
 
+static struct gpiod_lookup_table dell_7320_ovti5678_gpios = {
+	.dev_id = "i2c-OVTI5678:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 3, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),
+		{ }
+	}
+};
+
 static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
 	.dev_name = "i2c-INT3472:05",
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
@@ -287,6 +359,19 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
 	},
 };
 
+/*
+ * The control logic on the Latitude 7320 Detachable enumerates as INT3472:07,
+ * not :05 as on the other Dell models here.
+ */
+static const struct int3472_tps68470_board_data dell_7320_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:07",
+	.tps68470_regulator_pdata = &dell_7320_tps68470_pdata,
+	.n_gpiod_lookups = 1,
+	.tps68470_gpio_lookup_tables = {
+		&dell_7320_ovti5678_gpios,
+	},
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -316,6 +401,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&dell_7212_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7320 Detachable"),
+		},
+		.driver_data = (void *)&dell_7320_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.53.0

