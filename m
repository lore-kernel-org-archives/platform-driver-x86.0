Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D13DA5A8
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370451; cv=none; b=g3qrm5e2EKifRxZV8lAsk3mXsR1ZU6p+9g+W5sT01VwCulAfDkOhqGU5E12YjzUH5knPsynB7htTkFj/r34WdxAud3xYRJ7POffo3gki+Qae8i3ao535xcHG4LWCk4Oa9yfCQWq60rOyQLpZKgdIkEnVXmjyyUM+0N5fjEU8TwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370451; c=relaxed/simple;
	bh=nX4mP2HXupZbjSrwnVN2WBguoaxQS/qJBi1w5tfB7U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dru9TOWzrJijZw/UX0Ztq1Kwv5G2e7lP1wo//OkzH7M43gARGOjDlHd6TdZBhu/iaYzKIKhwtXIOc5EktPGNSK88iZTNe026rFf1+Wqee2qY8/B7qgEMNecVxCPCWczdZvF0yvPtqEl08zoss5SsfASMtIl8wbim8ULgERZuqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mc9h4MFk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mc9h4MFk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ba6485d219so45274395ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370450; x=1779975250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi6cANcooSHVXyeUoo2CUYYg0EbHCnaJckTcF5lmhfQ=;
        b=mc9h4MFk/yWYKBO0QkDMVLhS+ulw1YJ46pHq47J0otdQ7+GICOqybknwMxqkgCeW8s
         V//Rpi1GoGnD2dBLMtq6o5Di9wxrYypTf/i3J+HShbVm14GQGuj8MuBLQn9uHG9D0lxb
         5oDX2POwIiy9cgeQ8VwmOQCdWoV0zt0I7J+unjn23U68tjCc2McaH0hltLyc0u3hrBzg
         4iLr6y25ZIKCVrb2Vmz3gI4bcYAHhhm5lHZFp6+CQo9HhDhpovhKsQRMR+U3FkTPIwu5
         Q0dLjUvHM0qGqS8BupqaXwXxZRbXyotyfBYlqpGZWEiNUPWGaqDD+OLBLzeJaBC8f684
         Tc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370450; x=1779975250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oi6cANcooSHVXyeUoo2CUYYg0EbHCnaJckTcF5lmhfQ=;
        b=VwF0cYHIfZZel6ZCM+AeEkTq8opUf6B8mb+JbAcOr0+WqXADPaWez+vL5jv9+dW/Xl
         Ybf1h62+9Ji0zp2l3khBnOyzSsKxAFqCl8bGG/X/+D5vrilXH9wYx7IJNe6z7+f98nNn
         U64Glildm2qeuNDZiQaoHWx0qZQBta/GZnZ3Hotiy0Rq3Cig/UXP8+jNR4gQ+rTALvnx
         aGJwztJQAjYt3WYRjDFqs6ZGYb4bXaQRlcqycufsrmvKF1G5QywdzGVlXC4mMDKAg0Hm
         4e89KdQ+zCKjXsczdJW4J5UKgHif+9JmFxkSsF1XzmQuoxiXbIXsRawH+d1r+DgveiuO
         kcKA==
X-Gm-Message-State: AOJu0Yyc+nWPguqHiAZbup7Mr7GSaHMieo6dU83xbh6/7Dqury/lTsyr
	hC1ozZYSQPKrJeNcZTG+i1EuCb0Mi1PjmClhF3guNRlDb2V65jXu41donR0dRyGRspQ=
X-Gm-Gg: Acq92OF/F22J93+PjGSNA8DQPPFdbekP6J2tCdq0sCJPwIXigPsVtIgcyCv0MRMj2VU
	TgLdU6HBcvY1zbOE8bgmvF1y786gMqSSKlD9cqombuev4aJgFao6ftG2neUUuSOkr+zR/YYQ4CN
	VHKenzz2E7gTk/NfTWURR56500jU1ztaPHxhSGtyUkgvs2K/m89G0M+Ms6W9qKwTF5ubNvJY5SH
	KvK3oyx9EIqCPe7aBO7582iVsJV2AMWtNCzmnzsBlmcJ9oLsnfEv9giCeyIi/gD/ZUHMTx1ILcV
	/iVFXjjIIJXRByQPnxgal3iV9PnriX2PLLME9Dl2FDEbnTE/Ur9d+uDy41214xf8+978gU0OVLx
	sykfNQPhRrQ1Erqz+Bl+zSLVzMG5qXa+4FfLC/GzF8E4A+XuLf03PAU4KgPwCL6awIhJ4LlH6Zn
	Lo/2xOFekssJim5oI4gsFzffJcEqt3x8hKOQ==
