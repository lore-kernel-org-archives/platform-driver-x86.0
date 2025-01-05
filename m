Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F91C5F0E;
	Sun,  5 Jan 2025 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091090; cv=none; b=Fz7Z+ZhNQMIsXVmxSC7VCpfXodldi1u3vDq1OQVLWiW/MzSu7Fe1I4YJiWFch1esubhro0pOZl5jY/mcY+tMUL6e6UieDOtfgJvq1Jky1XAgZexE++XL15exGyLHQUAQ0xnavsp98Kdkl227jALt4+KwZjkzn7FYGgtZQz/pBFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091090; c=relaxed/simple;
	bh=gr9cq8BeUbI37Em6/gpZe5mNuQ3eoZhCU4IQvRCZJgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GshdVxZGT6zIM0O2pd2vRbnHrgnoIev9u3Ez7ZmXANIujlDErTMrGq0bXzlFrgzUWl47/ghS2DzQnmg1TBOyPqclHEHOrOH1MHfhwkE8FrG9QoPl2dI8Mal9HQUXB6EnSYMxa6TEguLotyuMVlqfXYZjF37zp61FbrQMFSpviQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdLb442w; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdLb442w"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85c436db302so6652187241.0;
        Sun, 05 Jan 2025 07:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091084; x=1736695884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2eQOOCqqvrQm0hZJ5xa+q1NnbNHGfYbY03Z0Bh6hWk=;
        b=CdLb442wwioOcA+N7lf/EGi438PPqLORrkukjp9uMsxrpI1mHVEH/KmKpFFp6+YKnV
         df+6Ds2lmsm1GRWgqNQvD36+vwiSOWDgYDgXxg257XOuu8MJ70Nu6cK5rXIX0BIKL41v
         xGmoxfS/pNM1m5GE/F10zUXKV5Pip0SOM85c0nZNEkMdMTibeU9irksA1OCrlG7T4k2u
         PKteAR91iGGzHkPspO8lmmkYcxi84haqSY/K/kDD7KzBBSy5SAFnyjNKMKMtEWOodD3L
         ibn8fBwNqlbKTBKyx0Ae63PPen1W4wvl2bLKH86MsnIw8C/dl4UQRRNPCerSFHkN9TYv
         VPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091084; x=1736695884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2eQOOCqqvrQm0hZJ5xa+q1NnbNHGfYbY03Z0Bh6hWk=;
        b=K+omvXZaJ+WACpOu3IcvaSZ49/m1L8gAMHXdBpBngC5Nt7s8wxvf1kUl8MNPbdEleh
         T7UTBBuU1n5DgkgUdmov3Ae1B9zWewQ2dftu16MoypGRYYzRG1I9uoiakIcq7iKRr5Iw
         ZdPy0OgFq/CFnHtH/gVd4Qw/7TuaIrJf42/bLLJEkL+YWoeV6IWHeaOAF4kL6jY3Y2KT
         qQ/njP4mpkiIa5/q8Bzs3jjGN/w2aG4jq0hLJ3PVABg3U5QbuN8vcS7vMvTJFUxbLndy
         bTvzGQV7WI7WyJIstr+qITZo/9GVW1CK0VTzutI1ZI660weD0BICB/oMNMPKsLDh7wz0
         Hzaw==
X-Forwarded-Encrypted: i=1; AJvYcCWQOgcO3ym9jLoZGnOQ/1R6OoDe6HkPlzCxOksvlBCeQSASt8LcK1yycDGbhUxHWPChE9Cjvs5SpjERs/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+/p+evzD433xOriK8i6SEEMMHREaWSr/VbqkcMMQ7CwInClyT
	L1EPMnR6SVFsJRZBgTj2xHzDIC+HQezPKtoarAKlqgJ5DrPJMZ3lDywGBg==
X-Gm-Gg: ASbGnctzgfHVVtMmcm8dzjZf7woAn/0AvxHOXEzw3JCSmgH2FI6BOL8/Efnc0Aix56i
	xTFg6pRbOFcuPdiWVTCKpAqYzHheVReuQssezVcmhb302QMYUso46paHR/GSNslyCDVx/SRnBFz
	oDKdISHB5AW1UILFHC6d9oVgH3IxykUUbedCdYUGcpYUD+qlhKhMmLN9obWcRRtSat1JOQmp3yw
	YkLHQ59Y17MyeF8M85qY6P/akNK5DcJVDZT2chIHM/9WhyEcmdu5IP4dwYUOOOh
X-Google-Smtp-Source: AGHT+IE2GL5rZuNIXuBZc/oLTC0MKnabm8rTyvZeB9EAfLuC9Vn301LxwQn4ZP6gf6OTCYcelBLhOA==
X-Received: by 2002:a67:fd10:0:b0:4af:f576:b639 with SMTP id ada2fe7eead31-4b2bbfcb6e1mr44118620137.4.1736091083778;
        Sun, 05 Jan 2025 07:31:23 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:23 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 09/20] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Sun,  5 Jan 2025 10:30:09 -0500
Message-ID: <20250105153019.19206-11-kuurtb@gmail.com>
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

Refactor all thermal control methods to use the newly defined awcc_priv
state container instead of global variables.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 50 ++++++++++++++++-------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index d7b322be6c19..da8a9592b1da 100644
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
@@ -1047,6 +1050,8 @@ static int thermal_profile_get(struct platform_profile_handler *pprof,
 static int thermal_profile_set(struct platform_profile_handler *pprof,
 			       enum platform_profile_option profile)
 {
+	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
+
 	if (quirks->gmode) {
 		u32 gmode_status;
 		int ret;
@@ -1067,11 +1072,12 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
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
@@ -1101,27 +1107,41 @@ static int create_thermal_profile(struct wmi_device *wdev)
 
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
+
+	return devm_platform_profile_register(&priv->pp_handler);
+}
+
+static int alienware_awcc_setup(struct wmi_device *wdev)
+{
+	struct awcc_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+	priv->wdev = wdev;
 
-	return devm_platform_profile_register(&pp_handler);
+	return create_thermal_profile(wdev);
 }
 
 /*
@@ -1259,7 +1279,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal) {
-		return create_thermal_profile(wdev);
+		return alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
 		if (ret < 0)
-- 
2.47.1

