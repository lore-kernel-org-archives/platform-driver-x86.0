Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA6B1F37DC;
	Sat, 21 Dec 2024 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760830; cv=none; b=JSsoxl/132suctb5MvnGu+hF1zVJJNjzJQGtZnNPIzkCPMG5m8RJAx8L4juDMjCssRZsNbIfLOuKeCbz0ILxCEqOkFOlJgjbk4S947wpWiFN7tA46FIccuk1KQFiQqL9D40p3WZhtMxN2izFdAxBH2RCb0Oi+P66iQz4uH4pwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760830; c=relaxed/simple;
	bh=DrIzIV1DMACll/OF0N6phO/F5/9wq841zETNjYE8dXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLKDCRtWERf7hfFA1WJM5jLIz8BulcAu9UZpXF1w0BwYJ/v6ZZSqumH4K8vV0wEkiCkVTJ3dMfz4mxJc896uVyNbI172AFSrwpzeV0WlNPQsjVaSIU3mAdtUzTy5O5BUOk+2kwpECDVPjJcJ/Tc2erZP8jOH4lwBNm00MU679EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L440XUCx; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L440XUCx"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6efe5c1dea4so21652527b3.3;
        Fri, 20 Dec 2024 22:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760827; x=1735365627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d9+5jU/06hhg53vfZZYAG7VCLl+nPUljN1BJ6IP4O4=;
        b=L440XUCxxSEAOSEInu3cah6BSGyBLmtUeSWCzi0uj8bennmVJtdQw2rVCAPX+IFfyO
         fX79w7Ip6dsJ79L0kfYURCpJJVNu1nfgxiy6l9V+1npXt+GjAAGQHFfQIoAgf/QQvNsO
         ZTMOJ+oI+0CRL4t5om+8PiC9bO4nxDEbjAKAyEzaWzwcq3nc3RoSj38JfXoyUS3Z441t
         Znx/xEPvwn/X8rxDsdVZXB3bMNb0M5tlAepmE0h+7Wnl1EM+fli6z1KJpXIDOdPNLoCH
         IhnU2gvsJCbcb2PW8o7nPVkyFVcJhp/kHkxfMT4uO0cDVQh90rdsiq8c8RWLlZi++64k
         mazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760827; x=1735365627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4d9+5jU/06hhg53vfZZYAG7VCLl+nPUljN1BJ6IP4O4=;
        b=dJ+JsxZiUF4XaHnYKYK2fMuuOP0gPNA/+8jAQaNqaNX6dHR6plge6PiMr5rZVbpIlq
         wmTIVAgbWRSltwMp94ZszPnAttYAlQd/SvLm95275gqHcdVWKws5IWegCOuW0hjJSE8W
         hYovuJxgrGcTS0bq9PH8mXrnhiGxtkBH+Ms7UmEUzIyKEftcjNmJkC9kNfw0SQ+pIUPH
         IecSmPxH7Qzm4bK2/bfKPd8nc+g+9Sou7nfqwMehnt8h7O70k3B5D8+DIDE03+Q5jwgU
         ChRO0ALovrY1hzm/4l/GsnHssnApr+9urC24XAjMdk61xBfPbnNDDpx7hyBDCqfbD/it
         8TOw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Qx8htxzNDLAn2blhNXEw/6UkmDldX8gS92ZFfEhe5zaGNrWg64Q9BnNDmoeyoxzJGvA+lf3XE+EZC1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6RGR2vu/KTlfQ9E76LU1S+7UvKxqv8plHKOQsCA3SJXoJBefF
	S/Mt3z+GojlrhmvIKPVhdClDW1h4Vvslb5Y34dsfFurcHnEdf6mDqKirSw==
X-Gm-Gg: ASbGncucdO6H+dw+B9Yknt/r2TAwtFn2Wu6TP3h72nUxMcgxX8kSYrLnJ/NavsimDmW
	DfBb4n5u2qMV9VlQGHQxnWopiwH3CwZubzrGjtdfc2xfMjSIj/OrVn9iUHjPc4HcPuGzNpbyXGG
	4HaLmi/YOGQTF/eLZUA5ouba0i+UywJmn8pQ8ydKARnJne/AbfzE/JgIu5ITYvlWhEb40K3zzVv
	5iStakyz654Vvq0m+gu/1vGDnNtwqNTHD5iRTPWPvkpgR1XCRRifxDUj4uMebPS
X-Google-Smtp-Source: AGHT+IGYHXK8OgoPW7YtLt97lf3dPrx340ZG88wSbdB6E9+yt+i/AF12i36R8oKqSLgxDED3zpwTAw==
X-Received: by 2002:a05:690c:6213:b0:6ef:c4e3:1837 with SMTP id 00721157ae682-6f3f8143472mr41761987b3.20.1734760827215;
        Fri, 20 Dec 2024 22:00:27 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:26 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 13/20] alienware-wmi: Split DMI table
Date: Sat, 21 Dec 2024 00:59:10 -0500
Message-ID: <20241221055917.10555-14-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split thermal features into a new DMI table to support upcoming file
split.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 163 +++++++++-------------
 1 file changed, 69 insertions(+), 94 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 0a0b72dc61ea..8ea08f5f8810 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -118,8 +118,6 @@ struct quirk_entry {
 	u8 hdmi_mux;
 	u8 amplifier;
 	u8 deepslp;
-	bool thermal;
-	bool gmode;
 };
 
 static struct quirk_entry *quirks;
