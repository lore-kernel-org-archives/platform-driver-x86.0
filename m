Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0F413D69;
	Mon, 24 Aug 2026 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574004; cv=none; b=Z6IdryQOAfL9j4MbVvG3aMUiwNc302uWG8h+ze1Fs7SkHW54e7KWI2wItlqzrUdrKuAdOXit07z3GRecssk9QsKiDCyCRJVkPfXJ1TZzd8FHVWt6JDp58RHbLRBqvgTYat5GXCen5ZHt/tqPnYxCaC3uqIHhY26nnh48IORLvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574004; c=relaxed/simple;
	bh=io0fY6EamnGoPTyCoQM4r/evQttlRcPWwwr09q4zZqE=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=P+MkBy0D1oDRDO/9VrEqt1gsiRl9AeOXPjDHpUE8l1YNA41lV3uILYyHZTtyHTZjverNF8cJRs1CD66uFR0oaI9pzBzpRHv/Uo8WwRagXrLtOjJ6tz6UkRTRuM6dB7VZUVJurs4fh03z9sFHCUQSlVM57n1HoNrHzXv7i+wKoVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZJJUFFE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZJJUFFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787574002; x=1819110002;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=io0fY6EamnGoPTyCoQM4r/evQttlRcPWwwr09q4zZqE=;
  b=ZZJJUFFE7HD4qstTnFNfq/ommaIE6mrIkPPpIHWvRnq/6U96+cOa6kcM
   7SyKh9hAiF0yRAKGxlVKhsDZxC6Hlt020pRxUjpNjJG7Od1pZCeQrVi1e
   hsGRuDccytDGA4QdHzUzmir6HV2ybXq8O+qtvW2LWiA39tGt2Az28XiC9
   E9YnEB8PKXUU0cPpV7hPgXCEI5bZHkMPhLKVZ0GqELz4wKOKYX9z7LLXL
   RTYmO+J2K3JcmsR+T3glP5x1KpVHf4R8e16I6yNUYC0XPxHaZr8ZeNRt6
   JvCJDYqMEHXZB7ESEAYqEq16hQXUjmMScl2t3/o9HI0WoIe8omKMYQHBf
   Q==;
X-CSE-ConnectionGUID: VVkkBKhMRKu/JsB0wDHtvg==
X-CSE-MsgGUID: VukIupeISdqcImaaFjnN3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87893581"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87893581"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:20:01 -0700
X-CSE-ConnectionGUID: q3RfesryQ+u/WIgR+W7RRw==
X-CSE-MsgGUID: yOdeMoL+Rxmbnx6BOtzXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263710892"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:19:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 24 Aug 2026 15:06:36 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.3-1
Message-ID: <pdx86-pr-20260824150636-1750022160@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v7.3.

Highlights:

- amd/halo: Add Halo RGB LED driver

- amd/hsmp:
  - Properly serialize probe, remove, and data paths
  - Add support for protocol v7 used by Family 1AH Model 80H
  - Fix error checking corner cases (largely from AI review)
  - Reject negative power cap

- amd/pmc:
  - Improve behavior on platforms that do not support STB
  - Add T14 Gen2 AMD (20XL) to s2idle quirk list

- amd/pmf:
  - Add ioctl interface to retrieve device metrics
  - Add support for new metrics tables used by Family 1AH Model 80H

- arm64: qcom-hamoa-ec: Reject short responses

- asus-nb-wmi: Support ProArt key on ASUS ProArt PX13

- asus-armoury:
  - Gate PPT writes behind active fan curve
  - Add power limits for more models

- dell-wmi-base: Fix handling of ultra performance key

- dell-wmi-sysman: Don't hex dump attribute security buffer

- hp-bioscfg:
  - Various fixes
  - Improve reduced ACPI packages support (necessary for HP EliteBook 840 G2)

- lg-laptop:
  - Fix LED resource handling
  - Add support for events used in newer models
  - Fix keyboard backlight support on LG Gram 16T90SP

- hp-wmi:
  - Generalize thermal params to board params
  - Manage CPU and GPU PWM independently
  - Add GPU MUX switch support
  - Add Victus 15-fb0xxx support
  - Add OMEN MAX 16-ak0xxx, OMEN 16-n0xxx, OMEN 16-wd0xxx, OMEN
    16-wf0xxx, and OMEN board ID 8D88 support
  - Add OMEN Transcend 16-u0xxx support

- huawei: Add support for Fn-lock ACPI interface found on newer Huawei
          laptops such as MateBook 14 2024

- ISST:
  - Improve input validation (many fixes)
  - Disallow SST-CP (core-power) feature if perf profile add fails