X-Received: by 2002:a17:902:e5cb:b0:2bd:4d4b:9143 with SMTP id d9443c01a7336-2bea2fceb47mr32434085ad.8.1779370449378;
        Thu, 21 May 2026 06:34:09 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea929d774sm12284785ad.32.2026.05.21.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:34:08 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 1/4] platform/x86: hp-wmi: Introduce board-specific feature data
Date: Thu, 21 May 2026 19:03:48 +0530
Message-ID: <20260521133351.1512718-2-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521133351.1512718-1-radheykalra901@gmail.com>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The victus_s_thermal_profile_boards DMI table is about to carry more
than thermal-profile data. Replace the direct thermal_profile_params
.driver_data pointers with hp_wmi_board_params and rename the
table/setup helper accordingly.

No functional changes intended.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 117 ++++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7..280861b 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -133,11 +133,35 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
 };
 
-/*
- * A generic pointer for the currently-active board's thermal profile
- * parameters.
- */
-static struct thermal_profile_params *active_thermal_profile_params;
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
+
+static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
+{
+	if (!active_board_params)
+		return NULL;
+
+	return active_board_params->thermal_profile;
+}
 
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -187,67 +211,67 @@ static const char * const victus_thermal_profile_boards[] = {
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
@@ -1854,7 +1878,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	u8 current_dstate, current_gpu_slowdown_temp, tp;
 	const struct thermal_profile_params *params;
 
-	params = active_thermal_profile_params;
+	params = hp_wmi_thermal_profile();
+	if (!params)
+		return -ENODEV;
+
 	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
 	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 		*profile = active_platform_profile;
@@ -1866,10 +1893,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 		return ret;
 
 	/*
-	 * We cannot use active_thermal_profile_params here, because boards
-	 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
-	 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
-	 * Gaming Hub on windows. Hence accept both of these values.
+	 * Boards like 8C78 have tp == 0x0 || tp == 0x1 after cold boot,
+	 * but logically it should have tp == 0x30 || tp == 0x31, as
+	 * corrected by the Omen Gaming Hub on windows. Hence accept both
+	 * of these values.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
@@ -1904,12 +1931,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
-	struct thermal_profile_params *params;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
 
-	params = active_thermal_profile_params;
+	params = hp_wmi_thermal_profile();
 	if (!params)
 		return -ENODEV;
 
@@ -2175,6 +2202,7 @@ static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
 static int thermal_profile_setup(struct platform_device *device)
 {
 	const struct platform_profile_ops *ops;
+	const struct thermal_profile_params *params;
 	int err, tp;
 
 	if (is_omen_thermal_profile()) {
@@ -2206,13 +2234,17 @@ static int thermal_profile_setup(struct platform_device *device)
 
 		ops = &platform_profile_victus_ops;
 	} else if (is_victus_s_thermal_profile()) {
+		params = hp_wmi_thermal_profile();
+		if (!params)
+			return -ENODEV;
+
 		/*
 		 * For an unknown EC layout board, platform_profile_victus_s_get_ec(),
 		 * behaves like a wrapper around active_platform_profile, to avoid using
 		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
 		 */
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
-		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
+		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+		    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 			active_platform_profile = PLATFORM_PROFILE_BALANCED;
 		} else {
 			err = platform_profile_victus_s_get_ec(&active_platform_profile);
@@ -2673,24 +2705,25 @@ static int hp_wmi_hwmon_init(void)
 	return 0;
 }
 
-static void __init setup_active_thermal_profile_params(void)
+static void __init setup_active_board_params(void)
 {
 	const struct dmi_system_id *id;
+	const struct thermal_profile_params *params;
 
-	/*
-	 * Currently only victus_s devices use the
-	 * active_thermal_profile_params
-	 */
-	id = dmi_first_match(victus_s_thermal_profile_boards);
+	id = dmi_first_match(hp_wmi_feature_boards);
 	if (id) {
+		active_board_params = id->driver_data;
+		params = hp_wmi_thermal_profile();
+		if (!params)
+			return;
+
 		/*
 		 * Marking this boolean is required to ensure that
 		 * is_victus_s_thermal_profile() behaves like a valid
 		 * wrapper.
 		 */
 		is_victus_s_board = true;
-		active_thermal_profile_params = id->driver_data;
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
 			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
 				dmi_get_system_info(DMI_BOARD_NAME));
 		}
@@ -2725,10 +2758,10 @@ static int __init hp_wmi_init(void)
 		}
 
 		/*
-		 * Setup active board's thermal profile parameters before
-		 * starting platform driver probe.
+		 * Setup active board feature data before starting platform
+		 * driver probe.
 		 */
-		setup_active_thermal_profile_params();
+		setup_active_board_params();
 		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
 		if (err)
 			goto err_unregister_device;
-- 
2.54.0

