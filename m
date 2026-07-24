Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97E3DB328
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897750; cv=none; b=R5mi+1pJan41D7xlA9V5/GD9y/DRv9RCRCmpc/gVwgYpdsrhUixnOOaspb+C4nfp8ipmx5NmYML+GTp5327vX4u4z+3UMf/uShfnuRQ3hxeiW5OK18nIx3Ozilf01Qm+PV3TvJIjcT9xd6SyaqTv3+iVZQ0d830/NnSePTJv9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897750; c=relaxed/simple;
	bh=L+gCfl0MCkywX+twS7SBd5eisldV222i4lq1K6Z13Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0EtZOjnjhYXdKBjs/EkJ8+iO4u8SP9ATforopk1ulXQdnoX3SpOSqQ4Q78lnxjd2XaAJBoCEjjxSIavLOeL11uEcm53WSSlhg/aqIGESLOyCEVCPNQ3vCqoy/bfNyXPestTuZ6ZPYRAoU2Y+plXG6cMa0pLif35/KCeXQEGd3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmhfsxXQ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmhfsxXQ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so269987a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784897748; x=1785502548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xA0sIzeJgsz0mvp9zHWGU6Ut3rYQIPi/RDC6KIjR07U=;
        b=lmhfsxXQeQluWgLqE68kLSAO9hQ6fwN3V6XwjBdIv3+cj4spmk8UURSW3Iimbtu/kp
         6sRV2wQSd2mkFWyMqnXUeoh6ZRKwTJVihpORDNe3l1oXM+3YSLlTF9WnrRAeWaS4ZEvZ
         YkuU72C5X2XqU4NCAOsJJ2LgBdq10bFkPmfJplniC9KBKHPs+MyaJu4Yw0RoMuqzutG/
         GTfwPbv5ew9vGirJNK383qWMEC8i3D+QJzpvR17UQIZjlnwjbIotS/wUS96QkmkJnzFD
         mONgomvzW5eYJvx9lysBfp8KhiA34+9k/dUvap1G7Wv9lQ0+oHSFHU4CGnrp/LVJ0cjt
         8f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784897748; x=1785502548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA0sIzeJgsz0mvp9zHWGU6Ut3rYQIPi/RDC6KIjR07U=;
        b=Edku57oYSWhx9Gge9t8Otz8S7kWazTxz/bmRQf6PiJ6OzkBEN4mfL1N1taZGgXRJm5
         F3TlKF8F7WzmK8yWzLkmGIopJLD+7e7f4RBOmNr0B0Zct7OPptuml+zwpOXq1rN/P0W0
         GOhnDl6RcI2hCf8+FPSX7+FJVN8sFXafdBnogbM04qZHeeLmYETtwVW9SlxlMPMancon
         gmj276GLNSWU7kUzELyOrEGbh/5JcBfv9fDDOSmfc9FWstMM2JhmWMRGYugrUSWzsR9k
         /Dam+AEXVVd7FBkIaA6lUtY3PmV5QYNcqPD+qZ1/VKKyi/BavqQ+A1L+PPUpfYexlSS0
         07lA==
X-Forwarded-Encrypted: i=1; AHgh+RoX7jKhF3LgcswPyNB9kPaXAx9q1iOwKWY41/c6wQfRk3hoix0e/ozy6J991/5JZf8NliklGewSku7TJpWPMg/+YCoT@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtpemY9Zi/gdqTHj+lbw48tKbHkKk9wsOe4iWGmiOmz0HczJr
	Bl3Wqd0LjsPgauqLixnXytC3SQJYCkTi0r2X5BqdQAns214rxIAZn4o=
X-Gm-Gg: AR+sD11CumsA7m47/USVvSPOUmVlteLvc5A4Nt2qVS2o0WMcaHqPtCttoLYc2K99Mt4
	35/KGM+NkT7N4jrrPoUZheR+CwbcxsupnavO3E/jO0VCcW+KVhHxEj/zxLwyynh6OyqYaP+K1VD
	AwmuucXVKBqzq06NjNUzLYoRPx68dUvgsWlyRRDx89CG+rkGQlKDKdWjkHH1zoHuHCtmTTzEhvE
	7AvQV/ZfjYG0wmVfmt8wshlFUZx7Hn+7Tl7PF/32H4VXHTiP9VlLU1t3GXPUC/KMHSBJQ9r8nqT
	L27JBrjadsYLm8+Xb8cRfIKpx3RmHJtY97jrSXYZKF8o18CoKDc5qfN6JPykq+PZSI9kWigsjgR
	1gW9KMS2laXTWBz+mo5KH0CQ7OCqnFb/XL9Xvz5f5VqssbopdUeD8c1F1KH9YOKs0cu7Qa34xPS
	FhzzbOQBCIFZoCKOrNJbFU55d8jUs=
X-Received: by 2002:a05:6a20:d529:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3c44b18d5c3mr7716242637.37.1784897747878;
        Fri, 24 Jul 2026 05:55:47 -0700 (PDT)
Received: from t-rex ([2401:4900:1a5e:93db:310f:3bc6:10c2:6175])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a7738sm26725736c88.9.2026.07.24.05.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:55:47 -0700 (PDT)
From: kr494167@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: jackbb_wu@compal.com,
	superm1@kernel.org,
	W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] platform/x86: dell-dw5826e: fix ACPI _DSM function index and bitmask usage
Date: Fri, 24 Jul 2026 18:25:33 +0530
Message-ID: <20260724125533.74751-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra Singh Chouhan <kr494167@gmail.com>

PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1) (value 2).

acpi_evaluate_dsm() expects a 0-based function index integer (0, 1,
2, ...), whereas acpi_check_dsm() expects a bitmask of supported
function indices (BIT(1), BIT(2), ...).

Because PALC_DSM_FN_TRIGGER_PLDR was defined as BIT(1),
acpi_evaluate_dsm() was evaluating Function Index 2 instead of Function
Index 1, while acpi_check_dsm() was checking for Function Index 1
support.

Fix this by setting PALC_DSM_FN_TRIGGER_PLDR to 1 (the function index)
and passing BIT(PALC_DSM_FN_TRIGGER_PLDR) to acpi_check_dsm().

Fixes: 1ab843135a77 ("platform/x86: dell-dw5826e: Add reset driver for DW5826e")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
v2:
 - Use full name "Surendra Singh Chouhan" in From header and Signed-off-by.

 drivers/platform/x86/dell/dell-dw5826e-reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
index 1ca7c3421bb5..64e6e9b1d7a0 100644
--- a/drivers/platform/x86/dell/dell-dw5826e-reset.c
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -13,7 +13,7 @@
 #include <linux/types.h>
 #include <linux/uuid.h>
 
-#define PALC_DSM_FN_TRIGGER_PLDR    BIT(1)
+#define PALC_DSM_FN_TRIGGER_PLDR    1
 
 static guid_t palc_dsm_guid =
 	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
@@ -66,7 +66,7 @@ static int palc_probe(struct platform_device *pdev)
 	if (!handle)
 		return -ENODEV;
 
-	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR))
+	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR)))
 		return -ENODEV;
 
 	return 0;
-- 
2.55.0

