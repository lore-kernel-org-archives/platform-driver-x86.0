Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C05222575
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jan 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414130; cv=none; b=W9zp0GQIblNRCdW7ilv3L1BZQ0lr7U1gUfDVmKjZfbMn34i/z9AMj8286XUhK8kc2Vw50PIYJ7QwfkWLp+jCHj1k+KZ+ptSDWBlw7vhZVFnpZMOPTqPOMkFri9INdai5wpYVD9IdChyh136E7zlDwm8myYaUtssLtntXussej30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414130; c=relaxed/simple;
	bh=2dtO/D/THND57+RgFqHZAJsFbFQfIz6mLYcNgx/2hU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iugFVaJ78Grql8i0xuLNdSBjPlWkHN+Rk0/z7HNuDA8W+EVpFFjmzeCkNYcKBitPGHqFDILX5mU1r6W1boV/vXIF+2P9lXP09isIZBr9GpOVH6Ld7x0cupVcFhIC8ZizIM8fQX6uqE0LMYmS0Fyfa8CXXNYM+SDvT55I7gbgODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL/hkhAa; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL/hkhAa"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-352ccc61658so1863571a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jan 2026 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769414128; x=1770018928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZQuuK/KZhCSDkrGAm7Oc/09cA4LI/9U/Cm8XSFnoZw=;
        b=iL/hkhAaMXYvDK76O7YZ+EBniDrCy2hVOAulOdAoFaJkstKSZCL2jBlB200iId1O++
         ZdaR6kzyLb2KBSj88Ox9Nw2k+YTag9sPEdIm/MMWGndL31OoelXzTLVhabsccI+uA3zD
         Z+oJHeSV43AR5wDfzOVASOOgC00ZmaNBp1Q4bEcu9OgtnKzERbtdmW9wd2lLszIXZnrC
         Qree99Yn6onSAxWcp2QFszbJ34mMpKEit6K6tlfIW/baiJ4cOF/yjkMHmJNkChJRgPI0
         oc3K0zgriys3cNwf4vDp5CTsL0laafL8Kot6Ag6ewWtvLpJcCwrTvCWMFYR6a3s/pFYZ
         IyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769414128; x=1770018928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZQuuK/KZhCSDkrGAm7Oc/09cA4LI/9U/Cm8XSFnoZw=;
        b=vnIyhaGbaosXTI+u7COmL5LbbimEcyG+1MjITCmh96pYK5qfgo2dc6Aqz5QWhzyn35
         JAy46vxJEnC+sB7xk9M6vj99CupL9zIUCCxBVkXG58ZrQy936ymnxYuAewu+QeFTEdE5
         oU/wnR1eTX3tJfpJMmOtrheAX5kvqnILh2HRlgkU5cjoaPvRv/VyOgf2HrxlUi2hvwgu
         Uh9v4IY2Epdq7UatIYKzItmK66c9xHS4bnAsCTcvlC7hlY0B39z5SvWPFD2u5AJ+edqA
         XMLnBChVlGBIzOOmoKfx8rVHfQ0G75P/pw8EMwiukfryP8UI1+yXMiC7L9nh0vL47LW7
         /81Q==
X-Gm-Message-State: AOJu0YxjRisa9HSHPFjKtJxyAmi/1dSnOn79KVcZBKVpwECIW+Ub1LU/
	nCgigZH2rgV2c1BXEwDRX9eTEGHqe5mkPkJudjTH5hvHHfvysOgc0DmjC9/ATw==
X-Gm-Gg: AZuq6aJ22hXO7c4dbkJK1cT3ibnmsr5jzhs6mAoPfrcz1J0AETKfPj3bKc2iiUxXZvv
	SyfaEusMzhvb31F5gvukzb42Grfd1mW/Aa0rzR7okcY/jT8J3vutq5Aa7lwmbeXultSUoKtr/wT
	j955ddiU78jKIxWcFreaMMaU1iFfVTAZ/Nv+ElG1AYrLBuq0sZJHODeCtoHEgY7QixNzJeWCmlB
	sBQY/ujAfAbCS5rq1z9N1NyOCvCqoGcmU/unJx1BheCajxNBWbEOQq5sjQBttu6wLwCUuJBQKYo
	NhjQ1CA05PSkOSAZx6t2R0WVqowvnUmCpVczH47CJzANQNFpW9Em8R5K+H+AnPshp94rfGaWrK1
	ZydVH0e76bHyTl2m06ijbunSky/dZj2WI4L9IzAXE5VCHTPJrHb4/BNg4Ebo60aAhDtPPJou7Te
	S1BAwxEOCaTa4Ok2XgVev8SPUsD9haPA==
X-Received: by 2002:a17:90b:5645:b0:34c:c866:81ec with SMTP id 98e67ed59e1d1-353c41a6e98mr3283806a91.36.1769414127870;
        Sun, 25 Jan 2026 23:55:27 -0800 (PST)
