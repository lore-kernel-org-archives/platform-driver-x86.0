Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BADD8248B
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400324; cv=none; b=esE44otYYay9AGcA+tFHqcu+ZvvC5dWZ9Q4f2mhDDTWPw16kqMlNCC4u1zWEtLG4mtAefngvexUlUhWItxWk2iKXoQbb6+pY8gDxZcfrfQtyv+nuWEfThkqsI7zTgxiMWG9aoLEduu3/JHtLerAHCJ1ne1xFVfdPyHExUMNgD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400324; c=relaxed/simple;
	bh=U9Ed+suttjno51XBUYSnT0699GezdZBqktDkjIeo3Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+VS39Qmv5x3yWeLqdIF3mmo0goUoZwDeAYo2AARzMuc/L/VoWy5egWsMFyvK0z4vibk2Vd+i5WFevZKa+3N1GgnAoXRLRzUeZ4iZWMpzUuX86iYa79Ck9HlY2ph+S08SI2P83M4fUZ2IwaEQgW9uhSdEx5JCEL2A7QStyCvU30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkqaPUnF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkqaPUnF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b8cb81bc0so173281f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400319; x=1776005119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcDE+lrXl8P386IFXCKLCz+1una+WdqnP+gxsxxcZkI=;
        b=kkqaPUnFO9pZBUkfbwn5y5r2nTOYT/hFh2q4EbcJwfYeDz/WP9xeu757OaMf+x9vTA
         VNtwxOywwWs/eaPNykjaX7O8C4+4gRk08ZaKNihPfi+4/qpY0sf7l0+DpbunJ80vEroo
         ZShhFAgIHnIXUZNB5jibrY8n2+nW3QA52sStqkgwxYKuEBftfEQCk1LWSN88mbmkOkKv
         st/tEr9jA5Iwvl0LjE+U48rvrNpID+wTnUywT3kW5zgu4keovt4WNDzf4IGrrquMqgy+
         eAW/ovaGT7gesA4KabUsl2uCZWXNsBGphaklIKQYvchFtvhY4QoylSVR54C9AvG2Kt6z
         q5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400319; x=1776005119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcDE+lrXl8P386IFXCKLCz+1una+WdqnP+gxsxxcZkI=;
        b=Qw+y5GhCF0S7FpaxzfHW7q+da6JohcVtiY1bE4vzS06Q22FH89PXIQuhU3/TOhJ1mG
         Te2Ba/TVN54gMD4xIPcINW+hxXSStVKVX5AJfHpeOj7nhwSNGd1HAf8eGWKeN29zIKRT
         w0IbVVWWUtM41K7bhagnUAnWdKHle5kb5407ZF1SJTX1SuqVJMw0ugjF+gQaVIy/S5v/
         PRGIRs7mELHWbG5vV6Vv8FgAdxPlB4kngpA0yJdcKsgNoT6eo1h1Vvrn0Wl0QbggunDX
         KB1fX79qCAfmvp0Kfdw6+Kvh34fRgt1azo3i0z63jZ8b9wrvGT14MYH7kHZBu0pROY+i
         +ahA==
X-Gm-Message-State: AOJu0Yx5gl3FQZ4MYF4QzzwFDhc27zI1Dw1Uy5lWr7AoyuoMn+j1gdJF
	TZjWRp58np32HerC57TrDeFdvg6ON0ciOS27CyF7v96AQ0kaf6/2sKIhEUTF6GOWDBl8iA==
X-Gm-Gg: AeBDievrEZq0ahj0L+aqT3Phnib9HHuah+5g9JHwvoCzSh2DJLPoZXYzUB8vusE5mlD
	ffDo3y2BB1dSdxs49pZdW4kWB7yf/aj3aiMiUQxQIYfvHzsb2gWuBAD1qhV1TcIKyFm20kdS6gR
	E7q7Ri7uzsNg4O3sprrY9/N+CYKRWldNCgVqOHdsmg1cWNwWhHiBQTVLDd9FuT9F1deldNeDPs1
	4H1aa124JBqF7/gOhjikGAI0dMJgCqy5R9Q5Yk9Eol2ciqfQer85v8Acyxt5YwbNhxOCbdGVvFl
	6X5xzEYQ6lpPTogtXVqxB/x4FhhTXB8Q6VA6yK918rQwV+esE1GwHGfN33gxuTur8b6aMIx22/b
	RTpCccWP4bbs+bDQvoOBvjkQE4Ul4WFRhdG+0ncR69Opxqx4aumgJtPwKE7U69FxxohHbCZD47H
	gDOTWJ3zplHjhPwU9UhdKyvc4o9ore1HPsE5IVHsK3FsNyGpB+lKkLcqQuDOx85pF0ind/9w==
X-Received: by 2002:a05:6000:2995:20b0:43d:deb:79b7 with SMTP id ffacd0b85a97d-43d292d35bbmr4818846f8f.6.1775400319380;
        Sun, 05 Apr 2026 07:45:19 -0700 (PDT)
Received: from fridge.local ([2a00:1d35:c836:5700:77d9:f36f:3748:d642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm35698799f8f.32.2026.04.05.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:45:19 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v3 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
Date: Sun,  5 Apr 2026 17:44:59 +0300
Message-ID: <20260405144502.24944-5-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405144502.24944-1-emreleno@gmail.com>
References: <20260405144502.24944-1-emreleno@gmail.com>
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
Changes in v2:
- Drop the if (gpu_delta < 0) guard and pr_warn. A negative delta is
  valid firmware behavior on boards where CPU_RPM > GPU_RPM. Store
  gpu_delta as int in struct hp_wmi_hwmon_priv so the existing signed
  arithmetic and clamp_val() in hp_wmi_fan_speed_set() handle the
  negative case correctly without saturating at U8_MAX.

Changes in v3:
- Removed unnecessary explicit (int) casts. C's integer promotion rules
  already convert u8 operands to int for arithmetic; the fix only
  requires storing the result in an int variable.

 drivers/platform/x86/hp/hp-wmi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 2932cab9aa78..db72ad9da0a5 100644
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
@@ -2572,7 +2572,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	min_rpm = fan_table->entries[0].cpu_rpm;
 	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
+	gpu_delta = fan_table->entries[0].gpu_rpm -
+		    fan_table->entries[0].cpu_rpm;
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
 	priv->gpu_delta = gpu_delta;
-- 
2.53.0

