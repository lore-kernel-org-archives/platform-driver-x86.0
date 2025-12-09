Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0679327216;
	Tue,  9 Dec 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765287477; cv=none; b=CYEi2YpO8pR6u63WzaacsiHPNwF+lFtxf1Lq+3b1ROqa+n68lEqJGycKrLB61lwQrpoZhqP7rg65KNKcqS+21StIPIN5LmBBtyWt3PsDKVPRO/nVX+FOZVj6BmBcWCGy0rnkSK4IlUAefsquOqu3wt+zk27DWY/SvLDk2fOiPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765287477; c=relaxed/simple;
	bh=tzciF8yzuiv6P3vz7IU+jmWXdBUhzDpSfSAcGkoIuuU=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=e/vzkWDk0Ro9Ppo8wRSQ48N61o8oRffYCTfiKxyHrhDhadmB8nAys1o67Iw4zm7LBe4OYUNhjiOs6M+dBBQTYIxMGvuMgc5y8RGRKfASVGseYclCXogmMDGIeeqIONbBTYeE6aaCTUYnZALNnIIDQ0RymzFb8pK5lyMVS5eGQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBE61Ks6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBE61Ks6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765287475; x=1796823475;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tzciF8yzuiv6P3vz7IU+jmWXdBUhzDpSfSAcGkoIuuU=;
  b=eBE61Ks6sBjY2LilSPQmdTvxBjoVKpSwxeSPNgpGDhZPMjd50Bh3gtnK
   aeC91Q7VIqElQOpyRRKHBtS1QGRji3Dsz0x24cL2rPRN0h7uI5FzIEdfq
   oypXyxN59tsNY6ZTjuTKs7S9d/gIFlNl/mE49GXMA6p84CD5xyf/weqjh
   Ulj5sbH3OSVQWnpeGH8bFaM4KkzdaUK/1uFs6ydoKCSRp+NtMMPK3rttU
   TPzESyA8bXy37rA+lPfSYPXgZ8DeM9VBUea+O55KFHCtRzWmhsZs3WmQ9
   Bljdft7E+UiZCEJEafc7JL63YEpzrFkhiEvFMY6GTAeUcBW6wA2i5nZiw
   A==;
X-CSE-ConnectionGUID: nXtJ4qHnRG6Q3eSWg2eS9w==
X-CSE-MsgGUID: MmCsPcWmTXysx6+2sOFitQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54783635"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="54783635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:37:54 -0800
X-CSE-ConnectionGUID: gl4A0GvkSWKyCSMVtqFdFw==
X-CSE-MsgGUID: Ba9JcKmjTWqwFaHHteukoA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.139])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:37:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 09 Dec 2025 15:35:03 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.19-1
Message-ID: <pdx86-pr-20251209153503-201216621@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v6.19.

Highlights:

- acer-wmi: Add PH16-72, PHN16-72, and PT14-51 fan control support

- acpi: platform_profile: Add max-power profile option (power draw limited
                          by the cooling hardware, may exceed battery power
			  draw limit when on AC power)

- amd/hsmp: Allow >1 data-fabric per socket

- asus-armoury: Add WMI attributes driver to expose miscellaneous
                WMI functions through fw_attributes (deprecates
                the custom BIOS features interface through asus-wmi)

- asus-wmi: Use brightness_set_blocking() for kbd led

- ayaneo-ec: Add Ayaneo Embedded Controller driver

- fs/nls:

  - Fix utf16 -> utf8 string conversion in output size restricted cases

  - Improve error code consistency for utf8 -> utf32 conversions

- ideapad-laptop: Fast (Rapid Charge) charge type support

- intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks

- intel/pmc:

  - Arrow Lake telemetry GUID improvements

  - Add support for Wildcat Lake PMC information

- intel_pmc_ipc: Fix ACPI buffer memleak

- intel/punit_ipc: Fix memory corruption

- intel/vsec: Wildcat Lake PMT telemetry support

- lenovo-wmi-gamezone: Map "Extreme" performance mode to max-power

- lg-laptop: Add support for the HDAP opregion field

- serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ missing projects

- thinkpad-t14s-ec: Improve suspend/resume support (lid LEDs, keyboard
                    backlight)

- uniwill: Add Uniwill laptop driver

- wmi: Move under drivers/platform/wmi as non-x86 WMI support is around
       the corner and other WMI features will require adding more C
       files as well

