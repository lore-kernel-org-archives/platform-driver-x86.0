Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A032172BA9;
	Sun,  5 Jan 2025 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091099; cv=none; b=JqroGv1CO9Unvrzkyg7Kzr2l/fckk8iiW7WVRMt3hdQvd+uwImdL/+PBxQ9ITuv0DjsHPsqBwz00a6NvGBDV5DpVGHOicFhImxrTb038DlQMKY+l5bLhz1gblyXA7TfQPfu1DoV3YpNHiIZEfMaedmo1y95vpSLdFiGbDT0Wo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091099; c=relaxed/simple;
	bh=OyuVpRkJNZLLVat7QatOuAzxH9dy2U3ZTMYj+zDLtys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CF0tNYB/mTD8tGWkZz8mLobIGNusceqzGL3gdxbXdHvuVVBpT+ww/QmNcdflRLU5jct/SZFBhAlOcVCYqcw+kK9dWwwrR/KilXa3cE7OirbNfPsnOT8iKIEhyx6XKlN9ebNXYvnfMnRr7IF5l2JEVdztJfMJIYOUkjH5+m2Tjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVuT+Uay; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVuT+Uay"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afde39e360so3700819137.0;
        Sun, 05 Jan 2025 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091094; x=1736695894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyJvs5chA30E1rE67dWrqqxZyf1MzcbiUQGsWGKe930=;
        b=eVuT+UayGQ8gv5EzF0U9dxNIOLcBEYmAVZ5q2UcgsXmZCzBLEwZq5NrBL3gKweiXJw
         i3jHJpJ5rEDnNESX5G+imnqFCa1wTOE94C+iiU/4962EBTD963nQX8Y5E4d9DWMBsihU
         H/GwzsV9/05Dewnd8LMGrcm1M5ot0tjNaXdZn0eMjPzDWLrraHun/4qdUzzbpWeHUO8Z
         Nc4Kr5XjmImXSsbGAnIbKWEZPTdC0qclX/ZukAWImWkx5gvx63UOTCMgzE1XER3Asns9
         MkJN+Bs3Q3FwU7EMrqHHruJRed7uT+ZtN7JqfKvswlGsk/EQS2HBYZy8jQbbyu8DTMNk
         TNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091094; x=1736695894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyJvs5chA30E1rE67dWrqqxZyf1MzcbiUQGsWGKe930=;
        b=tGayYhUFh7kguov2LGrjD2j1i3xiHCdjXH+Vc6vX8UEvc4ktZQkGJ+3ZSBBmDPzZxH
         hyajldMgkyW29C7TqFMqg8nbJi5p4E3yHzytmYho1walgnTVK+dj1eFLQebaIrTFqUlN
         pTk27WodYGhprKMO4wUTyQWaTRrtltP1BAcRAhOUBdyCdRmvgn3eQYCoQTRqGTZRTbhn
         W1gFIH6OsQYENOQTJwJdhwsc/RyywVjq0daeLpZ7oV5ixFBaMJqyZJxjoaphXtBjhOxl
         OjGydZJzQfiHDFKTS2oLWwhegFE70uywpVi8cT+QpkBcV1pcv1UvbLS6hhAbAfh/hlcP
         HgTA==
X-Forwarded-Encrypted: i=1; AJvYcCVDfyaCwG+5qjfodo+B+aJDDvI16idAPERoVFJTbQUOSanVPIbuGq8e8sVmsUvqu5gFyXE9eCZbMIEdD/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZCScVdW+tt7bQafzQpi1hon1cOELawXhyObJAWTtYJlVNQJs
	gV32a8GeZlNGJgr8hIK3yajmHkK7ylE3rIWxgjOMnXCsXIsiuqkfpadDAQ==
X-Gm-Gg: ASbGncuCOn+pWYS23JaeViCS9xXYl2u1bORsF4cxAHAM4NXsPQvckLDyc4KJwNd4NIz
	0m4G/fb0YxgNZG2eju90dVDJs0U4RpAJa8AcU7yPY1hafrw2FPv/iNNm7xfBxls/dF2M3oyjF3M
	SR9YMkiIPv/GSziEmVrXreI7aMRF0Fk0WPsxrDDv6VwE7P29v6pWEjTBCp4c66Pvutu5/qECJss
	srxnOPGBA/xlrDZgucbDTuDCiNXOyXjlW2EiezQdUEr4WjM+Dpk6+PEduQBMw+T
X-Google-Smtp-Source: AGHT+IHnRnFTTcanvnyb56o8arQpvtL4enqD+t3ggdHTnwKE3y+sA7u2caNxVxZObzqEPAzA+CnQRQ==
X-Received: by 2002:a05:6102:9d8:b0:4b2:5c2a:cc9d with SMTP id ada2fe7eead31-4b2cc3919a0mr45248369137.16.1736091094319;
        Sun, 05 Jan 2025 07:31:34 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:33 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 13/20] platform/x86: alienware-wmi: Split DMI table
