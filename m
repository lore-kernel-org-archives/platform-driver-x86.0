Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2D3264F7
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786339604; cv=none; b=JuLiUiSVzhwfqGoe4i3zqNt6YaE7ZuP5CeiRlx9IU+DZTQL3kkIBCzvbbu9Y4EuLGGQJY9Gl0tcPPjvQSrDYD3oPakgSc86uMzivUNjQV2vIAJA+jmfGBPOAyLTGlUvKCAcLb3AfRoj1ThmiGkUcXp3G4pK//fhd7LnYNjrZA6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786339604; c=relaxed/simple;
	bh=sb/5C3sQ44xLLJaHxCHYqy3w0prK+2wi+L6nnye0dXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mybcmRLfO9RvHtNktAgybeMHgtHKpubVWsdnUvjdjOqu2yoWVTQxNqwSBUb8OmSL9d4Is+9+oTUlwYmCHEzRicJUU3IsyWX/tWboNQ3sDRspYYQP8T76C0w58b+ZvxpWhXEx+UmzyKBenqzkMJN8LAN3jsEGkiKpNEuBViQorps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrUZg8Es; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrUZg8Es"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc73e322dbso14337265ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339602; x=1786944402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6fagPyciHPGzfnoYK1pK78SLe2gJ1ofvXB3ksxfUjo=;
        b=JrUZg8Es72S+fQlp0ZmTTXgLQfJCIPMhQYqEWTdcuGNBZxhH09V/HhqFH7VAmonh9i
         Al85yTP4CNhvcvB8N81htvWTfuvYF4Jz69yMzPZ0phIPIqoD8yxO58jHjiO54svuFQEH
         9MCWmHKKq3Ivs29xAyQFEdl2mnpvmr2WlrVqjWJHMs1C1aTIqWzFFOvxwmQiGMqn+WFn
         LBSi4DVc70DwU/kL+VxSHqtbPkhzPMbS6/SaAacp29V41jtcugxeUxwR9mkGyzYbBUS8
         Xb88B+rGTDECs4lOckWZIOehc1urQ8mMFrCjXa8700ThzRusS7+3rxn1TkyCq8IYDdkd
         /Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339602; x=1786944402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6fagPyciHPGzfnoYK1pK78SLe2gJ1ofvXB3ksxfUjo=;
        b=LkEOb9KwnfHalE3HUK5aVEQffnNhwP32XHPpz8hFykygZs0eAEYT1HoVtPwO9eeQLf
         MAaXtOdactQt9OIysuKq+ZLlBKKZ5/bgMCQlx/B20GP+tFWpNNiCFx4pSwuoW9UjVArK
         4plxYPMGDiFhe5P3r7PjVC0uDBWlWJ7xKwJwa8lxRy4hrUK2YqXwW4h+VmULfhlBva7M
         mtNLblfoafq4M1Vodv106i4tjaslKdGSWCA+50LwnERB6JY/KsCSL1SY3kn/BAq9oK6G
         IOjgXWzR6jGTc0cebiRG6Vqe7Wr3k+Qde5dG07R7KoE93MgzRNMg6lL+cJx+iZwuQAk+
         gsRw==
X-Forwarded-Encrypted: i=1; AHgh+RrEmJbs2RHOgibU5oMN5V80G2w59sTCYWGHxlKMUCojeg/kSKrjas8lO3EpYba5i+OBtqf5VcZrhz/3t2+532yuopjr@vger.kernel.org
X-Gm-Message-State: AOJu0YzxT/ClatXFOfhjkuSZTW0InoljsqxvNgPDm4eAbmwJLnWfdlx5
	wDDkpJmo6E2oBerS1WEFvRpC+0C2Ug814jxoOH/ae/87deq8FBIGKSTp
X-Gm-Gg: AR+sD13UzcF4Dxevj/b8QdDTthPrfnhMA/Bk/oEqdK+zBehn7rWmPPn7L1GOVKvDA+z
	md/BKRqxfA33GSzlpC3OVDPe9qsLVTHVnHJh4z/Ro79BH9vDQFdBtaocNgrpBDls05TAvc/weA+
	Urj9EOLiDm8cPNcKnk6B/C9KdoO3a/x5Ro7+QzKIYCUAnC+Nfmj0tpKQ46p7wFxxD6lwLkZrU0o
	xqT7F9QelWKIMiVrPt6X1hk6YXOdEsPYbAdjpnO2+AfU+9GJZ3zagbh74qnCG9F//eG8xLn5HUK
	h/006JqpqtBuuh7RabiVUectXa3LRwyvBoMOdI3FYhQweLqoN23zgkaJ7R8NUyLkiloudmpTFyk
	uzBXpFT/osPnH6prEA8N79s2gt7H/JKCpBNIxI9FIedr1NiCyVVFPCUNvILJbNs470u6E8vZ8lQ
	JSrOg2BDjww62MT8C9tsRGPERT0yaoMY6odC+lZJsppHXdiCqkfqRZriAW5WYxij0Jfjp7sWFEI
	UwfK7GENCJVYqN3rNAKgvxgUeQwxnrlRoIjtDRrForgd2LJSuErN4096CmG1RdURQMGvgWhe2cU
	vPvk
X-Received: by 2002:a17:903:2447:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2d0ca962f17mr416268455ad.19.1786339602351;
        Sun, 09 Aug 2026 22:26:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c50cfc1sm29350025ad.82.2026.08.09.22.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:26:42 -0700 (PDT)
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
Subject: [PATCH 1/3] platform/x86: hp: hp_accel: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:26:23 +0700
Message-ID: <20260810052625.27614-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/platform/x86/hp/hp_accel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
index 39b73dc473f1..8f6b03196540 100644
--- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -309,6 +309,8 @@ static int lis3lv02d_probe(struct platform_device *device)
 
 	/* obtain IRQ number of our device from ACPI */
 	ret = platform_get_irq_optional(device, 0);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
 	if (ret > 0)
 		lis3_dev.irq = ret;
 
-- 
2.43.0

