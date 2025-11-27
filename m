Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF0332EA9
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254507; cv=none; b=ltD+oqLO2GW5WQJYt3CfzmUgEX/kdMNojXQArfkcA8Mu+b2mpjtYgvBue2ncRBKMNgQDN045U+eTANJ8LVVoN6HBa15BQCikek5k2Ix36aldZOupeWVrtzMKByltlySJiGb3oW/hsnD4LAAq9NqVsoL/UwLUin1Ek8g1FauUOs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254507; c=relaxed/simple;
	bh=fp8fJaH/S4eemvnH4IIiiRO/rDdKrRSwNKV9/9UQC6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A1B4sWJEc3Qltkha/hsx/D4Vj2KjCjzL2FsNwQwvGS1hOzJ3Dcs5Q+YkAGdwy1i6p+nH8KVsry6gHDQxajqGpYa1M/jbL7Yu+Rt7eqI6qmpG5PPv3gK45Yo8TbgsgPK+lB2cBx16bN32qPmEscCOK8m9QcIRmCzNLajkp7g2zN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WoKJNS0H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WoKJNS0H"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so6280635e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 06:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764254501; x=1764859301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbReJ0EvXPZrRpznLXAARfC0SWI3B7F/L1qITHzPJTg=;
        b=WoKJNS0Hjr39ogiEurU+GbM/I/vYBW4aY86LFZ3XQvPT5jZ9BdN5BRLny03h9Pk/6l
         BQJVV/POVtF9f29lRKjmZfI6bt/fEVDCx/FrWNepoMGuQd8Ixsv9qLdMnHkmkcFGu4dY
         8IvaCc8F4VZIItEk5N1fl0lprEdZpMl73cIWr98pHgs9LhU3Dk4a99yylTzCCdQHzOgv
         5oFGakF+TpobkMtYz/4iQNAzpETU4/ViThYjqFwMViKX2399dPtflLP+mwf4pBn3XQkK
         SMK9zyKCNyl6lLQc3ZQgLT/pcFfV5paLDrYF6z2Ajn/scIo8k7MSvgpaB6jw8huQSLVZ
         Wb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254501; x=1764859301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbReJ0EvXPZrRpznLXAARfC0SWI3B7F/L1qITHzPJTg=;
        b=fi7shFymbm+37sZfoeAurK7/ZMh5JrnPvKX7rZJKV60uCtXsao66x1g7fnkxuvmS1F
         6MceTGEUH68uRtnCN6T3QuJ4eiusMurvCQpUitlq19qIjT38kVMhycOU5fboLCOVjM3Y
         h/G0Dm0piKZMU7dmtQA1nFMNo2LzFxlWAL3gktlVLNIIoiiafw/BoFWC8ebRyayz582B
         L34fNPYwzyBlsv5sftjF+StqOpTgxMjLHwkHLg8MQJALINoCha4xEdDRrQ3jQUCFUt4h
         6KMeYZk8nzUrsB1To1SMV+GTxsRvjf5Goo8cjdrBRSoT8os8aUWUz52VhdhEwgE5uHhG
         aMVw==
X-Forwarded-Encrypted: i=1; AJvYcCVz6oVMxnDCeATssSv4whjvDSTZroPzGXP9iw7E88gYietrv8sunETQS+bRdvJ/ByeWinwLdCjV7UPDhtqdBPRjcmuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzqWTi0Xvm4BkJkCeeIozGEN69aLzFoM+9OUFWPXRZd3OWv/0VY
	PLPZ1pr7T+jOwyLJ1R8CbqWFeOXcu2GtPyL9guvJjuHjRKz30aAGuEK8mEzwKMHUaFs=
X-Gm-Gg: ASbGncv+yfrN9csrmQehpyVchv+82cDlte/uFgADB269J36fUnDSJ5bhSFEShjuorhJ
	nRRTVCBXVa8P/9K3lM8T5dWaaXQzONNMqzv1pxFd0u/k7rGG0oCfamV+OmCgUOn3pVj9a9mj2J+
	SLV+GklpLatGFpg0Yb2kaSYn4Ax3yf/uUKiQHId5poqjDfrBZ6gQrwqLqX2b8/lQEdmLrYZnZNT
	Y8ObIwqweG1XofBOoeVE9MBJChF6Pw5wqm7awrFVJBosuG2sgnE9NVtf6MG3Vu+T2Ezsvm9GS9d
	TWCoi8DMn3GbkFzCxfZbFaCJwGLIPxYaLPti1bUQfLkRNvABZ7wrd+yRqPocLQPtH96QausY3qc
	/ruPtaykkvUOBmRmpnPYVZz4SSaa8WUmX6YSdA9NWbk9cdZYEbsgQBLyCyqtJZD0PyiH5y/Hcdf
	iE8KBWJVFUWmWyG4rQOKCXkM1fRU3Vj7XgwQ==
X-Google-Smtp-Source: AGHT+IGXEf4wLiJrb7cBQQhh0hUds6o0ZivNMDbGLFy225iBkcw5yrnbEk3wMhudkLANplaQ3H9mHA==
X-Received: by 2002:a05:600c:1c19:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47904b10379mr139639885e9.19.1764254501006;
        Thu, 27 Nov 2025 06:41:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm37351465e9.0.2025.11.27.06.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 06:41:40 -0800 (PST)
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
Subject: [PATCH v2 0/3] replace uses of system_wq with system_percpu_wq, request alloc_workqueue to be per-cpu
Date: Thu, 27 Nov 2025 15:41:22 +0100
Message-ID: <20251127144125.233728-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

More information can be found at the link below:

	https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Changes introduced by this series ===

1) [P 1] Request alloc_workqueue() to be per-cpu if WQ_UNBOUND is not present

	The refactoring is going to alter the default behavior of
	alloc_workqueue() to be unbound by default.

	With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
	any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
	must now use WQ_PERCPU.

2) [P 2-3] 

	Workqueue users must be converted to the better named new workqueues with
	no intended behaviour changes:

   		system_wq -> system_percpu_wq
   		system_unbound_wq -> system_dfl_wq

	This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
	removed in the future.


Thanks!

---
Changes in v2:
- Patches grouped in 1 single series

- commit logs improved


Marco Crivellari (3):
  platform/surface: acpi-notify: add WQ_PERCPU to alloc_workqueue users
  platform: x86: replace use of system_wq with system_percpu_wq
  platform: surface: replace use of system_wq with system_percpu_wq

 drivers/platform/surface/aggregator/ssh_packet_layer.c     | 2 +-
 drivers/platform/surface/aggregator/ssh_request_layer.c    | 2 +-
 drivers/platform/surface/surface_acpi_notify.c             | 2 +-
 drivers/platform/x86/gpd-pocket-fan.c                      | 4 ++--
 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.51.1

