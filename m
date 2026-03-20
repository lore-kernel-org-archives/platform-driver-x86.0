Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42C3F23B5
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050984; cv=none; b=ZZ+QPP8VMKHJh3eDkITUHKxEo3tGq3/jHNDaSMnEHecwb/uxurtNCNwfpmAEkYw+XDDpWJHdIxhCIdx0aNPEugYeEYiU9Ivp6OnOAIsPCx/cbyzB5AoucxgL2TJYRvuw3/AdNgM3T/J80yKK1CmDH8B64Y2/RVl8fLfcS7Zo7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050984; c=relaxed/simple;
	bh=a65n9qrxIlLmhNIbEN4ovVg4f46IUX7I1DiASQ8NWOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW7ZYmYl5w56fweoT92k0m67XN0aakTwwmQD64kex7V6VBIx8Fj7RQMj09/ksJIZ1Hm7eH1PQndRjPoSKWuQM8kK5c5c6pivo2q8xK6a8vh/vxIqUUhd3kcS3uRDhl+5HJ0tbWGD2ayqor/QVKqXsZ7EBeEmGnfXeb6hVFO9Z+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM4ZjzFS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM4ZjzFS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b3c2de941so117817f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050967; x=1774655767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9+vTI8xL38TJIAAcKMuD2MJ4WOoS3U7UcRhiuvjKaM=;
        b=mM4ZjzFS5MA8vPT1ZcrWfeRqQKK+vbWd/VTn2dkGdGlL0LDaGc0Qf1dZyzwyNObyB5
         VoxaJIB3//MhQwdd5ouacVZBbMJJz13iwNKvvEnV5f/aCrQ4a2p65v3fgya/iXE59TNP
         nhvV2yf9D+5NtXapvKXIpM+0wHaG4zYHl7t4giWsYmqF+p+KiOdpOeHhIKFJqtfJorNX
         0s/7nRuMMgp3beR/zH1WcZMtZYitoqi8mFph6dgcUV7MwIyBZYtEw8pfBkp2KPII1e+U
         T5A11z0WaF4ahwFXwds7o40OXHpOC+eU3atIfmfGNiv6lJjz24oCd2gEG6vBXMAxpe13
         jHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050967; x=1774655767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9+vTI8xL38TJIAAcKMuD2MJ4WOoS3U7UcRhiuvjKaM=;
        b=fzJaNROAMppS3QtNC4IgLeATKdqRb7wvkp9usFNPrgnvxFN7Olzx6+vQXao22y93H0
         29ZD8Yh609iOob/vbpALIp9D12x0zicqLdkdBzIlAvkGBNmqljwtxxLT0qqj5ZxGex7B
         MJwjp8PWMKJf7PiV8CwrBrbromp/e+cSq+bhGSJgyRLbxElTMyqF3jZOKT4PMXY6BT1T
         hXoks27yx+L7AMS5PrhixSYhdS8hkv9Lhk3DGXi6BqpOgRItaMZrG63zAph0lrMhrvYl
         TQ4cBCzcT0gUfM7xsZxkNeYKSctQkqVRjA/bRj3nyCuTHTYgl8BCSqTg4hPD3yPZ44pp
         h+zQ==
X-Gm-Message-State: AOJu0YzBhafQVoEHvN9FgscQUKAbmS6OapwOBRBW1lRE+yo1sAIE4iAX
	YqOykpJ2HYt6rK+pPwq8c7OCXc1m+fjY2eO0PSf/wU4U7mkoawpRVVNT12aiyAKvih4=
X-Gm-Gg: ATEYQzyu4r/iO/HZtao+XoONNyOJhUBDXcC9lT5iXjUO49kiWQ9p5fdZjBB9t1dlBtW
	URSpofhiOsNVDlfcT7Ngif5UAxm/+AJi60QWQEadFIoTq7/wwXN/NYJU3pO77+9u/Og7JqcapcJ
	oRI/gaFvLe5PFHkA07565fKunF1ajMY4hkm1nVFnv+YpOPmPiW4Cmy8zLxIh354OXEBTTvAnnGK
	csi1zCE6G3cl/u+Owg5zFwGiL1Wiz8ngDDs5xuPbOX00uOPQy/1160hdA5E0lrGrvEABvgsQcfg
	4Bm24FwJMubaaZVOWvvkXn9G83HdkyJW5lbxZXkdx0qSYOU7FeLPygTqc3W0oaUbPPfBYx912Mk
	sawOnVnh1xSeJnpHmiyf6qXR+QZ31Drj9Pu1AZ5KcDUiqsP4/9ZBW+pGqlmg3fzDLkZXD/pFLgn
	mLNgj//K5XKnkqx7PsFO6MJoIL87M3NiksEeJ85DF9Rw6IYjGXsaTEzquT
X-Received: by 2002:a05:6000:43c5:10b0:43b:433f:4898 with SMTP id ffacd0b85a97d-43b642331fbmr3187205f8f.1.1774050967301;
        Fri, 20 Mar 2026 16:56:07 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm9663418f8f.27.2026.03.20.16.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:56:06 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 1/5] platform/x86: hp-wmi: fix ignored return values in fan settings
Date: Sat, 21 Mar 2026 02:55:53 +0300
Message-ID: <20260320235557.56298-2-emreleno@gmail.com>
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

hp_wmi_get_fan_count_userdefine_trigger() can fail, but its return
value was silently discarded in the PWM_MODE_MAX and PWM_MODE_AUTO
cases of hp_wmi_apply_fan_settings(). The same function's return value
is already checked in hp_wmi_fan_speed_set(). Propagate errors
consistently.

hp_wmi_apply_fan_settings() itself returned an error code in all
paths, but its callers hp_wmi_hwmon_keep_alive_handler() and
hp_wmi_hwmon_init() both discarded the return value. Log failures via
pr_warn_ratelimited() in the keep-alive handler (rate-limited because
it fires every 90 seconds) and dev_warn() in init (non-fatal: the
hwmon device is already registered).

Also remove the unreachable "return 0" after the switch statement in
hp_wmi_apply_fan_settings(): every case branch already returns
explicitly.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 68ede7e5757a..0cb2a2b31998 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2334,8 +2334,11 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
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
@@ -2353,7 +2356,9 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
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
@@ -2366,8 +2371,6 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		/* shouldn't happen */
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static umode_t hp_wmi_hwmon_is_visible(const void *data,
@@ -2509,6 +2512,7 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 {
 	struct delayed_work *dwork;
 	struct hp_wmi_hwmon_priv *priv;
+	int ret;
 
 	dwork = to_delayed_work(work);
 	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
@@ -2516,7 +2520,10 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
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
@@ -2578,7 +2585,9 @@ static int hp_wmi_hwmon_init(void)
 
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

