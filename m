Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC143A6B8A
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Jul 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783181319; cv=none; b=XTnM8Cu7huiKMTr8WNSK0HeQyIpYThUjaUmUK20CxmU9/CZx7vlk8X25Rpqovlpu3o7/iTAK+rSXauVn1VP9ibREcWl9zsLf7fjYJ+GTs4qXhvY+iSz5zew/xv9g6NURll+9W+vlW+zU2SJ7O10E5weu3mZ6r4ieuS73fhznuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783181319; c=relaxed/simple;
	bh=4NG8zneOYe7p0UrTp9P9R7HnMyKE7GyM9DN8ppk6JVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iM+QFasSfHGpCtyxtOm2zoz+1e9NMgWH3IzWUimJLES7AcDc5RcSS4uDyvbrNkP6//+vVJkayG0kEsSardi63yNd0VB93ByUM8hqO75hD0zst3zhQlnq3x/kv/iNzIc0JAk3RbgfCMWSHJ6qvHpvHfV7pckj9gC788kTHbghAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAyHmCdu; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAyHmCdu"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698ab9aae16so2663374a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jul 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783181316; x=1783786116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=nAyHmCduIRga9XqSsxm6NHkRUl5TrvjCy/cOLYHXTKxqRSkFqeDSwKZz9NAeqh2jPL
         nYIK0+T8Z8IbRnx1kLShK3jYXeForJfBmwctcfgNeps7fzj/hIo/NNWj1ezrXoHR1+hj
         4m9J6PSW/lcuJb2qxCUEmLJsoZNhvMaSV+Cox7GByzO7eG+Shjt6C4Tp6jR5A413a7pd
         im96xUQ4uoQqMnZ8G+5oTTSB3ZBxNcpyz8NzEAF4WnrSZiWbZEzOne+TR1QRSRadD7KF
         8viq74ACEWZd4XgJRLGrYHHteyh/jmEFG47endbjItsKd27MMIPPeLWaqUyK46YBV70u
         DazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783181316; x=1783786116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=PsDW4/U6iniMhR+2bRf1A8XynMAcK1MaLKyJRNuU9TD8es9zNyEM4JKc/aW6NXjIWa
         qxEeH1rD9IPH+2Sob9CRr28yRw/yyh0RsrgsMu/77Awh5kZ4EYg0QxgDPH187Am8swFC
         lBfSl7WjGH6QgMgPVScCRrwz5k+SHmaDolfHtjpym7tekl2NDKC68iEs5bW2OmI02alq
         Le6JFTiZsx8K0GXSRoHOt3bTEa5x7s8HPSBL/AVHBcciyplquHaiMsDvnV+k4t83EeFz
         ZU+QNPOBtPTa2mW5Q0sZ2vtWwNBViinBF4wqVS8lWVEnQqSb8eK+BcMS2vHZsIvYlVH/
         7nyg==
X-Forwarded-Encrypted: i=1; AHgh+RowMMzTGwu9CJt7aoZV9ARHfqZ4+tz8TSFphU2VZC+WBKpwPE5t6fr+otb0MJ0VFJNwbAbLEbFU3IUNtc4SsVaboGGf@vger.kernel.org
X-Gm-Message-State: AOJu0Yys84jlJsw55XVF5HHHU7B/jcrLEtBaG/btKAsCAPZY1jIh6FVJ
	mpDqJMP6+XOFs2sOEekEuFkEFjQCg2sScfAxTXmpBJbdFZajW7Tazxjg
X-Gm-Gg: AfdE7cn7fQ1Z0bvJbfaaSWsUGR5LoVPxIDLLS/+QluZR4aePevloLZ/58vRRsJ8bLmu
	UEr6o58TEVtJHJ3iy3r0fF9IK1cDwgo0hir/k/6PKcFS1gl5ge3lcMG7RIKWx51zzswGxQn2tr2
	2+DyqFrzqk7A/kE2Bcxk7sgxpv2OmXdZ8mJl1ioFEAZPuyv7vfB3uIkBgnVdRU2BejuKNo/MjyZ
	sFYJprYpbztt7naOHL8nqDmg2CnsDuQ0wHWWolWN7yfP33CIq4KzT0XuXOfyNqvNvVlPwnWTyKJ
	gi0gukOqBzgVhhDLnRYoFoauRYlOIaF7QAXJ2gF42B3VWcZNXTcci5WE4cEYu+u8OpOU1xj3NGD
	CzuoItI+fxlKxd7w/0V/ZoTAjOarL4LKLs8ibVEwBDxeG4Z5knRvwMcDrkFOb9AYK+8SZf+WRj5
	ZJ6Y8PjlzjSAFlR8tvRMAKDDKjP9/Tbupc5YcKksAoUm1VJ2+LgYt007zqi6/mdd4=
X-Received: by 2002:a17:907:998d:b0:c12:d64:ca50 with SMTP id a640c23a62f3a-c12e6ab6f98mr119057566b.16.1783181315826;
        Sat, 04 Jul 2026 09:08:35 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm438586266b.9.2026.07.04.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 09:08:35 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jorge.lopez2@hp.com,
	Thomas.Weissschuh@linutronix.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
Date: Sat,  4 Jul 2026 21:07:58 +0500
Message-ID: <20260704160759.236249-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260704160759.236249-1-meatuni001@gmail.com>
References: <20260704160759.236249-1-meatuni001@gmail.com>
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