Received: from localhost ([2401:4900:8902:adbb:e971:5b56:7784:985b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d8b8f7bsm8047948a91.6.2026.01.25.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:55:27 -0800 (PST)
From: Sharan kumar M <sharweshraajan@gmail.com>
To: hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	sharweshlinux@gmail.com,
	Sharan Kumar M <sharweshraajan@gmail.com>
Subject: [PATCH] WMI: Added supported for motherboard 8BCD and cleaned the driver and added support for mux switch and fan_Control for insyde boards
Date: Mon, 26 Jan 2026 13:25:22 +0530
Message-ID: <20260126075522.30814-1-sharweshraajan@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up and refactors the existing code to improve
readability and maintainability. It also adds support for fan speed
control and MUX control.

Additionally, support for the 8BCD motherboard has been introduced.

Signed-off-by: Sharan Kumar M <sharweshraajan@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 727 +++++++++++++++++++++++--------
 1 file changed, 556 insertions(+), 171 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea059..3f043c63d0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -93,6 +93,13 @@ static const char * const omen_timed_thermal_profile_boards[] = {
 	"8BAD",
 };
 
+/* DMI board names of Omen laptops that have a thermal profile timer
+ * and cannot be controlled by ec
+ */
+static const char * const thermal_profile_v1_boards[] = {
+	"8BCD"
+};
+
 /* DMI Board names of Victus 16-d1xxx laptops */
 static const char * const victus_thermal_profile_boards[] = {
 	"8A25",
@@ -105,6 +112,29 @@ static const char * const victus_s_thermal_profile_boards[] = {
 	"8D41",
 };
 
+enum hp_fan_mode { //Performance Mode
+	FANMODE_LEGACY_DEFAULT     =  0x00, // 0b00000000
+	FANMODE_LEGACY_PERFORMANCE =  0x01, // 0b00000001
+	FANMODE_LEGACY_COOL        =  0x02, // 0b00000010
+	FANMODE_LEGACY_QUIET       =  0x03, // 0b00000011
+	FANMODE_LEGACY_EXTREME     =  0x04, // 0b00000100
+	FANMODE_L8                 =  0x04, // 0b00000100
+	FANMODE_L0                 =  0x10, // 0b00010000
+	FANMODE_L5                 =  0x11, // 0b00010001
+	FANMODE_L1                 =  0x20, // 0b00100000
+	FANMODE_L6                 =  0x21, // 0b00100001
+	FANMODE_L2                 =  0x30, // 0b00110000
+	FANMODE_L7                 =  0x31, // 0b00110001
+	FANMODE_L3                 =  0x40, // 0b01000000
+	FANMODE_L4                 =  0x50  // 0b01010000
+};
+
+enum hp_gpu_mode {
+	GPUMODE_HYBRID   = 0x01,  // 0x00 - Hybrid graphics mode (or BIOS call failed)
+	GPUMODE_DISCRETE = 0x01,  // 0x01 - Discrete GPU exclusive mode
+	GPUMODE_OPTIMUS  = 0x02   // 0x02 - NVIDIA Optimus mode
+};
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -165,14 +195,14 @@ enum hp_wmi_commandtype {
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 };
 
-struct victus_power_limits {
+struct hp_power_limits {
 	u8 pl1;
 	u8 pl2;
 	u8 pl4;
 	u8 cpu_gpu_concurrent_limit;
 };
 
-struct victus_gpu_power_modes {
+struct hp_gpu_power_modes {
 	u8 ctgp_enable;
 	u8 ppab_enable;
 	u8 dstate;
@@ -180,24 +210,42 @@ struct victus_gpu_power_modes {
 };
 
 enum hp_wmi_gm_commandtype {
-	HPWMI_FAN_SPEED_GET_QUERY		= 0x11,
-	HPWMI_SET_PERFORMANCE_MODE		= 0x1A,
+	HPWMI_AMI_FAN_SPEED_GET_QUERY		= 0x11,
+	HPWMI_SET_PERFORMANCE_MODE			= 0x1A,
 	HPWMI_FAN_SPEED_MAX_GET_QUERY		= 0x26,
 	HPWMI_FAN_SPEED_MAX_SET_QUERY		= 0x27,
 	HPWMI_GET_SYSTEM_DESIGN_DATA		= 0x28,
-	HPWMI_FAN_COUNT_GET_QUERY		= 0x10,
+	HPWMI_INSYDE_FAN_SPEED_GET_QUERY	= 0x2D,
+	HPWMI_INSYDE_FAN_SPEED_SET_QUERY	= 0x2E,
+	HPWMI_FAN_COUNT_GET_QUERY			= 0x10,
 	HPWMI_GET_GPU_THERMAL_MODES_QUERY	= 0x21,
 	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
 	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
-	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
-	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
+	HPWMI_GET_TEMPERATURE_QUERY			= 0x23,
+	HPWMI_FAN_TABLE_GET_QUERY			= 0x2F,
+	HPWMI_FAN_TABLE_SET_QUERY			= 0x32,
+	HPWMI_CPU_POWER_SET_QUERY			= 0X29,
+	HPWMI_GPU_POWER_QUERY				= 0X52, //MUX
+	HPWMI_ADAPTER_QUERY					= 0x0F, //Adapter
+};
+
+enum hp_wmi_kb_commandtype {
+	HPWMI_GET_BACKLIGHT = 0x04,
+	HPWMI_SET_BACKLIGHT = 0x05,
+};
+
+enum hp_wmi_backlight {
+	BACKLIGHT_OFF = 0x64,  // 0b01100100 - Keyboard backlight off
+	BACKLIGHT_ON  = 0xE4   // 0b11100100 - Keyboard backlight on
 };
 
 enum hp_wmi_command {
-	HPWMI_READ	= 0x01,
-	HPWMI_WRITE	= 0x02,
+	HPWMI_READ	= 0x01, // Earliest implemented (1)
+	HPWMI_WRITE	= 0x02, // Graphics mode switch (2)
 	HPWMI_ODM	= 0x03,
-	HPWMI_GM	= 0x20008,
+	HPWMI_GM	= 0x20008, // Most commands (131080){working so running in this}
+	HPWMI_GM_v2 = 0X20009, //Current Implementation(going on)
+	HPWMI_GM_v3 = 0X2000b, //typec
 };
 
 enum hp_wmi_hardware_mask {
@@ -225,42 +273,12 @@ enum hp_wireless2_bits {
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
 enum hp_thermal_profile_omen_flags {
 	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
 	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
 	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
 };
 
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
 
@@ -455,12 +473,14 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 }
 
 /*
- * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
+ * Calling this hp_wmi_get_fan_count function also enables
  * and/or maintains the laptop in user defined thermal and fan states, instead
  * of using a fallback state. After a 120 seconds timeout however, the laptop
  * goes back to its fallback state.
+ * this is solved by creating a timer or service to call
+ * this function every 120 seconds(from omen gaming hub)
  */
-static int hp_wmi_get_fan_count_userdefine_trigger(void)
+static int hp_wmi_get_fan_count(void)
 {
 	u8 fan_data[4] = {};
 	int ret;
@@ -471,15 +491,17 @@ static int hp_wmi_get_fan_count_userdefine_trigger(void)
 	if (ret != 0)
 		return -EINVAL;
 
-	return fan_data[0]; /* Others bytes aren't providing fan count */
+	/* to record call in dmesg */
+	pr_info("Bios-control off(120s) {for latest hp devices}\n");
+	return fan_data[0]; /* BIOS_PROTECTION-{0},OCP-{1},OTP-{2} */
 }
 
-static int hp_wmi_get_fan_speed(int fan)
+static int hp_wmi_get_fan_speed_ami(int fan)
 {
 	u8 fsh, fsl;
 	char fan_data[4] = { fan, 0, 0, 0 };
 
-	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
+	int ret = hp_wmi_perform_query(HPWMI_AMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
 				       &fan_data, sizeof(char),
 				       sizeof(fan_data));
 
@@ -492,7 +514,7 @@ static int hp_wmi_get_fan_speed(int fan)
 	return (fsh << 8) | fsl;
 }
 
-static int hp_wmi_get_fan_speed_victus_s(int fan)
+static int hp_wmi_get_fan_speed_insyde(int fan)
 {
 	u8 fan_data[128] = {};
 	int ret;
@@ -500,7 +522,7 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
 	if (fan < 0 || fan >= sizeof(fan_data))
 		return -EINVAL;
 
-	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
+	ret = hp_wmi_perform_query(HPWMI_INSYDE_FAN_SPEED_GET_QUERY,
 				   HPWMI_GM, &fan_data, sizeof(u8),
 				   sizeof(fan_data));
 	if (ret != 0)
@@ -509,6 +531,122 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
 	return fan_data[fan] * 100;
 }
 
+static int hp_wmi_set_fan_speed(int cpu, int gpu)
+{
+	u8 fan_speed[2] = { cpu, gpu };
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_INSYDE_FAN_SPEED_SET_QUERY, HPWMI_GM,
+				   &fan_speed, sizeof(fan_speed), 0);
+
+	return ret;
+}
+
+static int hp_wmi_fan_speed_max_set(int enabled)
+{
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
+				   &enabled, sizeof(enabled), 0);
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return enabled;
+}
+
+static int hp_wmi_fan_speed_max_get(void)
+{
+	int val = 0, ret;
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
+				   &val, zero_if_sup(val), sizeof(val));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return val;
+}
+
+static int hp_wmi_fan_speed_reset(void)
+{
+	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_INSYDE_FAN_SPEED_SET_QUERY, HPWMI_GM,
+				   &fan_speed, sizeof(fan_speed), 0);
+
+	return ret;
+}
+
+static int hp_wmi_fan_speed_max_reset(void)
+{
+	int ret;
+
+	ret = hp_wmi_fan_speed_max_set(0);
+	if (ret)
+		return ret;
+
+	/* Disabling max fan speed on Insyde laptops needs a 2nd step: */
+	ret = hp_wmi_fan_speed_reset();
+	return ret;
+}
+
+static int hp_wmi_get_backlight(void)
+{
+	int ret;
+	u8 data[4] = {};
+
+	ret = hp_wmi_perform_query(HPWMI_GET_BACKLIGHT, HPWMI_GM_v2,
+				   &data, sizeof(u8), sizeof(data));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+	return (data[0] == 0x00) ? 0 : 1;
+}
+
+static int hp_wmi_set_backlight(enum hp_wmi_backlight enabled)
+{
+	int ret;
+	u8 data[4] = { enabled, 0, 0, 0 };
+
+	ret = hp_wmi_perform_query(HPWMI_SET_BACKLIGHT, HPWMI_GM_v2,
+				   &data, sizeof(data), 0);
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return 1;
+}
+
+static int hp_wmi_get_gpumode(void)
+{
+	int ret;
+	u8 data[4] = { 0x00 };
+
+	ret = hp_wmi_perform_query(HPWMI_GPU_POWER_QUERY, HPWMI_READ,
+				   &data, sizeof(data), sizeof(data));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return ret;
+}
+
+static int hp_wmi_set_gpumode(enum hp_gpu_mode enabled)
+{
+	int ret;
+	u8 data[4] = { enabled, 0x00, 0x00, 0x00 };
+
+	ret = hp_wmi_perform_query(HPWMI_GPU_POWER_QUERY, HPWMI_WRITE,
+				   &data, sizeof(data), 0);
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return 1;
+}
+
 static int hp_wmi_read_int(int query)
 {
 	int val = 0, ret;
@@ -564,7 +702,7 @@ static int omen_thermal_profile_set(int mode)
 	 * 255, so let's mimic this behaviour to be as close as possible to
 	 * the original software.
 	 */
-	char buffer[2] = {-1, mode};
+	char buffer[2] = { -1, mode };
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
@@ -624,56 +762,6 @@ static int omen_thermal_profile_get(void)
 	return data;
 }
 
-static int hp_wmi_fan_speed_max_set(int enabled)
-{
-	int ret;
-
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
-				   &enabled, sizeof(enabled), 0);
-
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-
-	return enabled;
-}
-
-static int hp_wmi_fan_speed_reset(void)
-{
-	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
-	int ret;
-
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
-				   &fan_speed, sizeof(fan_speed), 0);
-
-	return ret;
-}
-
-static int hp_wmi_fan_speed_max_reset(void)
-{
-	int ret;
-
-	ret = hp_wmi_fan_speed_max_set(0);
-	if (ret)
-		return ret;
-
-	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
-	ret = hp_wmi_fan_speed_reset();
-	return ret;
-}
-
-static int hp_wmi_fan_speed_max_get(void)
-{
-	int val = 0, ret;
-
-	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, zero_if_sup(val), sizeof(val));
-
-	if (ret)
-		return ret < 0 ? ret : -EINVAL;
-
-	return val;
-}
-
 static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
