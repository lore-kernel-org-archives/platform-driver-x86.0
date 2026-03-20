Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3B39DBEE
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050995; cv=none; b=PEtAx4A5qyfpKyop5lAVLW0gSwrnD/C+4qfgbbqDoFBShyoDyxqztjl5VRQzPTJoPy5xnrdUkwaaCV2RRsr2QKL6+t3z4vO9EkvzxYsSPWfp1FcqAWAP/jfwXvHztMHN8Q1iCh4hSGrz9Zw0kRkH1TiJ0G2Yg2vc5uPgqRyElSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050995; c=relaxed/simple;
	bh=N0+TgX/rArUJD3hQne/JBBia//Bzgxpbz+kEB8NVbI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSXqZIyiq3S3trwP8KQQbgIbVb1n4JWTuGLkerZKWNHINaj8x7+tEH3YK8XX6TOxAdPD139NBc/VO2NI/ZHUoBFH3Z96l5IDKL5bgzrBEOGNKkiuNqIErOA7HFsqAOa/NjGUfaT/xeVTfulfOdxY9TkBfODicoJTRTk08dZJpj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUBo22s9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUBo22s9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853a5ffc05so3645045e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050975; x=1774655775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6i2pacmWXPZlRin0kPUg4dFhoX7+Br8EHyM4nKfejw=;
        b=YUBo22s9/oD8QZW30GhoYL2fPf2QOCjwQIAelykHHlcCagNOVK28rz/cXSJW0JLh/u
         F0LEZ3atZYIUcX8MMEcFS2v6w9aVVQeVHvmJ+LqciA5JmQNFFW4LsZX2piy7A9ZevqXJ
         y3mTErVXP9AHJOmKbCEPnbDpHyp+elVFqetfe/h+7EMEp0w9Dl3pYHJGYXBepWmMx4lQ
         qQlhHiv/R1KHI70YQUbd5LFlTRDMuLbkuvEymPshl5vops6e/y8sKntmVzspMs5+tQh/
         pGL/BiU8tZ/zsl++djh9luk4qCCoDV+9oYzZjOMbjt/tt7cxs2HVL8XRPjLTRvcKic+r
         gl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050975; x=1774655775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6i2pacmWXPZlRin0kPUg4dFhoX7+Br8EHyM4nKfejw=;
        b=IUvfTUQLA0ERV5immJ7RXcMTXlwsrCKccgDyOeyNGmivob8yq+jJRZy3QYe9ObKn6D
         yhasMYk1gPpHvHQdwlhi1tdWDDCvo46WdfvrveFudQ042lNH6Ez8H48tmESAeuDY5kpi
         d2VKWLW+fB0Slzt44yBdi4BZ6Qf9a4BSpQDJmDepSEvaKAZLzIOhedNI2rO+g6Xf/LBH
         8F5MPZoA4UbZeJsPtKe1ydCx71Uf7sY27CEjlzwcKdfZKaeTEJbou5zNzbdcl86cqyWG
         8gGvXRDSti4dHm3rX+ZS8laZrxzXVVpaoj/QqIjWeUiXX0aKI3M12NOmUe8knkglLbD0
         Dgzg==
X-Gm-Message-State: AOJu0YwGLwwt8aTNr7EcECtX72TXtWdSFg/B4N4fS45JHtpC5hlcwbss
	9M3DKEiBFYlII1Y6c9iq2VapC/36dyp0sskgm0UhyklWO8sgdZmcVz4YhnGvCYEBelY=
