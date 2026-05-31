Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222B5285CBA
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212663; cv=none; b=cD4ni9zxJBQ8YEjhrEFmOSs3VqfaRw7UxOYePwy375hpcab3OqE8khN+k/Dap9LEZF4u9Gf9mk6MuR1nNm+c25X+vl49p1thAAEqG2LlBJjjyX4f/DgXNkbRBHwJS1zufdZ8cJJz0XEnfr1yFHt/uGUzy078XkchpwcyZ5m8sQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212663; c=relaxed/simple;
	bh=7r1EiJ9qN2dsRnGSYfZtlezzxKUywY3ohDwFFdl+PLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sf0IpeHB/PJiMMqweQRHKG+Tw+KH7MiCX1ntAiiSGio8R2T8Pgn8zRzb9I5ZyHh++Bim+YTH1H8Fla8VbOgGfzM7BgCkQOTqLB2ebzmPxc6A162XlYFpm+tiwcsp3keLgECFdLgsTZpYpR2hoi+OAayo6KH2FEQ2+JUGIB5ioj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcDwCpem; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcDwCpem"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-841513664bbso5046444b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212661; x=1780817461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCvv9vc7EVK/V4+K638dN/8p0E30PWSpe0HlUt6ed2c=;
        b=pcDwCpemQdgIa4UWf3GApqCAyG7KaqUeSdFBx9RhkvMXqHpm0a/XZ+Q8ZFfKoGnQDf
         LvrqASuhGDAZcMVWTIK52NlJ4QO7maOE4PK9OPMet6P5iIb1LK1iDqsfxJPxQnsmJAW1
         f1pOApxPdKn1FqWiR6JCez7Q9P3R7LyOt3bHtXoeVUfqyGYZ/qLJHAjywMhy6DQ/ydiC
         h0VN6ITcQqVaxXfkI8KxaQxjjuPe6p4YPFd0sGdDQ3V4ygOTZCwqXNDJ2+PY9W4eNtwd
         fPNj+qPCj7y6ZpgxSMWJoFnANap1l3sDPiMwMHkw7WNq+7efPup/DNOg01+/xA6bkdkT
         X7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212661; x=1780817461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCvv9vc7EVK/V4+K638dN/8p0E30PWSpe0HlUt6ed2c=;
        b=iv6hzV9ni5NJywoev7j3Op+X07YL2GKnvQz/iLwb0YPKXmGxmJIGeLV7K/jQqGIZiG
         puCabRivzCy6lH1CAdzecFZRb+T98mqxqkHUE9jVJt2IDy5ffrVge+KMKvxH298v/abG
         hCU0uGrjlRX+3tKaKCtLMfsD+qwrQ/jZNAG7Igzn+DhyhZdRJKE3TVGSYNJG7X5JmhnJ
         hgkPLTv2ku9VH7gCX2H0XMxi1qb5Od3jZbToGMOh1Zw/bgfrHGUdIPz9IVYiaKHBYs3Q
         ZqR6IaZqvD7L6vj3xjpKWu9i1rk7NWchviBoWVcN6F05YkK9wJfqoyp+/K3w1paGHogs
         ba0g==
X-Gm-Message-State: AOJu0Yz2b8Jy9tthIahyRH6yOBPCJDrabPyoCbW57BslPJfGKFSmkyeF
	3uYtdUx5OKEpgPLV+NK7hoOxTbrB5HhpJ9JD4sFJC0D4NeBYppQPhlybRhhK8dzc2X8=
X-Gm-Gg: Acq92OFQM2SWBjHQm4HhwMMFVDtD0+8TvBIMtLcH3c+N2rmc78O3PSatihqgaSxMN7y
	znhLCpQGoaL3azf5anGsKzBznPifL0CDUwJnuUAKzGoMEQ6N5+juolqcDPoTJvNVVwwfwJH2k0D
	s3viakSvjMja/16im0DQ4ca9JhvOy2ne/SgRSU5giazOURBfig2QW5jzuJV75EtBTWZRO3oCBZf
	NsNmHcFZEPU7b3/aRQJ1c9rU3vGm4St3Io1YMpSxqLDDXBHqbHfqA2f74Ebd9qyIZIzz4qplvpZ
	be8F25VeK+VzNXzjdMCjYn0HueDrTF6/lt4+GuENDZdn6uKZd5FPAT+i1DQ5yrwbq6u76vbUoWN
	0fh/iMQRxcos+uL6S4nN50wLAy9bi+WjW9pNqBdcisWTyMo5l3dHakVnE3e/SjLsGLr5EfDSeRC
	qcBJljBT0p4qhEy8H+hoe6qXRgMzbev1fSwr2aA4XFcbGBPw==
X-Received: by 2002:a05:6a00:84f:b0:82a:146d:36a3 with SMTP id d2e1a72fcca58-84225a0f119mr4708080b3a.21.1780212661261;
        Sun, 31 May 2026 00:31:01 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:6221:e402:4ae3:a02c:75da])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm7597090b3a.26.2026.05.31.00.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:31:00 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v8 1/3] platform/x86: hp-wmi: Introduce board-specific feature data
Date: Sun, 31 May 2026 13:00:34 +0530
Message-ID: <20260531073036.195326-2-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531073036.195326-1-radheykalra901@gmail.com>
References: <20260531073036.195326-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hp_wmi DMI table is about to carry more than thermal-profile data.
Replace the direct thermal_profile_params .driver_data pointers with
hp_wmi_board_params and rename the table/setup helper accordingly.

No functional changes intended.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 121 ++++++++++++++++++++-----------
 1 file changed, 77 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 48292cc..4a795e6 100644
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
@@ -187,75 +211,75 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25",
 };
 
-/* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+/* DMI board-specific feature data for Omen and Victus laptops. */
+static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
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
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
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
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{},
 };
@@ -1862,7 +1886,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
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
@@ -1874,10 +1901,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
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
@@ -1912,12 +1939,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
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
 
@@ -2183,6 +2210,7 @@ static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
 static int thermal_profile_setup(struct platform_device *device)
 {
 	const struct platform_profile_ops *ops;
+	const struct thermal_profile_params *params;
 	int err, tp;
 
 	if (is_omen_thermal_profile()) {
@@ -2214,13 +2242,17 @@ static int thermal_profile_setup(struct platform_device *device)
 
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
@@ -2681,24 +2713,25 @@ static int hp_wmi_hwmon_init(void)
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
@@ -2733,10 +2766,10 @@ static int __init hp_wmi_init(void)
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