@@ -791,6 +879,77 @@ static int hp_wmi_rfkill2_refresh(void)
 	return 0;
 }
 
+static ssize_t systemdesign_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	int ret, i;
+	u8 buffer[128];
+	ssize_t len = 0;
+
+	ret = hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
+					buffer, sizeof(buffer), sizeof(buffer));
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < 16; i++)
+		len += sysfs_emit_at(buf, len, "%02x ", buffer[i]);
+	buf[len - 1] = '\n';
+
+	return len;
+}
+
+static ssize_t adapter_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	int ret = hp_wmi_read_int(HPWMI_ADAPTER_QUERY);
+
+	if (ret < 0)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%02X\n", ret);
+}
+
+static ssize_t mux_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	int ret = hp_wmi_get_gpumode();
+
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", ret);
+}
+
+static ssize_t fancount_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	int ret = hp_wmi_get_fan_count();
+
+	if (ret < 0)
+		return -EINVAL;
+	return sysfs_emit(buf, "fancount : %d\n", ret);
+}
+
+static ssize_t fanspeed_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	int speed = hp_wmi_get_fan_speed_insyde(0);
+
+	if (speed < 0)
+		return -EINVAL;
+	return sysfs_emit(buf, "speed : %d\n", speed);
+}
+
+static ssize_t backlight_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	int ret = hp_wmi_get_backlight();
+
+	if (ret < 0)
+		return -EINVAL;
+	return sysfs_emit(buf, "%d\n", ret);
+}
+
 static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
