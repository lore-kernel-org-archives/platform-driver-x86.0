Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497831F2C34;
	Sat, 21 Dec 2024 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760817; cv=none; b=Vg0SfZgw2WKDfLbJWxcwsL4oHxYjyHG6yyQkdMJgckTcmfymwJKWhjfzcMHnmWWt6Ymr8ruqFQxHGJ/tfkwDOj6+a7SWRNS/XR4nsFf5NqNNhnPskqbZAUPw3Mki+l+2lFZrNcEXBShI1pghMCHU5vjnGFnJtHWPjO8e+EWB0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760817; c=relaxed/simple;
	bh=1QyptutNKqsCkf9oPPLxnFyYVoHsUn+GChl1LoArlLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNjIbPWl1S/qXxUGTyzdJYXET6w0TeICM7fdSLaS5Z3DfOedM6UQIONRDX4531kxm9C/5hDSjY12yaZh4fdRmG+fqezZQaJr1ubQDoPrPLImwOLvNeem2lkuULISgqM5ZG10TSEYrFUuMM7uSgqpuxXFIVIPD4ZM8UCf2zKyKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huPah+j3; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huPah+j3"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f0054cb797so21089987b3.0;
        Fri, 20 Dec 2024 22:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760814; x=1735365614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q+n4bgjJqqSac7LlNtb5h3q8ImmgMHiXd3qqoGPL3Q=;
        b=huPah+j3LtQkbDNf7oCuf7IGM3vlRCt0z7Z3fOpQ5ue5NHGVMtBewBZnq+ocdc7IqU
         OfcJEaqWqkEj9X4pMHTyWLTA+rnKwUmtuARh/EAlfX1zdB+pHM4DjiF9gi5fbs4ESYxv
         VulfvOgfE96ZRn36iZgGgx2eHdAnHDjt3TrjScry+8d63uCJjVgccviYC7A4pWzHh59L
         f3YlQjtHzrJ+wCbsu6I9Hg5McwI42ZZxtK2HZsJ894ZkSE6J7CMGhJ1YMW3Z81ejpk1H
         QmYDResv2QbpCGcWYF41GisVpAlLNrDhjsU/1daYtA+IeF54jHdrJLtkx/zu0xaXWm8J
         C3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760814; x=1735365614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q+n4bgjJqqSac7LlNtb5h3q8ImmgMHiXd3qqoGPL3Q=;
        b=OmaOB7H+0W/EsTo9pf8KY02G7mCEoLH3f1kr3ht2n2MYJAnBkqZxmM6rgN+MZRUIZc
         BNhP1QalXCMztO4wYXF8UH8X//O/5z/+w5yndhmzx278mcs+hUf/jNx5iOIKdUy11YKS
         bhkBcAVr+JLs+c6yt000BYFnz9Ex3XSgd8fYK3aA+JuS/Xw0gNG7r2D3jzPiZQuDHGEh
         acPZxZuuS4CVaxGKTvmVvriba2Oxy3Gmo0g8kroiI5J0Np9MvcBX2C/r91XtMdNKTPo2
         9JcEq+cbTd/9AtMm33FCh+Yt6JEPuY0UxkdlI/QFzl6bUQDYrwDpT6bu2Sfl1+XvTNL8
         nKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtwq/XHR6JBVgxq6G7G0AS8txh5H5o7DlA1SU/WXG/KLrZBdFw9GOegpbbe6OVWjqmx9IU4obTtLNNOBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/kxr7nuET5GA04bQhnTZvEH3EOcXVq7lAQqbxzIsKvumzJ2Fa
	8f3/Q7I1ptqPZ9JM5i5DPOHP1TdMJx3k+IO0Q5MKY+2dXG0yv3+8bcKllA==
X-Gm-Gg: ASbGnctmxtwWY+XDDRSSU34qV9/TB3PHrk/T/fQQMQegNc4KCs0belTBO7/fk82DHuW
	FM3PcJTXeUl7sUBQPX1ap7QoXl8+K6pVatBRlll3LTSK6RGUVsl349j2b8EdbFEBrtq6p7sEPgd
	4LCkNj+tKRcEe4ZsKj6aDurM0WQDqc46Jfcnjd0tJ4ZAI2iBJDXEJ4KfiCu4h+zpMXWV3sR2Nh2
	QyiziqlgmyVF/+SdUc2bJ4qX+hh6y0c4V/4RCzU0FAyfNH6aKVVJGQdtQ7UurrX
