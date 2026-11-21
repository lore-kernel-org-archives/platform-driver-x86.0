Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245403;
	b=GG3XYc12kUNL/ab1LuItyBjDyJSa2In5TDbbELBc3b6vFpFxcJ3tRqgeEb8dbxfSCOet
	 8KgoUskJeXg7qDgfKYKVSP0GmS+vewLpIQ1vFwVAwN6w7Fe56eq8fPQySWq4owOuvZ4/K
	 WXdqiLfBlqGNdsV+xH2SkwivQk+VWOm49HZKn8xUlpx20OJUUBtUt2HXrbYCURQWffySn
	 wzJ9Yos8T62CMoGzenXPbow6eEBPlfRzZN148YeWeTYBUrMvtF9aohG2JkrETmwUUN3aN
	 MdzuPzs4lb1ukFK6NL8qMi1GZfc1hVPxZ4YwRCbmvUq9Nb6ZEb+fb27eMcujqWyhISQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lyjDt4srRQIFbPUU3r2/dQUczxyZaXszt6feOM3BE7c=;
	b=lQWlAvFg+U1BOT4MctKFVyUFsNspE7RCt6n6HwUTGOIX5E32K/Z6vCbqsFTM0fTX7pzt
	 ++mHoG9TUlW/ohVbgcuq2+U83Ve19CUfoJS/mIMtvdPa+o0tcH14GyaHdjAfVqnrWPrqd
	 kz3Y1R7R6f9rHMsPldjMGTtRW0TWxp0a4F74o7Kuzy5KFBfl4LKXEwEvYFiP2Hl7EN6x2
	 sE2PxZWHB2kzMlGdgu2MZRD2e5m8ESR6Sb51kq0aqEqWy1qZ5wmB5TF0ARrT5ahpojaH2
	 rJwxBYLhrGTTy9pQqc+lanc/uDJ7wlIN7hzNZm+CyJ31vHgPI6Ig57cJ6X4GyV3azNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuGIDlqF;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745D606A32A
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C745D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuGIDlqF
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so1861585c88.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 23:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795245402; x=1795850202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyjDt4srRQIFbPUU3r2/dQUczxyZaXszt6feOM3BE7c=;
        b=MuGIDlqFUE3oyT3NnUxUSuOxFVENsYEzc6lYKiTO/Nu2f9HuGSlo7nfFbbjr1SHUCf
         OjD3fw2qlNsdWo/R848jLDEN57M/AG6VppyX74HuwvSi9NzNalJnv6TspAsp8bIvWq/+
         4bGfOEXUpPiUfGJR1BF2JC+1wZxoW0yiGaJAesjiSSi9FMgA8EsSFL9X3Fce6deOfxVL
         bFo44L88yQU97gRTvASmXYSPeUqcg9+9PbHy+S/Sl9uQqERmuT2DBzuns3Dq3w/wItH7
         b28KwD5hWsYWZMlX/vA1W6tW1WJC8ZNHvXk+HJToQiKaba8BW2GzvOsIYp1rcx3pZ14r
         qv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245402; x=1795850202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyjDt4srRQIFbPUU3r2/dQUczxyZaXszt6feOM3BE7c=;
        b=P0kwmd5XvTeOQh8DE5XUDyyx9eBWEPrWSJ22xvaycWkwd+ycI67enuhb0S0QndEsYO
         HRTp/BpkiLLRabDo2nFvvFK+QOQG2mnAwH4rJ9Gi/wfZbq8vfTJWXt5lyjHMVh/5dbuF
         0AqSXGY2WGxcL2TnjLMIOvE4NKNnDTzhm+tSKqTt9y7hhk7UngHOWW8daBJZ8VsQ0xX7
         Ska2h3y5nlKUUgpUy1nrcbA8vH0ama4aAwirjL4oI904M1YH1FxiSNyvTf/ocHuA/baC
         65R3zMFhRzh7TOIBj1vlfAsK+5NjyoiBp/Gg1AsVRuW93mDflVR55+MK9TPZbVX8JdQK
         2FJg==
