Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF1285060
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020160; cv=none; b=gAENg054hrok48pjAHMHrOfsQrGzaq4AXd0bp/mfjm0t5g2sb4jU2OLnJP45dCVJCA8+yJd+yCzDUYetH+QKenIke8TOQJGqgnyPe2tBOnQbi0jQ3G816RGfhaWVdSmGb9Fn0qCY9BOJ/dDji2NVGINfQ7tjj4IqxiSVB1N4/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020160; c=relaxed/simple;
	bh=svWYAOEp6ij6g+8vL15ysVMAJrFDV6PpHu6arYfSljY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyl9ACtRa2gYAdj3/uKasEJr+Wbtr90FQQ2nGmbLtiYXmws0qOYD2ZZAJGnD9yGzi6l+HXB5DAqwOkPp7ofVNEmHYNLu7/CQ5HKH9lJY8kmomg54L9eXBScSZLqHGS4QLnOGYs+o31A3y6TR+fT6r/sm6XR+PhvUWYA/7XyHe4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl4k3gWV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl4k3gWV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a07fac8aa1so1084015ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769020158; x=1769624958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Xl3aa6opPUprRkwoBGqbq15zpYR77lS9AnPKKGuIhw=;
        b=kl4k3gWV0DUMiu6q/PgEt278CRVqC8CkYxgZpfOwQkpIoU8E1vLLRPflqrBNBbJCu7
         0J6MeEHe7bcS1EVYfFj/Pbr1jkkS190VbE3LXiFt+YaZXHJ5HSRFgG17RPBBWhWGe3rd
         XD2tsxyAHNa0xZdVqXJSILEBrpnQZ7U6QXPzmywsQKXy6MtxQgXRZpjbh2P0oSqbSPQA
         D38Dm1AiTjUZ+oQegZZFQdWXNoeW9mE1vIRqPZz3hPGfuqPD0z+eb3uscR4ljPPUayok
         qHNoUm2UrQHjMCUa8iMKuSuIk7AtUOTqhmckq6B7vNVXc2+V3cmuVdH4Rz2l4qaTqnio
         oB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769020158; x=1769624958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Xl3aa6opPUprRkwoBGqbq15zpYR77lS9AnPKKGuIhw=;
        b=lBlMJ54yaj8oNONXtrYaeSN3VemhCxYdvtwn6ZuEvemZT/LyFVrn0WjvWD9B8+sWfQ
         4iPf+rtvdpXZ6n7ieFpNLnCCsQHP4gRYw4178I4YlogS8M9yHW1HIdqSu6Htcj8Z0Kkt
         W6sX3woqf9Rlhl2obnMuJa2ZNj+YC9Xw2ILqF1zsnDnFpRt8Vr7WrPrZc4ALYISkg9K+
         tIM8fQQOuEw/QCpXHJB/VU1sy04OtWg0wz6kSbn8lsZgyUBoJeL1GsWPqLN3TxOrY76O
         nucxksGV/JgnHj2PoB2bOMz+bNviukKPWbdP0tiIIEa122T5PPejKczRl+JSdwkk4T+N
         Tukw==
X-Gm-Message-State: AOJu0YzkO8xHKURN1yiMkeNzIQlBEd9uEjdkGRezEekqM0666VAJM9CA
	YpDp6EhJ37pBuHGyCJu5BmNFPrzxxxup+JyktvVQH2prNMxwvNGIAzuf
X-Gm-Gg: AZuq6aKQZ8TrvpuAtyVX7S0N9CJ9GN5CFsm3+Dk6x8gSyznkDC7vjax8EcFQgNeO5L6
	oZOhPIiKd/18rvGQlQ23lUVE/+Ua5X3mecqqSiEz7pdRssgehIn3ytPi/CE3CQIw7rR1J/t3LyH
	BXY697vU1e1wtTdmzPfCLzaZOZLYQwmQVK00hc2oXMHmZHtyPFnNz6agNBz0ZlJGE6r1ngDuC8l
	Elov3/6eQUCKcEMUieGMYU2VPZAVK844eirhePy3OHID7R9UCq/yLdFwAS5D4hqI3TfOH7xc2mx
	+eehNDu4LG/rMWbhFeMappw+qt7/uFYLG/vmKhUvDvJ232+UKKrLvrBeTwIAyYPSOcAB1nOz0uL
	PcaADqVEN/xG3u7zqz9JHbM0l/f2pYu0k6y06CeHFaMm/5Chz99fEwvdG5Fr9CfwB72IYygwLpd
	IH59+lwLrFYk6Ku0qKOQg=
