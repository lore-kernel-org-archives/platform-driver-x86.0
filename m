Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA8332EAE
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061798; cv=none; b=iABw4LP6mcbNtJkjCbPhDW9HUUr5j354vH/o+eug/gHHhVWnOXFseADh6KIqtPrSRC/3FhXRAkXQnNMJYEOYARgK/+rDQLfmZ1WAu7NsSfzvxDlEWkl8hArnBRmUw4ViXq2i+hfFwJOWE8Hc1w7S8DtCmeuVJxoiCwVKeE0bbok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061798; c=relaxed/simple;
	bh=TeonW0ExzWXiap0Q2tgDVVaP6oKqnwUIaL4YgWy2Skw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3Jlfojs7DeVV6VXC6nzqfwJhAEcWjPmBgvCvTsml+D0jcsnxBHnuU+6IE6Dsyhdjms5w4OHPtnbZWp3oXX0GkHQXBQiaTWdyC7DFEaz6hM9nutwHUerGDiTrHLw0Qk8UgX87P9sIGP2hW+3KTRqrvhNUmbgjbOI6nquQsKOqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6lb2+Qk; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6lb2+Qk"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so767039b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 04:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766061796; x=1766666596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grg/WRONXaxs6pWrIYhh+lEy0JAGIB4DjRzZb/CNebk=;
        b=W6lb2+Qk3671tD9JC+6qOw5BRH8bKD15PWzjcEIBY3vbN3DtpusU+tCvyZhd9IV6Fm
         +6U8T9rUnxXZRdhFKnxM/BvscJJSgq1OGOIspt07gcfHIcFSjUAPm9AllAiMn0mvXzEq
         UeWhUzFcL3kIR2axyI7CVhXNsfNGXauonIc1fA5JKkcwZPW6tUpgXAIOfwDpq6milwAW
         IwvBVWA+vUlJTkv22KJ+0UplrQmIQ6OPsRkNyeepGkZ54JZpKny+FQbiVuGX4WDONaOr
         /8MqsQVuaKQF21ookWWcN3ulzKlfoe0zotjtZizGxNXV+4vdU4ScpQveiAO5iz/dUiJ9
         ctlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061796; x=1766666596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Grg/WRONXaxs6pWrIYhh+lEy0JAGIB4DjRzZb/CNebk=;
        b=gmG6yp7sCspTrUcGvwkCmojnpxX7JrE97mcC58O2fQoA08YWix2W/G1RwDb8XrQSUh
         TeGRpzri5DMuuuzZKDzDCDU+2Hfdwo1ySMd+AtZVb7eIyPTzJy9n8g8xX6J8Jvyo557F
         j53vpZjK3z5U61s0JfdF9xanHYO8Ib0oyfoC1XnsYnFqoWMbbEXjjjcHB4k0ICXTzRYc
         9XSxxeG8eBkKaSO2jIZsDlM1MFywvJciFUeIYprTJgFyZCaOv3aJDA8KIAJEHMblF69h
         NSz/pmu3b/wJSVPXwtPQFtj6nmZLQZ5/jSXIbQyq5FbMzzKJ37Rmh2Df5AVeJLLGqMhS
         pjYg==
X-Gm-Message-State: AOJu0YxdB6pqL73taZaS6kxM9aNCeuq6rwWCJfrHi3PIs/OWjVe5MMsB
	Ak3iOh4ha0GB+xIbz+LW4pHFgUFU4Ajja5AdS2ebva+i2JjoRC6yZcp8
X-Gm-Gg: AY/fxX4AeoLta49yZGypRQic5cnC/tTQMwjw1+xe6cYff7xiBmDAHNCDYk8f8KAT43s
	LKRjvol5xeTfnuC9s5U6LxWPtQ4PSrgcOG1eTTVsAE6FBtb500WIlK/uy6Y2UJHf2iWIwalaDrO
	Xs3bh7fMlw/fl2nDKLUozIyWbnEPGerxY0vLuQCsdnWpBvh0XywFrNUxrbhb+E+JejK+iMeEev4
	rUAmzqDRjFlGa1KZ2Qt9/Ix0wx+pcCe4Mm71eCJMSJ/u4vVLIj/HZI7HxKQkPy+7LG/tCDDYOh2
	M5ZOWhGD3pnCfrQQQcaXCU1TGhjzrdOo6nbBturbWTseBkonTwtRBwASCkiIjWct4OOXwhbGTUO
	IjbQhdbGu3iuoIgJfVNfsdIFsOMQz1be6J8WCAk1KFI4sZkcElm5k/Qm96WPVVWRsFuBiP/f4aH
	TTBLz9G9DT4aTXW/hOEC0=
