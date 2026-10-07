Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362B4AF17D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380898; cv=none; b=RfbOOL4y8jgON5Y/5cqOdVAuGjuBBECyobHw4BlctodjJzLZEgElis4LpLQfKvLa4p3OcmTRL8SKZzLojZpO+mG7NcLFFbH5obSA2ocYUkLbmKTk4oiEdpUgYKzlf7mKN4nDMNRMW+BSdPbSHdTpC9mtiXKpMAjYKppE6qG/7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380898; c=relaxed/simple;
	bh=j0BTnlAs8SrifsAt/cBhiB5powqOjc7nrqQwOlhg0pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e500MmLT+4bG7ti3Z9EUU0A6775puqIvJZygrMHeWsi5kS694F7AigNNhW599w7g4Q18NESIjU52zl58b+KHIqNbuETaG2I9qxXa8QCoo92MnO/ugQzNXw6TQkVPoXij18A26c1ejYpMviWhh4q/UQtMFvS7KKK2hu1rWFMHU0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UypUde2r; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UypUde2r"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so4118821eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380886; x=1791985686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66JT1rBrkI19wCOUvWF3hh5nZVukFj+pub4uCRhpi4Y=;
        b=UypUde2rOPKE9BWOl8o/j6cWeXnc3uRAl+518cCmNHfrWYxIbtB8VoifUsQepb84N+
         2xKOl54mMlhwuyDCBfs3rWWMBvwGtiTNMRFaViaRUpWANZfLKCV8H/0ZQ/gFCyRyWB0j
         JcZlVjUv/MqC9sAi8EK/GSgOANaFucdJwHjXsnUMwm8sl/08ULxzqmd+eIIvKrUv2GTv
         MLgjF71i1vknX1mJ3C4BKcTkrO7P+CCPjZUHk6IoVaJ/fUD+u8opkvBiTqUESO4ub5vX
         GWrHoIEIbYyWfyR9JtKLDxljjlpMDhoI7P+1MjtHJk5fWbhH2iwnw4jxDju91GzJN9vt
         /elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380886; x=1791985686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=66JT1rBrkI19wCOUvWF3hh5nZVukFj+pub4uCRhpi4Y=;
        b=cwzenxhgeGBV3oEu22n7XnZHikH/tHBzFY/xYlSr2kb9l2te7bTaF7gOX59/3n+2Fh
         3HatCUgc0jLGSVDoN5TluEbBOzeXXFVk/g429OJmu7Y6C+PsOXDX7y8f+BFUphnntvE4
         OQuxeELOIX61QHutWVswTgyixsRXMBWe5mFjRkteTmc5sw4/c0bhL1ZFztc/kg00MWrX
         98152BD9GezHHhu2FmtMlhMt2TIBeVZCg9AzGnBn8bW/xQ7czbLMY72CTTXIMI203S/f
         Eg4/ixRycJDoVzdjdZlfRHZrT7L/HL3U88azXs1uJ+tTzrf5xEpO3mgqu+P5leO4JAbL
         GloA==
X-Forwarded-Encrypted: i=1; AKwUvBz/pXaaMNo4aEuOF9GcJOHHQ373oI4TwG4/Ayax7g4P92wX1gPvZwq457cuPhMfILo9K6khyjZIYBp9LiymyvxLHjMb@vger.kernel.org
X-Gm-Message-State: AFq9FYIldx0R79fj99faWhcgyTpadElo2Z0qnAoHFpGa8Y6AOd057yH+
	/GoFULY74poP5hI9sZFsOUeAUVFUFJXXvi1ite5sgm86MAbLtN7ipB/2
X-Gm-Gg: AYBFou2U4LXe80oLIvm2pMvyYizl+6OHNH5kQNtxogFb/73OtkHKgHQGzdoeq6133/O
	WCYBUyLmTSO7vcr5wdnsB0Dwwe5ylDHdoOGZRj/2wkWJabz0JeFeeo2LeNZq/WJRr5avNKNqzvg
	Ck2bmz98bUZlHAxsZAlXR9BxB98C0YtlXHm7hKvOjsWYgyXi2Kwki1AbStqCx0Ju4vRei1uU6zq
	kd0Ga6WROVdUI3zz834Z25LdonPhxkSrlX035RArSY3zf+4AIGA0qQIWOn1WVActmrbHWZx0sHg
	eU9yG3JrCf1mU92LZs10i5gtOb5aituvpZVgW41p01c/r1y6u2BobXu+kBqFOtZZzBhz35s/bdL
	awn2oFShKTld1nIsWw9jsmK1/d30XE1/eBQwc6kBQrDU0LpV6Ku7rOBebj8UZ9AGdERqhVrVFEe
	e2G4nfzDgM54OcLGiWBKbO0dtl6IH4hsbx+J/MtuC2LS3izyo/UTe5fx+37B1Z9hQ51mIr9d4fJ
	eKPfv+dCFM42u15geewoskvpm0oZI9Y24ji
X-Received: by 2002:a05:7301:107:b0:351:2554:7eb3 with SMTP id 5a478bee46e88-3515dd33106mr2650057eec.7.1791380885967;
        Wed, 07 Oct 2026 06:48:05 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:05 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 7/9] platform/x86: hp-bioscfg: validate SPM state returned by firmware
Date: Wed,  7 Oct 2026 18:47:09 +0500
Message-ID: <20261007134711.473857-8-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

status_show() indexes the 3-entry spm_state_types[] with the state byte
returned by firmware. update_spm_state() stores the same byte, which
key_mechanism_show() uses to index the 3-entry spm_mechanism_types[].
Neither is range checked, so a state above 2 makes the world-readable
status and key_mechanism files print a string from a pointer read past
the array.

Return -EIO for an out of range state.

Compile tested only.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 2d4a3720f80c..25477ecf8822 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2022 HP Development Company, L.P.
  */
 
+#include <linux/array_size.h>
 #include "bioscfg.h"
 
 static const char * const spm_state_types[] = {
@@ -118,6 +119,9 @@ static ssize_t update_spm_state(void)
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_mechanism_types))
+		return -EIO;
+
 	bioscfg_drv.spm_data.mechanism = data.state;
 	if (bioscfg_drv.spm_data.mechanism)
 		bioscfg_drv.spm_data.is_enabled = 1;
@@ -153,6 +157,9 @@ static ssize_t status_show(struct kobject *kobj, struct kobj_attribute
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_state_types))
+		return -EIO;
+
 	/*
 	 * 'status' is a read-only file that returns ASCII text in
 	 * JSON format reporting the status information.
-- 
2.55.0