X-Gm-Gg: ATEYQzx/UOx4lMiCI9LGFZtT3hyEEqFg5h40Kt8mBS0G6CYVU1jKrLENzd97YsVQFKU
	62x3nQjgJqcr0pcT9zsOfbDBdXLk0EWkPpXhvE3Xcr0T6DGOHl7pKFYi8iLzkOEJWMuPtl/YcyN
	07/oWvDkdrXIRvwKOqdATWpongh0kNmmyxfj9C/H/E7kl66i0/rXXRESrNQQ7NeeXvuj0jGshEQ
	gyiPVllq/iKV9C5qFwSJXVEnOqXsu1F7ZnWvHEIdu6URHj3vW8Z0Mo2j+2rIvaTI6nAAXt6Nh4G
	01zad/Kcy86f6CaWbQQt+0iPgyKYpYYcgnpDIaB+EA7nTr3gL5BmLOD/82hwVxa/1kf7tfxnWiB
	d40kSA/zZXRiZzbMoqYcyG3ruEYOYWDF/jJCi6mEmKeoizf2gc/kYaH/1faZZy5q9whxFOf69FV
	gUMn3xJv6QVYkAIeFX93DCY3URmgD+O3Da27PoM6UAmLTTyw==
X-Received: by 2002:a05:600c:1f0e:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-486fee2dcfdmr39588675e9.7.1774050974792;
        Fri, 20 Mar 2026 16:56:14 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm9663418f8f.27.2026.03.20.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:56:14 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 5/5] platform/x86: hp-wmi: add locking for concurrent hwmon access
Date: Sat, 21 Mar 2026 02:55:57 +0300
Message-ID: <20260320235557.56298-6-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320235557.56298-1-emreleno@gmail.com>
References: <20260320235557.56298-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_hwmon_priv.mode and .pwm are written by hp_wmi_hwmon_write()
in sysfs context and read by hp_wmi_hwmon_keep_alive_handler() running
in a workqueue. There is no synchronisation between them, so a
concurrent sysfs write and keep-alive expiry can observe an
inconsistent combination of mode and pwm (e.g. mode=MANUAL with an
stale pwm value from the previous mode).

Add a mutex to hp_wmi_hwmon_priv that protects mode and pwm. Acquire
it in hp_wmi_hwmon_write() for the full write operation (field update
plus hp_wmi_apply_fan_settings() call), and in
hp_wmi_hwmon_keep_alive_handler() before calling
hp_wmi_apply_fan_settings().

In hp_wmi_hwmon_read(), only the pwm_enable attribute reads priv->mode
and requires the lock. Use scoped_guard() to hold the mutex only for
the mode read, avoiding holding it across unrelated WMI hardware calls.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b8f22d70e996..cfb207f09e7b 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -434,6 +434,7 @@ enum pwm_modes {
 };
 
 struct hp_wmi_hwmon_priv {
+	struct mutex lock;	/* protects mode, pwm */
 	u8 min_rpm;
 	u8 max_rpm;
 	u8 gpu_delta;
@@ -2403,6 +2404,7 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct hp_wmi_hwmon_priv *priv;
 	int rpm, ret;
+	u8 mode;
 
 	priv = dev_get_drvdata(dev);
 	switch (type) {
@@ -2426,11 +2428,13 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = rpm_to_pwm(rpm / 100, priv);
 			return 0;
 		}
-		switch (priv->mode) {
+		scoped_guard(mutex, &priv->lock)
+			mode = priv->mode;
+		switch (mode) {
 		case PWM_MODE_MAX:
 		case PWM_MODE_MANUAL:
 		case PWM_MODE_AUTO:
-			*val = priv->mode;
+			*val = mode;
 			return 0;
 		default:
 			/* shouldn't happen */
@@ -2448,6 +2452,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	int rpm;
 
 	priv = dev_get_drvdata(dev);
+	guard(mutex)(&priv->lock);
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
@@ -2516,6 +2521,8 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 
 	dwork = to_delayed_work(work);
 	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
+
+	guard(mutex)(&priv->lock);
 	/*
 	 * Re-apply the current hwmon context settings.
 	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
@@ -2577,6 +2584,8 @@ static int hp_wmi_hwmon_init(void)
 	if (!priv)
 		return -ENOMEM;
 
+	mutex_init(&priv->lock);
+
 	ret = hp_wmi_setup_fan_settings(priv);
 	if (ret)
 		return ret;
-- 
2.53.0