X-Forwarded-Encrypted: i=1; AL+hErH426irKVD1dicDVoZyEb6ABhp6WHcl+iwLJTZnl8xX3p2HNiyy5y1TOznTk3Kb7zg6gPYcFzJ+lnwPx5v/DuupyBEG@vger.kernel.org
X-Gm-Message-State: APuU4Z9QABtRTEwlGrFVJN5SAzKlfHOr89La3lovvZpaOe1fJv3wbdfq
	8+PhhVnckRYlx7JRzgmEEOeS3D0Uj5quc2h6XJKsTxwbh5L+sGJP8XtuY/jW3A==
X-Gm-Gg: AZFdTZfFCGyoWvziuB71GZIzRbUkQiz6pAeKFsT4mS6GbueX6s8bt91E80LqEvU3Zkp
	ueyOgEFFNK8r04c8z9mumjQqyO4Qh18HrEqk0fGDHXqFBGy8WIAEXwpx5pG79qDsaYkvSj8/3Jd
	rbeozC+axZiiI0BpwQaou35PjkRptCDsCfFyU8GkXeISMQRnWNOvKgEqXNFOOXjnZbERxblfMKJ
	W3+sFNhYBTca7eQx2ft4Trb5T/MBG47CS9t03f+nJdhDMYF/8N+Ptw7HXT1anCm3BoA9XBuFoDk
	Z6HoTffGF00j7n/iUFcq7pDNNmi51Zx6qx9k17495qrU7XIXeU4mNPFcAGLbrbElVWfwnn5hwSN
	mSp9LNrjTsHHCLp5vG/VStSX1NQz81MCnaY/62ir5YJi66Qu7SLzMHeyjYheKVKUtQhRWzfZP7c
	LBWBvgB40tmDCGBTLrhZsg4HCZxuIY1jNVakLc1lGcuihKkPWkmB2rWmNtFG9AVS0BbLi4O+kIC
	Q77xNPvlejxxkWUN/ApdquIeo23VNxe++FdldPHgmBa2TttYfHOUp/KMhEDvI6CatXGAX6TT05h
	QYOaMuO9rqKLZvmTIs68G7ry6SWjRI220r07X0AB52rkM1vzgzI=
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr5252313c88.32.1795245401808;
        Fri, 20 Nov 2026 23:16:41 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:2f:4d17:70ef:2f53:72ff:31c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm20880373c88.9.2026.11.20.23.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:16:41 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx (8A3D)
Date: Sat, 21 Nov 2026 12:45:33 +0530
Message-ID: <20261121071534.28473-2-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121071534.28473-1-nonameblank007@gmail.com>
References: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
 <20261121071534.28473-1-nonameblank007@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Victus 15-fb0xxx (8A3D) takes victus_s_thermal_params,
which causes it to register as incorrect EC layout while cold boot.

- On other hand windows Omen Gaming Hub registers EC offset as 0x95,
- which is set in driver as HP_OMEN_EC_THERMAL_PROFILE_OFFSET.
- So, address it by adding victus_s_ec_thermal_params.

- Also perfcontrol modes as performance (0x1), default (0x0), quiet
(0x3) registers. So, add support for quiet mode.

Tested-by: Sourav Nayak <nonameblank007@gmail.com>
Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af86800e..0166b9cc4d9e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -125,6 +125,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
 	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
+static const struct thermal_profile_params victus_s_ec_thermal_params = {
+	.performance	= HP_VICTUS_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_THERMAL_PROFILE_QUIET,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
@@ -168,6 +175,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static const struct hp_wmi_board_params victus_s_ec_board_params = {
+	.thermal_profile	= &victus_s_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
 	.fan_profile		= &victus_s_fan_profile_params,
@@ -251,7 +263,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
-		.driver_data = (void *)&victus_s_board_params,
+		.driver_data = (void *)&victus_s_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
@@ -2395,10 +2407,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	 * but logically it should have tp == 0x30 || tp == 0x31, as
 	 * corrected by the Omen Gaming Hub on windows. Hence accept both
 	 * of these values.
+	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
+	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == victus_s_ec_thermal_params.low_power) {
+		*profile = PLATFORM_PROFILE_LOW_POWER;
 	} else if (tp == victus_s_thermal_params.balanced ||
 		   tp == omen_v1_thermal_params.balanced) {
 		/*
-- 
2.55.0

