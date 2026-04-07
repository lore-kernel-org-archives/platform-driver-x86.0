Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5E53ACA49
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571944; cv=none; b=Ex/XRudRjZtGjPrqNy0co00XtJ1W4pa1lRE0x2RGcpgEfr9mmVlCYqSgaGzxeeyA2DMQMRzqqnvB58KrpvsVwC85ikiGtCWMItMZ0H5IVXwjC/Z8ucbKQnvI4R/lc7BGJ+uhIDM2w7vExl2xpwnURMDAoffc/jtRGl6Ej8ipjtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571944; c=relaxed/simple;
	bh=YxZ/d8hWc5Dojxq2+WQ8y//zQ0MV75jV5AaZq1iu/u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIVnmDzQ7wpmXzPxKT2s0b3tHkFgD8vLN07tDYvscGnMdA0Fn27O69fsC84jpmLHksY7No7fJPdud94mqr477ClVd4AmKqXAgoySlY9AKlZCZSXvj0oJvisubODWr9IukzaBgU06cwF5RqQbZuf8aPPGcJB12WDNeZPNYP0zVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIbURaW+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIbURaW+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483708b697cso7713335e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775571941; x=1776176741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxSRimATBcfYurd5oZ/SGQyL2ML4iFG/Nsr5i0TaWFg=;
        b=jIbURaW+ukOGuQQctJEoairvOPQeByCUvvxUD+PGkWm6bdyaiWI0ltQPinY65dB0QY
         ua5efzQYPoCVt3wl1z9nD7vLnIC3gtnCxv+9QQguRXpkAI8wx/qvDbEn4HDBYJ2y8vNj
         SW/DBlfFCR0Sr2SdbmGq/N+TlKgS3+J3daqp+zDDwXfwiHW6uXnFDx7ENxrEQ4oNueqc
         /8JozC6SehqasCorKIalQkCfSha4F2jFxa+ScdFfj+XRwQEikNce2d5zA+BvL93yBKUZ
         HJ4zTMAja1OOuwcJSkVFCQKTNRtHb0QIudmcR3S6bTdkKkniRYehBdOpX2IxP1zjVosz
         9r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571941; x=1776176741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxSRimATBcfYurd5oZ/SGQyL2ML4iFG/Nsr5i0TaWFg=;
        b=DtQKN6I6OneSQ96KnEgYvhBQdxtV+kVH8lmxA/V24/vGSeQ5Xyc4DnQqDioaFm8pxb
         x/A3anB2Xn7rcx3LLKeaSeZSMGiOPkLjyEjkQetK/5341QOceMm8jmv1WrkFIgMvyt/M
         cvlUeOiaMmgU42+r8fkTGHx2b0SN/BToqqV1NXMcemUfG+X2EIg2ALxOs3FwN0TJgmbt
         6jE5/I1bYuG2KAhXQUhZ4H7AuZ/X5se0ehLPapPY93JjoPtWtAvo6PR+1u6mZpUe/46G
         RmId+6WBlxdz6lq2kjqn28ZxJI+LcjF5tqxHD5skp6SVo3UlhUdB2rIrgwQSdMwGK3K9
         OKBw==
X-Gm-Message-State: AOJu0YzOjWCRZ+DdOni8w2GHUjoHoqq8wE84XWeBdrjgdgu0rusdmoKb
	okYx9pa0+B/rlO9BJ5v6kp3pXHCDyiL0d0Er3kKCHtjVlZkQdCYCsT6DA3ZRg8sE6B8+Gw==
X-Gm-Gg: AeBDieuZUrm8KKPqTtpGwTubrUNvqdKsjMxvRvty2jivvxY6nwyHJsH1HXF90AQfoHv
	T9+l6X7ZwLrRhynAicl/PJmxG4uNYa9ymd/bCwoSK/wadWEAl7SQcC9Yzm5msKYECMVvRhyvgIJ
	kR6C6RMHQv+t8QSBc3+vaGTPOe9zaYGtpswoO4QJxI/MeIf6d/NtpZpeDHflwvsB5EC1nrAsF52
	RIry91CFXSc1QpThHa9D3mwBqfzEBj0RMeb+mKcB7VDZRA0Z4Ep9njeiZfMv6v0zAhwig7MzGUZ
	YZBnTxn+rzt8a3Zexh3+iIEOC64k7T4no+RfUaGJvTfnU+xbq7YsozzsrpY5B0WNvvAOo4aLpuw
	QpuNRNwvMjdIryydGx33o06kUiw5U9jMWZjvVPWUAUrMJT+KqC0OYNDU8hIqGRnOmNxa1NcYB3k
	B8ecBwIzUhFh/nMCvL44uNcn0CzKtYmULHp3rntJMcvoZ84iA3GRHoKXPf2+5Jbg==
X-Received: by 2002:a05:600c:3152:b0:486:b967:5c9b with SMTP id 5b1f17b1804b1-48899e90690mr135036095e9.3.1775571941416;
        Tue, 07 Apr 2026 07:25:41 -0700 (PDT)
Received: from localhost.localdomain ([31.7.38.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53489990f8f.32.2026.04.07.07.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:25:40 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v4 3/5] platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
Date: Tue,  7 Apr 2026 17:25:12 +0300
Message-ID: <20260407142515.20683-4-emreleno@gmail.com>
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

