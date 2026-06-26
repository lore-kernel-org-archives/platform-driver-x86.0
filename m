Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F53B1ED0
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 20:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782506996; cv=none; b=ohBaG36B4tzvJW0smYWuquHydlnRyJ1X0RlnB7bW3FkOwwRPwAr2K6O4P2K6aAcAeL7eoiBj/OxeUYGQocMSe1zjucQam4+6HwZdiF7rUDjl3hcEUQro8mUM8NJJQeEid15LrHx15cS9f7KEiutqkA9knZY5+jIfIqmNR1WoKp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782506996; c=relaxed/simple;
	bh=/by/3emQITal9Kugr50sDPX9bYLyrZB8f/kpJDD8TKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cv6hx4PWdboum1w9/32Folyob+YFiHeJS1qi59pNWNeK5HsMR4lipjYkHPbBjfXfjCk6O/7nXxzUQ3nqGZb6gTdz+E81abMHJv8ihqaQzCKnf85bAMWzMb0UcGMnMFSRS2C2EkkHb6nQV/ZVGT4jwS6yjvRDRnNSFV2Zoupv/Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfFer9NB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfFer9NB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c122b25cffaso102383066b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782506992; x=1783111792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thuY1JcilTL2WkrIhTO71nKlX6gsdJPpD5eyTDT70VI=;
        b=PfFer9NBrtYnOtalqrHLmrGoefOQA8qxajAOs+tdxYL0gq/4hjGL5fn48WtTpF2aEo
         45yVZtSFkZW4wez1quo0NYygZ+fmQ9/HytD28mdAdh2roRKvG7035E5j08nXdWJuXiAp
         HPawvbANcdmdYkADekaEPQzfusYzdUyEhc+r4Q2C71xbnaJcrZVhzgi9K9nSsuxH4s21
         nOfqjQ9uXHJSEKFU2vHcZisrd2EspVmc4aqm43YsWGqaw/VstnaMhKGLejlHh2WsVTAW
         JIOvyb2j8izIKc+QylaeUECqsgI1b7mWZSLxeAlI+M/ibgoT21zjmfGURyeWIiPl3C5N
         aiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506992; x=1783111792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thuY1JcilTL2WkrIhTO71nKlX6gsdJPpD5eyTDT70VI=;
        b=csg0ikL0CdvxeiyDYld6dAouwJwKU4ZYYhGNYVv5cO2rSdOe1Ig1j1BK2ANy8FBpxE
         kGJ1pANlw+O7e1jWSTYQSZtV7BocIuWZqCW7UQXNvdjMtw+hp43Ah43Gkcf2ZfHjD9d8
         NnxCks9TR9pWnP8bk864r8wkdAisx+PLai+UG1ZNNBpRQukcYJcyRJuNBzgNKP3BV6/+
         S/yP0Th46kmTka2FSKRkk8t+r18fju9n/E91noOu1B8Xb/z7ADRaQ8S4YoC0uAhPlw36
         DFqT9TOapMBGNnLjAYXhqfFj2wNdkqmSDQ8lduc4lGDgrGao/7q9wGsCLNAwhat1LToK
         JJKA==
X-Forwarded-Encrypted: i=1; AHgh+RpOzmaTJLJT2wy5AgvuuibEXVrZP6DypIL0Pqnx9gkorUciS5oI6YgZmxdD4lwr0PfjFFacsgSsX0BghXKJlaHf4YRi@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIIjJA4lz2Lkql4ZPtV8ZwlIQ+frtmLQj/qVEFXR5MFA7vZtr
	hUjlW+sGMUvy+219nzy8AkAiUGVoRvmsOk+5Z3+YesskXpC4BZcUhAid
X-Gm-Gg: AfdE7cmnG9wvZuEFmYeu6h0OseMEhAZWYlUpzAoIhKS6XvEGViGp6axstYVZl/pOr6M
	Zc6CbDuRZ6PxQMU1H4ER1wFFEGgBQ9xEWNgk1BrMz7uFQLdzx+JR3D59I8xNu+ivh/KZzE4YIL7
	MvkXd9hjqJS+058/IsUenzdSCJ20OcaZirsLC1UK/gQaalYugwBQZ0BpuDxJVKlV4WaTsSyK18Z
	phgskBwiOv/WqzkmtOpqQCtYPpoRk+wGBS8AfoMixUbQ1aCkl/FTP/9O+oVLkAZNTGc1Rw2Jvae
	qeq8INOkO1MPnzr5r6+nlnb61BdsOVsNcjvcjI4nTYUVhgoyur+g3e5N1fpU5yYz6CqGA3VWTgQ
	Fi3OLEpsF1blzOiDtkIDg8kV9Dhxob5dG4nNYC67JY83uPWhfRu/vWekmxRkjaU+nik3BRP5nsV
	nBqnKDXP35rxjtAgkSi3XSykLxYC7Pa0u4oWVX5rThh6cQr+pVxR05ZN2aQJFlofo=
X-Received: by 2002:a17:907:701:b0:c12:15c4:6df2 with SMTP id a640c23a62f3a-c1215c46fcemr421727366b.43.1782506991641;
        Fri, 26 Jun 2026 13:49:51 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8118sm387907866b.24.2026.06.26.13.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:49:50 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 0/2] platform/x86: hp-bioscfg: fix attribute enumeration on older HP BIOS
Date: Sat, 27 Jun 2026 01:49:43 +0500
Message-ID: <20260626204945.18868-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The hp_bioscfg driver silently fails to enumerate BIOS attributes on
HP EliteBook 840 G2 (and potentially other older HP models) because:

  1. hp_init_bios_package_attribute() hard-fails when a WMI ACPI package
     contains fewer elements than the per-type expected count (11 < 13),
     even though only the first 10 common elements are required to
     register an attribute.

  2. hp_populate_enumeration_elements_from_package() returns -EIO and
     discards the entire attribute when any single element has an
     unexpected ACPI object type — typically after a BIOS AML error
     returns malformed data.

Hardware affected:
  HP EliteBook 840 G2 (DMI: Hewlett-Packard HP EliteBook 840 G2/2216)
  BIOS: M71 Ver. 01.31 (02/24/2020)

How to reproduce:
  1. Boot a kernel with CONFIG_HP_BIOSCFG=m on an HP EliteBook 840 G2
  2. modprobe hp_bioscfg
  3. Observe dmesg:
       hp_bioscfg: ACPI-package does not have enough elements: 11 < 13
       Error expected type 2 for elem 13, but got type 1 instead

Testing notes:
  Tested on HP EliteBook 840 G2 running Arch Linux kernel 7.0.13-arch1-1.
  After patches, hp_bioscfg loads successfully and enumerates available
  BIOS attributes. Attributes with shortened packages are partially
  populated and accessible via sysfs. No regressions on systems that
  return full 13-element packages (checked via code inspection —
  pr_warn path is only reached when count < min_elements).

Relevant dmesg (before fix):
  [   11.xxx] hp_bioscfg: ACPI-package does not have enough elements:
              11 < 13
  [   11.xxx] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT,
              Index (0x000000032) is beyond end of object (length 0x32)
  [   11.xxx] ACPI Error: Aborting method \_SB.WMID.WQBE
  [   11.xxx] Error expected type 2 for elem 13, got type 1
  [   11.xxx] hp_bioscfg: Returned error 0x3

Muhammad Bilal (2):
  platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP
    BIOS
  platform/x86: hp-bioscfg: warn on element type mismatch instead of
    failing

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c         | 11 ++++++++---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h         |  3 +++
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c |  7 ++++---
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.54.0