Date: Sun,  5 Jan 2025 10:30:13 -0500
Message-ID: <20250105153019.19206-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split thermal features into a new DMI table to support upcoming file
split. While at it:

Rename quirk_entry -> alienfx_features,
Rename quirks -> alienfx

and change hdmi_mux, amplifier and deepslp types to bool, because they are
already being implicitly used as bools.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 337 ++++++++++------------
 1 file changed, 158 insertions(+), 179 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index c75ad7ef3d54..e2fcb95b506c 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -113,102 +113,68 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
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
+static struct alienfx_quirks *alienfx;
 
 
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
+	.hdmi_mux = false,
+	.amplifier = true,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_asm100 = {
+static struct alienfx_quirks quirk_asm100 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_asm200 = {
+static struct alienfx_quirks quirk_asm200 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 0,
-	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = false,
+	.deepslp = true,
 };
 
-static struct quirk_entry quirk_asm201 = {
+static struct alienfx_quirks quirk_asm201 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 1,
-	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
-};
-
-static struct quirk_entry quirk_g_series = {
-	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = true,
-	.gmode = true,
-};
-
-static struct quirk_entry quirk_x_series = {
-	.num_zones = 2,
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
 {
-	quirks = dmi->driver_data;
+	alienfx = dmi->driver_data;
 	return 1;
 }
 
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
@@ -431,6 +307,103 @@ struct alienfx_platdata {
 
 static u8 interface;
 
+struct awcc_quirks {
+	bool gmode;
+};
+
+static struct awcc_quirks g_series_quirks = {
+	.gmode = true,
+};
+
+static struct awcc_quirks generic_quirks = {
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
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware m18 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x15 R1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x17 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5511",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5515",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3590",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G5 5500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+};
+
+struct awcc_quirks *awcc;
+
 static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 				 void *in_args, size_t in_size, u32 *out_data)
 {
@@ -612,7 +585,7 @@ static DEVICE_ATTR_RW(lighting_control_state);
 static umode_t zone_attr_visible(struct kobject *kobj,
 				 struct attribute *attr, int n)
 {
-	if (n < quirks->num_zones + 1)
+	if (n < alienfx->num_zones + 1)
 		return attr->mode;
 
 	return 0;
@@ -620,7 +593,7 @@ static umode_t zone_attr_visible(struct kobject *kobj,
 
 static bool zone_group_visible(struct kobject *kobj)
 {
-	return quirks->num_zones > 0;
+	return alienfx->num_zones > 0;
 }
 DEFINE_SYSFS_GROUP_VISIBLE(zone);
 
@@ -746,7 +719,7 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return quirks->hdmi_mux;
+	return alienfx->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -795,7 +768,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return quirks->amplifier;
+	return alienfx->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -868,7 +841,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return quirks->deepslp;
+	return alienfx->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -1009,7 +982,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 {
 	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		u32 gmode_status;
 		int ret;
 
@@ -1075,7 +1048,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
@@ -1306,7 +1279,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	struct platform_device *pdev;
 	int ret;
 
-	if (quirks->thermal) {
+	if (awcc) {
 		return alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
@@ -1327,7 +1300,7 @@ static void wmax_wmi_remove(struct wmi_device *wdev)
 {
 	struct platform_device *pdev;
 
-	if (!quirks->thermal) {
+	if (!awcc) {
 		pdev = dev_get_drvdata(&wdev->dev);
 
 		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
@@ -1353,6 +1326,22 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 
 static int __init alienware_wmax_wmi_init(void)
 {
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(awcc_dmi_table);
+	if (id)
+		awcc = id->driver_data;
+
+	if (force_platform_profile)
+		awcc = &generic_quirks;
+
+	if (force_gmode) {
+		if (awcc)
+			awcc->gmode = true;
+		else
+			pr_warn("force_gmode requires platform profile support\n");
+	}
+
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
@@ -1366,18 +1355,8 @@ static int __init alienware_wmi_init(void)
 	int ret;
 
 	dmi_check_system(alienware_quirks);
-	if (quirks == NULL)
-		quirks = &quirk_unknown;
-
-	if (force_platform_profile)
-		quirks->thermal = true;
-
-	if (force_gmode) {
-		if (quirks->thermal)
-			quirks->gmode = true;
-		else
-			pr_warn("force_gmode requires platform profile support\n");
-	}
+	if (!alienfx)
+		alienfx = &quirk_unknown;
 
 	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
 		interface = WMAX;
-- 
2.47.1

