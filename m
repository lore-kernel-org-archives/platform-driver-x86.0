Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2B345722
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 Jul 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783181314; cv=none; b=iZ5b1eoGn8CFjNeZ1pjAEVgcWtJ7dxJhMTFiMu7NWfDB0VFQBdIXFmLpoZguNXZmgrmrNFgdRx6Tu5bR8HdDABAuy9NMtSb0kFPegc5dEqGwY3BoEi4jl/UZ3PM9XmGEFtLsX7RGiP8d2s3YlgMunWdjs7yr7mBGSPfkGcTUSCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783181314; c=relaxed/simple;
	bh=XufG0eQZ8fmWPRjC8fo6ZVGZ05g2/hQ5aQ3eg6xYeK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPgwWBjo0ZMFoe6BXPWB1qhHYBdWixxicrPJWKenYNcX534IPEqHuKG/ofwrUfBrK9UX6/AfOVMdXH4cfyCLopFpjLW/Qyh3RP/xKxCnBsRLFiwZLsysWmQJR7Mm5Xs5rDhEk+m3xZ1U3yB78z9d+y59ffIH9ib2G1NDJTR06Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGG3+Nm5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGG3+Nm5"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698c0ff45b5so3362993a12.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Jul 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783181310; x=1783786110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qrg4okzbbX4Q+s6vcJ64+r7iRqbYqBLV4VypMj2S+k=;
        b=WGG3+Nm5FqLYAlHuC/azIEw2ULaf2Ao7nnSHTcCdwhsJ5gDw1QETjA0P3oHbkVevwe
         LIvBx4oxPxaghPMYVC5IXtsJ7t+s5338YZ2LDeiKU3g+snEl1xE/E0ZbsQy0zlaaPjVN
         mLeW6i8z9dDYSPbEcWr/uuB4DxhjaIFutqzV8KDcyBtnOM9syTwfNZMWuXbTGFIgTSHx
         xfb7/LJ+Nn4HFxw3mVyPCSNMr7tvso8IQcgeCfLxGb0uBiEawDO5qdVsdGDcA9YiC/l/
         9U7V3y2g98ki+VqqOfZvBJaT77RsklnJbjmo7iBhh81LaA2rOQCzaQy3GouUFSLaDF5q
         y//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783181310; x=1783786110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qrg4okzbbX4Q+s6vcJ64+r7iRqbYqBLV4VypMj2S+k=;
        b=LKbMXxswEZxqhIvOEGF8hw3b4JdRitZH5HecyyE9YkEUY+B6GTserRIOFIj85Q71Il
         /KjEdS5yrokrxLoPh4Eohqskm9FwYrSfk2736Rws9ZH0CeV6YdcrR8ordWfLM+EDfGMd
         YaryHlH/ukxXN4cdQBqE4yadnBkn0poex7ldOxxgAHrEoSHrd94LzYKZcp6rpn7Nqjl8
         Vyn9yORUjQ5B/dgVEn0O2iq3OZ/qluXfTQgPHo0a6gvEONwJroetNoG9eL3SsBMIwrKx
         Wot8wyWi99eoWEceTh3qGgcCyTj8B8lQE77iQpIFOUJgRzsEAJshjiI/jZD9ufqq6YLr
         lQyg==
X-Forwarded-Encrypted: i=1; AHgh+RqkI+e7VeuJNb1kIX8WOSW0S85Bl3czDaBzBEFdiZlUTaoVLKKe1jUK5H8a1ZVQZbWhVX0dYoVcU1/bGViX8gjd+r0/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb/udId8FofD1h3gYFAxLICcm9OuUI674ByC67GuxVBoO5Cyo+
	Mi+GFaRHDUfi2k1yE4gZcj0+KDyaiMmsyESr1Je6hkaDdt5bzfm7g0WZ
X-Gm-Gg: AfdE7cmhUWCZLOxzOTdbo7F8QfQ9mzIpR2hbMRd9FSurpOpW+GeLfSF0kGYzK8uFUou
	zHY7yTc1mOCTmlXgZXkkpEuY2p+46EydkpzXkQNrLOiP6Zyh7w5On2jfJ21SdUb6v+Asls/ZOHf
	F3QM1WkUlxT26VHoajLfMIoU7sTblskPFngPEgQAi7W06JjJ04+bfFX9jOZkWlHmQCN246/JBhK
	lHOcKd37DhCPdsFAW2XJHUw0RFta5tZHFo5Xd3hpwXVvJ3MFkdDIl6+X+aRJ2MdfOw4+xenPq9c
	65sr7ESyC1qxKpHAzXqwuA9+y6g0F+r9eZkU+2w7sSebexxclynDSaVuweNPk5GV8+sPXY+X3qG
	9XCnQqYFj05Ev6vjwgtNC7BUgBxNoTwEZZ1ZMFYlwkEdhtxckZChNdBY5Aq6By37ggvCCO6Gj1j
	Gfjo9ubJaDomSknP6AAIY+O1vw5XIT6a7Tmidu9ViEnGXanV4L0U1VT82j8P+SYRc=
