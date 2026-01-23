Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ED925A642;
	Fri, 23 Jan 2026 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183825; cv=none; b=NpATCJVeBrUr4VolfCKVjmNXHw5sCr7LoFqsXzxABd646PeP/TJHIVLQyTyv8vLAsc8C5ntuNForh3kM/Zt2ZQyg8iMQaK4cGewb3Kwlt/36KdteDWTAVXQ9sPFKBez5ez3y7pO4l34PhyuKTj2qUKpfNuqe/ohBtIELsMy0w18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183825; c=relaxed/simple;
	bh=5zjwYmyvManPkVFMkUWr2sV6hHw2gFqCVVw43HPNAp0=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=tfwwlHV2WWGzPjj61sV1tph7gM3i8azE51eJrqi4WRcE+JDTAe0dBQ/0n+wgPOoVeEDXpz01DLN8UttQwsTqzN344iOehr+qbg7mgsot9CIIAC+aGyuEPDk6UQH3P4fS/2N7ecxF6EqB8whrRxZiK2YTfeUQ9nJpGMcldogwR24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCPNspiV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCPNspiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769183824; x=1800719824;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5zjwYmyvManPkVFMkUWr2sV6hHw2gFqCVVw43HPNAp0=;
  b=NCPNspiVupgOxGoiYvAARp/C0LeIaT5/nb30Z8v6cGaI/jkxz/vJOByU
   3dT4xsuYrTaN5938tQkdWGRe2sKPUqb5JeccLw1kIAI3IYRGiHxj0AhAQ
   SCm3vDc6Yhcz81Qz/WNTzz2VjytwGRlF4teQwS5JTO/21QV4/tsbmq0CI
   bJtdkRhskciJKX1z2+4LpQFOlvTAgUyfuzvezIyjuZRpJCuhJDGcEtt3X
   OF7dAkGARS47sp9cxh+SgrOakRLbgUrA7Vu+twsQvwkHw1xAG4v3Tch+D
   3PY1SR4kefes2CgVknn4ez7Nb4+0OZq6F+rX3gyZg0fpu484uxjlyS4f0
   g==;
X-CSE-ConnectionGUID: YxB3rz9TSHu6k7rk+WtRXQ==
X-CSE-MsgGUID: LO+kUSR3SfS4pLI7FZ5rdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="58010763"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="58010763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:57:04 -0800
X-CSE-ConnectionGUID: FDDt+MJJS9CQYylOEGrioA==
X-CSE-MsgGUID: 38BgAzBeSP6/b8S/hckrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207398119"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.164])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 07:57:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 23 Jan 2026 17:54:54 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.19-3
Message-ID: <pdx86-pr-20260123175454-900019998@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.19.

Fixes and New HW Support

- acer-wmi:

  - Extend support for Acer Nitro AN515-58

  - Fix missing capability check

- amd/wbrf: Fix memory leak in wbrf_record()

- asus-armoury:

  - Fix GA403U* matching

  - Fix FA608UM TDP data

  - Add many models

- asus-wmi: Move OOBE presence check outside deprecation ifdef

- docs:

  - alienware-wmi: Typo fix

  - amd_hsmp: Fix document link

- hp-bioscfg:

  - Fix kernel panic in GET_INSTANCE_ID macro

  - Fix kobject warnings for empty attribute names

  - Correct GUID to uppercase (lowercase letter prevented autoloading
    the module)

- mellanox: Fix SN5640/SN5610 LED platform data

Regards, i.


