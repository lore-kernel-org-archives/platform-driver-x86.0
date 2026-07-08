Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBC3AA4F9
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525734; cv=none; b=EnH/wrPPDrWgLYtt1C1fgp7X7lvR++ADO7lxGQ3utCjQZcq94apuaDgmXvjF0Zv4hJXhEvAM5ics2J72LMYrwswU5FL/oaZ7vOsnj6Vq49OjgpDTKemgLjoMuk0VYkz15Hy3NlX46V3GiS4SFnx9kEqfZkilD193GNrWw/P8uMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525734; c=relaxed/simple;
	bh=8QbeqJbFf9oi4h55Efl5R8F7Lfx9SdpLOJ/gAAydHD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9zbFIr5PXT7c+BdhBq1eSep6uAhm/hauxniH6ErLdxjOrOHINjX8xUTayHvhdtnmgt9Bms2ZQjLbQ752f8P42P2qTdOXHf74ENuH+ucxq2gSf8CP7mq2G/YMGMI0luQdP9hRZ5DVNUx2WKKfSH7ZV4fNQKL9IFomEO4gfzxMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4X7i1fk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4X7i1fk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698e5859a3cso9689a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783525731; x=1784130531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HYyhfh32LFwdBV4eDfTnSyUP2grGJ7M7W0Gn17mFP0=;
        b=E4X7i1fkS3Z40nI7+jpkxdQGzUL+RUBBDZtuVX33IO+WhcUc6C/KD9Mzy9B9nEW/d7
         rK/G5GJ8uNypzkyhf1HUj2ofBuZ9vkusGajBwt0Tj+dMXtSWx7UYRfKHVjbt9lB2Vkeh
         OHdBWkvBHeFDlS8POuLuwaHU9u5GPYneOgBuiMByfWohBqeLZVkV71jEKpi2NiD2YWVw
         PZru7AoXShcvuXzIPCvC1qB3W0qc1h0RRnBhZB/aktOb5hQ3+epwfS3lWKVV7baIy5Ng
         26mNZvc+b8UW3zee69cyJsIFzoS4dveZJbPabW1W5AACU18heUZKgAxxzG3zCRxt2ndZ
         zGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525731; x=1784130531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HYyhfh32LFwdBV4eDfTnSyUP2grGJ7M7W0Gn17mFP0=;
        b=FcM1PCDxOLoxraQlhx9xguclIOmmdx2TfB+bHL2IgIpTPe6it2/wUAYnSZnmwjiO8j
         GExhzp1/3cPfmtZV5pEKyVamDJW1ITYqbfGqUNf6KqISOH0bXHvE91iwVqQwP/NZ1ZyV
         jrviruzD3Yk432I5MTkkybD/QD+4E4dHSH8ItL+iFdGxhxBTFr+kkSSEWu9vvhM87MgA
         /aZz1BbLGvQ+r+LoX5NM4qiHQj2koBcYIFh/0EULvcONVVT1IAFD7KBBJpuWknaFGtMl
         GseCJiUXUe8DrfA9mf/ql42Xe6YvoE18PBh6I71z0AVYRprl8pY3IzRk3EsH91Mh29du
         UFeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGoIdkmsdlqBcUK+bRSN5s/51/K8K6HzqTam19PbdTPb5q0pKPLv+t3GRCmwqYWUEvnSat4M8cbi3+Lbm7NcgwFBhY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCledhg/3RouMDNkDEceRbOjWUuqhnxcOgVVSuy/n7jruqtwG
	m+AGQSg7njkfHVx8EZGisE3voPyd1j5DSfP3Ztb+3GJmYod/PXLtnTlE
