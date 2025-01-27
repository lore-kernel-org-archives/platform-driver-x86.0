Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125F1FC7C1;
	Mon, 27 Jan 2025 04:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950666; cv=none; b=O6+AsEparsK//Pjs+4dA8nr2WzHvLuxHWJK3m8Z/3hg3B5XKNPu20XmPD8+fmOGEpfQU2vrvEy+P6r/2N+chf8IvPP4uy+ykbfeSEAQvJcXUmB21jthxcnfEoFMt+fkHpQI7iQ593H5/4up1bL+ijafF6Gce5LdU7z6lqqR+xXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950666; c=relaxed/simple;
	bh=PNVw4WDB5Kus9UjJkOcqQoGFifJvtrY8nkTaBgXOTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqgNjDCqKhibHKrf7z0wn5i5ttaNhtfOv1vY/9OTh8e4MMvr+j0P2lE08SfDJCw5o00Hpyivzl0vi2oGn4rWZ8fdN5DQW0tC5yTIO1hKMcCzbSTssU9d9DNC1Fn3p6B8PwBoX7+XCIEqLxNAD38e6MJpGDj16zP/AoVAocl21l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2fVuTUm; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2fVuTUm"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so697515241.0;
        Sun, 26 Jan 2025 20:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950663; x=1738555463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyw0MjsuanNO/4ipodD4xIuZ3tGVBj0Xv2kwkS6ypaE=;
        b=a2fVuTUmhTMBxgw6HhtMdOGQCAM2q0unymf02wfIFLxHNB4Gns/AmP48oJhHVku1SU
         SvoOE8EH+Pz5Pv8OnXMnDXPrSlkDVntdfs/Jj64QaIi67SVQ/q3YsV8aGvHFJMBEI4oU
         bCpNrbkMv4sBK0IH8CuHszqzccaT4FsC3e+OhJObV8WKepNSNG1PkCO9V5BPLHFYhV3J
         vW/Ov9QVCQGjiGuZyYfcs+8xv/HKkUopFpFAK7Tl/Gp/U9N846Yqg78EUWDLQ93mLxMS
         D/eEn+Wj3uzC0d4XbgpdIB14kwFIf5By2+TZDx4NcSlcBkXLHmm5oz7c6hGP8qGyIXq3
         GtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950663; x=1738555463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyw0MjsuanNO/4ipodD4xIuZ3tGVBj0Xv2kwkS6ypaE=;
        b=CBi42i6QXpmJ2PHC9p3n3+t1QKNHnEP66VENSEjygwn3RIY66MJ0c5qyLefkEV/QLn
         oBFIlbIDFOHEzn8J7iCu4hCxVeObLrF/Lv2K/sL2Voyx67tzNwNDabBf8RVXxhM1Zxs6
         FLZaGO5MYj7aQjT2OQtoiH8xR7HXw2+A4Ovxdy3tgLLzcNjSWMhBqGaWbclDXmaYS9hg
         IDhJLYf8/oPXVlrDYWT8kUrj9bMeGrLeyQ0Ij2MB17rKxT7dFZ1a+8OVTLNOXXXMs+uB
         XwU5mQxu85x1UNIMnvOJqCn6NAriNtIiLnG+GFGF4OCishO8sYIsBBnmzs48AufVTXfa
         hAKA==
X-Forwarded-Encrypted: i=1; AJvYcCVgb6Ps6id7jCULZf2qF/uNiCmhACc9MCC4HRzFOVorp4q12gX1GCa+mtFKVHM1Jg2MERmcGR8IzGka1r4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznliyzPubegYLmwVCecKi8OlWA910U965N7ltn3/qHB6MunSD3
	Qh0BCan8cVfR5iroN3wIu5ccRbnbF7Ha/9npd4JY5id7B+FKfmOZmQ27sQ==
X-Gm-Gg: ASbGncuy7G9QXAhXgldnKeTrM+L7BzjRCh3gHzAais0SD1CuySB1EI6lddAmkcGhjD0
	U7Qy/Lo2aJj23RaKcwrb/sMcwBwZH3TZTTCyDnm+yn9ekgwXoxejp4bhVhrd02nT/QG7PpMOJNj
	P/dL1/DJ37Ct4wDWgZWknv2G30NyVY/yXOyTCvvq5yNkcDtHAF3NS0d5QhGXBiK7QTXn0UsHNBf
	MXmoYSl9WR5tiuCa9JgWe/cwpMCCljRxCpz+6/qPWTbuXxWbTeCVrwMJK0yrktwuEwh1Tc1w70p
	+ItvAsGgF4pt
X-Google-Smtp-Source: AGHT+IFl+1KG9wF1uiG4ed0L75VKl+0vAom6VORmZE9jm7pf7NgiJF1WT+GiFQSKL/+UZ2wdk7tWQQ==
X-Received: by 2002:a05:6102:38c8:b0:4b2:cc94:1877 with SMTP id ada2fe7eead31-4b690be5571mr30563514137.13.1737950663116;
        Sun, 26 Jan 2025 20:04:23 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:22 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Sun, 26 Jan 2025 23:03:55 -0500
Message-ID: <20250127040406.17112-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor all thermal control methods to use the newly defined awcc_priv
state container instead of global variables. While at it, rename
create_thermal_profile to alienware_awcc_setup and use it to set up the
WMI device "awcc" driver data.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 36 ++++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 38a38fe394d3..b681b86e3894 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -412,6 +412,12 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct awcc_priv {
+	struct wmi_device *wdev;
+	struct device *ppdev;
+	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
+};
+
 struct alienfx_priv {
 	struct platform_device *pdev;
 	struct led_classdev global_led;
@@ -424,8 +430,6 @@ struct alienfx_platdata {
 	struct wmi_device *wdev;
 };
 
-static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-
 static u8 interface;
 
 /*
@@ -1060,6 +1064,8 @@ static int thermal_profile_get(struct device *dev,
 static int thermal_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+
 	if (quirks->gmode) {
 		u32 gmode_status;
 		int ret;
@@ -1080,12 +1086,13 @@ static int thermal_profile_set(struct device *dev,
 		}
 	}
 
-	return wmax_thermal_control(supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
 }
 
 static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 {
 	enum platform_profile_option profile;
+	struct awcc_priv *priv = drvdata;
 	enum wmax_thermal_mode mode;
 	u8 sys_desc[4];
 	u32 first_mode;
@@ -1114,7 +1121,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 
 		mode = out_data & WMAX_THERMAL_MODE_MASK;
 		profile = wmax_mode_to_platform_profile[mode];
-		supported_thermal_profiles[profile] = out_data;
+		priv->supported_thermal_profiles[profile] = out_data;
 
 		set_bit(profile, choices);
 	}
@@ -1123,7 +1130,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 		return -ENODEV;
 
 	if (quirks->gmode) {
-		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
@@ -1138,14 +1145,21 @@ static const struct platform_profile_ops awcc_platform_profile_ops = {
 	.profile_set = thermal_profile_set,
 };
 
-static int create_thermal_profile(struct wmi_device *wdev)
+static int alienware_awcc_setup(struct wmi_device *wdev)
 {
-	struct device *ppdev;
+	struct awcc_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
 
-	ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
-					       NULL, &awcc_platform_profile_ops);
+	priv->ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
+						     priv, &awcc_platform_profile_ops);
 
-	return PTR_ERR_OR_ZERO(ppdev);
+	return PTR_ERR_OR_ZERO(priv->ppdev);
 }
 
 /*
@@ -1271,7 +1285,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal) {
-		return create_thermal_profile(wdev);
+		return alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
 		if (ret < 0)
-- 
2.48.1