- tools/power/x86/intel-speed-select: v1.24

  - Check feature status to check if the feature enablement was successful

  - Reset SST-TF bucket structure to display valid bucket info

- Miscellaneous cleanups / refactoring / improvements

Regards, i.


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.19-1

for you to fetch changes up to 4df66a74d2a54e265c0b0dda81b7a00e4d5140f1:

  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next (2025-12-04 17:56:11 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.19-1

Highlights:

- acer-wmi: Add PH16-72, PHN16-72, and PT14-51 fan control support

- acpi: platform_profile: Add max-power profile option (power draw limited
                          by the cooling hardware, may exceed battery power
			  draw limit when on AC power)

- amd/hsmp: Allow >1 data-fabric per socket

- asus-armoury: Add WMI attributes driver to expose miscellaneous
                WMI functions through fw_attributes (deprecates
                the custom BIOS features interface through asus-wmi)

- asus-wmi: Use brightness_set_blocking() for kbd led

- ayaneo-ec: Add Ayaneo Embedded Controller driver

- fs/nls:

  - Fix utf16 -> utf8 string conversion in output size restricted cases

  - Improve error code consistency for utf8 -> utf32 conversions

- ideapad-laptop: Fast (Rapid Charge) charge type support

- intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks

- intel/pmc:

  - Arrow Lake telemetry GUID improvements

  - Add support for Wildcat Lake PMC information

- intel_pmc_ipc: Fix ACPI buffer memleak

- intel/punit_ipc: Fix memory corruption

- intel/vsec: Wildcat Lake PMT telemetry support

- lenovo-wmi-gamezone: Map "Extreme" performance mode to max-power

- lg-laptop: Add support for the HDAP opregion field

- serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ missing projects

- thinkpad-t14s-ec: Improve suspend/resume support (lid LEDs, keyboard
                    backlight)

- uniwill: Add Uniwill laptop driver

- wmi: Move under drivers/platform/wmi as non-x86 WMI support is around
       the corner and other WMI features will require adding more C
       files as well

- tools/power/x86/intel-speed-select: v1.24

  - Check feature status to check if the feature enablement was successful

  - Reset SST-TF bucket structure to display valid bucket info

- Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

acer-wmi:
 -  Add fan control support
 -  Add support for PHN16-72
 -  Enable fan control for PH16-72 and PT14-51
 -  Fix setting of fan behavior

acpi:
 -  platform_profile - Add max-power profile option

Add Uniwill laptop driver:
 - Add Uniwill laptop driver

alienware-wmi-wmax:
 -  Simplify FW profile to pprof matching

amd: hfi:
 -  Remove redundant assignment to .owner
 -  Remove unused cpumask from cpuinfo struct

amd/hsmp:
 -  Replace amd_num_nodes() with topology_max_packages()

amd/pmf:
 -  Add BIOS_INPUTS_MAX macro to replace hardcoded array size
 -  Refactor repetitive BIOS output handling
 -  Rename IPU metrics fields to NPU for consistency
 -  Replace magic table id with METRICS_TABLE_ID
 -  Use devm_mutex_init() for mutex initialization
 -  Use explicit SET_CMD/GET_CMD flags in amd_pmf_send_cmd()

arm64: thinkpad-t14s-ec:
 -  add suspend handler for keyboard backlight
 -  add system PM hooks

asus-armoury:
 -  add apu-mem control support
 -  add panel_hd_mode attribute
 -  add ppt_* and nv_* tuning knobs
 -  add screen auto-brightness toggle
 -  add support for FA507UV
 -  add support for GA503QR
 -  Fix error code in mini_led_mode_current_value_store()
 -  fix mini-led mode show
 -  fix only DC tunables being available
 -  move existing tunings to asus-armoury module

asus-wmi:
 -  deprecate bios features
 -  export symbols used for read/write WMI
 -  rename ASUS_WMI_DEVID_PPT_FPPT
 -  use brightness_set_blocking() for kbd led

ayaneo-ec:
 -  Add Ayaneo Embedded Controller platform driver
 -  Add charge control support
 -  Add controller power and modules attributes
 -  Add hwmon support
 -  Add suspend hook
 -  Move Ayaneo devices from oxpec to ayaneo-ec

Documentation: laptops:
 -  Add documentation for uniwill laptops

fs/nls:
 -  Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
 -  Fix utf16 to utf8 conversion

hp-wmi:
 -  Order DMI board name arrays

ideapad-laptop: Add charge_types:
 - Fast (Rapid Charge)

ideapad-laptop:
 -  Protect GBMD/SBMC calls with mutex
 -  Support multiple power_supply_ext definitions
 -  Use str_on_off() helper

intel/hid:
 -  Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks

intel/pmc:
 -  Add DMU GUID to Arrow Lake U/H
 -  Add support for multiple DMU GUIDs
 -  Enable SSRAM support for Wildcat Lake

intel_pmc_ipc:
 -  fix ACPI buffer memory leak

intel/pmc:
 -  Relocate lpm_req_guid to pmc_reg_map
 -  Remove redundant has_die_c6 variable
 -  Rename PMC index variable to pmc_idx
 -  Update Arrow Lake telemetry GUID

intel/vsec:
 -  Add support for Wildcat Lake

lenovo-wmi-gamezone Use max-power rather than balanced-performance:
 - lenovo-wmi-gamezone Use max-power rather than balanced-performance

lg-laptop:
 -  Add support for the HDAP opregion field

serial-multi-instantiate:
 -  Add IRQ_RESOURCE_OPT for IRQ missing projects

surface: acpi-notify:
 -  add WQ_PERCPU to alloc_workqueue users

surface: aggregator:
 -  Omit a variable reassignment in ssam_serial_hub_probe()

surface:
 -  replace use of system_wq with system_percpu_wq

tools/power/x86/intel-speed-select:
 -  Check feature status
 -  Reset isst_turbo_freq_info for invalid buckets
 -  v1.24 release

uniwill:
 -  Add TUXEDO devices
 -  Handle more WMI events required for TUXEDO devices

wmi-gamezone:
 -  Add Legion Go 2 Quirks

wmi:
 -  Move WMI core code into a separate directory
 -  Remove extern keyword from prototypes
 -  Use correct type when populating ACPI objects

x86-android-tablets:
 -  Omit a variable reassignment in lenovo_yoga_tab2_830_1050_init_codec()

x86:
 -  replace use of system_wq with system_percpu_wq

Merges:
 -  Merge branch 'fixes' of into for-next
 -  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next

----------------------------------------------------------------
Antheas Kapenekakis (9):
      platform/x86/amd/pmc: Add support for Van Gogh SoC
      platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
      platform/x86/amd: pmc: Add Lenovo Legion Go 2 to pmc quirk list
      platform/x86: ayaneo-ec: Add Ayaneo Embedded Controller platform driver
      platform/x86: ayaneo-ec: Add hwmon support
      platform/x86: ayaneo-ec: Add charge control support
      platform/x86: ayaneo-ec: Add controller power and modules attributes
      platform/x86: ayaneo-ec: Move Ayaneo devices from oxpec to ayaneo-ec
      platform/x86: ayaneo-ec: Add suspend hook

Anthony Wong (1):
      platform/x86: alienware-wmi-wmax: Add AWCC support to Alienware 16 Aurora

Anton Khirnov (1):
      platform/x86: asus-wmi: use brightness_set_blocking() for kbd led

Armin Wolf (15):
      platform/x86: lg-laptop: Add support for the HDAP opregion field
      platform/x86: acer-wmi: Fix setting of fan behavior
      platform/x86: acer-wmi: Add fan control support
      platform/x86: acer-wmi: Enable fan control for PH16-72 and PT14-51
      platform/x86: acer-wmi: Add support for PHN16-72
      platform/x86: Add Uniwill laptop driver
      Documentation: laptops: Add documentation for uniwill laptops
      platform/x86: msi-wmi-platform: Only load on MSI devices
      platform/x86: msi-wmi-platform: Fix typo in WMI GUID
      platform/x86: acer-wmi: Ignore backlight event
      fs/nls: Fix utf16 to utf8 conversion
      platform/x86: wmi: Use correct type when populating ACPI objects
      platform/x86: wmi: Remove extern keyword from prototypes
      platform/x86: wmi: Move WMI core code into a separate directory
      fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()

Baojun Xu (1):
      platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ missing projects

Chia-Lin Kao (AceLan) (1):
      platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks

Dan Carpenter (2):
      platform/x86: asus-armoury: Fix error code in mini_led_mode_current_value_store()
      platform/x86: intel: punit_ipc: fix memory corruption

David Thompson (1):
      platform/mellanox: mlxbf-pmc: add sysfs_attr_init() to count_clock init

Denis Benato (6):
      MAINTAINERS: add Denis Benato as maintainer for asus notebooks
      platform/x86: asus-wmi: rename ASUS_WMI_DEVID_PPT_FPPT
      platform/x86: asus-armoury: fix mini-led mode show
      platform/x86: asus-armoury: add support for FA507UV
      platform/x86: asus-armoury: fix only DC tunables being available
      platform/x86: asus-armoury: add support for GA503QR

Derek J. Clark (3):
      acpi: platform_profile - Add max-power profile option
      platform/x86: lenovo-wmi-gamezone Use max-power rather than balanced-performance
      platform/x86: wmi-gamezone: Add Legion Go 2 Quirks

Edip Hazuri (1):
      platform/x86: hp-wmi: mark Victus 16-r0 and 16-s0 for victus_s fan and thermal profile support

Hans de Goede (2):
      Input: Add keycodes for electronic privacy screen on/off hotkeys
      platform/x86: dell-wmi-base: Handle electronic privacy screen on/off events

Haotian Zhang (1):
      platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos

Ilpo Järvinen (3):
      Merge branch 'fixes' of into for-next
      platform/x86: hp-wmi: Order DMI board name arrays
      Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into for-next

Jia Ston (1):
      platform/x86: huawei-wmi: add keys for HONOR models

Krishna Chomal (1):
      platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support

Kuan-Wei Chiu (2):
      platform/x86/amd: hfi: Remove unused cpumask from cpuinfo struct
      platform/x86/amd: hfi: Remove redundant assignment to .owner

Kuppuswamy Sathyanarayanan (1):
      platform/x86: intel-uncore-freq: Add additional client processors

Kurt Borja (7):
      platform/x86: alienware-wmi-wmax: Fix NULL pointer dereference in sleep handlers
      platform/x86: alienware-wmi-wmax: Fix "Alienware m16 R1 AMD" quirk order
      platform/x86: alienware-wmi-wmax: Drop redundant DMI entries
      platform/x86: alienware-wmi-wmax: Add support for the whole "M" family
      platform/x86: alienware-wmi-wmax: Add support for the whole "X" family
      platform/x86: alienware-wmi-wmax: Add support for the whole "G" family
      platform/x86: alienware-wmi-wmax: Simplify FW profile to pprof matching

Lazar Aleksic (1):
      platform: x86: Kconfig: fix minor typo in help for WIRELESS_HOTKEY

Luke D. Jones (7):
      platform/x86: asus-wmi: export symbols used for read/write WMI
      platform/x86: asus-armoury: move existing tunings to asus-armoury module
      platform/x86: asus-armoury: add panel_hd_mode attribute
      platform/x86: asus-armoury: add apu-mem control support
      platform/x86: asus-armoury: add screen auto-brightness toggle
      platform/x86: asus-wmi: deprecate bios features
      platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs

Marco Crivellari (3):
      platform/surface: acpi-notify: add WQ_PERCPU to alloc_workqueue users
      platform: x86: replace use of system_wq with system_percpu_wq
      platform: surface: replace use of system_wq with system_percpu_wq

Marcos Vega (1):
      platform/x86: hp-wmi: Add Omen MAX 16-ah0xx fan support and thermal profile

Markus Elfring (2):
      platform/surface: aggregator: Omit a variable reassignment in ssam_serial_hub_probe()
      platform/x86: x86-android-tablets: Omit a variable reassignment in lenovo_yoga_tab2_830_1050_init_codec()

Qiu Wenbo (1):
      platform/x86: int3472: Fix double free of GPIO device during unregister

Randy Dunlap (2):
      platform/x86: ISST: isst_if.h: fix all kernel-doc warnings
      platform/x86: intel-uncore-freq: fix all header kernel-doc warnings

Rong Zhang (4):
      platform/x86: ideapad-laptop: Use str_on_off() helper
      platform/x86: ideapad-laptop: Protect GBMD/SBMC calls with mutex
      platform/x86: ideapad-laptop: Support multiple power_supply_ext definitions
      platform/x86: ideapad-laptop: Add charge_types:Fast (Rapid Charge)

Sakari Ailus (1):
      MAINTAINERS: Update int3472 maintainers

Sebastian Reichel (4):
      platform: arm64: thinkpad-t14s-ec: fix IRQ race condition
      platform: arm64: thinkpad-t14s-ec: sleep after EC access
      platform: arm64: thinkpad-t14s-ec: add system PM hooks
      platform: arm64: thinkpad-t14s-ec: add suspend handler for keyboard backlight

Shyam Sundar S K (6):
      platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
      platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in amd_pmf_send_cmd()
      platform/x86/amd/pmf: Replace magic table id with METRICS_TABLE_ID
      platform/x86/amd/pmf: Refactor repetitive BIOS output handling
      platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro to replace hardcoded array size
      platform/x86/amd/pmf: Use devm_mutex_init() for mutex initialization

Srinivas Pandruvada (4):
      platform/x86/intel/hid: Add Nova Lake support
      tools/power/x86/intel-speed-select: Check feature status
      tools/power/x86/intel-speed-select: Reset isst_turbo_freq_info for invalid buckets
      tools/power/x86/intel-speed-select: v1.24 release

Suma Hegde (1):
      platform/x86/amd/hsmp: Replace amd_num_nodes() with topology_max_packages()

Werner Sembach (2):
      platform/x86/uniwill: Handle more WMI events required for TUXEDO devices
      platform/x86/uniwill: Add TUXEDO devices

Xi Pardee (8):
      platform/x86:intel/pmc: Update Arrow Lake telemetry GUID
      platform/x86:intel/pmc: Add support for multiple DMU GUIDs
      platform/x86:intel/pmc: Add DMU GUID to Arrow Lake U/H
      platform/x86:intel/pmc: Rename PMC index variable to pmc_idx
      platform/x86:intel/pmc: Relocate lpm_req_guid to pmc_reg_map
      platform/x86:intel/pmc: Remove redundant has_die_c6 variable
      platform/x86/intel/vsec: Add support for Wildcat Lake
      platform/x86:intel/pmc: Enable SSRAM support for Wildcat Lake

Yongxin Liu (1):
      platform/x86: intel_pmc_ipc: fix ACPI buffer memory leak

tr1x_em (1):
      platform/x86: alienware-wmi-wmax: Add AWCC support to Dell G15 5530

 .../ABI/testing/sysfs-class-platform-profile       |    2 +
 .../ABI/testing/sysfs-driver-uniwill-laptop        |   53 +
 Documentation/ABI/testing/sysfs-platform-asus-wmi  |   17 +
 Documentation/ABI/testing/sysfs-platform-ayaneo-ec |   19 +
 Documentation/admin-guide/laptops/index.rst        |    1 +
 .../admin-guide/laptops/uniwill-laptop.rst         |   60 +
 Documentation/driver-api/wmi.rst                   |    2 +-
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst  |   31 +-
 Documentation/wmi/devices/uniwill-laptop.rst       |  198 ++
 Documentation/wmi/driver-development-guide.rst     |    1 +
 MAINTAINERS                                        |   24 +-
 drivers/acpi/platform_profile.c                    |    7 +-
 drivers/hid/hid-asus.c                             |    1 +
 drivers/platform/Kconfig                           |    2 +
 drivers/platform/Makefile                          |    1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      |   74 +-
 drivers/platform/mellanox/mlxbf-pmc.c              |    1 +
 drivers/platform/surface/aggregator/core.c         |    2 +-
 .../platform/surface/aggregator/ssh_packet_layer.c |    2 +-
 .../surface/aggregator/ssh_request_layer.c         |    2 +-
 drivers/platform/surface/surface_acpi_notify.c     |    2 +-
 drivers/platform/wmi/Kconfig                       |   34 +
 drivers/platform/wmi/Makefile                      |    8 +
 drivers/platform/{x86/wmi.c => wmi/core.c}         |   34 +-
 drivers/platform/x86/Kconfig                       |   75 +-
 drivers/platform/x86/Makefile                      |    8 +-
 drivers/platform/x86/acer-wmi.c                    |  294 ++-
 drivers/platform/x86/amd/hfi/hfi.c                 |   11 -
 drivers/platform/x86/amd/hsmp/acpi.c               |    9 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |   25 +
 drivers/platform/x86/amd/pmc/pmc.c                 |    3 +
 drivers/platform/x86/amd/pmc/pmc.h                 |    1 +
 drivers/platform/x86/amd/pmf/auto-mode.c           |   14 +-
 drivers/platform/x86/amd/pmf/cnqf.c                |   14 +-
 drivers/platform/x86/amd/pmf/core.c                |   23 +-
 drivers/platform/x86/amd/pmf/pmf.h                 |   27 +-
 drivers/platform/x86/amd/pmf/spc.c                 |    2 +-
 drivers/platform/x86/amd/pmf/sps.c                 |   38 +-
 drivers/platform/x86/amd/pmf/tee-if.c              |   92 +-
 drivers/platform/x86/asus-armoury.c                | 1161 ++++++++++++
 drivers/platform/x86/asus-armoury.h                | 1541 ++++++++++++++++
 drivers/platform/x86/asus-wmi.c                    |  185 +-
 drivers/platform/x86/ayaneo-ec.c                   |  593 ++++++
 drivers/platform/x86/dell/alienware-wmi-wmax.c     |  226 +--
 drivers/platform/x86/dell/dell-wmi-base.c          |   12 +
 drivers/platform/x86/gpd-pocket-fan.c              |    4 +-
 drivers/platform/x86/hp/hp-wmi.c                   |   30 +-
 drivers/platform/x86/huawei-wmi.c                  |    4 +
 drivers/platform/x86/intel/hid.c                   |   13 +
 .../platform/x86/intel/int3472/clk_and_regulator.c |    5 +-
 drivers/platform/x86/intel/pmc/arl.c               |   12 +-
 drivers/platform/x86/intel/pmc/core.c              |  149 +-
 drivers/platform/x86/intel/pmc/core.h              |   16 +-
 drivers/platform/x86/intel/pmc/lnl.c               |    2 +-
 drivers/platform/x86/intel/pmc/mtl.c               |    9 +-
 drivers/platform/x86/intel/pmc/ptl.c               |    3 +-
 drivers/platform/x86/intel/pmc/wcl.c               |   18 +
 drivers/platform/x86/intel/punit_ipc.c             |    2 +-
 .../x86/intel/speed_select_if/isst_if_mmio.c       |    4 +-
 .../uncore-frequency/uncore-frequency-common.h     |    9 +-
 .../x86/intel/uncore-frequency/uncore-frequency.c  |    4 +
 drivers/platform/x86/intel/vsec.c                  |    2 +
 drivers/platform/x86/lenovo/ideapad-laptop.c       |  218 ++-
 drivers/platform/x86/lenovo/wmi-gamezone.c         |   35 +-
 drivers/platform/x86/lg-laptop.c                   |   11 +
 drivers/platform/x86/msi-wmi-platform.c            |   43 +-
 drivers/platform/x86/oxpec.c                       |  115 +-
 drivers/platform/x86/serial-multi-instantiate.c    |   13 +-
 drivers/platform/x86/uniwill/Kconfig               |   38 +
 drivers/platform/x86/uniwill/Makefile              |    8 +
 drivers/platform/x86/uniwill/uniwill-acpi.c        | 1912 ++++++++++++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.c         |   92 +
 drivers/platform/x86/uniwill/uniwill-wmi.h         |  129 ++
 drivers/platform/x86/x86-android-tablets/lenovo.c  |    2 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c      |    2 +-
 fs/nls/nls_base.c                                  |   27 +-
 .../linux/platform_data/x86/asus-wmi-leds-ids.h    |   50 +
 include/linux/platform_data/x86/asus-wmi.h         |   58 +-
 include/linux/platform_data/x86/int3472.h          |    1 -
 include/linux/platform_data/x86/intel_pmc_ipc.h    |    4 +-
 include/linux/platform_profile.h                   |    1 +
 include/linux/wmi.h                                |   15 +-
 include/uapi/linux/input-event-codes.h             |   12 +
 include/uapi/linux/isst_if.h                       |   50 +-
 tools/power/x86/intel-speed-select/isst-config.c   |    2 +-
 .../power/x86/intel-speed-select/isst-core-tpmi.c  |   46 +-
 86 files changed, 7305 insertions(+), 797 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
 create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
 create mode 100644 drivers/platform/wmi/Kconfig
 create mode 100644 drivers/platform/wmi/Makefile
 rename drivers/platform/{x86/wmi.c => wmi/core.c} (98%)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h
 create mode 100644 drivers/platform/x86/ayaneo-ec.c
 create mode 100644 drivers/platform/x86/uniwill/Kconfig
 create mode 100644 drivers/platform/x86/uniwill/Makefile
 create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
 create mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h
