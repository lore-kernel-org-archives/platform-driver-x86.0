Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DC34FF48
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 12:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887232; cv=none; b=JAi5B0DPBAOchXplXxtGTn7ViKtbt42oqFAYK3M5TajowLj1SeH3HPFCWr7kYJ2ym0O1WoKIldcQ8KZNwTA62McgAp934xGwjm8UedggoM/uoknfDKfo314kf0dBk52jM//imGm+Len6ZoPUmilk/u1O0TWag9GTY+DhV8LMHq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887232; c=relaxed/simple;
	bh=uwX6S9AT+KnlAId4bKckVTHA2qcjDZkHx/v/NNZCi6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lHLxVU0O4Uh6XkgeJptWLYyYFJ5M1ObMg152YJVAPF8WWJXH8OTRrrWNhkkyszlYQyQjaKEGtC59HHf6EvJFMms8naPmKMglcEHD7TdgxTN7qqggYYMZFgBrCmF2+ykjoGGzVVTa7PADKBomwTlW3JJrNyT5m8y0F0YUHmq2gnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJSGEWqD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJSGEWqD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so5288135b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 04:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765887229; x=1766492029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qRnYav89V15HI5PBpBkWmJvPuWXFs6IrTS+CG0cZCgg=;
        b=QJSGEWqD98ErO29jsD3wIkD6kQ/ekoqZ+R7go2efGsjNZyij7N2QeyBdWNEVbNa7Si
         emAfJIV7k1z2ahdc2NaVzrP8ZhhujW+B8wW3hBPa6ZbBNxqmjE+eTE52Y9yKdU/EbmXm
         bIEyZ0KmN/+PACZd3wEj00DVJ7CpvnUBxz2eMz7hSm/VaRE5VlAUm+n60rvV4+rEok0A
         hUFDHhcIvXjmOpQmpkFm4OJ+qN6jNh/VUR78B4tQW9N6onCw27s1a+g8ti9jIC4qp5UR
         F18Uhi+LFESWbx8OvgwmS1L7COIeOks/L3vD4Yt5EI3djIZs1HalTLWmRDgth4K4lW3b
         UQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887229; x=1766492029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRnYav89V15HI5PBpBkWmJvPuWXFs6IrTS+CG0cZCgg=;
        b=ChjEb+x7dbhtIehK0WMu9JtE10naJ1G7ryrOWHotwpozOHAt6hZyUuL2+2vOuHg0pJ
         t6BevMzo1f0plURzuo1RDg+hKNM9ESkNGkIBdr3gswXeE6zxG+S7Z1w21WCSxsqA6ixo
         4sIsdMGM1P+fyUZHUU1OWEyFHgo30Csz+JYeFohXyQanGwhF0TXV5YofRHEiZkOlizz4
         +lrOW8L6bzds8npwHR2ngEeVGBgFoU7zHPX30UrkvjZUNB94l/4ky8v+lS334t7ORpJ8
         NmViERi9R6iekFkbUbzDZczOCbN4Q5jQBEWDap1/QMr/6SyDIfABoOp/8mRqVVHEe9u7
         BQcA==
X-Gm-Message-State: AOJu0YyxCi6A7wt3lw2wgUxbiy0vUx34+pbjlJ8Fpx6xKMvxOdgOHPlE
	hma4JiW15ZPqNUdfJtDvKeYEN4rwF2PplETtI78FVyQFbwmITjh2IqzFOWeFYGa4
X-Gm-Gg: AY/fxX5iZX5iseB/gQBZuwzX36dHzs93uzUs2BvUCgbWkjpSonNAqIS08gCJ8BlloCG
	5via7CrsUCtlJLjW59tA1s6DFDEQcgsQacpy4lTaiOrJ51wtkszwTbTzul68wv7uXxvNFzIcM8A
	70NkkFcliptfYqc2XVXbL/D/UjfKOvtFxrBsqxBkEU4ZCvGIqC3lG7uDc1aDlB3HV8kV9P7jcxr
	LOpGdWBytB75pluvvPXoPJmxvFfHQlfiKJrWupzsUriWwyMSxSsDOfaydiPhF84the0eg+ItOyU
	u6/wwU+XpFo9x6amjVodwDo9D/jaz47wuLX0oreEFqsZbonIMxxjVl+qXSMx0wyEVc/N9Zs/ghQ
	6g+bK5iOxxkxyYnRQgLG8N2bYSnJrx1R37t+I9zWFHjgkcA0NB8Ze3F77ep1Kbq6f0EVg9mThYp
	R3Mm1/In9CF9cXJjemKQA=
X-Google-Smtp-Source: AGHT+IEiPhc54/qVqz0yXDn1IBhaunXfmeB02vqVCV4cQSkXqlEjafx/bvqfO+eDe205nPwlY+Bvcw==
X-Received: by 2002:a05:6a00:8006:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-7f667f0cbaemr10986596b3a.31.1765887229402;
        Tue, 16 Dec 2025 04:13:49 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:bd87:a308:8427:d21d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c547feb5sm15373078b3a.62.2025.12.16.04.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:13:49 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v2] platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
Date: Tue, 16 Dec 2025 17:43:38 +0530
Message-ID: <20251216121338.124615-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Refactor the `victus_s_thermal_profile_boards` array from a simple list
of strings to a `dmi_system_id` table. This allows mapping specific
boards to their corresponding thermal parameter structures via
`driver_data`. This makes addition of future boards cleaner and more
explicit.

Tested on: HP Omen 16-wf1xxx (board 8C78)
Result: Confirmed WMI codes 0x30/0x31 are now sent, resolving the
logical inconsistency and ensuring the value visible in EC registers
match the Windows state for this profile.

Fixes: fb146a38cb11 ("platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support")
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v2:
- Refactored `victus_s_thermal_profile_boards` to use `struct dmi_system_id`
- Implemented `driver_data` to handle thermal profile parameters,
  replacing the conditional checks in `platform_profile_victus_s_set_ec`
- Moved enum definitions for thermal profile values earlier in the file
  to support the new `struct thermal_profile_params`.
---
 drivers/platform/x86/hp/hp-wmi.c | 148 ++++++++++++++++++++-----------
 1 file changed, 96 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..0bcd564ad688 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -53,6 +53,60 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 
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
+	u8 eco;
+};
+
+static const struct thermal_profile_params victus_s_thermal_params = {
+	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.eco		= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT
+};
+
+static const struct thermal_profile_params omen_v1_thermal_params = {
+	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.eco		= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT
+};
+
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
  * This was obtained by taking a look in the windows omen command center
@@ -99,10 +153,36 @@ static const char * const victus_thermal_profile_boards[] = {
 };
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const char * const victus_s_thermal_profile_boards[] = {
-	"8BBE", "8BD4", "8BD5",
-	"8C78", "8C99", "8C9C",
-	"8D41",
+static const struct dmi_system_id victus_s_thermal_profile_boards[] = {
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
 
 enum hp_wmi_radio {
@@ -225,42 +305,6 @@ enum hp_wireless2_bits {
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
 
@@ -1581,15 +1625,7 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
 
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
+	return dmi_first_match(victus_s_thermal_profile_boards) != NULL;
 }
 
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
@@ -1672,25 +1708,33 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
+	const struct dmi_system_id *id;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
 
+	id = dmi_first_match(victus_s_thermal_profile_boards);
+	if (!id)
+		return -ENODEV;
+
+	params = id->driver_data;
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
+		tp = params->eco;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = false;
 		gpu_dstate = 1;
-- 
2.52.0

