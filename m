Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5EB39B95D
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616358; cv=none; b=pPBwfwu0YmPJcUZ54+EfMvrx9zwuD6J3+oGExpIV+gMjaOngLpWPhYJgAyjNEujoZPSCd6KJA7tpUgTotVTlXySjFWljl6a6Dcbn1+bdWCyqpNCoY6CFL1lMVjgFu19nosYxMxfufSxyl7ADH+Vs/I3ORa465PxDMi0z9npJQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616358; c=relaxed/simple;
	bh=4NG8zneOYe7p0UrTp9P9R7HnMyKE7GyM9DN8ppk6JVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0sE9UGd5loD7GaAhUK/RygjQpDOCFBLXq2F0ThkTXQrNayqMalr3rHi9m6qS3oFp5Rh/JwFLDDirhheZhjt/kifkh3E0oqaOlq3rVu/lOtROVW5DPSikLmWZB/nhPibzVeUHXgBnrR+KlrJSXtvWjase5hCYLeO6xlvegRdlUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4XTruzw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4XTruzw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so17365866b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783616356; x=1784221156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=K4XTruzwZQfWdS03JP5KLRY868vOFIRyRT44vrIGnh16fCgZl7AllXPBjI2b9noJ+0
         0b7ECJqZfcsLfkxit+4qM/SZOw+8l5hyfSxdKkpdt19kFKAZTivNedSaheo0e9sMop+y
         K+JBgXjH6jVrdA6a9XM7RdA7nwCfyfsoYIgih1CuvtUdWBkrQmWvItW1sOlP2sxzQm+5
         0tSYmSlZ7xWsv5fdN5Q8dyrut/ujeH8Pt/q2r8LLWpa4urMLIomyvH4DmCMBfpqm4f9p
         s7fHnQlNs8FePOdMvwu8imjvsLrtWsJMow+UG/0TqOv0xAgnh3HtidI3sdTCqMRFOTQY
         tD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616356; x=1784221156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UMhE6Jch/T1UvoknEZxvYaZzdpc2xBp5cw8Z7tMZGzI=;
        b=Gztn1zB5C5DKhtJU/RUy+1FIUs85GPVX33Sl/bTbwRKE7uKX+Rwdd30Ie1uDPvPh8p
         zii6vHZn2HH7qBOcTfJ439Ayf3dOIukpnrHSkwG9r6AEt6Z77Dwb/FNzpHDMKdfGryk7
         IOMBOYNfnYuq7wb/pGmp6RKnHvJF59fCJanCRdk9LWl9u647rUoSXTsfA31tikgYreYE
         4NVpYboMbkMepsvsgYRo51bBPaIsv2FGl27oO+Aqqp9sM3up20804qGBPk5mVvlvDvM3
         B4yJbNIuXdafO/Aj19si7EyESFobuP9OwGcsaixE0UmW3unIxufLD5UUEr2CjJfP5/6W
         oNsw==
X-Forwarded-Encrypted: i=1; AFNElJ94OcqcY5fmJDKQTnERggE8YCzF3THuTJK5Cm4c62mXi5L3FLwxgeCYU6+9N82d5sRnNI5ThrjB5gH/Esnxj81TV8xc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2B+P2uzdxSc7EnzDy1DSebBtyMIzBw7h4TFtM6ue86US4DJqN
	lTRKdVGqYOhOx+7Q/ErrqzLb/V6KlS89TCXjrrnd5BGA6gWafFypDc9v
X-Gm-Gg: AfdE7cmBsqZwPLGHJ3H0C4LLvp2NQLXBBaFE8SLLWnTLXolQP4D6r7INAWjlx44Jz16
	XZnGO3txpb9lfmpmsGGBK2r/U33ITyKlpGCCRJIi2aAitiGR+EPUP3gL+vGot19ugzjY39+iOLn
	b6XVnVvP4kiHd2E4BLZ6xis7KOnHAAyYbeNtcwD7ldcKJWpAnxt3+Xm7uZV/d7xCdmeQcIISQpx
	P+krkWCuV+/6zicYiXniKZAFarjqityDcaaYkzPv+W6l1f6rwniFkspkWLQVIsY1EKPqy1XtTk1
	EXYl7wI+dPsWZj8eeLuH9qMNR+DR9fDGe8Bet5UXo7MSm2rvNVrOsUzpICCgY/uMrcoAefk7HOR
	sNQO4iLl6NHGYZsX9bRfI4VXafT/E69QicebN0oJKbjo7J1Ge8aLbdvPAyKuqOewwQ4BDtTdlmS
	VivLhmvNqoY4JfXPiintBBhaSnx86qysvbHqs9SuELoFlNkuhSsBtyRtl05yhYaag=
X-Received: by 2002:a17:906:a0c7:b0:c15:b26a:8fd1 with SMTP id a640c23a62f3a-c15ce0e208fmr254039566b.55.1783616355657;
        Thu, 09 Jul 2026 09:59:15 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm329902666b.49.2026.07.09.09.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:15 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 3/4] platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
Date: Thu,  9 Jul 2026 21:58:58 +0500
Message-ID: <20260709165900.30615-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709165900.30615-1-meatuni001@gmail.com>
References: <20260709165900.30615-1-meatuni001@gmail.com>
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

