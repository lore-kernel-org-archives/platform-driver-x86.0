Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1521D24CEEA;
	Fri, 13 Feb 2026 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771009242; cv=none; b=FFua91fxontIwWi0bNRmtNGKZFngym/emtNYQ4jT95P66ErZVN2TMhmtlqcmKmyf7oaLQQxdIEpCr6hAtGOmiWI2RP80pXyLPN6MLxcHRlH+VOoc452r/9MeUhMvAvQnlZE3s2vjllr9g7DcB4yA/DtNcY+gQ2pj6d+AU/ruEg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771009242; c=relaxed/simple;
	bh=LDZUfcEWsAc6YnmRoCJniRpRN8xwWGPKdHn71SJ6RXk=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=I1HeGCjw3NLSoOlX2z4gobFUtOyNox7Xu4egHg/QH1ffwuC3Cdi9H+GGqkcFhaLru8/EqYp6x1/u2rGqBuZmNJRxD6m66C5ywluu4ZDD4PBvl8qWAIJ6B7ghc6LF2xQmh/BY0ZSs4FXPV2lKKchwAzmOZi5UStKc9gWtiwSnBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAeHNYhw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAeHNYhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771009240; x=1802545240;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LDZUfcEWsAc6YnmRoCJniRpRN8xwWGPKdHn71SJ6RXk=;
  b=RAeHNYhwUH6+IITNghk6+q2VQBOrU213TmD/Lkci4W/iYSDhy3tyF8BF
   adcm6l87mz1DdJ4D7AQjEhKTUwwQ3dgs2erGOxhkXNFmzBrtvq28JP/dB
   IgwigmfV4pKcES03GEMiQos+Q6SXb38uuUXAMxkyr75+eY5GWVqlAD547
   iiWUQRomYRBaWVQNpBdddQF/IdPuIhgMQuFxJTGAKOYnGaz+7LuCmvnQr
   ioPLVc9d0ovtv3qwblOXa+nSb/kmy0pOjndXifvbXG3p2mpi9uRA1fKna
   Uy72uMYqHLjkhDfOA5kUmxdALWXcJU74YXeirvzC2Glp5lfUT3kyGhkHU
   Q==;
X-CSE-ConnectionGUID: V0pSJ55KQGy4TmXDP8orPQ==
X-CSE-MsgGUID: 7pG2oMvXSHOhC82qLN9vsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76044033"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="76044033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 11:00:39 -0800
X-CSE-ConnectionGUID: ExjYavvSTj2yYyOFS9ci2w==
X-CSE-MsgGUID: AoG+aIeVQi6caNSeDfiwCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="235977783"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.12])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 11:00:36 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 13 Feb 2026 20:24:27 +0200
Subject: [GIT PULL] platform-drivers-x86 for v7.0-1
Message-ID: <pdx86-pr-20260213202427-653022255@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v7.0.

There's a known conflict with HID/asus changes that came through
the hid tree:

https://lore.kernel.org/all/aYI1Yyof6IL5-HUz@sirena.org.uk/


Highlights:

- amd/pmf:
  - Avoid overwriting BIOS input values when events occur rapidly
  - Fix PMF driver issues related to S4 (in part on crypto/ccp side)
  - Add NPU metrics API (for accel side consumers)
  - Allow disabling Smart PC function through a module parameter

- asus-wmi & HID/asus:
  - Unification of backlight control (replaces quirks)
  - Support multiple interfaces for controlling keyboard/RGB brightness
  - Simplify init sequence

- hp-wmi:
  - Add manual fan control for Victus S models
  - Add fan mode keep-alive
  - Fix platform profile values for Omen 16-wf1xxx
  - Add EC offset to get the thermal profile

- intel/pmc: Show substate residencies also for non-primary PMCs

- intel/ISST:
  - Store and restore data for all domains
  - Write interface improvements

- lenovo-wmi: 
  - Support multiple Capability Data
  - Add HWMON reporting and tuning support

- mellanox/mlx-platform: Add HI173 & HI174 support

