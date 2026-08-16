Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C037AA83
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786839134; cv=none; b=Z65ZNpMwjshaY+iy+zj8cpB25LlPkEHJ+OdSbvpQ3KXV12mtxyCL9BsON9FSpEs8XCJK7btYliv4AmlVdwapZLYdIhqwJfEExosy9pN4FJRUEQEW792BM+ksS7XjuZbl2ZPRy8QyUaSZr29iCu8UStnhOxSEte6THMgNt5dC16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786839134; c=relaxed/simple;
	bh=7SiboumJRxRpo6YlKf5YWqAGfEzKfKkE2LR4T+4BrrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lYss7dWs7DbITKJ2YJG2t7G9QG2x7NBiuJj7LvtUAXFp6l9h9I8786iaUmKII6xcQNvKXdNgJTrfNpCsWlgu5PJDxq0MQzFfG/BwQtzveNvlBSLI8/1PG0sJJgf+6XTLVHBdWfuRFyQaiXgGg6+nb5KyH8Sd58XDYoyTL/8jIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3QwhgsP; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3QwhgsP"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1830482a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 17:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786839131; x=1787443931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSEGSxceY46uTkui3/4fS2UsaFNK8Yokr/kLBGeB7x8=;
        b=h3QwhgsPWf55BpGCeYdLzcqvGiXvOmnjSq0aLF9nUx7zgoprb10vJJ4d5usQmtTLQv
         VmwwXi3T7uBy4esT1OmvbWWm492tJHRxGcrh9Fd33W3zB1zU4oDO9RcaCcd4xwp73FcA
         S6RCFitmAGFwnPyJzZ3rkQuCWaTZySBXSojXD3571z8kvOaJ5MyGZWVZlOT0rdhwxLgD
         B1tvRvYrYgRqGS7fd00F3xKqznVOpE5SYrSr1+2pomYE21vE0WbVRYy1nwbRQHJgl7/6
         1OYm4zFmBKYjr8o9dYJz9nvD1Q56d39TGfEOz93TAusCwI5+jqHosVHSLHsY5Dq0Tj6W
         iijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786839131; x=1787443931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSEGSxceY46uTkui3/4fS2UsaFNK8Yokr/kLBGeB7x8=;
        b=MtJyYQpBX825vSTn5SEIPWB2/wb3ZY1I/aJceVfzcoBVteH6bjlfk/02gI8NbnBRew
         w4aIlGPypQo1mHBUxoxYi7kwU2Jzl+tEoz+kUWbHsqSrKlRkefvFbFbkBCGlIwFxojoQ
         LffPWHX/1XTNPWskTSQ4u/CV2GfSrAHLd5pTQRYF6uLk65yeaCLCu/7ZXXScBPLBChRG
         Y4l27GadneFn1tKS9SfxnQeoLlY5ynHqFp4IJv1vREFvHPKdNaIx/XR6QqDODRTa1sDr
         C/lb33AN9UY+laiyJr2ZU8fkd2mj2PpiMVr64wLEKrD7cKs8UGKQYfPMSs+AmhyYDm3R
         dSHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0rfZLmQM9HWkGeIginQa3B67HFjoHc7GA8ntyWtNcjxyyHlywex+nNdnUhHEp5IoI+rFDOVjusjzxFf0LWBYyI9r4@vger.kernel.org
X-Gm-Message-State: AOJu0YwSvPreix/dAR4khPXzqEd3o+t7vylZBy51PUW30XANQ/xbB9lt
	YUKVRsLnbEfDD82NZt07tROz8Q7dSPcFKvqMe25myNEVCvwOr9pBTolo
X-Gm-Gg: AR+sD12X0BUvwJgv+LU+VVu58UZCZXfgwA8QoQAU2iV3sOLPvKgTFudbUDkpnN4Kd7/
	Lyw8FmzexdLnUggGgueCznott3uv+wGUNH77i3ANLBEtJICLPMqQKzJuYT6hTSEKsSWE1rleNNz
	PKQLU5IFs9sfi2YHeOFVvV6j7HU9tpispz23aYiBXd0Urt5j2eJkY12M0LCrzOb5mg27u9P+FVn
	1xaHi1wPDp3bxTqXPaJ1+KzbaAJ0Ki7Do7pQ5fW6TbL4uzYv8WbaKiDBVZVNXbqoWnmX8H6IigJ
	XXx7GY4k+5RJixc4Qjr6hq63gncxlhpn0Wff2m++gPp31i8s4sJEuVRsEp+NfBvOIp2gqxbw89O
	g/+Y3IPdvk+U0qwSHD1IigesHqKOhwt3gJX1izaKZ6t7h5jgS/z1OsGtFCJiwRUYdfMV9pNJEIF
	bjW35H7i9QYfQLLwD2eWZiSxStzzgkPpX33NZLpiq2yPhjNmo=
X-Received: by 2002:a17:90a:da8f:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3933b95e327mr16369849a91.14.1786839130645;
        Sat, 15 Aug 2026 17:12:10 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm7409320a91.4.2026.08.15.17.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:12:10 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v4 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Sun, 16 Aug 2026 08:11:23 +0800
Message-ID: <20260816001129.16998-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations are not verified on real hardware, the operations are
reversed from the proprietary software (XiaomiGCommandCenter)

Additionally, this series cleans up the redundant Kconfig/Makefile hooks,
updates the MAINTAINERS entry accordingly, and introduces a newly reported
mic-mute hotkey definition for Redmibooks.

Testing status:
- Fully regression-tested on native Bitland hardware.
- Redmi-specific logic blocks are compile-tested only.
  Feedback from Redmibook hardware owners is highly appreciated.

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table
  platform/x86: bitland-mifs-wmi: Add Redmi laptop support

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 -
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 556 ++++++++++++++++++++----
 drivers/platform/x86/redmi-wmi.c        | 154 -------
 5 files changed, 482 insertions(+), 246 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 967a69120f57273e2ea4396074eceb0daa35a9c4
-- 
2.55.0

