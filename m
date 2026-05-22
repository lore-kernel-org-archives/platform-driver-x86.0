Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B663911CF;
	Fri, 22 May 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454975; cv=none; b=MHEZcBfFBsZGUavkdRjKcIc0hGl8xoRIrBRTVb6UGeo80BAQokfIXC7ZDV9DkanoGWpkJH2tP2OWnc8BjXRvArVd0lQPAWuxbCRB7K+LORYYGUV3FVxIN+y/g2FywjeZsnuy+ztmY3exhSnwW+SImBjLCUaumQ9Y77KQvrLFgjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454975; c=relaxed/simple;
	bh=if89QC5gMIIujDM2u1bPis0P+DQhObWLSTswf0E0O6I=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=E25v/C9rjFiDARhxuzs3iWEM5x5fldTrzJv6LuNTkQPYffapCzUIPrikEqLxbqKrvE5bnURWnpSRPqMDg7JgqseTf9ZcIL55PQ7Y1HEHULLjHingKhKUZz3xGInTT6xIT2vNG9lt3EfskseA0nSF9vF9ZmjSYi0tk0kXMfY8sU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YghKraUL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YghKraUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779454974; x=1810990974;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=if89QC5gMIIujDM2u1bPis0P+DQhObWLSTswf0E0O6I=;
  b=YghKraULwOQZ9vGjOeklpvk26c1Hr/JCaRPM2S9NT+ibLm8LgUnDIQPT
   iwXLfzC20Hb7ib2Ff+0UH8lhVxTHF3sQgDsXuaZ8GYkaQP/ADI15N5tQq
   Kdq43YHnG8uzNsUmnP0DzvxevRM7ivQQy0yyNlY/97TKorBnOaWVeth8I
   QUx04zdc8wDMhHrt7UQh4qzPH5e/sOe/pDwwAlZhW54bbvELovWOGZNYB
   kVioYtHicNwGroQWdwsWcZLOqiCc4KT/fouDxMDEauBsneI9iFcQ81k52
   Ri9crjFmJtdMhScuqGvrjMZuZzdAKLyq4qbKVYaShR/6Q7jBKmAeX2i+k
   Q==;
X-CSE-ConnectionGUID: LNTqfBj9TLCCMHANyySLCA==
X-CSE-MsgGUID: iHbIv7G1SM2N5r6ArbrP3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91851632"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91851632"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:02:53 -0700
X-CSE-ConnectionGUID: /AevEVgyTCeBWRFGgCL3Pg==
X-CSE-MsgGUID: +qxsZDdtTi+lQgCkdNe6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="239881118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:02:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 22 May 2026 15:56:00 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.1-4
Message-ID: <pdx86-pr-20260522155600-202866129@linux.intel.com>
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

Lots of device match override case fixes from Rafael, thus the shotgun
shortlog.

The commit timestamp of the latest commit is very recent because I fixed
an issue in its commit message I noticed while preparing this PR (tools had
taken --- below part into the commit message). The change has been sitting
in the fixes branch for a few days even before that.

Fixes and New HW Support

- Add ACPI_HANDLE()/ACPI_COMPANION() NULL checks (many drivers) to
  handle match overrides gracefully

- asus-armoury:

  - Fix mini-LED mode get/set

  - Add support for FA401EA, FX607VU, G614FR, and GU605CP

- bitland-mifs-wmi: Add CONFIG_LEDS_CLASS dependency

- hp-wmi: Add thermal support for Omen 16-c0xxx (board 8902)

- intel/vsec: Fix enable_cnt imbalance due to PCIe error recovery

- surface/aggregator_registry: Remove battery & AC nodes on Surface
			       Laptop 7 to avoid duplicated devices

- uniwill-laptop:

  - Handle uninitialized and invalid charging threshold values

  - Accept charging threshold of 0 through power supply sysfs ABI and
    clamp it to 1

  - Make 'force' parameter to work also when device descriptor is found

  - Do not enable charging limit despite the 'force' parameter to avoid
    permanent damage to battery

Regards, i.


