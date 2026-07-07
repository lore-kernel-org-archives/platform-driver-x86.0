Received: from outbound.mr.icloud.com (mr-2003k-snip4-6.eps.apple.com [57.103.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AC53E557C
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456677; cv=none; b=BsWKl4san8lUHuqtq7JPxfqAofehjH0/CRcs6fFVSgridKTmS5VI5RAxJi+FZn51w8mWzEtEPqM4OpHZ6yoAzSzYWtnkGPFdz4V7jb37bDNccS47JO87jkh7TZJMG5DVhzwr0DIgVRgDdjha9mwY8ZZaAlj1eBKQFP37bBoZlis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456677; c=relaxed/simple;
	bh=oNA1VQpNrGBDNQE12Qtwp0KN9Y7WK3ZF03GW0IZy3os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qulWGKOJxk3q0+ensUZhIGYSYk/xXsCazEhnERfDbKJv8+87dPGu9HwXyD1ik1lD98CRCpgKXEbOH/HmxZU1lIdcB60IYBiqMLSNUjgafKHaTGkis/auv/DQ21bx3HtTUBu42SlUtkTjVcVB4fKd7jSLX5XRLcPrjYkkQB/Wr3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=Bu5Lr6RN; arc=none smtp.client-ip=57.103.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="Bu5Lr6RN"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-6 (Postfix) with ESMTPS id 54418180045E;
	Tue, 07 Jul 2026 20:37:51 +0000 (UTC)
X-ICL-RepId: 019f3e4d-25bb-7ba9-97b3-c1ac5b311841
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAEQwZeB1BcHA4FUgdeH3kTRh9ECkYRWxlKAV5FVhVPWFUJCgBHAkoZRwxVCkscUFZXCEFLQBMETxMFUgddTVYNRw9YHlwUFxVBQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRVgYRRhTBFgaUhRbAhwUXA4TAF4PD0wLSAFbB1wCRwtIAFoDWxxFDEsFVBpaHxhcFF8CdwBHAkoZRwxVCkscUFZXCEFVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1783456674; x=1786048674; bh=XAG0BFYr43m42w8xofK2TmNqCUSqb4UTzLsTIPtlcUo=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Bu5Lr6RNtOYvAIdMeBi/PKSxqeuX3j0UfA/yQ8bmUHaR+MZ/o1tG6fIdhm9VrzB+12URhvSFkpIRaBFA0wHPlx5MbhUGJAw/1aqcvlRve6Ccxqps9knFsXStOJQr74IkSeqTK9YjkhgZ1nEXh8LhotIzW4HXSu/Z1zbsEAX6lMy7EE4kLPbbrcBDTbr7HWngU7eYHRaMl+WCaMRIXYU2Zl/cGfll8CcZlwkjlvZ5A9E/a3gOQOJHvKomBpxTA9pgnGP1mEF9UQTZlor8oUZbTUrLZMMEwxNkCDSRYdYl9cRWo09Ehl0NvGdwTRYfqFCeqi2dC3DXojpz21ngL4pxag==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-6 (Postfix) with ESMTPSA id 4A0721800478;
	Tue, 07 Jul 2026 20:37:48 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v4] platform/x86: hp-wmi: Add dual-channel PWM fan control
Date: Tue,  7 Jul 2026 23:37:40 +0300
Message-ID: <20260707203740.55369-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K-bd5vSKlzN5REMGlXCmEyUAO5WBg4z2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMiBTYWx0ZWRfX90QtQK3eduOB
 7QV2KbWf2dD12PpR9AzBFPtmNIKctKX8s0KmScZAASBjHvxb9m57JOXejphlI39cryfMmcw10Kd
 9taKJ32vmuQ88C7P0vcnexHvwQdHPfQFOoeCaIhNwF5jJXgFG1oNLVLLDiTS6pVs8nIreJrjw36
 c1LDadE1ikzXfaHkFglQpsWahRxUIZJIkIErqT6HTeLWtVLr3d87f0s3x0WgSwOCKPrzqOi+MPu
 KJs4mFzI/WC2e4Hrvqzlt+KPAabgzqAiRGHloydDXm39MegMXjG8kOMB14bNSykzH9WtIIUki7M
 Cqw65lCs6hJB1sxzmlo
X-Proofpoint-GUID: K-bd5vSKlzN5REMGlXCmEyUAO5WBg4z2

Currently, manual fan control on supported HP models uses a single
PWM value for both CPU and GPU fans, linking their speeds via a hardcoded
gpu_delta offset. This prevents userspace tools from managing the thermal
profiles of the CPU and GPU independently.

Refactor the hwmon implementation to support independent dual-channel
PWM control:
- Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
- Expose a second PWM channel ('pwm2') to userspace via hwmon_channel_info.
- Remove the gpu_delta mechanism entirely.

The 'pwm1_enable' mode remains shared, as the underlying hardware does
not support per-fan modes. When switching to manual mode, both fans are
smoothly initialized to their current RPMs. Additionally, ensure that
the HP_FAN_SPEED_AUTOMATIC flag is isolated from rpm_to_pwm mathematical
interpolations during mode resets to prevent unintended fan states.

Tested on: HP Victus 16-s0xxx

Tested-by: Radhey Kalra <radheykalra901@gmail.com>
Signed-off-by: Kürşat Abaylı <hello@kursatabayli.dev>
---
Changes in v4:
- Updated commit title and description to reflect broader HP device support instead of being limited to Victus S.
- Rebased onto latest review-ilpo-next to resolve conflicts refactoring.
- Added Tested-by tag from Radhey Kalra.

Changes in v3:
- Addressed review feedback from Krishna Chomal:
- Expanded ternary operators in hp_wmi_fan_speed_set to standard if-else blocks.
- Replaced hardcoded channel numbers with CPU_FAN and GPU_FAN macros.

Changes in v2:
- Made RPM readings atomic during the transition to manual mode.
- Fixed a variable scoping issue in the pwm_input block.
---
 drivers/platform/x86/hp/hp-wmi.c | 60 +++++++++++++++++---------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0dcf2901259e..6f6c79e32fe6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -545,9 +545,9 @@ struct hp_wmi_hwmon_priv {
 	struct mutex lock;	/* protects mode, pwm */
 	u8 min_rpm;
 	u8 max_rpm;
-	int gpu_delta;
 	u8 mode;
-	u8 pwm;
+	u8 cpu_pwm;
+	u8 gpu_pwm;
 	struct delayed_work keep_alive_dwork;
 };
 
@@ -874,24 +874,20 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	return enabled;
 }
 
