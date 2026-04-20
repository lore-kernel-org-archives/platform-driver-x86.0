Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F55363C7F;
	Mon, 20 Apr 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693918; cv=none; b=HjU2FFJ4YsBDWs8CQ+T2n0l4U03kP9cIGPzNA8SmaT21qRx0l+oXg+5VqkFu3DkNWPFJD8ZlRUQKztF0EY/GxHRVt8M/pkgjWTZOPrw3ozLbLvM3Upb1lPSCPNdUnsPsiNKAVltaqwbmO6e+jE3T3REtlBf5GsCQPmZbcDhMvEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693918; c=relaxed/simple;
	bh=ogVDysJcGyORCp9suwoAKZ58MhM1F57CDAmR4aLPhrI=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=KQyj9Cm7pvV+wrIDT8bCF8gm5zcEir0zHjeWKxht4K4haEQFWDFici4LMPGnSH05+e7N/NUw9U85eGNVrGiLhkj4uESXuNFILlwIXFyXIRU0f8qwNb6mLiET6B7PdvsKXEqGD0RJDAbzO/C01uN85YAAVfBY2daq90jThYNpMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BiR/7K4b; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiR/7K4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776693915; x=1808229915;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ogVDysJcGyORCp9suwoAKZ58MhM1F57CDAmR4aLPhrI=;
  b=BiR/7K4bWi1rN+FM1OXKAKG2/jkUhhXHNX326MpSwnwE1SDGNPGEGM1p
   Pai+Ht5UYsyKHSN21omlYsLB6Pv2kLV+Gkf+KPsM4QrNaDp6YMoJuyWmM
   lnc4pXbu5NrxA/4f9Wej4lr13CwTANkS/GCPXKGOAaJ0zgM25IXO6cipZ
   /hscmP/3p0/TSbhkPRqjQS7HJIMa0WDGlqv+uhctVADeVAGvzm3XWb5Nq
   OsLCl4kJKC4lVTwlzm+goXi6dZakeo0ZMQWyoiNloxbCJjSs7Qbg4OGOP
   br1RmhQZwTEfWr3qWgFdhA6czsocn6+jzc4Fmd13FQmZI12DwbVVvSO18
   Q==;
X-CSE-ConnectionGUID: cV9pQy7JSB+slHnFw5SGXQ==
X-CSE-MsgGUID: 88VKgJ56RlWmLtOqwHjkAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80196642"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="80196642"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 07:05:14 -0700
X-CSE-ConnectionGUID: 0E2lOTrgRmSwQaVXGliKnA==
X-CSE-MsgGUID: GhWl4mNDSp+AwP9dTbt4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="236104195"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 07:05:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 20 Apr 2026 16:58:56 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.1-1
Message-ID: <pdx86-pr-20260420165856-1561211278@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v7.1.

Highlights:

- asus-wmi:
  - Retain battery charge threshold during boot which avoids unsolicited
    change to 100%. Return -ENODATA when the limit is not yet known
  - Improve screenpad power/brightness handling consistency
  - Fix screenpad brightness range

- barco-p50-gpio: Normalize gpio_get return values

- bitland-mifs-wmi: Add driver for Bitland laptops (supports platform
                    profile,hwmon, kbd backlight, gpu mode, hotkeys, and
                    fan boost)

- dell_rbu: Fix using uninitialized value in sysfs write function

- dell-wmi-sysman: Respect destination length when constructing enum
                   strings

- hp-wmi:
  - Propagate fan setting apply failures and log an error
  - Fix sysfs write vs work handler cancel_delayed_work_sync() deadlock
  - Correct keepalive schedule_delayed_work() to mod_delayed_work()
  - Fix u8 underflows in GPU delta calculation
  - Use mutex to protect fan pwm/mode
  - Ignore kbd backlight and FnLock key events that are handled by FW
  - Fix fan table parsing (use correct field)
  - Add support for Omen 14-fb0xxx, 16-n0xxx, 16-wf1xxx, and Omen MAX
    16-ak0xxxx

- input: trackpoint & thinkpad_acpi: Enable doubletap by default and
                                     add sysfs enable/disable

- int3472: Add support for GPIO type 0x02 (IR flood LED)

- intel-speed-select: (updated to v1.26)
  - Avoid using current base frequency as maximum
  - Fix CPU extended family ID decoding
  - Fix exit code
  - Improve error reporting

