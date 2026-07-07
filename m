Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EFB3AEF46
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783455720; cv=none; b=fTDoe0UgzWIyFpu3ujIZvmuHzPsFaicET1xpKcSHeAG6W65F4nbrBnhx/xlgwG7IG6A4CrH+ftSTzNNjQCRzqyEZCgXMlrasDGEG3xf25KnQ8fU6HN7varDeAJrf9zWgrhGhIj77eSVwuhwy8yk0XxZfwXvSYhJmWwNUXybomaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783455720; c=relaxed/simple;
	bh=4NG8zneOYe7p0UrTp9P9R7HnMyKE7GyM9DN8ppk6JVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4ixhQc2PY4fU9bkvs9W5B+eSC7SGpBmxsLujjppdMiZyaptc8tbZYH1qs3iRNltAkoaSbypBEVee2t11Vo/pExpTziIuZLjQJi4kx7A9/EycNfqUQatsdMcdEAHmqzlFBgP01OHXi85eCmwfGp7tD1qpJ+Pw5YTzRFnZL15bOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3tSpu/d; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3tSpu/d"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso7511642a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783455717; x=1784060517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=O3tSpu/dmCaGYJzcRxizKfmzqm1qgD4qnzUV+LvLMVUrblgcvmpVwU8Y4yhU21+qoG
         R0JKauEfvnPUItA8t2v8pSMr9q9mthuk+bSnFBoLjSRNKmDtva3btAT6Sw7VtHRUypI6
         da4yJ6RWwbSj8PcYjpO02c5WtjUAOFwgp8P0RJLlOrEWcQMrwQ3wjZTcUCFTQiYVEjEa
         eQacrUVGVVS6JfjEnMOUhZ7krHQtMlyGpFSei11dM/w7SEUBctFuMKt8eACFVQkdGl3K
         HYFq2OONlwpsCu+hPYanKPWoECXVEdnUYqWjpih86yoRxVGrcNx2Z9l7urp21eFWFG2/
         WsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783455717; x=1784060517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=aDnnUyHfe4wVOcH5vXIMqE66uo5bVK3tT0YtnnM78kzybaqpYQdoxD0h44rvcUhqTK
         eMuviCPaATRCLKECUrGDIGwklyI4DdplO3HxQuuLYvWPzac7W8W0pEblLxKO0C0nKEMj
         CdSGXZ3WuxV9KYjw4Fa5xf4VNS28Q2+p3Zs5N99mJuaQ0uBxUjRCUsgIDTR7XCoCTIRc
         o3nxsNHFcTB6YN2BZiJCBjRVbEreVsHHUM7hLyovyPEuDTm5oiXtY6mRk2cFWUKcAQov
         wxd4QGgsDMmWxj20vJzJqY7fhI6f3Nz1US8/5gB90rJakG089B9gyiwf89H/SXlCa1zT
         jN2Q==
X-Gm-Message-State: AOJu0YzbOlPpIvcOAzK7SoBsYO7ciovRYanKLW7sjbebaGFm5AP4P75v
	iiqCrlTFWJ8OB3c3afVRHfKkDg7aSxq9yRzdK5eiASHWebjU2J5K75hkJQzrQStO
X-Gm-Gg: AfdE7clx+fqxHjiEodC8j1Z33owdo50lO7zJxxMOcYYS/+pssZEUq/3Z8r5S8LGw2ta
	t9ep9ogQ1XfeqXqBbykbx8LLd/1t7P74ge5uT/gYpINkoLOHUKZxH4ideka/EOKmQivt4k8+74S
	BFcKTJS9dMHnvszEn4lspasvU++4Ty//WXPNLJc8cMwiHWT9uvemyM+lH3Znbbb9aXQZnlCzNE6
	CeN76v2kbVI8INQ6A7MlmUD86951EQ2oRvR3pMl3gxxuyhj4pDLH1vRgNVUywL66yEJHm7TaJJt
	ugfs7iuVXi2PDVwaNTRzpymuLb6BHDRcn/BlWJG6ksc0HkMhENNrWSmNdP7XYDVu/BzTH/TtA6q
	9umY4oQOSkLMAvjDPPFIcWg8fC5aO1zdHq15wd98vHLZWgPTw9ColDLR5E+3+2ToxbbRDyha8HW
	4ztyClxXyG8kZTCD5JL9oawdWa5qrpeognSUgqRX/kl+gtqZq6hpvpAA+uSFCDJPc=
