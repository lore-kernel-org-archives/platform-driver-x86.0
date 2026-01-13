Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26134E74D
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768328777; cv=none; b=k5KI2xf9J04QGV4wGxsVv2pK9Gc725FQY14akeG7K1F8WIbdYbTZ5LhNGXylUWodmY/LrkQlmP8fKeDcFGDQsW2cGiJIM2JBIXitc81lBg6jHouAsadQI5DBQTwGGk84RxNBKiqcAvCWLtUxRR5uOgUqkND7N7uLyVgvGkMu6wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768328777; c=relaxed/simple;
	bh=DwQNfw6cZyGJZF5IAN670+qVflaIjDjVdpRAsMYNz2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j29NoUOtu8gitrxBuWvGnLQha0NOJC60/CE8IBLggi8dRWPT/yNbyXkwAKki++Kv6cpzLU98okyE0WRkmfeB6fjs8glWtgB4fAcXvR9hjgtSxfj50C0X6wTQWI2v697JFg2byEubu2izGDGNhJtP9xmo5CeER67Wz0e7LkB1W9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyOB/iV/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyOB/iV/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f102b013fso72355475ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 10:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768328776; x=1768933576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZS/mPA/vlF4BtYp8bPWIloT1FKakXdQ4i992J5xL31k=;
        b=iyOB/iV/bKMK9n+RnkjnVxJfr/45Pfixu1aoLYiLwY5dSUobEspudFAGLr3jkQ2WVj
         m99Ke1sQ6AWBsHQ0sz6Gmmq+DhpGQrn7ouQUNVTa0u4b4Ci7C0aiiNYowUAeCxhIBTHR
         dc190g6B6oCbxooPJIQpY4WMn25XDmdiMT3P75d6H270108rsVJQ5pm7kBHxIKwBXLsD
         m3AEIxE9krjdiJH4LoGRjUnLtfX66Ln41zTQ6I+0e2P8VRtnpRHEOUekZ2RlAHcwDU3K
         SLHCu/bvnl8ZjBIujcQlpbP5LCka0NZib1esQT3fsgNcomKIIYdOXHqbiubWyfQ4mGc3
         kAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768328776; x=1768933576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZS/mPA/vlF4BtYp8bPWIloT1FKakXdQ4i992J5xL31k=;
        b=bZJUs9YeJnVNrBSYvTpCf8tP2t0ejCbKbT5JZpolBGXBbM4R71qn9J04qu4McpKWBX
         wajPNIAb8RTlCX0Yc71E/WDhDfaxE9lOIRAHtTgTvGpEZwW42CyD7X8SYk/NgF77SO3X
         A+hs68wXYpwP0lK4c292ZJmrhSZnjqfUPSD0CRtQpTJgRdCk90NhbtycD6ROxHemLFOc
         9hlSlvzVZhAyuBZCZXlEUjZa0vMMND0nRZFiLxIwuvPOAHt0yJ2LyHEP5an8wry9Um1F
         tUBFxI3pHRUAy7PzRwg8zwzojBKp/CKWVCwFo3mghk1RAqNKgXdJxH7hMPFaGvLwHuvV
         koYg==
X-Gm-Message-State: AOJu0YzLFu56axuyboFKS0P7V9QuVc0Ma0ARn4Nd0lIFHOqzP2CxbGJK
	Il5Ucx6fDX5mAbYqALhAkHTUCvkm0tMUbw+5dJ+t8/Ht4IjROclzylZi
