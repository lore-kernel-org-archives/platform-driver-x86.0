Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED81B320CA7
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358282; cv=none; b=L7H80UDbViKy+nPeT1FCIZTETGway8pt4J249JjW/ZVqmIBcv0268chuW6RGILFWM86Osxgeef1SjBo4uNHYE9pZN2NWelhYE4kxVbP9XQFkpyq4B5ZU7PSPbkaUKsGGuLUlvxcDthRR2iongt3zxb8IS66ZKXWtCY33scdjjzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358282; c=relaxed/simple;
	bh=grk85sjF01n32HUEeHZMfrtFgSo/JagXsKYG9XfD330=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYKcdKbfKaCwI/SO0qHwhQTWbXn43t0DjcF86i0preygIRfawuqYkOxs207M0Isy9MGq5rN+R1F3vcg/Kl7XZY/4J3GKKq0o9SVUvE1eHXBAnXggalRAuXt69mub1yvCJDWGCZim6juz+rjylxanT/OVW03rBt1II4hkGD62Uiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cu89J4G7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cu89J4G7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47118259fd8so50822585e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Nov 2025 07:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762358279; x=1762963079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7/JvpBa71JfOtKidEFviFOI29HJTQ4dpKTrEsM/LHQ=;
        b=cu89J4G7KVjSaecOcu/O8omJFtDGcPNsmtv6kEROvubIGH5Z6rHyfcz6XCYlhmGA+P
         OXaULNG82WyxFY+eWNItSwTZOkI4Y111vgH+FpvgiZatU0mtKUo4pkvkP/8oQp4uqKi8
         I65ibeexcCKV57mGGwwXbXZCV8Y4/rgL9JdCxWdMnFj76bHMtKy3n0F+YuDWWNfwWl36
         NP+/zDroJk2jIZiWLHKuXoW8/+WMZjwC5vECr88pjzx10Og+3gH2X01P6253yxggatqJ
         hrtukIAvsIpKIpRZJ0FvP57/3D766mvWhUyiN8QvaHblW47fzwaI9TwbJDjbbFV45DuL
         CFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358279; x=1762963079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7/JvpBa71JfOtKidEFviFOI29HJTQ4dpKTrEsM/LHQ=;
        b=mnhuZ/BSNwvGiODNa9RpLd3ZjPWb/fMW6BbUi6nKLvnZ32iNlUBW6buV0PREoxph3n
         I9aOGgOt3b3qi2r3ATr5icgWecjFd/cniFSVE216Png18hSMY2F6tqGmFguSrpwyIz17
         nlYswCC64bGXlklmSIMqQw6CPbhdI9c4wbAJoxvkhfBqwBtIfDhyKvcAPDCucPrDAsUI
         8NatjISK1uzY+ze8h+ez/05zZxxSSjIhaygjzDDJy5dV2/Y08WUWpwjl84cPHHL6e9vD
         lkCta4ulr1SPAmbcSBvATBaIeXeME3c3PnSeByCIyJal+GBeI6LtShOHefgW1OhB4fMj
         GGAA==
X-Forwarded-Encrypted: i=1; AJvYcCWJuUPMvMEevUDuuXCF1Lbk8BQIpxFtiK2VAxHHwtnTIejAntRfZW6iBHqTbDmjAR1llWS4EcU2txuXvs93nYuE9Nd5@vger.kernel.org
X-Gm-Message-State: AOJu0YznCcWCUnFXqnAZbZqdIqEgSZ0dY4F4QFFcsTHkSQBjNyQ13IDl
	e0ym/2GCEg1AGf7OuDIDC5n8Vdl0l8rxt96GcaEgufKE2JuZ0GTEMH9MCGTH7GtMagU=
X-Gm-Gg: ASbGnctKenRdubbHvGAVaSCKCxMSZkAPo8FA7y9djlt2IiqTmisHqLhP+gfSK9SH3PG
	g6rSOtS6TNdYSy9z5I456APq2A66On5yf2Ik6UCZ4kJ0dNbCrlms6pQ1neP3t7mQrUK5v3RYL1h
	bY/0SIA/gI+5+3QlWRm2aFH4klaLOrQ6UH56htvX3QbAiayjtmrK9SOFqyv/nxz6tZCIn8e0Aum
	eXewsy6aFUo3/mQB1L6K1yTNElTU3ioIIaPNkI7VaP8tcBHFWto0JFYKj5B8LsZnRTYdQjfoMhd
	v3Fs+Yisc2kR24hMmsvvCs6h0vK3bkEq39k05+/YJNfIXXhk30cm+WjzQ5Q6A8L5D6xo5Fx4hyR
	BGOlTf/GcJtsc8IBB6lBK3HJZnFGENwqNP8YQgYHCrvAHiYsUMBK5/qmJYZoeWu+7AJ1nReQQlJ
	+jLIQsQMasjs0hdNOyPFYOAsb1qCICOFHypg==
X-Google-Smtp-Source: AGHT+IHo7HnClSy+Sn9IiiLMeR93GNnuA4NgdJUp4IkSAPro5gqZR0uQLn2I+AtxyZHtt51f9TXbQg==
X-Received: by 2002:a05:600c:5488:b0:475:dac3:69a2 with SMTP id 5b1f17b1804b1-4775ce164c5mr32789045e9.27.1762358279231;
        Wed, 05 Nov 2025 07:57:59 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc2d14sm55567045e9.1.2025.11.05.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:57:58 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 2/2] platform: x86: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 16:57:36 +0100
Message-ID: <20251105155742.293326-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105155742.293326-1-marco.crivellari@suse.com>
References: <20251105155742.293326-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Replace system_wq with system_percpu_wq, keeping the same behavior.
The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
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