The following changes since commit 2997606dd17729404cef9821ce66dd037b6019eb:

  platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8407AA (2026-05-11 17:15:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-4

for you to fetch changes up to 654ddf855bebd8d45a6e707f5dc2344921f5e0cf:

  platform/x86: bitland-mifs-wmi: add CONFIG_LEDS_CLASS dependency (2026-05-22 15:48:41 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.1-4

Fixes and New HW Support

- Add ACPI_HANDLE()/ACPI_COMPANION() NULL checks (many drivers) to
  handle match overrides gracefully

- asus-armoury:

  - Fix mini-LED mode get/set

  - Add support for FA401EA, FX607VU, G614FR, and GU605CP

- bitland-mifs-wmi: Add CONFIG_LEDS_CLASS dependency

- hp-wmi: Add thermal support for Omen 16-c0xxx (board 8902)

- intel/vsec: Fix enable_cnt imbalance due to PCIe error recovery

- surface/aggregator_registry: Remove battery & AC nodes on Surface
			       Laptop 7 to avoid duplicated devices

- uniwill-laptop:

  - Handle uninitialized and invalid charging threshold values

  - Accept charging threshold of 0 through power supply sysfs ABI and
    clamp it to 1

  - Make 'force' parameter to work also when device descriptor is found

  - Do not enable charging limit despite the 'force' parameter to avoid
    permanent damage to battery

The following is an automated shortlog grouped by driver:

acer-wireless:
 -  Check ACPI_COMPANION() against NULL

adv_swbutton:
 -  Check ACPI_HANDLE() against NULL

asus-armoury:
 -  add support for FA401EA
 -  add support for FX607VU
 -  add support for G614FR
 -  add support for GU605CP
 -  fix mini-LED mode get/set on MODE2 devices

asus-laptop:
 -  Check ACPI_COMPANION() against NULL

bitland-mifs-wmi:
 -  add CONFIG_LEDS_CLASS dependency

dell/dell-rbtn:
 -  Check ACPI_COMPANION() against NULL

eeepc-laptop:
 -  Check ACPI_COMPANION() against NULL

fujitsu:
 -  Check ACPI_COMPANION() against NULL

fujitsu-tablet:
 -  Check ACPI_COMPANION() against NULL

hp_accel:
 -  Check ACPI_COMPANION() against NULL

hp-wmi:
 -  fix support for thermal profile Omen 16-с0xxx laptops

intel-hid:
 -  Check ACPI_HANDLE() against NULL

intel/rst:
 -  Check ACPI_COMPANION() against NULL

intel_sar:
 -  Check ACPI_HANDLE() against NULL

intel/smartconnect:
 -  Check ACPI_HANDLE() against NULL

intel-vbtn:
 -  Check ACPI_HANDLE() against NULL

intel/vsec:
 -  Fix enable_cnt imbalance on PCIe error recovery

lg-laptop:
 -  Check ACPI_COMPANION() against NULL

panasonic-laptop:
 -  Check ACPI_COMPANION() against NULL

sony-laptop:
 -  Check ACPI_COMPANION() against NULL

surface: aggregator_registry:
 -  omit battery & AC nodes on Surface Laptop 7

surface: surfacepro3_button:
 -  Check ACPI_COMPANION()

system76:
 -  Check ACPI_COMPANION() against NULL

toshiba_acpi:
 -  Check ACPI_COMPANION() against NULL

toshiba_bluetooth:
 -  Check ACPI_COMPANION() against NULL

toshiba_haps:
 -  Check ACPI_COMPANION() against NULL

uniwill-laptop:
 -  Accept charging threshold of 0
 -  Do not enable the charging limit even when forced
 -  Fix behavior of "force" module param
 -  Properly initialize charging threshold

wireless-hotkey:
 -  Check ACPI_COMPANION() against NULL

----------------------------------------------------------------
Ahmed Yaseen (1):
      platform/x86: asus-armoury: fix mini-LED mode get/set on MODE2 devices

Armin Wolf (4):
      platform/x86: uniwill-laptop: Properly initialize charging threshold
      platform/x86: uniwill-laptop: Accept charging threshold of 0
      platform/x86: uniwill-laptop: Fix behavior of "force" module param
      platform/x86: uniwill-laptop: Do not enable the charging limit even when forced

Arnd Bergmann (1):
      platform/x86: bitland-mifs-wmi: add CONFIG_LEDS_CLASS dependency

Denis Benato (4):
      platform/x86: asus-armoury: add support for FX607VU
      platform/x86: asus-armoury: add support for G614FR
      platform/x86: asus-armoury: add support for FA401EA
      platform/x86: asus-armoury: add support for GU605CP

Lukas Wunner (1):
      platform/x86/intel/vsec: Fix enable_cnt imbalance on PCIe error recovery

Oliver White (1):
      platform/surface: aggregator_registry: omit battery & AC nodes on Surface Laptop 7

Rafael J. Wysocki (22):
      platform/x86: adv_swbutton: Check ACPI_HANDLE() against NULL
      platform/x86: hp_accel: Check ACPI_COMPANION() against NULL
      platform/x86: intel-hid: Check ACPI_HANDLE() against NULL
      platform/x86: intel_sar: Check ACPI_HANDLE() against NULL
      platform/x86: intel-vbtn: Check ACPI_HANDLE() against NULL
      platform/surface: surfacepro3_button: Check ACPI_COMPANION()
      platform/x86: acer-wireless: Check ACPI_COMPANION() against NULL
      platform/x86: asus-laptop: Check ACPI_COMPANION() against NULL
      platform/x86: dell/dell-rbtn: Check ACPI_COMPANION() against NULL
      platform/x86: eeepc-laptop: Check ACPI_COMPANION() against NULL
      platform/x86: fujitsu: Check ACPI_COMPANION() against NULL
      platform/x86: fujitsu-tablet: Check ACPI_COMPANION() against NULL
      platform/x86: intel/rst: Check ACPI_COMPANION() against NULL
      platform/x86: intel/smartconnect: Check ACPI_HANDLE() against NULL
      platform/x86: lg-laptop: Check ACPI_COMPANION() against NULL
      platform/x86: panasonic-laptop: Check ACPI_COMPANION() against NULL
      platform/x86: sony-laptop: Check ACPI_COMPANION() against NULL
      platform/x86: system76: Check ACPI_COMPANION() against NULL
      platform/x86: toshiba_acpi: Check ACPI_COMPANION() against NULL
      platform/x86: toshiba_bluetooth: Check ACPI_COMPANION() against NULL
      platform/x86: toshiba_haps: Check ACPI_COMPANION() against NULL
      platform/x86: wireless-hotkey: Check ACPI_COMPANION() against NULL

Коненко Андрей Викторович (1):
      hp-wmi: fix support for thermal profile Omen 16-с0xxx laptops

 .../admin-guide/laptops/uniwill-laptop.rst         |  10 ++
 .../platform/surface/surface_aggregator_registry.c |   2 -
 drivers/platform/surface/surfacepro3_button.c      |  10 +-
 drivers/platform/x86/Kconfig                       |   1 +
 drivers/platform/x86/acer-wireless.c               |   8 +-
 drivers/platform/x86/adv_swbutton.c                |   6 +-
 drivers/platform/x86/asus-armoury.c                |  16 ++-
 drivers/platform/x86/asus-armoury.h                | 113 +++++++++++++++++++++
 drivers/platform/x86/asus-laptop.c                 |   6 +-
 drivers/platform/x86/dell/dell-rbtn.c              |   6 +-
 drivers/platform/x86/eeepc-laptop.c                |   6 +-
 drivers/platform/x86/fujitsu-laptop.c              |  12 ++-
 drivers/platform/x86/fujitsu-tablet.c              |   6 +-
 drivers/platform/x86/hp/hp-wmi.c                   |   4 +
 drivers/platform/x86/hp/hp_accel.c                 |   3 +
 drivers/platform/x86/intel/hid.c                   |   6 +-
 drivers/platform/x86/intel/int1092/intel_sar.c     |   7 +-
 drivers/platform/x86/intel/rst.c                   |   6 +-
 drivers/platform/x86/intel/smartconnect.c          |   6 +-
 drivers/platform/x86/intel/vbtn.c                  |   6 +-
 drivers/platform/x86/intel/vsec.c                  |  54 +++++-----
 drivers/platform/x86/lg-laptop.c                   |   9 +-
 drivers/platform/x86/panasonic-laptop.c            |   6 +-
 drivers/platform/x86/sony-laptop.c                 |  12 ++-
 drivers/platform/x86/system76_acpi.c               |   6 +-
 drivers/platform/x86/toshiba_acpi.c                |   6 +-
 drivers/platform/x86/toshiba_bluetooth.c           |   6 +-
 drivers/platform/x86/toshiba_haps.c                |   6 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c        |  47 ++++++++-
 drivers/platform/x86/wireless-hotkey.c             |   9 +-
 30 files changed, 338 insertions(+), 63 deletions(-)
