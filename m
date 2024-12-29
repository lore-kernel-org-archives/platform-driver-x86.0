Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE419E99A;
	Sun, 29 Dec 2024 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501649; cv=none; b=GvJd8vVxUbRRgNLjxdP3IBPNBjuLXLZHgiybF5wf8gzntXOy28OEYN8JrJ9DMZEkc7bKfhJhBIvfjYWlwK9esezJHt1MjbMhsKrx/lt/0SudTlj3QEb3d06K0mAJbA7X1T63zOpcwynU/fXifuYg8Ecyxt6sj6r2Esm/+6vUnaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501649; c=relaxed/simple;
	bh=isbCBWsER+/P8/JGRxSV7TeNn/5DPpTS/sBZWC8Ctzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L19Nd/Wp5F9nT/aJedu8XIxTVcmP1OCSO9WrgoipGWwMqRJZCEXi8SGUasQ9FL18mH143PYdsjf8QmVgEevvuXZLgF6IIQle9nbj65kviiLLcpOmObLHjXL54USKztYoQHZS5VXaGfCi0VVJrGP8PL7nhknR7+N7Pv+rKNVjVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLll3G/c; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLll3G/c"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4aff5b3845eso3039942137.2;
        Sun, 29 Dec 2024 11:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501645; x=1736106445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9i+jhh7wTuhTUeqzzh8ME3rhMPtSRPIGx41BiGVKyI=;
        b=JLll3G/cRtQn4IvOU9fzREZe9g5SAzhd/jSg7rDHFxGmIkoiObV0x1MHoQcQDBCqtK
         RjCu5Kjn17ZBarMJoHtMbiBhF//nGsVyiqhkXFO0TVfsmyf+Jivsc88S/lOQSRtYaL/d
         kHFoWHxYXcCAxVXUB4V62ciLFuFL56zZ6pPYb7i/45y6vFPMAGcjbsrHKJmCm2mv7wIX
         Sye8Zm/KM8D277E7U3KDxsWrp6veHKXR7paWnnvCQ713UvrMp+4EsGGjdIiRaAnk6Zkr
         w0MXe0OPRRgstsAjnFbrzlAyUgrGkgfF2pNEYmKrs/J9SymSIIu6vwNTQ59KKwUMjGV2
         dj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501645; x=1736106445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9i+jhh7wTuhTUeqzzh8ME3rhMPtSRPIGx41BiGVKyI=;
        b=oCXgnyZxuZwqMW0zA7z4YuW/xMjIhU14n/Nf85zc4wibmwTbaluV2bmqCnU2TAMkX0
         JeSHH4BHGqHxDfVfWdKImWKe5W+NKWBoMI4m23zqECUugyt29okWdgiS6PRK4ir3DUWt
         /IZTsjB3U6qGQn1YTInFkIJckJYPnHxSG9BMgmX6PF/RBZpp1F6s15tBJv2Vd5k7bTTN
         Gx5DIto2A6XH8AzHFUf/YG3RV2j678MokGGQ//wcMtIGIUh1+XX8IJG16h1zDRwUIllr
         WtVozOhxA++a0vIa3UdeD0OF5Wedwxc+0oVVzOkyg8uB3pm9ip5NtexWWAfJeackACaS
         7Tyw==
X-Forwarded-Encrypted: i=1; AJvYcCXm26cX4ClHc88O8aWuVl6fRc/U38faWmbYWw2Pbv1k1Ju0Ov9AH4ZqkCIbQROG3TTLlEh1Y/+AL124v5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKNI1iWZIzQJcsmMXASDRuGil7UQYw81RuyQK1BeBVpWOalBZ
	ZpuhpZhrGBwnPZ4wD+IsGkQC8JObyDV4jy+8gUS/UcPiBjlWKGY8yfbCjw==
X-Gm-Gg: ASbGncve9nGUOqVrWiFq4G7Gi7pFGEDWi4GITMvApQYeVtR1mmuF4yjg2mAKw1R9zCc
	gnzXrE27pPmbXolAA6aOH7TF+yg54HbYKYp9X6NXRj+kBo7xpb4C62ESoAoMbo+rGojQ8nvNFiB
	obYwtI+FnIZ5dPWX2mPTlBI0Fy3oU4uGv3xw7AQpLQPnmLGqzzGu93lj1CtArMfczkPNy1rh5ze
	LEQW1VSS09Vv/vgWpUY9OcN0nVnqD0LAmzjwhLHLOecKFai+L0+ThMzndii4rI6
X-Google-Smtp-Source: AGHT+IEDWHtxqbzdyTgwJgL47maMweBUEnSeYdiz1HStJOVWDr8TsNNMzo84kiMyOOkYDmRjKg+Hsg==
X-Received: by 2002:a05:6102:3751:b0:4b2:73f7:5adf with SMTP id ada2fe7eead31-4b2cc351714mr26181888137.9.1735501645417;
        Sun, 29 Dec 2024 11:47:25 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:24 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 13/20] alienware-wmi: Split DMI table
