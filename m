Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BC6257851
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400317; cv=none; b=dyqIooySS3jugLj7ghY/qJjRgPCZo9nHZbQ8+KIyEOBvGoIXeiFNEp034mgwqlya1Xj97QemikxTDiwuEmDSGi5JM7FF+EfChluhrBB80pKh86fkcQdbsen32YWzABp0CW//HNxhSPBAG8swH9wEMA0gv5Wtr8Yi6cYRYDlHVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400317; c=relaxed/simple;
	bh=44Okvn52N6xqTGEytJH/Z5j9cTiQ194ocVa3p4+mz6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbdnnBo4T86/JQFr/zjbFmXe+SJEIwVDR02cf1SP95Ngmubw5IkDg2gUuqZ8NyotxF2icmckpLnGnzUNUGFs/5Hz/GV5VSBWlL+AoFyKQzRUdyMHw0RDgQR7s8kLXqLX5lS9D4T6pxDpGYjMxr/j/2mr8A7evM1JMyk8vIT6asA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJH55jzW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJH55jzW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b2260ff0so41365e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400314; x=1776005114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stAMSWyB4mZAS8H9YKj1ITgLlFTm/EJVMUZqWjHkvfo=;
        b=LJH55jzWfzBvquZInislSJH0UIqq++kNB9MUbdytZy0BladaiuoM0N0T1Oo9T51Aeb
         EX3328wO0sNdtoEnOx+ejM5tAB3HZI3ZRXxgMTyXJtI0JZlVO574WC4tZOfgNgMacqeh
         PgDZ2qipo1BW1tXu4ywUA1Za7JrZY8Bt7n6liKvE+BCUN6/irCZKDPmQwjg7jJvnhP21
         WbTYIyPRA3BjhmFi0U9vXhopAdHjgzoVm5BSRMLkdLLey72IqALx37Lhe4jBqoVktrdR
         mzZlMXTFm9p4nQWElSxk1xfZ2uNgwC4RZynx/LDEfRLTG5JmdmBnhEAPw8A9kcp4g02v
         Z58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400314; x=1776005114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stAMSWyB4mZAS8H9YKj1ITgLlFTm/EJVMUZqWjHkvfo=;
        b=gsIAYIn1RT5G9jG2s+3LtFosdQiBDUT66j8mBgXA9xoZbJhJF0SaTvu3x250x/IOm6
         gcudVQrxKegdc+aRgQRR2Pb1ew+Y4cb/1nB/yhe+kmDfNN1fjZF67oFjPVExGRKULFwH
         4hA68RlCJogrTdcovN+tQaxTLd4vdWW5GoygL5cTTn7L1UjdIZRzgEBi99pHBF1tA2Sl
         ULxFaCKejjTMl73XVnz3p59OcJwN6uOSBP9fjBwlCdSbaVMF6Bpu2SQnHUSnFw0TQ8Eg
         gBnyOwjhVO+katwcQr1nhNrVGXZ+8Hnf0BkKDVpO+07pLhhBgyi1dZx4r6aSVsV3D5KD
         2drA==
X-Gm-Message-State: AOJu0Yysc39AY2sil7A4TEgEjIYQojjJXWvHSE9KIrLlciG8E6dSZvX4
	z0Sd8lG1ZD1NZtGRBgtHcQccn6a9pcz6IxdK6tggWIDFHkUMCwH1jHUBu8j+DyX06p0CUw==