X-Google-Smtp-Source: AGHT+IEQw7287pQ5xlSnarRCoq6UOIVoIl7gMTxS1GQCbzOOcY/koFw2486ygAYTBejmfs14eSlB1Q==
X-Received: by 2002:a05:6a00:2a0c:b0:7e8:43f5:bd25 with SMTP id d2e1a72fcca58-7f66979946emr18524148b3a.58.1766061795371;
        Thu, 18 Dec 2025 04:43:15 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d853c1sm2597575b3a.43.2025.12.18.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:43:15 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v4 2/2] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
Date: Thu, 18 Dec 2025 18:13:03 +0530
Message-ID: <20251218124303.22024-3-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218124303.22024-1-krishna.chomal108@gmail.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
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
profile is now persistent across driver loads.

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v4:
- Fixed platform_profile_victus_s_get_ec() to use both
  victus_s_thermal_params and omen_v1_thermal_params instead of
  active_thermal_params to fix regression caused in v3.
- Handle err after calling victus_s_gpu_thermal_profile_get().
- Fixed a wrong function call in victus_s_powersource_event().

Changes in v3:
- New patch in this series
---
 drivers/platform/x86/hp/hp-wmi.c | 94 ++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 24d065ddfc6a..010082a03cc2 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -44,6 +44,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+#define HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET 0x59
 
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
@@ -640,6 +641,12 @@ static bool is_omen_thermal_profile(void)
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
@@ -666,9 +673,16 @@ static int omen_get_thermal_policy_version(void)
 
 static int omen_thermal_profile_get(void)
 {
+	u8 addr;
 	u8 data;
+	int ret;
 
-	int ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
+	if (is_victus_s_thermal_profile())
+		addr = HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET;
+	else
+		addr = HP_OMEN_EC_THERMAL_PROFILE_OFFSET;
+
+	ret = ec_read(addr, &data);
 
 	if (ret)
 		return ret;
@@ -1631,12 +1645,6 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
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
@@ -1715,6 +1723,54 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
 	return ret;
 }
 
+static int platform_profile_victus_s_get_ec(enum platform_profile_option *profile)
+{
+	int ret;
+	int tp;
+	bool current_ctgp_state, current_ppab_state;
+	u8 current_dstate, current_gpu_slowdown_temp;
+
+	tp = omen_thermal_profile_get();
+	if (tp < 0)
+		return tp;
+
+	/*
+	 * We cannot use active_thermal_profile_params here, because boards
+	 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
+	 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
+	 * Gaming Hub on windows. Hence accept both of these values.
+	 */
+	if (tp == victus_s_thermal_params.performance ||
+	    tp == omen_v1_thermal_params.performance) {
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == victus_s_thermal_params.balanced ||
+		   tp == omen_v1_thermal_params.balanced) {
+		/*
+		 * Since both PLATFORM_PROFILE_LOW_POWER and
+		 * PLATFORM_PROFILE_BALANCED share the same thermal profile
+		 * parameter value, hence to differentiate between them, we
+		 * query the GPU CTGP and PPAB states and compare based off of
+		 * that.
+		 */
+		ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
+						       &current_ppab_state,
+						       &current_dstate,
+						       &current_gpu_slowdown_temp);
+		if (ret < 0)
+			return ret;
+		if (current_ctgp_state == 0 && current_ppab_state == 0)
+			*profile = PLATFORM_PROFILE_LOW_POWER;
+		else if (current_ctgp_state == 0 && current_ppab_state == 1)
+			*profile = PLATFORM_PROFILE_BALANCED;
+		else
+			return -EINVAL;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
 	struct thermal_profile_params *params;
@@ -1882,6 +1938,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 				      void *data)
 {
 	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option actual_profile;
 	int err;
 
 	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
@@ -1889,6 +1946,17 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 
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
@@ -1897,7 +1965,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
 	 */
 
-	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE) {
 		pr_debug("Triggering CPU PL1/PL2 actualization\n");
 		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
 					       HP_POWER_LIMIT_DEFAULT);
@@ -2007,12 +2075,14 @@ static int thermal_profile_setup(struct platform_device *device)
 
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