- lenovo/yb9-kbdock: Add driver for Yoga Book 9 14IAH10

- lenovo/ymc:
  - Extend hinge switch query to support Yoga 9 2-in-1 14IPH11
  - Prevent loading on Yoga Book 9 14IAH10 to avoid duplicated input
    nodes

- msi-ec: Add MSI Raider A18 HX A9WJG and MSI Katana GF76 11UEK support

- msi-wmi: Add MSI Claw M-Center keys support

- oxpec: Add support for OneXPlayer X2 Mini Pro

- redmi-wmi: Report kbd backlight cycle, OEM preset power mode, and FnLock
             toggle events to userspace

- samsung-galaxybook: Add Samsung Galaxy Book6 Pro support

- thinkpad_acpi: Add USB-C Security support

- uniwill-laptop:
  - Add keyboard backlight, AC auto boot, and USB powershare support
  - Add MACHENIKE L16 Pro, AiStone X4SP4NAL, and Avell A60 MUV support
  - Make lightbar max brightness configurable and add support for
    LAPQC71A/B

- Major refactoring efforts:
  - Stop setting acpi_device_name/class() and pnp.device_class to
    faciliate their eventual removal

- Many rollback/remove path fixes (presumably mostly found by AI)

- Miscellaneous cleanups / refactoring / improvements

Regards, i.


The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.3-1

