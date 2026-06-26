Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8857B3BF682
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506997; cv=none; b=u2J0FTjJZ1GshmLcUewTh+gxbnOi31VJp66dKdw+4O7gJl9BSydyKmDCVzRs1wxnZgy6HyfyobYcvbMALb1Y6LigsGxKMY9vjltfJ0gYRr2v2ofVn4UJwfjimhi3S5LV7E+/5IRaOk++HcbdZCAOGSfM2ByN8JQtGnIL67T7Nio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506997; c=relaxed/simple;
	bh=0sIDfSgUxXO2vmSLA31+EiQLz3GAhPSQpy3CjWo81L0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMUdeygsL/iDAXRieS3g89GnFNQbKlnaIx/1U9o13+/yQ4VaJz56awDfY5QUB8+hyNho4cmy8acLdCwZUI+U6TpPZvL3Di0lMwFLzo3sNvzs40LFSUliYhbttt9qh41BrldEPDVs3aPourpl8LfjQ193kf6ihuW4BqWpt3qiS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9TcolpH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9TcolpH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c0e12cb1d90so154758166b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782506995; x=1783111795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqKhdXPzlMwgJiJAHOYQTFAjHWL44qDb+NmBtEip5cQ=;
        b=J9TcolpHIkspMIWwMDyDFrXHUeOqse0tBXcUfAGA5XCxqSSrnS5E4kAQH0LX+z7+rS
         tCkPmZRiogCNtIpsC1VHYLaiq2D9zvOl4h+f/lUmT0piA7u+rIVJf4u+7WYfjc101oUj
         dm/xOWOjb7J9Fe+/pmnbOLDvvbx8rDe2hBgZIO0HeoIxkpKQqCIcq3xQB8bS9oCQhaNK
         edhG9YnFqCmRYqpX1Z59D/+pFw9oznI5f23EnzBb09HRltQZlXbiymY3a/qU22Ol9aW0
         hyiMtVdS1SjexAuSYfo0jyr5wcXhbG6mT2zHYMTm2WsP0pU7+nwqncP2dVFBSdU63ruF
         3TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506995; x=1783111795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqKhdXPzlMwgJiJAHOYQTFAjHWL44qDb+NmBtEip5cQ=;
        b=jS0gyAVziPF0W530r7aI2/UzaS9qYTkEEUgTLKUUvyD4lTvJNzEzxH9VEs8TLoP8Wq
         XDf0KC12DKghBBOeX4SJ6JU56p8rgVoCZfrO+0M3GdfXMz3mpfIqluMFWl0Vj6/YOGA7
         XouVg5r4LDy8E4cCYjXYiy7rdchfxeMF4gEhGypvIOcP+ZQxRIwMu4KvoaaZv7avuhzp
         K+gXQbi5FgDl7RaeWesuVumjul3+yTBA8YuiuuXsdNLIOy0d1ha6Pqsup8K15p3nAp5S
         TRjXb0ot7kqb9ZuYXUiozL7OsDfjVbe5uw5XgEuiRDPjtJmFrtUvdo1Drqa1YmuERxiV
         BROQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPyD8u1mdEFVbWJ5upwbB7yET9YeB612R7cZLNDEjgSrg+26zHwZHvzadlYjfKb8q2xQOOOYoOBizED3ulcJhQ0WhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5m/WC/NgQOmgZAifLHSQlCd4BFt9QvffpaBigQFWngif9/wYn
	KytCPcQ2L62t07ff6or8kt12Rcnh5XiMklMW8eEbYGa9l+s4YK6tuTJHTYCx4erYpvXLjQ==
X-Gm-Gg: AfdE7cnsputRmjuW/y79TyilgoI9RK7UZwof6s2EorD24ysaXn5ROI7390Zw9A91YEx
	Smy4ZYTwBK2u94zjVxhTGjOUsOFZflI3lhY2gWZaZvrBvb1GdpkUk/pki2lAD1dT8+hDzhgLfSn
	4UttXLj00Dd7b/OonO9wkO7pPlzTJM4x/fJ2XqrkZ8cE39H3Xl3XUCtenV/z+KQmdO4Y32KFKyt
	8O5uMHPdqjr6w+2AHLYSIY7lawMHv8rYt+Gz4NEgKqmymSbY6DuTe7TLrjuvgXJOtcRS0l0LmDN
	suKc9WVYt3vjzKsyV/U/8BWnXSvd0Z6lZn/0cZEgyzKl2CbIXqncXAHVm9onke8B1N/YT7fExRV
	EYYXJrXoe58aoedMS1IrIwIg6si12AjHajcnAP/26cUQIrHBnPCYyziMjJq3pdOvldiC6iN6VOP
	MQhIVmc2578Q67QIzFGI9FjHwq6jaTqmnbiIDK9efsVo1YHVvlHGgRy0NISFnbEFitq1sA+vjO1
	g==
X-Received: by 2002:a17:906:c109:b0:c0f:4efc:e63d with SMTP id a640c23a62f3a-c1205f66c65mr520260466b.29.1782506994772;
        Fri, 26 Jun 2026 13:49:54 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8118sm387907866b.24.2026.06.26.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:49:54 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 1/2] platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
Date: Sat, 27 Jun 2026 01:49:44 +0500
Message-ID: <20260626204945.18868-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626204945.18868-1-meatuni001@gmail.com>
References: <20260626204945.18868-1-meatuni001@gmail.com>
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
index 27fd6cd215290..dd531191e88e2 100644
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
index f1eec0e4ba075..f4a375c5669e4 100644
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
2.54.0

