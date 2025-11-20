Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8523426E71E;
	Thu, 20 Nov 2025 16:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763657701; cv=none; b=ix9moWfNZVqF4POEuGIIZkRSGdYMIGlz8N1UUDg34Tcj1tZbiJ01C8lUWo5ftgNEZ7waoFE7oS+dqLTsCNam4OGcocpkVNb67oXX1odgeSBo2jGmGfajkvmkldkO/RSDZOEjQdhCarYuzLIDMcCOHvJl4TA6Z0rbKK66uqF3js8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763657701; c=relaxed/simple;
	bh=ClwOe5Ry6bJbfKPAv+MEIxQ5fmn1ZsLOPEOdC9nJIK0=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=AQQblLCCHN7VKKkOwta/vKJ5YTUrTSgPjLaSbnChNiuvXq8b3FEfY7gXTi/f4GAD6elSIr73Yf8bIE6YUVqtt2u9XNoVcNK+ssmst+tEhQZZ2aeQap4Ex0ogwT06trGwsuvuB1tzbgLYBch+IvFSvPGPT1vyABkJbyZiEPG0Frw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXrYZ3Wm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXrYZ3Wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763657699; x=1795193699;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ClwOe5Ry6bJbfKPAv+MEIxQ5fmn1ZsLOPEOdC9nJIK0=;
  b=lXrYZ3WmG8YrJr+Xzn2a2eJOVX9oR0U4ipgLxpNOoSeTJyBtwCKHWpjF
   Ewi5a7NnNQFNGalL/FijjJ2bRWQi/Y+9sjJKcSmH6McsF/FKkn0A0R+HR
   odRL+LSjV6bx1Ui+Uf2CLzhwl9Hiq6AgKAyiC5jnLgqtb7Q0t4McBvGlF
   M/SNjBh7MwNdHjFn5p+bqDNRFYtokzgE4Z3oL8o3tVfayWFxtj4Lp7ehW
   F2zlgFi7F6JiXl5qd8bLNEF8wrTk2Y9+fDRau6UWmoD5H7kErVNgFSw5+
   BH+4FnDWX8N5WWxeTDgz7/jypFQbg4FWYby1PM23VW+3oZX5oQduWCA97
   Q==;
X-CSE-ConnectionGUID: 4/uzL6JpTjO6MdYHg8c8pQ==
X-CSE-MsgGUID: 5EHEluUXQBSYkFcy6lk5tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65667345"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65667345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:54:59 -0800
X-CSE-ConnectionGUID: LyVXGLVWTXW8DsehTl8kSw==
X-CSE-MsgGUID: l5rfn0TcQzKIOgSkENwmNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222078482"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.161])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:54:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 20 Nov 2025 18:49:42 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.18-4
Message-ID: <pdx86-pr-20251120184942-68786761@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.18. This one has lots of new
HW entries which adds to the size in diffstat but the individual changes are
simple.


Fixes

- acer-wmi: Ignore backlight event

- alienware-wmi-wmax: Fix quirk match table order & drop redundant entries

- amd/pmc:
  - Add Xbox Ally to spurious 8042 quirk list
  - Quirk list Lenovo Legion Go 2 NVMe resume

- msi-wmi-platform:
  - Correct GUID to uppercase
  - GUID is uncleverly copy-pasted from an example so add a DMI whitelist

- intel/speed_select_if: PCIBIOS_* return code conversion

- intel-uncore-freq & ISST: Fix kernel doc warnings


New HW support

- alienware-wmi-wmax:
  - Alienware 16 Aurora support
  - Alienware M support
  - Alienware X support
  - Dell G support

- amd/pmc:
  - ROG Xbox Ally (non-X) support

- huaway-wmi: HONOR MagicBoox X16/X14 PrintScreen & YOYO keys

- hp-wmi:
  - Omen 16-wf1xxx fan support
  - Omen MAX 16-ah0xx fan + thermal profile support
  - Victus 16-r0 and 16-s0 fan + thermal profile support

- intel/hid: Intel Nova Lake support

- intel-uncore-freq:
  - Intel Panther Lake support
  - Intel Wildcat Lake support
  - Intel Nova Lake support

Regards, i.


