Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2E2E764D;
	Wed, 31 Dec 2025 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176375; cv=none; b=O+qK5oT7gPtM+juMDcLTQEFciUlUvbJDz+4fHFHBTCfNdJZ2/F5PVQbIET8Loa8am7RRa6iKe3D590laF1LFalQIwMZmby+EsAamIfHSHnlT0yOPeeqsnB9t7RX3BvUHOO3R/jSUHDSzgoCWkv+H2S1HPWcniiLyxO6FlF28cOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176375; c=relaxed/simple;
	bh=+fvjN0iPO/jSPODeyRMkaTNrupoqHC/Wqjf6fVtJs2w=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=KIJM8Svdp0SwSb4EJy0aTXNY3Ury55AigNy3m73VKzMCUOliQlE/8wr4p8iRJPuvuLYcc/07VWbG7kD/z1tz5nplAoH7by8x2yY64aDsX5e2psKxldEPeiegNBNMZSobAV1mMSPiRXpUxEz0hxmJY7YCujI3CublU8FsoY9B/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFww3NT0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFww3NT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767176373; x=1798712373;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+fvjN0iPO/jSPODeyRMkaTNrupoqHC/Wqjf6fVtJs2w=;
  b=kFww3NT0zaLe2P+oOcd3vIycid4sE9w2c+nLl5EmxzTRic0OnhmN1sy/
   5Q3NvHlG0rRIa6u7Lt5bA6SGjfWW1lHisKUswR1VKZjhZQwb+WGB2Rjr3
   sAkTlhgj8Zb5cEDLN1JuC+NWdh2ga/ehpzjcmODN3RQGQGgDtBp+O+V4y
   K2agzcuJF3f93h7Y3rVjz2Uy2St9p8XAoWW79SRw08hfCwPvyz6cNUvvd
   Q6chPxDbAwPADAEBqwredjNUXsphmd2dwfs/jyHJQkK0oLtwSeqFSLKwu
   3hi0aWySnRl/ls7zeyCNg/ZsA86kl6zvajRECx9reAekFT2xQkH/Yh3mo
   g==;
X-CSE-ConnectionGUID: TPFM/RoFSNG5uiLi3ESPnw==
X-CSE-MsgGUID: myRniLonQ4mpKIkVFhTkNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68639368"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="68639368"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 02:19:32 -0800
X-CSE-ConnectionGUID: EhTKYw96RlCt7Q7BK6LehQ==
X-CSE-MsgGUID: 1v3JQRgbR46T0GkJqHe9FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="202362503"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.186])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 02:19:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 31 Dec 2025 12:18:42 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.19-2
Message-ID: <pdx86-pr-20251231121842-433127174@linux.intel.com>
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

- alienware-wmi-wmax: Area-51, x16, and 16X Aurora laptops support

- asus-armoury:
  - Fix FA507R PPT data
  - Add TDP data for more laptop models

- asus-nb-wmi: Asus Zenbook 14 display toggle key support

- dell-lis3lv02d: Dell Latitude 5400 support

- hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing

- ibm_rtl: Fix EBDA signature search pointer arithmetic

- ideapad-laptop: Reassign KEY_CUT to KEY_SELECTIVE_SCREENSHOT

- intel/pmt:
  - Fix kobject memory leak on init failure
  - Use valid pointers on error handling path

- intel/vsec: Correct kernel doc comments

- mellanox: mlxbf-pmc: Fix event names

- msi-laptop: Add sysfs_remove_group()

- samsumg-galaxybook: Do not cast pointer to a shorter type

- think-lmi: WMI certificate thumbprint support for ThinkCenter

- uniwill: Tuxedo Book BA15 Gen10 support

Regards, i.


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-2