Date: Sun, 29 Dec 2024 14:45:00 -0500
Message-ID: <20241229194506.8268-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split thermal features into a new DMI table to support upcoming file
split. While at it rename quirk_entry -> alienfx_features and change
hdmi_mux, amplifier and deepslp types to bool, because they are already
being implicitly used as bools.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 319 ++++++++++------------
 1 file changed, 147 insertions(+), 172 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index f80e7d488b9d..b9daf22efdbe 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -113,97 +113,63 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
 	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-struct quirk_entry {
+struct alienfx_quirks {
 	u8 num_zones;
-	u8 hdmi_mux;
-	u8 amplifier;
-	u8 deepslp;
-	bool thermal;
-	bool gmode;
+	bool hdmi_mux;
+	bool amplifier;
+	bool deepslp;
 };
 
-static struct quirk_entry *quirks;
+static struct alienfx_quirks *quirks;
 
 
-static struct quirk_entry quirk_inspiron5675 = {
+static struct alienfx_quirks quirk_inspiron5675 = {
 	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_unknown = {
+static struct alienfx_quirks quirk_unknown = {
 	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_x51_r1_r2 = {
+static struct alienfx_quirks quirk_x51_r1_r2 = {
 	.num_zones = 3,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_x51_r3 = {
+static struct alienfx_quirks quirk_x51_r3 = {
 	.num_zones = 4,
-	.hdmi_mux = 0,
-	.amplifier = 1,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
-};
-
-static struct quirk_entry quirk_asm100 = {
-	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
-};
-
-static struct quirk_entry quirk_asm200 = {
-	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 0,
-	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = true,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_asm201 = {
+static struct alienfx_quirks quirk_asm100 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 1,
-	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_g_series = {
+static struct alienfx_quirks quirk_asm200 = {
 	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = true,
-	.gmode = true,
+	.hdmi_mux = true,
+	.amplifier = false,
+	.deepslp = true,
 };
 
-static struct quirk_entry quirk_x_series = {
+static struct alienfx_quirks quirk_asm201 = {
 	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = true,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = true,
+	.deepslp = true,
 };
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -240,42 +206,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_asm201,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware m17 R5",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware m18 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware x15 R1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware x17 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
-		},
-		.driver_data = &quirk_x_series,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Alienware X51 R1",
@@ -303,60 +233,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_x51_r3,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G15 5510",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G15 5511",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G15 5515",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G3 3500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G3 3590",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G5 5500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
-		},
-		.driver_data = &quirk_g_series,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Dell Inc. Inspiron 5675",
@@ -411,7 +287,7 @@ struct awcc_priv {
 
 struct alienfx_priv {
 	struct platform_device *pdev;
-	struct quirk_entry *quirks;
+	struct alienfx_quirks *quirks;
 	struct led_classdev global_led;
 	struct color_platform colors[4];
 	u8 global_brightness;
@@ -432,6 +308,103 @@ struct alienfx_platdata {
 
 static u8 interface;
 
+struct awcc_quirks {
+	bool gmode;
+};
+
+static struct awcc_quirks g_series_features = {
+	.gmode = true,
+};
+
+static struct awcc_quirks x_series_features = {
+	.gmode = false,
+};
+
+static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware m17 R5",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Alienware m18 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Alienware x15 R1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Alienware x17 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+		},
+		.driver_data = &x_series_features,
+	},
+	{
+		.ident = "Dell Inc. G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G15 5511",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G15 5515",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G3 3500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G3 3590",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
+		},
+		.driver_data = &g_series_features,
+	},
+	{
+		.ident = "Dell Inc. G5 5500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
+		},
+		.driver_data = &g_series_features,
+	},
+};
+
+struct awcc_quirks *awcc;
+
 static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 				 void *in_args, size_t in_size, u32 *out_data)
 {
@@ -1013,7 +986,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 {
 	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		u32 gmode_status;
 		int ret;
 
@@ -1079,7 +1052,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
@@ -1319,7 +1292,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	struct platform_device *pdev;
 	int ret;
 
-	if (quirks->thermal) {
+	if (awcc) {
 		ret = alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
@@ -1335,7 +1308,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 
 static void wmax_wmi_remove(struct wmi_device *wdev)
 {
-	if (quirks->thermal)
+	if (awcc)
 		alienware_awcc_exit(wdev);
 	else
 		alienware_alienfx_exit(wdev);
@@ -1359,6 +1332,18 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 
 static int __init alienware_wmax_wmi_init(void)
 {
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(awcc_dmi_table);
+	if (id)
+		awcc = id->driver_data;
+
+	if (force_platform_profile)
+		awcc = &x_series_features;
+
+	if (force_gmode)
+		awcc = &g_series_features;
+
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
@@ -1375,16 +1360,6 @@ static int __init alienware_wmi_init(void)
 	if (quirks == NULL)
 		quirks = &quirk_unknown;
 
-	if (force_platform_profile)
-		quirks->thermal = true;
-
-	if (force_gmode) {
-		if (quirks->thermal)
-			quirks->gmode = true;
-		else
-			pr_warn("force_gmode requires platform profile support\n");
-	}
-
 	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
 		interface = WMAX;
 		ret = alienware_wmax_wmi_init();
-- 
2.47.1