for you to fetch changes up to 54745d563114b74f6fecebce68cd020d06c1772b:

  platform/x86: think-lmi: Fix current password length check (2026-08-18 19:28:32 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.3-1

Highlights:

- amd/halo: Add Halo RGB LED driver

- amd/hsmp:
  - Properly serialize probe, remove, and data paths
  - Add support for protocol v7 used by Family 1AH Model 80H
  - Fix error checking corner cases (largely from AI review)
  - Reject negative power cap

- amd/pmc:
  - Improve behavior on platforms that do not support STB
  - Add T14 Gen2 AMD (20XL) to s2idle quirk list

- amd/pmf:
  - Add ioctl interface to retrieve device metrics
  - Add support for new metrics tables used by Family 1AH Model 80H

- arm64: qcom-hamoa-ec: Reject short responses

- asus-nb-wmi: Support ProArt key on ASUS ProArt PX13

- asus-armoury:
  - Gate PPT writes behind active fan curve
  - Add power limits for more models

- dell-wmi-base: Fix handling of ultra performance key

- dell-wmi-sysman: Don't hex dump attribute security buffer

- hp-bioscfg:
  - Various fixes
  - Improve reduced ACPI packages support (necessary for HP EliteBook 840 G2)

- lg-laptop:
  - Fix LED resource handling
  - Add support for events used in newer models
  - Fix keyboard backlight support on LG Gram 16T90SP

- hp-wmi:
  - Generalize thermal params to board params
  - Manage CPU and GPU PWM independently
  - Add GPU MUX switch support
  - Add Victus 15-fb0xxx support
  - Add OMEN MAX 16-ak0xxx, OMEN 16-n0xxx, OMEN 16-wd0xxx, OMEN
    16-wf0xxx, and OMEN board ID 8D88 support
  - Add OMEN Transcend 16-u0xxx support

- huawei: Add support for Fn-lock ACPI interface found on newer Huawei
          laptops such as MateBook 14 2024

- ISST:
  - Improve input validation (many fixes)
  - Disallow SST-CP (core-power) feature if perf profile add fails

- lenovo/yb9-kbdock: Add driver for Yoga Book 9 14IAH10

- lenovo/ymc:
  - Extend hinge switch query to support Yoga 9 2-in-1 14IPH11
  - Prevent loading on Yoga Book 9 14IAH10 to avoid duplicated input
    nodes

- msi-ec: Add MSI Raider A18 HX A9WJG and MSI Katana GF76 11UEK support

- msi-wmi: Add MSI Claw M-Center keys support

- oxpec: Add support for OneXPlayer X2 Mini Pro

- redmi-wmi: Report kbd backlight cycle, OEM preset power mode, and FnLock
             toggle events to userspace

- samsung-galaxybook: Add Samsung Galaxy Book6 Pro support

- thinkpad_acpi: Add USB-C Security support

- uniwill-laptop:
  - Add keyboard backlight, AC auto boot, and USB powershare support
  - Add MACHENIKE L16 Pro, AiStone X4SP4NAL, and Avell A60 MUV support
  - Make lightbar max brightness configurable and add support for
    LAPQC71A/B

- Major refactoring efforts:
  - Stop setting acpi_device_name/class() and pnp.device_class to
    faciliate their eventual removal

- Many rollback/remove path fixes (presumably mostly found by AI)

- Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

acer-wmi:
 -  reject missing gaming WMI results

amd/hsmp:
 -  ACPI HSMP refcounted sockets and coordinated release
 -  Add HSMP messages for Family 1Ah, Model 50h-5Fh
 -  Add IOCTL_GET_TELEMETRY_DATA for metric table reads
 -  Clear mdev.this_device on deregister
 -  Enable protocol version 7 metric tables on the ACPI driver
 -  Gate the data plane on a fully initialized socket
 -  Map the metric table with ioremap() and unmap it explicitly
 -  Pass struct device explicitly to ACPI mailbox parsers
 -  Reject negative power cap writes in hwmon
 -  Serialize ACPI HSMP probe and remove with an rwsem
 -  Serialize per-socket metric table reads with a mutex
 -  Serialize the data plane against socket teardown
 -  Source metric-table size from firmware
 -  Unify response_sz validation to an upper-bound check
 -  Validate ACPI UID before parsing socket index
 -  Validate _DSD mailbox sub-package element count

amd:
 -  Introduce Halo Box RGB LED driver

amd/pmc:
 -  Add T14 Gen2 AMD (20XL) to s2idle quirk list
 -  Do not fail probe when STB init fails
 -  Fix LPS0 and debugfs leaks when STB init fails
 -  Fix msg_port restoration in amd_stb_debugfs_open_v2()
 -  Only expose stb_read after telemetry buffer is mapped
 -  Propagate SMU errors and validate S2D address
 -  Restore msg_port on amd_stb_s2d_init() error paths

amd/pmf:
 -  Add 1AH_M80H device IDs and extended SMU mailbox registers
 -  Add 1AH_M80H metrics table and NPU metrics support
 -  Add missing newline in dev_err message
 -  Add util layer and userspace character device interface
 -  Implement util layer ioctl handler
 -  Introduce AMD PMF testing tool for driver metrics and features
 -  Move debug helper functions to UAPI header
 -  Move metrics code to dedicated file
 -  Refactor NPU metrics for platform extensibility
 -  store BIOS output values for user-space metrics via util IOCTL
 -  Store commonly used enums in the header file
 -  Use per-SoC smu_regs struct for SMU mailbox registers
 -  Use upper/lower_32_bits() in amd_pmf_set_dram_addr()

arm64: qcom-hamoa-ec:
 -  reject incomplete responses

asus-armoury:
 -  Add power limits for ROG Strix SCAR 16 (G635LX)
 -  Add power limits quirk for FA401KM
 -  Add power limits quirk for FA608WV
 -  add support for FX517ZR
 -  add support for HN7306EA and HN7306EAC
 -  fix Use-After-Free and memory leak in driver init
 -  gate PPT writes behind active fan curve
 -  use cleanup.h to manage tunables

asus-laptop:
 -  Stop setting acpi_device_name/class()

asus-nb-wmi:
 -  map ProArt key (0x8b) to KEY_PROG3

asus-wireless:
 -  Fail probe when there is no ACPI match

asus-wmi:
 -  fix resource leaks on probe failure

dell-ddv:
 -  Use no_free_ptr() to simplify error handling

dell-privacy:
 -  Fix race condition

dell-smbios:
 -  Pass device to callbacks

dell-smbios-wmi:
 -  Fix chardev resource management
 -  Replace global list with single item

dell-wmi-base:
 -  Fix handling of ultra performance key
 -  Fix resource leak on module load failure

dell-wmi-sysman:
 -  Don't hex dump attribute security buffer
 -  Fix instance ID bounds

Documentation/ABI:
 -  add testing entry for AMD PMF character device interface

eeepc-laptop:
 -  Stop setting acpi_device_name/class()

fujitsu-laptop:
 -  Stop setting acpi_device_name/class()

fujitsu-tablet:
 -  Stop setting acpi_device_name/class()

hp-bioscfg:
 -  accept reduced ACPI packages from older HP BIOS
 -  advance elem past consumed array elements
 -  bound ordered-list parsing by the package count
 -  fix heap OOB read in sk_store() and kek_store()
 -  fix heap OOB read on empty password write
 -  fix new_password_store() overwriting current_password
 -  fix off-by-one write in hp_get_string_from_buffer()
 -  fix ORD_LIST_ELEMENTS never being parsed
 -  fix password encoding bounds check
 -  pass validated element count to package parsers
 -  warn on element type mismatch instead of failing

hp-wmi:
 -  Add dual-channel PWM fan control
 -  Add GPU MUX switch support
 -  Add OMEN board 8A43 thermal profile support
 -  Add OMEN board 8BA9 thermal profile support
 -  Add OMEN board 8BAA thermal profile support
 -  Add OMEN board 8D88 thermal profile support
 -  Add OMEN Transcend 16 8BB3 support
 -  Add support for OMEN MAX 16-ak0xxx (8DD6)
 -  Add Victus 15-fb0xxx support
 -  Drive fan control from board data
 -  Introduce board-specific feature data

huawei-wmi:
 -  add ACPI fallback for Fn-lock on newer models

ideapad-laptop:
 -  Fix driver unregistration order

int1092:
 -  Fix info leak in parse_package()
 -  Fix potential memory leak in sar_probe()

intel/pmc:
 -  initialize empty PMT read result

ishtp_eclite:
 -  Fix ACPI device reference leak in probe error path

ISST:
 -  Add a NULL check for sst_inst[]
 -  Just allow 2 bits for SST feature enable
 -  Return error during profile addition
 -  Use PP level enable mask
 -  Validate level in perf mask ioctls
 -  Validate logical CPU id and clos id
 -  Validate max level for set feature
 -  Validate parameter for core power state
 -  Validate parameter for frequency and priority
 -  Validate socket ID in clos_assoc ioctl

lenovo:
 -  Add Yoga Book 9 keyboard dock detection driver

lenovo: lenovo-ymc:
 -  Suppress probe on Yoga Book 9 14IAH10

lenovo/ymc:
 -  Only match lower byte in WMI lid switch query response

lg-laptop:
 -  Add support for additional events
 -  Add support for native ACPI events
 -  Fix keyboard backlight support on LG Gram 16T90SP
 -  Fix LED resource handling
 -  Improve WMAB control method support

MAINTAINERS:
 -  update Intel PMC Core maintainer contact

mlxbf-bootctl:
 -  fix the build error with FIELD_PREP()

mlxbf-pmc:
 -  Check ACPI_COMPANION() against NULL

msi-ec:
 -  Add MSI Katana GF76 11UEK EC firmware
 -  Add MSI Raider A18 HX A9WJG EC firmware

msi-wmi:
 -  Add MSI Claw M-Center keys
 -  Reformat msi_wmi_notify()

oxpec:
 -  Add support for OneXPlayer X2 Mini Pro

panasonic-laptop:
 -  Fix sentinel write past pcc->sinf[]
 -  Stop setting acpi_device_name/class()

power: supply: surface_{battery,charger}:
 -  Consistently define ssam_device_ids using named initializers

redmi-wmi:
 -  report EC state change events

samsung-galaxybook:
 -  Add SAMB430 device ID

sony-laptop:
 -  Stop setting acpi_device_class()

sonypi:
 -  Stop setting acpi_device_name/class()

surface: acpi-notify:
 -  Check ACPI companion before use

surface: aggregator:
 -  Consistently define ssam_device_ids using named initializers

surface: surfacepro3_button:
 -  Stop setting acpi_device_name()

think-lmi:
 -  Fix certificate thumbprint sysfs output
 -  Fix current password length check
 -  Free system certificate signatures

thinkpad_acpi:
 -  Add USB-C Security (USCS) support
 -  Fix fan speed reporting on Edge E330
 -  Fix USB-C Security probe failure on unsupported platforms
 -  Stop setting acpi_device_class()

topstar-laptop:
 -  Stop setting acpi_device_name/class()

toshiba_acpi:
 -  Do not use uninitialized device_class

toshiba_bluetooth:
 -  Use more common error handling code in toshiba_bt_rfkill_probe()

toshiba_haps:
 -  Do not use uninitialized device_class

uniwill-laptop:
 -  Add 2 new feature defines for TUXEDO devices
 -  Add AC auto boot support
 -  Add Avell A60 MUV support
 -  Add keyboard backlight support
 -  Add lightbar support for LAPQC71A/B
 -  Add support for the AiStone X4SP4NAL
 -  Add support for the MACHENIKE L16 Pro
 -  Add support for USB powershare
 -  Handle screen-related events
 -  Remove single color keyboard detection
 -  Split uniwill_kbd_led_init()

x86/platform/olpc: xo15:
 -  Stop setting acpi_device_name/class()

xo15-ebook:
 -  Stop setting acpi_device_name/class()

----------------------------------------------------------------
AbdElRahman Soliman (1):
      platform/x86: asus-armoury: add support for FX517ZR

Abdun Nihaal (2):
      platform/x86: int1092: Fix potential memory leak in sar_probe()
      platform/x86: int1092: Fix info leak in parse_package()

Ahmed Yaseen (1):
      platform/x86: asus-armoury: gate PPT writes behind active fan curve

Andrew Onyshchuk (1):
      platform/x86: thinkpad_acpi: Fix fan speed reporting on Edge E330

Armin Wolf (20):
      platform/x86: uniwill-laptop: Add keyboard backlight support
      platform/x86: uniwill-laptop: Handle screen-related events
      platform/x86: uniwill-laptop: Add AC auto boot support
      platform/x86: uniwill-laptop: Add support for USB powershare
      platform/x86: uniwill-laptop: Add support for the MACHENIKE L16 Pro
      platform/x86: uniwill-laptop: Add support for the AiStone X4SP4NAL
      platform/x86: dell-privacy: Fix race condition
      platform/x86: dell-wmi-base: Fix resource leak on module load failure
      platform/x86: dell-wmi-base: Fix handling of ultra performance key
      platform/x86: dell-ddv: Use no_free_ptr() to simplify error handling
      platform/x86: lg-laptop: Fix LED resource handling
      platform/x86: lg-laptop: Add support for native ACPI events
      platform/x86: lg-laptop: Add support for additional events
      platform/x86: lg-laptop: Improve WMAB control method support
      platform/x86: lg-laptop: Fix keyboard backlight support on LG Gram 16T90SP
      platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
      platform/x86: uniwill-laptop: Remove single color keyboard detection
      platform/x86: dell-smbios-wmi: Fix chardev resource management
      platform/x86: dell-smbios: Pass device to callbacks
      platform/x86: dell-smbios-wmi: Replace global list with single item

Avi Fenesh (1):
      platform/x86: asus-armoury: Add power limits for ROG Strix SCAR 16 (G635LX)

Dave Carey (2):
      platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
      platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

David E. Box (1):
      MAINTAINERS: update Intel PMC Core maintainer contact

David Glushkov (1):
      platform/x86: msi-ec: Add MSI Raider A18 HX A9WJG EC firmware

Derek J. Clark (2):
      platform/x86: msi-wmi: Reformat msi_wmi_notify()
      platform/x86: msi-wmi: Add MSI Claw M-Center keys

Flávio Barroso Neves (1):
      platform/x86: asus-armoury: add support for HN7306EA and HN7306EAC

Guangshuo Li (1):
      platform/x86: hp-bioscfg: fix password encoding bounds check

Hemanth Selam (1):
      platform/x86/amd/hsmp: Reject negative power cap writes in hwmon

Hilgad Montelo (1):
      platform/x86: panasonic-laptop: Fix sentinel write past pcc->sinf[]

HyeongJun An (4):
      platform/x86: dell-wmi-sysman: Don't hex dump attribute security buffer
      platform/x86: dell-wmi-sysman: Fix instance ID bounds
      platform/x86: ISST: Validate socket ID in clos_assoc ioctl
      platform/x86: ISST: Validate level in perf mask ioctls

Jeff Hagadorn (1):
      platform/x86: oxpec: Add support for OneXPlayer X2 Mini Pro

Julian Haarmann (1):
      platform/x86: lenovo/ymc: Only match lower byte in WMI lid switch query response

Krishna Chomal (1):
      platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8DD6)

