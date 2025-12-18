Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17845330673
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046414; cv=none; b=IBWGcvpdG3iszAB4aBMvfZDisHUAARYXSWWmvnhb7wGTxd9QyOoWN9s95jvXFMr3G8Nl1p0iyRlaxR/7Q03K/KKZ3JM1LRULS6XmTd1A2H82/78ZO6unmeTMfvSUi7XSO4krT5SfGhhUlAguDy6lxkkwRPLkfaIwivxEyAIJddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046414; c=relaxed/simple;
	bh=O448jcV0t5/RyIrvPTqZsN4/hQzy/Kh0lP1gIpiN1ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtBgCjofBaDnUGT/W2r64Ukwsq5PGI9Wxd6n5NQ8MeZifZNSZznSOw9WWR0l7gWZMdi/L8rD8mxBg84EZzZjKxA1NpsrSxtTeKbU8g3oL9yDUKROPrC7/bBdzgt2Wj2VA0YdHfAtLfCGYyKWZ0VM78qWjG0L0AsV+sXRSs+HeoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZDXiV52; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZDXiV52"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso459650b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 00:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766046409; x=1766651209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHHJpx/71qzM5gvqTpxWGxM5TNnKIXTAn42/3sDI9Oc=;
        b=AZDXiV52U1bPSpfNQ7C7YSoxO/yuYVG43C00CA0LpqViv2mRKOWtycbwyuACy4tWEi
         nWbFJmbW4VjPaghtUlwJkA+1iXg59BEew4G042T3nWHDiuIL9Wgz/rri/7SmxIYbCEog
         C9yK+u8E6oiHqsJWQUJqWZPzB7OAUey0JzsYNIQX9e7jvREum1zthCNsCvMPst/ob9l/
         mniHHUJSdxrOZ3se8OQdxQWq2ke7zOOR3O5yFHVCM4KO8byoEOT2OGS+6PnsoFMTgAEn
         yKq9KgcGs4mqmNAnMppfDLlpEJ/GQHlMX4xNfBmkCJHa2LRvej+Qbqy3x/2ZplnWzxcG
         JC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766046409; x=1766651209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FHHJpx/71qzM5gvqTpxWGxM5TNnKIXTAn42/3sDI9Oc=;
        b=D2K9DM5P5Iw/Edrbp/sykoYPUL+VqeaX4+9NzDTgDnMdKnbzP3iKQyFNrxQXlqH15T
         A/3gqhBgULwaLtoRHQl0fi8Nt8Ibeo79zFLcEpQoDrVxUgfSB4BDb3sSHgO4nnGg8k/Q
         tb3DnT4ughnbAkGBW8lnIMcPEpkM/hrFte1ztcBbAZqvLhOZ1E8m4WDpCHiTOpQrfAUb
         XJDI5kH9pQlV0MVDv4vQ5WDkgdgoI/YEkFOOhcPVw1JuLPp2Pa+klEndoeJcSafNX9qJ
         4YSsl8BNwHWXHBqkprpD0oOplpiyGw0yq62YnoBclH72m1DT8fjOakkGHAgBCcW5jF+3
         hXSA==
X-Gm-Message-State: AOJu0YwTRCLnoN5DLMaij2UjH0c4WoyXqNYSf0DRbUTQRuFjQ5rIWHuN
	GJaGBK2b1jPzSo1F6zoE7htKc/9891HjzImCojG4Ok+q5U+4+des+sB6
X-Gm-Gg: AY/fxX7VumK99Nbsi473EPpXC4dctbaqXqW05rkiOgtqPTPMKOs9lqm5B3lvy5d4vsy
	AjExsJ2AgO4vlOi+vdeu/3a9bRD5JnBkUanYyo6Je6rDx2akSQycUo9l73kYQai2u6dCukogCkB
	DYBhlY8rPeRh9RO8OHs0nJM03z9tGG9JOyi2U9YtY40T8x/8FIRprapzRF4Enf7bCNQLdNkbp/C
	qGeKw6SWBPX/YxshDtPEmOBJN1t4gekjLHghK07D+i40bdLDvKuUMWsM2egkI5t71bkf55bx/7u
	v2UGvglptQyY4P7hOI3OSvQ8rCb+uD1fGHgFdnjW9LctvTI4Y+Qh6cTIPxp9z9PZOCiV8SzUWlL
	UWRvKQrvtFpvtjxCW8DOx7eLmv3igMW6KFuMb44PZ3nIBdQSpX9FfTBvp/CFHM5SKkN67rgZo1q
	ylyyIGWEWXmuNIbrdRtXc=
X-Google-Smtp-Source: AGHT+IGfQlIuWfZ8Fak7fQmTuhcr3VztpfPXxvXXCNVPt0YK2d6yyrKeq2RXGcjh+gGRe5cDJvxskw==
X-Received: by 2002:a05:6a00:290a:b0:792:574d:b12 with SMTP id d2e1a72fcca58-7f667445f86mr18922712b3a.10.1766046408933;
        Thu, 18 Dec 2025 00:26:48 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:9e18:7101:be84:75eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe121222bcsm1817973b3a.19.2025.12.18.00.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:26:48 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
Date: Thu, 18 Dec 2025 13:56:29 +0530
Message-ID: <20251218082629.567911-3-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218082629.567911-1-krishna.chomal108@gmail.com>
References: <20251218082629.567911-1-krishna.chomal108@gmail.com>
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
Changes in V3:
- New patch in this series
---
 drivers/platform/x86/hp/hp-wmi.c | 84 +++++++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 24d065ddfc6a..ff3f401ab28b 100644
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
@@ -1715,6 +1723,44 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
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
+	if (tp == active_thermal_profile_params->performance) {
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+	} else if (tp == active_thermal_profile_params->balanced) {
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
@@ -1882,6 +1928,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 				      void *data)
 {
 	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option actual_profile;
 	int err;
 
 	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
@@ -1889,6 +1936,17 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 
 	pr_debug("Received power source device event\n");
 
+	guard(mutex)(&active_platform_profile_lock);
+	err = platform_profile_victus_get_ec(&actual_profile);
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
@@ -1897,7 +1955,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
 	 */
 
-	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE) {
 		pr_debug("Triggering CPU PL1/PL2 actualization\n");
 		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
 					       HP_POWER_LIMIT_DEFAULT);
@@ -2007,12 +2065,14 @@ static int thermal_profile_setup(struct platform_device *device)
 
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

