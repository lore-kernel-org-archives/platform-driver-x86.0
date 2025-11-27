Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D23126AF
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254508; cv=none; b=olK+AGxIRedxy6uMrNczygbi4CmRNZI1ZvzYrT46qP5jx/YrwFEbdPI3f+VA7IPQfmqPcJNvzyxKTwXWJmxFwmNnrNQBspYVGSFsdhvS18E3Rw4dIrt3UQkn0ZBsv3n1y5/B2A62G5wXXsa7P6iV0gDv5BTutO2bSG8exW4oJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254508; c=relaxed/simple;
	bh=LPEPMnco5Xm8MILGkRvk/pMSNneneSPfuGpd3/HN5VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Amsx+nn85D61UmyDLYtU9oJFxX2/YnqbtIMb79HnyWjge7As4OJ4CFRKzvBpPZpo7m5f7xlVvd7mTeedSzCzmnjgAJk7qtosA0RWXK7wLg+VoyzHSaU7we3yhvun+yJ5phOpSSYpRKGC+WeKOpz+tuh322SBUslHIpoieKAFfk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XeRdmx7s; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XeRdmx7s"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so8773075e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764254504; x=1764859304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5QhYCMIe8+tnJfC8W7qm9EkL8jbmR0b4KbpIadX0+A=;
        b=XeRdmx7sIl7BlR3rJjPd281XAbFENcmAlstHl4GrtLYcE9gk+5v4q5Czc1ENqWWd4a
         bK6RXNEQ0pGGH6cELM+FIBivpAEaEI70DHKAAu30vky1J91E4DRjqW2OcUuxk/SjYk+V
         /Uanuv9RnEpKuy93AnUyQ6L3/seyynD+k+a7DMWP9EUElqcz9eVnpSzuCqnG1j8VFbVx
         ZXJsIMXGWJj+vRBtDScuZh5lpyI28vhwua5x3crhmAuwix+Qc/aKHuswgNYrwsBv6Lc/
         gB0wgwdtDtwPApt+2kVYeU30p2wH2DbH4/tcGco+rrj3nUN+MDUbwWRXy3IUPaSNb18m
         5thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254504; x=1764859304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5QhYCMIe8+tnJfC8W7qm9EkL8jbmR0b4KbpIadX0+A=;
        b=NQIMG/SlMRjMVJM0DGAYdF9aTKkJJ23Smz5ABgLkv+DgbH7w9d4Aj4yHB5FjpotGHf
         FppKMhdy51Ys6ARvd9BtJhO2VPUf5n43amRkKji4aVbifD6m4jXhxXgARsnpmaL2bGY1
         oYmseYHM2SyCfEJS4xPFWDXQDLhal7G0I9/bPQBGqMuooeGmeZBi29lk/00cbmR8dnjH
         kWMukaxIMBBQLymU6pJsJtmxJv2eZ1wJAWyyN9QnKIF+YsKBax3ZCa6Hp001R7sHSRcC
         6dg0SKWYaU/HJDnOnMtIm+RnzuOmPyVqmOnjXN8GztdkZoRRIC1fa+tjdTcGGfTB2hS+
         7u+w==
X-Forwarded-Encrypted: i=1; AJvYcCWwhfC30Gjv4QE17WZ4G0kQwmAbEyU4ZxxwaZZZWfMe9sc2BCv6NfmGlgq94fhWhfZSqEsgf0AdAUmo4BLlprk2QpVs@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOdXBgOiikPdbJKPNZ44SFio4KMOtojv1LblG8q0pGp42zVL8
	rj1+TN988QM5+D8lbnsAYBpjutZ76CuVEKG94RKaUYn6FjS8arPMmOvJaz0bDdXKFEE=
X-Gm-Gg: ASbGncvMQbsDjE/kWYU8JOOI9K0EYxGtrSm1SqCGYnm2zzXWddoqQjALEWc5YUwN/3c
	unZeCqVNkSCQ8lTq2UVsJqf2uv3NHlgQZQnqA2vyldCaq5yhUoHckoqtO6KPJAvOwA/t7+jBSTL
	o95HY2qTtQ4x3d/AgBX33QHvm5NrQOwtL1hfH5m9cclSCUXbkEmdek7Gb6++dOJdSuPKaXrPnzN
	d4tdacrf7wZk/zY/xqgGhCX+z+jK0a6GSGF9yhKFFNGdw4DkdyP/4e4pJeeqTqWjW1Svt1wrnF7
	NUfCe3OhGijDVy3B/5+kN4QtbO66xncHs9tIht5cHPrIqwcMgcu7V70urPQUlZUGVHiXbHY6azO
	I9bcCMCoVK91mPtIunSVSkoXbBEFn2lsRUaQdxoCeyqZ6+swPdDfx4jaKzelB5igDFxPSOKnrf2
	Pgmg+nrNoaLuezmkaTmp54smQmoMuFDMwuCPPINQ2mIwaP
X-Google-Smtp-Source: AGHT+IFYY06oLJ7g09W/M0ZrcXobhxX7T2QvNS6KAiC9yahbr2Fz/AYikghcO3j3I6L3pA0iEav/7w==
X-Received: by 2002:a05:600c:19ce:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-477c115dfaamr213338575e9.33.1764254503891;
        Thu, 27 Nov 2025 06:41:43 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm37351465e9.0.2025.11.27.06.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 06:41:43 -0800 (PST)
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
Subject: [PATCH v2 3/3] platform: surface: replace use of system_wq with system_percpu_wq
Date: Thu, 27 Nov 2025 15:41:25 +0100
Message-ID: <20251127144125.233728-4-marco.crivellari@suse.com>
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
 drivers/platform/surface/aggregator/ssh_packet_layer.c  | 2 +-
 drivers/platform/surface/aggregator/ssh_request_layer.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
index 6081b0146d5f..3dd22856570f 100644
--- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
@@ -671,7 +671,7 @@ static void ssh_ptl_timeout_reaper_mod(struct ssh_ptl *ptl, ktime_t now,
 	/* Re-adjust / schedule reaper only if it is above resolution delta. */
 	if (ktime_before(aexp, ptl->rtx_timeout.expires)) {
 		ptl->rtx_timeout.expires = expires;
-		mod_delayed_work(system_wq, &ptl->rtx_timeout.reaper, delta);
+		mod_delayed_work(system_percpu_wq, &ptl->rtx_timeout.reaper, delta);
 	}
 
 	spin_unlock(&ptl->rtx_timeout.lock);
diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
index 879ca9ee7ff6..a356e4956562 100644
--- a/drivers/platform/surface/aggregator/ssh_request_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
@@ -434,7 +434,7 @@ static void ssh_rtl_timeout_reaper_mod(struct ssh_rtl *rtl, ktime_t now,
 	/* Re-adjust / schedule reaper only if it is above resolution delta. */
 	if (ktime_before(aexp, rtl->rtx_timeout.expires)) {
 		rtl->rtx_timeout.expires = expires;
-		mod_delayed_work(system_wq, &rtl->rtx_timeout.reaper, delta);
+		mod_delayed_work(system_percpu_wq, &rtl->rtx_timeout.reaper, delta);
 	}
 
 	spin_unlock(&rtl->rtx_timeout.lock);
-- 
2.51.1