Kürşat Abaylı (2):
      platform/x86: hp-wmi: Add dual-channel PWM fan control
      platform/x86: hp-wmi: Add GPU MUX switch support

Linmao Li (4):
      platform/x86: asus-wireless: Fail probe when there is no ACPI match
      platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION() against NULL
      platform/surface: acpi-notify: Check ACPI companion before use
      platform: arm64: qcom-hamoa-ec: reject incomplete responses

Ma Ke (1):
      platform/x86: ishtp_eclite: Fix ACPI device reference leak in probe error path

Marco Scardovi (5):
      platform/x86: asus-armoury: Add power limits quirk for FA401KM
      platform/x86: asus-armoury: Add power limits quirk for FA608WV
      platform/x86: asus-armoury: fix Use-After-Free and memory leak in driver init
      platform/x86: asus-armoury: use cleanup.h to manage tunables
      platform/x86: asus-wmi: fix resource leaks on probe failure

Mario Limonciello (6):
      platform/x86/amd/pmc: Restore msg_port on amd_stb_s2d_init() error paths
      platform/x86/amd/pmc: Fix msg_port restoration in amd_stb_debugfs_open_v2()
      platform/x86/amd/pmc: Propagate SMU errors and validate S2D address
      platform/x86/amd/pmc: Only expose stb_read after telemetry buffer is mapped
      platform/x86/amd/pmc: Fix LPS0 and debugfs leaks when STB init fails
      platform/x86/amd/pmc: Do not fail probe when STB init fails

