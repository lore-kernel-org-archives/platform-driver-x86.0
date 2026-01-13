Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E5134E74D
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768328775; cv=none; b=mFjSB9f/Gu1cXtHjfi0oNJGYxwPuf5BN14k6+qnLxOg2xg6cNAJT8q/SF4RIKEfn2BJrqzxHxQ7hn9uVFGadn/HTAca4haeorf7rpDk0AAWr+H8it2EOGZ7BWnz2OIQpCu/BlRUTiNK2/C6oqTXf0BLcoxhudJ7ol593FjZM/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768328775; c=relaxed/simple;
	bh=E8aqnFvM4K3Nt8zDxyQsk5TKp4feIJvooiZvLGC+yYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JsYirMm0HnoCoUFFhiH2lAo95x0w5SgFYiBF86y5M1ZK5lbnsLgcltmGlVhvmVtscGtmaVG0t7tNk95GbzwGVKt/HV4mNy7X+eIC1J2rIjhg8yCE3OVcB4k4sxJ+AJbnmWyX5MNWfWrsGkuThkM70I+ibakliEJENT1ZeynPCWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUbqr5th; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUbqr5th"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f1bc40b35so85604635ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768328773; x=1768933573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0aB7par7PXxsxJdCMBUjL222cnm/OcauYEGIjh6sLU=;
        b=LUbqr5thGFfcgwASLMkgVqDrIfrb/ffqsaoEPM/EvJt4dedJlgD2DdDSj6pKTAZ3J+
         w2uUefFOlNNJU8c6JwJebZDe0E9Ewql/7AO2QushlrUz027qf5mgwXamUvB7CAwXv9iP
         mH/el1ECQvPFt+Fu7J8TTmyj6hVHHbFtK8kI02xjl71mgeG1yTebjDEr2/nUHK9N1M2U
         V7474ONg/GJfYzkQT8d4aroa2crPq0Puuia0WWLYLYmzRL8IxtbZCCeieMj9U8TL/oQ1
         BMwdksPdsisgMUTsgue6bIbaE3Cqa+0LDmvKjlNXdRHbkXrEsdlVSG3ybHW4ZKzIC9Ne
         qcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768328773; x=1768933573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0aB7par7PXxsxJdCMBUjL222cnm/OcauYEGIjh6sLU=;
        b=q0Kn8ILLw2u7nEgluk++MP8I0wP2p1idG5bXNDd3Dx7Ep1yLKpT7Q9+q/FEVMtQEgj
         27+nMLDIbOiNLEn7ILCqBBn8coRcKN+k2CYAIvknX3Wnk5HYBOnUUMZXZwHbWgDyQ07N
         sNvbs4SjDIlJoWwjJT58YTgt2tpMrzZjoVnpU0XMGfHIdc9OLWKZ5uMy0sVqde8OpAVb
         Cz7wdToChOg3nqA1gzwQ/iaYzNOeMkBkM6h9K3KbtcKS+3LIQ7onP6TCk5/ETcFWgQc0
         LqIDhPUC49I6mDBPiRWVCoEcl4drisNWPqGker9IRndKk0NKP6pfTdGAfpwA06AhRHTv
         zd7Q==
X-Gm-Message-State: AOJu0YyC3367Yp/ChCULdP5iw+mp1qkWhsUOgzfuKEfwzV6YcaFHcVFg
	GgoLQVNky4mXDmhuYwLYgNLf+6IP/xoKrjCcUXB2NXutWUYU2YTBJK6W
X-Gm-Gg: AY/fxX55ytGlx5oCUkEJEBun2Z0VVW6gKg+oP3F6KR28fxiySGEKfKpWz+YFOJAiLpV
	kQpiwDdQh8bTf1hkIqsiw5tRjlQgqEuEzInOKaTizkHRNshCuKYKjE9lT/yLVwQt0F3h2hqVk0N
	2v+AeBgCnlRZVrrzmGAbpLbhHvVrPl2iOKrAhUA0n6fqUuswcUrpiwbaik+ISPu/5nHT4guWm9m
	rog6QYG5EtOAUbjFnJpb9qvfIpr9c6jAUYLm5wTp3p6BuH4TNVm+kcLW75iazybiDMFbbcrThAV
	z17UkzWA1EEWQbaHctXJe63d8t0vM60jbKTYwmdkkaKsNDKnpsaaNPJODs8wQgn2H5Vgiij0qax
	30FAYdG6AempawyIOtNbY3312dV7K3pnOILn94K62EKkFBt/9mLLQR3ilhiNODrwTZcu+0nPgXn
	OZi94Hy40vhM7upUdwlpYyVw34/CT3Aw==