X-Gm-Gg: AY/fxX4CqKclv5RMeJ5Osofhh0/F3eXwRrrt8xJHyP1HSuwlVPgJBJT6okGZS/T9MQV
	d4yBv2P6tEndj3o3ufH3PYp5eAyAL++0aHZ8skYQ9Tg44iLPxtC4fpGmW20nzN1WU7Fl+ap4LLJ
	SZgHW+pswJnGG9dZFEZNNleVZIugoyHvmGtPj+FX7Yn0gQaQoHiWnFTYHJQqP5qyxp8f3rD03Ml
	VZhc104lh6QltspxYeCQIiQPCcMM3q9RKAYF5FcGwhwjZV0VGjTtqym7qxu62YAb1mbxazt9hu3
	IwIy4rGitIYIN6k4TlVBxqm+11XII14s0hP4aQ/4qKDY8IF2kmbBHG8gyR9RpF542HsHYGnL4gB
	5leXHP6Bnd6AbVtoRWbIE0fpu98FsnXMsnNt6Lmpi1YPzakp/pQi7WxnS7elyGYGXS5d5v8W2FG
	iV/iUjG17fPvLezwlESis=
X-Google-Smtp-Source: AGHT+IGbQe3BFdyPjZ0mYCnBRYst/nWiLac+fIk8dG2DOWGAZhMmGXiOkSBMOhvRRCUUQYCxcnlU3w==
X-Received: by 2002:a17:902:d708:b0:2a2:f2e6:cc54 with SMTP id d9443c01a7336-2a3ee424bfbmr141181825ad.4.1768328775724;
        Tue, 13 Jan 2026 10:26:15 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88f1sm204032685ad.78.2026.01.13.10.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:26:15 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v5 2/2] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
Date: Tue, 13 Jan 2026 23:56:04 +0530
Message-ID: <20260113182604.115211-3-krishna.chomal108@gmail.com>
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

The current implementation for Victus S thermal profiles only supports
setting the profile. The driver was missing the logic to read the
hardware state, meaning it would default to "Balanced" on driver load,
overriding the currently active profile. Furthermore, the driver could
not detect if the firmware reset the profile on a power source change.

Add platform_profile_victus_s_get_ec() to read the current thermal
profile state directly from EC offset 0x59. Since both Balanced and
Low-Power profiles share the same thermal profile value, differentiate
them by querying the GPU CTGP and PPAB states via existing functions.
Additionally, update the power source event notifier to use the actual
hardware state when re-trigger CPU power limits actualization.

Testing on HP Omen 16-wf1xxx (board ID 8C78) confirmed that the thermal
profile is now persistent across driver loads and power source change
events.

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v5:
- Improved platform_profile_victus_s_get_ec() to support multiple EC
  layouts by iteratively probing offsets.
Changes in v4:
- Fixed platform_profile_victus_s_get_ec() to use both
  victus_s_thermal_params and omen_v1_thermal_params instead of
  active_thermal_params to fix regression caused in v3.
- Handle err after calling victus_s_gpu_thermal_profile_get().
- Fixed a wrong function call in victus_s_powersource_event().
Changes in v3:
- New patch in this series
---
 drivers/platform/x86/hp/hp-wmi.c | 100 +++++++++++++++++++++++++++----
 1 file changed, 89 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 24d065ddfc6a..ed52c697d2ea 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -13,6 +13,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/array_size.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -44,6 +45,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+#define HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET 0x59
 
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
@@ -640,6 +642,12 @@ static bool is_omen_thermal_profile(void)
 			    board_name) >= 0;
 }
 
+static bool is_victus_s_thermal_profile(void)
+{
+	/* Initialised in driver init, hence safe to use here */
+	return is_victus_s_board;
+}
+
 static int omen_get_thermal_policy_version(void)
 {
 	unsigned char buffer[8] = { 0 };
@@ -1631,12 +1639,6 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
 	return 0;
 }
 
-static bool is_victus_s_thermal_profile(void)
-{
-	/* Initialised in driver init, hence safe to use here */
-	return is_victus_s_board;
-}
-
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 					    bool *ppab_enable,
 					    u8 *dstate,
@@ -1715,6 +1717,68 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
 	return ret;
 }
 