Markus Elfring (1):
      platform/x86: toshiba_bluetooth: Use more common error handling code in toshiba_bt_rfkill_probe()

Muhammad Bilal (10):
      platform/x86: hp-bioscfg: pass validated element count to package parsers
      platform/x86: hp-bioscfg: bound ordered-list parsing by the package count
      platform/x86: hp-bioscfg: accept reduced ACPI packages from older HP BIOS
      platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
      platform/x86: hp-bioscfg: fix off-by-one write in hp_get_string_from_buffer()
      platform/x86: hp-bioscfg: fix heap OOB read in sk_store() and kek_store()
      platform/x86: hp-bioscfg: fix heap OOB read on empty password write
      platform/x86: hp-bioscfg: fix new_password_store() overwriting current_password
      platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
      platform/x86: hp-bioscfg: advance elem past consumed array elements

Muralidhara M K (15):
      platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
      platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
      platform/x86/amd/hsmp: Pass struct device explicitly to ACPI mailbox parsers
      platform/x86/amd/hsmp: Gate the data plane on a fully initialized socket
      platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an rwsem
      platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
      platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
      platform/x86/amd/hsmp: Clear mdev.this_device on deregister
      platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
      platform/x86/amd/hsmp: Serialize the data plane against socket teardown
      platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
      platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
      platform/x86/amd/hsmp: Source metric-table size from firmware
      platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table reads
      platform/x86/amd/hsmp: Enable protocol version 7 metric tables on the ACPI driver