- surface/aggregator_registry: Add Surface Pro 11 (QCOM)

- thinkpad_acpi: Add support for HW damage detection capability

- uniwill: Implement cTGP setting

- wmi:
  - Introduce marshalling support
  - Convert a few drivers to use the new buffer-based WMI API

- tools/power/x86/intel-speed-select: Allow read operations for non-root

- Miscellaneous cleanups / refactoring / improvements

Regards, i.


The following changes since commit 4b11f2336e23d5c55b76591bd8ac39b059f68ad0:

  platform/x86: acer-wmi: Fix missing capability check (2026-01-20 17:10:56 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.0-1

for you to fetch changes up to 5a5203a45b063a594e89a2aeaf9e4923893a5b4c:

  platform/x86: lenovo-wmi-{capdata,other}: Fix HWMON channel visibility (2026-02-10 17:22:40 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v7.0-1

Highlights:

- amd/pmf:
  - Avoid overwriting BIOS input values when events occur rapidly
  - Fix PMF driver issues related to S4 (in part on crypto/ccp side)
  - Add NPU metrics API (for accel side consumers)
  - Allow disabling Smart PC function through a module parameter

- asus-wmi & HID/asus:
  - Unification of backlight control (replaces quirks)
  - Support multiple interfaces for controlling keyboard/RGB brightness
  - Simplify init sequence

- hp-wmi:
  - Add manual fan control for Victus S models
  - Add fan mode keep-alive
  - Fix platform profile values for Omen 16-wf1xxx
  - Add EC offset to get the thermal profile

- intel/pmc: Show substate residencies also for non-primary PMCs

- intel/ISST:
  - Store and restore data for all domains
  - Write interface improvements

- lenovo-wmi:
  - Support multiple Capability Data
  - Add HWMON reporting and tuning support

- mellanox/mlx-platform: Add HI173 & HI174 support

- surface/aggregator_registry: Add Surface Pro 11 (QCOM)

- thinkpad_acpi: Add support for HW damage detection capability

- uniwill: Implement cTGP setting

- wmi:
  - Introduce marshalling support
  - Convert a few drivers to use the new buffer-based WMI API

- tools/power/x86/intel-speed-select: Allow read operations for non-root

- Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

amd/pmf:
 -  Added a module parameter to disable the Smart PC function
 -  Introduce new interface to export NPU metrics
 -  Prevent TEE errors after hibernate
 -  Use ring buffer to store custom BIOS input values

amd:
 -  Use scope-based cleanup for wbrf_record()

asus-wmi:
 -  add keyboard brightness event handler
 -  Add support for multiple kbd led handlers
 -  remove unused keyboard backlight quirk

crypto:
 -  ccp - Add an S4 restore flow
 -  ccp - Declare PSP dead if PSP_CMD_TEE_RING_INIT fails
 -  ccp - Factor out ring destroy handling to a helper
 -  ccp - Send PSP_CMD_TEE_RING_DESTROY when PSP_CMD_TEE_RING_INIT fails

HID: asus:
 -  add support for the asus-wmi brightness handler
 -  early return for ROG devices
 -  fortify keyboard handshake
 -  initialize additional endpoints only for certain devices
 -  listen to the asus-wmi brightness device instead of creating one
 -  move vendor initialization to probe
 -  simplify RGB init sequence
 -  use same report_id in response

hp-wmi:
 -  Add EC offsets to read Victus S thermal profile
 -  add manual fan control for Victus S models
 -  fix platform profile values for Omen 16-wf1xxx
 -  implement fan keep-alive
 -  order include headers

ideadpad-laptop:
 -  Clean up style warnings and checks

intel/pmc:
 -  Change LPM mode fields to u8
 -  Enable substate residencies for multiple PMCs
 -  Move LPM mode attributes to PMC
 -  Remove double empty line

intel/pmt:
 -  Replace sprintf() with sysfs_emit()

intel/uncore-freq:
 -  Replace sprintf() with scnprintf()
 -  Replace sprintf() with sysfs_emit()

intel-wmi-sbl-fw-update:
 -  Use new buffer-based WMI API

intel/wmi: thunderbolt:
 -  Use new buffer-based WMI API

ISST:
 -  Add missing write block check
 -  Check for admin capability for write commands
 -  Optimize suspend/resume callbacks
 -  Store and restore all domains data

lenovo-wmi-capdata:
 -  Add support for Capability Data 00
 -  Add support for Fan Test Data

lenovo-wmi-{capdata,other}:
 -  Fix HWMON channel visibility
 -  Support multiple Capability Data

lenovo-wmi-capdata:
 -  Wire up Fan Test Data

lenovo-wmi-helpers:
 -  Convert returned buffer into u32

lenovo-wmi-other:
 -  Add HWMON for fan reporting/tuning

mlx-platform:
 -  Add support DGX flavor of next-generation 800GB/s ethernet switch.
 -  Add support for new Nvidia DGX system based on class VMOD0010

Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata:
 - Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata

surface: aggregator_registry:
 -  Add Surface Pro 11 (QCOM)

surface:
 -  Replace deprecated strcpy() in surface_button_add()

thinkpad_acpi:
 -  Add support to detect hardware damage detection capability.
 -  Add sysfs to display details of damaged device.

tools/power/x86/intel-speed-select:
 -  Allow non root users
 -  Fix file descriptor leak in isolate_cpus()
 -  Use pkg-config for libnl-3.0 detection
 -  v1.25 release

uniwill:
 -  Implement cTGP setting

uniwill-laptop:
 -  Introduce device descriptor system

wmi:
 -  Add helper functions for WMI string conversions
 -  Add kunit test for the marshalling code
 -  Add kunit test for the string conversion code

wmi-bmof:
 -  Use new buffer-based WMI API

wmi:
 -  Introduce marshalling support

wmi: string-kunit:
 -  Add missing oversized string test case

wmi:
 -  Update driver development guide

xiaomi-wmi:
 -  Use new buffer-based WMI API

yogabook:
 -  Clean up code style

Merges:
 -  Merge branch 'fixes' of into for-next
 -  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next
 -  Merge branch 'platform-drivers-x86-asus-kbd' into for-next

----------------------------------------------------------------
Alexey Zagorodnikov (1):
      platform/x86/amd/pmf: Added a module parameter to disable the Smart PC function

Antheas Kapenekakis (11):
      HID: asus: simplify RGB init sequence
      HID: asus: initialize additional endpoints only for certain devices
      HID: asus: use same report_id in response
      HID: asus: fortify keyboard handshake
      HID: asus: move vendor initialization to probe
      HID: asus: early return for ROG devices
      platform/x86: asus-wmi: Add support for multiple kbd led handlers
      HID: asus: listen to the asus-wmi brightness device instead of creating one
      platform/x86: asus-wmi: remove unused keyboard backlight quirk
      platform/x86: asus-wmi: add keyboard brightness event handler
      HID: asus: add support for the asus-wmi brightness handler

Armin Wolf (11):
      platform/wmi: Introduce marshalling support
      platform/wmi: Add kunit test for the marshalling code
      platform/wmi: Add helper functions for WMI string conversions
      platform/wmi: Add kunit test for the string conversion code
      platform/x86: intel-wmi-sbl-fw-update: Use new buffer-based WMI API
      platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
      platform/x86: xiaomi-wmi: Use new buffer-based WMI API
      platform/x86: wmi-bmof: Use new buffer-based WMI API
      platform/wmi: Update driver development guide
      platform/x86: uniwill-laptop: Introduce device descriptor system
      platform/wmi: string-kunit: Add missing oversized string test case

Benjamin Philip (2):
      platform/x86: yogabook: Clean up code style
      platform/x86: ideadpad-laptop: Clean up style warnings and checks

Dale Whinham (1):
      platform/surface: aggregator_registry: Add Surface Pro 11 (QCOM)

Ilpo Järvinen (3):
      Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next
      Merge branch 'fixes' of into for-next
      Merge branch 'platform-drivers-x86-asus-kbd' into for-next

Kaushlendra Kumar (3):
      platform/x86: intel/pmt: Replace sprintf() with sysfs_emit()
      platform/x86/intel/uncore-freq: Replace sprintf() with scnprintf()
      platform/x86/intel/uncore-freq: Replace sprintf() with sysfs_emit()

Khem Raj (1):
      tools/power/x86/intel-speed-select: Use pkg-config for libnl-3.0 detection

Krishna Chomal (5):
      platform/x86: hp-wmi: order include headers
      platform/x86: hp-wmi: add manual fan control for Victus S models
      platform/x86: hp-wmi: implement fan keep-alive
      platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
      platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile

Malaya Kumar Rout (1):
      tools/power/x86/intel-speed-select: Fix file descriptor leak in isolate_cpus()

Mario Limonciello (AMD) (4):
      crypto: ccp - Declare PSP dead if PSP_CMD_TEE_RING_INIT fails
      crypto: ccp - Add an S4 restore flow
      crypto: ccp - Factor out ring destroy handling to a helper
      crypto: ccp - Send PSP_CMD_TEE_RING_DESTROY when PSP_CMD_TEE_RING_INIT fails

Nitin Joshi (2):
      platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
      platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.

Oleksandr Shamray (2):
      platform: mellanox: mlx-platform: Add support for new Nvidia DGX system based on class VMOD0010
      platform: mellanox: mlx-platform: Add support DGX flavor of next-generation 800GB/s ethernet switch.

Rong Zhang (8):
      platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
      platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
      platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
      platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
      platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
      platform/x86: lenovo-wmi-capdata: Wire up Fan Test Data
      platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning
      platform/x86: lenovo-wmi-{capdata,other}: Fix HWMON channel visibility

Shyam Sundar S K (3):
      platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
      platform/x86/amd/pmf: Prevent TEE errors after hibernate
      platform/x86/amd/pmf: Introduce new interface to export NPU metrics

Srinivas Pandruvada (6):
      platform/x86: ISST: Add missing write block check
      platform/x86: ISST: Store and restore all domains data
      platform/x86: ISST: Check for admin capability for write commands
      platform/x86: ISST: Optimize suspend/resume callbacks
      tools/power/x86/intel-speed-select: Allow non root users
      tools/power/x86/intel-speed-select: v1.25 release

Thorsten Blum (1):
      platform/surface: Replace deprecated strcpy() in surface_button_add()

Werner Sembach (1):
      platform/x86/uniwill: Implement cTGP setting

Xi Pardee (4):
      platform/x86/intel/pmc: Change LPM mode fields to u8
      platform/x86/intel/pmc: Move LPM mode attributes to PMC
      platform/x86/intel/pmc: Enable substate residencies for multiple PMCs
      platform/x86/intel/pmc: Remove double empty line

Zilin Guan (1):
      platform/x86/amd: Use scope-based cleanup for wbrf_record()

 .../admin-guide/laptops/thinkpad-acpi.rst          |  37 +
 Documentation/driver-api/wmi.rst                   |   3 +
 Documentation/wmi/acpi-interface.rst               |  68 ++
 Documentation/wmi/devices/lenovo-wmi-other.rst     |  46 +-
 Documentation/wmi/driver-development-guide.rst     |  76 +-
 drivers/crypto/ccp/psp-dev.c                       |  11 +
 drivers/crypto/ccp/sp-dev.c                        |  12 +
 drivers/crypto/ccp/sp-dev.h                        |   3 +
 drivers/crypto/ccp/sp-pci.c                        |  16 +-
 drivers/crypto/ccp/tee-dev.c                       |  56 +-
 drivers/crypto/ccp/tee-dev.h                       |   1 +
 drivers/hid/hid-asus.c                             | 214 +++---
 drivers/platform/mellanox/mlx-platform.c           | 484 ++++++++++++
 .../platform/surface/surface_aggregator_registry.c |  18 +
 drivers/platform/surface/surfacepro3_button.c      |  11 +-
 drivers/platform/wmi/Kconfig                       |   3 +
 drivers/platform/wmi/Makefile                      |   5 +-
 drivers/platform/wmi/core.c                        | 160 +++-
 drivers/platform/wmi/internal.h                    |  17 +
 drivers/platform/wmi/marshalling.c                 | 247 ++++++
 drivers/platform/wmi/string.c                      |  92 +++
 drivers/platform/wmi/tests/Kconfig                 |  27 +
 drivers/platform/wmi/tests/Makefile                |  11 +
 drivers/platform/wmi/tests/marshalling_kunit.c     | 452 +++++++++++
 drivers/platform/wmi/tests/string_kunit.c          | 296 ++++++++
 drivers/platform/x86/amd/pmf/acpi.c                |  40 +
 drivers/platform/x86/amd/pmf/core.c                | 161 +++-
 drivers/platform/x86/amd/pmf/pmf.h                 |  33 +
 drivers/platform/x86/amd/pmf/spc.c                 |  33 +-
 drivers/platform/x86/amd/pmf/tee-if.c              |  14 +-
 drivers/platform/x86/amd/wbrf.c                    |  25 +-
 drivers/platform/x86/asus-wmi.c                    | 223 +++++-
 drivers/platform/x86/hp/hp-wmi.c                   | 603 ++++++++++++---
 drivers/platform/x86/intel/pmc/core.c              |  85 ++-
 drivers/platform/x86/intel/pmc/core.h              |  15 +-
 drivers/platform/x86/intel/pmt/class.c             |   6 +-
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |  79 +-
 .../uncore-frequency/uncore-frequency-common.c     |  13 +-
 drivers/platform/x86/intel/wmi/sbl-fw-update.c     |  43 +-
 drivers/platform/x86/intel/wmi/thunderbolt.c       |  26 +-
 drivers/platform/x86/lenovo/Kconfig                |   5 +-
 drivers/platform/x86/lenovo/Makefile               |   2 +-
 drivers/platform/x86/lenovo/ideapad-laptop.c       |  39 +-
 drivers/platform/x86/lenovo/thinkpad_acpi.c        | 206 +++++
 drivers/platform/x86/lenovo/wmi-capdata.c          | 829 +++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h          |  65 ++
 drivers/platform/x86/lenovo/wmi-capdata01.c        | 302 --------
 drivers/platform/x86/lenovo/wmi-capdata01.h        |  25 -
 drivers/platform/x86/lenovo/wmi-helpers.c          |  21 +-
 drivers/platform/x86/lenovo/wmi-other.c            | 528 ++++++++++++-
 drivers/platform/x86/lenovo/yogabook.c             |  12 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c        | 302 +++++++-
 drivers/platform/x86/wmi-bmof.c                    |  34 +-
 drivers/platform/x86/xiaomi-wmi.c                  |   5 +-
 include/linux/amd-pmf-io.h                         |  21 +
 .../linux/platform_data/x86/asus-wmi-leds-ids.h    |  50 --
 include/linux/platform_data/x86/asus-wmi.h         |  28 +
 include/linux/psp.h                                |   1 +
 include/linux/wmi.h                                |  45 +-
 tools/power/x86/intel-speed-select/Makefile        |   8 +-
 tools/power/x86/intel-speed-select/isst-config.c   |  43 +-
 61 files changed, 5387 insertions(+), 949 deletions(-)
 create mode 100644 drivers/platform/wmi/internal.h
 create mode 100644 drivers/platform/wmi/marshalling.c
 create mode 100644 drivers/platform/wmi/string.c
 create mode 100644 drivers/platform/wmi/tests/Kconfig
 create mode 100644 drivers/platform/wmi/tests/Makefile
 create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c
 create mode 100644 drivers/platform/wmi/tests/string_kunit.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
 create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
 delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
 delete mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
