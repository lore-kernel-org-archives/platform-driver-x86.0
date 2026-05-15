Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77B280325
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857145; cv=none; b=MM7EVOkN/zb9TOT4aLcPrV6VuqlaarmuZt+p+fH8ldEl97j7WQnaw4ANoRT5DmqEQgEF9Z9yuUYhbALF+NglduiJlxsGns26zY9BFzxJd+dD9Ii7Jp5mvIBVthLDwh5Js/g5tFuBXUZTx2cLHwfHKYWR7TgLxOXbZ4QTYJgaEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857145; c=relaxed/simple;
	bh=h0rCp41D3Pg2TxrG8vWD9hrmift4VvKTJlz2qHczbe0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVy7N7EaoJ+y+eBbFz6w87VGdceWZeOSM+ysmekW3Z+Xolld7Y6fGmFvla5JWLA6V5cKf/ypm1uN8b01pomIr/nFKyYMLkWaA89N0Tg6nUzDX+Ji7zZ1uKQ2frRZInw/Ve0UmjcloqGII8oOvCjNZ3nrIR7xPJoW0wbgWvqdxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OCscMoZw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OCscMoZw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so99594815e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778857142; x=1779461942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wk53r8Cu+FpSb5ngFCh5EG88e4zuuAu2HnUPF1zbZMo=;
        b=OCscMoZwczk3vmdVh7nKS0hUrIjVf36kDO0p48+FIlmshd59V5FJt311C9ha22gx/G
         rO4v2SHK+9+t8p0zUnA5aK9CKe7ij5de1y2sDAszMT3zYegqHPKbLH+9rzeEhgh9c5/a
         9ieLLRDzVuvS8kay/SXMqnPSldACwNJrOWFHpPc9VsYWtmdDs9YicH3CQVx4I+fFxXYw
         V9RoRF1KFIpCbTDE69+wKj7Z6ZigKjDSAh3rhSuev9IMvZICFmZ4c2OsUPONtZOVk+vg
         dYaGpUD4tTQu9WIpHCUwqbmdjDP3UBRx9jFzAlqkfLP5/xp8vu+HfVUBOV/zuUlwiMKr
         L9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857142; x=1779461942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk53r8Cu+FpSb5ngFCh5EG88e4zuuAu2HnUPF1zbZMo=;
        b=Gh56Y8ozVWAfwx5u2xmH6PyPkd5OVIdBwXVPE0p6ioVzvn22dCbV8AvhWxgbDD23U1
         A/H8WXBAVFI9I6f06t5bpT5pjejlr6KgRP972PxGDOZiT1tcik4U1HbNs/QV/vgoz9+N
         nbN7sEP9lI6bvVmV5etglGoGNQRnoPLZkPG5YDE35dLWLymtX8My+DQats2i6Zz/FeFm
         +Brf/oahg4psdzAc4YNevBodnlgWHnkNoqCObTaxPq8RofPapW6u3GZTrgvNk/KfWTKi
         yGTeVsTxA0hnjA/RuQKv1L9eGUtuFLXBuigpcdZI44BlsxuuhF8Vyxj7rPnRX3FdwSwS
         9O5w==
X-Forwarded-Encrypted: i=1; AFNElJ/4P/7XkpCz2orJHtlr2n7/kZCNFALGvD+NL6muQdnf8A4+DBkaeJSwy+X50egCBneDazUx5THCHyn1tELIyQRf7H9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTONmwEZpWK0EiUWwRaUs1mexCtjhaHZuhzRispn5hH75Xg9/
	9icj2530Y48Yz/fAVMeruJYHJF9x8FC4gopI7DgIB9sMnad0gfTf3K2ViJVjI0Cc8vE=
X-Gm-Gg: Acq92OE3klFyuuReNpamohjkFDbn8HcFnpOyEk/5npKGjyUSdXIzft9UMPd6RxGThUM
	pb/GQ1TjR7MB8ggHGfLHOvkYgqllJYdxbUd8ivdkOuLWWdyhaWEXauLzHEKrqG709/TMxCdzSzU
	6qIdIZUdQQj8YDCPJb+4S7URWfe02RjTjTDQcgyc29khOaju4flM1Nlcz9/siU8sT8bG+c/TNIP
	AkqZ40uhzFKOIjAb4JCym+wwO4TMrEfhn0st0Nv623DabXciDBR7ejyoBBWvLHEZEt9AWqJYSlT
	U7giOZfNszXn4nP1pTbfVGOX4k/XeTDz6AZqc2dxcpfP6taxDscN6a346QJxSAC6MY0AZI9aKix
	4JAeK1JP4/3sMQADd5Kb26qRGuEkU/TQy4/JQMa8l5f6XgOrpCzafujk9aM1HYvMSd7NUdGRFvR
	MpfmwlCmLjJtR7u7AJ3hwtDLXladZja7WMtfmIy+VzH4LvFLo=
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a24 with SMTP id 5b1f17b1804b1-48fe66204e8mr57404185e9.31.1778857142248;
        Fri, 15 May 2026 07:59:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm15013170f8f.23.2026.05.15.07.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:59:02 -0700 (PDT)
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
Subject: [RFC PATCH] platform/x86: Move delayed work on system_dfl_wq
Date: Fri, 15 May 2026 16:58:51 +0200
Message-ID: <20260515145851.318787-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_wq, which will be deprecated soon and replaced by
system_percpu_wq.

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")

The function(s) mentioned earlier, end up calling __queue_delayed_work(),
which set a global timer that could fire anywhere, enqueuing the work
where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption.

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_wq with system_dfl_wq so that the work may benefit from
scheduler task placement.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 24c151289dd3..b7c12f943770 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2388,7 +2388,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		ret = hp_wmi_fan_speed_max_set(1);
 		if (ret < 0)
 			return ret;
-		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
+		mod_delayed_work(system_dfl_wq, &priv->keep_alive_dwork,
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
@@ -2397,7 +2397,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
 			return ret;
-		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
+		mod_delayed_work(system_dfl_wq, &priv->keep_alive_dwork,
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-- 
2.54.0