Musaev Ibragim (1):
      platform/x86: redmi-wmi: report EC state change events

Nikolay Kulikov (1):
      mlxbf-bootctl: fix the build error with FIELD_PREP()

Nizar Al-Kabbani (1):
      platform/x86: asus-nb-wmi: map ProArt key (0x8b) to KEY_PROG3

Radhey Kalra (3):
      platform/x86: hp-wmi: Introduce board-specific feature data
      platform/x86: hp-wmi: Drive fan control from board data
      platform/x86: hp-wmi: Add Victus 15-fb0xxx support

Rafael J. Wysocki (14):
      platform/x86: asus-laptop: Stop setting acpi_device_name/class()
      platform/x86: eeepc-laptop: Stop setting acpi_device_name/class()
      platform/x86: fujitsu-laptop: Stop setting acpi_device_name/class()
      platform/x86: fujitsu-tablet: Stop setting acpi_device_name/class()
      platform/x86: thinkpad_acpi: Stop setting acpi_device_class()
      platform/x86: panasonic-laptop: Stop setting acpi_device_name/class()
      platform/x86: sony-laptop: Stop setting acpi_device_class()
      platform/x86: toshiba_acpi: Do not use uninitialized device_class
      platform/x86: toshiba_haps: Do not use uninitialized device_class
      platform/x86: xo15-ebook: Stop setting acpi_device_name/class()
      platform/x86: topstar-laptop: Stop setting acpi_device_name/class()
      platform/surface: surfacepro3_button: Stop setting acpi_device_name()
      sonypi: Stop setting acpi_device_name/class()
      x86/platform/olpc: xo15: Stop setting acpi_device_name/class()

Riccardo Squarcialupi (1):
      platform/x86: samsung-galaxybook: Add SAMB430 device ID

Rong Zhang (1):
      platform/x86: ideapad-laptop: Fix driver unregistration order

Shaposhnikov Daniil (1):
      platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models

Shyam Sundar S K (14):
      platform/x86/amd/pmf: Add util layer and userspace character device interface
      platform/x86/amd/pmf: store BIOS output values for user-space metrics via util IOCTL
      platform/x86/amd/pmf: Store commonly used enums in the header file
      platform/x86/amd/pmf: Move debug helper functions to UAPI header
      platform/x86/amd/pmf: Implement util layer ioctl handler
      platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
      Documentation/ABI: add testing entry for AMD PMF character device interface
      platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox registers
      platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox registers
      platform/x86/amd/pmf: Move metrics code to dedicated file
      platform/x86/amd/pmf: Add missing newline in dev_err message
      platform/x86/amd/pmf: Use upper/lower_32_bits() in amd_pmf_set_dram_addr()
      platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
      platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support

Srinivas Pandruvada (8):
      platform/x86: ISST: Validate logical CPU id and clos id
      platform/x86: ISST: Validate max level for set feature
      platform/x86: ISST: Validate parameter for core power state
      platform/x86: ISST: Validate parameter for frequency and priority
      platform/x86: ISST: Use PP level enable mask
      platform/x86: ISST: Just allow 2 bits for SST feature enable
      platform/x86: ISST: Return error during profile addition
      platform/x86: ISST: Add a NULL check for sst_inst[]

