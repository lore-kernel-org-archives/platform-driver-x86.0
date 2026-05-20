Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6201A9FBD
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 03:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246122; cv=none; b=KfyGRZg+WENEdEyq6RnOuEkvcYILPv57WFWEfSljyc9Ty1n7tOs5jWP/iCpQ24936hNUAUFech4J2j6iXjVvm0ikYq+y73Z9eQC9wyiXB6FDmV++OzorjnkkZaTh3Z5VrZrSo4iLZSL6jzslZkL/6eyiC25G8/lHdSWKbrjdROM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246122; c=relaxed/simple;
	bh=d7ez1GRL38FBx3wpmdCF5EmoyOpP4/c1AH4HwrRN6jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmnlrlbSTdzrbmmyAu5NK5CivVSTYprEQtntDKPCfLuregwEpY5t04sT4E6mTBjsYg+1ABGzEnn3S25aAODD7K7AdoHv5kjKKj03x/LxhHBAXKvq3Z0ADb6AGOpLfCQxaJYv35uxq93PbQQYWV6KONAB4RBtczIEbrL9kl+X3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEEm0txW; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEEm0txW"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-367d88b9940so2711319a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 20:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246120; x=1779850920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2Uy8hKq9UKUQdjKXPeSk9ybJyo9GMWMZQQh0rpwiOQ=;
        b=cEEm0txWOB7x7NS3SH/QR2hUwTmbE/vaJy9TBxtnp241i9fb6uTO9tnknMbKcbfiJd
         Jxz8HHOWxLGCVXhOd5bjDC9DCSFBomhgwWkAICyHAkrqyEiZUQw76rxCJLHt+d/h2ES3
         Dsa6K1X056FNpXC4HqoTGEUhTo2NhWfRHTPZmUzVIVTV9JAujJotx6pJALQ6PFAFqDN3
         a+RLA3i77w3CZwWX4dgLk9m1cKFB9TwhNkwuhVwUj3NQIWwNWaP3Ig91Y1jtxAnImGd8
         ++6u7aTLEJobIGguOdk5ESDmQxpJR5jYmu7V00lqO0cMwErDPx6v4oWafDsjcFug4ZnX
         NlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246120; x=1779850920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2Uy8hKq9UKUQdjKXPeSk9ybJyo9GMWMZQQh0rpwiOQ=;
        b=StquNCwajxaJLrlpAWkOHjv/OHvCcP3+z26fUb26mRVQ4iGfG3fxH5r9RZJdafDkvk
         A18MNHBCdBHF6i2XHehyRamxsyFhRvS+Sm6vxKjSVhdqnngq+gZjlI48Ps8D9cIbuuML
         dRTOqc5ndQuABl0NJoL3vRa2V6g9c2cDbpFQV/ppx7/D0Byqa8ontBELmZwOqKcsYQfO
         kd3WWxvc4z5sY7JhgPg9QNKzTE7o6Q0IX6CDWeGFxEByqPDtyjf0tsmvzeUVGJIqMW+5
         S4QMFwNFWVOPv35+IuX8n/kJhEn8lvzPCuqLSo51d56CsMFLOLL8CSbhu9ockDvWtAA1
         yROA==
X-Gm-Message-State: AOJu0YxLLvcPWzr5Ydu0eg0+Mv/28R5Iq/5/H5bc4YjA5fQYcK9S2805
	CCbUQotPbP/Ek/oZfwae55CF3BELxvgVbQUJBc5ujotpqB4TrWZ251fAGt63GUC9FJc=
