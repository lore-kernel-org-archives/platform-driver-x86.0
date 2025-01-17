Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EC51F892A;
	Fri, 17 Jan 2025 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101680; cv=none; b=AflChQG2dvp3fqjlNG2i6MUMBipkndjIB+op1On9xW75ksqVGPrVTXoUtafHaTTi6/kffGDl32BQkmnGsVqLvIQfEnpnpWAvPFqSe2azBx9qn2ob78hUes3guKeJikYfdAsdqgbC8XML/CCsWYTraAlJWLfTY/yLY+CCSrBBizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101680; c=relaxed/simple;
	bh=kXXSi1Lc4UOx1E7uuoYi82soqMNTQtMv8uGG8M3jExY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oo5LD42a/xUgSPv4yCbqvpLVkK3Lcjoi8BxeRt/qbI2HHfEO/OmPPBwmZsWAKNpNEEFAZEImYoACy54VncQ78VRXChnwftoNAZEKQdCnYRpAANgAKlElpzQCz6azWshL11jla2IPVUNhiKCnfeKsIXPsUT+atiSvwjBJneEE2s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2o9Qmmq; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2o9Qmmq"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so328285241.0;
        Fri, 17 Jan 2025 00:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101677; x=1737706477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4xMVpIKbEAQy1Th2MQdKdGu9ManvCy1qaEtAufEggU=;
        b=U2o9QmmqS7mYiV8I6OQ1sHjXHYF4ki7QX3N9xnaZx2IC0pee4BYchUj7TGrR1M7veu
         Nrx5Z61pVn6JqPNUdbDwU6/uBW3lGUd5qDhGSFdqcsb+n4Qwa4xYqzsrgsCdRM9A4PoE
         hy81GGFkCykEDOI3sQ/uV7jkt6+f34YJYnmKOVWljpYHMI0PWcVIZwhL2kPxFblod7rd
         TbGOeUw/q4zYS6IV+CZKp7TLV6/kma4XhFzblMT2IjV1TVgj13SZkYCmaKM0uMGTEfwe
         QKczk1h4jJmA9Te6uJ29Y7/LFP97g63sI6KK46wFm/kVRtzQ20XRCTwd4sIuAfkt8fa5
         1lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101677; x=1737706477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4xMVpIKbEAQy1Th2MQdKdGu9ManvCy1qaEtAufEggU=;
        b=j25g1/0YImh+dOdU8GH+jzxKtEykEj7sovfKjuIw0NnUlVdCwFgcMwrMBbHPENXxZN
         na9+QrZ0yfwxlRSEhFmU/3KwpMwp8NXHgW3yt2BQyGujEYVfoy53hUu/XrFDbTZNUDld
         Qw+1/Mtq/Y76BdKxByTK61+7CZqLVIFrTMpDfE+0LtioRb0PPwIvh/A5eHp7/NHTcV2+
         2Y2WA6nppRhJbInZhKfVI7h+1V0VSAV41YvQk45U03BTa3vHJzV1vGVSTYujVP68hRa2
         tMt+iiNH9PP7bTlqmVHzo64YUZSxHPDFyZ8yqkJ+nsV94pzREQl76K4w/FDTH4sBBIwe
         s+dw==
X-Forwarded-Encrypted: i=1; AJvYcCUm/W1B3av5zG6I3e7HRruz4qEi4I/M06CJQT24+HOHGVGrl2CGOzfRt1fv9xROKHLSRo18QTJ+0QesRHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqB6yLpOxA/dGy3X/uTziWRqLz61/YLQvN7Jqyz2zyUGepPLlj
	NGYzUWkmDAoPOH/qCAUSv4azLP9noCNWPe0429q75q/VEYEFRqBTovql2A==
X-Gm-Gg: ASbGncvctqMNmQvDow233P+3HdJVe43xRLNu0Cvdn0dXd4e7Y51fyIgKTf7Xz1ilhJq
	NW1PkSrqBKtL0lSnHBVboxhekhxsM4BbjPWuP4Zi9lJps/vLPF158YSMz6fJDPDLFMlPJVbWQR1
	jaA4BPeQJQ04wNVbVE6rx6mPKZ4S32kZ3i5SwWxryP3VW1zUKbD9nT2tZB3MW+WpVYKMjd3PnzQ
	UHDAIGNSPCixBTzZgX9IZpk2m7d3uI32N2mwYEf9oJn3vfhWhBIjQImYafVRkTE
X-Google-Smtp-Source: AGHT+IH2Ar70+9w3GDZ3MsEbbvzDPVVOaklOarrOzOegnVzThDBRyxNFal8ZxUh4+Q2QYOXT+o8ERQ==
X-Received: by 2002:a05:6102:370a:b0:4b2:5d3e:7554 with SMTP id ada2fe7eead31-4b690d17f18mr767412137.23.1737101677436;
        Fri, 17 Jan 2025 00:14:37 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:36 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 03/14] platform/x86: alienware-wmi: Add a state container for thermal control methods
Date: Fri, 17 Jan 2025 03:13:36 -0500
Message-ID: <20250117081347.8573-4-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
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
index e1a5a867f144..7356260f7f09 100644
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
@@ -1272,7 +1286,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	int ret;
 
 	if (quirks->thermal) {
-		return create_thermal_profile(wdev);
+		return alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
 		if (ret < 0)
-- 
2.48.1