Suryansh Singh (5):
      platform/x86: hp-wmi: Add OMEN board 8BA9 thermal profile support
      platform/x86: hp-wmi: Add OMEN board 8BAA thermal profile support
      platform/x86: hp-wmi: Add OMEN Transcend 16 8BB3 support
      platform/x86: hp-wmi: Add OMEN board 8A43 thermal profile support
      platform/x86: hp-wmi: Add OMEN board 8D88 thermal profile support

Thorsten Blum (3):
      platform/x86: think-lmi: Free system certificate signatures
      platform/x86: think-lmi: Fix certificate thumbprint sysfs output
      platform/x86: think-lmi: Fix current password length check

Uwe Kleine-König (The Capable Hub) (2):
      platform/surface: aggregator: Consistently define ssam_device_ids using named initializers
      power: supply: surface_{battery,charger}: Consistently define ssam_device_ids using named initializers

Vishnu Sankar (2):
      platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
      platform/x86: thinkpad_acpi: Fix USB-C Security probe failure on unsupported platforms

Werner Sembach (3):
      platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
      platform/x86: uniwill-laptop: Add 2 new feature defines for TUXEDO devices
      platform/x86: uniwill-laptop: Add Avell A60 MUV support

Yap Weei Choong (1):
      platform/x86/amd/pmc: Add T14 Gen2 AMD (20XL) to s2idle quirk list

Yaroslav Dudkov (1):
      platform/x86: msi-ec: Add MSI Katana GF76 11UEK EC firmware

Yo-Jung Leo Lin (AMD) (1):
      platform/x86/amd: Introduce Halo Box RGB LED driver