X-Received: by 2002:a17:907:c518:b0:c12:b0b7:def with SMTP id a640c23a62f3a-c12c9d6bae4mr379868066b.14.1783181309628;
        Sat, 04 Jul 2026 09:08:29 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm438586266b.9.2026.07.04.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 09:08:29 -0700 (PDT)
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
Subject: [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
Date: Sat,  4 Jul 2026 21:07:56 +0500
Message-ID: <20260704160759.236249-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hp_bioscfg driver fails to enumerate BIOS attributes on
HP EliteBook 840 G2 (and potentially other older HP models) because:

  1. hp_init_bios_package_attribute() hard-fails when a WMI ACPI package
     contains fewer elements than the per-type expected count (11 < 13),
     even though only the first 10 common elements are required to
     register an attribute.

  2. hp_populate_enumeration_elements_from_package() returns -EIO and
     discards the entire attribute when any single element has an
     unexpected ACPI object type - typically after a BIOS AML error
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

Changes since v1:
  Patch 1/3 is new. Relaxing the element-count gate in patch 2/3 (v1's
  patch 1/2) lets packages shorter than the per-type ELEM_CNT constant
  reach hp_populate_*_elements_from_package(). Those loops don't bound
  themselves against the real package size - each one re-derives a
  "count" by reading ->package.count off elements[0], which is always
  a string (NAME) object, so it's actually reading ->string.length
  through the union. That was harmless while the old hard min_elements
  gate guaranteed a full ELEM_CNT-sized package on every call, but once
  patch 2/3 allows a shorter package through, the fixed ELEM_CNT loop
  bound walks past the end of the real elements[] array - a heap
  out-of-bounds read, on the exact EliteBook 840 G2 hardware this
  series targets.

  Patch 1/3 fixes this by threading the real, already-validated
  obj->package.count down into every hp_populate_*_package_data()
  wrapper instead of letting each one guess at it, and bounds
  hp_populate_ordered_list_elements_from_package()'s main loop (which
  previously ignored the count entirely) the same way. It's a no-op
  for any package that already meets today's ELEM_CNT minimums, and
  patch 2/3 is only safe to apply on top of it.

  Patches 2/3 and 3/3 are otherwise unchanged from v1.

  Thanks to Mario for the v1 Reviewed-by, carried forward on 2/3 and
  3/3 since those are unmodified. Armin's point about migrating to the
  buffer-based WMI API for correct marshaling is well taken as the
  longer-term fix; this series is meant as a minimal, backportable fix
  for the immediate enumeration failure and the OOB read it would
  otherwise reintroduce, not a replacement for that migration.

Testing notes:
  Tested on HP EliteBook 840 G2 running Arch Linux kernel 7.0.13-arch1-1.
  After patches, hp_bioscfg loads successfully and enumerates available
  BIOS attributes. Attributes with shortened packages are partially
  populated and accessible via sysfs. No regressions on systems that
  return full ELEM_CNT-element packages (patch 1/3 only changes
  behavior once patch 2/3's relaxed gate can hand it a shorter one).

Relevant dmesg (before fix):
  [   11.xxx] hp_bioscfg: ACPI-package does not have enough elements:
              11 < 13
  [   11.xxx] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT,
              Index (0x000000032) is beyond end of object (length 0x32)
  [   11.xxx] ACPI Error: Aborting method \_SB.WMID.WQBE
  [   11.xxx] Error expected type 2 for elem 13, got type 1
  [   11.xxx] hp_bioscfg: Returned error 0x3


Muhammad Bilal (3):
  platform/x86: hp-bioscfg: pass validated element count to package
    parsers
  platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP
    BIOS
  platform/x86: hp-bioscfg: warn on element type mismatch instead of
    failing

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c     | 16 +++++++++++++---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h     |  8 ++++++++
 .../platform/x86/hp/hp-bioscfg/enum-attributes.c | 10 ++++++----
 .../platform/x86/hp/hp-bioscfg/int-attributes.c  |  3 ++-
 .../x86/hp/hp-bioscfg/order-list-attributes.c    |  7 ++++---
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c     |  5 +++--
 .../x86/hp/hp-bioscfg/string-attributes.c        |  3 ++-
 7 files changed, 38 insertions(+), 14 deletions(-)

-- 
2.55.0

