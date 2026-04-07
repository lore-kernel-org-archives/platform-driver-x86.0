Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31203A5450
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571940; cv=none; b=jMs4pFQeX4pnjJZkg79mYYJ7iyA8G70FA9ta7f7n/fv1XYYIgnpNcobpXCfX23StbhKuTcKTJGBh9n34ZZ5ji0oPk6nxB3r1oFpv6GaTaLFDQjj5ydZ3CLdPU74mF0S1gzlpHVML/tDUFVvCw892LTRLZqK9uok2eeAcI2c1OPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571940; c=relaxed/simple;
	bh=44Okvn52N6xqTGEytJH/Z5j9cTiQ194ocVa3p4+mz6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkq5tGXmVLHoCO7wSoydvmxOtucdYQla/Y2BqZeHkbwMZRqj3qQKk3gwvyNgN6CQ0NSKb6X4ODwG16ig1iz7dxl9VCDtyzn27inVHPFpnpU4WBBehD7U/AY3YRs9sGkrqjgrYHcRdF/11ZdSwf38PwMJ/3e5/eqLBsKviZhQ0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czu2Gu3R; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czu2Gu3R"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf7258875so313585f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775571937; x=1776176737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stAMSWyB4mZAS8H9YKj1ITgLlFTm/EJVMUZqWjHkvfo=;
        b=czu2Gu3R3ENoCfcYvOH1uAqTnD+XJXD/2+tReHe3xSprwR6g8W3xBOP/EvnhGeaQuL
         upeLoWyk1vkEnVa5JAeJ6D7grntN+kp+aafYxwFV0xuWrGQfeYBqqYwN4uyoYUz2rqil
         7InYHy+9QC5Va8AghJ6hqT0jFhQc8VMWmPBLS1Qu1JH6V0fXBtbWReAd1EfxlxHmzccE
         BhoVZCuTQex06B6ARhJfPKapUVm/fif/b1PjsvhtdXfhKkrJOA6gNmCv9Mz1DLoEtUVZ
         bRf+ShxnMNx8tN7iSTanF9up7wjmMvgaJO3Q9pKqyUarzxY51qguJNivRWUruLo8RK3m
         cXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571937; x=1776176737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stAMSWyB4mZAS8H9YKj1ITgLlFTm/EJVMUZqWjHkvfo=;
        b=hfVEmkoqvj4bk8xZSO4LleohDCm59T4pMFB3V0aqSKbEEIxHLX40twaqobVMyEDyvn
         x+WeKDRENdCyGEve4TUt1w0Nt0nxaj71QJj7jVnvClU27eOKoZsZMzH/sRoNRT1V3f6N
         nN76LkM330hy56DKJ+s39REtdcsy4MIYD3RIQFj2TPK6nLHbvASBGmHYA2LknDHxQK4W
         ovKCXmWL72mVj4+rSF9EGAMxi/H2qWScHaco63WckiBcS+38sUugukv+a/v0hXBqKx2R
         kmSYRR0eRiN7d/LgqXmampJdJPWKD3sPcdDyhKiOCTfLH5cg80E63t0b9Ef92ELeuzga
         DdEQ==
X-Gm-Message-State: AOJu0Yy97aCZtHtxzQ7ZN8sP/6ryaHurM5oC78v4/CkxBPkmF0dRWpfV
	qjciDdcBf+Um472bME2lnKEk3m0/jtRiOmImOIzX3QNjZwCwipvCCOahDIa/0054siCGkg==
X-Gm-Gg: AeBDiesd4+6uLvBFdPleO5weGxJ6mVoGT+15B9COBI/PKvOlgUPJSVoK4QTbfJDl0FL
	TMATU6v8nrTpbIFjuz2xCJiL1rNujFt/YbaN//Fq5uyOhn8se6jVmdsM6YmtOSFrvv96cgIFYtP
	NFDEedzSO4ijAG7diQt3eADjCedTSx/88dxX+iJiZv3cgDk4/RIujapwv7q5RuubuMrLb8s9A5m
	ynQ0ps2V75LuQt+eMwZkttrwpZz6XYO7JZP1VE+nV7zAZmwhrre/Mr+WNkm/iT1BQEBH9c0sZJd
	WpfLdRNdxymwakgm0y1InptukHdfQ9jnk34rWh7gFPrSUgzQ7qGJKUcC5RclPszNvE+0eSUEaBo
	PfERPP3wSB63SNMSnZt83pfbABG6Blq2IKNlh2ka/TnGfup/YFFAOSCKc3xBFmAaGKlOi0GIfZM
	7xgTZiMEXN0fFMeYzkItqIT/CVbgqWX1lF12y3bwxVmGZ2O0H8BLfiEkc6Z1Xa2A==
X-Received: by 2002:a05:6000:25e3:b0:439:c24b:ec13 with SMTP id ffacd0b85a97d-43d292f5563mr11046699f8f.7.1775571937114;
        Tue, 07 Apr 2026 07:25:37 -0700 (PDT)
Received: from localhost.localdomain ([31.7.38.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53489990f8f.32.2026.04.07.07.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:25:36 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v4 1/5] platform/x86: hp-wmi: fix ignored return values in fan settings
Date: Tue,  7 Apr 2026 17:25:10 +0300
Message-ID: <20260407142515.20683-2-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407142515.20683-1-emreleno@gmail.com>
References: <20260407142515.20683-1-emreleno@gmail.com>
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

