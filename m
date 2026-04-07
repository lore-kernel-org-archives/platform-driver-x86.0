Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131143ACEE8
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571946; cv=none; b=KzuWgaxvc8+8BKNFA4ncLw10Mi9F5ATwvoveuzPQ3XalgNPBJQySZ6VhjE8t94+QNrAYmwPN4G9q2ASlX1MCjrwVprV1Xr8qOGvxXSjL/8ngkQZ+YAjrLiSeIW5yTvUmUF1mot//vp4+TsPn2c9XoGYQCZi9/3Oexu71VXNNylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571946; c=relaxed/simple;
	bh=0xtk6l9zXJ52xBcCS8Er3MVuVDFKl38JCXDoxR2HnAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QMu8izsGcwrCRfr7vrpyaavt6tkmBOPQHBmSo00q8iqJMjFarE2j4lwzb/qDFdrJh395R4JtQ5aRv0ir0olDhJGLPVbcUGnLbp24c9MADH1H44JPIEEBrDhvqnOTXgRWVDjUB3/ZepZzb+brtK8s21XYMfaapm5WTDptK10kPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B81cm8t6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B81cm8t6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf7190580so617960f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 07:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775571943; x=1776176743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqshKVQ1S707dYaNTrTbQfEtf4ZgIgsOHm40TNLvX7s=;
        b=B81cm8t6tAuDgvt4vsjLA8gm/w8+/3PFg3TAuR0xKcqCBDU6eGJzPdIRop0grEne3J
         5pK7iCZnVcoxRNJ7h8Qrp0PFofkLqMcImqwRy7A4NmhJVFxRTnh7/EgXAu7MdzjFEm91
         7yTBX/K/Ws/bA+JfnfOH21Mvjpr9pqpmLedxMSxEgd6qq3DJQ71vMR/QzP9DkKLgxeIi
         v63QczegJfTKiWd46DuQWpDJjFmAIpMNTQdkj0RsnyZc/09uwXenGn7CwD6O3OC9UyDQ
         I3j/fmUlRT60oCKrIo4fR3bxKjKJvfEZKkhPAyIoQSGwXQOYDhFjEWyXa6N7dSa48+s5
         khoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571943; x=1776176743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqshKVQ1S707dYaNTrTbQfEtf4ZgIgsOHm40TNLvX7s=;
        b=NyrEcx8i6SmuIDuTOJjNhMlISXBFTfkt2HsbFiZQTLwxymGOBrEip1u7WdOZxnzHIu
         CUXiPF7tEZGg/4Yat2p3cPx4pl0XsfdJgNCewsFd37z+7MYy0m22RcZYIUpmPMSD8KgX
         WYcPq0scc3JRE+kNElNrdSBa35SA1waYo/Y3PhLX1ggY5bE9CFs6xulhVRx8iGUCqdEB
         hq63iNCkasu0arxaQM+dGB0tC+7FPQ+m6GQntiDVAiXSeeLRgOe0kVIXI35C/yqF2tpZ
         zP7bCjLM1mEReGSM1DSVM+3yKGmCnWFpkiskDey3RhYAD9zMiaG4eK/giZi3Vq3umj8X
         9lKQ==
X-Gm-Message-State: AOJu0YxOdYjrXRc+1eDsnBudXP+iW3WgH5doge4zO5ypcoQU7/ykNySs
	sw0aoQIzYRISTz+BoXi3da2upef4behN40vdxSbpiBQcP1CfJGgfM/koWwwCL6YlNIXIVg==
X-Gm-Gg: AeBDiesgJwASEsPZ7h6eiZHInBlUkZvsEgSTQ41m87hU8zwBYxqnUMFzdBP4w2Hz95R
	lcorakWoCbfjoVHshqzGLG7Y79lj987Dhur9dknow2OFIKbQKQ22qoH18Yxr6e2U4swMaFc1hCq
	v566UFwYftRfkHhdvl441lx0q7r180nnYHsOElPgT+Bvi3g54TdRFIjH/xSfuETPzf6HTui9lw0
	XWGCK9Y4UVY6P/6UF8xsWbhAHA+XX3j2bO5puBe4HuseoWEI0JOux8C+MeOHMvHRyYK+TINi8aW
	xdedoyenV8AEzhHRYC1g70yg35y5kJSYWoAYXe7igg4ayR+kO2tOC4daJQ2uCf9rsZWigBfKSou
	ecVQXFYmMQHLHpG1KmtHhF7jEYPnMVASOILMQCjFiY7FAOb1mVSh77Qi+9FL54l5REphJls0nuf
	qUY2uuBKTRuoR0PPWVATYYGB0E+WXH8cYc6ybYXnYr1h93tb1mPABX3uREox5NQA==
X-Received: by 2002:a05:6000:18a8:b0:43d:4cc6:77dc with SMTP id ffacd0b85a97d-43d4cc6781dmr1948333f8f.2.1775571943194;
        Tue, 07 Apr 2026 07:25:43 -0700 (PDT)
Received: from localhost.localdomain ([31.7.38.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53489990f8f.32.2026.04.07.07.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:25:42 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v4 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
Date: Tue,  7 Apr 2026 17:25:13 +0300
Message-ID: <20260407142515.20683-5-emreleno@gmail.com>
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

gpu_delta was declared as u8. If the firmware specifies a GPU RPM
lower than the CPU RPM, subtracting them causes an underflow
(e.g. 10 - 20 = 246), which forces the GPU fan to remain clamped at
U8_MAX (100% speed) during operation.

Change gpu_delta to int and use signed arithmetic. Existing signed logic
in hp_wmi_fan_speed_set() correctly handles negative deltas.

Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Victus S models")
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
Changes in v4:
- Restore gpu_delta assignment to a single line to avoid unrelated style noise.
- This results in the assignment being identical to the base branch, effectively
  removing that hunk from the patch while keeping the type change.

Changes in v3:
- Remove unnecessary casting.
- Add Fixes: tag.

Changes in v2:
- Change gpu_delta type to int to handle potential negative values.

 drivers/platform/x86/hp/hp-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 2932cab9aa78..4f49861d3fbe 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -455,7 +455,7 @@ enum pwm_modes {
 struct hp_wmi_hwmon_priv {
 	u8 min_rpm;
 	u8 max_rpm;
-	u8 gpu_delta;
+	int gpu_delta;
 	u8 mode;
 	u8 pwm;
 	struct delayed_work keep_alive_dwork;
@@ -2549,8 +2549,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_data[128] = { 0 };
 	struct victus_s_fan_table *fan_table;
-	u8 min_rpm, max_rpm, gpu_delta;
-	int ret;
+	u8 min_rpm, max_rpm;
+	int gpu_delta, ret;

 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
--
2.53.0
