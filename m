Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A26C19AD93;
	Sun, 29 Dec 2024 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501638; cv=none; b=HTzBhsfYDS6kqw0JeTjLEK98E1aWMu4h0pm9Ei2sc/5oj4f3hmnZULxOGSGHmyoCaVzKVblWEQuV+FtcTCGdpR9n3DFj/F/Ee9KhYvh1KlQNR3HYZN79LmbvapPF3XLR9gv/Rx8KtXT/2KlcMlTXGSRFnKov9YJt876BMKscWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501638; c=relaxed/simple;
	bh=F0GIOFay6841bZiLPqvW3zJBYydvfXlGW2Z4CkXr0xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZv2/QP5WUIgziiMrRbkmS75fXXdYr8113e6g6ueS6gNfsr8vvOskTMYVbG+CSSzQPDbeMgFKZAnhRRt8a5H6uJXKFPffMC+FoXF0fNUKDcl2xwNt28BvbM/KHFRPQ6wx2rBZfV+Hf4ePoXU3qBaGR/k/tFFKo+hgymHvFfXrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmQn8Ool; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmQn8Ool"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso1664540241.0;
        Sun, 29 Dec 2024 11:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501635; x=1736106435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMdeyfMbYq2pU9M+8ipQevqF6stGUQwNAIBw3B/jK6s=;
        b=SmQn8OoldkJzt75kUH2sFNkff24wcrhr3qwAmhFCVGuEMYo3gpRdixEdXV6EK3oUK6
         0GdPQqC75knzfT9wSNS2O+zmyjAiJr/SkVsGu54nGWf0iFY7vjQY20UnBXTrtgEHBjiq
         pYlJQrxhit4E6IWrlCjqewmkptlRlx6hPdRqKaQc0D1DJs+rvOwqml1Pl7XislU6kopD
         Z4JgS01mE2qzhn4W0molWRIJkxxt5uK/EjLw1I1k62Vp/WO5+gZ0XLFPJVJSc46d8pmZ
         T8h2axPY0MbjsG31YfbwFkVOXtBrIXJdkc3tVX+NT3a55xv8f/x25S+AtetZCmZ68WKf
         heIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501635; x=1736106435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMdeyfMbYq2pU9M+8ipQevqF6stGUQwNAIBw3B/jK6s=;
        b=gaCQQazTCkPFtQDBkUsZns8+f8MAuJn4XAJ9l0z4ymkhK9xvKRipYoU1IhQQG7SgOk
         il+wVomXaCdjVwKBXeuzsGY5P1GZgrnWvcM8Dc2s4l9l/bZUu4paAHDu/Mld1ARZiCFd
         r0/WdEn3fqUyeP0ydumvt2ywvDNnch+ROK+4lc6pP9uiJgB57c6aiHM/efRnQ1G4L/Vq
         ZZV+SZItcKhyoVlyHQobN13yEAMi9A1gQ5crspT8lSlX/rS7jz4OLXBRN/HAmQ1MMayS
         +mHXGWiF6+wcvP7kXKcg5GBkdas2N2FnxlTG1JjPu7azid+yB4erOYpp8cG+QJf5w8YP
         RmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwN9pf9HqD6fs/KfEnicqnVS3Lf7+ctsyLRBcF7NaINSyzvQCEKG1HxIDHZ6cIp8vV4l0NYB6YxkvE26s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkw9Wz9MbkDaOGwcacv6lqiW5SP/oPU2KzFtQXZsW8ezVbvdJ
	GW74oDVGHc57dfVS03kE3wLknV94dLZg+4jaV+SzGIdAqGvrrFaejDqGkw==
X-Gm-Gg: ASbGncubwwXcdRsSGa8KA2oqdgOCZpRUl3qFHHaJdFidAvQvKPo6vvEPPtQ0Q+8P+PV
	N0846C08tFj1qgwrm043fHDEBKLlpszuqnhR89LfDhMOMnewjuaIcoJREECVipMf4uEgu+7P308
	sOsT0eJiRrCFs13XmkM6WhZt4iG6D/Y2vZB05PVVSK/vgltF6T4vB+f8DOM9SnIEEjWlHYZdWE1
	2WALkyo7Sc8BombmqkAQVRmvqbiWAlDZuKEOlZGhiVhFap+dElYi0dapvaNtrbo
X-Google-Smtp-Source: AGHT+IFza2B111oHaEYBWKO4fh4RaC9syJ7ai5+McxBAas6h86iBKkJrD+uT4V5CEhzcolVYFqZYyQ==
X-Received: by 2002:a05:6102:3909:b0:4b1:1a11:fe3 with SMTP id ada2fe7eead31-4b2cc35856emr23296125137.8.1735501635056;
        Sun, 29 Dec 2024 11:47:15 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:14 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 09/20] alienware-wmi: Add a state container for thermal control methods
Date: Sun, 29 Dec 2024 14:44:56 -0500
Message-ID: <20241229194506.8268-11-kuurtb@gmail.com>
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

Refactor all thermal control methods to use the newly defined awcc_priv
state container instead of global variables.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 66 ++++++++++++++++-------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 87a7997579c9..512384635c4c 100644
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
 	struct quirk_entry *quirks;
@@ -416,9 +422,6 @@ struct alienfx_platdata {
 	struct wmi_device *wdev;
 };
 
-static struct platform_profile_handler pp_handler;
-static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
-
 static u8 interface;
 
 /*
@@ -1051,6 +1054,8 @@ static int thermal_profile_get(struct platform_profile_handler *pprof,
 static int thermal_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
+	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
+
 	if (quirks->gmode) {
 		u32 gmode_status;
 		int ret;
@@ -1071,11 +1076,12 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
 		}
 	}
 
-	return wmax_thermal_control(supported_thermal_profiles[profile]);
+	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
 }
 
 static int create_thermal_profile(struct wmi_device *wdev)
 {
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
 	enum platform_profile_option profile;
 	enum wmax_thermal_mode mode;
 	u8 sys_desc[4];
@@ -1105,33 +1111,55 @@ static int create_thermal_profile(struct wmi_device *wdev)
 
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
@@ -1271,7 +1299,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal) {
-		ret = create_thermal_profile(wdev);
+		ret = alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
 		if (ret < 0)
@@ -1287,7 +1315,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
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

