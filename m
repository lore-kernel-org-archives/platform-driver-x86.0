Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A43BED01
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571948; cv=none; b=fw4+4QFNtZvdUvgAGuV94XYGdKoZXqIRyKxLXjP+fx+D0I+LOBOvKy+WmEYldoRuWyGuaQ6AF6xX3cnXlt90jrsUFmhBo2ZiEfBnZIrHGhbR+TIhCixl9DUiJLQp2h9xwrRPjmpTxH+mVHcdu6DR23hOcNs3JUqO1FvH0j1b+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571948; c=relaxed/simple;
	bh=oagBiGn9yap490aPu+qNXgOoV9AQzMDW831Ks4zUb1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/zEQRi81jK9/S9J3XmVGuLOskh/d4nkNWF9hGxHQkKpA9EhkvoGhpU/k6N9wTv/qxT4Mizxntbpt9pZ9Yb6cnSNSd6PNuUxLAEvtssvK+54BB6hEWv/NySt0kVqZapg9W517IWKwmxDIhq0y22tstu2bcaiWJEQXaMUvd7r+4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC7BsgYN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC7BsgYN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf7c58bb3so178457f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775571945; x=1776176745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuC322jDmAgsELlQ3uSNloCGDfnK1HdiuXq+p7r0feg=;
        b=lC7BsgYNcy4+JBJWiS0eBoyzoUctNxNl2xV+NfJdYwnbbsossStaA4yBr64c767fEO
         3AJeaHx61dZGAbmmab3gub+7PEiXpWDC5Ae53cBMK/60Ahq4WSi0Qz7Lx5/Kbp2iX2IX
         Z1idOF31vHYbkKwSVMDlg3/vB4DTQmP7e5V8n7sQi2Rz6ZLRz/5cbbdVcHAS5A8Ldu18
         ArHR7bw7ZPegsv6SGB2PiJxgsgvztq0+X1x0v9HjUwRJI1Gad8t1B/PNYYuJqO+emPZh
         YjwX+jHQ31VII6HgW5T06MFMZ5wPM2NORAIsS2PustKfEt0iSM+Y44O5I9Rwv89IFcOI
         ibKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571945; x=1776176745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XuC322jDmAgsELlQ3uSNloCGDfnK1HdiuXq+p7r0feg=;
        b=P6K/tDnY9lHJas4OXHHKVrMwWjn3lYRTCvo7LdzKXPgzm51L+F6gqxPuC7UTTxRDXU
         k9QrexL5ec1inGDGPOARg+dj5vNzwQJBQORI/cR+hLLibn1cqZH+5lemWzxF8pRU1Fd5
         6dOM4h4131KfV5ldncqf9LfryIqxdXTXysYIIvsZ9WfG+v7zTq2jjq3EnNNyk+QDGTsz
         5oMiMau4e9m6Vr+LVTEKCgcTpzgBIwaZebCdml0Vu5ERAc7b9lNoLYKcW7ji1tD4E0Fz
         T1A0SW19KgboUJfPyuozN3kEd3Lf5kHgqD3JB2cNOJWv8eXNWkL9KFUBmVE+eygSsaBx
         N0Qw==
X-Gm-Message-State: AOJu0YwG81ljIBP4G9JRz6kP6jZzRGHrzg1T+obul1imgGD61CYpHZVA
	PbqgDtYHHFMj1Jjz6dez7drFrI/CYvmcrLx4tyC1AB4tng/YnQ23joPpIqBTymlPe/c=
X-Gm-Gg: AeBDietyvDEb2oiTmfbVTV7h0dusk5NXmovplHlBEa4JmL+mWfmmtbYtNwQli7JXP1n
	7tlr/So0FRPcwIwCcJMm4UfC61yNahX1z1tv3cbipYWWko34wT+MQakzNHXvHR6MXGlJrZyktv7
	TcubedHmFGCH0BqiQD18K8uoaQegQJlEssEsv3VOV0iJKvrwiKJyUihrcdEUyE++c2kJBEDlmHf
	jyYLJIZmga3bi2krDtDByjZk3ZfXLKeU8bGxoFQr+oamn2x4Iog/Gm6YHrTnWgnxdNIQxHltY2+
	wyyz+dj8dxpTiJ3FtpFOiK6GSsbWx8GACScolDd3gRLVcKJXOyRhobtNVKZXP8Cb5/n9ftdxanT
	YKYVUDwO7bV3wEfNeo1NAxMqIEE9dwsmow6YGJld4CD+iad5GylfvazXHVgitxQ7YTkN0nK+cnV
	rQf/1Lou72HI2DVk4yQuo6Qi154KqVyL8xNEIC3p2D1tS4TwxOWe1Y25IXJ384kA==
X-Received: by 2002:a05:6000:645:b0:43d:284d:28c with SMTP id ffacd0b85a97d-43d292f53a6mr8996744f8f.7.1775571944791;
        Tue, 07 Apr 2026 07:25:44 -0700 (PDT)
Received: from localhost.localdomain ([31.7.38.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53489990f8f.32.2026.04.07.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:25:44 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v4 5/5] platform/x86: hp-wmi: add locking for concurrent hwmon access
Date: Tue,  7 Apr 2026 17:25:14 +0300
Message-ID: <20260407142515.20683-6-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407142515.20683-1-emreleno@gmail.com>
References: <20260407142515.20683-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_wmi_hwmon_priv.mode and .pwm are written by hp_wmi_hwmon_write() in
sysfs context and read by hp_wmi_hwmon_keep_alive_handler() in a
workqueue. A concurrent write and keep-alive expiry can observe an
inconsistent mode/pwm pair (e.g. mode=MANUAL with a stale pwm).

Add a mutex to hp_wmi_hwmon_priv protecting mode and pwm. Hold it in
hp_wmi_hwmon_write() across the field update and apply call, and in
hp_wmi_hwmon_keep_alive_handler() before calling apply.

In hp_wmi_hwmon_read(), only the pwm_enable path reads priv->mode; use
scoped_guard() there to avoid holding the lock across unrelated WMI
calls.

Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
Changes in v4:
- Use devm_mutex_init() and handle init errors.

 drivers/platform/x86/hp/hp-wmi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 4f49861d3fbe..470c6e48f8e9 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -453,6 +453,7 @@ enum pwm_modes {
 };

 struct hp_wmi_hwmon_priv {
+	struct mutex lock;	/* protects mode, pwm */
 	u8 min_rpm;
 	u8 max_rpm;
 	int gpu_delta;
@@ -2422,6 +2423,7 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 {
 	struct hp_wmi_hwmon_priv *priv;
 	int rpm, ret;
+	u8 mode;

 	priv = dev_get_drvdata(dev);
 	switch (type) {
@@ -2445,11 +2447,13 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2467,6 +2471,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	int rpm;

 	priv = dev_get_drvdata(dev);
+	guard(mutex)(&priv->lock);
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
@@ -2535,6 +2540,8 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)

 	dwork = to_delayed_work(work);
 	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
+
+	guard(mutex)(&priv->lock);
 	/*
 	 * Re-apply the current hwmon context settings.
 	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
@@ -2591,6 +2598,10 @@ static int hp_wmi_hwmon_init(void)
 	if (!priv)
 		return -ENOMEM;

+	ret = devm_mutex_init(dev, &priv->lock);
+	if (ret)
+		return ret;
+
 	ret = hp_wmi_setup_fan_settings(priv);
 	if (ret)
 		return ret;
--
2.53.0