- intel/vsec: Refactor to support ACPI-enumerated PMT endpoints.

- pcengines-apuv2: Attach software node to the gpiochip

- uniwill:
  - Refactor hwmon to smaller parts to accomodate HW diversity
  - Support USB-C power/performance priority switch through sysfs
  - Add another XMG Fusion 15 (L19) DMI vendor
  - Enable fine-grained features to device lineup mapping

- wmi: Perform output size check within WMI core to allow simpler WMI
       drivers

- acpi_driver -> platform driver conversions (a large number of changes
  from Rafael J. Wysocki)

- Miscellaneous cleanups / refactoring / improvements

Regards, i.


The following changes since commit fbddf68d7b4e1e6da7a78dd7fbd8ec376536584a:

  platform/x86: ISST: Correct locked bit width (2026-03-24 12:31:10 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.1-1

for you to fetch changes up to 344bf523d441d44c75c429ea6cdcfa8f12efde4d:

  platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77) (2026-04-14 19:00:18 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.1-1

Highlights:

- asus-wmi:
  - Retain battery charge threshold during boot which avoids unsolicited
    change to 100%. Return -ENODATA when the limit is not yet known
  - Improve screenpad power/brightness handling consistency
  - Fix screenpad brightness range

- barco-p50-gpio: Normalize gpio_get return values

- bitland-mifs-wmi: Add driver for Bitland laptops (supports platform
                    profile,hwmon, kbd backlight, gpu mode, hotkeys, and
                    fan boost)

- dell_rbu: Fix using uninitialized value in sysfs write function

- dell-wmi-sysman: Respect destination length when constructing enum
                   strings

- hp-wmi:
  - Propagate fan setting apply failures and log an error
  - Fix sysfs write vs work handler cancel_delayed_work_sync() deadlock
  - Correct keepalive schedule_delayed_work() to mod_delayed_work()
  - Fix u8 underflows in GPU delta calculation
  - Use mutex to protect fan pwm/mode
  - Ignore kbd backlight and FnLock key events that are handled by FW
  - Fix fan table parsing (use correct field)
  - Add support for Omen 14-fb0xxx, 16-n0xxx, 16-wf1xxx, and Omen MAX
    16-ak0xxxx

- input: trackpoint & thinkpad_acpi: Enable doubletap by default and
                                     add sysfs enable/disable

- int3472: Add support for GPIO type 0x02 (IR flood LED)

- intel-speed-select: (updated to v1.26)
  - Avoid using current base frequency as maximum
  - Fix CPU extended family ID decoding
  - Fix exit code
  - Improve error reporting

- intel/vsec: Refactor to support ACPI-enumerated PMT endpoints.

- pcengines-apuv2: Attach software node to the gpiochip

- uniwill:
  - Refactor hwmon to smaller parts to accomodate HW diversity
  - Support USB-C power/performance priority switch through sysfs
  - Add another XMG Fusion 15 (L19) DMI vendor
  - Enable fine-grained features to device lineup mapping

- wmi: Perform output size check within WMI core to allow simpler WMI
       drivers

- acpi_driver -> platform driver conversions (a large number of changes
  from Rafael J. Wysocki)

- Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

acer-wireless:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

asus-laptop:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

asus-wireless:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

asus-wmi:
 -  adjust screenpad power/brightness handling
 -  do not enforce a battery charge threshold
 -  fix screenpad brightness range

barco-p50-gpio:
 -  convert to guard() notation
 -  normalize return value of gpio_get

bitland-mifs-wmi:
 -  Add new Bitland MIFS WMI driver

dell/dell-rbtn:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

dell_rbu:
 -  avoid uninit value usage in packet_size_write()

dell-wmi-sysman:
 -  bound enumeration string aggregation
 -  Clean up security buffer helpers
 -  Fix typo in function comment
 -  Use standard kobj_sysfs_ops
 -  Use sysfs_emit{_at} in show functions

Documentation: laptops:
 -  Update documentation for uniwill laptops

Documentation:
 -  thinkpad-acpi - Document doubletap_enable attribute

eeepc-laptop:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

fujitsu:
 -  Convert backlight driver to a platform one
 -  Convert laptop driver to a platform one
 -  Register ACPI notify handlers directly
 -  Reorder code to avoid forward declarations

fujitsu-tablet:
 -  Convert ACPI driver to a platform one

hp-wmi:
 -  add locking for concurrent hwmon access
 -  add Omen 14-fb0xxx (board 8C58) support
 -  Add support for Omen 16-n0xxx (8A44)
 -  Add support for Omen 16-wf1xxx (8C77)
 -  Add support for OMEN MAX 16-ak0xxx (8D87)
 -  avoid cancel_delayed_work_sync from work handler
 -  fix fan table parsing
 -  fix ignored return values in fan settings
 -  fix u8 underflow in gpu_delta calculation
 -  Ignore backlight and FnLock events
 -  use mod_delayed_work to reset keep-alive timer

input:
 -  trackpoint - Enable doubletap by default on capable devices

int3472:
 -  Add support for GPIO type 0x02 (IR flood LED)
 -  Parameterize LED con_id in registration
 -  Rename pled to led in LED registration code
 -  Use local variable for LED struct access

intel/rst:
 -  Convert ACPI driver to a platform one

intel/smartconnect:
 -  Convert ACPI driver to a platform one

intel/tpmi:
 -  Use 32 bit aligned address for debugfs mem write

intel/vsec:
 -  Decouple add/link helpers from PCI
 -  Make driver_data info const
 -  Plumb ACPI PMT discovery tables through vsec
 -  Refactor base_addr handling
 -  Return real error codes from registration path
 -  Switch exported helpers from pci_dev to device

lg-laptop:
 -  Convert ACPI driver to a platform one
 -  Drop debug-only ACPI notify handler

nvsw-sn2201:
 -  Drop unused include

panasonic-laptop:
 -  Convert ACPI driver to a platform one
 -  Fix OPTD notifier registration and cleanup
 -  Make pcc_register_optd_notifier() void
 -  Register ACPI notify handler directly
 -  Remove redundant checks from 3 functions

pcengines-apuv2:
 -  attach software node to the gpiochip

sony-laptop:
 -  Convert NC driver to a platform one
 -  Convert PIC driver to a platform one
 -  Register ACPI notify handler directly

surface: hotplug:
 -  Correct inclusion for GPIO APIs

surface: surfacepro3_button:
 -  Convert to a platform driver
 -  Drop wakeup source on remove
 -  Register ACPI notify handler

system76:
 -  Convert ACPI driver to a platform one
 -  Drop redundant devm_led_classdev_unregister()
 -  Register ACPI notify handler directly

thinkpad_acpi:
 -  Add sysfs control for TrackPoint double-tap
 -  Drop ACPI driver registration
 -  remove obsolete TODO comment
 -  use seq_puts() instead of seq_printf()

tools/power/x86/intel-speed-select:
 -  Avoid current base freq as maximum
 -  Fix cpu extended family ID decoding
 -  Fix output when running on unsupported CLX platforms
 -  Fix some program return value
 -  Print Version info when Incompatible API version is detected
 -  v1.26 release

topstar-laptop:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

toshiba_acpi:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly
 -  Reorder code to avoid forward declaration

toshiba_bluetooth:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

toshiba_haps:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

uniwill-laptop:
 -  Apply features across all TUXEDO devices
 -  Fix signedness bug
 -  Fix XMG Fusion 15 (L19) entries
 -  Implement USB-C power priority setting
 -  Rework hwmon feature defines

wireless-hotkey:
 -  Convert ACPI driver to a platform one
 -  Register ACPI notify handler directly

wmi:
 -  Add wmidev_invoke_procedure()
 -  Convert drivers to use wmidev_invoke_procedure()
 -  Extend wmidev_invoke_method() to reject undersized data
 -  Extend wmidev_query_block() to reject undersized data
 -  Prepare to reject undersized unmarshalling results
 -  Replace .no_notify_data with .min_event_size

x86:
 -  remove unnecessary module_init/exit() functions

Merges:
 -  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into review-ilpo-next
 -  Merge tag 'fixes' into 'for-next'

----------------------------------------------------------------
Andy Shevchenko (2):
      platform/surface: hotplug: Correct inclusion for GPIO APIs
      platform/mellanox: nvsw-sn2201: Drop unused include

Armin Wolf (7):
      platform/x86: uniwill-laptop: Rework hwmon feature defines
      platform/wmi: Add wmidev_invoke_procedure()
      platform/wmi: Convert drivers to use wmidev_invoke_procedure()
      platform/wmi: Prepare to reject undersized unmarshalling results
      platform/wmi: Extend wmidev_invoke_method() to reject undersized data
      platform/wmi: Extend wmidev_query_block() to reject undersized data
      platform/wmi: Replace .no_notify_data with .min_event_size

Coby McKinney (1):
      platform/x86: thinkpad_acpi: use seq_puts() instead of seq_printf()

Daniil Bulgar (1):
      platform/x86: thinkpad_acpi: remove obsolete TODO comment

David E. Box (6):
      platform/x86/intel/vsec: Refactor base_addr handling
      platform/x86/intel/vsec: Make driver_data info const
      platform/x86/intel/vsec: Decouple add/link helpers from PCI
      platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
      platform/x86/intel/vsec: Return real error codes from registration path
      platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

Denis Benato (3):
      platform/x86: asus-wmi: do not enforce a battery charge threshold
      platform/x86: asus-wmi: adjust screenpad power/brightness handling
      platform/x86: asus-wmi: fix screenpad brightness range

Dmitry Torokhov (3):
      platform/x86: pcengines-apuv2: attach software node to the gpiochip
      platform/x86: barco-p50-gpio: normalize return value of gpio_get
      platform/x86: barco-p50-gpio: convert to guard() notation

Emre Cecanpunar (5):
      platform/x86: hp-wmi: fix ignored return values in fan settings
      platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
      platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
      platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
      platform/x86: hp-wmi: add locking for concurrent hwmon access

Ethan Nelson-Moore (1):
      platform: x86: remove unnecessary module_init/exit() functions

Ethan Tidmore (1):
      platform/x86: uniwill-laptop: Fix signedness bug

Fedor Pchelkin (1):
      platform/x86: dell_rbu: avoid uninit value usage in packet_size_write()

Ilpo Järvinen (2):
      Merge tag 'fixes' into 'for-next'
      Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into review-ilpo-next

Krishna Chomal (5):
      platform/x86: hp-wmi: Ignore backlight and FnLock events
      platform/x86: hp-wmi: fix fan table parsing
      platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
      platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
      platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)