@@ -852,6 +1011,67 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "0x%x\n", value);
 }
 
+static ssize_t backlight_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int ret;
+	bool enable;
+
+	hp_wmi_get_fan_count();
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	if (enable)
+		hp_wmi_set_backlight(BACKLIGHT_ON);
+	else
+		hp_wmi_set_backlight(BACKLIGHT_OFF);
+
+	return count;
+	return count;
+}
+
+static ssize_t mux_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int ret;
+	int enable;
+
+	hp_wmi_get_fan_count();
+	ret = kstrtoint(buf, 10, &enable);
+	if (ret)
+		return ret;
+
+	if (ret > 2)
+		return ret;
+
+	hp_wmi_set_gpumode(enable);
+
+	pr_info("mux mode is now set to: %d\n", enable);
+
+	return count;
+}
+
+static ssize_t fanspeed_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int tmp;
+	int ret;
+
+	ret = kstrtoint(buf, 16, &tmp);
+	if (ret < 0) {
+		pr_warn("Something is wrong\n");
+		return ret;
+	}
+	if (tmp == 0)
+		hp_wmi_set_fan_speed(0, 0);
+	else if (tmp > 0 && tmp < 67)
+		hp_wmi_set_fan_speed(tmp, tmp+3);
+	else
+		pr_info("invalid input\n");
+	return count;
+}
+
 static ssize_t als_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
