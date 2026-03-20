Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570853DEAF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050980; cv=none; b=epIzYW2cwfd3lBxRKiRTNG/5ue4tO7soG5lgq62GO1TzTjk/aH3S+6bel1vqICkbTOpjOczcB4bYFVA9MCZV9iSgKcRbewkftWEIzu2QB9zpWsrla5vLOEkzLpE8tDib1MgvpmeMY7NWTkJB0hrGV7VMF4nWLBLtG0dCIEwph8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050980; c=relaxed/simple;
	bh=4Qv0ASzBZ/GHMP/cF0uuMSr/kHt3nxx/rYtASmNluvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W8NxUz9IBzjcGMO5VK/FfwD5/Oh7LntExHVekcrlWr6r+OMfxe/tmReZBtKX5I90Tg1UdRdjCJrJHZoxJMjrYWmNeuZaNBu6PPkhhE6SHqV9uGSf5ayt0jV4xmfRrWZ8VGVihGwXzxtBwM7AEK5IEcEQI232mpFN92pgN21ztVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcPvy8ac; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcPvy8ac"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48371104ffdso3035605e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050964; x=1774655764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5s66dB2mGXA70emn3wqJCYnvCXFNfAd0Dr6Dg6TLwxg=;
        b=AcPvy8acuYWP1a41E9CeXTw9E0E/ePVYW45oBAgslDaj11aMP1v/pmcGKiqWPWjHo4
         ExYwf4xlP2p7xT4k8UNtnc2HO0ZCb6tlxyoyUBiAA07pGBkBDlO93ln1NSiFVpI/S4DD
         qvdmdegX/a5AFWRK0q4QfBOEI6mIT/EJ5UybTdbiaJxF8dDOhsDPjR32X9/yauPfyDjF
         eOcZCNB/nL+4c1jAl8w1u+bE4YA+qJwQ8k1CZ5EwGgDA9Cja/FxDJfFHzOnVulWyonbw
         VUK4ZmLcggw6sxnCFQTgAytRdCfpDfo2uVESYKbvBf5sRLxXeaMv0tcLuxaM91lyi8d0
         TnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050964; x=1774655764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s66dB2mGXA70emn3wqJCYnvCXFNfAd0Dr6Dg6TLwxg=;
        b=KTN85P/1yIfq5Heg32oivm6de4Oy87mhGYpgeRalJamj719EXwBzU1hJuO3V72CwXc
         lu1rlg/mLlZ3WlRAZjx8hKtD3Pcv7ii5HhTgEZg6aDiEJLRUBoqXzY0IPtsyCjsW2NIw
         Gxi0NInmLyD+H4kSaIWpNNaTSYp+q85b5t98+mfPlpR+1MP8pNb62Q+8s4tEfsQs+viq
         zZgDbXJw3hWhCQtd7LcukSgdBrO9k+Mj+xxQOk25huTyV9TbxaCzGFyrKPCLh1DqP0rF
         Nw1vjAEn3FATrVgm+Q1X41AbHdQTmyJQK0JL9QLZVuuIlimDIynB+D6ZfRbp25Ut6uoe
         GjaQ==
X-Gm-Message-State: AOJu0Ywn/xt6bBYzhtzzP8SpKB8vxujfnujtE3nNrlcUqq7UC85r0ojM
	VLRkGT8RAqsCXeOts9tA4zxtb3n1lb4dHdBEUpOUUHkriUNInsJW7/sFECzhbqWxkSk=
X-Gm-Gg: ATEYQzwlr24TAi0LL2g4TdXv+zDoJzPVXzMS9pkCMtOiNvPXFfn347wV6EaqAPSyb3M
	3CgYwWutvhfLzF8G7RNJRpz+Y5kn/btMV3tV/Hg6KD8N9/wgzWNY0R1Tmu1cclZBoogct6XKzY6
	eShL9F5arnsDjAskcatmqkUSBNRwA+1T036Q0T5oJtf+3j/Gqu/tPcnfS75K1zvg+vIBOgwvm4F
	/qOE3Cyllg90KxMF02XzStzWdfZ1ZnHp2fNUSEMQB8ij2TcranjTFi8yxAFrMqjoqYUDqekawfl
	IJbtPTeV79/bKp6/Z+Ipg6r419qh69fqTZ5QdATP36DiQKFulMQcr5xCUGLoU6JdzaZ5VZSA63y
	MP13u7H6R6FxouAKm71K1Z/l6pu6OnJzFGT/7JZGv/p1c+zoX7KwecJLNfqv6+1viMXAidw9GX0
	eThn733ga8gYNDsC9xevTG+x6OIrx1mh/QvB2vAVQvYEe6CA==
X-Received: by 2002:adf:9d88:0:b0:43b:60dc:d9bb with SMTP id ffacd0b85a97d-43b63fea120mr3488270f8f.0.1774050964161;
        Fri, 20 Mar 2026 16:56:04 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm9663418f8f.27.2026.03.20.16.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:56:03 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 0/5] platform/x86: hp-wmi: fix bugs in Victus S fan control
Date: Sat, 21 Mar 2026 02:55:52 +0300
Message-ID: <20260320235557.56298-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five bugs in the hwmon fan control code added for
HP Victus S laptops:

- Return values from WMI calls were silently discarded in two paths
  of hp_wmi_apply_fan_settings(), and the function's own return value
  was ignored by both of its callers.
- cancel_delayed_work_sync() was called from inside the work handler
  it was trying to cancel, causing a potential deadlock.
- schedule_delayed_work() does not reset a pending timer, so rapid
  back-to-back fan updates did not extend the keep-alive window.
- u8 arithmetic was used to compute a signed delta, producing silent
  unsigned wrap-around on malformed firmware fan tables.
- mode and pwm fields in hp_wmi_hwmon_priv were accessed from both
  sysfs and workqueue context without any synchronisation.

Patches are ordered so that each one applies cleanly on top of the
previous. Patches 1-4 are independent fixes; patch 5 (locking) builds
on patch 2 (cancel_delayed_work) to avoid a lock-ordering issue.

Emre Cecanpunar (5):
  platform/x86: hp-wmi: fix ignored return values in fan settings
  platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
  platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
  platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
  platform/x86: hp-wmi: add locking for concurrent hwmon access

 drivers/platform/x86/hp/hp-wmi.c | 59 ++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 18 deletions(-)

-- 
2.53.0

