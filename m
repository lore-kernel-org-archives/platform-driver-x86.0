Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A23A16B9
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050991; cv=none; b=h8D/cngnsINyZDtdrNPgQYPlWb3CBH0VnoXSvbuEalOEo/+cGC0JO5xuxx+AOo02LztnE6dTDwqwaEuhxStEA/aN850Ps528qfolNIvTVw7QhLQyoYg3lZpp8S5Dpgbo1IbNowhRmgfdol2q6vyVhehHVqcF8cpi7ZRAfa8qszY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050991; c=relaxed/simple;
	bh=oLKGlkhw2FIIbPnQj7+BVbg/ng9EcldtKCH1eAUAjOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2BgMcJg4xzou2wjY4xTiU05kiAhEn82PmckHD/AV+iW71m4V6jG+w7z+ZKCNABFRiaNJWSWjQN4KR6kqG7RCiqLvibI5QZCP+oNXL1eYdwDv/D0Kf0UmpnunN6z6YrP7T/VbONmBWPmgxQ6TBJ5NWtfLZ7Ont7SpY9dEqRs2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnqQw7Rl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnqQw7Rl"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853a5ffc05so3645005e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050971; x=1774655771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHNkiyRvuF9AQ8guLO6hV3hpVtlWV/mWDZ+jV3RDgbg=;
        b=gnqQw7RlCkHfep/q0tlEo4epoADnRob3nUACRDSd7beNuRq78smRzVriWb16Cii7dz
         hmAkQKoxuIWxUjhMpLsWOiNAZB0kF6wDxbwym1U7y+v2R/I51XNBYfTQG4xnV9BsAqSA
         8s5EKWqcAg3oLNE0LNpVKDRnOpqaccg0kERpzBT3WSJ+5uTteUFFzxKxFOmlwt1B5+oy
         hbUoT3zWxXUeEH4dTaxF/3j1N4J9Gs0KmXzGQZFqM191Mu2RtwVnsC8qYa7639TdQn3Y
         H5pWCX1Bg5ytvDBvg8deKeAz4451UAU44yycHfx7HUH4GKyP+UhrvCKjkf2/D/yBuKAA
         8NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050971; x=1774655771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHNkiyRvuF9AQ8guLO6hV3hpVtlWV/mWDZ+jV3RDgbg=;
        b=F8IdpTkYJuqjN2R6SKGTNDXhzk1HxZjmVNhrD0H0ZOul5gTgnokCE6zrmNY/nynF32
         /il7eYLrVD94dQyV1s+ZUyKKW6KAesVG+lT/yR+ZbcYAKNjF/kjriJdIrfPs3XKHvjBy
         da351fDxsBbj/wPTyzmX9hTjEYiTTVKP4jUYgHb8NHbT7xL/JnbG++/PXdR4g8n9v9oq
         LknvQqya/A47IXdgxJ/iQLvrrFWD5+wzNtF5Izzij48Ar3kaRAQOXzO28/141L8sI0ar
         cgzvpiV+bXZDq0awEKy/EHhu28Iv6L2L/GfLT/WuXt6MFwATKMMqhGIQbWEvv+SI7eqY
         uE1g==
X-Gm-Message-State: AOJu0Yy+Ayg5LbGZtGUWYdbhkvm1smM/iSB4H+vRj9aSDp047tHhBRr4
	hpNHRFGAQy0qNFCUod0u8ix6iE+uOgz4ZkosLBnesVRCEwI/P487sdWclwukGLqGXUk=
X-Gm-Gg: ATEYQzy3SwuvYIjDUltLOYxAUnDs+NwZtUjw+ZAMq0UO6ENPzGWGzpxj9NQheCY1gQ/
	thDpFgmmhHPVuIXWVgb8DxK5WDUwpHC7cu/Hsj0b+xM7Q2jDTpda6uMrsMbfl5un3+R9lqnKSW2
	efH6cDgyqOpp1lwAVqMD6U3eWHnv82G0Dho8beZbVzerBLA4e92GRIk0WNCA4eMhgj8xSrVZmZT
	WKR2mx0cEPp3dCyJxUHlBA6kzCcXt608w7tKjmNzE2KFgusJHNRtpxZFspit1jEbRNhceWplhbS
	6V99mCxBSqn/1Op8vLskY+aHeoNwiLWw8Xi/6/t8DkehjOE6vCr7q++nBJUFmbZKrm8RAzj55ct
	5AEX1+ItaDZ4K2dVZLBZRAvpUOQVYvBIF8AbhDz/Q1LHwRfA7IDFtGJ80qGiOnu2He8jbPsMpIr
	mhFzusZjs4VVbcDi7VNbAB7y1WAa3ITbuyOSmRrbiWr/R2pQ==
X-Received: by 2002:a05:600c:630d:b0:485:385f:674d with SMTP id 5b1f17b1804b1-486ff0230d9mr45474065e9.8.1774050971412;
        Fri, 20 Mar 2026 16:56:11 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm9663418f8f.27.2026.03.20.16.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:56:11 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 3/5] platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
Date: Sat, 21 Mar 2026 02:55:55 +0300
Message-ID: <20260320235557.56298-4-emreleno@gmail.com>
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

The keep-alive mechanism re-applies fan settings every 90 seconds to
prevent the firmware from reverting to automatic mode after its 120 s
timeout. Fan settings are also applied immediately when the user writes
to the hwmon sysfs interface.

schedule_delayed_work() is a no-op when the work item is already
pending. If the user updates fan settings at T=85s, the keep-alive
still fires at T=90s (5 s after the update) instead of 90 s later.
This shortens the effective keep-alive window and may allow the
firmware timeout to expire between cycles.

Replace schedule_delayed_work() with mod_delayed_work() in both the
PWM_MODE_MAX and PWM_MODE_MANUAL cases. mod_delayed_work() resets the
delay to KEEP_ALIVE_DELAY_SECS from the time of each call, whether or
not the work is already pending, ensuring each user action and each
keep-alive expiry restarts the full 90 s window.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 41769c0861e5..a29f34588055 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2342,8 +2342,8 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		ret = hp_wmi_fan_speed_max_set(1);
 		if (ret < 0)
 			return ret;
-		schedule_delayed_work(&priv->keep_alive_dwork,
-				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
+		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
+				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
 		if (!is_victus_s_thermal_profile())
@@ -2351,8 +2351,8 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
 			return ret;
-		schedule_delayed_work(&priv->keep_alive_dwork,
-				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
+		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
+				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
 		if (is_victus_s_thermal_profile()) {
-- 
2.53.0