X-Gm-Gg: AeBDieuQZDywNeiKoDs3EOAv+8GQ69BH0HcWY18wQO/PDShpfRQJn29W53Tvium9gJQ
	qhkeAxNi4y7rf5Neb77yAk2fcMpkNNyzeZvozHwVJ+viyWerTbp+i8CPzetNaNKl9XNe7wqzOBm
	/x0mzYu1VZNB9DpnuPBY+45jF+w3tYtIV7tivG8u0rhnul22In1IGZ4RxhBFT1YBkTfSeNaWj5F
	jdW4cDXUCymBHwhKZnlIqUTAq+zEDbFUgDF93GnUYmPz7rAZHJov6OorvytQKE7EcWLYxGPBg7A
	L1XAx1FSzjWPOc8CpyOjqC1swEB/ZVY5iJTf824rEUaStQEqnqYxKhFSr8CEDvfTmtJsiXW2qRq
	yDpMWAU34VkMB9pIZpPc/p+YH/cSkeI4JOx5uOcX89aUznhYsL5NK7tLHJey7jVQetBuutOhEpE
	g4IktjRD7Q0zSKd7OgZKPVR3L7l7xJcq5m3pgMP4dMk97RjEX9rXULZ0wYOTI=
X-Received: by 2002:a05:600c:1f8f:b0:485:f1d6:2b1d with SMTP id 5b1f17b1804b1-488995d1535mr75603005e9.0.1775400313974;
        Sun, 05 Apr 2026 07:45:13 -0700 (PDT)
Received: from fridge.local ([2a00:1d35:c836:5700:77d9:f36f:3748:d642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm35698799f8f.32.2026.04.05.07.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:45:13 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v3 1/5] platform/x86: hp-wmi: fix ignored return values in fan settings
Date: Sun,  5 Apr 2026 17:44:56 +0300
Message-ID: <20260405144502.24944-2-emreleno@gmail.com>
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

hp_wmi_get_fan_count_userdefine_trigger() can fail, but its return
value was silently ignored in hp_wmi_apply_fan_settings() for
PWM_MODE_MAX/AUTO. Propagate these errors consistently.

Additionally, handle the return value of hp_wmi_apply_fan_settings()
in its callers by adding appropriate warnings on failure, and remove an
unreachable "return 0" at the end of the function.

Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Victus S models")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 988a0acc9622..eac39f68d762 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2353,8 +2353,11 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile())
-			hp_wmi_get_fan_count_userdefine_trigger();
+		if (is_victus_s_thermal_profile()) {
+			ret = hp_wmi_get_fan_count_userdefine_trigger();
+			if (ret < 0)
+				return ret;
+		}
 		ret = hp_wmi_fan_speed_max_set(1);
 		if (ret < 0)
 			return ret;
@@ -2372,7 +2375,9 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		return 0;
 	case PWM_MODE_AUTO:
 		if (is_victus_s_thermal_profile()) {
-			hp_wmi_get_fan_count_userdefine_trigger();
+			ret = hp_wmi_get_fan_count_userdefine_trigger();
+			if (ret < 0)
+				return ret;
 			ret = hp_wmi_fan_speed_max_reset(priv);
 		} else {
 			ret = hp_wmi_fan_speed_max_set(0);
@@ -2385,8 +2390,6 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		/* shouldn't happen */
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static umode_t hp_wmi_hwmon_is_visible(const void *data,
@@ -2528,6 +2531,7 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 {
 	struct delayed_work *dwork;
 	struct hp_wmi_hwmon_priv *priv;
+	int ret;
 
 	dwork = to_delayed_work(work);
 	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
@@ -2535,7 +2539,10 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 	 * Re-apply the current hwmon context settings.
 	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
 	 */
-	hp_wmi_apply_fan_settings(priv);
+	ret = hp_wmi_apply_fan_settings(priv);
+	if (ret)
+		pr_warn_ratelimited("keep-alive failed to refresh fan settings: %d\n",
+				    ret);
 }
 
 static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
@@ -2597,7 +2604,9 @@ static int hp_wmi_hwmon_init(void)
 
 	INIT_DELAYED_WORK(&priv->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
 	platform_set_drvdata(hp_wmi_platform_dev, priv);
-	hp_wmi_apply_fan_settings(priv);
+	ret = hp_wmi_apply_fan_settings(priv);
+	if (ret)
+		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
 
 	return 0;
 }
-- 
2.53.0

