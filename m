Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D41E332EDD
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 14:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254507; cv=none; b=I/8ilmyIDejJbnn7kriZJMCHansMTXHpj/cTnvFjCBs/RdKG7bNC7AFmoZagMTLgnPc7fifZR+I1KVzI+1AKHnHFQteIBQIj/BTo5t8RFHx0p/xVUtXgpJ5XD4eQUkxzaukimNbixxIcYAWpgamsHkc9pjrOuLqodupv/ggd4No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254507; c=relaxed/simple;
	bh=DGTGbzKydnekt3uJ/EMCQTdJL8P7EFEqykjlAHEO0+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5qC0Oa0MMwGr3fjSd2DCalZ5VPlPSpTDefNcEZJYyogdq+6d1uPxehbER6QVZBSgnMut9aEvqxyMtFrNhS0AETXNf+4rREF5kIB+gsU1VK9TmEw2Lnn0TvjMggiDI13tpW5VuUKhNrF4QsQbjNLk6Y5zS0QE2jWmehKAaGSVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q84GUErY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q84GUErY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so6305385e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 06:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764254503; x=1764859303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFTw99QutH3DAHx7lo41dcD9dNbkV9nNUON1QxtxjDE=;
        b=Q84GUErYgu8ixEvRMR0nYtWZ1zxLk/Rt115b0CaIxrqoEl6Wv9/WEOVoIAlAorKF5v
         mX5Wi0W25X0/LTMeHY7q1AY1z4NEnrjc4nAqWKeOZCbdzyx2cq3/hwQ9YoQIY1YSF42o
         qLF1Gf9sQMcVXU+x/LmbNfilLp/HOaTANN4P9IlwUrsiThCfKaVEIYWaciCECgsb3MeT
         ggHFBUGGllje7Khy0OqsrGJdl7KQA9BUFJEEpGA6x+ObmW0bkG3+49sEvScQHVo+oW1d
         lGU9/W1qxP6vYHjewqrq9VnO6PcWVbeYYpiR1ZaLA9lkLlDLLHLNs8N/4uFWgdVJpaVa
         sEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254503; x=1764859303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFTw99QutH3DAHx7lo41dcD9dNbkV9nNUON1QxtxjDE=;
        b=nklNDYiDd2qec3IEZq6CydTHm6PzvFzYJj7+K/bbZMj1dZ1BmstRJdPCX2qQJtsw/Z
         Oaq+Rw66D1fvbyfq74iJbEDVNWfZUYaojHrnr7hBhLLo80GpX8Yy5zZpGveeL4qiLyiE
         /jqIFZ/ury7yu0PMh7EK/1eSWjpQjTEflA2PN6VrVu3P/PkYAcYlJVe2E4STgnmWC+jj
         d5kJ+GBlDXHk24GzgzY9EIc8L72f6SXQPDNw1aBvXQJwtHyAG7kc5bSd1cF2PSVKOi8j
         RdcgRqczXzYfsKmdZr53kVMkkKujVC+kwG2SeiNaVfX6xeq5lGZ51aHIm+5Kp3xQ8lTn
         IL9g==
X-Forwarded-Encrypted: i=1; AJvYcCX81QQW3tK49fhJpZ3awrOw9PEin025h0QK60DnjOk/DuUOOYbJfSjgc0WG0HVCiXyPL10GsTaute3X4peqh4uL10/5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Whv6U04mawZ077bTIY63Ib7bJ3RzWKMfEhhxi9yHFpWpR4kh
	wVq+pPn6+pxeqC0DLZW1ocP5wvCetQsyzFfQ/uz1fOuvJq0j2kEkSTXBwsc7zwt8H70=
X-Gm-Gg: ASbGnctnNGw+l7M4ooaXPpV3mUYNgwDNO3LXslY/cNAyIerqK2dI5ppvaLZ1J6fm/8d
	jX6KgPsd0Pawoj4vzZ8Prdm6xbhNO5QnOUjKkVTsuWM6pDEGjzwDczVlGOz//2flUoYoUWCzpom
	MeGtWuJgH6xhZv/5EyIsXXmoE1Y0jZRbuPM6ijPmxsrjLk9x/JyFxuCN/ApK6kKJ9rKWr0PqnhU
	1jMUJVrrsLQocisIL9AuCppxSM/Nyvb1AO9OLXbf27BebVJr9pn90txzzJA/EP/o9+QBMJBN08m
	TPHxtR5dDnEd7xGzfZMmEB4Kb66vokhQZwFUxMjaEfcFD82pkfxtD2H5Stf6Xyh4JKmY+ziId1Z
	f0yk58GCptmiVBDiqIaUhrx741C3dQo/t1JEFSJ//14NjFF+YNb2kbH9lGz1Yx1Pw0EUTTX0d3w
	fC/3TscoiDnryU578eKaXVLdnaGcOQWCvMIniKoVVM072a
X-Google-Smtp-Source: AGHT+IEoav5mPX67GfE3cqAErw5RFXLYdv6KEIdh54PkbMtNJOQdLCLrtOH8pJr2AIJGwUIf7TFRrQ==
X-Received: by 2002:a05:600c:470a:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-477c10d49b5mr201413185e9.10.1764254502871;
        Thu, 27 Nov 2025 06:41:42 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm37351465e9.0.2025.11.27.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 06:41:42 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 2/3] platform: x86: replace use of system_wq with system_percpu_wq
Date: Thu, 27 Nov 2025 15:41:24 +0100
Message-ID: <20251127144125.233728-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127144125.233728-1-marco.crivellari@suse.com>
References: <20251127144125.233728-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
---
 drivers/platform/x86/gpd-pocket-fan.c                      | 4 ++--
 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index 7a20f68ae206..c9236738f896 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -112,14 +112,14 @@ static void gpd_pocket_fan_worker(struct work_struct *work)
 	gpd_pocket_fan_set_speed(fan, speed);
 
 	/* When mostly idle (low temp/speed), slow down the poll interval. */
-	queue_delayed_work(system_wq, &fan->work,
+	queue_delayed_work(system_percpu_wq, &fan->work,
 			   msecs_to_jiffies(4000 / (speed + 1)));
 }
 
 static void gpd_pocket_fan_force_update(struct gpd_pocket_fan_data *fan)
 {
 	fan->last_speed = -1;
-	mod_delayed_work(system_wq, &fan->work, 0);
+	mod_delayed_work(system_percpu_wq, &fan->work, 0);
 }
 
 static int gpd_pocket_fan_probe(struct platform_device *pdev)
diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
index 2f8cd8d9e0ab..ebbedfe5f4e8 100644
--- a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
+++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
@@ -183,7 +183,7 @@ static void atla10_ec_external_power_changed(struct power_supply *psy)
 	struct atla10_ec_data *data = power_supply_get_drvdata(psy);
 
 	/* After charger plug in/out wait 0.5s for things to stabilize */
-	mod_delayed_work(system_wq, &data->work, HZ / 2);
+	mod_delayed_work(system_percpu_wq, &data->work, HZ / 2);
 }
 
 static const enum power_supply_property atla10_ec_psy_props[] = {
-- 
2.51.1

