Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688F73264F7
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339616; cv=none; b=oBEqHCwD+Rk0fL68GiyRPNQvZs9bdRRjcCaLR1llA8HLwOfM/y30MQsQ30YvgnZu9Em2ZT0gLAk1Cmlxnx5iY7ftijWCjq5GXMlJkYTs8ZmWiD9ddwI6NOc2Lka76GlGIL0M19xNqQZErNtRvNKryOyDML5d21DYPcSdcnLPO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339616; c=relaxed/simple;
	bh=0XBPYgMbzdfFCCRwEL0HVkGxwmcGEHskftRPioA2ZHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC9TL2RyvH+tQB6wQLUK8mvKguNhAqX3NvUciAa16nu3InSf6DKxf6yf4K6UoJUl2BU7nwx4A+gHsaY81nf5LCt2K6syFk664qSiC5jHVX4J8EEGtPQ4msezr1r8KKrWkFBxH6zsGQoLOhC+gRh5N0wE1POwu74p6hPea/NO2CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/bYWblL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/bYWblL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d049069377so11629125ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339615; x=1786944415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inTYPJw01jcYRsAE34wz2vxcs3Bl64hbVk5OMtr6xYc=;
        b=h/bYWblLnFu2OLxJzUwhUqsC7JQZ01e83J4RmsPqPL8F7cZZdfwQj/HItsgLGVZxkw
         U9iC4n9cGG2O6uNLVtC8OeJufWIAPwzyl5P9GBvSHdiryM5AjoRdkrMH1VzxiG0QhC/S
         DzYhl6QvXXraKH7Cre+5Qm7/l53Xw+WTY2dG1AoPB3RflfE+gKpAnYFImtfl6TzgOzr1
         6tZdLEX3992ECYBKrS43CazZbUnee9Z0nov21i24GQiVwa2AadBhYtDotRorNaUuCiHz
         eo3YgtbUd4EgRRU31djha1kXogV4mFy18433zVgISzBlq493487v8AJFb7zPNeO072Vr
         +u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339615; x=1786944415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inTYPJw01jcYRsAE34wz2vxcs3Bl64hbVk5OMtr6xYc=;
        b=UI6AaTENtYXKhDcY5HL8WJAj3DJFfDZIp94uwlWuerT0z6waqTrCOHqkCsHSUrcqLF
         JdePYLRbYp9PGFpzI7BMtdz3Yj02k7eMzNiyOEV1jQzCtgH1rfMkuWXTJwmdDmE0l0em
         HQUWwg4UH0ngzcyZdxVJlXFPUlMAIJA7XrgPfjA1+Roavq/ohvTORtf/BkYTQD+FQH+P
         PdKMBEqBm74OfHCceeshvVKgD4NPEOObK8BA8Uye7bYQ92ApTx90ciavka8AYFNmcDZj
         Kjm8qc5dI701cPNLLhAqdLfXwAABiJJS62d9M/uVqOkh4eXEwJ05jK1ckDTOyICGRw/3
         UOVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFfg5xSDSkDkfkCRPu8RE3kTUgRxWpItaymV7dqefQBr41uUeKFe8/6l/t4cGMFpC3iKFMjEwUx9QpT+FpMmWkOsxP@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSdpU1RBZpbXnDgrr8JHKVWA/3/lezB0RmooPCt0Rc3AVSLVU
	VxSVviWhWZINx9kiPyTrZqbgoHbktRtxoLyrffOVDF04fbsWRjZlf33E
X-Gm-Gg: AR+sD100paB1HUa2D1lfS0SWWwTr3pFwPytCz40bmZz7sPGP7L500CwGM4a70kyKg95
	PMUl6XovF/550rU5ri+qqduX7doemrT9gQCs6qWc9lnZdlbZhOrrYZxlWe1AtSyD1rQlPCFs1E7
	VMzbCDQJABobN0lxSEtOt9O0dV0Q8xzmQlT0jOz9KMBrqRYpmuEUl52TmYFMEVhOl8Xo/CVStkw
	qpOQtCxXcaa1yw1f4EV0le7AaXt9CLdADP+3SL/V7LDqkTFlkvctv53lBWtT3ADAFFix4DI9Rnz
	lweL4NzUg73djNqc+IgUqpBhW7MEQEZRBEdpMlIghQB49WNkFbjQFt4GZB9zyZkBkcxqBUiK7cx
	2rG0SGNQII/ta2yi8n0Fu2/hOnsR2yFlQ6+oCYzuS+GA6ZHGYp0BvExwJM4kQTQ30X2SpTtTS6n
	E+7a+KkCtXN8P9uqjuSrjQVsu9xIdkRCF8jOoKOa4lnld2/87nPtknAjHWCDrBRO1O4AoASXLU0
	ldcNQZyzLdwgzq7iUXsvOggG+4eS/vh0h9BXYO1K2HFm1MLcUDN/tdRLTUJtlXZQSOYUJ91kpEt
	wdxirkQkd2BHBLg=
X-Received: by 2002:a17:903:1aa6:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2d106a18e41mr333320905ad.2.1786339614723;
        Sun, 09 Aug 2026 22:26:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c50cfc1sm29350025ad.82.2026.08.09.22.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:26:54 -0700 (PDT)
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
Subject: [PATCH 3/3] platform/x86: intel_scu_ipc: Handle errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:26:25 +0700
Message-ID: <20260810052625.27614-3-phucduc.bui@gmail.com>
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

platform_get_irq_optional() can return errors such as -EPROBE_DEFER,
but the driver currently stores the return value directly in
scu_data.irq and continues probing.

Propagate negative errors other than -ENXIO using dev_err_probe(), and
only assign the IRQ to scu_data.irq when a valid IRQ number is
returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/platform/x86/intel_scu_pltdrv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_scu_pltdrv.c b/drivers/platform/x86/intel_scu_pltdrv.c
index d5ab62cbf5cc..4686960c44ac 100644
--- a/drivers/platform/x86/intel_scu_pltdrv.c
+++ b/drivers/platform/x86/intel_scu_pltdrv.c
@@ -21,8 +21,14 @@ static int intel_scu_platform_probe(struct platform_device *pdev)
 	struct intel_scu_ipc_data scu_data = {};
 	struct intel_scu_ipc_dev *scu;
 	const struct resource *res;
+	int ret;
+
+	ret = platform_get_irq_optional(pdev, 0);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		scu_data.irq = ret;
 
-	scu_data.irq = platform_get_irq_optional(pdev, 0);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENOMEM;
-- 
2.43.0

