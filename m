Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878956;
	b=FJ/KbQAbZdlD8z1gXK64ylh3FiUQXu5vtqhFRKLanSDkpqN5yFkQgycpM+BWbJwbNstp
	 wSgUfXgxnGTi9u80JTix1lcYd+Lkouw0I4o+bNaIvwjOVuyV+kBbGyzPNsjHxgxVKaLXo
	 mVZIFexoB2TuTw1dL1Y81PZ0928F9FlLH+z8310lz+JNiNsJFewNu5fX0DcJsm0eCW5mg
	 tVDrdGLtnmyOBxVnQa+CTgrLvZ6sX/NBuA/tUcJmG2K9JWUp4+jxS4C2aFCchU6sxMd9m
	 FkJnfxB/TsCfJ5ERgLoPaGBLrx+ak30xHE0LAYY4mrs58ZYCY2g+3RVdsHc1as2TeBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kp61jxlZatnRJkTd/YA+OCxJsPI04f0YpnzoYpRMZK0=;
	b=26vNj6Ki1TzlhlPbQXAMVhsKpipi3QNyTY9xt83DrxHBTa+TIn3RyxnliK0t2JW+vG1s
	 z6HQPQu6L/4KFsWsV1gd3ef9GB3IRInPe4zfxBN48YPHfXHpbdPyhrkzVmCoS2Syex+vH
	 MYtFN+iItlkS98tyx4OtuSZAQFIFz3kM2cdMTTAXfo2ZkNiUK6KabBsaRSCV1ryXGMSLN
	 m6vEhQyWdWKa9N6SShgD8cQ7j9EaNOpFUbk4YGiLk/WHHcbJYik9/QnsREVCuD9FZCyDA
	 3l2G2lBQUtdKvv+x9qiGifXPmyoHv9TR8Wjh5yYsXm0MPLMoZe2yo4hkmMx8TxKcQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R11VVz/+";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25908606A323
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 01:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25908606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R11VVz/+
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so3875075a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794878955; x=1795483755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp61jxlZatnRJkTd/YA+OCxJsPI04f0YpnzoYpRMZK0=;
        b=R11VVz/+BfO5SsSP7YmDXU6wn/ClnqwDfEpRu+28xtrVbDH+zwV2ArpTKssKJzaHjE
         mq5aI6KdD6qR5ud0KqpeYmpXUY+vmbVxNv0B/kMCLtReJlkYYBhG0UFQ/gq58dHhgMFw
         tRpSYU9vU+QlozUcwjvkHTitG2fBNQOmGLgyVro+o84BME0P1zwNpsptYY5ccGUHvgoV
         mOC1fo8WlB3l3fRzX5skS52VwO5eGdS8YHewFSWEbSfYbtWt+QqzBgydMLPUlEomuXkH
         A3n1sWK6xdSUhGHl6pkU0Qqk1+76vJmPw0F51PGeszOsCnrZu1p2744Lh/kpQsVQVJwi
         34fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794878955; x=1795483755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp61jxlZatnRJkTd/YA+OCxJsPI04f0YpnzoYpRMZK0=;
        b=tNIQYs+QMtWsrOxrT+QSVdz8q3WKYkxqOdS3T4pVi3rOZ2FZY/zApYkZFK0tA5buaB
         ulUeD7U46nGysOwvDvNK6WqpA/y9IqITh+1XgByMQI022mBnm0Vw7S/abHILj32Sm4+V
         iTaznLtVA/A6H8YiQK03V52W+r9Y2q9iElkNKRsgyCl4CO9DFyK8+i0O4/BWNHkke3Du
         EVeCo6gaCCDyUESOrafYlczoK/bNsQhJlSTjOkb4avf968eRl4lm5rQtEKdddHso0LuW
         kDvP54suAzEMVJFiMyGdmzBX8lv4FqegU6OO4kaOEUNEd56tpNfAQz4Qy8WfeeL5DN4F
         UzJQ==
X-Forwarded-Encrypted: i=1; AL+hErHrGaniEvLHnt90ur+OLUrJJ+5huAlcDjuRRa6jmj26xERyJ0+Msz0ifBpZvMkiVQjLS5/foPp4jV02kITZBZzHbV3S@vger.kernel.org
X-Gm-Message-State: APuU4Z9FZeovcFYEFcSjdr+vjMayv6XcX5exslE8k4kh6IA7cZP8W+ew
	w1rtkUB9LnNzc2EIkNS3NBG0q0E0mo3HxSBWkOpf93kPCvnO1AH3tElA
