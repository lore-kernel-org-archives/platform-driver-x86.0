Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB8D37DEB5
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206438; cv=none; b=KyqHos+Xw4plgZTBQ6D/PIWV2LKWumfckYMbpkHNDblby7Y2pw4+iyc5/hIgrnaPSzxrr7tE34/3MY2RTyA5MgH7F9UAwZFBsWFZe/lM+BvaxPz1UxYkLkBGWDytssRRS6h18x21b8L5sEpc1M3cADazHM1yf4CpKr1ANj1Ckss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206438; c=relaxed/simple;
	bh=oLKGlkhw2FIIbPnQj7+BVbg/ng9EcldtKCH1eAUAjOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6/C0dkop+1t/f0ZYByURKwqChJNC/SZ6Es3+twX3UEfgmN/2W51nVlws4JokwqWhhffMpGE69Z1AUsSqwvqbbGH111MwM/GHyJp8hMRUnWg7XnL9GaO64GlNaLaM9BnLyqHWXTSAmDvw62mrapMaAWiT0tzbt6YhUtIkIGz+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V12enzfM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V12enzfM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-485358f43e7so4460255e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774206435; x=1774811235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHNkiyRvuF9AQ8guLO6hV3hpVtlWV/mWDZ+jV3RDgbg=;
        b=V12enzfMJeUCA8PbnLb/J04GReoi223CpNFVd8PYSp827w4r3XYVqOPcb+drrGAhbY
         15fBceS/prwIkCdM8O+m+bWGlN0IcJBf1AfT79FBOY96EgylEZ9TaGWVmlgneIVTqYhe
         ksG6+VsxuNpY0i/S1R9LyK6pewoo7aeWRL6lX9YnDuYB+UEr9WeAMXpjNZGjli3N5r0r
         2XMXPHUXCg55YDWnc9jO4kl592IO+iaztMFP1clHqogkY60rfHoVpNTVndsQ14JMqp4I
         M2MWEDufquzB5zz7+hWsiXvWk6mZiknHUQ5m0GEUxNZyOhuVvvklMTegH/vHxtmCYCJF
         eAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774206435; x=1774811235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yHNkiyRvuF9AQ8guLO6hV3hpVtlWV/mWDZ+jV3RDgbg=;
        b=cWNamlVdDlob/JwVm8oHrWaI70Ecsj/0PKdQ42646hU3mnEkoun/4l/VanunD1h0MA
         CYETFpixPj8LfPN085/GmVw7nZSYZJ9USCL0i/qo9oytxoSNrj5pkbEcZYBpPdhPaCi0
         B5kCk4hLb0qm2zK9vriZ9tX3R0/FeMK7dMMGzrPMSTmpFQYPyInvz0CF3SQOeV6CXX3q
         1OJSplHzMI1iq/fYt8UsjvL1Uwm6ZQvXJbtFyRTmvyxf5C1QF0zBxvb13Hop4KEtcGW4
         eEoThjWi7r8jGnW/idgt/irg3rwly8YFj8spqK60B/S5FB2kewlxMHq2WwHTsGiSHRFv
         ivVw==
X-Gm-Message-State: AOJu0YxbDR/C4shwmZR/lYg6ptSMqdLIRr76IeI9mqRffBTxJYyOtlWf
	32hzqZEQo9r6tvXBzUU17mRf55VVqZ7cqzrPQ9b1sGOWjoUNKKJlKOBZaJseHkTpG1LvRQ==
X-Gm-Gg: ATEYQzwA1UZGB9M6V5+GSD6XXhVPi8AsurNnSu684D68OCvMI3xSM2K75fIq/PohEMx
	5PgnFsEojJMvg56LDFTFTBtVJ60ImqepyywjYglfFLWyVqydFwT6AGJPBaEYabKNWyRMeFBoNqq
	l/9YjcGk1Tvu/IOInfrxP5uMS27dZu0LGhBsQB6EMIyYUIpVIFXHSSBe1Pu4RXWrgrXbgdhkc/0
	ASRW/h94s603+61d4eL5eOy+gUlEKxZll499n5y89CuZdBLxP130tIckuJTP6OmUC7TPuOUiKJQ
	FEbBsJy67QHC0+EUt9s/Zi5mVnYlOF9hhzwLZ7EvmuBQ6U/xJOeV2REKCtU5b7o4hSizTgZ1enc
	797rG5eHkM3GvMud1Bd10Y/r2Af1lgsY3dRKb2m/DwuJpK+rOCJqfIb4VT+tgJv81jQcWcuAZOD
	uvjmr3DaYg5olLe0L1ppy/jh7E8G5YsiMf9xteJoF7iuUXGoCLsc+1eF2/TCqAAWPix6FlfeA=
X-Received: by 2002:a05:600c:138a:b0:485:3177:d805 with SMTP id 5b1f17b1804b1-486fee29279mr81465475e9.7.1774206435068;
        Sun, 22 Mar 2026 12:07:15 -0700 (PDT)
Received: from localhost.localdomain ([46.155.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe868cb1sm63340595e9.5.2026.03.22.12.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:07:14 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2 3/5] platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
Date: Sun, 22 Mar 2026 22:06:22 +0300
Message-ID: <20260322190624.35162-4-emreleno@gmail.com>
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