X-Gm-Gg: Acq92OFzwXQbwjX0trepmtxkbDJKQRFxFeOgTJ6wwGnV0Zcri5kqfCRmNXMcxtUI5RZ
	npAD6PiOd+F0+PNeVGv9OQ/AGe4TCJvcUuVtYuxj3hhTZSa1Krva4Ey/fyDLuqNB7TRJNHIZBsj
	9zfEG1dItaYN284+WVtREBsoRJjfxky7EG9OxZ4Olc9UPkxSyxDzREafd7uH1TfqBaiH8c5+hpa
	bxTzLF3eg5/cscwbEvn61Y5bT35fSIGy2yhP57nNVcOMlR5H9u5x+zo0aOmIMffh4m6qe/TWIzu
	Mifh0BCHXqKfMHRJMzMwwsvrOJIBERrOQL4TMIoGFM8HENaaZv1ZOLbZHSIRNU5wYoUwX0krvYM
	f1PGKMi8A4tfOVuYNo2y0oa8MHY+hDnL3rKHrinrUHedQC2p5HRis2o6LAqUGVASDi+eHBn3hie
	ls4HHfwNiB3VDfPBy/uwEF847pafZcbfLv+Q==
X-Received: by 2002:a17:90b:53cf:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-369518b206cmr22198440a91.5.1779246119907;
        Tue, 19 May 2026 20:01:59 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm19869676a91.5.2026.05.19.20.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 20:01:59 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v4 1/4] platform/x86: hp-wmi: Introduce board-specific feature data
Date: Wed, 20 May 2026 08:23:22 +0530
Message-ID: <20260520025325.103701-2-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520025325.103701-1-radheykalra901@gmail.com>
References: <20260520025325.103701-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The victus_s_thermal_profile_boards DMI table is about to carry more than
thermal-profile data. Replace the direct thermal_profile_params
.driver_data pointers with hp_wmi_board_params and rename the table/setup
helper accordingly.

No functional changes intended.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 82 ++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7..b226695 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -133,11 +133,29 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
 };
 
-/*
- * A generic pointer for the currently-active board's thermal profile
- * parameters.
- */
-static struct thermal_profile_params *active_thermal_profile_params;
+static const struct thermal_profile_params *active_thermal_profile_params;
+
+struct hp_wmi_board_params {
+	const struct thermal_profile_params *thermal_profile;
+};
+
+static const struct hp_wmi_board_params victus_s_board_params = {
+	.thermal_profile	= &victus_s_thermal_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_board_params = {
+	.thermal_profile	= &omen_v1_thermal_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
+	.thermal_profile	= &omen_v1_legacy_thermal_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
+	.thermal_profile	= &omen_v1_no_ec_thermal_params,
+};
+
+static const struct hp_wmi_board_params *active_board_params;
 
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -187,67 +205,67 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25",
 };
 
-/* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+/* DMI board-specific feature data for Omen and Victus laptops. */
+static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{},
 };
@@ -1904,7 +1922,7 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
-	struct thermal_profile_params *params;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
@@ -2673,23 +2691,20 @@ static int hp_wmi_hwmon_init(void)
 	return 0;
 }
 
-static void __init setup_active_thermal_profile_params(void)
+static void __init setup_active_board_params(void)
 {
 	const struct dmi_system_id *id;
 
-	/*
-	 * Currently only victus_s devices use the
-	 * active_thermal_profile_params
-	 */
-	id = dmi_first_match(victus_s_thermal_profile_boards);
+	id = dmi_first_match(hp_wmi_feature_boards);
 	if (id) {
+		active_board_params = id->driver_data;
+		active_thermal_profile_params = active_board_params->thermal_profile;
 		/*
 		 * Marking this boolean is required to ensure that
 		 * is_victus_s_thermal_profile() behaves like a valid
 		 * wrapper.
 		 */
 		is_victus_s_board = true;
-		active_thermal_profile_params = id->driver_data;
 		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
 			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
 				dmi_get_system_info(DMI_BOARD_NAME));
@@ -2724,11 +2739,8 @@ static int __init hp_wmi_init(void)
 			goto err_destroy_input;
 		}
 
-		/*
-		 * Setup active board's thermal profile parameters before
-		 * starting platform driver probe.
-		 */
-		setup_active_thermal_profile_params();
+		/* Setup active board feature data before starting platform driver probe. */
+		setup_active_board_params();
 		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
 		if (err)
 			goto err_unregister_device;
-- 
2.54.0