X-Gm-Gg: AfdE7cnzmwKF3qwF0r2udDpGVimN7OxhZ+iWdkFrBa9wVDCd6MeT0QRwkY2G833VHma
	AyKagMgAGAkt1+5v6rRIyxYHl6j9v58JHmTo7ocX0tuJrx6F14xMyAF2TRblMdn0wH5GdLgkunm
	jAwMG+cQnWLd7KhijLgOV4eM6Uwj0vc/sqj51I8W93oX7kef3/ZKiJfURAuKMP0HFXr4d9WYzEi
	+iN8rcsT1Ec7g5ZVPzFhi5rQwruVYc51XnTY0a9kkUkg3uk9Bw+cheEqN5oBnwwIAzRzn065Vyh
	+UgI6ZshSdZ4YTChtnKlPblonsGVbksHNm9+HqgtbSCvWAyFiTLzV1YZnrKZwislcMs5ptiV1pV
	Sc7cLv6oHOfcjJdNznCHXQrmb+3FZ0tiDQJKBIhSy/SreQEzbfxxrUM5WwbD/4NlGqBpWqGP1C4
	/1/V9vECkqJ5O2BP8kHG1YRVvhEitLX3KcaVaMW5PAy6WJuAUthU6thMjbJXHZIcY=
X-Received: by 2002:a05:6402:50ca:b0:698:ec2f:d6c9 with SMTP id 4fb4d7f45d1cf-69ab3c16be8mr1547585a12.14.1783525731269;
        Wed, 08 Jul 2026 08:48:51 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm945125a12.23.2026.07.08.08.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:48:50 -0700 (PDT)
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
Subject: [PATCH v4 0/4] platform/x86: hp-bioscfg: fix ACPI package handling on HP EliteBook 840 G2
Date: Wed,  8 Jul 2026 20:48:41 +0500
Message-ID: <20260708154846.12356-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes attribute enumeration failures on the HP EliteBook 840
G2 (BIOS M71 Ver. 01.31), whose BIOS returns shorter ACPI WMI packages
than hp_init_bios_package_attribute() currently accepts, plus occasional
type-mismatched elements after a failed WMI query.

Patches 1 and 2 are prerequisites: they make each per-type parser bound
itself on the real, validated package count instead of an incorrect value
derived from the NAME string's length. Both are no-ops today, since
every package the driver currently handles already meets the old
minimum size. They matter because patch 3 depends on them: once the
minimum size check is relaxed, the elements array can genuinely be
smaller than a parser's fixed per-type count, and without patches 1 and
2 this would result in an out-of-bounds heap read.

Patch 3 relaxes that minimum size check to accept packages missing
optional type-specific fields, as long as the common fields (NAME
through SECURITY_LEVEL) are present.

Patch 4 changes a type mismatch on one element from aborting the whole
attribute to warning and skipping the offending element, matching the
existing handling of unsupported element types.

Patches 1 through 3 are intended to be applied together, as patch 3
depends on the preparatory fixes in patches 1 and 2.

v3: https://lore.kernel.org/all/20260707202111.35414-1-meatuni001@gmail.com/

Changes since v3:
- Patch 1: dropped the Fixes: tag (the patch does not fix anything on
  its own; Cc: stable is enough for stable to pull it in as a series
  dependency) and reworded the forward reference from "a later patch"
  to "an upcoming change". (Ilpo)
- Patch 2: dropped the Fixes: tag and reworded the forward reference as
  in patch 1, plus dropped the redundant sentence describing the
  out-of-bounds read. (Ilpo)
- No code changes; commit-message wording only.

Changes since v2:
- Split the single "pass validated count and bound ordered list
  parsing" patch into two: patch 1 fixes the count value passed to
  each wrapper, patch 2 adds the missing elem < count bound to the
  ordered list parser. (Ilpo)
- Rewrote patch 1's commit message to lead with the bug instead of
  quoting code, and to state up front that a later patch depends on
  it. (Ilpo)
- Reworded "thread the count down" and "guess at it" phrasing. (Ilpo)

Muhammad Bilal (4):
  platform/x86: hp-bioscfg: pass validated element count to package
    parsers
  platform/x86: hp-bioscfg: bound ordered-list parsing by the package
    count
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

