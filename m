Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9083531618B;
	Fri, 11 Sep 2026 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122470; cv=none; b=haTCHyaVADquIxuh+tlcrHNzBJA4OD4FpvV0TBoPtFK7Xqhael+jNyStfj/AcLcz94YdEoAO7IB+XEs+HOMfRgvpgKrDWte6LI4wxyaoSMVUPfRmks9mVY6cELF2X2YheXGAj9cN/18ekE6pvtwStXZ1eNf4xaOj5KrOKKZiOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122470; c=relaxed/simple;
	bh=P4x314Sbl0lVVh/77vmInNYYDJBDBp9tvn3v494g5bI=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=KF9dJ5PVlfVqNODzEi89ZQug0BAAs42uFTETEI4OkMxJ6M7GfRiP/s5gyHdTaEBsAwCWZnO9mcvj4wvLLTi5IApH36XIrs0KsH6zE797ijaOYUMFnnHp8jWCimLlXF8UlcLPOjhphN2svf/+dAgJrYAUlIzm2R2PktBBV9M0wGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=do7E63H/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="do7E63H/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789122468; x=1820658468;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P4x314Sbl0lVVh/77vmInNYYDJBDBp9tvn3v494g5bI=;
  b=do7E63H/KHbHpoS0bHsoj61fTG7t2YNJhQVVEOImZ0xGHA60a+ldrGIG
   4CDx7H3vxhBSN+fItMPHqRO5T/qG1pHi6peTh1hQwOpIeafn5htk9eWdu
   OAvou5s4aod5DTktTJYY6QFWgz4LiS49butnmScjUHBOEzLBCPy7prDvN
   ZLcPP5iGGM92WcuKb07TMb/I2ZHoef6mGx+rJWq1ar/FufHCe0fvg4d0a
   8TzfRoLYyTtyfqFxh7Df8lmb8JTOcTSZFqiIpS6Y12l1DFkUjr0JawYFE
   o+0OzxAnqwiUD4SHDN701Y8FpJNKnfLsoQjjbyhGQfEu2fLKpgjKq6FJW
   Q==;
X-CSE-ConnectionGUID: ZsabexPZStS5fL2NeUbXSg==
X-CSE-MsgGUID: wDeca1UwSjiUVcGCnXs3KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93450826"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93450826"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:27:45 -0700
X-CSE-ConnectionGUID: gDZmUSYnR3qY9oQ+Ix2kHQ==
X-CSE-MsgGUID: cFAjd9JTRhCNuY3raonfSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="265682956"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:27:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 11 Sep 2026 13:02:48 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.3-2
Message-ID: <pdx86-pr-20260911130248-2488210644@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v7.3.

Fixes

- amd/pmf: Fix build on !CONFIG_AMD_PMF_DEBUG

- asus-laptop: Fix ACPI event handling

- hp-wmi: Fix board_params typo for 8DD6 board

- x86-android-tablets: Fix Arizona and Crystal Cove GPIO lookups

Regards, i.


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.3-2

for you to fetch changes up to d144a494d81fcf2d1c5cf58b01c655bb8bafc701:

  MAINTAINERS: fix sysfs-platform-ayaneo-ec documentation path (2026-09-09 16:44:02 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.3-2

Fixes

- amd/pmf: Fix build on !CONFIG_AMD_PMF_DEBUG

- asus-laptop: Fix ACPI event handling

- hp-wmi: Fix board_params typo for 8DD6 board

- x86-android-tablets: Fix Arizona and Crystal Cove GPIO lookups

The following is an automated shortlog grouped by driver:

amd/pmf:
 -  fix build on !CONFIG_AMD_PMF_DEBUG

asus-laptop:
 -  Fix ACPI event handling

hp-wmi:
 -  Fix board_params typo for 8DD6 board

MAINTAINERS:
 -  fix sysfs-platform-ayaneo-ec documentation path

x86-android-tablets:
 -  add Crystal Cove GPIO swnode support
 -  drop redundant swnode group on YT3
 -  fix Arizona GPIO swnode references
 -  fix gpio_secondary_fwnode_init() not working
 -  hold device reference for secondary fwnode teardown
 -  pass node group to gpio_secondary_fwnode_init()
 -  use shared battery swnode group on Yoga Tab 2

----------------------------------------------------------------
Arda Doğu Ari (1):
      platform/x86: hp-wmi: Fix board_params typo for 8DD6 board

Armin Wolf (1):
      platform/x86: asus-laptop: Fix ACPI event handling

Dmitry Torokhov (6):
      platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
      platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
      platform/x86: x86-android-tablets: pass node group to gpio_secondary_fwnode_init()
      platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode support
      platform/x86: x86-android-tablets: drop redundant swnode group on YT3
      platform/x86: x86-android-tablets: use shared battery swnode group on Yoga Tab 2

Gabriel Windlin (1):
      MAINTAINERS: fix sysfs-platform-ayaneo-ec documentation path

Hans de Goede (1):
      platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init() not working

Pedro Falcato (1):
      platform/x86/amd/pmf: fix build on !CONFIG_AMD_PMF_DEBUG

 MAINTAINERS                                        |  2 +-
 drivers/platform/x86/amd/pmf/spc.c                 |  2 +-
 drivers/platform/x86/asus-laptop.c                 |  4 +-
 drivers/platform/x86/hp/hp-wmi.c                   |  2 +-
 drivers/platform/x86/x86-android-tablets/core.c    | 44 +++++++++++++++++-----
 drivers/platform/x86/x86-android-tablets/lenovo.c  | 37 ++++++------------
 .../x86/x86-android-tablets/x86-android-tablets.h  |  2 +
 7 files changed, 53 insertions(+), 40 deletions(-)
