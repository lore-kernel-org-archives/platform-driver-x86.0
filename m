Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC8478E20;
	Fri, 15 May 2026 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845780; cv=none; b=mkmlUAyQ5k0+03Wo3EexCAIF5x4Kirn0iHvLPMIgw3EHbIDXqBOifnACHR8QCPAtKhAhh+l8SoG1Nih2I3cFdI/Gbbn2S7J+/gY4K7su2CmMaU20NgGalUoBR+29qEby6b+Ky7pA6Gi3xtwLl14EBls67zTcs7YCr4bAEFvJgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845780; c=relaxed/simple;
	bh=ED21O/dN+NhhTHEmGSH3zc8nGLkq1JGuRU2sNp2tl68=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=SQHmvvS1WzBWg/Ulb23vS+r2dBMYyM7hQpKHwwgcO0CSVWUMm0bbjaVLCaiy7nXULxYsLMrWrQIkp32Fibhy83EMUjhZXwZq77heYziSHGjZMcgBu3WUKaaThSbgcgsYTVgN++tIq+A7svvata35ILUAs74HExn/317ORW3e9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8Iu/j4X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8Iu/j4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778845778; x=1810381778;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ED21O/dN+NhhTHEmGSH3zc8nGLkq1JGuRU2sNp2tl68=;
  b=Y8Iu/j4XpPDIuxCwAO1Wgs7zgxMvPsJzq/oY6gC8Qsh5jren58QL8U+9
   wutovQN1SJZ3f9y0a3RF1nIInmt9+iEyI0Z+rj7dXaf5N69SbaJI0TOLY
   x8mTlup/HHz6Gk1kJQLp/jxRqG1FwpztFqyoW1g04Jewpwq2RQ2n71E0h
   5ibOEfZ7sc60JaqfGVQFD+HdXbWNpYM81EytJQRNaKNQ5M1VyKMMzmEIn
   71cY7HKh+FUceQAeaX6hW2cf4yx+vRR66usHmunNVhskt2R4UPJjRh50L
   d9C7TZmXAhJea7UZ2pCKyWRPx56wL0urGAideg7J9Ss3w3zNvBPrhB9CJ
   A==;
X-CSE-ConnectionGUID: 1RUQfHMkSTSUWlJ3XPAUkQ==
X-CSE-MsgGUID: /ECw9JEDTaSOrbamR8IpZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105258080"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="105258080"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:49:38 -0700
X-CSE-ConnectionGUID: 1AwA1l7TTWax7VvAGFpw7w==
X-CSE-MsgGUID: /IlMfcXmTzibQCeBEz2cnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262195301"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.115])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:49:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 15 May 2026 14:47:50 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.1-3
Message-ID: <pdx86-pr-20260515144750-2668315946@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v7.1.

Fixes and New HW Support:

- asus-nb-wmi: Use existing keyboard quirk for ASUS Zenbook Duo UX8407AA

- hp-wmi: Add support for Victus 16-r0xxx (8BC2)

- intel/vsec_tpmi:

  - Move debugfs register before creating devices

  - Prevent fault during unbind

- lenovo-wmi-*:

  - Fix memory leak in lwmi_dev_evaluate_int()

  - Balance IDA id allocation and free

  - Balance component bind and unbind

  - Prevent sending uninitialized WMI arguments to the device

  - Decouple lenovo-wmi-gamezone and lenovo-wmi-other to simplify module
    dependency graph

  - Limit adding attributes to supported devices

- samsung-galaxybook: Handle kbd backlight, mic mure and camera block
                      hotkeys

Regards, i.


