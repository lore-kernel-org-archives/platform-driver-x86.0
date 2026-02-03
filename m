Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E63D333C;
	Tue,  3 Feb 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137934; cv=none; b=obQtOsijwQoqClc9MhpBX9WmFeuKTrEU/Gw+65v6mdt1qs0U1jDVBlFIsGqrMsnHCfMKDA9SUT2TkCI23WuEu4k/VcTYEnJtum5swvMnxCDldW9DdtAQNtPXKuZdPvNnM/nCs2W5y9E+c74JAzIhVCqhY7FXX4Sl6tizFr46zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137934; c=relaxed/simple;
	bh=17+WsivHDn7/LqIHxAPrfYVDg4FDnp2lrdAEsxfJv4A=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=WEbrtB7pzPNsvF/S/ZwbYhQHt8LVH5synb4ps8WFOJl2qKdvYO3IqbMSZDnTEPjKSngBR04uFJSSohmmDRsqxDdOVTR7qwpBEdLaKnQXSkC61C2bhQlDjXoNThabSMrafZGq44FfyNgwavPepWxGjtExmP+3W9LvlK19YmmRBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ebfz/JJZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ebfz/JJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770137932; x=1801673932;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=17+WsivHDn7/LqIHxAPrfYVDg4FDnp2lrdAEsxfJv4A=;
  b=Ebfz/JJZlogB0ClWBdwnVm+kWqK6P6lmy1YZTRqSR+jZg4r4cWTs6CiK
   pzc07sfQz3apB3KCiXJu0t46CjdrMQMfKaoY2k4CTEptd6K9tOCqUvE/f
   3WSqXu96eMU2Wf5AgemsyQlCOR4fwhxKc8Jd89avKN/s2paqlov6lGYuo
   66CBrWUjy/IEDyOvj/Div8Uk+9IUBv8sytThNpoJP+iMR+ae73IkkCjHJ
   6ndhb8Bn7+sShWIDmD47uWZpOelSjCgf2P/6/ALV4DQLA89NJFCk8xNOe
   EiafP+aLO+Ozb2EyYzcBuzu+JFkeb2Thmv7X9AHKi2dHAEkKQgtbSSKgV
   Q==;
X-CSE-ConnectionGUID: lI0Hp9ViSfedsG/6MPg36A==
X-CSE-MsgGUID: 1agMPDa+TTurF/ZlZs8bzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71474339"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71474339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:58:52 -0800
X-CSE-ConnectionGUID: VDTwDKxUTBihiAm5mkDl7A==
X-CSE-MsgGUID: vqEr/VwlSJmjZvdpumPR6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209986202"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:58:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 03 Feb 2026 18:56:52 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.19-4
Message-ID: <pdx86-pr-20260203185652-16333416@linux.intel.com>
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

Fixes and New HW support:

- amd/pmc: Add quirk for MECHREVO Wujie 15X Pro

- classmate-laptop: Add missing NULL pointer checks

- hp-bioscfg: Skip empty attribute names

- intel_telemetry:
  - Fix PSS event register mask
  - Fix swapped arrays in PSS output

- intel/tpmi/plr: Make the file domain<n>/status writeable

- intel/vsec: Add Nova Lake PUNIT support

- lg-laptop: Recognize 2022-2025 models

- panasonic-laptop: Fix sysfs group leak in error path

- toshiba_haps: Fix memory leaks in add/remove routines
Regards, i.


The following changes since commit 4b11f2336e23d5c55b76591bd8ac39b059f68ad0:

  platform/x86: acer-wmi: Fix missing capability check (2026-01-20 17:10:56 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-4

for you to fetch changes up to 008bec8ffe6e7746588d1e12c5b3865fa478fc91:

  platform/x86/intel/tpmi/plr: Make the file domain<n>/status writeable (2026-01-29 14:38:40 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.19-4

Fixes and New HW support:

- amd/pmc: Add quirk for MECHREVO Wujie 15X Pro

- classmate-laptop: Add missing NULL pointer checks

- hp-bioscfg: Skip empty attribute names

- intel_telemetry:
  - Fix PSS event register mask
  - Fix swapped arrays in PSS output

- intel/tpmi/plr: Make the file domain<n>/status writeable

- intel/vsec: Add Nova Lake PUNIT support

- lg-laptop: Recognize 2022-2025 models

- panasonic-laptop: Fix sysfs group leak in error path

- toshiba_haps: Fix memory leaks in add/remove routines
The following is an automated shortlog grouped by driver:

amd/pmc:
 -  Add quirk for MECHREVO Wujie 15X Pro

classmate-laptop:
 -  Add missing NULL pointer checks

hp-bioscfg:
 -  Skip empty attribute names

intel_telemetry:
 -  Fix PSS event register mask
 -  Fix swapped arrays in PSS output

intel/tpmi/plr:
 -  Make the file domain<n>/status writeable

intel/vsec:
 -  Add Nova Lake PUNIT support

lg-laptop:
 -  Recognize 2022-2025 models

panasonic-laptop:
 -  Fix sysfs group leak in error path

toshiba_haps:
 -  Fix memory leaks in add/remove routines

----------------------------------------------------------------
David E. Box (1):
      platform/x86/intel/vsec: Add Nova Lake PUNIT support

Jonas Ringeis (1):
      platform/x86: lg-laptop: Recognize 2022-2025 models

Kaushlendra Kumar (2):
      platform/x86: intel_telemetry: Fix swapped arrays in PSS output
      platform/x86: intel_telemetry: Fix PSS event register mask

Mario Limonciello (1):
      platform/x86: hp-bioscfg: Skip empty attribute names

Rafael J. Wysocki (3):
      platform/x86: panasonic-laptop: Fix sysfs group leak in error path
      platform/x86: toshiba_haps: Fix memory leaks in add/remove routines
      platform/x86: classmate-laptop: Add missing NULL pointer checks

Ricardo Neri (1):
      platform/x86/intel/tpmi/plr: Make the file domain<n>/status writeable

gongqi (1):
      platform/x86/amd/pmc: Add quirk for MECHREVO Wujie 15X Pro

 drivers/platform/x86/amd/pmc/pmc-quirks.c      |  7 ++++++
 drivers/platform/x86/classmate-laptop.c        | 32 ++++++++++++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c   |  5 ++++
 drivers/platform/x86/intel/plr_tpmi.c          |  2 +-
 drivers/platform/x86/intel/telemetry/debugfs.c |  4 ++--
 drivers/platform/x86/intel/telemetry/pltdrv.c  |  2 +-
 drivers/platform/x86/intel/vsec.c              |  2 ++
 drivers/platform/x86/lg-laptop.c               | 11 ++++++++-
 drivers/platform/x86/panasonic-laptop.c        |  4 +++-
 drivers/platform/x86/toshiba_haps.c            |  2 +-
 10 files changed, 64 insertions(+), 7 deletions(-)