Yousef Alhouseen (2):
      platform/x86/intel/pmc: initialize empty PMT read result
      platform/x86: acer-wmi: reject missing gaming WMI results

 Documentation/ABI/testing/amdpmf-interface         |  73 +++
 .../ABI/testing/sysfs-driver-lenovo-yb9-kbdock     |  19 +
 .../ABI/testing/sysfs-driver-uniwill-laptop        |  25 +
 .../admin-guide/laptops/thinkpad-acpi.rst          |  24 +
 .../admin-guide/laptops/uniwill-laptop.rst         |  27 +
 Documentation/arch/x86/amd_hsmp.rst                |  35 +-
 MAINTAINERS                                        |  17 +-
 arch/x86/include/uapi/asm/amd_hsmp.h               | 222 ++++++-
 arch/x86/platform/olpc/olpc-xo15-sci.c             |   5 -
 drivers/char/sonypi.c                              |   2 -
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c |  13 +-
 drivers/platform/arm64/qcom-hamoa-ec.c             |   4 +-
 drivers/platform/mellanox/mlxbf-bootctl.c          |   1 +
 drivers/platform/mellanox/mlxbf-pmc.c              |  10 +-
 drivers/platform/surface/surface_acpi_notify.c     |   6 +-
 drivers/platform/surface/surface_aggregator_hub.c  |   9 +-
 .../platform/surface/surface_aggregator_tabletsw.c |   9 +-
 drivers/platform/surface/surfacepro3_button.c      |   8 +-
 drivers/platform/x86/Kconfig                       |   1 -
 drivers/platform/x86/acer-wmi.c                    |   4 +-
 drivers/platform/x86/amd/Kconfig                   |  11 +
 drivers/platform/x86/amd/Makefile                  |   1 +
 drivers/platform/x86/amd/amd_halo_led.c            | 315 ++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c               | 221 ++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c               | 304 ++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h               |  19 +-
 drivers/platform/x86/amd/hsmp/hwmon.c              |   3 +
 drivers/platform/x86/amd/hsmp/plat.c               |  38 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c             |  83 ++-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |   8 +
 drivers/platform/x86/amd/pmc/pmc.c                 |   9 +-
 drivers/platform/x86/amd/pmf/Kconfig               |  10 +
 drivers/platform/x86/amd/pmf/Makefile              |   4 +-
 drivers/platform/x86/amd/pmf/core.c                | 261 +++-----
 drivers/platform/x86/amd/pmf/metrics.c             | 330 ++++++++++
 drivers/platform/x86/amd/pmf/pmf.h                 | 270 +++++++-
 drivers/platform/x86/amd/pmf/spc.c                 |  72 +--
 drivers/platform/x86/amd/pmf/tee-if.c              |  13 +-
 drivers/platform/x86/amd/pmf/util.c                | 153 +++++
 drivers/platform/x86/asus-armoury.c                |  66 +-
 drivers/platform/x86/asus-armoury.h                | 150 +++++
 drivers/platform/x86/asus-laptop.c                 |   9 +-
 drivers/platform/x86/asus-nb-wmi.c                 |   1 +
 drivers/platform/x86/asus-wireless.c               |  11 +-
 drivers/platform/x86/asus-wmi.c                    |  30 +-
 drivers/platform/x86/dell/dell-smbios-base.c       |   6 +-
 drivers/platform/x86/dell/dell-smbios-smm.c        |   8 +-
 drivers/platform/x86/dell/dell-smbios-wmi.c        | 101 ++-
 drivers/platform/x86/dell/dell-smbios.h            |   4 +-
 drivers/platform/x86/dell/dell-wmi-base.c          |  19 +-
 drivers/platform/x86/dell/dell-wmi-ddv.c           |  22 +-
 drivers/platform/x86/dell/dell-wmi-privacy.c       |   4 +-
 .../x86/dell/dell-wmi-sysman/biosattr-interface.c  |   1 -
 .../x86/dell/dell-wmi-sysman/dell-wmi-sysman.h     |   2 +-
 drivers/platform/x86/eeepc-laptop.c                |   7 +-
 drivers/platform/x86/fujitsu-laptop.c              |  18 +-
 drivers/platform/x86/fujitsu-tablet.c              |  13 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |  18 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h       |   8 +
 .../platform/x86/hp/hp-bioscfg/enum-attributes.c   |  15 +-
 .../platform/x86/hp/hp-bioscfg/int-attributes.c    |   6 +-
 .../x86/hp/hp-bioscfg/order-list-attributes.c      |  14 +-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c       |  19 +-
 .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c |   4 +-
 .../platform/x86/hp/hp-bioscfg/string-attributes.c |   6 +-
 drivers/platform/x86/hp/hp-wmi.c                   | 421 ++++++++++---
 drivers/platform/x86/huawei-wmi.c                  |  99 +++
 drivers/platform/x86/intel/int1092/intel_sar.c     |  32 +-
 drivers/platform/x86/intel/ishtp_eclite.c          |   5 +-
 drivers/platform/x86/intel/pmc/core.c              |   2 +-
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |  80 ++-
 drivers/platform/x86/lenovo/Kconfig                |  14 +
 drivers/platform/x86/lenovo/Makefile               |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c       |   2 +-
 drivers/platform/x86/lenovo/think-lmi.c            |  19 +-
 drivers/platform/x86/lenovo/thinkpad_acpi.c        | 131 +++-
 drivers/platform/x86/lenovo/yb9-kbdock.c           | 323 ++++++++++
 drivers/platform/x86/lenovo/ymc.c                  |  27 +-
 drivers/platform/x86/lg-laptop.c                   | 644 ++++++++++++-------
 drivers/platform/x86/msi-ec.c                      |  82 +++
 drivers/platform/x86/msi-wmi.c                     |  97 ++-
 drivers/platform/x86/oxpec.c                       |   7 +
 drivers/platform/x86/panasonic-laptop.c            |  15 +-
 drivers/platform/x86/redmi-wmi.c                   |  26 +-
 drivers/platform/x86/samsung-galaxybook.c          |   1 +
 drivers/platform/x86/sony-laptop.c                 |   5 +-
 drivers/platform/x86/topstar-laptop.c              |   2 -
 drivers/platform/x86/toshiba_acpi.c                |   6 +-
 drivers/platform/x86/toshiba_bluetooth.c           |   6 +-
 drivers/platform/x86/toshiba_haps.c                |   4 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c        | 682 +++++++++++++++++++--
 drivers/platform/x86/uniwill/uniwill-wmi.h         |   2 +
 drivers/platform/x86/xo15-ebook.c                  |   8 +-
 drivers/power/supply/surface_battery.c             |  11 +-
 drivers/power/supply/surface_charger.c             |   7 +-
 include/linux/amd-pmf-io.h                         |  11 +-
 include/linux/platform_data/x86/asus-wmi.h         |   5 +
 include/uapi/linux/amd-pmf.h                       | 204 ++++++
 tools/platform/x86/amd/Makefile                    |  60 ++
 tools/platform/x86/amd/test-pmf.c                  | 142 +++++
 100 files changed, 5344 insertions(+), 1040 deletions(-)
 create mode 100644 Documentation/ABI/testing/amdpmf-interface
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 create mode 100644 drivers/platform/x86/amd/amd_halo_led.c
 create mode 100644 drivers/platform/x86/amd/pmf/metrics.c
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
 create mode 100644 include/uapi/linux/amd-pmf.h
 create mode 100644 tools/platform/x86/amd/Makefile
 create mode 100644 tools/platform/x86/amd/test-pmf.c
