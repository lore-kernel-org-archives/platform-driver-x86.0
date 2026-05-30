Received: from outbound.pv.icloud.com (pv-2003i-snip4-6.eps.apple.com [57.103.66.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2252DC79A
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 23:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780183798; cv=none; b=BhxeRqq1gXjVdvcdJRoFa/vUVvybnllx7ZGPTrlxD1twswvLzYi8WR/Q/02jgzBLuIiHOSDGcabPe65+5Eut7fydUI48HG52+2eGOXsXoHWdng5TlkWe9ViIuogcBP4tcfwfUvSZtYZY7PUWbVA3uRfrhQoNqR02jqFhIJgMpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780183798; c=relaxed/simple;
	bh=6f5FzbTS9YZ6QbqTidHvsgWea0WjxoXUYR85xviGWz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZVoBM8uEaymvHm3Wxj7l3gcbKGy+zFJGVe3oGYhtFVSFCebJPGz0R2ZZ3w7kjwjd2Wh/XTpmjrjwQCm3b6ZAQUHn4TiUMFHYbpk6e1OlNGhFz9VKy3stHPM6nXHTBii1UJwjqalzPGxpjxzKgR1zLx8wUVjl2A+xmYCE9SpvF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=l5GkEIlD; arc=none smtp.client-ip=57.103.66.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="l5GkEIlD"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPS id 55B7F1800182;
	Sat, 30 May 2026 23:29:52 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAFQwRfEhVdRVsIWwddMFINQR5WH1MSWAFfBBkPVwYZHldQXB5AA1gMUg9WEl4ZFxxWGxcZUU0BWFsIWwQPH0wMUQJCBVZeSQ4dBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEE0YfRApGEVsZSgFeRVYVT1heBFNWDkIJSgVdAlgCQgpKClkHRQVCD0kGQAZGWhVVFFwtXB5AA1gMUg9WEl4ZFxxWGwlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1780183794; x=1782775794; bh=1b6lgdmxVs/t738/nKDjx7z8lXVZaOUuLTcLxXseHWo=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=l5GkEIlD3IxxLYWF1Neu0Vs8pqU+rh+Uz0pCkcduuM6xBulWXPoZ1ZQnsyLGu44BTNZ/GbN6uHYJK1Q8bImjgz08vtlpNoaysCDTxO83CsQc9QRAl0P13Yw53CxmMMk4fPrSLzY6CieUddhp46JJpEYTphLmAzSxh+Yp9VkjESc6hyipTWsJKprCeeqYWCQKladA3d99qz2LiFZQQeEZnsXU3gdOo0W5hnfJudWbCRwDFZ1bqMBdKuauAQoldln2SiUtaGpTxPFjV9c3xjud4hWjx+F/Re+pUzMwR+49o+BTTK2lBB2e5zLngnc5mbjvq70fk0cB3YrjPyG+XSG/dA==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPSA id 2927F1800151;
	Sat, 30 May 2026 23:29:48 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: krishna.chomal108@gmail.com,
	emreleno@gmail.com,
	edip@medip.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH] platform/x86: hp-wmi: Add dual-channel PWM fan control for Victus S
Date: Sun, 31 May 2026 02:29:40 +0300
Message-ID: <20260530232940.72615-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ivJdZJdAwwgaHA9txM0ZyllqpADt-Xtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDI1NCBTYWx0ZWRfX3Hlxlny4CQQa
 8SQ4TDUa08sW9u12wGhVLq9dz3G8qi7EQAAnBqgo/eLU2ovSfJ3UQq4Z6c5oFAt9sV47xinRM3+
 w9H+5qq9kWsZYMvoBhtE7VqkfrF0GrAR+Kw82k4NwbxgyAbh2U1u9U63q3XSh1EZq4DUjMXGhsG
 6diYHyW1ksIrg36I3bk/bDq6IQi/3RLw4c/lLMS1a17Et16QRsoJdTPytqiMoAvFJ+mrzQaqKIW
 XhcE9OchDM8WJ0UN6AH6mNFfjjCH83sUbNmWjyWhtuyagBC7B60enujaMT/Z6kKsmKWN5qAbTNE
 4dzSF57Kf1W3mt6Oe5Rl8O3DiILPhYKHVHWhZLNcS1usdlvh0XKTsrb06/Z95o=
X-Authority-Info-Out: v=2.4 cv=E67AZKdl c=1 sm=1 tr=0 ts=6a1b72f1
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=3dEfZ47CvuegikGRCnQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ivJdZJdAwwgaHA9txM0ZyllqpADt-Xtn

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
 drivers/platform/x86/hp/hp-wmi.c | 50 +++++++++++++++-----------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f63bc00d9a9b..fdba21d883bd 100644
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
@@ -2518,7 +2511,10 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2532,10 +2528,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			 * When switching to manual mode, set fan speed to
 			 * current RPM values to ensure a smooth transition.
 			 */
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			rpm = hp_wmi_get_fan_speed_victus_s(CPU_FAN);
+			if (rpm < 0)
+				return rpm;
+			priv->cpu_pwm = rpm_to_pwm(rpm / 100, priv);
+			rpm = hp_wmi_get_fan_speed_victus_s(GPU_FAN);
 			if (rpm < 0)
 				return rpm;
-			priv->pwm = rpm_to_pwm(rpm / 100, priv);
+			priv->gpu_pwm = rpm_to_pwm(rpm / 100, priv);
 			priv->mode = PWM_MODE_MANUAL;
 			return hp_wmi_apply_fan_settings(priv);
 		case PWM_MODE_AUTO:
@@ -2551,7 +2551,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2592,7 +2592,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
-	int gpu_delta, i, num_entries, ret;
+	int i, num_entries, ret;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
@@ -2638,10 +2638,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