@@ -926,8 +1146,20 @@ static DEVICE_ATTR_RW(als);
 static DEVICE_ATTR_RO(dock);
 static DEVICE_ATTR_RO(tablet);
 static DEVICE_ATTR_RW(postcode);
+static DEVICE_ATTR_RW(backlight);
+static DEVICE_ATTR_RO(fancount);
+static DEVICE_ATTR_RW(fanspeed);
+static DEVICE_ATTR_RO(systemdesign);
+static DEVICE_ATTR_RW(mux);
+static DEVICE_ATTR_RO(adapter);
 
 static struct attribute *hp_wmi_attrs[] = {
+	&dev_attr_backlight.attr,
+	&dev_attr_mux.attr,
+	&dev_attr_adapter.attr,
+	&dev_attr_fancount.attr,
+	&dev_attr_fanspeed.attr,
+	&dev_attr_systemdesign.attr,
 	&dev_attr_display.attr,
 	&dev_attr_hddtemp.attr,
 	&dev_attr_als.attr,
@@ -1309,16 +1541,16 @@ static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 		return tp;
 
 	switch (tp) {
-	case HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE:
-	case HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE:
+	case FANMODE_LEGACY_PERFORMANCE:
+	case FANMODE_L7:
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 		break;
-	case HP_OMEN_V0_THERMAL_PROFILE_DEFAULT:
-	case HP_OMEN_V1_THERMAL_PROFILE_DEFAULT:
+	case FANMODE_LEGACY_DEFAULT:
+	case FANMODE_L2:
 		*profile = PLATFORM_PROFILE_BALANCED;
 		break;
-	case HP_OMEN_V0_THERMAL_PROFILE_COOL:
-	case HP_OMEN_V1_THERMAL_PROFILE_COOL:
+	case FANMODE_LEGACY_COOL:
+	case FANMODE_L4:
 		*profile = PLATFORM_PROFILE_COOL;
 		break;
 	default:
@@ -1384,21 +1616,21 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
 		if (tp_version == 0)
-			tp = HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
+			tp = FANMODE_LEGACY_PERFORMANCE;
 		else
-			tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE;
+			tp = FANMODE_L7;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
 		if (tp_version == 0)
-			tp = HP_OMEN_V0_THERMAL_PROFILE_DEFAULT;
+			tp = FANMODE_LEGACY_DEFAULT;
 		else
-			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
+			tp = FANMODE_L2;
 		break;
 	case PLATFORM_PROFILE_COOL:
 		if (tp_version == 0)
-			tp = HP_OMEN_V0_THERMAL_PROFILE_COOL;
+			tp = FANMODE_LEGACY_COOL;
 		else
-			tp = HP_OMEN_V1_THERMAL_PROFILE_COOL;
+			tp = FANMODE_L4;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1462,16 +1694,16 @@ static int hp_wmi_platform_profile_get(struct device *dev,
 		return tp;
 
 	switch (tp) {
-	case HP_THERMAL_PROFILE_PERFORMANCE:
+	case FANMODE_LEGACY_DEFAULT:
 		*profile =  PLATFORM_PROFILE_PERFORMANCE;
 		break;
-	case HP_THERMAL_PROFILE_DEFAULT:
+	case FANMODE_LEGACY_PERFORMANCE:
 		*profile =  PLATFORM_PROFILE_BALANCED;
 		break;
-	case HP_THERMAL_PROFILE_COOL:
+	case FANMODE_LEGACY_COOL:
 		*profile =  PLATFORM_PROFILE_COOL;
 		break;
-	case HP_THERMAL_PROFILE_QUIET:
+	case FANMODE_LEGACY_QUIET:
 		*profile = PLATFORM_PROFILE_QUIET;
 		break;
 	default:
@@ -1488,16 +1720,16 @@ static int hp_wmi_platform_profile_set(struct device *dev,
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp =  HP_THERMAL_PROFILE_PERFORMANCE;
+		tp =  FANMODE_LEGACY_DEFAULT;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp =  HP_THERMAL_PROFILE_DEFAULT;
+		tp =  FANMODE_LEGACY_PERFORMANCE;
 		break;
 	case PLATFORM_PROFILE_COOL:
-		tp =  HP_THERMAL_PROFILE_COOL;
+		tp =  FANMODE_LEGACY_COOL;
 		break;
 	case PLATFORM_PROFILE_QUIET:
-		tp = HP_THERMAL_PROFILE_QUIET;
+		tp = FANMODE_LEGACY_QUIET;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1531,13 +1763,13 @@ static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
 		return tp;
 
 	switch (tp) {
-	case HP_VICTUS_THERMAL_PROFILE_PERFORMANCE:
+	case FANMODE_LEGACY_PERFORMANCE:
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 		break;
-	case HP_VICTUS_THERMAL_PROFILE_DEFAULT:
+	case FANMODE_LEGACY_DEFAULT:
 		*profile = PLATFORM_PROFILE_BALANCED;
 		break;
-	case HP_VICTUS_THERMAL_PROFILE_QUIET:
+	case FANMODE_LEGACY_QUIET:
 		*profile = PLATFORM_PROFILE_QUIET;
 		break;
 	default:
@@ -1560,13 +1792,13 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = HP_VICTUS_THERMAL_PROFILE_PERFORMANCE;
+		tp = FANMODE_LEGACY_PERFORMANCE;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp = HP_VICTUS_THERMAL_PROFILE_DEFAULT;
+		tp = FANMODE_LEGACY_DEFAULT;
 		break;
 	case PLATFORM_PROFILE_QUIET:
-		tp = HP_VICTUS_THERMAL_PROFILE_QUIET;
+		tp = FANMODE_LEGACY_QUIET;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1592,12 +1824,12 @@ static bool is_victus_s_thermal_profile(void)
 			    board_name) >= 0;
 }
 
-static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
+static int hp_wmi_gpu_thermal_profile_get(bool *ctgp_enable,
 					    bool *ppab_enable,
 					    u8 *dstate,
 					    u8 *gpu_slowdown_temp)
 {
-	struct victus_gpu_power_modes gpu_power_modes;
+	struct hp_gpu_power_modes gpu_power_modes;
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_GET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
@@ -1613,18 +1845,43 @@ static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 	return ret;
 }
 
-static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
+/* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
+static int hp_wmi_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
+{
+	struct hp_power_limits power_limits;
+	int ret;
+
+	/* We need to know both PL1 and PL2 values in order to check them */
+	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
+		return -EINVAL;
+
+	/* PL2 is not supposed to be lower than PL1 */
+	if (pl2 < pl1)
+		return -EINVAL;
+
+	power_limits.pl1 = pl1;
+	power_limits.pl2 = pl2;
+	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
+	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
+
+	ret = hp_wmi_perform_query(HPWMI_CPU_POWER_SET_QUERY, HPWMI_GM,
+				   &power_limits, sizeof(power_limits), 0);
+
+	return ret;
+}
+
+static int hp_wmi_gpu_thermal_profile_set(bool ctgp_enable,
 					    bool ppab_enable,
 					    u8 dstate)
 {
-	struct victus_gpu_power_modes gpu_power_modes;
+	struct hp_gpu_power_modes gpu_power_modes;
 	int ret;
 
 	bool current_ctgp_state, current_ppab_state;
 	u8 current_dstate, current_gpu_slowdown_temp;
 
 	/* Retrieving GPU slowdown temperature, in order to keep it unchanged */
-	ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
+	ret = hp_wmi_gpu_thermal_profile_get(&current_ctgp_state,
 					       &current_ppab_state,
 					       &current_dstate,
 					       &current_gpu_slowdown_temp);
@@ -1645,31 +1902,6 @@ static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
 	return ret;
 }
 
-/* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
-static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
-{
-	struct victus_power_limits power_limits;
-	int ret;
-
-	/* We need to know both PL1 and PL2 values in order to check them */
-	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
-		return -EINVAL;
-
-	/* PL2 is not supposed to be lower than PL1 */
-	if (pl2 < pl1)
-		return -EINVAL;
-
-	power_limits.pl1 = pl1;
-	power_limits.pl2 = pl2;
-	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
-	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
-
-	ret = hp_wmi_perform_query(HPWMI_SET_POWER_LIMITS_QUERY, HPWMI_GM,
-				   &power_limits, sizeof(power_limits), 0);
-
-	return ret;
-}
-
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
 	bool gpu_ctgp_enable, gpu_ppab_enable;
@@ -1678,19 +1910,19 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
 
 	switch (profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
+		tp = FANMODE_LEGACY_PERFORMANCE;
 		gpu_ctgp_enable = true;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		tp = FANMODE_LEGACY_DEFAULT;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = true;
 		gpu_dstate = 1;
 		break;
 	case PLATFORM_PROFILE_LOW_POWER:
-		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
+		tp = FANMODE_LEGACY_DEFAULT;
 		gpu_ctgp_enable = false;
 		gpu_ppab_enable = false;
 		gpu_dstate = 1;
@@ -1699,7 +1931,7 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
 		return -EOPNOTSUPP;
 	}
 
-	hp_wmi_get_fan_count_userdefine_trigger();
+	hp_wmi_get_fan_count();
 
 	err = omen_thermal_profile_set(tp);
 	if (err < 0) {
@@ -1707,7 +1939,7 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
 		return err;
 	}
 
-	err = victus_s_gpu_thermal_profile_set(gpu_ctgp_enable,
+	err = hp_wmi_gpu_thermal_profile_set(gpu_ctgp_enable,
 					       gpu_ppab_enable,
 					       gpu_dstate);
 	if (err < 0) {
@@ -1750,13 +1982,89 @@ static int platform_profile_victus_set(struct device *dev,
 	return 0;
 }
 
+static bool is_omen_v1_thermal_profile(void)
+{
+	const char *board_name;
+
+	board_name = dmi_get_system_info(DMI_BOARD_NAME);
+	if (!board_name)
+		return false;
+
+	return match_string(thermal_profile_v1_boards,
+			    ARRAY_SIZE(thermal_profile_v1_boards),
+			    board_name) >= 0;
+}
+
+static int platform_profile_omen_v1_set_ec(enum platform_profile_option profile)
+{
+	bool gpu_ctgp_enable, gpu_ppab_enable;
+	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
+	int err;
+	enum hp_fan_mode tp;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		tp = FANMODE_L7;
+		gpu_ctgp_enable = true;
+		gpu_ppab_enable = true;
+		gpu_dstate = 1;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		tp = FANMODE_L2;
+		gpu_ctgp_enable = false;
+		gpu_ppab_enable = true;
+		gpu_dstate = 1;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		tp = FANMODE_L2;
+		gpu_ctgp_enable = false;
+		gpu_ppab_enable = false;
+		gpu_dstate = 1;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	err = omen_thermal_profile_set(tp);
+	if (err < 0) {
+		pr_err("Failed to set platform profile %d: %d\n", profile, err);
+		return err;
+	}
+
+	err = hp_wmi_gpu_thermal_profile_set(gpu_ctgp_enable,
+					       gpu_ppab_enable,
+					       gpu_dstate);
+	if (err < 0) {
+		pr_err("Failed to set GPU profile %d: %d\n", profile, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int platform_profile_omen_v1_set(struct device *dev,
+					 enum platform_profile_option profile)
+{
+	int err;
+
+	guard(mutex)(&active_platform_profile_lock);
+
+	err = platform_profile_omen_v1_set_ec(profile);
+	if (err < 0)
+		return err;
+
+	active_platform_profile = profile;
+
+	return 0;
+}
+
 static int hp_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
 {
 	if (is_omen_thermal_profile()) {
 		set_bit(PLATFORM_PROFILE_COOL, choices);
 	} else if (is_victus_thermal_profile()) {
 		set_bit(PLATFORM_PROFILE_QUIET, choices);
-	} else if (is_victus_s_thermal_profile()) {
+	} else if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile()) {
 		/* Adding an equivalent to HP Omen software ECO mode: */
 		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
 	} else {
@@ -1849,7 +2157,40 @@ static int victus_s_powersource_event(struct notifier_block *nb,
 
 	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
 		pr_debug("Triggering CPU PL1/PL2 actualization\n");
-		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
+		err = hp_wmi_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
+					       HP_POWER_LIMIT_DEFAULT);
+		if (err)
+			pr_warn("Failed to actualize power limits: %d\n", err);
+
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int omen_v1_powersource_event(struct notifier_block *nb,
+				      unsigned long value,
+				      void *data)
+{
+	struct acpi_bus_event *event_entry = data;
+	int err;
+
+	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
+		return NOTIFY_DONE;
+
+	pr_debug("Received power source device event\n");
+
+	/*
+	 * Switching to battery power source while Performance mode is active
+	 * needs manual triggering of CPU power limits. Same goes when switching
+	 * to AC power source while Performance mode is active. Other modes
+	 * however are automatically behaving without any manual action.
+	 * Seen on OMEN v1 Boards.
+	 */
+
+	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
+		pr_debug("Triggering CPU PL1/PL2 actualization\n");
+		err = hp_wmi_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
 					       HP_POWER_LIMIT_DEFAULT);
 		if (err)
 			pr_warn("Failed to actualize power limits: %d\n", err);
@@ -1889,6 +2230,20 @@ static int victus_s_register_powersource_event_handler(void)
 	return 0;
 }
 
+static int omen_v1_register_powersource_event_handler(void)
+{
+	int err;
+
+	platform_power_source_nb.notifier_call = omen_v1_powersource_event;
+	err = register_acpi_notifier(&platform_power_source_nb);
+	if (err < 0) {
+		pr_warn("Failed to install ACPI power source notify handler\n");
+		return err;
+	}
+
+	return 0;
+}
+
 static inline void omen_unregister_powersource_event_handler(void)
 {
 	unregister_acpi_notifier(&platform_power_source_nb);
@@ -1899,6 +2254,11 @@ static inline void victus_s_unregister_powersource_event_handler(void)
 	unregister_acpi_notifier(&platform_power_source_nb);
 }
 
+static inline void omen_v1_unregister_powersource_event_handler(void)
+{
+	unregister_acpi_notifier(&platform_power_source_nb);
+}
+
 static const struct platform_profile_ops platform_profile_omen_ops = {
 	.probe = hp_wmi_platform_profile_probe,
 	.profile_get = platform_profile_omen_get,
@@ -1917,6 +2277,12 @@ static const struct platform_profile_ops platform_profile_victus_s_ops = {
 	.profile_set = platform_profile_victus_s_set,
 };
 
+static const struct platform_profile_ops platform_profile_omen_v1_ops = {
+	.probe = hp_wmi_platform_profile_probe,
+	.profile_get = platform_profile_omen_get,
+	.profile_set = platform_profile_omen_v1_set,
+};
+
 static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
 	.probe = hp_wmi_platform_profile_probe,
 	.profile_get = hp_wmi_platform_profile_get,
@@ -1968,6 +2334,18 @@ static int thermal_profile_setup(struct platform_device *device)
 			return err;
 
 		ops = &platform_profile_victus_s_ops;
+	} else if (is_omen_v1_thermal_profile()) {
+		/*
+		 * Being unable to retrieve laptop's current thermal profile,
+		 * So doing the same process as above.
+		 */
+		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+
+		err = platform_profile_omen_v1_set_ec(active_platform_profile);
+		if (err < 0)
+			return err;
+
+		ops = &platform_profile_omen_v1_ops;
 	} else {
 		tp = thermal_profile_get();
 
@@ -2116,11 +2494,11 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 	case hwmon_pwm:
 		return 0644;
 	case hwmon_fan:
-		if (is_victus_s_thermal_profile()) {
-			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
+		if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile()) {
+			if (hp_wmi_get_fan_speed_insyde(channel) >= 0)
 				return 0444;
 		} else {
-			if (hp_wmi_get_fan_speed(channel) >= 0)
+			if (hp_wmi_get_fan_speed_ami(channel) >= 0)
 				return 0444;
 		}
 		break;
@@ -2138,10 +2516,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 
 	switch (type) {
 	case hwmon_fan:
-		if (is_victus_s_thermal_profile())
-			ret = hp_wmi_get_fan_speed_victus_s(channel);
+		if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile())
+			ret = hp_wmi_get_fan_speed_insyde(channel);
 		else
-			ret = hp_wmi_get_fan_speed(channel);
+			ret = hp_wmi_get_fan_speed_ami(channel);
 		if (ret < 0)
 			return ret;
 		*val = ret;
@@ -2174,14 +2552,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	case hwmon_pwm:
 		switch (val) {
 		case 0:
-			if (is_victus_s_thermal_profile())
-				hp_wmi_get_fan_count_userdefine_trigger();
+			if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile())
+				hp_wmi_get_fan_count();
 			/* 0 is no fan speed control (max), which is 1 for us */
 			return hp_wmi_fan_speed_max_set(1);
 		case 2:
 			/* 2 is automatic speed control, which is 0 for us */
-			if (is_victus_s_thermal_profile()) {
-				hp_wmi_get_fan_count_userdefine_trigger();
+			if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile()) {
+				hp_wmi_get_fan_count();
 				return hp_wmi_fan_speed_max_reset();
 			} else
 				return hp_wmi_fan_speed_max_set(0);
@@ -2267,6 +2645,10 @@ static int __init hp_wmi_init(void)
 		err = victus_s_register_powersource_event_handler();
 		if (err)
 			goto err_unregister_device;
+	} else if (is_omen_v1_thermal_profile()) {
+		err = omen_v1_register_powersource_event_handler();
+		if (err)
+			goto err_unregister_device;
 	}
 
 	return 0;
@@ -2289,6 +2671,9 @@ static void __exit hp_wmi_exit(void)
 	if (is_victus_s_thermal_profile())
 		victus_s_unregister_powersource_event_handler();
 
+	if (is_omen_v1_thermal_profile())
+		omen_v1_unregister_powersource_event_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.52.0

