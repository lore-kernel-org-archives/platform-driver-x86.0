Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7537F75D
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 05:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339610; cv=none; b=uvQfESeh+J6oMznxwEK/g7GKFpU5yCVINMelI4v+3uXfZGwpxMSFX3WgJ6IL7dpXE5Go8nYicD+Bqxq3nLsrPFCHpaPLUhebNdOtqZKELwJwt0d8h7uo0wKhExoavTX+ZiYagro7Qo4NGM0FOg33uvmUYTkqU+9ZNUpTf8W+XjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339610; c=relaxed/simple;
	bh=1OfKgQbTMms8n5dYEYf/DXGJSmrmavWK4rq2w1ycwNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUMEyW5dzSMSbdJWwuzQNthiiXM2QkXdNwYQRuBjoPtAfhpZAJTEcVpjH3Q2SYq3ZVHFHuh9KZZkJMIWsP9gfkhro0ZvzAbhFK8ZTzFNONEUdmgWyIeF77sFX4dmMmwKAzO5kNsB7pbWoIHMtNVTYIvsV7CjSxoS9ptB3lXUq8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOujgiqA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOujgiqA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d049069377so11627755ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 22:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339608; x=1786944408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/8UpHFVXIXFBzrWjWV03c7PuH/XZDR/ITp80Qbxq5I=;
        b=WOujgiqAhQC+Leux4Q28wHSaHNGneERCLjdtstCV/dGvhDhAe9o2bbGjUUNgxHAtt3
         5Exsw5ZekEW5Cmafjfm8aL0rAoK6gLLNGqIORUJsvsn3VW5hHc7jAiqbDM6eSambn0vj
         HC2H1x1ABss/p7UnPh7/3VgXrObhtJc2zAgLjB2LzXGmtvGKtQDL7/wlKPOTwWLKf2+9
         fUMlFxIx7GiE5S/Scu8ikUNn8Qm6MI5RwdSdzB1vgaF3qTZi65agsNRIukKk5h26dcov
         sWQBkI7ZSu4TXRVsvUlh949Bb6lCbPSo1vHfG0UPU+JgO9SzielfgPirlngoG85bhEyj
         U2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339608; x=1786944408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x/8UpHFVXIXFBzrWjWV03c7PuH/XZDR/ITp80Qbxq5I=;
        b=gsT/NI2eF2zK1PGIrZcTkfV965R3klh8HQzZ/B8kFmI5nCReB2JxPcEHAQNamYQ/dk
         22m6bilYtlvQie2JmGQvRYKMUHVy0VEhNclbpX1CKFC8ouuF5+fwnOa4UT+QI9/Y5tY6
         /+Dr+4keOAWNqE8n04HXXbFjV9k2+WEYHaJF8h7Ze6LwwM3WH23ISlia5cjTVqZDGD+a
         BIM3bd7XpgrVFfqeZftGnx1LyqB0tLPAreIG1bwsCK2b7eZwSZ3CxB/59m4ztJtITJNf
         euQQxIJlVIpuSYa6azVN8MAJCC9BBts+nhDSCZFEQqqPkwQJwqxAF6CtCEmnU9QVUYES
         zUaw==
X-Forwarded-Encrypted: i=1; AHgh+Rosgv2H2aO4hMITH79UCHa2SjsbI5ktGCqWZmbLewYj1GBYRRWhQewG16ajQzX2FejAG4kPFgYuwYdv21RN3F9zMBNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5F4/6Sv8HpGXuTvBhPfWF11Pbl0lqEU1HKmX3DZOWTTlNl7Fx
	Rf7JqdmitQ4QDHYHz0JoG/4i94qkX/vtPvXcUOQhZrP2OEfD2Q+OOzxn
X-Gm-Gg: AR+sD10dJuIf5FV8jmLXgyhApAQUDrsYHAyGzrePK0XVmME0EpNtNizhe5ggqRvTslm
	TK2wJzT5LHVQiAqe78NPCwOdBz1XYLfBDpQw1uLD7R6Fd9f9unznZ1h349LOIiydfp+sPOm5ELh
	20kmFGzhisVx3T1kWnLHZPrFFZVXp3siLnqHhkSR72i/O6spBQsu7ZPF8Yta2/RIDgL2G613/0r
	jXUwqo1hou/jRDZEVfYljTPEs7v+eqUXbLDwYom58CrkA8CoFbBC+4JPLCTxIcIspJAMerBRfgm
	O7kv/8TJXPIlhKwOkHvMpha5jwVvWIwAeEyTJvirEFZLjB0po+x75JIqo1wA4FAqQhxvG40s2BI
	obB+lqyJ++ofYw6Cb2MbscW56RlsgRJsulgWDGVM1iQl6VRy5NtL5BDOuG0DmKXO4n4VZv907+y
	1ygD+hM6ckenm0sN47Mjt6ZNhGN8s8D/xIalr/OYdnALc277AyvYwkS9XRaSErtdQUj5EWKe21v
	JQF19Jd0E0XV1EMC1bgubvMe6631kZEkpxmOfpSh9owdGksZaUaCVdAAqRxMLxOqxLPTPKvvSSY
	jLX8
X-Received: by 2002:a17:903:1a83:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d106e81d72mr302441485ad.21.1786339608582;
        Sun, 09 Aug 2026 22:26:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c50cfc1sm29350025ad.82.2026.08.09.22.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:26:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Eric Piel <eric.piel@tremplin-utc.net>,
	Hans de Goede <hansg@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	Zha Qipeng <qipeng.zha@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] platform/x86: intel: punit_ipc: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:26:24 +0700
Message-ID: <20260810052625.27614-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810052625.27614-1-phucduc.bui@gmail.com>
References: <20260810052625.27614-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available and the driver can fall back to polling
mode. Other errors should be propagated so that the caller can handle
them appropriately.

Treat -ENXIO as the only case where the driver falls back to polling
mode, and propagate all other errors returned by
platform_get_irq_optional().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/platform/x86/intel/punit_ipc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index 6d770b950dfb..590b145fd5ca 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -245,6 +245,8 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
+		if (irq != -ENXIO)
+			return irq;
 		dev_warn(&pdev->dev, "Invalid IRQ, using polling mode\n");
 	} else {
 		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
-- 
2.43.0