X-Gm-Gg: AZFdTZdsfpYzMhD2JmOqLNyWiTG51pbD+PZTX/dof1hj7GhbqstHoY4iPXmFtb7Yqcr
	GYEDKThiKMLp5AHcfSq2RvHGUi8w2HSbvKacPopan5mPhbVDrdSmDwr/1oMeep+ZcqvEJhDHpB8
	kky005dlqf/+4G47gfZ3HxuzDQQ/oaBxKCCtGvtB8/KX2tLQ/HLhsjosgRPTqtc6vwu7MCtSTly
	jVBPTBUsOd8KKJmR0ZgnstxOdP9OtIo0Bt7EIF+p141e1REXY+Kurd5Ft00yXxMaLsZ/S66xSIC
	RroylXNMWcXmBLpE4QVidLBTYidcfaIMUVUKqvDjvWbeKUlzbM2BSUSRyFHKONd/zkeZc5mxjuG
	4UQQrwAIZ3eD+4ZVGEJT3HuQchOcWi5EVabwM0p40GANLvhMznpyotAnA2Vy63MeSpMKwCZ4Vqz
	WmJvBRyoOn/1sTRNXBFWh+X15R3ziEV8kICHZJy5RvO+RTAS9WkI0brzC2nyPK0C/3UwaAx3+V+
	khRcPK8tlzoQR2pMTQo26eXQVvy2y0/oJRfONi9IB+9fwFaE+KKRKG8q1KMG1Uw23CEvZ4pMR+D
	6i5Gkb9KAe2tAMFQWmDL7Pd07fyUfeEaZreeH4Ekt0v3l7oxnrCV1xCYe2QYVHqq6klfzYQGVCo
	tQt+PUeSeXRVVW3ox79I8G5op7eT0luYrviF5Eiu8
X-Received: by 2002:a17:90b:380f:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3b1b0816e0dmr12462179a91.5.1794878955294;
        Mon, 16 Nov 2026 17:29:15 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm10295178a91.4.2026.11.16.17.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 17:29:14 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E . Box" <david.e.box@linux.intel.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] platform/x86/intel/pmc: Don't truncate HW sleep time to 32 bits
Date: Tue, 17 Nov 2026 10:29:06 +0900
Message-ID: <20261117012906.1637402-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pmc_core_is_s0ix_failed() casts the S0ix residency delta to u32
before it calls pm_report_hw_sleep_time(). The delta is already in
microseconds, so any suspend longer than 71.6 minutes is reported
modulo 2^32 us. But the limit set by pm_report_max_hw_sleep() is 2^32
counter ticks, which is 145.6 hours with the 122 us step.

On a Tiger Lake laptop, one suspend raised the LPIT S0ix residency by
22559 s, but last_hw_sleep reads 1085 s. The LPIT value modulo 2^32 us
is 1084 s.

The cast also hid a wrap of the 32-bit counter during a suspend.
Without it, the u64 difference of the scaled values becomes huge.

To fix this, drop the cast and add one counter period when the
counter wrapped.

Fixes: ddd66d634735 ("platform/x86/intel/pmc: core: Report duration of time in HW sleep state")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 (Dell
Latitude 9420, Tiger Lake). After a 13.1 h suspend, last_hw_sleep reads
47063.5 s and the LPIT S0ix residency 47061.9 s. The counter wrap path
was only checked in a simulation.

 drivers/platform/x86/intel/pmc/core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 71be313bdf0e..0190160a4c0b 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -2052,12 +2052,17 @@ static inline bool pmc_core_is_deepest_pkgc_failed(struct pmc_dev *pmcdev)
 
 static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
 {
-	u64 s0ix_counter;
+	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
+	u64 s0ix_counter, hw_sleep;
 
-	if (pmc_core_dev_state_get(pmcdev->pmcs[PMC_IDX_MAIN], &s0ix_counter))
+	if (pmc_core_dev_state_get(pmc, &s0ix_counter))
 		return false;
 
-	pm_report_hw_sleep_time((u32)(s0ix_counter - pmcdev->s0ix_counter));
+	/* The 32-bit residency counter can wrap during a long suspend */
+	hw_sleep = s0ix_counter - pmcdev->s0ix_counter;
+	if (s0ix_counter < pmcdev->s0ix_counter)
+		hw_sleep += pmc_core_adjust_slp_s0_step(pmc, 1) << 32;
+	pm_report_hw_sleep_time(hw_sleep);
 
 	if (s0ix_counter == pmcdev->s0ix_counter)
 		return true;
-- 
2.43.0

