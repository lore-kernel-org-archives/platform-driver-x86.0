Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25935F184
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783455710; cv=none; b=H84UFCT7sKzLq+X54pWiGPk2muPZix8YIECRjaZiz2apayE2Hw9KZIAVItKlv1Fnucg0ofd95mmpIMCmiFlZ8b4KTqgQuAyGG9WhwHbaXRoZF0ETPBbGxnEuT4C0yQiL9c2LlSuQPvSXrewzKqVW+uO3GrdPCBpYYwlBuz5xLRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783455710; c=relaxed/simple;
	bh=dKwM/3n0efJG7ZRg/nY3abzZr+UYyaTJWkieSpTZlc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3I+HTKpTXFqKCDGLUKTdrTez32q424JdTsGJRc48c7AeRmbAPpoYqDJn4lFhLNZG5c17sGgNfpkvVdQf3BdjgNTUotzUAk9lTzaiz22QBjzi6yncPcxdOCnkIp/VxZuKF/32VoLxPZlczw1LgmnyI0bcMXWkDOWuE02uwm9Gyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tih0d/4v; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tih0d/4v"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so6668411a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783455707; x=1784060507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mm3elO8712GK4l4hbfVHYSLDXC8IRHmSwT+OSMs7O8Y=;
        b=Tih0d/4vPPDSe3o0OXqKuyWStjsL1pzbuoXwmJEgXMQNOLJ94V6TJM00naqPDsDp+H
         khsq3fEhkY/86aEOyegHaG1YhQTxeOS5WD5KYJpRcKXzwPV9Vq6rSUJnf8WeSkkMqpF1
         R8FYlibvmqTJbw8H45t9ZltmY1RhwkqiU+PqkhMa4Tk1L5BWBnacmT9/UWfUXIi7j3cS
         6BcejqZPgcavLAVfsLXIt00KMOLpY0jrKe45OMb48XQpZ6ccx651QSUC8RPIRwV/BLHi
         I0JcWaHvffLsfwwNXFTJX5MDg5KkRcZS1dUDXCT7T44n/lRHzT5vIDFpqAMQJBxvuIQ2
         0TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783455707; x=1784060507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mm3elO8712GK4l4hbfVHYSLDXC8IRHmSwT+OSMs7O8Y=;
        b=jVJCW0M2lD4VeIKK54884flD+1hVj1lifyr7wdMCmaYXTiwO07o3AJo/CZDbT3Dq3Y
         1qbgwRIc529mO2HS9yYLhbDn4tft3ZrDqtIBxOA4VlTsGM9uhEI/uPi3IWlh1LyG9lB+
         Ycrug9sbxAriI6RrWPrYwQCtuEwUUd+DpRrDf4D322Dikv/QVZvDERipydmYLJd7gy/X
         gUy3V2P5T0i4d4L0BUq6hMJN4DtyD0qSop4CRk66XIQTX4Wb2L65Yup3ZWcdkYBX7icm
         bSuxslhr06CMQ6Jaim6x7M9TYTTvPyDAADJlZ6lwNGXRyTCDQPUiujVTY8gUMDFyGl/z
         V37A==
X-Gm-Message-State: AOJu0YxRwd5I6mqIDT91HJqmXErd6469StX8rfyD9owAHQk48RiwLAAs
	kabJwoRs7+d6oYMtVZaPs+ugwqqw0+Fanfwgi27Q8MXVDPbW+D/LmpzM0ncSkBYq
X-Gm-Gg: AfdE7cnAnQZUiIzQcot20vWxjL/9MvIFptvkuLB4ovQIffXpn33mSvT/Jf87xBQXtXU
	W700nc1KcLuz4gVwrdWDEPw8nthwn42VKyQQPfhYj8k6Nf/+M5c21jvyLdAX0vWQyob4CYsdfLZ
	Znl5yIBQlTGvlwHqg8dXifDJcH+4DhOYtspEnIA0FlcjTQDe2sFri4nL0YQ7CPqN+UxJpwjSa2T
	EgqbBWSHB8qBPk/HVH9GoqbdNBzZ8MeFG1/mc+mkaILqH1rI7QXtJADfURsuRCfUbCknHya9YOs
	ovzkhPtVO9TEClyp9B62WKcQ1E8eV45wNixrnfVi4GAFakCBrf+/xr3Q/KX85ahRRpfVlOOGE8+
	9g/2OP99X7FDxeg/8Fyv7pKNtH4IamxEZiZp4eF6wU4oMkuyYdaZqQLCTZDwPwLlvzvXvt0XFap
	bDa5NDErhAMf+2f/f93lBPvc0x5RPER+gwO2jBq3bF1LOljcV+fdo+zHs3HxCq598=
X-Received: by 2002:a17:906:138d:b0:c12:86a5:3ada with SMTP id a640c23a62f3a-c15a67bc915mr265068366b.36.1783455706820;
        Tue, 07 Jul 2026 13:21:46 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm637930a12.0.2026.07.07.13.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:21:46 -0700 (PDT)
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
Subject: [PATCH v3 0/4] platform/x86: hp-bioscfg: fix ACPI package handling on HP EliteBook 840 G2
Date: Wed,  8 Jul 2026 01:21:07 +0500
Message-ID: <20260707202111.35414-1-meatuni001@gmail.com>
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