+static int platform_profile_victus_s_get_ec(enum platform_profile_option *profile)
+{
+	int ret, i;
+	bool current_ctgp_state, current_ppab_state;
+	u8 current_dstate, current_gpu_slowdown_temp, tp;
+	static const u8 tp_ec_offsets[2] = { HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+					     HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET };
+
+	/*
+	 * Victus S devices have more than 1 EC layouts, hence we cannot directly
+	 * call omen_thermal_profile_get() like other platform_profile_*_get_ec()
+	 * variants, since it would only resolve to that 1 type of board. Hence
+	 * we iteratively query a set of candidates: tp_ec_offsets[] until we
+	 * find a valid thermal profile.
+	 */
+	for (i = 0 ; i < ARRAY_SIZE(tp_ec_offsets) ; i++) {
+		ret = ec_read(tp_ec_offsets[i], &tp);
+		if (ret)
+			return ret;
+
+		/*
+		 * We cannot use active_thermal_profile_params here, because boards
+		 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
+		 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
+		 * Gaming Hub on windows. Hence accept both of these values.
+		 */
+		if (tp == victus_s_thermal_params.performance ||
+		    tp == omen_v1_thermal_params.performance) {
+			*profile = PLATFORM_PROFILE_PERFORMANCE;
+			return 0;
+		} else if (tp == victus_s_thermal_params.balanced ||
+			   tp == omen_v1_thermal_params.balanced) {
+			/*
+			 * Since both PLATFORM_PROFILE_LOW_POWER and
+			 * PLATFORM_PROFILE_BALANCED share the same thermal
+			 * profile parameter value, hence to differentiate
+			 * between them, we query the GPU CTGP and PPAB states
+			 * and compare based off of that.
+			 */
+			ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
+							       &current_ppab_state,
+							       &current_dstate,
+							       &current_gpu_slowdown_temp);
+			if (ret < 0)
+				return ret;
+
+			if (current_ctgp_state == 0 && current_ppab_state == 0) {
+				*profile = PLATFORM_PROFILE_LOW_POWER;
+				return 0;
+			} else if (current_ctgp_state == 0 && current_ppab_state == 1) {
+				*profile = PLATFORM_PROFILE_BALANCED;
+				return 0;
+			} else {
+				return -EINVAL;
+			}
+		}
+	}
+
+	/* Failed to get thermal profile from all EC offsets */
+	return -EINVAL;
+}
+
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
 	struct thermal_profile_params *params;
@@ -1882,6 +1946,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 				      void *data)
 {
 	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option actual_profile;
 	int err;
 
 	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
@@ -1889,6 +1954,17 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 
 	pr_debug("Received power source device event\n");
 
+	guard(mutex)(&active_platform_profile_lock);
+	err = platform_profile_victus_s_get_ec(&actual_profile);
+	if (err < 0) {
+		/*
+		 * Although we failed to get the current platform profile, we
+		 * still want the other event consumers to process it.
+		 */
+		pr_warn("Failed to read current platform profile (%d)\n", err);
+		return NOTIFY_DONE;
+	}
+
 	/*
 	 * Switching to battery power source while Performance mode is active
 	 * needs manual triggering of CPU power limits. Same goes when switching
@@ -1897,7 +1973,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
 	 */
 
-	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE) {
 		pr_debug("Triggering CPU PL1/PL2 actualization\n");
 		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
 					       HP_POWER_LIMIT_DEFAULT);
@@ -2007,12 +2083,14 @@ static int thermal_profile_setup(struct platform_device *device)
 
 		ops = &platform_profile_victus_ops;
 	} else if (is_victus_s_thermal_profile()) {
+		err = platform_profile_victus_s_get_ec(&active_platform_profile);
+		if (err < 0)
+			return err;
+
 		/*
-		 * Being unable to retrieve laptop's current thermal profile,
-		 * during this setup, we set it to Balanced by default.
+		 * call thermal profile write command to ensure that the
+		 * firmware correctly sets the OEM variables
 		 */
-		active_platform_profile = PLATFORM_PROFILE_BALANCED;
-
 		err = platform_profile_victus_s_set_ec(active_platform_profile);
 		if (err < 0)
 			return err;
-- 
2.52.0