for you to fetch changes up to c6703f10c8cc36f53b867bdbdd5bacaaa47ce799:

  platform/x86: asus-armoury: add support for G835LW (2025-12-30 12:51:46 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.19-2

Fixes and New HW Support

- alienware-wmi-wmax: Area-51, x16, and 16X Aurora laptops support

- asus-armoury:
  - Fix FA507R PPT data
  - Add TDP data for more laptop models

- asus-nb-wmi: Asus Zenbook 14 display toggle key support

- dell-lis3lv02d: Dell Latitude 5400 support

- hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing

- ibm_rtl: Fix EBDA signature search pointer arithmetic

- ideapad-laptop: Reassign KEY_CUT to KEY_SELECTIVE_SCREENSHOT

- intel/pmt:
  - Fix kobject memory leak on init failure
  - Use valid pointers on error handling path

- intel/vsec: Correct kernel doc comments

- mellanox: mlxbf-pmc: Fix event names

- msi-laptop: Add sysfs_remove_group()

- samsumg-galaxybook: Do not cast pointer to a shorter type

- think-lmi: WMI certificate thumbprint support for ThinkCenter

- uniwill: Tuxedo Book BA15 Gen10 support

The following is an automated shortlog grouped by driver:

alienware-wmi-wmax:
 -  Add AWCC support for Alienware x16
 -  Add support for Alienware 16X Aurora
 -  Add support for new Area-51 laptops

asus-armoury:
 -  add support for FA608UM
 -  add support for G615LR
 -  add support for G835LW
 -  add support for GA403WR
 -  add support for GU605CR
 -  fix ppt data for FA507R

asus-nb-wmi:
 -  Add keymap for display toggle

dell-lis3lv02d:
 -  Add Latitude 5400

hp-bioscfg:
 -  Fix out-of-bounds array access in ACPI package parsing

ibm_rtl:
 -  fix EBDA signature search pointer arithmetic

ideapad-laptop:
 -  Reassign KEY_CUT to KEY_SELECTIVE_SCREENSHOT

intel/pmt/discovery:
 -  use valid device pointer in dev_err_probe

intel/pmt:
 -  Fix kobject memory leak on init failure

intel/vsec:
 -  correct kernel-doc comments

mlxbf-pmc:
 -  Remove trailing whitespaces from event names

msi-laptop:
 -  add missing sysfs_remove_group()

samsung-galaxybook:
 -  Fix problematic pointer cast

think-lmi:
 -  Add WMI certificate thumbprint support for ThinkCenter

uniwill:
 -  Add TUXEDO Book BA15 Gen10

----------------------------------------------------------------
Alok Tiwari (1):
      platform/x86/intel/pmt/discovery: use valid device pointer in dev_err_probe

Armin Wolf (1):
      platform/x86: samsung-galaxybook: Fix problematic pointer cast

Denis Benato (6):
      platform/x86: asus-armoury: add support for GU605CR
      platform/x86: asus-armoury: add support for GA403WR
      platform/x86: asus-armoury: add support for FA608UM
      platform/x86: asus-armoury: add support for G615LR
      platform/x86: asus-armoury: fix ppt data for FA507R
      platform/x86: asus-armoury: add support for G835LW

Dmytro Bagrii (1):
      platform/x86: dell-lis3lv02d: Add Latitude 5400

Junrui Luo (2):
      platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
      platform/x86: hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing

Kaushlendra Kumar (1):
      platform/x86/intel/pmt: Fix kobject memory leak on init failure

Kurt Borja (3):
      platform/x86: alienware-wmi-wmax: Add support for new Area-51 laptops
      platform/x86: alienware-wmi-wmax: Add AWCC support for Alienware x16
      platform/x86: alienware-wmi-wmax: Add support for Alienware 16X Aurora

Mark Pearson (1):
      platform/x86: think-lmi: Add WMI certificate thumbprint support for ThinkCenter

Randy Dunlap (1):
      platform/x86/intel/vsec: correct kernel-doc comments

Shravan Kumar Ramani (1):
      platform/mellanox: mlxbf-pmc: Remove trailing whitespaces from event names

Thomas Fourier (1):
      platform/x86: msi-laptop: add missing sysfs_remove_group()

Tim Wassink (1):
      platform/x86: asus-nb-wmi: Add keymap for display toggle

Tomáš Hnyk (1):
      platform/x86: ideapad-laptop: Reassign KEY_CUT to KEY_SELECTIVE_SCREENSHOT

Werner Sembach (1):
      platform/x86/uniwill: Add TUXEDO Book BA15 Gen10

 drivers/platform/mellanox/mlxbf-pmc.c              |  14 +-
 drivers/platform/x86/asus-armoury.h                | 176 ++++++++++++++++++++-
 drivers/platform/x86/asus-nb-wmi.c                 |   1 +
 drivers/platform/x86/dell/alienware-wmi-wmax.c     |  32 ++++
 drivers/platform/x86/dell/dell-lis3lv02d.c         |   1 +
 .../platform/x86/hp/hp-bioscfg/enum-attributes.c   |   4 +-
 .../platform/x86/hp/hp-bioscfg/int-attributes.c    |   2 +-
 .../x86/hp/hp-bioscfg/order-list-attributes.c      |   5 +
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c       |   5 +
 .../platform/x86/hp/hp-bioscfg/string-attributes.c |   2 +-
 drivers/platform/x86/ibm_rtl.c                     |   2 +-
 drivers/platform/x86/intel/pmt/discovery.c         |   8 +-
 drivers/platform/x86/lenovo/ideapad-laptop.c       |   2 +-
 drivers/platform/x86/lenovo/think-lmi.c            |   6 +-
 drivers/platform/x86/msi-laptop.c                  |   3 +
 drivers/platform/x86/samsung-galaxybook.c          |   9 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c        |   7 +
 include/linux/intel_vsec.h                         |  17 +-
 18 files changed, 265 insertions(+), 31 deletions(-)