X-Google-Smtp-Source: AGHT+IGnj1FApU9S7k9sNbYjdbdsD2R4IM2jcjcEar5SqGQSsaYZ3atmHVugnqUfcfkXalG1QStcRg==
X-Received: by 2002:a17:903:2a87:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a3ee487136mr215392495ad.38.1768328773242;
        Tue, 13 Jan 2026 10:26:13 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88f1sm204032685ad.78.2026.01.13.10.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:26:12 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v5 1/2] platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
Date: Tue, 13 Jan 2026 23:56:03 +0530
Message-ID: <20260113182604.115211-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113182604.115211-1-krishna.chomal108@gmail.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Omen 16-wf1xxx (board ID 8C78) currently sends the incorrect
Victus-specific thermal profile values via WMI, leading to a logical
inconsistency when switching between platform profiles.

The driver currently uses Victus S values:
0x00 => Balanced / Low-Power
0x01 => Performance

However, Omen Gaming Hub logs / EC register inspection on Windows shows
that this board is intended to use:
0x30 => Balanced / Low-Power
0x31 => Performance

This patch corrects the thermal profile command values to match the
values observed from Omen Gaming Hub logs. The performance benchmarks
and peak power draw (from both CPU and GPU) show no observable change
with this correction (suggesting that the firmware is currently tolerant
of the incorrect values). However sending the correct values prevents
potential regressions after future firmware updates.

Refactor victus_s_thermal_profile_boards from a list of strings to a
dmi_system_id table and move the lookup to module init. The new struct
thermal_profile_params is used to store board-specific WMI parameters,
allowing the driver to cache these values in a static pointer. This
avoids repeated DMI string comparisons and allows marking of DMI table as
__initconst.

Testing on HP Omen 16-wf1xxx (board 8C78) confirmed WMI codes 0x30/0x31
are now sent, resolving the logical inconsistency and ensuring the value
visible in EC registers match the Windows state for this profile.

Fixes: fb146a38cb11 ("platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support")
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v3:
- Fixed minor formatting issues.
- Renamed struct field `eco` to `low_power` for consistency.
- Marked the DMI table as __initconst.
- Moved DMI lookup to hp_wmi_init() and save the active thermal profile
  params.
- Added a static boolean flag to optimize is_victus_s_thermal_profile().
Changes in v2:
- Refactored `victus_s_thermal_profile_boards` to use `struct dmi_system_id`
- Implemented `driver_data` to handle thermal profile parameters,
  replacing the conditional checks in `platform_profile_victus_s_set_ec`
- Moved enum definitions for thermal profile values earlier in the file
  to support the new `struct thermal_profile_params`.
---
 drivers/platform/x86/hp/hp-wmi.c | 179 ++++++++++++++++++++++---------
 1 file changed, 127 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..24d065ddfc6a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -53,6 +53,66 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
+enum hp_thermal_profile_omen_v0 {
+	HP_OMEN_V0_THERMAL_PROFILE_DEFAULT		= 0x00,
+	HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE		= 0x01,
+	HP_OMEN_V0_THERMAL_PROFILE_COOL			= 0x02,
+};
+
+enum hp_thermal_profile_omen_v1 {
+	HP_OMEN_V1_THERMAL_PROFILE_DEFAULT		= 0x30,
+	HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE		= 0x31,
+	HP_OMEN_V1_THERMAL_PROFILE_COOL			= 0x50,
+};
+
+enum hp_thermal_profile_omen_flags {
+	HP_OMEN_EC_FLAGS_TURBO				= 0x04,
+	HP_OMEN_EC_FLAGS_NOTIMER			= 0x02,
+	HP_OMEN_EC_FLAGS_JUSTSET			= 0x01,
+};
+
+enum hp_thermal_profile_victus {
+	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
+	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
+	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
+};
+
+enum hp_thermal_profile_victus_s {
+	HP_VICTUS_S_THERMAL_PROFILE_DEFAULT		= 0x00,
+	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
+};
+
+enum hp_thermal_profile {
+	HP_THERMAL_PROFILE_PERFORMANCE			= 0x00,
+	HP_THERMAL_PROFILE_DEFAULT			= 0x01,
+	HP_THERMAL_PROFILE_COOL				= 0x02,
+	HP_THERMAL_PROFILE_QUIET			= 0x03,
+};
+
+struct thermal_profile_params {
+	u8 performance;
+	u8 balanced;
+	u8 low_power;
+};
+
+static const struct thermal_profile_params victus_s_thermal_params = {
+	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+};
+
+static const struct thermal_profile_params omen_v1_thermal_params = {
+	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+};
+
+/*
+ * A generic pointer for the currently-active board's thermal profile
+ * parameters.
+ */
+static struct thermal_profile_params *active_thermal_profile_params;
+
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
  * This was obtained by taking a look in the windows omen command center
