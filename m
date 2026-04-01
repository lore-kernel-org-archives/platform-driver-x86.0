Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531A3EC2CB
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042300; cv=none; b=kLlPfA7RIki5wy1y7Gn8nDB7m8WljGHVg4Db1zQcT9wbSjb5dZxBmRSaDHmJQKBsbol9g7LKn4Z46c31ts10mAmFCIR3vLgkkfCOm68x5zP+7RuRqnCSFmB315CUxE0cdh5YJJMcllr/PVX5ijWa5ajAEwIaSCM9N6sn36qH+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042300; c=relaxed/simple;
	bh=Zod/mbmSErAVBnUR2KsmYCmm5vMqxEg4NpW/Yvq/orw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSLFUNj9r/ujtrOd7KaOPtqoX7uu5xq/TMa/SAu1RCsQUXnUu49Pdgv04Y1AHBd7j6MtzkdbM707sM10wJT3L/8Q52DNiGXYURUK5K/Pb1I6VrihfSEG7XLqjeR73eX/6dipmFrloqHgHVZ6K5rQbvohlDsGGr/0gBGrMtRWceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdYypNfo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdYypNfo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so2750336a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 04:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775042298; x=1775647098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPtxhpt/RdXrwtdWw636aHBwOhySfdQdA4zowFMg+Sw=;
        b=jdYypNfoCIkPm98oeJe8kh1njMgewTKLRULwVn/5nprcs9KFKJpMsz8H1x/vG+K4lf
         OxP/3ujyUdHDHuxqEFtgq5whv6cL8HylCluOdCcIx2SKJ7ZVU1JYw2sv/0IDcao8o8ik
         EbTmTLtJDa+XEOmYbGE5ycA2SxTgdAoQ3UlhD/8AqkoEsTqBSbZaZAZttuDsC1q4B1UQ
         fZyrjGrUhoOH9cK8xiWlwyFfDdIYj0nqmxYU/vKaee0fJcOF4jrsJgPQdadKYRmX5UdB
         Guack56ITT9x03kdp5VqHfEsM9APjj2dSy+9WP6YZMOKKFwFbvBZ1rYAqk6ZKX5YXGQY
         9ZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042298; x=1775647098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XPtxhpt/RdXrwtdWw636aHBwOhySfdQdA4zowFMg+Sw=;
        b=SXtDSrMma9oid+a22aPm2Vm0OJX45HFzN5Xj4uEb2EVsVZCLuLP/yHuw6TiLH6s67Y
         QQd5cB5paDg+IMGbqTjS2jmUslDjEtq6zcgzS76vFLIO4hOX1iZz5/P7vK//7GWoyYX3
         qIwWwczAvMvGNpx31fL2DpIU9mke0fmxjWrl3mgsKYClgeURfQcFD+AC3+LUWj0Eho/p
         N2awiLep4wpKTqtYO1YayBSHx/4azTBwnzLKZGqYDFQP6wmD6lxFNSxvUdtlAx6PrOsK
         Conv7crEEFx7TuA2aBQCP7E+LarP2X1vlDx20Jbbf1oGew9Nd5XAd/wCbiRWluIu6uqK
         0msA==
X-Gm-Message-State: AOJu0YwYpBl3RCGfyJNesgwTaBwX0eOxpwvcFfQhx27e4VsdVMvrp9uJ
	+UZKPR1jEknMECt/rPTfVYEI++peNMCW7k7Kxrfq2wZKHj9/Db2MyaJ6eRDxa5AK
X-Gm-Gg: ATEYQzznHD3GsuGxstvInf2Pg463brbE+JNcmgYW6amA+RTBPdH9mK1iDLwMMNMj5dN
	X4XgI2t4/qC/9pg951bHmazGc6FyYzTUFX5RqNAJyW63YHcz8WFXuETZ5Fjr6eAUxs0HeIeUHhg
	Dd7pxTMWfah+TgHNhwTtfmGSUssgBiy/5lff25Iqtp7e6CStAkncHNmODmm6NLbTwpL708rI1rP
	lPfJ8ptL1l6wx5GQCgTzMRXQIpHpqe0IaxRW2Okbek69bU8lnrjHaRSsgNJOEoqLmyTWljzQMnh
	XfP195VBYSrIxhk01QIqP1/jtq+M05F16bdezvU0dB41zrLHPCsGpeBPUL79uda1bQ9crrmyj7A
	mzF5XNoNVbNck3wsyEwMp1fKFARVAlPrXamodHKkugNLCiSx8i5YX1r9mh6UGWxSaY3Gn4Oh5FE
	etYT+gfabCHrVzjDJJhIb4bO33r5k3ExXmkbfUjHx9Jf5CudykA9y74XJqLdWN3cT3/Yt0YRBJn
	Uc36pYpl4Bs75lw0OBe
X-Received: by 2002:a17:90b:3e4e:b0:35d:9c43:57fe with SMTP id 98e67ed59e1d1-35dc6e6739emr2907995a91.13.1775042298013;
        Wed, 01 Apr 2026 04:18:18 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dcafd004fsm1889689a91.12.2026.04.01.04.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:18:17 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Jinyang Zhu <Jakie101@proton.me>
Subject: [PATCH 2/4] platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
Date: Wed,  1 Apr 2026 16:47:46 +0530
Message-ID: <20260401111748.106970-3-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401111748.106970-1-krishna.chomal108@gmail.com>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN MAX 16-ak0xxx (8D87) requires the same WMI queries as other
Victus S devices, hence it has been added to the corresponding list.

For this reason, platform_profile_victus_s_get_ec() will be called
during thermal_profile_setup() and victus_s_powersource_event() to
obtain hardware state (platform profile) by reading from the Embedded
Controller, however, this particular board's EC does not seem to expose
the platform profile value, unlike other boards. Hence EC readback is
disabled.

Testing on board 8D87 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Jinyang Zhu <Jakie101@proton.me>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d630b7f6e146..24164f294420 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -48,6 +48,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 
 enum hp_ec_offsets {
 	HP_EC_OFFSET_UNKNOWN				= 0x00,
+	HP_NO_THERMAL_PROFILE_OFFSET			= 0x01,
 	HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET		= 0x59,
 	HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET		= 0x62,
 	HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET		= 0x63,
@@ -120,6 +121,13 @@ static const struct thermal_profile_params omen_v1_thermal_params = {
 	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
 };
 
+static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
+	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
+};
+
 /*
  * A generic pointer for the currently-active board's thermal profile
  * parameters.
@@ -201,6 +209,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
+		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+	},
 	{},
 };
 
@@ -1801,7 +1813,8 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	const struct thermal_profile_params *params;
 
 	params = active_thermal_profile_params;
-	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 		*profile = active_platform_profile;
 		return 0;
 	}
@@ -2156,7 +2169,8 @@ static int thermal_profile_setup(struct platform_device *device)
 		 * behaves like a wrapper around active_platform_profile, to avoid using
 		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
 		 */
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 			active_platform_profile = PLATFORM_PROFILE_BALANCED;
 		} else {
 			err = platform_profile_victus_s_get_ec(&active_platform_profile);
-- 
2.53.0

