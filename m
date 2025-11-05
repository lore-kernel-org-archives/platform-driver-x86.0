Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168BA32E74B
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358282; cv=none; b=stYXRRMQzd1bIddjbcDOiRt3TayhHdmGp7BzF7eVvi1ZhTxpKJrW3H0GZdElhf31qnUDzXwvKfkkwWsNu2u93hof4zW6kma9kbZAlMySC0lbTRfsoeDTMAcFOZbZ4GWCOBhMMmc0zWJHXNycUSsvq5Tut6qY7Qji21M78t9siJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358282; c=relaxed/simple;
	bh=0juMyDMRUXKUaPALyDvOumxXmXJXFGZjKJfB24N29Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoGZdGRlRHkwyQbWP/siZMrNBiE4mdijNA+N1c4A/XxUsLnu4XIWDOxizIJ3CWJzrye61HRzaDYCA6zgJ1sP4FYkm1XyDBiXtMYtdIeIFyMD4iyVqmTc5q7x8xPCkZq4zyw/bMYzpKEI4wW1EY2f+2w8Uk2YpDh9miuNh3U+kBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VTLsx2t6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VTLsx2t6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so1105195e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Nov 2025 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762358278; x=1762963078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjaDKV9LCQmWEfoKcz3mnBs+RpSagfYrbdY3gsz2Kew=;
        b=VTLsx2t6s+zH9HONiaR0NYX9F7mI34dz9yxpqaGF76pCpi4b8Qg6NBL8W/lVmDQaVn
         692zhEusRy360woolElvu5Zi36NGpm1yJkPBp0pEv7C/Vp3Iqm+c/CJUp4f5EtbK/Ha9
         ZRTZpMo0+O0KJaYye2WpRgqDmy5bP9VwsCdgn7I6zboMQ4WHqFsOg1XDAdjX4e0/5god
         1GZxWrMOMzz+xr5yetn9O25DAXROzZbRkazFvrVqVf4psxyX/rNPq4l9k3uj6PrgKuBa
         r3mo/02Q5KTDbbOwPuXrjYGNCHZczAHhS37bZH1ax0wIbPro32Ws7YhHAmmHSGS/nGkI
         /4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358278; x=1762963078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjaDKV9LCQmWEfoKcz3mnBs+RpSagfYrbdY3gsz2Kew=;
        b=OMZKHrnLAvgq8cfIWpkW+9y6IaglhvJ+QcBWKi0eshUk/1zP+fR21NAWTja+PIDvWu
         rkhLkS0UqPW581L+mTfheKOLRqw6m0VeB9hqbcfH2khkdCi7JEakZAxPvDm4LFFuJQzq
         RTutKDCzWrEwDiZnyXvkAAbpU397drEl8S7holYqos/qo8cClXv69deAgVJeOgBmbISm
         VzgVK/P5rzctHId+Z+0e36MKh1OEkI6Q/HjD7q4DcWjEmcz2WIlGDuecwBBWEH1MHmwU
         BYW3TUf0g6LCOp/sioKEfGVkElclBxMDMvlm/mJ3JriRcz5tuRheBpW6CLg2ss0FOtGE
         SNZA==
X-Forwarded-Encrypted: i=1; AJvYcCUOn0ELou4lGHblXNJ3Yq3Eb5AlZKjf6YPoSZZXrtrfJOxbBqUsIREhH7a5o6LFOIVSUkGIECSKqddP2+nuJ9LXsbf/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyMa9jyTeIdHPnZOINp/1jqfs/VOU/KdmtRMQOA4QtFUOogcw
	H8PSqrRo//puOXgYkR2jDvdyTrPm9Cxp334IWLDGyyNOvKlTil28ibDLrXoI89jnPinO1B/5iQX
	fZ3OM
X-Gm-Gg: ASbGncsR4auuNRxfBz0hM95StCbESCDVDy6nCLjOIelEBVkKFFiohdnYCVt+Nd/SQii
	s/o/+RUBYsk3oLg0etVwy0TgLw5IwkuE85aLz8PtsNEM8AdE+uvlLC8wS51K48kRHeDsThK4ViE
	ObmJEnSgJqtTdb+yyWc2nMyKZOgX4vhyhRwljHmQK8Rnvit8vBd5PnzYOqVdPUSuA1Er35LGh5g
	lj36tnJuSH8xW2MURUkdxZZRD4PxpIMgXRC/o9k5+yoFP78Kng7Gfc0P1x39ckk7YWWGRxDXwgj
	3D0A63jhqKga2bw03O3I0ux0kQcWYDwNCbgUTr7ACx0JXNhQFAYw9+LFQQPpYHG+pZIEe7YPf1A
	NGuadi2c+RputdOSnzzNofgrRNqWi/hjts9RMuS13gc+HbeNCZthVDxM3klWwMgno3NjNKTDIOv
	9R3s5gSrFl8gyvr7ZeoyMrm+x7oO3sm+kmUw==
X-Google-Smtp-Source: AGHT+IFmHmXfTRK5ZoJhOa+eElcl7UkfXFONMs9IfbNmfXHDnWFTChL/HrvqCSssLTLQgY2Gg0zfEQ==
X-Received: by 2002:a05:600c:821b:b0:471:b5d:2db9 with SMTP id 5b1f17b1804b1-4775cdf26edmr38095045e9.21.1762358278377;
        Wed, 05 Nov 2025 07:57:58 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc2d14sm55567045e9.1.2025.11.05.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:57:57 -0800 (PST)
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
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 1/2] platform: surface: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 16:57:35 +0100
Message-ID: <20251105155742.293326-2-marco.crivellari@suse.com>
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

CC: Maximilian Luz <luzmaximilian@gmail.com>
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
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

