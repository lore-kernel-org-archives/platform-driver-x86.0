Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9C37EFF9
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 19:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206442; cv=none; b=TbWC0F1+4uG9QnrCMg067wivYUAyPhSSLVH2iRUomVq70UfPqKoU8JflNiLnE2CGPUXUUfxKN5yO1cAXYRrxXmiOZZMbkPr1onZv1StgWGYORpkeDOt5u/EeZZ/yJjeGH/lx/IWxVSA//yyg/TcM74lXfGlLHys0fTzKw3J/HeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206442; c=relaxed/simple;
	bh=9RXmA3V8mcAT6ll5oI10EzAS5EXkafvVpG2jgW4lEGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FD0HHN81iNzjVYC2hLKL1Iv9Rsow1ZOyNN2UhRSlShPe9FNJiKNXnI3lrjaOQO79HpBNGqfDZwR/IRKI0Soiqi9oHahR1gt5mAK96ZhRiNkN/ew+RYkX3p1wAFykJNb8KUZDlmF/Az549cR4F5fiaCnofrWm++KrvOMbLP3kLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mT/oMSNm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mT/oMSNm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fca3245cso4969735e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774206439; x=1774811239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7L1ojh/JII8uIiYNtov3hn1GnFD4U/IU8c1ArxwoPI=;
        b=mT/oMSNmzlhVWnXUrhy3LvOpr9xhXX77TcilQ+9ccITRWBnFUrLgk861HJhQAVwJpD
         qkxyMj2vJVchykSRLlhSCbMRbHi92JIuapNhlZ89whktJWHr94Zc+Xl8Fwyj5NEkeLTS
         BWTjdWpavIS8ru5elYvKJoxRqVW4y3VXOKNee76aTi3g96h3l51Ta1GhCxaRQ638XpZz
         cpBxU55EZCoaFYpFY05sEsx0JkJMcqbj5/pWtzTA1ButGqddx3z7apc5e+gwd4JE6s0b
         YTXuHl8Am1hNBZUCJe9kiC+YrpMojddZYNEMqUFMXpuYrpqQarKZzgeMl8I6cyr2FiRY
         dF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774206439; x=1774811239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7L1ojh/JII8uIiYNtov3hn1GnFD4U/IU8c1ArxwoPI=;
        b=fT8jHrC3YRwi8U90BMI3e5NQIHu0QJY9ZuhLoUYJiKjhGJcdGzS4gLPZXua5r+j5xq
         vib6rlJWJxidoXs6U7Dt0nGiwa+O7atyWVnf5o5lqzeTWy82XuOPY0ZYyMCRI5iAgUFE
         KWIrz/mq3Tseerzlq5RpunDw/p3jfJD+gdycj7bbcy0R3RThK7zGoEfkVJtWhHMN2D8m
         /C0HR1r8Jp8CuCsQzjGEX2jPO1isOqNh43kbgDPuXtP504OFck57h9u9ZaQKsOGFsdBr
         sW9pcC+1XouV2cH0leB10twZURVMWCN/2MJ/WFvIYKX4LgR6sXL0p9ChPHYYyKFBhRRz
         LPdw==
X-Gm-Message-State: AOJu0Ywu1Kzea+mi8ooCpj/5lSFjgIVBdlTnIUlGPjDYBypraxwUgEXo
	hiEeuNbV1vVwD3xzGfimnASz4g33XWFivm2SuSvCbbnAc+P8xwKywTkaTjTeCGJnJR1Emg==
X-Gm-Gg: ATEYQzyzBj6GZ/ah4ZgmPT5l3YFj0jlYGMyK8ORbfdLbu47+37+BSlixdcsXcvlf4dk
	2rQDwL9+p10lAOX/bXuewL1BxjrFR69rOBsKEhWS2wuQRrmKt8ZXhybP4bPkB2yRJocMK4SS0Ke
	GY+Ksk0dnXh73yUaTauW9XD1B1wy1zfBLUAsVaNGGZU+FT4PLb9l3JtI4cRwoSLpQJz864BxWHp
	p6Sye9DfMEw6gk7bFzu+iWPqn9izzoR2tgfMQ1+IJ4/SVms7OCdEoFEJl0D5CEWA5j3ggZ1lgnU
	xXB5UbIYnWS+wa06/hH038X2RJHQKW31ZIMtiyc2WYn8GLMBnf80AsIxfqIXeuGYh0a7MjtHtUJ
	UCXZzdwBoy97gU3ojpL8v4m8kyGpgWGOj3X4wMNDssX/uV1STpSXb41bSOBD6k74eE2hei7uPkH
	l8jnutgVLP7CTJhDgLUXeL25Xa2Cd+/QnUP+QQ0NKyZDokrwGEiqWDd1pCMQzZB5xjZbB7WAn6B
	pLgSk724A==
X-Received: by 2002:a05:600c:4509:b0:486:b967:5c9b with SMTP id 5b1f17b1804b1-486fee1161bmr89737375e9.3.1774206438759;
        Sun, 22 Mar 2026 12:07:18 -0700 (PDT)
Received: from localhost.localdomain ([46.155.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe868cb1sm63340595e9.5.2026.03.22.12.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:07:18 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2 5/5] platform/x86: hp-wmi: add locking for concurrent hwmon access
Date: Sun, 22 Mar 2026 22:06:24 +0300
Message-ID: <20260322190624.35162-6-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322190624.35162-1-emreleno@gmail.com>
References: <20260322190624.35162-1-emreleno@gmail.com>
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
index af57cb0dbf9e..0947aaeabff3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -434,6 +434,7 @@ enum pwm_modes {
 };
 
 struct hp_wmi_hwmon_priv {
+	struct mutex lock;	/* protects mode, pwm */
 	u8 min_rpm;
 	u8 max_rpm;
 	int gpu_delta;
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
@@ -2573,6 +2580,8 @@ static int hp_wmi_hwmon_init(void)
 	if (!priv)
 		return -ENOMEM;
 
+	mutex_init(&priv->lock);
+
 	ret = hp_wmi_setup_fan_settings(priv);
 	if (ret)
 		return ret;
-- 
2.53.0

