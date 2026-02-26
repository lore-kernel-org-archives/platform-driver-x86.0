Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768E372B51;
	Thu, 26 Feb 2026 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139196; cv=none; b=baMUOpCAkg1WIs6yPFeq7Qs0ezTPODN7HyZzuIG0BAXQNDCM32FWu9GhHyRUOKa0FD9ixrtjY/01rXVXT/p7EOxfeiRHEaitvknjOAYhJK6ehKvPPf40EN4qCH68zkalDyX+KYD4bNBciC45QvcF5fa36Szt1BbcogjdU5aTeg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139196; c=relaxed/simple;
	bh=VdMPETgo98ebcQxIQ4F7fm6PoHt0igthEs7Sa4AIu8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYnQqbJ36tORZpP7d9oVWgGWur7qFQJ4w+bYdr24s5uOZ2LK38gvKMsw7nvI8lEX6PX1xpVQ7aMP+WEW6Q2mYzBtac662bWHv4vzG9KUPbNMjfR85urny+GRG0Qt9tU/4oDR2U/l+EVbViCAnl+KuxOJvEtvJvbyezE8+4ynUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZTihD4HQ; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZTihD4HQ"
Received: from wse-pc.fritz.box (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 9D2272FC0055;
	Thu, 26 Feb 2026 21:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772139192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PAU9CK7VJq1K60tvkMKvuSHxfpLvnkrlRpDxEnvCV2k=;
	b=ZTihD4HQNzcbBKsW855qYXap+qJSxGebbKyGVgyvf7wf+IZPxGdXh7bvhkfgEkIsmOX1a+
	NPKqCUZEBhizx/QmPzfAUaC6UgeoSqzFTmWijb5PsdIZdC14x6QvplwpiDVTPEmi2U5B7u
	1j4BmEcB5xgEGH6UmM+WR5AAmnMIS/4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] platform/x86/uniwill: Apply features across all TUXEDO devices
Date: Thu, 26 Feb 2026 21:50:03 +0100
Message-ID: <20260226205302.123782-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226205302.123782-1-wse@tuxedocomputers.com>
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uses the more fine granular and/or new feature defines to enable more
features across the TUXEDO device lineup.

Also adds features defines that where already present, but not tested until
now.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 214 ++++++++++++++------
 1 file changed, 156 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index a34b1eed74eb2..f54b27ae832d2 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -110,6 +110,8 @@
 #define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
 
 #define EC_ADDR_PROJECT_ID		0x0740
+#define PROJECT_ID_PH4TRX1		0x12
+#define PROJECT_ID_PH6TRX1		0x15
 
 #define EC_ADDR_AP_OEM			0x0741
 #define	ENABLE_MANUAL_CTRL		BIT(0)
@@ -1821,6 +1823,15 @@ static struct platform_driver uniwill_driver = {
 	.shutdown = uniwill_shutdown,
 };
 
+static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
+};
+
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
@@ -1844,6 +1855,85 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 		    UNIWILL_FEATURE_SECONDARY_FAN,
 };
 
+/*
+ * The featuresets below reflect somewhat chronological changes:
+ * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
+ * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC firmware.
+ * Some devices might divert from this timeline.
+ */
+
+static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
+static struct uniwill_device_descriptor tux_featureset_1_nvidia_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
+static struct uniwill_device_descriptor tux_featureset_2_nvidia_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+};
+
+static struct uniwill_device_descriptor tux_featureset_3_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN,
+};
+
+static struct uniwill_device_descriptor tux_featureset_3_nvidia_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+};
+
+static int phxtxx1_probe(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value == PROJECT_ID_PH4TRX1 || value == PROJECT_ID_PH6TRX1)
+		data->features |= UNIWILL_FEATURE_SECONDARY_FAN;
+
+	return 0;
+};
+
+static struct uniwill_device_descriptor phxtxx1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
+	.probe = phxtxx1_probe,
+};
+
 static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
 {
 	unsigned int value;
@@ -1854,37 +1944,45 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
 		return ret;
 
 	if (value & HAS_GPU)
-		data->features |= UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
+		data->features |= UNIWILL_FEATURE_GPU_TEMP |
+				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
 
 	return 0;
 };
 
 static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
 	.probe = phxarx1_phxaqf1_probe,
 };
 
-static struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata = {
-	.features = UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
+static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN,
 };
 
-static struct uniwill_device_descriptor empty_descriptor __initdata = {};
-
 static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 	{
-		.ident = "XMG FUSION 15",
+		.ident = "XMG FUSION 15 (L19)",
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
 	{
-		.ident = "XMG FUSION 15",
+		.ident = "XMG FUSION 15 (L19)",
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
 	{
 		.ident = "Intel NUC x15",
@@ -1908,7 +2006,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &phxtxx1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen6 Intel",
@@ -1916,7 +2014,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
@@ -1932,7 +2030,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1940,7 +2038,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Book Pro Gen 8",
@@ -1948,7 +2046,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 16 Gen8 Intel",
@@ -1956,7 +2054,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
@@ -1964,7 +2062,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
@@ -1972,7 +2070,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -1980,7 +2078,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
@@ -1988,7 +2086,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 15 Gen10 Intel",
@@ -1996,7 +2094,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 AMD",
@@ -2004,7 +2102,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -2012,7 +2110,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 AMD",
@@ -2020,7 +2118,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 15 Gen10 Intel",
@@ -2028,7 +2126,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO InfinityBook Max 16 Gen10 Intel",
@@ -2036,7 +2134,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -2044,7 +2142,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 AMD",
@@ -2052,7 +2150,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -2060,7 +2158,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 AMD",
@@ -2068,7 +2166,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -2076,7 +2174,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15 Gen1 Intel",
@@ -2084,7 +2182,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -2092,7 +2190,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 17 Gen1 Intel",
@@ -2100,7 +2198,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 15 Intel Gen1",
@@ -2108,7 +2206,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Trinity 17 Intel Gen1",
@@ -2116,7 +2214,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 AMD",
@@ -2124,7 +2222,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen2 Intel",
@@ -2132,7 +2230,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
@@ -2140,7 +2238,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
@@ -2148,7 +2246,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
@@ -2156,7 +2254,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 15 Gen4 Intel",
@@ -2164,7 +2262,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Polaris 15/17 Gen5 AMD",
@@ -2172,7 +2270,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_2_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen5 AMD",
@@ -2180,7 +2278,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
@@ -2188,7 +2286,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 AMD",
@@ -2196,7 +2294,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim 15 Gen6",
@@ -2204,7 +2302,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -2212,7 +2310,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
@@ -2220,7 +2318,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
@@ -2228,7 +2326,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 AMD",
@@ -2236,7 +2334,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -2244,7 +2342,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Stellaris 16 Gen7 Intel",
@@ -2252,7 +2350,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
 		},
-		.driver_data = &tux_featureset_1_descriptor,
+		.driver_data = &tux_featureset_3_nvidia_descriptor,
 	},
 	{
 		.ident = "TUXEDO Book BA15 Gen10 AMD",
@@ -2260,7 +2358,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &pf5pu1g_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 14 Gen1 AMD",
@@ -2268,7 +2366,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen1 AMD",
@@ -2276,7 +2374,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{
 		.ident = "TUXEDO Pulse 15 Gen2 AMD",
@@ -2284,7 +2382,7 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
 		},
-		.driver_data = &empty_descriptor,
+		.driver_data = &tux_featureset_1_descriptor,
 	},
 	{ }
 };
-- 
2.43.0

