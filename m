Received: from outbound.st.icloud.com (p-east2-cluster5-host6-snip4-6.eps.apple.com [57.103.79.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D362E7382
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219440; cv=none; b=GqM8YtClGRyp/witYIs/pXhz53r+hAa8Z6zbJX7kkOUdwo6ezr87jk/1UAWilu8kzSgQLOti15xvrCJJ4cnZLXUdLjwzw0vpAZ2N4BueFmHeMeZSDZKtIwlmhx4aDm9Tkxw3td+4bxQYTVEaiVduGCWP7t+WKiTlk29gg/lkT4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219440; c=relaxed/simple;
	bh=VuYwz92H6xDRGxQ+GVRvqn6LBc1ttHI8TVST6Df+vxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vi3EFIhFs/TrvlpzTbfqaG8oP0mBtnLLU9c6AoVlmzwNwK0yyx6rP6WowinG7z8Ms3/GLKiqVL4bHptMEIkCHwBOxKO+ieW7zdZEnxB2Cg6kSlCwO0seDmos8x9p+nzPjC2V6BP9CJ36ZNqglUh4faWqUZ6u5YFmwX8mgMA1/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=mZp6Qoh+; arc=none smtp.client-ip=57.103.79.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="mZp6Qoh+"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-11 (Postfix) with ESMTPS id E1075180013D;
	Sun, 31 May 2026 09:23:55 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAFQwRfEhVdRVsIWwddMFINQR5WH1MSWAFfBBkPVwYZHldQXB5AA1gMUg9WEl4ZFxxWGxcZUU0BWFsIWwQPH0wMUQJCBVZeSgwdBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEE0YfRApGEVsZSgFeRVYVT1heBFNWDkIJSgVdAlgDQABKAF8BRQBAAEsLQAZGWhVVFFwtXB5AA1gMUg9WEl4ZFxxWGwlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1780219437; x=1782811437; bh=DMTYi3et8jCu7uU2GHjl2VkfAnJs7NpJSk0DOYqRZrY=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=mZp6Qoh+ELiS/McYlBBEEwEoHsV1fR5aGRlQckPgK+2ll4vQzyMVg9MTEV0/PNa5n+h7jcH6GCY6QTKgHU7SJ0J2LnQ1jhd8y0Kxhgxv13UwO0QbfB6E63C2dLFMKSkrVhGsfeFFmZo/YzCaSMVLndwbdRuv2jWG8ymAOR6yPFbeDTJkllWe3ZtL30rKvnIQhl6fkKIWXYW+dKPmMTAAqBVrA2C7zynNWiQiXG67hO/PlnUzF7o4YJ7gXYyNzobGZB1FlW+Zw6Ad/mvEdHz4Dw4cef6FEj+3zga71znuELj4TAgEf74esAyS7xKqbQntHVr/rj3yXSbsPaHjVKd+eg==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-11 (Postfix) with ESMTPSA id 9F1371800122;
	Sun, 31 May 2026 09:23:53 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: krishna.chomal108@gmail.com,
	emreleno@gmail.com,
	edip@medip.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v2] platform/x86: hp-wmi: Add dual-channel PWM fan control for Victus S
Date: Sun, 31 May 2026 12:23:26 +0300
Message-ID: <20260531092326.20938-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NwPMqBci4k3c9EfsXr-9Dl8QEUnx_waF
X-Proofpoint-ORIG-GUID: NwPMqBci4k3c9EfsXr-9Dl8QEUnx_waF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDEwMyBTYWx0ZWRfX83HBxt34MyYm
 yQZo3Jlm/Jw+8/gu8NdMslzmwhjpldLTqrkliEDcj7yKfxGZvtMK8ktlAX6r9tG+dkU0NFiMXqj
 QCYEmWwcNE9NztakIPUDL+Q1/2yo3UKvIw8S1LaGpx3x7yu4g30Za/c5ZDUr43w+6HacrETCKLg
 ED2m/B024xH6vxrO2jW4sCCZLC4UPWe06R4tXm/nUqkxS7pOx+/frV6+R4mmbB5U7UISoDZofoJ
 TVf2qQVquD+J7hPuWmE6rJ+IgGOC6vHsZGJB2uDcDeUS2yxNdE418+v2q6Eh/hWUiFpQ4mHi07J
 OU49ev0n4zYKD9FSOZaRBNfdE/gt6NJ6tnWjknVFbBAokvEHO8tj+8b3jvWtYU=
X-Authority-Info-Out: v=2.4 cv=dbqNHHXe c=1 sm=1 tr=0 ts=6a1bfe2c
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=vcup9ZhQ8iJMFhidf80A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Currently, manual fan control on supported Victus S models uses a single
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

Signed-off-by: Kürşat Abaylı <hello@kursatabayli.dev>
---
Changes in v2:
- Made RPM readings atomic during the transition to manual mode.
- Fixed a variable scoping issue in the pwm_input block.
---
 drivers/platform/x86/hp/hp-wmi.c | 57 ++++++++++++++++----------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f63bc00d9a9b..51611dd2220f 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -488,9 +488,9 @@ struct hp_wmi_hwmon_priv {
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
 
@@ -817,24 +817,15 @@ static int hp_wmi_fan_speed_max_set(int enabled)
 	return enabled;
 }
 
-static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
+static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_speed[2];
-	int gpu_speed, ret;
-
-	fan_speed[CPU_FAN] = speed;
-	fan_speed[GPU_FAN] = speed;
+	int ret;
 
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
+	fan_speed[CPU_FAN] = (priv->cpu_pwm == HP_FAN_SPEED_AUTOMATIC) ?
+	HP_FAN_SPEED_AUTOMATIC : pwm_to_rpm(priv->cpu_pwm, priv);
+	fan_speed[GPU_FAN] = (priv->gpu_pwm == HP_FAN_SPEED_AUTOMATIC) ?
+	HP_FAN_SPEED_AUTOMATIC : pwm_to_rpm(priv->gpu_pwm, priv);
 
 	ret = hp_wmi_get_fan_count_userdefine_trigger();
 	if (ret < 0)
@@ -851,7 +842,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
 
 static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
 {
-	return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
+	priv->cpu_pwm = HP_FAN_SPEED_AUTOMATIC;
+	priv->gpu_pwm = HP_FAN_SPEED_AUTOMATIC;
+	return hp_wmi_fan_speed_set(priv);
 }
 
 static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
@@ -2402,7 +2395,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	case PWM_MODE_MANUAL:
 		if (!is_victus_s_thermal_profile())
 			return -EOPNOTSUPP;
-		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
+		ret = hp_wmi_fan_speed_set(priv);
 		if (ret < 0)
 			return ret;
 		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
@@ -2502,13 +2495,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
 			if (!is_victus_s_thermal_profile())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
@@ -2518,7 +2512,10 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			/* ensure PWM input is within valid fan speeds */
 			rpm = pwm_to_rpm(val, priv);
 			rpm = clamp_val(rpm, priv->min_rpm, priv->max_rpm);
-			priv->pwm = rpm_to_pwm(rpm, priv);
+			if (channel == 0)
+				priv->cpu_pwm = rpm_to_pwm(rpm, priv);
+			else
+				priv->gpu_pwm = rpm_to_pwm(rpm, priv);
 			return hp_wmi_apply_fan_settings(priv);
 		}
 		switch (val) {
@@ -2532,10 +2529,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			 * When switching to manual mode, set fan speed to
 			 * current RPM values to ensure a smooth transition.
 			 */
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
-			if (rpm < 0)
-				return rpm;
-			priv->pwm = rpm_to_pwm(rpm / 100, priv);
+			cpu_rpm = hp_wmi_get_fan_speed_victus_s(CPU_FAN);
+			if (cpu_rpm < 0)
+				return cpu_rpm;
+			gpu_rpm = hp_wmi_get_fan_speed_victus_s(GPU_FAN);
+			if (gpu_rpm < 0)
+				return gpu_rpm;
+			priv->cpu_pwm = rpm_to_pwm(cpu_rpm / 100, priv);
+			priv->gpu_pwm = rpm_to_pwm(gpu_rpm / 100, priv);
 			priv->mode = PWM_MODE_MANUAL;
 			return hp_wmi_apply_fan_settings(priv);
 		case PWM_MODE_AUTO:
@@ -2551,7 +2552,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2592,7 +2593,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
-	int gpu_delta, i, num_entries, ret;
+	int i, num_entries, ret;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
@@ -2638,10 +2639,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