-static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
+static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_speed[2];
-	int gpu_speed, ret;
+	int ret;
 
-	fan_speed[CPU_FAN] = speed;
-	fan_speed[GPU_FAN] = speed;
+	if (priv->cpu_pwm == HP_FAN_SPEED_AUTOMATIC)
+		fan_speed[CPU_FAN] = HP_FAN_SPEED_AUTOMATIC;
+	else
+		fan_speed[CPU_FAN] = pwm_to_rpm(priv->cpu_pwm, priv);
 
-	/*
-	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
-	 * this delta value from the fan table during hwmon init.
-	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
-	 * automatic mode.
-	 */
-	if (speed != HP_FAN_SPEED_AUTOMATIC) {
-		gpu_speed = speed + priv->gpu_delta;
-		fan_speed[GPU_FAN] = clamp_val(gpu_speed, 0, U8_MAX);
-	}
+	if (priv->gpu_pwm == HP_FAN_SPEED_AUTOMATIC)
+		fan_speed[GPU_FAN] = HP_FAN_SPEED_AUTOMATIC;
+	else
+		fan_speed[GPU_FAN] = pwm_to_rpm(priv->gpu_pwm, priv);
 
 	ret = hp_wmi_get_fan_count_userdefine_trigger();
 	if (ret < 0)
@@ -908,7 +904,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
 
 static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
 {
-	return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
+	priv->cpu_pwm = HP_FAN_SPEED_AUTOMATIC;
+	priv->gpu_pwm = HP_FAN_SPEED_AUTOMATIC;
+	return hp_wmi_fan_speed_set(priv);
 }
 
 static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
@@ -2499,7 +2497,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	case PWM_MODE_MANUAL:
 		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
-		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
+		ret = hp_wmi_fan_speed_set(priv);
 		if (ret < 0)
 			return ret;
 		mod_delayed_work(system_dfl_wq, &priv->keep_alive_dwork,
@@ -2599,13 +2597,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, long val)
 {
 	struct hp_wmi_hwmon_priv *priv;
-	int rpm;
+	int cpu_rpm, gpu_rpm;
 
 	priv = dev_get_drvdata(dev);
 	guard(mutex)(&priv->lock);
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
+			int rpm;
 			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
@@ -2615,7 +2614,10 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			/* ensure PWM input is within valid fan speeds */
 			rpm = pwm_to_rpm(val, priv);
 			rpm = clamp_val(rpm, priv->min_rpm, priv->max_rpm);
-			priv->pwm = rpm_to_pwm(rpm, priv);
+			if (channel == CPU_FAN)
+				priv->cpu_pwm = rpm_to_pwm(rpm, priv);
+			else if (channel == GPU_FAN)
+				priv->gpu_pwm = rpm_to_pwm(rpm, priv);
 			return hp_wmi_apply_fan_settings(priv);
 		}
 		switch (val) {
@@ -2629,10 +2631,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			 * When switching to manual mode, set fan speed to
 			 * current RPM values to ensure a smooth transition.
 			 */
-			rpm = hp_wmi_get_active_fan_speed(channel);
-			if (rpm < 0)
-				return rpm;
-			priv->pwm = rpm_to_pwm(rpm / 100, priv);
+			cpu_rpm = hp_wmi_get_active_fan_speed(CPU_FAN);
+			if (cpu_rpm < 0)
+				return cpu_rpm;
+			gpu_rpm = hp_wmi_get_active_fan_speed(GPU_FAN);
+			if (gpu_rpm < 0)
+				return gpu_rpm;
+			priv->cpu_pwm = rpm_to_pwm(cpu_rpm / 100, priv);
+			priv->gpu_pwm = rpm_to_pwm(gpu_rpm / 100, priv);
 			priv->mode = PWM_MODE_MANUAL;
 			return hp_wmi_apply_fan_settings(priv);
 		case PWM_MODE_AUTO:
@@ -2648,7 +2654,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2689,7 +2695,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
-	int gpu_delta, i, num_entries, ret;
+	int i, num_entries, ret;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
@@ -2735,10 +2741,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	if (min_rpm == U8_MAX || max_rpm == 0)
 		return -EINVAL;
 
-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
-	priv->gpu_delta = gpu_delta;
 
 	return 0;
 }
-- 
2.54.0