The following changes since commit bd34bf518a5ffeb8eb7c8b9907ba97b606166f7b:

  platform: x86: Kconfig: fix minor typo in help for WIRELESS_HOTKEY (2025-10-28 20:13:21 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.18-4

for you to fetch changes up to db30233361f94e1a84450c607989bdb671100fb6:

  platform/x86: intel-uncore-freq: fix all header kernel-doc warnings (2025-11-18 09:37:21 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.18-4

Fixes

- acer-wmi: Ignore backlight event

- alienware-wmi-wmax: Fix quirk match table order & drop redundant entries

- amd/pmc:
  - Add Xbox Ally to spurious 8042 quirk list
  - Quirk list Lenovo Legion Go 2 NVMe resume

- msi-wmi-platform:
  - Correct GUID to uppercase
  - GUID is uncleverly copy-pasted from an example so add a DMI whitelist

- intel/speed_select_if: PCIBIOS_* return code conversion

- intel-uncore-freq & ISST: Fix kernel doc warnings

New HW support

- alienware-wmi-wmax:
  - Alienware 16 Aurora support
  - Alienware M support
  - Alienware X support
  - Dell G support

- amd/pmc:
  - ROG Xbox Ally (non-X) support

- huaway-wmi: HONOR MagicBoox X16/X14 PrintScreen & YOYO keys

- hp-wmi:
  - Omen 16-wf1xxx fan support
  - Omen MAX 16-ah0xx fan + thermal profile support
  - Victus 16-r0 and 16-s0 fan + thermal profile support

- intel/hid: Intel Nova Lake support

- intel-uncore-freq:
  - Intel Panther Lake support
  - Intel Wildcat Lake support
  - Intel Nova Lake support

The following is an automated shortlog grouped by driver:

acer-wmi:
 -  Ignore backlight event

alienware-wmi-wmax:
 -  Add AWCC support to Alienware 16 Aurora
 -  Add support for the whole "G" family
 -  Add support for the whole "M" family
 -  Add support for the whole "X" family
 -  Drop redundant DMI entries
 -  Fix "Alienware m16 R1 AMD" quirk order

amd: pmc:
 -  Add Lenovo Legion Go 2 to pmc quirk list

amd/pmc:
 -  Add spurious_8042 to Xbox Ally
 -  Add support for Van Gogh SoC

hp-wmi:
 -  Add Omen 16-wf1xxx fan support
 -  Add Omen MAX 16-ah0xx fan support and thermal profile
 -  mark Victus 16-r0 and 16-s0 for victus_s fan and thermal profile support

huawei-wmi:
 -  add keys for HONOR models

intel/hid:
 -  Add Nova Lake support

intel/speed_select_if:
 -  Convert PCIBIOS_* return codes to errnos

intel-uncore-freq:
 -  Add additional client processors
 -  fix all header kernel-doc warnings

ISST: isst_if.h:
 -  fix all kernel-doc warnings

msi-wmi-platform:
 -  Fix typo in WMI GUID
 -  Only load on MSI devices

----------------------------------------------------------------
Antheas Kapenekakis (3):
      platform/x86/amd/pmc: Add support for Van Gogh SoC
      platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
      platform/x86/amd: pmc: Add Lenovo Legion Go 2 to pmc quirk list

Anthony Wong (1):
      platform/x86: alienware-wmi-wmax: Add AWCC support to Alienware 16 Aurora

Armin Wolf (3):
      platform/x86: msi-wmi-platform: Only load on MSI devices
      platform/x86: msi-wmi-platform: Fix typo in WMI GUID
      platform/x86: acer-wmi: Ignore backlight event

Edip Hazuri (1):
      platform/x86: hp-wmi: mark Victus 16-r0 and 16-s0 for victus_s fan and thermal profile support

Haotian Zhang (1):
      platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos

Jia Ston (1):
      platform/x86: huawei-wmi: add keys for HONOR models

Krishna Chomal (1):
      platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support

Kuppuswamy Sathyanarayanan (1):
      platform/x86: intel-uncore-freq: Add additional client processors

Kurt Borja (5):
      platform/x86: alienware-wmi-wmax: Fix "Alienware m16 R1 AMD" quirk order
      platform/x86: alienware-wmi-wmax: Drop redundant DMI entries
      platform/x86: alienware-wmi-wmax: Add support for the whole "M" family
      platform/x86: alienware-wmi-wmax: Add support for the whole "X" family
      platform/x86: alienware-wmi-wmax: Add support for the whole "G" family

Marcos Vega (1):
      platform/x86: hp-wmi: Add Omen MAX 16-ah0xx fan support and thermal profile

Randy Dunlap (2):
      platform/x86: ISST: isst_if.h: fix all kernel-doc warnings
      platform/x86: intel-uncore-freq: fix all header kernel-doc warnings

Srinivas Pandruvada (1):
      platform/x86/intel/hid: Add Nova Lake support

 Documentation/wmi/driver-development-guide.rst     |   1 +
 drivers/platform/x86/Kconfig                       |   1 +
 drivers/platform/x86/acer-wmi.c                    |   4 +
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |  25 +++++
 drivers/platform/x86/amd/pmc/pmc.c                 |   3 +
 drivers/platform/x86/amd/pmc/pmc.h                 |   1 +
 drivers/platform/x86/dell/alienware-wmi-wmax.c     | 106 +++++----------------
 drivers/platform/x86/hp/hp-wmi.c                   |   6 +-
 drivers/platform/x86/huawei-wmi.c                  |   4 +
 drivers/platform/x86/intel/hid.c                   |   1 +
 .../x86/intel/speed_select_if/isst_if_mmio.c       |   4 +-
 .../uncore-frequency/uncore-frequency-common.h     |   9 +-
 .../x86/intel/uncore-frequency/uncore-frequency.c  |   4 +
 drivers/platform/x86/msi-wmi-platform.c            |  43 ++++++++-
 include/uapi/linux/isst_if.h                       |  50 +++++-----
 15 files changed, 148 insertions(+), 114 deletions(-)