Marco Nenciarini (4):
      platform/x86: int3472: Use local variable for LED struct access
      platform/x86: int3472: Rename pled to led in LED registration code
      platform/x86: int3472: Parameterize LED con_id in registration
      platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)

Mingyou Chen (1):
      platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver

Pengpeng Hou (1):
      platform/x86: dell-wmi-sysman: bound enumeration string aggregation

Rafael J. Wysocki (45):
      platform/x86: acer-wireless: Register ACPI notify handler directly
      platform/x86: acer-wireless: Convert ACPI driver to a platform one
      platform/x86: eeepc-laptop: Register ACPI notify handler directly
      platform/x86: eeepc-laptop: Convert ACPI driver to a platform one
      platform/x86: intel/rst: Convert ACPI driver to a platform one
      platform/x86: intel/smartconnect: Convert ACPI driver to a platform one
      platform/surface: surfacepro3_button: Drop wakeup source on remove
      platform/surface: surfacepro3_button: Register ACPI notify handler
      platform/surface: surfacepro3_button: Convert to a platform driver
      platform/x86: lg-laptop: Drop debug-only ACPI notify handler
      platform/x86: lg-laptop: Convert ACPI driver to a platform one
      platform/x86: sony-laptop: Register ACPI notify handler directly
      platform/x86: sony-laptop: Convert NC driver to a platform one
      platform/x86: sony-laptop: Convert PIC driver to a platform one
      platform/x86: topstar-laptop: Register ACPI notify handler directly
      platform/x86: topstar-laptop: Convert ACPI driver to a platform one
      platform/x86: wireless-hotkey: Register ACPI notify handler directly
      platform/x86: wireless-hotkey: Convert ACPI driver to a platform one
      platform/x86: fujitsu-tablet: Convert ACPI driver to a platform one
      platform/x86: fujitsu: Reorder code to avoid forward declarations
      platform/x86: fujitsu: Register ACPI notify handlers directly
      platform/x86: fujitsu: Convert backlight driver to a platform one
      platform/x86: fujitsu: Convert laptop driver to a platform one
      platform/x86: panasonic-laptop: Make pcc_register_optd_notifier() void
      platform/x86: panasonic-laptop: Fix OPTD notifier registration and cleanup
      platform/x86: panasonic-laptop: Remove redundant checks from 3 functions
      platform/x86: panasonic-laptop: Register ACPI notify handler directly
      platform/x86: panasonic-laptop: Convert ACPI driver to a platform one
      platform/x86: system76: Drop redundant devm_led_classdev_unregister()
      platform/x86: system76: Register ACPI notify handler directly
      platform/x86: system76: Convert ACPI driver to a platform one
      platform/x86: dell/dell-rbtn: Register ACPI notify handler directly
      platform/x86: dell/dell-rbtn: Convert ACPI driver to a platform one
      platform/x86: toshiba_acpi: Reorder code to avoid forward declaration
      platform/x86: toshiba_acpi: Register ACPI notify handler directly
      platform/x86: toshiba_acpi: Convert ACPI driver to a platform one
      platform/x86: toshiba_bluetooth: Register ACPI notify handler directly
      platform/x86: toshiba_bluetooth: Convert ACPI driver to a platform one
      platform/x86: toshiba_haps: Register ACPI notify handler directly
      platform/x86: toshiba_haps: Convert ACPI driver to a platform one
      platform/x86: asus-laptop: Register ACPI notify handler directly
      platform/x86: asus-laptop: Convert ACPI driver to a platform one
      platform/x86: asus-wireless: Register ACPI notify handler directly
      platform/x86: asus-wireless: Convert ACPI driver to a platform one
      platform/x86: thinkpad_acpi: Drop ACPI driver registration

