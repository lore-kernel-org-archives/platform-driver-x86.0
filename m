Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BF2372EF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206440; cv=none; b=MVRcyoPpNUfMH+jAWN5VNqoSwbMFBWAFYdjtPac9HsA66JUN6WDwh7pztpSnSMpkw6SWgFNb/VlNWggRstdUfim2fNqs0hrph568UKAIbDHy/XdqxjdaBUejKsJjRJ9zx4uHu1hy8s7oUN7aJiuCCNHMX/RluJ/3d9/fQQFTRDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206440; c=relaxed/simple;
	bh=b2Yu4QNmTqQ7VgOgSC58XEL8/pOhTJNoN/AnRGyQ49M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5zN5iUF4644IoGSLO8W5EhpiPI5PLtQlmjtxF2huWXV/WStFyUNpsjRU4Fb8M7XSZUuaFB17qEBDzDJCNB7XVybhQEHPgXuVP9STeElCTJr00NueWOuzLH6dpB+8uqwII3elgRM0WDRTPs29EBbB627YZQ6uTP6/Ie9WDOQs3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bR+p1Vu/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bR+p1Vu/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so5192285e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774206437; x=1774811237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4Vcl8jB5v5qB0mNZx8g21iRBAwUU3PRlx8EqzAROA=;
        b=bR+p1Vu/bRkhme126AfZM/SUnsFPy9UNrWb4wRUYcvszF76z6NF+0I3nkwc6x2/4ID
         Dgs9NFzguZhhxn693eVoPuN/p8u5HiYEnxgU8EhqnH0184lM1UQg9bvoIWTAESPPsRKy
         5lsA4Et4gI4JhXQCa/za/CdaHDh8jy3RQaXaUmVsLdQDsXAIZOVaRNVs2Op8Bu3EnyhC
         VFLrkhuEQAjaE7mT/KDRYrWGdFaMNBqXYwLsGXgAbOasc7FeIOxbYA/SoryUhb6bv8Ud
         apAHDZE8FFqrHOrXCOerCiT4us5ux9ZnJt3xDvAIm4em1somUevVtLwaZ2mWkLwEG/Q/
         0Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774206437; x=1774811237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eC4Vcl8jB5v5qB0mNZx8g21iRBAwUU3PRlx8EqzAROA=;
        b=RtM+g2HndB19ixuHv39bH1seWfeefc27cw5qDNc6SN4RPRmGVbd0ch8erzhmxbsVih
         4ORnNwNmC3Unv4wG0mXvpiO7zVAbtairoYvkAyv+D+0JHVi8eL57mJkOmm2OgtXr/Ofq
         Vtd+YmLks8wqoIFywvOP0RuhnG+KjlblxQTrYaswkLgiIFEDIXIsJcWSJlU0HoivxmT9
         bPrzYkq1Xr7ek5apGUM3BIsq9k1gaWHSp9YyDSto50evYVsOajDCafAMc2QhocWH5eT9
         s+4LfK2iSaukMrnl+3aMPL1ZvQT9kRq18xto3XzLSwDxQHwd/bMTbSqrs0tfFTIYnblf
         ji8w==
X-Gm-Message-State: AOJu0Yyz0FgzRogeJz1HZiULUs4Kpi5zMlzF/ogTGSy2gdGQM9oogdy+
	VBubh0WP3PpBGU28qqruqDPa2vrN65aYV/4P6F2HYri5hgvr5yYE9VbiSEw7g/t1sbeikQ==
X-Gm-Gg: ATEYQzxsIoIAHtmy7fvUJrfDi6IYzWBvk5H73XB+uE7CkKITpjGXn1tg3nZrhxRwSa7
	NqQfXK9kRR4L0ZyoYy871e7yCE/bSlhccLIecGzLrgBN/kCfQNn2CKuiXILJqqKapZHUQA40I0u
	xxk9dubKnC/YLv+ZF+51eM6BET8i6rNU5J5SlVTxa3cDM/At0gwi/jUp5Nqt1balf3/s5fP7QwO
	sVrIiaPSaQlEM36x/zHB4WJ0xE2WnZ9uWhJ3HlQ76ULuFG5U5Z3aAN2FIgE+MLKvIbfain/DMBL
	x5y74rBB/q9WYv4b/i2W3Ro191S0q+hIHB3YezY71KFRUbpQeRHe9dSskEKUYUE2Zt48tUJ+ryb
	+Xtibh2naccqJuusdzUE1rwpudxgzNFdC4mACOImRZ9/lyUPuOu3ikoeraMob/5wqZQ5HKIOsyN
	8BTZ+h9u2AuhaDvyuzHB540xiW3WMi4xMVXDLiyDs9uIBOJtf6ZD65r3lc71ikWG7ada8xHOc=
X-Received: by 2002:a05:600c:3105:b0:485:3bc7:a224 with SMTP id 5b1f17b1804b1-486ff01b279mr83078485e9.6.1774206437259;
        Sun, 22 Mar 2026 12:07:17 -0700 (PDT)
Received: from localhost.localdomain ([46.155.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe868cb1sm63340595e9.5.2026.03.22.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:07:16 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
Date: Sun, 22 Mar 2026 22:06:23 +0300
Message-ID: <20260322190624.35162-5-emreleno@gmail.com>
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

gpu_delta was declared as u8 and computed as the difference of two u8
fan RPM values from the firmware fan table. If gpu_rpm < cpu_rpm, the
subtraction wraps around modulo 256, producing a large positive value
(e.g. 10 - 20 = 246 as u8). This value is then added to every
requested fan speed in hp_wmi_fan_speed_set(), causing the GPU fan to
be clamped to U8_MAX on almost every write.

Change gpu_delta to int in both struct hp_wmi_hwmon_priv and
hp_wmi_setup_fan_settings(), and perform the subtraction in signed
arithmetic. hp_wmi_fan_speed_set() already uses signed arithmetic with
clamp_val(), so a negative delta correctly results in a lower GPU fan
speed rather than saturating at U8_MAX.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
Changes in v2:
- Drop the if (gpu_delta < 0) guard and pr_warn. A negative delta is
  valid firmware behavior on boards where CPU_RPM > GPU_RPM. Store
  gpu_delta as int in struct hp_wmi_hwmon_priv so the existing signed
  arithmetic and clamp_val() in hp_wmi_fan_speed_set() handle the
  negative case correctly without saturating at U8_MAX.

 drivers/platform/x86/hp/hp-wmi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index a29f34588055..af57cb0dbf9e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -436,7 +436,7 @@ enum pwm_modes {
 struct hp_wmi_hwmon_priv {
 	u8 min_rpm;
 	u8 max_rpm;
-	u8 gpu_delta;
+	int gpu_delta;
 	u8 mode;
 	u8 pwm;
 	struct delayed_work keep_alive_dwork;
@@ -2530,8 +2530,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_data[128] = { 0 };
 	struct victus_s_fan_table *fan_table;
-	u8 min_rpm, max_rpm, gpu_delta;
-	int ret;
+	u8 min_rpm, max_rpm;
+	int gpu_delta, ret;

 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
@@ -2553,7 +2553,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)

 	min_rpm = fan_table->entries[0].cpu_rpm;
 	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
+	gpu_delta = (int)fan_table->entries[0].gpu_rpm -
+		    (int)fan_table->entries[0].cpu_rpm;
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
 	priv->gpu_delta = gpu_delta;
--
2.53.0
