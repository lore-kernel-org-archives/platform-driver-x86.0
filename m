Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B1C1EA84
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400324; cv=none; b=V12ZSesOlu62gYGn6+KrSKRJ3hLZaDC7mL4x9Qt8E4jpEL7ufhToaE7HiFrg7Vr0vxQBpIANyJ8lempSyiy3ZUSntAP97Gx6ZX69+7SdQRhoOiQFcH/BfFMpXw8Fwgo9XBld/+MJBGKJs3Cn+EiLOqV9FcbcVTayiImsALFMd90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400324; c=relaxed/simple;
	bh=iw6oCMMoh6LCJVfNJArbuy/OF13vutR+b+pJP5DPEhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dq4BzL89VuMAl/BKeUTgwSMxENZNPPSHcNHdQmonjQrGrq1CbTYkC/UPnQdw4D0dYdHzycWCEeUn60W8qFgRFmFvZf2p73vK1uDJ2X2O8txPKTvFsyDLbyGbOqt60yX1leGPpABzJ5b8ar2d3sMjz/Pfd7HT54HCeAwZE9JCkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPlolnwP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPlolnwP"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b9974ac31so430166f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 07:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400321; x=1776005121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XlY1tHjRVA8K5Aytp5TG9QNprv6BjZAraUQpx4lOx8=;
        b=fPlolnwPL8+QBP+hu3M4FVex0xATAow/xW8AZnYzgf76eFA0S7fSCm6w4zeCPre+dD
         ITbqb4wdCUR6gvZYSGSXPC0SsFDRyd3o3omOUF1JUVHsmbEaL692h6IODZzczH7+N0cp
         asl/OH46DyehaubCcyeN6NGhmHNhGpR0TEwFNLEKGOlZ6j+PT/51NGW2sJlVyaLrtB4D
         oO7xpd1fSojn28E7i3Ajw1w2XObWgBElcUywNiY1mnIvwv4xeSUqekHNGg067P4CkrUU
         lvV4blKMpoB+/YmhqopcUf2eCZ/70tIxI+ZG1PuSwKYm00pe+H+zvfECtqfg6SkeLXzJ
         IMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400321; x=1776005121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XlY1tHjRVA8K5Aytp5TG9QNprv6BjZAraUQpx4lOx8=;
        b=L0IOlZa2wmZmxmaikWfpZ76qc+unLTQhy0ORt2Wse8yboJYZx+zJ9pMaNoipZAr8a5
         T/Yc7I1Gmr39SiOdMPX4QylbjGYJ2pzQPk5ROy5n2Wa//omculGGGtgT8pJtcNsYiLO3
         NSyDD+ZMWHW9pZ9egjK1zgQncszlnVJcXST9ouZjoUH0HghSzEIWIICpoIIK01kMvAyp
         Nq8MoKo4fnRM1N8CmGQvy+HEMfZMQNFq+07Jcplc+1wT84dILU+Lz3xpvOoQTyhP9D9T
         UFsYDA1aXcN3QfgkOHS9XM6p0bEGW5yjG6kiAjEkGGPaKc+aK/PK0jokk6qBhkx8xWqN
         Kysg==
X-Gm-Message-State: AOJu0Yxr0fol7cqCs1O8H62wr76GaE9ac2eNnJbjWJlu/rJo52mQRTqt
	TLgDYt1AcxREk1aBXDM4foyykTOL9AoELHwJARA5/cfOQlW7DbO0KdI2p2fQMoMtLSQ3sA==
X-Gm-Gg: AeBDievG+Vl/0axtSgNKALh3Q60ZVaMVTDdjcpRqVxsg+5K2sN+AL02h0rKcqks7DWv
	79xuuB52wGtUxQlRa4bGkkK/GP84h/roKD1PK1fO29PXzdeQXGkBvhvY7sTlQhGOYLXv7XHdg6/
	ThA1mQ8GvKv/dmyuqmvjxllx1+kXEuC4FQ5oIGKqaYNw7v8ok+tKTQgEds9/C+VmP3Iy3RC+iKk
	7bvEeqBuT26O8IQdFK5DFMTQNC43WzXiNmtvz6SkKjfPo4XQRiVm1XegdVJIE3OP0+iRDwk+SJu
	MxTvNlGbv5Ny4EINjvGeZ5z7yKp5xLEwzVFWxMe1S/bXPlaczpz3DxRqm1V86Dz42m5UQjL87Uf
	2aJuEEYwW34uYIDymYN7JeYU2ESNqtoSgKhLdEW9aaMriTJby8etaeEv1vmngLoOGTbpDLPWJEZ
	/TlLAZj2idemGBa59ibk0r1Cz1pAKdpi66m3JRlmZ6w+dzXWOsp2lzwMMbPDU=
X-Received: by 2002:a05:6000:25ee:b0:43c:fd0b:c5c5 with SMTP id ffacd0b85a97d-43d292e12bamr5915140f8f.6.1775400321157;
        Sun, 05 Apr 2026 07:45:21 -0700 (PDT)
Received: from fridge.local ([2a00:1d35:c836:5700:77d9:f36f:3748:d642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm35698799f8f.32.2026.04.05.07.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:45:20 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v3 5/5] platform/x86: hp-wmi: add locking for concurrent hwmon access
Date: Sun,  5 Apr 2026 17:45:00 +0300
Message-ID: <20260405144502.24944-6-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405144502.24944-1-emreleno@gmail.com>
References: <20260405144502.24944-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index db72ad9da0a5..1096fb46cbcd 100644
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
@@ -2592,6 +2599,8 @@ static int hp_wmi_hwmon_init(void)
 	if (!priv)
 		return -ENOMEM;
 
+	mutex_init(&priv->lock);
+
 	ret = hp_wmi_setup_fan_settings(priv);
 	if (ret)
 		return ret;
-- 
2.53.0