@@ -130,8 +128,6 @@ static struct quirk_entry quirk_inspiron5675 = {
 	.hdmi_mux = 0,
 	.amplifier = 0,
 	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
 };
 
 static struct quirk_entry quirk_unknown = {
@@ -139,8 +135,6 @@ static struct quirk_entry quirk_unknown = {
 	.hdmi_mux = 0,
 	.amplifier = 0,
 	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
 };
 
 static struct quirk_entry quirk_x51_r1_r2 = {
@@ -148,8 +142,6 @@ static struct quirk_entry quirk_x51_r1_r2 = {
 	.hdmi_mux = 0,
 	.amplifier = 0,
 	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
 };
 
 static struct quirk_entry quirk_x51_r3 = {
@@ -157,8 +149,6 @@ static struct quirk_entry quirk_x51_r3 = {
 	.hdmi_mux = 0,
 	.amplifier = 1,
 	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
 };
 
 static struct quirk_entry quirk_asm100 = {
@@ -166,8 +156,6 @@ static struct quirk_entry quirk_asm100 = {
 	.hdmi_mux = 1,
 	.amplifier = 0,
 	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
 };
 
 static struct quirk_entry quirk_asm200 = {
@@ -175,8 +163,6 @@ static struct quirk_entry quirk_asm200 = {
 	.hdmi_mux = 1,
 	.amplifier = 0,
 	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
 };
 
 static struct quirk_entry quirk_asm201 = {
@@ -184,26 +170,6 @@ static struct quirk_entry quirk_asm201 = {
 	.hdmi_mux = 1,
 	.amplifier = 1,
 	.deepslp = 1,
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
 };
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -242,133 +208,140 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "Alienware m17 R5",
+		.ident = "Alienware X51 R1",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
 		},
-		.driver_data = &quirk_x_series,
+		.driver_data = &quirk_x51_r1_r2,
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "Alienware m18 R2",
+		.ident = "Alienware X51 R2",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
 		},
-		.driver_data = &quirk_x_series,
+		.driver_data = &quirk_x51_r1_r2,
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "Alienware x15 R1",
+		.ident = "Alienware X51 R3",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
 		},
-		.driver_data = &quirk_x_series,
+		.driver_data = &quirk_x51_r3,
 	},
 	{
 		.callback = dmi_matched,
-		.ident = "Alienware x17 R2",
+		.ident = "Dell Inc. Inspiron 5675",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
+		},
+		.driver_data = &quirk_inspiron5675,
+	},
+	{}
+};
+
+struct awcc_features {
+	bool gmode;
+};
+
+static struct awcc_features g_series_features = {
+	.gmode = true,
+};
+
+static struct awcc_features x_series_features = {
+	.gmode = false,
+};
+
+static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware m17 R5",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
 		},
-		.driver_data = &quirk_x_series,
+		.driver_data = &x_series_features,
 	},
 	{
-		.callback = dmi_matched,
-		.ident = "Alienware X51 R1",
+		.ident = "Alienware m18 R2",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
 		},
-		.driver_data = &quirk_x51_r1_r2,
+		.driver_data = &x_series_features,
 	},
 	{
-		.callback = dmi_matched,
-		.ident = "Alienware X51 R2",
+		.ident = "Alienware x15 R1",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R2"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
 		},
-		.driver_data = &quirk_x51_r1_r2,
+		.driver_data = &x_series_features,
 	},
 	{
-		.callback = dmi_matched,
-		.ident = "Alienware X51 R3",
+		.ident = "Alienware x17 R2",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware X51 R3"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
 		},
-		.driver_data = &quirk_x51_r3,
+		.driver_data = &x_series_features,
 	},
 	{
-		.callback = dmi_matched,
 		.ident = "Dell Inc. G15 5510",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
 		},
-		.driver_data = &quirk_g_series,
+		.driver_data = &g_series_features,
 	},
 	{
-		.callback = dmi_matched,
 		.ident = "Dell Inc. G15 5511",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
 		},
-		.driver_data = &quirk_g_series,
+		.driver_data = &g_series_features,
 	},
 	{
-		.callback = dmi_matched,
 		.ident = "Dell Inc. G15 5515",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
 		},
-		.driver_data = &quirk_g_series,
+		.driver_data = &g_series_features,
 	},
 	{
-		.callback = dmi_matched,
 		.ident = "Dell Inc. G3 3500",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
 		},
-		.driver_data = &quirk_g_series,
+		.driver_data = &g_series_features,
 	},
 	{
-		.callback = dmi_matched,
 		.ident = "Dell Inc. G3 3590",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
 		},
-		.driver_data = &quirk_g_series,
+		.driver_data = &g_series_features,
 	},
 	{
-		.callback = dmi_matched,
 		.ident = "Dell Inc. G5 5500",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
 		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. Inspiron 5675",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
-		},
-		.driver_data = &quirk_inspiron5675,
+		.driver_data = &g_series_features,
 	},
-	{}
 };
 
+struct awcc_features *awcc;
+
 struct color_platform {
 	u8 blue;
 	u8 green;
@@ -1009,7 +982,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 
 	priv = container_of(pprof, struct awcc_priv, pp_handler);
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		u32 gmode_status;
 		int ret;
 
@@ -1077,7 +1050,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
 	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
@@ -1328,7 +1301,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	};
 	int ret = 0;
 
-	if (quirks->thermal)
+	if (awcc)
 		ret = alienware_awcc_setup(wdev);
 	else
 		ret = alienware_alienfx_setup(&pdata);
@@ -1338,7 +1311,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 
 static void wmax_wmi_remove(struct wmi_device *wdev)
 {
-	if (quirks->thermal)
+	if (awcc)
 		alienware_awcc_exit(wdev);
 	else
 		alienware_alienfx_exit(wdev);
@@ -1362,6 +1335,18 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 
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
 
@@ -1378,16 +1363,6 @@ static int __init alienware_wmi_init(void)
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