The following changes since commit c6703f10c8cc36f53b867bdbdd5bacaaa47ce799:

  platform/x86: asus-armoury: add support for G835LW (2025-12-30 12:51:46 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-3

for you to fetch changes up to 4b11f2336e23d5c55b76591bd8ac39b059f68ad0:

  platform/x86: acer-wmi: Fix missing capability check (2026-01-20 17:10:56 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.19-3

Fixes and New HW Support

- acer-wmi:

  - Extend support for Acer Nitro AN515-58

  - Fix missing capability check

- amd/wbrf: Fix memory leak in wbrf_record()

- asus-armoury:

  - Fix GA403U* matching

  - Fix FA608UM TDP data

  - Add many models

- asus-wmi: Move OOBE presence check outside deprecation ifdef

- docs:

  - alienware-wmi: Typo fix

  - amd_hsmp: Fix document link

- hp-bioscfg:

  - Fix kernel panic in GET_INSTANCE_ID macro

  - Fix kobject warnings for empty attribute names

  - Correct GUID to uppercase (lowercase letter prevented autoloading
    the module)

- mellanox: Fix SN5640/SN5610 LED platform data

The following is an automated shortlog grouped by driver:

acer-wmi:
 -  Extend support for Acer Nitro AN515-58
 -  Fix missing capability check

amd:
 -  Fix memory leak in wbrf_record()

asus-armoury:
 -  Add power limits for Asus G513QY
 -  add support for FA401UV
 -  add support for FA617XT
 -  add support for G835L
 -  add support for GA403UV
 -  add support for GA403WM
 -  add support for GA403WW
 -  add support for GV302XV
 -  fix ppt data for FA608UM
 -  fix ppt data for GA403U* renaming to GA403UI
 -  keep the list ordered alphabetically

asus-wmi:
 -  fix sending OOBE at probe

docs: alienware-wmi:
 -  fix typo

docs:
 -  fix PPR for AMD EPYC broken link

hp-bioscfg:
 -  Fix automatic module loading
 -  Fix kernel panic in GET_INSTANCE_ID macro
 -  Fix kobject warnings for empty attribute names

mellanox:
 -  Fix SN5640/SN5610 LED platform data

----------------------------------------------------------------
Akiyoshi Kurita (1):
      docs: alienware-wmi: fix typo

Armin Wolf (2):
      platform/x86: acer-wmi: Extend support for Acer Nitro AN515-58
      platform/x86: acer-wmi: Fix missing capability check

Denis Benato (11):
      platform/x86: asus-armoury: add support for GA403WM
      asus-armoury: fix ppt data for GA403U* renaming to GA403UI
      platform/x86: asus-armoury: add support for GA403UV
      platform/x86: asus-armoury: add support for GV302XV
      platform/x86: asus-armoury: add support for FA401UV
      platform/x86: asus-armoury: add support for FA617XT
      platform/x86: asus-wmi: fix sending OOBE at probe
      platform/x86: asus-armoury: fix ppt data for FA608UM
      platform/x86: asus-armoury: add support for G835L
      platform/x86: asus-armoury: keep the list ordered alphabetically
      platform/x86: asus-armoury: add support for GA403WW

Haiyue Wang (1):
      docs: fix PPR for AMD EPYC broken link

Mario Limonciello (3):
      platform/x86: hp-bioscfg: Fix kobject warnings for empty attribute names
      platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
      platform/x86: hp-bioscfg: Fix automatic module loading

Oleksandr Shamray (1):
      platform/mellanox: Fix SN5640/SN5610 LED platform data

Shresth Sarthak Awasthi (1):
      platform/x86: asus-armoury: Add power limits for Asus G513QY

Zilin Guan (1):
      platform/x86/amd: Fix memory leak in wbrf_record()

 .../admin-guide/laptops/alienware-wmi.rst          |   2 +-
 Documentation/arch/x86/amd_hsmp.rst                |   4 +-
 Documentation/misc-devices/amd-sbi.rst             |   2 +-
 drivers/platform/mellanox/mlx-platform.c           |   2 +-
 drivers/platform/x86/acer-wmi.c                    |  13 +-
 drivers/platform/x86/amd/wbrf.c                    |   4 +-
 drivers/platform/x86/asus-armoury.h                | 224 ++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.c                    |   3 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   8 +
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h       |  12 +-
 10 files changed, 256 insertions(+), 18 deletions(-)
