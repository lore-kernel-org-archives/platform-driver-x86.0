Received: from outbound.ms.icloud.com (ms-2001g-snip4-5.eps.apple.com [57.103.73.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6F314B8C
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780252134; cv=none; b=Ou+Pu41szEeGSxrH43Pp5JSQPvXNxowUeGfxgHTj969ZZEMKhboPsKMyPUub+Qx3KvI75+wxOotWLVARGJlRc+MQYMFBnAHXPYat/ehXzSTKv3ZZTLQaiBl929Ipf4hdjoU6eQNdy0T/423b9cDxeEd8CTxCOe13ZVzdZfRRiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780252134; c=relaxed/simple;
	bh=nN6IT2EXKBrG/4RXFGvIOCROkfSsNOMnYQAIoT+9eP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DXEQqJJ9MeuMfCmivVZGyUTJX+SRr3g2+E6JwOwY6ubMU5LwwARIYjfLYgjav3XcorCvi1sBiPTnB5ocERlDnjt2Ts9cz+K6HC/PTrpoRbIpnJgUYPjZLDLRHYa1AE6FE5kBD+2P+yC4K3SLRArmdX+UUFs0oQ8nPdCM52jBrZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=nWItzcT4; arc=none smtp.client-ip=57.103.73.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="nWItzcT4"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPS id 0FBBB180010A;
	Sun, 31 May 2026 18:28:49 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAFQwRfEhVdRVsIWwddMFINQR5WH1MSWAFfBBkPVwYZHldQXB5AA1gMUg9WEl4ZFxxWGxcZUU0BWFsIWwQPH0wMUQJCBVZeVAsdBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEE0YfRApGEVsZSgFeRVYVT1heBFNWDkIJSgVdAlgDQQFKC18CRQFIAEwKXRpaHxhcFF8CdwBHAkoZRwxVCkscUFZXCEFVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1780252132; x=1782844132; bh=LKCsvPBTyP+l5NM5qgW8rGR/FKqpzr0HNx5iWPTloyo=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=nWItzcT4VYZUToHvDaYNTKWuLsBP6VVukftEPj5D4cDz+q9B3g1kqc5SsYS4lMj3veuO8nqjr82UfcoHviMevJvm7+CsePzKFTMsIMl7rs6faenVzGMSenvsyl+TsHQ4DEWHnpjdc3SknQPTWxoY5l0D+1/KaRW7iLs+rJFGW0ew1Ho3NcDALtG/1Z90GxeBAAS9qjcGmyeyzLDIK6Hz/H8mlkHnj6rfDyuPdJGff8rt78p3YypE37CmS1pCIN8nfM1JrMKYVFJHxq6HjGy1UH42UMdgDaSpa3cqHMqVXKc+d+cV1hDApiEDaUlFXBBTnSgqZc1VQpehwAk9foVj4A==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPSA id 31B4718000AA;
	Sun, 31 May 2026 18:28:47 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: krishna.chomal108@gmail.com,
	emreleno@gmail.com,
	edip@medip.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v3] platform/x86: hp-wmi: Add dual-channel PWM fan control for Victus S
Date: Sun, 31 May 2026 21:28:25 +0300
Message-ID: <20260531182825.389490-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S0nAOIhp-T5Zv3ZPo640U4VyV3DzMQV9
X-Authority-Info-Out: v=2.4 cv=Yo0ChoYX c=1 sm=1 tr=0 ts=6a1c7de2
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=BEVdlvLVp2n_lOLozf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: S0nAOIhp-T5Zv3ZPo640U4VyV3DzMQV9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDIwMSBTYWx0ZWRfX9OyDXGh8WAz8
 4rXgKnKmxiGy1EyLPMR6BHBw18d4n8gjJlOeUCBZqU2ojnoTELjGGnJS3j+Yguhz2ENDNcLSAHg
 dwmDm4iylI2dXH8p/rcMc0EMVtxAJnkEbaMZx2LE8TLefEV8NmEgWo+PHNpp/R/f6o01klOCA2K
 waSFKvKroDCvVYO6st3Q9ll8S/e6Wp76qaN2lsIxf1KeSqEFGB0o0n0XNHxTCQMkaVY2/3R//GN
 VrIkseLZMptUG4KOS/o617kkrM7DqhLTd/a+qqUxMN899wJInk6WS8V3d04pFVbDZm8SqLFggwc
 O415SkE5bIUwXq7QHcJCIXuAXOyIgv0hdINBMZUufGvmXVlLaMast0UQbYK+3k=

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
Changes in v3:
- Addressed review feedback from Krishna Chomal:
  - Expanded ternary operators in hp_wmi_fan_speed_set to standard if-else blocks.
  - Replaced hardcoded channel numbers with CPU_FAN and GPU_FAN macros.

Changes in v2:
- Made RPM readings atomic during the transition to manual mode.
- Fixed a variable scoping issue in the pwm_input block.
---
---
 drivers/platform/x86/hp/hp-wmi.c | 60 +++++++++++++++++---------------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f63bc00d9a9b..cef0c4436bd0 100644
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
 
@@ -817,24 +817,20 @@ static int hp_wmi_fan_speed_max_set(int enabled)
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
@@ -851,7 +847,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
 
 static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
 {
-	return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
+	priv->cpu_pwm = HP_FAN_SPEED_AUTOMATIC;
+	priv->gpu_pwm = HP_FAN_SPEED_AUTOMATIC;
+	return hp_wmi_fan_speed_set(priv);
 }
 
 static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
@@ -2402,7 +2400,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	case PWM_MODE_MANUAL:
 		if (!is_victus_s_thermal_profile())
 			return -EOPNOTSUPP;
-		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
+		ret = hp_wmi_fan_speed_set(priv);
 		if (ret < 0)
 			return ret;
 		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
@@ -2502,13 +2500,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2518,7 +2517,10 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2532,10 +2534,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2551,7 +2557,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -2592,7 +2598,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
-	int gpu_delta, i, num_entries, ret;
+	int i, num_entries, ret;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
@@ -2638,10 +2644,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

