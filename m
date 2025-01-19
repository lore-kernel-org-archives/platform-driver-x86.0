Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120E1DF99F;
	Sun, 19 Jan 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324364; cv=none; b=JDM1/KSSTc4swbHoxKWkZd3Hq/z++NJAlpotscoXk6aBtSPZDFkf2dKt6enhXUKWnF8aUHGMFvx1snGZr0iG5w2SPrqGoAHl4spL2u95cXr/EFd4JIwh+x2QWyTntBM17jee89p0XZqzcCwonRdrw96OKPG165vTJ9uO9ut71ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324364; c=relaxed/simple;
	bh=D9NzT4jMJZET2VQAg0q+MV+E0pQkxunbjlg2bM4tw0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkbDJxLXCQjeYPTBmijWuXyDkEcQYd05x7IwZQf6DlChTbYtDBY8X/XXExOdyBXhIbtfML3GxZTC5m1Ci2nxRdw8QC5oiJ4h9HnZgPhXe7KSyebjQ8pvN3mgr0MBnZ+AtocNe+LwyvcNkl87BkGnF5Ov6KIlNvSvxHA+VEnTCCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JK0zgE2m; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK0zgE2m"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6c3629816so200322885a.1;
        Sun, 19 Jan 2025 14:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324361; x=1737929161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJZc/ljk4j+eGf3glC0e6QtO4VK5Bd1RIE2WUJLEAMw=;
        b=JK0zgE2mRB63MJTWqonW5yrC3mb47eclR6MTFUsNfrbrRmDXPl8kr/9xxJfVrEnGwI
         1kiDatDfzsk7bUBg+zCP8dhbAFWrx3PsKjwNa+pB7+9WlEiOFKhVc0C5AHX7JVrIBxEZ
         P/f/XnBFHvhz1KintHRbQXm7d2/UHd9k+SEjQiSMxbjb8kdVAxtTyejwKaMQkLDYpKOB
         BB9QsA3bCch1da5HxGXniOTOzyEi1gqym6wJYr/9l9F4dg8fVeT8Dm54Enfix4pjDt7W
         gDyAcdJjK/3+gyFXH3IGimGUJspgq34cWJo8EGEjUZ9wBIwqGo4bRwKuDFEGXGBl7BVS
         Saig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324361; x=1737929161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJZc/ljk4j+eGf3glC0e6QtO4VK5Bd1RIE2WUJLEAMw=;
        b=sLMdLMjESmQ0z7IRWY8CPQqCEQmNzf0c3bihKF3d0xD0msztBD9v/6AOSztin1r2v7
         vrge27gC/sFsHikPaberFL1E3pURe9G3ZeSKT0NfVebH/CaZKopTQ/mSKdE4vN/Dh81z
         Pvw9Qb3BhcP7k9c0v2QfL+jW574Rat1o6ZWdRNPRIkPbAxkykJgAFaW+0Fr7r12e8idS
         SEAOY+DQq3PizbBRMCBsPLr+vO7KD0y0YUvqRKCSOEIEp8rQ3HtQFdDR1KDolndvV+HH
         7wSKSwiJ3JBMxR1yZzPeMUmmUToJ/ng8VdvOg7qrC9HnerLicJa14szyOxJUspb9FGQ6
         GYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbsw7JHvgq6mfXF8kK5iXlWeNHhsH6nieTaa9sPI8tNM2346AS1tHU4HwbAFp3TOrQUJeddQWV3TqnANc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqBzlzmfVQmP/l7L2v3uoNrGs2H0tXLfti//KetaHSZywwhGvF
	vup0qMrTng3n4iUhP+jp0B7YBlVzO4ETAB+4FQshxVamYLcqKvlIRaZvDw==
X-Gm-Gg: ASbGncs1nhNFaL89fw+bMOOBJwHy0wzxHFhNRuPLwBnd/8148uj8aLsC6ev5hoakk3k
	IiA1BIatnLHRIUfHMQnIyDfOSNTo88dEH6z+gTinqcnFzTaKhONC4EuCc3ncPP2OegxLoEGVsGu
	dEt+oZGMQXy1EplgpDqOITx2JcX0ShQB0MLZLE5wEzeefDpJtDy7OU0iteepmwQP6S7NxxZH0fr
	DZO7HBeZjMIFW6stjmn3WRFLGN/VL0GHjuiY3f2yRv9EghfstQfiKtUqnNJ//DTWx0o/Qv1P9pm
	3Q==
X-Google-Smtp-Source: AGHT+IG2a9sOD5/D6oHNjluH3pc3rgGiSGaHZPG9dQMzbGN/a1+wEAG0mL/t2w1mDZKjWVCCe49iNA==
X-Received: by 2002:a05:620a:450e:b0:7b6:edd0:d754 with SMTP id af79cd13be357-7be631e6be7mr1825336985a.9.1737324361344;
        Sun, 19 Jan 2025 14:06:01 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:06:00 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Sun, 19 Jan 2025 17:05:31 -0500
Message-ID: <20250119220542.3136-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
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
index 5935bf74b66d..9328bf9b6c81 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -403,6 +403,12 @@ struct wmax_u32_args {
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
@@ -415,8 +421,6 @@ struct alienfx_platdata {
 	struct wmi_device *wdev;
 };
 
-static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-
 static u8 interface;
 
 /*
@@ -1051,6 +1055,8 @@ static int thermal_profile_get(struct device *dev,
 static int thermal_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
+	struct awcc_priv *priv = dev_get_drvdata(dev);
+
 	if (quirks->gmode) {
 		u32 gmode_status;
 		int ret;
@@ -1071,12 +1077,13 @@ static int thermal_profile_set(struct device *dev,
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
@@ -1105,7 +1112,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 
 		mode = out_data & WMAX_THERMAL_MODE_MASK;
 		profile = wmax_mode_to_platform_profile[mode];
-		supported_thermal_profiles[profile] = out_data;
+		priv->supported_thermal_profiles[profile] = out_data;
 
 		set_bit(profile, choices);
 	}
@@ -1114,7 +1121,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 		return -ENODEV;
 
 	if (quirks->gmode) {
-		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
+		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
@@ -1129,14 +1136,21 @@ static const struct platform_profile_ops awcc_platform_profile_ops = {
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
@@ -1262,7 +1276,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal) {
-		return create_thermal_profile(wdev);
+		return alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
 		if (ret < 0)
-- 
2.48.1

