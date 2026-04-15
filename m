Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFF31AF31
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Apr 2026 18:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776276059; cv=none; b=OhDAUJdFKBSzH2TAdR72713qm58dw3Iv2v25FEDyuLC9ezS5YBJfM/9BgPMyTeGFamOFs4SFo2iC0IlsptrpgToLlcZv3KZCT7B/Qg3UXYZZqWnI+6sMsQWXagihO+7IOWsRXDmgF4BisIxDU28JaFYUqyAH3mrNTJpT4W9rclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776276059; c=relaxed/simple;
	bh=qO55L3YjS8zCKFEzzaa6hbU1AVUHdvMDaL6ZPKdxjCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTglDG+vVPNOAyK/qtyX0tiQB9WMpsW1gYuDXyL4JYUVjEaKZtRGmuuNPRb8sAF0R/LALKh2qkXOChAVP7dk+2zCqj1KpixD1oA5YPZTaTj9F4TTpjqd4JpZ1LcYhIaCntnaM9OA5VwiajnmpInP/QCiynEN2osQzfARL2z7mHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO0yCdmb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO0yCdmb"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c7961d7bc09so213601a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Apr 2026 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776276057; x=1776880857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkycsCrJmhofL1VSAGHsLVaCLza7QJmmTEvp4Vq/cIY=;
        b=VO0yCdmbqr7hLOzBkxBHTIDKpESCCKjJIJNkmPcOLT0X4rU/0fHG3T+M556dUw7Hzu
         2XeRZyA9UMa6+7m9QX7vKm1H6jDu0M9vitA4C/FXU3Gt7jPuTLgqeISw72lGhhG9ikBp
         /lxYtssOHoBXTDyNOwT8/qROr1K7YN1rZQNAViim5hgP/bUQ8VEU+CgMM/OGOZdDFgc0
         6Renzo5HbFFPnAtwHylexHva1Fmm4OTGm6peTg6MjgrgzRUjrWzATeKi2PGWPt5B64PX
         wHYEbX6PdJ7y5h5Y0o8Bkn5UFxYDi1T1OS/xzdEPgJ8slZp++Frk1DLR3zjdr4QnVpm1
         4Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776276057; x=1776880857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkycsCrJmhofL1VSAGHsLVaCLza7QJmmTEvp4Vq/cIY=;
        b=ZQyuxEiHadjO5p8n8+O8ThBQW/+6olk1HccSjy5KmoG/O1QQYvZcveKhlNOsFINYpw
         KGhl5IaWMIBi5RIVVWJr0IGTQz4DrUhXo0J3o2VetanNcMK7+Xrkz+BTEnPihlc5mUwB
         jP2b0otw6lTXPHaLCLI2DuUiF0Yx0jrEvcIrcPacwnqNazl12AItLY2QnQ4DGiugkW9O
         R97ZXGXoY3Jb3R3efQnyuoQgqZwHHM8Uf6nvW2xVsz/vdoQ4+xVekMkuJphhGw8RQ3Fx
         e8AWflf0vxsdbnqbsli+I7pzw6aenyQ5CWDtmxwocsb4AFw24hCmr2yY6SyAqL6kSyTy
         xPhw==
X-Forwarded-Encrypted: i=1; AFNElJ+SJ3vv5mF71wmMbji6FnCLqe4vx80q7sCyxONf6bmBxbVF95nHvk258tln+VjYPrbskUK+RrwWVNvVUiUXYoqt/aHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxVVQcfn3tu0smUdIYupjmkvmXPWxiryOc3t/9kHJj1wTle20iX
	8WEUsZ/Lmrepcm6d0VVaBU6wvqVYumKLAcTZBhz5YPjxAPHgZ6FY1pFZ
X-Gm-Gg: AeBDieu2woIUVYQIzJb2IuKAbbzFalltwS6sod3qP7DPOzPJy02wqq9MiZP702fTLPz
	+abq26AfOD2/LnfJv/jedKE6nIWMLpa/qLhuE/Oww5f4jNFGHyJScNyIfkb0gdcXTWMLeuhrTBJ
	9RXw9iHOYqsCD8LBTION7hNf6VHE06WfeR5/RYUokKqGrkh3ywOmANryyt7/VDYCD8mRv6en8sH
	YdCVO9w7gkZdj442DCT4+yrZOlcDGzMK5imeu+m/7pHT/cfOVlLAcrZpVyCazDHJaebVYr4h8EZ
	DZxWBGU7Sx0BsouSvO9oGryt/dRrf1+/al91P41Mdm2NaQACSrALq3Jnr92KeTC2S/O0qWrjM3L
	OMBvaCFByfSockReuqOoDe2oySoPf1jAH/Y0aI9lIRMeauGD3NAybahsoYzcqDWCqDQLxXfWPFu
	xLNSE5YOV3hI2AX0aSDSQloeehNuMlp4+gVOBJuCTmw4qjOAA=
X-Received: by 2002:a05:6a20:4312:b0:39b:c9ff:e3eb with SMTP id adf61e73a8af0-39fe3c64cb1mr23482146637.4.1776276057180;
        Wed, 15 Apr 2026 11:00:57 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:48dd:8f21:beaa:cec8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581bad89sm2057644a12.25.2026.04.15.11.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:00:56 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: intel_scu_wdt: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 02:00:42 +0800
Message-ID: <20260415180042.3648360-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in register_mid_wdt(), the
embedded struct device in wdt_dev has already been initialized by
device_initialize(), but the failure path returns the error without
dropping the device reference for the current platform device:

  register_mid_wdt()
    -> platform_device_register(&wdt_dev)
       -> device_initialize(&wdt_dev.dev)
       -> setup_pdev_dma_masks(&wdt_dev)
       -> platform_device_add(&wdt_dev)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() before returning the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 55627c70db6ad ("platform/x86: intel_scu_wdt: Drop SCU notification")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/intel_scu_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
index 746d47d33406..bc120d57cadd 100644
--- a/drivers/platform/x86/intel_scu_wdt.c
+++ b/drivers/platform/x86/intel_scu_wdt.c
@@ -58,13 +58,18 @@ static const struct x86_cpu_id intel_mid_cpu_ids[] = {
 static int __init register_mid_wdt(void)
 {
 	const struct x86_cpu_id *id;
+	int ret;
 
 	id = x86_match_cpu(intel_mid_cpu_ids);
 	if (!id)
 		return -ENODEV;
 
 	wdt_dev.dev.platform_data = (struct intel_mid_wdt_pdata *)id->driver_data;
-	return platform_device_register(&wdt_dev);
+	ret = platform_device_register(&wdt_dev);
+	if (ret)
+		platform_device_put(&wdt_dev);
+
+	return ret;
 }
 arch_initcall(register_mid_wdt);
 
-- 
2.43.0

