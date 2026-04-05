Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F7257851
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400319; cv=none; b=b90kzLuvGvIlCU8OefZsYkOV+Z3WwhjjpoQFKbN0U5p/7s+4QE36WJmfAsQgqTq5OZYebYBthelbkqBJ/+tnl6GFBLUDegytbZ5rePtamLOAFykqMgec4d2zWeMHyvbCVUZhXL12E2fxlLYjNrEivVAQiooOwCDO32q/yQJ+HmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400319; c=relaxed/simple;
	bh=TfNxeGb9nt4qVFEDy3vSP2vU6t/UvG2YByCxEcAn8sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpVvTmtQJxiz0HOr9vDebDmI9DSmbWiuGINDY/ekOCGj4weI2viY5gQF5A13OEb1TBSir6P7+8GydefRBkX61Wje04vY32L0oBxjDVCrI3yJWcuDJc98jnl6GcMlV6EB652rVcUrRduCEYaKCd0/wlQPr465X7yNzSMWcjJMzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtRV55V8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtRV55V8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371104ffdso4200655e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400316; x=1776005116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kTb1nxrmvzDufvOzlr6MJ8Yqsu0pkzDYB5uLfxFM34=;
        b=JtRV55V8iPJvVB/MFRJyhJjdxpC6ujhglGTdA1bpj/3L3QwsTV9kNNTYABmAhez0dd
         pNXJsPgvfpdqPkY7VDzM3xP+cBrvYwQruyhhlxT8RzZzMkr9GtXCbiPVKHFYK97mg5PR
         iTYmaqXsep/vRq3lcKeZJfzOeiheGAlo6sGFOVNCi8FF5DLqs89majE/fZNH35srOiUX
         hUbDj1NYYEp7QKPgugyqiCMJkO1sHa6YkYi6rBq4IkBK/S61f3H59Pt7nG8VsScoIc3t
         hZy7EcSsDKkUY+loQDNzP15+5HH1jKkmK6xwTcMi5JUSh2D+aQgo/9Hw2ui5dS5nqd05
         XHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400316; x=1776005116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8kTb1nxrmvzDufvOzlr6MJ8Yqsu0pkzDYB5uLfxFM34=;
        b=M4dBIkJvc9a1pdacYcHQvwmj5je8kBJipe2n0fq4JHDnanDbLG+YJeqjIcn8auzJl3
         2XG8nWmj2dQCQ6SYNFFQKI0575LSRoQHtM5OxWwFzpuVq3pcNeeRHppUQgXSZFWTfJQX
         J24msJbUNXQZhImH5o8KcppduyWdgEoPHYZb6VK6j3IbIzeZVazzD3a+if4J54BsFGV5
         rNG8+aUwbmt3CcnxGl5YMJ0Ym91tBS66F2+yPzbMBd2zb4w9+wY8/EGus76kUWz5stg9
         W7EEPqCicEk+65W7r9yP3wATin/41q2zXCSokKqelzmZ1V8IemeEgp9LsjFs3bzGox2a
         yR0g==
X-Gm-Message-State: AOJu0YzMHbrSRMw0DNHXG0NTpkobA2CQlzBJG6gxvRlGmW0h+IZpvzc1
	IO6coZSO2cJf1mAG7My+5b+bqfcfOxBgRmk97iGVOAqLFuOAJBh0b+uT5cseUfWrKeBYxQ==
X-Gm-Gg: AeBDievaP98jAkcd/Z6SWGKiw7gh/lbvlw350QJn+S+S5WH4xjuL2+l6g52DqcdjybJ
	sT9R2ivore4DvirnO0eIE0l2LD9tdHN2E1prSABPHhbA4cbk1UnBs/52RBaRyUD1Anw2R7MBat4
	x/jjpRfqlD+UOPd+Z6FC5oFrN1J9pMXqp+h3NbRovtz9zJREVHvUwXcjjzrQ2LSa9ohKE1NUHJY
	umEBiCUWXwRqFG7QT9XQmrT2CQ41Cqaa4/loDCMRzgUqQQeFSo7zBUf3YEgp8EFN1MLnLNlhzbc
	kQ5ZOX2aTGe3TQnBds9q+vTWwxzwl4K4EcIDL4lyKu6/83iLavzQm+yP9ebR/eigzjTzFsYF+QI
	xPFWHnjrKT/DaH8EeuGjeE3M7SIb2Gx6T0+/FhvFyjFPevml0aw6avckPvbPHgN0DAKqVsVeO3y
	euH9CaxWy5VL8c+y9m4wmA0XeU4LzAlvzMO7W0jEwyDyLm44bQte7LCPU9Vt2KvqIBG8vyuA==
X-Received: by 2002:a05:600c:1d05:b0:486:fdc0:4504 with SMTP id 5b1f17b1804b1-488997c3124mr80125075e9.4.1775400316011;
        Sun, 05 Apr 2026 07:45:16 -0700 (PDT)
Received: from fridge.local ([2a00:1d35:c836:5700:77d9:f36f:3748:d642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm35698799f8f.32.2026.04.05.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:45:15 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v3 2/5] platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
Date: Sun,  5 Apr 2026 17:44:57 +0300
Message-ID: <20260405144502.24944-3-emreleno@gmail.com>
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

hp_wmi_apply_fan_settings() uses cancel_delayed_work_sync() to stop
the keep-alive timer in AUTO mode. However, since
hp_wmi_apply_fan_settings() is also called from the keep-alive
handler, a race condition with a sysfs write can cause the handler to
wait on itself, leading to a deadlock.

Replace cancel_delayed_work_sync() with cancel_delayed_work() in
hp_wmi_apply_fan_settings() to avoid the self-flush deadlock.

Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index eac39f68d762..79d6bc3cd223 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2384,7 +2384,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		}
 		if (ret < 0)
 			return ret;
-		cancel_delayed_work_sync(&priv->keep_alive_dwork);
+		cancel_delayed_work(&priv->keep_alive_dwork);
 		return 0;
 	default:
 		/* shouldn't happen */
-- 
2.53.0

