Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD3840FD9B
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525743; cv=none; b=aRawP8yv6QMGYUYOarN1v/cLA0T0Hlt+eQkuJjvOIFzSOCQH0rx0Qz0dX7gnh1bmq4pHFh5RCuBRCNp1Gt0B3/eAuTljxunwuK2RwlXGtJHDiQH8btslSQNg9ah3/aslZGtf4XdmGvdOsD5576S7sa8UkP30+XtSgFejTdlqD0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525743; c=relaxed/simple;
	bh=4NG8zneOYe7p0UrTp9P9R7HnMyKE7GyM9DN8ppk6JVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEsg1aL/2zoG/zQDfKpU46QKLdbuy3MACuXo2L/ZTLnk4NTgGK9DBnFmbOe8ExIelQqshO/uUGwSfNCDePSGT/Jr9oR5im4D8v5rtdjbnImDh4zNF0ffmx0U4g8MVdk7JOL1QWFvlHon3AgPhYHqKc1P71jdH6UVkTpOBcoD4eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHnPqqJZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHnPqqJZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso1575023a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 08:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525739; x=1784130539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=RHnPqqJZoenkw9rgfcxvey6riVEQ0Mw/Fe3+usArOtXO8EQotDJIZRr+uVAaOkYRhl
         wJFIqs6f+HphBy7JzeLwgv7l0f/VoG+R0h+w/o4gV970HENwUlEj2YA9d8klESOuNoCC
         JN5oc6NTu2dFkagMtChC+jiEqkhdfbxWTCYNeWFJ5CdQ3vUWoZ1H3iRz32bSngEbTuNH
         eh7NqLUBIvljkS8M6z5m8LLkhsfECkxz4yoT/1qnOO+gPKmdqMIYXOh8vwwof/8GwmhT
         hk3aW/PtrDGmn1YeCeLAQs1dUZgdcy5qhyF8h/1tCCR48c7gNSr7JyABXIpFuwfr7HyX
         oYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525739; x=1784130539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=qWtin+QZ9pnKbLZHQAZAD5dMeczXdNGDpMknTjQLQFkcKgUag2KL3dBK6TGLCzsyH5
         Uy0cGLdvvTBC/U1V4XRptYzwLFB8++kVtAVZ8m4yVzcw58p5Otmg1V+90SMOtkk0mAZl
         eveP2uzHptfK7w0tlWgLE/gUIy6SpyKwHHE9iyXk5NYPt7fMn+krGTUSthNS581PBxHm
         Qi2SzZ1Nqw52oX/tr7fzn6IZ64jrzDNMkAeHG0BBR6cbQTJ8mUsiQjKHq/rwQKJgpkPh
         8iTn9SIirs7KxKBrCiaTrMcUpkBu9l+VeXM3fN6+rvjCZTEiJGEMj1UIDHI8hfC1Ci9G
         1KaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqA9fNDyGn/9hrJ+SPvNUKu3Lv7MydVIUiLPtJYzCvifnxRbTJXOriBiU/zcUJbiyvjkHWxYHSGobd1GqidYxNWwiU7@vger.kernel.org
X-Gm-Message-State: AOJu0YwHc8DtmFUbhntCYIGm9HgLAQKMMnslzjrv71Gv84GObtO4P+9g
	YQVwUaO5tnveMszmlnffKLZN00MWxE2LZwPzwvi2AHho7DWN9HrZe6cF
X-Gm-Gg: AfdE7cklCwSbdRrzNDngVn1zozEV6Tou1zygXOcYNAQInoJuA02pjPA/f2/ihuYnlrs
	Tr4swWapxpRheO3Zist6gEolbKnWAF/UL+qYLCwYN3U6QSDrDjyCY6L5AsoKhSTXTEmthj87sEY
	Pf5YhGwFsRxIQg1i17WcxPohV2kxOP51jn97yIKBf5GByL+2undYE7mcBvNjCDAmF8MJ7NsrArA
	dzRCcPXH9G4AaRaG/26UccRCDRCXtsnN0j29qIwN94ZNUz9X63EVvj0UpZo4eiwXz2o5E1USicM
	Mg6IPOTWI5lYL6yGU301f40fG0hc1wqJ6efMjBVSuEy9OQEzz63aTgfDmWOhEyH9WspqCHdb45r
	DNJFNGvpBNcxzHbLCZDw2EbzBdqn1BFwW5Kwx4QOb1nAGtNGFJ5a0ADzavWZgUGKof4dt8b+vRb
	XQfQTuQzfb7nwX3ZseVirk/j9CJEhP8jjBtPzd2tXrC/e4aulLqp0Y359hIqd1Se2J2645LdIDO
	w==
X-Received: by 2002:a05:6402:449b:b0:698:c11b:b180 with SMTP id 4fb4d7f45d1cf-69ab44534bamr1247834a12.3.1783525739146;
        Wed, 08 Jul 2026 08:48:59 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm945125a12.23.2026.07.08.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:48:58 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jorge.lopez2@hp.com,
	linux@weissschuh.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v4 3/4] platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
Date: Wed,  8 Jul 2026 20:48:44 +0500
Message-ID: <20260708154846.12356-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708154846.12356-1-meatuni001@gmail.com>
References: <20260708154846.12356-1-meatuni001@gmail.com>
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