Shaun Varghese (1):
      platform/x86: hp-wmi: add Omen 14-fb0xxx (board 8C58) support

Srinivas Pandruvada (3):
      platform/x86/intel/tpmi: Use 32 bit aligned address for debugfs mem write
      tools/power/x86/intel-speed-select: Avoid current base freq as maximum
      tools/power/x86/intel-speed-select: v1.26 release

Thomas Weißschuh (1):
      platform/x86: dell-wmi-sysman: Use standard kobj_sysfs_ops

Thorsten Blum (3):
      platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in show functions
      platform/x86: dell-wmi-sysman: Clean up security buffer helpers
      platform/x86: dell-wmi-sysman: Fix typo in function comment

Vishnu Sankar (3):
      input: trackpoint - Enable doubletap by default on capable devices
      platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
      Documentation: thinkpad-acpi - Document doubletap_enable attribute

Werner Sembach (4):
      platform/x86: uniwill-laptop: Implement USB-C power priority setting
      platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
      platform/x86: uniwill-laptop: Apply features across all TUXEDO devices
      Documentation: laptops: Update documentation for uniwill laptops

Zhang Rui (4):
      tools/power/x86/intel-speed-select: Fix cpu extended family ID decoding
      tools/power/x86/intel-speed-select: Fix some program return value
      tools/power/x86/intel-speed-select: Print Version info when Incompatible API version is detected
      tools/power/x86/intel-speed-select: Fix output when running on unsupported CLX platforms

 .../ABI/testing/sysfs-driver-uniwill-laptop        |  27 +
 .../admin-guide/laptops/thinkpad-acpi.rst          |  21 +
 .../admin-guide/laptops/uniwill-laptop.rst         |  12 +
 Documentation/wmi/devices/bitland-mifs-wmi.rst     | 207 +++++
 Documentation/wmi/driver-development-guide.rst     |  11 +-
 drivers/gpu/drm/xe/xe_debugfs.c                    |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                      |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                       |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                       |   4 +-
 drivers/input/mouse/trackpoint.c                   |  46 ++
 drivers/input/mouse/trackpoint.h                   |   5 +
 drivers/platform/mellanox/nvsw-sn2201.c            |   1 -
 drivers/platform/surface/surface_hotplug.c         |   2 +-
 drivers/platform/surface/surfacepro3_button.c      |  71 +-
 drivers/platform/wmi/core.c                        |  89 ++-
 drivers/platform/wmi/internal.h                    |   3 +-
 drivers/platform/wmi/marshalling.c                 |   6 +-
 drivers/platform/wmi/tests/marshalling_kunit.c     |  24 +-
 drivers/platform/x86/Kconfig                       |  18 +
 drivers/platform/x86/Makefile                      |   1 +
 drivers/platform/x86/acer-wireless.c               |  48 +-
 drivers/platform/x86/asus-laptop.c                 |  44 +-
 drivers/platform/x86/asus-wireless.c               |  55 +-
 drivers/platform/x86/asus-wmi.c                    |  77 +-
 drivers/platform/x86/barco-p50-gpio.c              |  23 +-
 drivers/platform/x86/bitland-mifs-wmi.c            | 837 +++++++++++++++++++++
 drivers/platform/x86/dell/dell-rbtn.c              | 142 ++--
 drivers/platform/x86/dell/dell-wmi-base.c          |   1 +
 .../x86/dell/dell-wmi-sysman/dell-wmi-sysman.h     |   4 +-
 .../x86/dell/dell-wmi-sysman/enum-attributes.c     |  34 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c |  68 +-
 drivers/platform/x86/dell/dell_rbu.c               |   6 +-
 drivers/platform/x86/eeepc-laptop.c                |  45 +-
 drivers/platform/x86/fujitsu-laptop.c              | 489 ++++++------
 drivers/platform/x86/fujitsu-tablet.c              |  30 +-
 drivers/platform/x86/hp/hp-wmi.c                   | 125 ++-
 drivers/platform/x86/intel/int3472/discrete.c      |  13 +-
 drivers/platform/x86/intel/int3472/led.c           |  55 +-
 drivers/platform/x86/intel/pmc/core.c              |   4 +-
 drivers/platform/x86/intel/pmc/ssram_telemetry.c   |   2 +-
 drivers/platform/x86/intel/pmt/class.c             |   8 +-
 drivers/platform/x86/intel/pmt/class.h             |   5 +-
 drivers/platform/x86/intel/pmt/discovery.c         |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c         |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h         |  12 +-
 drivers/platform/x86/intel/rst.c                   |  23 +-
 drivers/platform/x86/intel/sdsi.c                  |   5 +-
 drivers/platform/x86/intel/smartconnect.c          |  23 +-
 drivers/platform/x86/intel/vsec.c                  | 121 +--
 drivers/platform/x86/intel/vsec_tpmi.c             |  12 +-
 drivers/platform/x86/intel/wmi/sbl-fw-update.c     |   7 +-
 drivers/platform/x86/intel/wmi/thunderbolt.c       |   2 +-
 drivers/platform/x86/lenovo/ideapad-laptop.c       |   1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c        | 193 ++---
 drivers/platform/x86/lenovo/wmi-camera.c           |   1 +
 drivers/platform/x86/lenovo/wmi-events.c           |   1 +
 drivers/platform/x86/lenovo/ymc.c                  |   1 +
 drivers/platform/x86/lenovo/yogabook.c             |   2 +-
 drivers/platform/x86/lg-laptop.c                   |  51 +-
 drivers/platform/x86/mxm-wmi.c                     |  12 -
 drivers/platform/x86/panasonic-laptop.c            |  79 +-
 drivers/platform/x86/pcengines-apuv2.c             |   3 +-
 drivers/platform/x86/redmi-wmi.c                   |   1 +
 drivers/platform/x86/sony-laptop.c                 | 122 +--
 drivers/platform/x86/system76_acpi.c               |  63 +-
 drivers/platform/x86/topstar-laptop.c              |  43 +-
 drivers/platform/x86/toshiba_acpi.c                | 182 +++--
 drivers/platform/x86/toshiba_bluetooth.c           |  74 +-
 drivers/platform/x86/toshiba_haps.c                |  57 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c        | 440 +++++++++--
 drivers/platform/x86/uniwill/uniwill-wmi.c         |   1 +
 drivers/platform/x86/wireless-hotkey.c             |  49 +-
 drivers/platform/x86/wmi-bmof.c                    |   2 +-
 drivers/platform/x86/xiaomi-wmi.c                  |   1 +
 include/linux/intel_vsec.h                         |  39 +-
 include/linux/platform_data/x86/int3472.h          |  12 +-
 include/linux/wmi.h                                |  15 +-
 tools/power/x86/intel-speed-select/isst-config.c   |  41 +-
 78 files changed, 3073 insertions(+), 1309 deletions(-)
 create mode 100644 Documentation/wmi/devices/bitland-mifs-wmi.rst
 create mode 100644 drivers/platform/x86/bitland-mifs-wmi.c
