Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBB2EC086
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Apr 2026 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775329386; cv=none; b=eG7hfno03whFdevkWfqloqbE6IJ6GgesNHj1EsqU5EUE70YKCQJACqAFFNsEH98pAaO8JvrLefkSEovls0TNDosI4nIwLc1FpGjkQmSD7k1hdR+iztW21STikbaCzfrAhxR1lyLbSTtn9FzPYlleNbs29qBJcQnr/9peQyOgjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775329386; c=relaxed/simple;
	bh=afb07Pi/O/eBdy40R0PXKsSf3j1V/qKtlcICzITIhB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OciOkiGBN36SA0Nj3kSQ/lNCHbgYzjUcq0kVQl+arIPGrP1qz1glBy/9122yFiGhyfIEIsA2wRB07JmmhdFazyiDkp432kHd8mqnSHiV+Q1Gl4Md2OkFFQbHypbxJsJ6Dz/7dcwC3bh/16VwYw3Qadgw0FLFmC3fZKkVpmdE8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVITxH3L; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVITxH3L"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so1218446b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775329384; x=1775934184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ij2s0xBgVOJ8u/gh6zTM8yZQbKl0vNDOB3OHCkO4vCI=;
        b=bVITxH3LzS+dZzTEqaJQ2/nrMMs6BYJgl56INAJVKZ8j33voevVb5Ri47mGVbRU7q0
         5ZGR0yCqvf3bVJD3SKr8H6gxo0eI7BEwJ4c9lrC+GdqVfoCUfQmTGfEs0oZQm9ygeZio
         scybXoGEjbx37bHNUUXBDU+5suLenMwCJko3qs9BDcB9TY/qFLSPKEoljzPz4KA1On1j
         UT/RIuEa5u2SYxksZi+mJ33Q3hRi7luZuIETI4SuIgsDWgbXoQZAVzdDk63vykJYY1/z
         /BbKQ41t1zmrgUPn1I2qoD67/QnlwnVUZBkVu9/2jODgKQLuxtiAO8b2778SOt2fBxGf
         H+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775329384; x=1775934184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ij2s0xBgVOJ8u/gh6zTM8yZQbKl0vNDOB3OHCkO4vCI=;
        b=J8llm6Ltza27aqTtQpOCkBhbMgqJ+rNk/BdaCwaxpnspoaoRvIPu9u1jD9sDZbmT0K
         y7628+61mj18CKhFIWs7Dj2FyxxtIXYhjG0wJU3CfcGP6SiYXSL1sANGKpzpYUkc2FZU
         xW3RKdJk5C8SJQztqRJ3k8/8K5gePXGEZN5egrJUDc3EhSmJ01cLvfu8pJaK6gvo0acJ
         IRXBIRUq4Q5x9X2snyqjDVei7nBrhghnsMj/y9WB/gzkywGNIBEdkfzT1de2jEvybzEp
         r5ZOaoN9Nq7zYf3Ah785BGmVM4NY/MK3uYWlbizH7g2Cp4gMAhuQALHJ+t67ZWrcKy6X
         KSXA==
X-Gm-Message-State: AOJu0Yxp+911lEEvmGlyeP/vV1/oOFz1jM5MQLGG45EExbezz1Kf0MM9
	w3wuvebYJNmapvNd7/aUrR/Vv+XrPdrCsu1L5tJbH5ctDXV5wh8h+vNy1OtERHQ+
X-Gm-Gg: AeBDievS3Es/y+3EeX2Z72H2192uLULWM+wR0TCFzCemnF9amKLa64s+6F2b7Qw68Zp
	b2GtpFghCHtHyWJsxVvOm0DPztmiveByyfscp5B7p+PMdeAVrs2UJ8NMKUiG3j3m7gBeM16EuPa
	UiHs+w29GSwpiFZ32pb9BKxtZZyFxAJqptl7UepzTAkoggUlveBYewN6omyuRdr+FQqjnUWGCOI
	iaV1+V4GcDwZ1mMxDQQd0ZVwAMfFom6G9I4LF6jAeVAUNESjWx23L8McrazjSVti52hP3ZzgOKG
	1g4560WoYexBgO1zrFD4Kxwtmic8nSDPZ8WdFW8SIzRx1B4EtlF1pu9peqnpORwNiD8zn6yeJDp
	MLQeaYi6LOPwI2DFxC13Vexojm9smw0TrehF7MNGqwC8Nm5dPaEq8AlsBbnMH8G9av1HoxUmHAr
	w0Dd9R9gFGYh7mJHucAOET2Q==
X-Received: by 2002:a05:6a00:3e19:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82d0db4f938mr6865339b3a.29.1775329384482;
        Sat, 04 Apr 2026 12:03:04 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:a008:2f74:2272:2da9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261absm10968518b3a.7.2026.04.04.12.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:03:03 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 00:32:35 +0530
Message-ID: <20260404190236.5218-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Intel Lunar Lake platforms (Core Ultra 200V series) use INTC10B5 as
the ACPI hardware ID for the GPIO controller that manages power to
the integrated MIPI camera sensor.

Without this entry, the pinctrl-intel-platform driver does not bind
to the GPIO controller, causing int3472-discrete to report:

  int3472-discrete INT3472:00: cannot find GPIO chip INTC10B5:00, deferring

This prevents the camera sensor from being powered on entirely.

Tested on: Dell Pro 14 Premium PA14250, Intel Core Ultra 7 266V
           (Lunar Lake), Ubuntu 24.04, kernel 6.11.0-1016-oem

Signed-off-by: Vasu Hansalia <vasuhansalia05@gmail.com>
---
--- a/drivers/pinctrl/intel/pinctrl-intel-platform.c
+++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
@@ -204,6 +204,7 @@
 
 static const struct acpi_device_id intel_platform_pinctrl_acpi_match[] = {
 	{ "INTC105F" },
+	{ "INTC10B5" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_platform_pinctrl_acpi_match);
