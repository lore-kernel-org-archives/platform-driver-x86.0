Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978F333756
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254506; cv=none; b=nlgKv/ANn7f9//c4SOOFYJcccxKlJ5TWaXaeDkliMSrWGTP8JKigxsG0Y2JJDSWkZef5KRvwecwMf5cQqAJZ3Ojj3CdGVdYCzgPCyV9tRRtebv1D9vMVVNo9F9X0B1YBztKdRFVckL1O2p1MmgmxfjsFdn7rWlHb1ItRa0I+veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254506; c=relaxed/simple;
	bh=a05l+xjPnkH2tclAOQRwbLGIvzoRBjJJTyLWxQjwHaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzOC7rVg3dDmH0z0DN2+XBW+gLkdTkiBZnyN3fYFk3lTVpm4FPei0mKBGj6Oqtp3UxPsFraCY2ZwoUwOHxCS2F9WB089LzyZwSfQTZ9PVD2q8OvtzsEArrJCsCp4CrnEW+PsRN7c3JmvhB7LuSqtcVzIVCrRW8FoGgnUDosN3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e7bk+74r; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e7bk+74r"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477770019e4so7056455e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 06:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764254502; x=1764859302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8zESVUEAodlwzxoOWrKR7D4lrz2pYYL4sJuFsgHQDc=;
        b=e7bk+74rBxFWwOxhjhXNcVj1T+Q8GMdJkUaKcIU5Vzu8uqDS4MWZ6+qPP0gNahY5i3
         Dpt6yarFW19a8KPBUMrd7Z01DNfcrme3RVm7xjImIHhZd8OOLExdcitOSutpLBbI7Rr/
         fznQgnI58ukwlK3Geq1Xa9lwXcBpNOro3+pzKFTdpDhADhJzjUYppdEAklvcsGH6MiQQ
         WAILRh9HqJW2wGVuBLds5lScw9HAQhh1LUh8AC0M6tI6C+wIqmBAfFo92f715g63clV0
         oYbZ11+wTlCuNNYkv3HxvTNDj4doZV6ulYOKVK3Kt+RmcpiFXMM+9f5kQs+YC5jRM6XJ
         y1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254502; x=1764859302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G8zESVUEAodlwzxoOWrKR7D4lrz2pYYL4sJuFsgHQDc=;
        b=KJQgDekTk10ZsFfTcumMQDpXsi/SUSTwjX9lzZLLSJeV0YYxcoxqaIkTwHa/m6VX5Z
         FuiA3+zijJCUVMu2kQ9bFkO2I5v8xWR4x0gOTf2gIeemzRTZRCS8fv41WBbbTnnlbM1l
         UH0dLGBxSWPVaw9EXlML0ad2iJf4CGp2VJc37H29/rOE2iPvzMHF6lt+w7SPXKVChqAd
         cLdIWVFiW5MQwPL6Pj3BGX9aF5/Nqb0pSAe8iFqcflfFII7jLUPa0liVQZSLcXoCUhk3
         aWucRne4Bn5iUGGGdbi2e3AiJ+YRitekpYyko7CGBPziOsNuW2PpybTeOKgodFRNZBrQ
         iI/w==
X-Forwarded-Encrypted: i=1; AJvYcCVqAqc+bHSIWuBdYPxrngZccBfLkVb+8+AjmRGgNLSoTF7BSYOr+xpjpewOG2lJjXUNff7qxJasbkIXq5N6d3rrJmLU@vger.kernel.org
X-Gm-Message-State: AOJu0YylELBwW3c8T9XyTA3hyiP4EryIZr6IWzxqMI9ao2Tu4nUdT4ci
	tBkl+X3RkeAxPaCbUShJS9dspAYJAErVb+wP27/OM3xHxdWlAZ94bM6UkNmkkfktTK4=
X-Gm-Gg: ASbGncuL5CgJGI6cRqyXdoE0/iHoapGaE/XKdK08oyRi2DhJO8mak8Ddgm5yuxEvIfh
	iBT8t6um2Rl826V9rHga+t19ihoQLdgcAKZ6DUGCDGokxsTnPSMEGPkHJLBdhcT+lCHDEQ2fRXU
	ghinFLqOlpDbb8DVaPTbeSnIRWjfuuCOp+pqO/37Sdumas+ziMTgKGU0ElRKAsjlJ/PBo7QMVUn
	EMj3ea+/ot+C28Qji0ZifR/TSIX8fj1u0hlwrTpTmAb65+3/sYBcHJ/13cRyq7gVgfiST/9615T
	YX2gEfZDX/vo14oJJHTm3T6kOJUCr1++GzJXdMMC+hAuxwamfWgyxrvt1CsFIs/hGY/s2wJ1M03
	NH9VdwsY9IFvX6F9dddV5XbGNnOFeSJiSTAa/h5T4qZ95HUlo27G03HB/4gUidPy0PQtPoGTlGx
	+/NOZTjRHZRJPT49QyASxnd68vOzzf9WNzTQ==
X-Google-Smtp-Source: AGHT+IHhiLO3LNoW9TfkmFdBrPy/+jNq9NtcOJURTcSkG24LQE5dIfyVQSe1Sq163XuRQytFHVPHBA==
X-Received: by 2002:a05:600c:1c27:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47904b2bfd9mr114591805e9.30.1764254501890;
        Thu, 27 Nov 2025 06:41:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm37351465e9.0.2025.11.27.06.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 06:41:41 -0800 (PST)
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
Subject: [PATCH v2 1/3] platform/surface: acpi-notify: add WQ_PERCPU to alloc_workqueue users
Date: Thu, 27 Nov 2025 15:41:23 +0100
Message-ID: <20251127144125.233728-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251127144125.233728-1-marco.crivellari@suse.com>
References: <20251127144125.233728-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
---
 drivers/platform/surface/surface_acpi_notify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 3b30cfe3466b..a9dcb0bbe90e 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -862,7 +862,7 @@ static int __init san_init(void)
 {
 	int ret;
 
-	san_wq = alloc_workqueue("san_wq", 0, 0);
+	san_wq = alloc_workqueue("san_wq", WQ_PERCPU, 0);
 	if (!san_wq)
 		return -ENOMEM;
 	ret = platform_driver_register(&surface_acpi_notify);
-- 
2.51.1