The following changes since commit 863810d4985ad214f70c1623f24384ccc850f2a2:

  platform/x86: lenovo: wmi-other: Fix uninitialized variable in lwmi_om_hwmon_write() (2026-04-30 15:41:18 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-3

for you to fetch changes up to 2997606dd17729404cef9821ce66dd037b6019eb:

  platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8407AA (2026-05-11 17:15:16 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.1-3

Fixes and New HW Support:

- asus-nb-wmi: Use existing keyboard quirk for ASUS Zenbook Duo UX8407AA

- hp-wmi: Add support for Victus 16-r0xxx (8BC2)

- intel/vsec_tpmi:

  - Move debugfs register before creating devices

  - Prevent fault during unbind

- lenovo-wmi-*:

  - Fix memory leak in lwmi_dev_evaluate_int()

  - Balance IDA id allocation and free

  - Balance component bind and unbind

  - Prevent sending uninitialized WMI arguments to the device

  - Decouple lenovo-wmi-gamezone and lenovo-wmi-other to simplify module
    dependency graph

  - Limit adding attributes to supported devices

- samsung-galaxybook: Handle kbd backlight, mic mure and camera block
                      hotkeys

The following is an automated shortlog grouped by driver:

asus-nb-wmi:
 -  add DMI quirk for ASUS Zenbook Duo UX8407AA

hp-wmi:
 -  Add support for Victus 16-r0xxx (8BC2)

intel:
 -  Add notifiers support
 -  Move debugfs register before creating devices

intel/tpmi/plr:
 -  Prevent fault during unbind

lenovo:
 -  Decouple lenovo-wmi-gamezone and lenovo-wmi-other

lenovo-wmi-helpers:
 -  Fix memory leak in lwmi_dev_evaluate_int()
 -  Move gamezone enums to wmi-helpers

lenovo-wmi-other:
 -  Add Attribute ID helper functions
 -  Balance component bind and unbind
 -  Balance IDA id allocation and free
 -  Fix tunable_attr_01 struct members
 -  Limit adding attributes to supported devices
 -  Zero initialize WMI arguments

samsung-galaxybook:
 -  Handle ACPI hotkey notifications
 -  Refactor camera lens cover input device

----------------------------------------------------------------
Ayaan Mirza Baig (2):
      platform/x86: samsung-galaxybook: Refactor camera lens cover input device
      platform/x86: samsung-galaxybook: Handle ACPI hotkey notifications

Derek J. Clark (5):
      platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
      platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
      platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
      platform/x86: lenovo-wmi-other: Add Attribute ID helper functions
      platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices

Haichen Feng (1):
      platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)

Paolo Pisati (1):
      platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8407AA

Rong Zhang (4):
      platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
      platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
      platform/x86: lenovo-wmi-other: Balance component bind and unbind
      platform/x86: lenovo: Decouple lenovo-wmi-gamezone and lenovo-wmi-other

Srinivas Pandruvada (3):
      platform/x86: intel: Move debugfs register before creating devices
      platform/x86: intel: Add notifiers support
      platform/x86/intel/tpmi/plr: Prevent fault during unbind

 drivers/platform/x86/asus-nb-wmi.c         |   9 +
 drivers/platform/x86/hp/hp-wmi.c           |   4 +
 drivers/platform/x86/intel/plr_tpmi.c      |  45 ++++-
 drivers/platform/x86/intel/vsec_tpmi.c     |  29 ++-
 drivers/platform/x86/lenovo/Kconfig        |   1 -
 drivers/platform/x86/lenovo/wmi-capdata.c  |   8 +-
 drivers/platform/x86/lenovo/wmi-capdata.h  |  20 ++
 drivers/platform/x86/lenovo/wmi-events.c   |   2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c |   7 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h |  20 --
 drivers/platform/x86/lenovo/wmi-helpers.c  | 105 ++++++++++-
 drivers/platform/x86/lenovo/wmi-helpers.h  |  21 +++
 drivers/platform/x86/lenovo/wmi-other.c    | 294 ++++++++++++++---------------
 drivers/platform/x86/lenovo/wmi-other.h    |  16 --
 drivers/platform/x86/samsung-galaxybook.c  |  69 ++++---
 include/linux/intel_tpmi.h                 |   6 +
 16 files changed, 424 insertions(+), 232 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h