@@ -99,12 +159,40 @@ static const char * const victus_thermal_profile_boards[] = {
 };
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const char * const victus_s_thermal_profile_boards[] = {
-	"8BBE", "8BD4", "8BD5",
-	"8C78", "8C99", "8C9C",
-	"8D41",
+static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
+	{},
 };
 
+static bool is_victus_s_board;
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -225,42 +313,6 @@ enum hp_wireless2_bits {
 	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
 };
 
-enum hp_thermal_profile_omen_v0 {
-	HP_OMEN_V0_THERMAL_PROFILE_DEFAULT     = 0x00,
-	HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE = 0x01,
-	HP_OMEN_V0_THERMAL_PROFILE_COOL        = 0x02,
-};
-
-enum hp_thermal_profile_omen_v1 {
-	HP_OMEN_V1_THERMAL_PROFILE_DEFAULT	= 0x30,
-	HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE	= 0x31,
-	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
-};
-
-enum hp_thermal_profile_omen_flags {
-	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
-	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
-	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
-};
-
-enum hp_thermal_profile_victus {
-	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
-	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
-	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
-};
-
-enum hp_thermal_profile_victus_s {
-	HP_VICTUS_S_THERMAL_PROFILE_DEFAULT		= 0x00,
-	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
-};
-
-enum hp_thermal_profile {
-	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
-	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
-	HP_THERMAL_PROFILE_COOL			= 0x02,
-	HP_THERMAL_PROFILE_QUIET		= 0x03,
-};
-
 #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
 #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
 
@@ -1581,15 +1633,8 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
 
 static bool is_victus_s_thermal_profile(void)
 {
-	const char *board_name;
-
-	board_name = dmi_get_system_info(DMI_BOARD_NAME);
-	if (!board_name)
-		return false;
-
-	return match_string(victus_s_thermal_profile_boards,
-			    ARRAY_SIZE(victus_s_thermal_profile_boards),
-			    board_name) >= 0;
+	/* Initialised in driver init, hence safe to use here */
+	return is_victus_s_board;
 }
 
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
@@ -1672,25 +1717,30 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
+	struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
 
+	params = active_thermal_profile_params;
+	if (!params)
+		return -ENODEV;
+
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
+		tp = params->performance;
 		gpu_ctgp_enable = true;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		tp = params->balanced;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_LOW_POWER:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		tp = params->low_power;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = false;
 		gpu_dstate = 1;
@@ -2227,6 +2277,26 @@ static int hp_wmi_hwmon_init(void)
 	return 0;
 }
 
+static void __init setup_active_thermal_profile_params(void)
+{
+	const struct dmi_system_id *id;
+
+	/*
+	 * Currently only victus_s devices use the
+	 * active_thermal_profile_params
+	 */
+	id = dmi_first_match(victus_s_thermal_profile_boards);
+	if (id) {
+		/*
+		 * Marking this boolean is required to ensure that
+		 * is_victus_s_thermal_profile() behaves like a valid
+		 * wrapper.
+		 */
+		is_victus_s_board = true;
+		active_thermal_profile_params = id->driver_data;
+	}
+}
+
 static int __init hp_wmi_init(void)
 {
 	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
@@ -2254,6 +2324,11 @@ static int __init hp_wmi_init(void)
 			goto err_destroy_input;
 		}
 
+		/*
+		 * Setup active board's thermal profile parameters before
+		 * starting platform driver probe.
+		 */
+		setup_active_thermal_profile_params();
 		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
 		if (err)
 			goto err_unregister_device;
-- 
2.52.0