X-Received: by 2002:a17:902:ecc6:b0:2a0:afeb:fbbb with SMTP id d9443c01a7336-2a768b7a743mr49195465ad.1.1769020157611;
        Wed, 21 Jan 2026 10:29:17 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:9e18:7101:be84:75eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dc83dsm162051195ad.50.2026.01.21.10.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:29:16 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v6] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
Date: Wed, 21 Jan 2026 23:58:58 +0530
Message-ID: <20260121182858.66363-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113182604.115211-1-krishna.chomal108@gmail.com>
References: <20260113182604.115211-1-krishna.chomal108@gmail.com>
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

Statically store the known EC offsets for reading thermal profile in the
new .ec_tp_offset field of struct thermal_profile_params. Implement
platform_profile_victus_s_get_ec() to use this offset to read the real
hardware state. Additionally, update the power source event notifier to
use the actual hardware state when re-triggering CPU power limits
actualization.

Testing on HP Omen 16-wf1xxx (board ID 8C78) confirmed that the thermal
profile is now persistent across driver loads and power source change
events.

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
NOTE: Patch 1/2 of the v5 series (platform/x86: hp-wmi: fix platform
profile values for Omen 16-wf1xxx) is already accepted into
pdx86/for-next. This v6 contains only the remaining logic for EC
readback and is based on the for-next branch.

Changes in v6:
- Update struct thermal_profile_params to include .ec_tp_offset field.
- Use this field for reading from the embedded-controller.
- Add a pr_warn for "unknown ec layout" boards once during init.
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
- New patch in this series.
---
 drivers/platform/x86/hp/hp-wmi.c | 103 ++++++++++++++++++++++++++++---
 1 file changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 31c6cca6ec34..304d9ac63c8a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -46,9 +46,13 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"
 
-#define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
-#define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
-#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+enum hp_ec_offsets {
+	HP_EC_OFFSET_UNKNOWN				= 0x00,
+	HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET		= 0x59,
+	HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET		= 0x62,
+	HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET		= 0x63,
+	HP_OMEN_EC_THERMAL_PROFILE_OFFSET		= 0x95,
+};
 
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
@@ -94,22 +98,26 @@ enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_QUIET			= 0x03,
 };
 
+
 struct thermal_profile_params {
 	u8 performance;
 	u8 balanced;
 	u8 low_power;
+	u8 ec_tp_offset;
 };
 
 static const struct thermal_profile_params victus_s_thermal_params = {
 	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
 	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
 };
 
 static const struct thermal_profile_params omen_v1_thermal_params = {
 	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
 	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
 	.low_power	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
 };
 
 /*
@@ -1785,6 +1793,60 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
 	return ret;
 }
 
+static int platform_profile_victus_s_get_ec(enum platform_profile_option *profile)
+{
+	int ret = 0;
+	bool current_ctgp_state, current_ppab_state;
+	u8 current_dstate, current_gpu_slowdown_temp, tp;
+	const struct thermal_profile_params *params;
+
+	params = active_thermal_profile_params;
+	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+		*profile = active_platform_profile;
+		return 0;
+	}
+
+	ret = ec_read(params->ec_tp_offset, &tp);
+	if (ret)
+		return ret;
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
@@ -1952,6 +2014,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 				      void *data)
 {
 	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option actual_profile;
 	int err;
 
 	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
@@ -1959,6 +2022,17 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 
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
@@ -1967,7 +2041,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
 	 */
 
-	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE) {
 		pr_debug("Triggering CPU PL1/PL2 actualization\n");
 		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
 					       HP_POWER_LIMIT_DEFAULT);
@@ -2078,11 +2152,22 @@ static int thermal_profile_setup(struct platform_device *device)
 		ops = &platform_profile_victus_ops;
 	} else if (is_victus_s_thermal_profile()) {
 		/*
-		 * Being unable to retrieve laptop's current thermal profile,
-		 * during this setup, we set it to Balanced by default.
+		 * For an unknown EC layout board, platform_profile_victus_s_get_ec(),
+		 * behaves like a wrapper around active_platform_profile, to avoid using
+		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
 		 */
-		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+			active_platform_profile = PLATFORM_PROFILE_BALANCED;
+		} else {
+			err = platform_profile_victus_s_get_ec(&active_platform_profile);
+			if (err < 0)
+				return err;
+		}
 
+		/*
+		 * call thermal profile write command to ensure that the
+		 * firmware correctly sets the OEM variables
+		 */
 		err = platform_profile_victus_s_set_ec(active_platform_profile);
 		if (err < 0)
 			return err;
@@ -2505,6 +2590,10 @@ static void __init setup_active_thermal_profile_params(void)
 		 */
 		is_victus_s_board = true;
 		active_thermal_profile_params = id->driver_data;
+		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
+				dmi_get_system_info(DMI_BOARD_NAME));
+		}
 	}
 }
 
-- 
2.52.0

