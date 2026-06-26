Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6053B52F8
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496904; cv=none; b=ci5fsTOoaQN73Z8jaKDMxtr3TTYcdPRDOy2YUJ6AzUZK8W8UmobZK9sWeM3jed1xcp1tjY1KWVIwAuBcYIItReaD/0bqG6Rvh82dy5S9FbwLZlgDHQvB8cUIiNdwYIxkJfxU5/Wceo5WMToKMZWhBcmAVhzI83EEyCo0mxOT1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496904; c=relaxed/simple;
	bh=uhR+eFJwS3BAQxfzCT3whZ4xRaTo7iBWS1T6cavedSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HE0jBkdun2U5bMlNKpMOnAT9VMHPgt23ZdRW6cDudIYDTOYTz9thI+teBR0/OiRIRIJU6RRLRyIGe5qa5Lg4utzwXrW4ZmP1OkuwymtEqPLwgxtWLghv+hOR98Iod6iDIuE3jYp0aO9EHpyd0MnbiKP7VQTBEl45dAf/SKq3OzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ASnjUJVT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ASnjUJVT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4924593f45dso16641115e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496901; x=1783101701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0BvMexIGwgh1PiS8vWbNAYnoQ/lCiXcrIRwjtcUMa0=;
        b=ASnjUJVTAlQCrN2v/VryoJlBiZoojJMugpLVQAbpJxgJ450O62O1fjfst64JyrESDo
         81Ekd1/2Pt3txblOAiam6lOYbt0Ezg6e+S/mgXQH7jJoxXJekki80oI/ofGzGB4hRtzg
         DBqPFRyAWPCW36ya+RCbSWw4PMKofY/hAi7nzzLEmhmDJr2yhRkmzUi4kfS8d3uDvl7R
         KBh5A0DVIA/UUdqrijpl4C19S1UkR6J+qHji3d9Jgu5mBP11IBt0DKl5Zn+hrd4KfED/
         kC9dF4zFE1azl+dnEAEQV0pzTVBZ6E2Tcwb6irG5lqFvm/IrHeJhqzXbnoDghtGt/Mlj
         +/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496901; x=1783101701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0BvMexIGwgh1PiS8vWbNAYnoQ/lCiXcrIRwjtcUMa0=;
        b=jzItmTvMe0u0KGtsV/tU5BudPdR24wK9gNeFbQPqsAM/XCxjvj3gUha2xNTb+ULlY1
         2tVebLtb1QLdB1MXozsulGC8kKajLn/GTFWtT7VkA0gU1LHCGKizMMPAVb2z/UFHzxGs
         sdCpdu5VEvq0cR/AiPFo2LJg9WQI8EzJbKNffwm1Ha/JjSjlDI9rRa0nLDiWQOQ/eSz4
         ijqUOWTvaCvWST8PSa7N1mTuLcUpZf7W1tIeXsX92lgyKZ4MDrlUXF6Hv8r5X5wSNksZ
         RTyAOy7Tnezpfh/phCmm1RuiTPgzcsiJqELPHaazMcBJRTewfeNUcVfU2CU0S5CujEu1
         Y2Dw==
X-Forwarded-Encrypted: i=1; AFNElJ+yVZ1bKVqqAOXY/FrCRWX1BKMcKB0SasWcYfzkL3EMdqbN9MNEBlwwXiS+Gy0dEna1AOVarqtxeq61ocawM0q4YD/L@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz20Sfn17LNzQulxSF00lZTOMwEBkg3Z2Z14b0vNPx8wyUwYQ6
	2x9mRG/2y1G75EFSaOvHu3yX9cmYt4vGLQXz6WrvwXwKMGadjnh6UaD8Svt5Vj4HOKs=
X-Gm-Gg: AfdE7cnRCHoFogXAXNeUxSZwDAHiBjylNrqPHVi2c1kI6TQ2R3qa+SXMN89tktJ5mMb
	886WbrwjCQWqPWPJQFAPWp+y9MzbTz9weS0Q5iLlJHgUGMhbXV6I6RVANVOSgyeL31lYS8tnnT5
	2BMiHdh/OFOSlZ0ntg0YDd9bcPi4QS6Hra1j+DmljAhK4rtlkyhX60nJdtKT0Bz3JT7tXQbRlil
	Hfr6fhyrAQUMMhcshmvtHMJ1orsp6ZgUF7aq9oDVJJhKRuJFX4ipT1QriazqlnnXmYyow2YHznu
	rArgzLKUMtCo4UZUxWmAhF+GSJYKWVObigIZOz4U5c7hQTz9TCYseWaYRi1CDzx2FMht8m6v3O5
	AJ1P38tn1f57BtjNiPQb5C5saIkOdhNgakHXfY1q22cutFv+DaUZVCdrDbTF/DaSDE+nkRf3Qrv
	vfeBJgUz+iLG9cp14ii1DhI23I58e5ZaMEnOTV408eV4Ct9wHBwlahmnywtx3GpKpDgeO/KfsTA
	g12
X-Received: by 2002:a05:600c:1f91:b0:492:4d56:d5fe with SMTP id 5b1f17b1804b1-49266858306mr107771425e9.14.1782496901334;
        Fri, 26 Jun 2026 11:01:41 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fc0f32sm96212295e9.3.2026.06.26.11.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/17] platform/x86: x86-android-tablets: Add include defining struct dmi_system_id
Date: Fri, 26 Jun 2026 20:00:29 +0200
Message-ID:  <d802aa844f8680021036f441924a0bef508c0118.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uhR+eFJwS3BAQxfzCT3whZ4xRaTo7iBWS1T6cavedSY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5PbHB8S5581d5XDxZ+2TxxpgFKfZaRJIxyI IM1YOZicrSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+TwAKCRCPgPtYfRL+ TuGvB/9CdsP63YgDJAT6tdc7ZkCOCMGpbRN/s3y0IWIUpOc7oXvkou4skg7pf3mYR+l4TnMu89+ RwQ6SwkUWTGHdn4DLGRTxb63toJvRMvydpHrtVFMYSmhozxU0CrrXhZs8qRlFm9Em4aamw19r0w 5J9guGkhTKeKFQbqEJ0pkMaocrtL+rjCFIh5ke+FNwdLyqhWeCcapAQDxa2Tr/IefPWHhJFr3pX dL/P9fMPLg7w5tYQ108Lkf9i8n+cBv9BEw39hHBjT2g2CvTGerpDX6LK8SzjnNC1UyQpGpyKRLO qJxVh1c+C7zoUEiz9kc4GPCgxi5ia2JuvIblPN5uOsIoPyMK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transitively
which ensures that struct dmi_system_id is defined in
drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. However
this include in <linux/i2c.h> will be replaced by one for i2c_device_id
only. To ensure that dmi_system_id is available add the include for that
explicitly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 2498390958ad..25298a430796 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/irqdomain_defs.h>
+#include <linux/mod_device_id/dmi.h>
 #include <linux/spi/spi.h>
 
 struct gpio_desc;
-- 
2.47.3