X-Received: by 2002:a05:6402:5514:b0:698:b25b:8df with SMTP id 4fb4d7f45d1cf-69a85bf392fmr3470762a12.21.1783455716979;
        Tue, 07 Jul 2026 13:21:56 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm637930a12.0.2026.07.07.13.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:21:56 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	jorge.lopez2@hp.com,
	Thomas.Weissschuh@linutronix.de,
	superm1@kernel.org,
	W_Armin@gmx.de,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 3/4] platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
Date: Wed,  8 Jul 2026 01:21:10 +0500
Message-ID: <20260707202111.35414-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707202111.35414-1-meatuni001@gmail.com>
References: <20260707202111.35414-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_init_bios_package_attribute() hard-fails when a WMI ACPI package
contains fewer elements than the type-specific expected count (e.g. 11
elements instead of 13 for INTEGER or ENUMERATION attributes). This
causes the entire hp_bioscfg driver to skip attribute enumeration on
older HP hardware whose BIOS returns shortened packages when optional
fields like prerequisites or possible values are absent.

Observed on HP EliteBook 840 G2 (BIOS M71 Ver. 01.31):

  hp_bioscfg: ACPI-package does not have enough elements: 11 < 13

The element layout has two tiers:
  - Elements 0-9 (SECURITY_LEVEL+1 = 10): common to all attribute types
  - Elements 10-N: type-specific (bounds, values, encodings, ...)

The per-type populate functions (hp_populate_*_elements_from_package)
already handle sparse packages correctly via their own elem < count
loop guards and inner-loop bounds checks. The only unsafe case is when
we lack even the common elements needed to register the attribute.

Fix by introducing COMMON_ELEM_CNT to mark the hard minimum (10), and
splitting the check into two tiers:
  - Fewer than COMMON_ELEM_CNT elements: hard fail, can't proceed.
  - Fewer than expected type-specific elements: warn, but let the
    populate function parse what is available.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 11 ++++++++---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h |  3 +++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 768330d291da8..78019644ec358 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -661,12 +661,17 @@ static int hp_init_bios_package_attribute(enum hp_wmi_data_type attr_type,
 	int ret = 0;
 
 	/* Take action appropriate to each ACPI TYPE */
-	if (obj->package.count < min_elements) {
-		pr_err("ACPI-package does not have enough elements: %d < %d\n",
-		       obj->package.count, min_elements);
+	if (obj->package.count < COMMON_ELEM_CNT) {
+		pr_err("ACPI-package is missing common elements: %d < %d\n",
+		       obj->package.count, COMMON_ELEM_CNT);
 		goto pack_attr_exit;
 	}
 
+	if (obj->package.count < min_elements) {
+		pr_warn("ACPI-package has fewer elements than expected: %d < %d, parsing available elements\n",
+			obj->package.count, min_elements);
+	}
+
 	elements = obj->package.elements;
 
 	/* sanity checking */
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
index 416d7e7aaaae3..ac57d6eab4c35 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
@@ -279,6 +279,9 @@ enum hp_wmi_data_elements {
 	PSWD_ENCODINGS = 13,
 	PSWD_IS_SET = 14,
 	PSWD_ELEM_CNT = 15,
+
+	/* Minimum elements shared by all attribute types (NAME..SECURITY_LEVEL) */
+	COMMON_ELEM_CNT = SECURITY_LEVEL + 1,
 };
 
 #define GET_INSTANCE_ID(type)						\
-- 
2.55.0