X-Google-Smtp-Source: AGHT+IFGoOVdlvtDvdkAyQ7ZM16K5i8OV7ZAyAasyQjgWz/JRXVibUl6cU4IVT2255isciNyXjaN1Q==
X-Received: by 2002:a05:690c:690b:b0:6ef:7036:3b57 with SMTP id 00721157ae682-6f3f821a2camr49619127b3.28.1734760814064;
        Fri, 20 Dec 2024 22:00:14 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:13 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 09/20] alienware-wmi: Add a state container for thermal control methods
Date: Sat, 21 Dec 2024 00:59:06 -0500
Message-ID: <20241221055917.10555-10-kuurtb@gmail.com>
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

Refactor all thermal control methods to use the newly defined awcc_priv
state container instead of global variables.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 71 +++++++++++++++++------
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index f2f6842e27e6..c4ca141d628e 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -403,6 +403,12 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct awcc_priv {
+	struct wmi_device *wdev;
+	struct platform_profile_handler pp_handler;
+	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+};
+
 struct alienfx_priv {
 	struct platform_device *pdev;
 	struct led_classdev global_led;
@@ -415,9 +421,6 @@ struct alienfx_platdata {
 	struct wmi_device *wdev;
 };
 
-static struct platform_profile_handler pp_handler;
-static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-
 static u8 interface;
 
 /*
@@ -1027,6 +1030,10 @@ static int thermal_profile_get(struct platform_profile_handler *pprof,
 static int thermal_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
+	struct awcc_priv *priv;
+
+	priv = container_of(pprof, struct awcc_priv, pp_handler);
+
 	if (quirks->gmode) {
 		u32 gmode_status;
 		int ret;
@@ -1047,18 +1054,21 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		}
 	}
 
-	return wmax_thermal_control(supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
 }
 
 static int create_thermal_profile(struct wmi_device *wdev)
 {
 	enum platform_profile_option profile;
 	enum wmax_thermal_mode mode;
+	struct awcc_priv *priv;
 	u8 sys_desc[4];
 	u32 first_mode;
 	u32 out_data;
 	int ret;
 
+	priv = dev_get_drvdata(&wdev->dev);
+
 	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
 				       0, (u32 *) &sys_desc);
 	if (ret < 0)
@@ -1081,33 +1091,56 @@ static int create_thermal_profile(struct wmi_device *wdev)
 
 		mode = out_data & WMAX_THERMAL_MODE_MASK;
 		profile = wmax_mode_to_platform_profile[mode];
-		supported_thermal_profiles[profile] = out_data;
+		priv->supported_thermal_profiles[profile] = out_data;
 
-		set_bit(profile, pp_handler.choices);
+		set_bit(profile, priv->pp_handler.choices);
 	}
 
-	if (bitmap_empty(pp_handler.choices, PLATFORM_PROFILE_LAST))
+	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
 	if (quirks->gmode) {
-		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
-		set_bit(PLATFORM_PROFILE_PERFORMANCE, pp_handler.choices);
+		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
 	}
 
-	pp_handler.profile_get = thermal_profile_get;
-	pp_handler.profile_set = thermal_profile_set;
-	pp_handler.name = "alienware-wmi";
-	pp_handler.dev = &wdev->dev;
+	priv->pp_handler.profile_get = thermal_profile_get;
+	priv->pp_handler.profile_set = thermal_profile_set;
+	priv->pp_handler.name = "alienware-wmi";
+	priv->pp_handler.dev = &wdev->dev;
 
-	return platform_profile_register(&pp_handler);
+	return platform_profile_register(&priv->pp_handler);
 }
 
-static void remove_thermal_profile(void)
+static int alienware_awcc_setup(struct wmi_device *wdev)
 {
-	if (quirks->thermal)
-		platform_profile_remove(&pp_handler);
+	struct awcc_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+
+	priv->wdev = wdev;
+
+	ret = create_thermal_profile(wdev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void alienware_awcc_exit(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+
+	priv = dev_get_drvdata(&wdev->dev);
+
+	platform_profile_remove(&priv->pp_handler);
 }
 
 /*
@@ -1242,7 +1275,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret = 0;
 
 	if (quirks->thermal)
-		ret = create_thermal_profile(wdev);
+		ret = alienware_awcc_setup(wdev);
 	else
 		ret = alienware_alienfx_setup(&pdata);
 
@@ -1252,7 +1285,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 static void wmax_wmi_remove(struct wmi_device *wdev)
 {
 	if (quirks->thermal)
-		remove_thermal_profile();
+		alienware_awcc_exit(wdev);
 	else
 		alienware_alienfx_exit(wdev);
 }
-- 
2.47.1

