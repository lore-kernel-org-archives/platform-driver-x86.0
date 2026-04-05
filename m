Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8652FE074
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400320; cv=none; b=m9G4P8GH+uJMEGO0J0C5dZ5MuD9I3EAFkzmbawqHtA7UlCAWoCcMvD8Cr+X1EuOTm+36Q4g+5RMdfnxp5QKrHyYQvLLrLzLNiCQsv+ZzXaiAX9NxswDa1mk0XnMa4c25eqVlBI2AszvfBVl44YCu8M0ip7DQsCAJS3JWKb6FFcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400320; c=relaxed/simple;
	bh=YxZ/d8hWc5Dojxq2+WQ8y//zQ0MV75jV5AaZq1iu/u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThxV7Vr7YwSMqvHVbhtUuJaNz1TXIbp0EUXSBqLAcykRsXo68U2ios1Am5NaOpf5YlpfNWeON2jJ3sUfVsrOPBrpokGFC8ZKfswGv20JLbJ6Uo3rqlGaSsYiGHO6HmJx1zVYgC0FyhkFqYhwYe0undH5MD+tCw+D26ksOTHAuOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcUd8vkn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcUd8vkn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf7190580so377754f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400318; x=1776005118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxSRimATBcfYurd5oZ/SGQyL2ML4iFG/Nsr5i0TaWFg=;
        b=LcUd8vkn1h/cW/r43Vu80VhpuS1TwPrHnLcORHnFyyogIJ5iB1CF4zAs3kjXkUAC9G
         wbT62Yy0v2MMF2OjPnu5/rtedEjsAfWUQxodzlqj0AvluKJpwqpgNUp1E4IrvJbmEDzr
         6r91ovLnSR4icYEquVTn8sNqLP92iC+iqq/lD7MqTzArjdWfwIBE7P4DlXGoDryMjEWS
         1CmTV9+ro9Xho2dknUUA/oBtt43M7C97zhworUsJOZRp5a5Ig2uw37QcywpWqO7x3rTT
         GNduL6tOLj/ppZIyyzkxJ/AF0FXOR+1Mhe7xHOx7JXJf23v3rJ0UfgW0dfydv964ASSg
         U2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400318; x=1776005118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxSRimATBcfYurd5oZ/SGQyL2ML4iFG/Nsr5i0TaWFg=;
        b=DzGAK56CzKBLgG5rXcLoEZP9Z9Aq776pysunKkJTyut9fGwbrzOnc4D/YbNEYldr0y
         imeomx+o4Zvi3a2UG/BJtQ4ToA2Qk60RZURVp9e14zBBbv10JDZCaP4Nlze3BSAFCx2c
         0wgLRxWm/FMsbSsYwyZHJl51w8OSGQEk/bL4HODwGQccTbjeo81hIkOiaBK4JXfr7u8p
         +VOa72cZ+k++oobMx9OOY2t+YRN3xji+iAFULENFE9MjFWNs5S9JxxeC9UQdo7r3VJH6
         ulDcSr/d1Ju80uZZmyd1Q2vmvkx4u6RjMxgCZwugHL6wyCfi6A0sfPaJHOlSmwqQPYFP
         PaWQ==
X-Gm-Message-State: AOJu0Yw8Oh4EjXgqkpw4jiPrEzuwIs2dzKiH++Lwzi7RTLljgCVTWuCb
	dM4LagpwHHEZx6sKzHLdZ89NFIYPhdjPUe2rGAGAElhyQW6ByNUcuuInb1Ymekc1iucfug==
X-Gm-Gg: AeBDievWPT0oVZ5IuUdnyA7rRmyg2NSoZtMrN+TGKA9ihD7e8pQWMw3uPWZL59UAJHl
	+/JkGY2XqN0RqtPZ3Fll03jQ82/Ma9pyBG49nkZfLbHhlsWEB1HNqjExcL2RRAD9DNKOIZ/nt+u
	dqju8qMYizfDOgS9miU9Wv1Av+6uSAE9OYol228mpdLlzowM3nOAX4gfofg7UUhVHCF+53aUHWd
	SjQntPYlODlDD0rXh2bliKZyQnFnM+xo64E0016jlYM0uA1eRgYnpHMwqeIxOHzWiJp/k+jTddn
	yeChe6eYjkOI9A2e6wOG4k8yP5oC719ejVgzUzk201liYd9Ljw48IbwLzgFuOF/Lw+g2wIlzz/X
	UWPqSTY3y8XqwR8HOzKraeaK5REC8wfFs0OJHTY1zwQbEEA16PtKbG4qukHmDDFtd2rHtp7pVgV
	vbD5wa5VrOhaOeEQqoHD8vOGdCHlY2DBYX3uDVnkbv0P9rtcMzKzvuT5bF0xM=
X-Received: by 2002:a05:6000:2308:b0:43d:3141:77d8 with SMTP id ffacd0b85a97d-43d31417991mr4516340f8f.2.1775400317649;
        Sun, 05 Apr 2026 07:45:17 -0700 (PDT)
Received: from fridge.local ([2a00:1d35:c836:5700:77d9:f36f:3748:d642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm35698799f8f.32.2026.04.05.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:45:17 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v3 3/5] platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
Date: Sun,  5 Apr 2026 17:44:58 +0300
Message-ID: <20260405144502.24944-4-emreleno@gmail.com>
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

Currently, schedule_delayed_work() is used to queue the 90s keep-alive
timer. If a user manually changes the fan speed at T=85s,
schedule_delayed_work() leaves the existing timer in place as it is a
no-op if the work is already pending. This results in the keep-alive
timer firing unnecessarily at T=90s, just 5 seconds after the user
action.

Replace schedule_delayed_work() with mod_delayed_work() to reset the
90s timer whenever fan settings are applied. This guarantees a full 90s
delay after every user interaction, preventing redundant keep-alive
executions and improving efficiency.

Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
Changes in v3:
- Reworded commit message to clarify this is an inefficiency fix, not
  a functional bug.

 drivers/platform/x86/hp/hp-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 79d6bc3cd223..2932cab9aa78 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2361,8 +2361,8 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
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
@@ -2370,8 +2370,8 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

