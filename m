Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F719A2A3;
	Mon, 22 Jun 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153722; cv=none; b=N1mIEG2E+wTOHsxQcrl60ZM8t5rVMjxmC+wkXuBTy8cTCJwvCgpKmnxMjT/ZsdDiud+4fnjFNVyvaoWVU/LLAVPiYB8dpqMS0LxuEp5sueSqpfpFlVz3Vj5LEijBDSjwDr87EEHDQ6zMYGM89q4W4Mjqy92Fp8VhSHe1lugTyHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153722; c=relaxed/simple;
	bh=eQWGY12C+duSW6jQdJ7fh0K8AcajdYHBIjnBzwzjGzk=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=SBwH9rptpFP/+wmB87JxsSr+FR1861e3wJgjmo4CnMvxcFFqbsXeYnvKD85EIQiiCvs54YRr3CEfomPObZcZCd37U+hNRKQ/C5ad3dzjQh5lCT7aK22JDphCZyEq2JBrzw5EEY4WhaafEKbLhsIw2ZPewOMGt7Oht3dVQnDY0qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yhm7vngM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yhm7vngM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782153720; x=1813689720;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eQWGY12C+duSW6jQdJ7fh0K8AcajdYHBIjnBzwzjGzk=;
  b=Yhm7vngMIJqp8SPkLSe2xmEacg6I7EGYnssccYRBuTIVyTXz8ofhMaal
   L3AC1tbUCj33MrZ1JUH8X/oJoarBR2z9z9rIjcMq+5RYw7/vSctWiVPhW
   vhWfTmNlWyuU0UNc0VwAzECzFqUXINmUmVIulByzepaIEF8rgY1INkrvW
   hF00rX7IZG9KeHTe98GXVUhEv/Nazf+Z0Q/fmVk2TFCnowM4KOCHaaQBL
   kyzKKIjOjMXJ0G0fQjvOK1vQ7OAH53z9Tqwk3d8ICt/SCmWeGuFFgT2Si
   ItQzTOyXYCEpduMIzS/78XL58ovuVvgBjsEEvnsUgPr+AqHhJ3maoR0ZI
   w==;
X-CSE-ConnectionGUID: M5BggfngRBWDmb34Uv0uDw==
X-CSE-MsgGUID: cJDpoHYtTda4XByn0RjJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93548653"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93548653"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 11:41:59 -0700
X-CSE-ConnectionGUID: nL6NMFxyRWOKri0GBQZ8GA==
X-CSE-MsgGUID: o4gtC7UBQqm+Rh0xpx18eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273371373"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.126])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 11:41:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Mon, 22 Jun 2026 21:15:10 +0300
Subject: [GIT PULL] platform-drivers-x86 for v7.2-1
Message-ID: <pdx86-pr-20260622211510-2801419545@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v7.2.

Known conflict/incompatibility:

There is going to be a conflict with the commit 3570cb58e317 ("thermal/of:
Pass cdev_id and introduce devm registration helper") and a few other
commits that came from thermal tree effectively resulting in a change in
devm_thermal_of_cooling_device_register() signature. It needs to be
addressed in the merge commit or the build will fail.

Mark's linux-next discovery about the build failure:

  https://lore.kernel.org/all/aibZy5rrdX3ltGpr@sirena.org.uk/


Highlights:

- amd/hfi: Add support for dynamic ranking tables (version 3)

- amd/pmc:
  - Add PMC driver support for AMD 1Ah M80H SoC
  - Delay suspend for some Lenovo Laptops to avoid keyboard and lid
    switch problems after s2idle

- arm64: qcom-hamoa-ec: Add Hamoa/Purwa/Glymur EC driver

- asus-armoury: add support for G614PR, GA402NJ, GA403UM, and FX608JPR

- asus-wmi: add keystone dongle support

- dell-dw5826e: Add reset driver for DW5826e

- dell-laptop: Fix rollback path

- hp-wmi:
  - Add support for Omen 16-ap0xxx (board ID 8D26) and board ID 8B2F

- intel-hid:
  - Add HP ProBook x360 440 G1 5 button array support
  - Prevent racing ACPI notify handlers

- intel/pmc:
  - Add Nova Lake support
  - Rate-limit LTR scale-factor warning

- intel-uncore-freq:
  - Expose instance ID in the sysfs
  - Fix current_freq_khz after CPU hotplug

- intel/vsec: Restore BAR fallback for header walk

- ISST: Restore SST-PP control to all domains

- lenovo-wmi-*:
  - Add more CPU tunable attributes
  - Add GPU tunable attributes
  - Add WMI battery charge limiting

- oxpec: add support for OneXPlayer Super X

- sel3350-platform: Retain LED state on load and unload

- surface: SAM: Add support for Surface Pro 12in

- uniwill-laptop: Add support for battery charge modes

- tools/power/x86/intel-speed-select: Harden daemon pidfile open

- Major refactoring efforts:
  - ACPI driver to platform driver conversion
  - Converting drivers to use the improved WMI API

- Miscellaneous cleanups / refactoring / improvements

Regards, i.


The following changes since commit 654ddf855bebd8d45a6e707f5dc2344921f5e0cf:

  platform/x86: bitland-mifs-wmi: add CONFIG_LEDS_CLASS dependency (2026-05-22 15:48:41 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.2-1

for you to fetch changes up to 50022e56dc89fbf1ec22826edf03dc2e5b9076cc:

  platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery (2026-06-15 02:13:17 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v7.2-1

Highlights:

- amd/hfi: Add support for dynamic ranking tables (version 3)

- amd/pmc:
  - Add PMC driver support for AMD 1Ah M80H SoC
  - Delay suspend for some Lenovo Laptops to avoid keyboard and lid
    switch problems after s2idle

- arm64: qcom-hamoa-ec: Add Hamoa/Purwa/Glymur EC driver

- asus-armoury: add support for G614PR, GA402NJ, GA403UM, and FX608JPR

- asus-wmi: add keystone dongle support

- dell-dw5826e: Add reset driver for DW5826e

- dell-laptop: Fix rollback path

- hp-wmi:
  - Add support for Omen 16-ap0xxx (board ID 8D26) and board ID 8B2F

- intel-hid:
  - Add HP ProBook x360 440 G1 5 button array support
  - Prevent racing ACPI notify handlers

- intel/pmc:
  - Add Nova Lake support
  - Rate-limit LTR scale-factor warning

- intel-uncore-freq:
  - Expose instance ID in the sysfs
  - Fix current_freq_khz after CPU hotplug

- intel/vsec: Restore BAR fallback for header walk

- ISST: Restore SST-PP control to all domains

- lenovo-wmi-*:
  - Add more CPU tunable attributes
  - Add GPU tunable attributes
  - Add WMI battery charge limiting

- oxpec: add support for OneXPlayer Super X

- sel3350-platform: Retain LED state on load and unload

- surface: SAM: Add support for Surface Pro 12in

- uniwill-laptop: Add support for battery charge modes

- tools/power/x86/intel-speed-select: Harden daemon pidfile open

- Major refactoring efforts:
  - ACPI driver to platform driver conversion
  - Converting drivers to use the improved WMI API

- Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

ACPI:
 -  provide acpi_bus_find_device_by_name()

alienware-wmi-base:
 -  Transition to new WMI API

amd: hfi:
 -  Support for ranking table versions

amd/hsmp:
 -  Clamp ioctl/send_message indices (Spectre v1)

amd/pmc:
 -  Add delay_suspend module parameter
 -  Add PMC driver support for AMD 1Ah M80H SoC
 -  Check for intermediate wakeup in function
 -  Delay suspend for some Lenovo Laptops
 -  Don't log during intermediate wakeups
 -  Use per-SoC cpu_info struct for SMU mailbox and IP info

apple-gmux:
 -  Drop unused assignment of pnp_device_id driver data

arm64:
 -  Add driver for EC found on Qualcomm reference devices

arm64: qcom-hamoa-ec:
 -  Fix indentation in comment tables

arm64 Use named initializers for struct i2c_device_id:
 - arm64 Use named initializers for struct i2c_device_id

asus-armoury:
 -  add support for FX608JPR
 -  add support for G614PR
 -  add support for GA402NJ
 -  add support for GA403UM

asus-wmi:
 -  add keystone dongle support

barco-p50-gpio:
 -  attach software node to its target GPIO device

classmate-laptop:
 -  Address memory leaks on driver removal
 -  Convert accel driver to a platform one
 -  Convert ipml driver to a platform one
 -  Convert keys driver to a platform one
 -  Convert tablet driver to a platform one
 -  Convert v4 accel driver to a platform one
 -  Pass struct device pointer to helpers
 -  Register ACPI notify handlers directly
 -  Rename two helper functions
 -  Unify probe rollback and remove code

dell-ddv:
 -  Use new buffer-based WMI API

dell-descriptor:
 -  Use new buffer-based WMI API

dell-dw5826e:
 -  Add reset driver for DW5826e

dell-laptop:
 -  add Inspiron N5110 to touchpad LED quirk table
 -  fix missing cleanups in init error path

dell-privacy:
 -  correct CONFIG_DELL_WMI_PRIVACY macro name in comments
 -  Use new buffer-based WMI API

dell_rbu:
 -  use strscpy in image_type_write

dell-smbios-wmi:
 -  Use new buffer-based WMI API

dell-wmi-base:
 -  Use new buffer-based WMI API

docs:
 -  fix typo in uniwill-laptop.rst

hp-wmi:
 -  Add support for Omen 16-ap0xxx (8D26)
 -  Add support for Omen 16-ap0xxx (8E35)
 -  Add thermal support for board 8B2F

hwmon:
 -  (dell-smm) Use new buffer-based WMI API

intel-hid:
 -  Add HP ProBook x360 440 G1 to button_array_table
 -  Protect ACPI notify handler against recursion

intel/pmc:
 -  Add ACPI PWRM telemetry driver for Nova Lake S
 -  Add Nova Lake support to intel_pmc_core driver
 -  Add NVL PCI IDs for SSRAM telemetry discovery
 -  Add PMC SSRAM Kconfig description
 -  Add support for variable DMU offsets
 -  Enable Pkgc blocking residency counter
 -  Enable PkgC LTR blocking counter
 -  rate-limit LTR scale-factor warning
 -  Retrieve PMC info only for available PMCs

intel/pmc/ssram:
 -  Add ACPI discovery scaffolding
 -  Add PCI platform data
 -  Make PMT registration optional
 -  Refactor DEVID/PWRMBASE extraction into helper
 -  Rename probe and PCI ID table for consistency
 -  Switch to static array with per-index probe state

intel/pmc:
 -  Use __free() in pmc_core_punit_pmt_init()
 -  Use PCI DID for PMC SSRAM device discovery

intel/pmt:
 -  Add pre/post decode hooks around header parsing
 -  Cache the telemetry discovery header

intel/pmt/crashlog:
 -  Split init into pre-decode

intel/pmt:
 -  Pass discovery index instead of resource

intel/pmt/telemetry:
 -  Move overlap check to post-decode hook

intel/pmt:
 -  Unify header fetch and add ACPI source

intel/tpmi:
 -  convert mutex in mem_write() to guard
 -  use cleanup helpers in mem_write()

intel-uncore-freq:
 -  Expose instance ID in the sysfs
 -  Fix current_freq_khz after CPU hotplug
 -  Rename instance_id

intel/vsec:
 -  allocate res with intel_vsec_dev
 -  Restore BAR fallback for header walk

ISST:
 -  Restore SST-PP control to all domains

lenovo-wmi-capdata:
 -  Add debugfs file for dumping capdata

lenovo-wmi-helpers:
 -  Add helper for creating per-device debugfs dir

lenovo-wmi-other:
 -  Add force_load_psy_ext module parameter
 -  Add GPU tunable attributes
 -  Add missing CPU tunable attributes
 -  Add WMI battery charge limiting
 -  Rename LWMI_OM_FW_ATTR_BASE_PATH

meraki-mx100:
 -  use real software node references

modpost:
 -  Handle malformed WMI GUID strings

Move delayed work on system_dfl_wq:
 - Move delayed work on system_dfl_wq

msi-ec:
 -  Add support for MSI Pulse GL66 12th Gen

oxpec:
 -  add support for OneXPlayer Super X

panasonic-laptop:
 -  simplify allocation of sinf

pcengines-apuv2:
 -  reduce indiraction in swnode assignment

pmc_atom:
 -  Use named initializer for pci_device_id array

sel3350-platform:
 -  Retain LED state on load and unload

sonypi:
 -  use strscpy() in sonypi_acpi_probe

surface: SAM:
 -  Add support for Surface Pro 12in

thinkpad_acpi:
 -  Add debugfs entry to display HWDD raw
 -  Remove unneeded goto

tools/power/x86/intel-speed-select:
 -  Harden daemon pidfile open

uniwill-laptop:
 -  Add support for battery charge modes
 -  Enable battery charge modes on supported devices
 -  Mark EC_ADDR_OEM_4 as volatile
 -  Rework FN lock/super key suspend handling

use u8 * for raw byte buffers:
 - use u8 * for raw byte buffers

wmi:
 -  Make sysfs attributes const
 -  Make wmi_bus_class const

x86-android-tablets:
 -  enable fwnode matching of GPIO chips
 -  Use named initializers for struct i2c_device_id

x86/platform/olpc: xo15:
 -  Convert ACPI driver to a platform one
 -  Drop wakeup source on driver removal

xo15-ebook:
 -  Convert ACPI driver to a platform one
 -  Fix formatting of labels
 -  Fix wakeup source and GPE handling
 -  Register ACPI notify handler directly
 -  Use devres-based resource management

Merges:
 -  Merge branch 'fixes' into for-next
 -  Merge branch 'fixes' of into for-next
 -  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into review-ilpo-next

----------------------------------------------------------------
Alexander Egorov (1):
      platform/x86: oxpec: add support for OneXPlayer Super X

Ali Ahmet MEMIS (1):
      tools/power/x86/intel-speed-select: Harden daemon pidfile open

Armin Wolf (12):
      platform/x86: uniwill-laptop: Rework FN lock/super key suspend handling
      platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
      platform/x86: uniwill-laptop: Add support for battery charge modes
      platform/x86: dell-descriptor: Use new buffer-based WMI API
      platform/x86: dell-privacy: Use new buffer-based WMI API
      platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
      platform/x86: dell-wmi-base: Use new buffer-based WMI API
      platform/x86: dell-ddv: Use new buffer-based WMI API
      hwmon: (dell-smm) Use new buffer-based WMI API
      platform/wmi: Make wmi_bus_class const
      platform/wmi: Make sysfs attributes const
      modpost: Handle malformed WMI GUID strings

Bartosz Golaszewski (5):
      platform/x86: meraki-mx100: use real software node references
      platform/x86: barco-p50-gpio: attach software node to its target GPIO device
      platform/x86: pcengines-apuv2: reduce indiraction in swnode assignment
      ACPI: provide acpi_bus_find_device_by_name()
      platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips

Brodie Abrew (1):
      platform/x86: sel3350-platform: Retain LED state on load and unload

Daniel Gibson (4):
      platform/x86/amd/pmc: Check for intermediate wakeup in function
      platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
      platform/x86/amd/pmc: Add delay_suspend module parameter
      platform/x86/amd/pmc: Don't log during intermediate wakeups

Dariusz Figzał (1):
      platform/x86: asus-wmi: add keystone dongle support

David E. Box (16):
      platform/x86/intel/vsec: Restore BAR fallback for header walk
      platform/x86/intel/pmt: Add pre/post decode hooks around header parsing
      platform/x86/intel/pmt/crashlog: Split init into pre-decode
      platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
      platform/x86/intel/pmt: Pass discovery index instead of resource
      platform/x86/intel/pmt: Cache the telemetry discovery header
      platform/x86/intel/pmt: Unify header fetch and add ACPI source
      platform/x86/intel/pmc: Add PMC SSRAM Kconfig description
      platform/x86/intel/pmc: Add ACPI PWRM telemetry driver for Nova Lake S
      platform/x86/intel/pmc/ssram: Rename probe and PCI ID table for consistency
      platform/x86/intel/pmc/ssram: Add PCI platform data
      platform/x86/intel/pmc/ssram: Refactor DEVID/PWRMBASE extraction into helper
      platform/x86/intel/pmc/ssram: Switch to static array with per-index probe state
      platform/x86/intel/pmc/ssram: Add ACPI discovery scaffolding
      platform/x86/intel/pmc/ssram: Make PMT registration optional
      platform/x86/intel/pmc: Add NVL PCI IDs for SSRAM telemetry discovery

Denis Benato (3):
      platform/x86: asus-armoury: add support for GA402NJ
      platform/x86: asus-armoury: add support for GA403UM
      platform/x86: asus-armoury: add support for FX608JPR

Derek J. Clark (5):
      platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
      platform/x86: lenovo-wmi-other: Add GPU tunable attributes
      platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
      platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
      platform/x86: lenovo-wmi-other: Add force_load_psy_ext module parameter

Eduardo Vasconcelos (1):
      platform/x86: thinkpad_acpi: Remove unneeded goto

Ethan Nelson-Moore (1):
      platform/x86: dell-privacy: correct CONFIG_DELL_WMI_PRIVACY macro name in comments

Gleb Sonichev (1):
      platform/x86: dell-laptop: add Inspiron N5110 to touchpad LED quirk table

Guixiong Wei (1):
      platform/x86/intel-uncore-freq: Fix current_freq_khz after CPU hotplug

Haoxiang Li (1):
      platform/x86: dell-laptop: fix missing cleanups in init error path

Harrison Vanderbyl (1):
      platform/surface: SAM: Add support for Surface Pro 12in

HyeongJun An (1):
      platform/x86: intel-hid: Protect ACPI notify handler against recursion

Ilpo Järvinen (3):
      Merge branch 'fixes' of into for-next
      Merge branch 'fixes' into for-next
      Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into review-ilpo-next

Jack Wu (1):
      platform/x86: dell-dw5826e: Add reset driver for DW5826e

Krishna Chomal (2):
      platform/x86: hp-wmi: Add support for Omen 16-ap0xxx (8D26)
      platform/x86: hp-wmi: Add support for Omen 16-ap0xxx (8E35)

Krishnamoorthi M (1):
      platform/x86/amd: hfi: Support for ranking table versions

Kurt Borja (1):
      platform/x86: alienware-wmi-base: Transition to new WMI API

Luis de Carlos (1):
      platform/x86: msi-ec: Add support for MSI Pulse GL66 12th Gen

Maciej Wieczor-Retman (2):
      platform/x86/intel-uncore-freq: Rename instance_id
      platform/x86/intel-uncore-freq: Expose instance ID in the sysfs

Marco Crivellari (1):
      platform/x86: Move delayed work on system_dfl_wq

Marco Scardovi (1):
      platform/x86: asus-armoury: add support for G614PR

Mark Pearson (1):
      platform/x86: thinkpad_acpi: Add debugfs entry to display HWDD raw

Mike Bommarito (1):
      platform/x86/intel/pmc: rate-limit LTR scale-factor warning

Muralidhara M K (1):
      platform/x86/amd/hsmp: Clamp ioctl/send_message indices (Spectre v1)

Nikolay Metchev (1):
      platform/x86: intel-hid: Add HP ProBook x360 440 G1 to button_array_table

Rafael J. Wysocki (17):
      x86/platform/olpc: xo15: Drop wakeup source on driver removal
      x86/platform/olpc: xo15: Convert ACPI driver to a platform one
      platform/x86: xo15-ebook: Fix wakeup source and GPE handling
      platform/x86: xo15-ebook: Fix formatting of labels
      platform/x86: xo15-ebook: Register ACPI notify handler directly
      platform/x86: xo15-ebook: Convert ACPI driver to a platform one
      platform/x86: xo15-ebook: Use devres-based resource management
      platform/x86: classmate-laptop: Address memory leaks on driver removal
      platform/x86: classmate-laptop: Unify probe rollback and remove code
      platform/x86: classmate-laptop: Pass struct device pointer to helpers
      platform/x86: classmate-laptop: Rename two helper functions
      platform/x86: classmate-laptop: Register ACPI notify handlers directly
      platform/x86: classmate-laptop: Convert v4 accel driver to a platform one
      platform/x86: classmate-laptop: Convert accel driver to a platform one
      platform/x86: classmate-laptop: Convert tablet driver to a platform one
      platform/x86: classmate-laptop: Convert ipml driver to a platform one
      platform/x86: classmate-laptop: Convert keys driver to a platform one

Rong Zhang (2):
      platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
      platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata

Rosen Penev (2):
      platform/x86: panasonic-laptop: simplify allocation of sinf
      platform/x86/intel/vsec: allocate res with intel_vsec_dev

Sakurai Shun (1):
      docs: fix typo in uniwill-laptop.rst

Shawn Guo (1):
      platform: arm64: qcom-hamoa-ec: Fix indentation in comment tables

Shyam Sundar S K (2):
      platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and IP info
      platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC

Sibi Sankar (1):
      platform: arm64: Add driver for EC found on Qualcomm reference devices

Srinivas Pandruvada (1):
      platform/x86: ISST: Restore SST-PP control to all domains

Thorsten Blum (3):
      platform/x86: use u8 * for raw byte buffers
      platform/x86: dell_rbu: use strscpy in image_type_write
      sonypi: use strscpy() in sonypi_acpi_probe

Uwe Kleine-König (The Capable Hub) (4):
      platform/x86: pmc_atom: Use named initializer for pci_device_id array
      platform: arm64 Use named initializers for struct i2c_device_id
      platform/x86: x86-android-tablets: Use named initializers for struct i2c_device_id
      platform/x86: apple-gmux: Drop unused assignment of pnp_device_id driver data

Werner Sembach (1):
      platform/x86: uniwill-laptop: Enable battery charge modes on supported devices

Xi Pardee (7):
      platform/x86/intel/pmc: Use __free() in pmc_core_punit_pmt_init()
      platform/x86/intel/pmc: Enable PkgC LTR blocking counter
      platform/x86/intel/pmc: Enable Pkgc blocking residency counter
      platform/x86/intel/pmc: Use PCI DID for PMC SSRAM device discovery
      platform/x86/intel/pmc: Add support for variable DMU offsets
      platform/x86/intel/pmc: Retrieve PMC info only for available PMCs
      platform/x86/intel/pmc: Add Nova Lake support to intel_pmc_core driver

ZhaoJinming (2):
      platform/x86/intel/tpmi: use cleanup helpers in mem_write()
      platform/x86/intel/tpmi: convert mutex in mem_write() to guard

yahia ahmed (1):
      platform/x86: hp-wmi: Add thermal support for board 8B2F

 .../ABI/testing/sysfs-driver-dell-dw5826e-reset    |    9 +
 Documentation/ABI/testing/sysfs-platform-asus-wmi  |    9 +
 .../admin-guide/laptops/uniwill-laptop.rst         |   19 +-
 .../pm/intel_uncore_frequency_scaling.rst          |    7 +
 Documentation/wmi/devices/lenovo-wmi-other.rst     |   19 +
 Documentation/wmi/devices/uniwill-laptop.rst       |    2 +-
 Documentation/wmi/driver-development-guide.rst     |    2 +-
 MAINTAINERS                                        |    8 +
 arch/x86/platform/olpc/olpc-xo15-sci.c             |   33 +-
 drivers/acpi/bus.c                                 |   15 +
 drivers/char/sonypi.c                              |    5 +-
 drivers/hwmon/dell-smm-hwmon.c                     |   49 +-
 drivers/platform/arm64/Kconfig                     |   13 +
 drivers/platform/arm64/Makefile                    |    1 +
 drivers/platform/arm64/acer-aspire1-ec.c           |    2 +-
 drivers/platform/arm64/huawei-gaokun-ec.c          |    2 +-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      |    4 +-
 drivers/platform/arm64/lenovo-yoga-c630.c          |    4 +-
 drivers/platform/arm64/qcom-hamoa-ec.c             |  451 ++++++
 .../platform/surface/surface_aggregator_registry.c |   15 +
 drivers/platform/wmi/core.c                        |   31 +-
 drivers/platform/x86/Kconfig                       |    1 +
 drivers/platform/x86/amd/hfi/hfi.c                 |    6 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               |   24 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |   39 +
 drivers/platform/x86/amd/pmc/pmc.c                 |  326 +++--
 drivers/platform/x86/amd/pmc/pmc.h                 |   74 +-
 drivers/platform/x86/apple-gmux.c                  |    4 +-
 drivers/platform/x86/asus-armoury.h                |  126 ++
 drivers/platform/x86/asus-wmi.c                    |   65 +
 drivers/platform/x86/barco-p50-gpio.c              |   10 +-
 drivers/platform/x86/classmate-laptop.c            |  343 +++--
 drivers/platform/x86/dell/Kconfig                  |    5 +
 drivers/platform/x86/dell/Makefile                 |    1 +
 drivers/platform/x86/dell/alienware-wmi-base.c     |   31 +-
 drivers/platform/x86/dell/dell-dw5826e-reset.c     |   93 ++
 drivers/platform/x86/dell/dell-laptop.c            |   14 +
 drivers/platform/x86/dell/dell-smbios-wmi.c        |   40 +-
 drivers/platform/x86/dell/dell-wmi-base.c          |   60 +-
 drivers/platform/x86/dell/dell-wmi-ddv.c           |  179 ++-
 drivers/platform/x86/dell/dell-wmi-descriptor.c    |  108 +-
 drivers/platform/x86/dell/dell-wmi-privacy.c       |   77 +-
 drivers/platform/x86/dell/dell-wmi-privacy.h       |    4 +-
 .../x86/dell/dell-wmi-sysman/biosattr-interface.c  |    8 +-
 .../x86/dell/dell-wmi-sysman/dell-wmi-sysman.h     |    4 +-
 .../dell/dell-wmi-sysman/passwordattr-interface.c  |    4 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c |    6 +-
 drivers/platform/x86/dell/dell_rbu.c               |    4 +-
 drivers/platform/x86/hp/hp-wmi.c                   |   16 +-
 drivers/platform/x86/intel/hid.c                   |   16 +
 drivers/platform/x86/intel/pmc/Kconfig             |   25 +
 drivers/platform/x86/intel/pmc/Makefile            |    5 +-
 drivers/platform/x86/intel/pmc/arl.c               |   13 +-
 drivers/platform/x86/intel/pmc/core.c              |  140 +-
 drivers/platform/x86/intel/pmc/core.h              |   84 +-
 drivers/platform/x86/intel/pmc/lnl.c               |    6 +-
 drivers/platform/x86/intel/pmc/mtl.c               |    7 +-
 drivers/platform/x86/intel/pmc/nvl.c               | 1539 ++++++++++++++++++++
 drivers/platform/x86/intel/pmc/ptl.c               |    8 +-
 drivers/platform/x86/intel/pmc/pwrm_telemetry.c    |  216 +++
 drivers/platform/x86/intel/pmc/ssram_telemetry.c   |  396 ++++-
 drivers/platform/x86/intel/pmc/wcl.c               |    6 +-
 drivers/platform/x86/intel/pmt/class.c             |  156 +-
 drivers/platform/x86/intel/pmt/class.h             |    6 +
 drivers/platform/x86/intel/pmt/crashlog.c          |   19 +-
 drivers/platform/x86/intel/pmt/telemetry.c         |   34 +-
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |    2 +-
 .../uncore-frequency/uncore-frequency-common.c     |   23 +-
 .../uncore-frequency/uncore-frequency-common.h     |    8 +-
 .../intel/uncore-frequency/uncore-frequency-tpmi.c |   15 +-
 drivers/platform/x86/intel/vsec.c                  |   31 +-
 drivers/platform/x86/intel/vsec_tpmi.c             |   53 +-
 drivers/platform/x86/lenovo/Kconfig                |    2 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c        |   42 +-
 drivers/platform/x86/lenovo/wmi-capdata.c          |  120 ++
 drivers/platform/x86/lenovo/wmi-capdata.h          |   14 +-
 drivers/platform/x86/lenovo/wmi-helpers.c          |   34 +
 drivers/platform/x86/lenovo/wmi-helpers.h          |    2 +
 drivers/platform/x86/lenovo/wmi-other.c            |  617 +++++++-
 drivers/platform/x86/meraki-mx100.c                |   41 +-
 drivers/platform/x86/msi-ec.c                      |    1 +
 drivers/platform/x86/oxpec.c                       |    7 +
 drivers/platform/x86/panasonic-laptop.c            |   19 +-
 drivers/platform/x86/pcengines-apuv2.c             |    2 +-
 drivers/platform/x86/pmc_atom.c                    |    4 +-
 drivers/platform/x86/sel3350-platform.c            |  136 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c        |  432 ++++--
 drivers/platform/x86/uniwill/uniwill-wmi.c         |    5 +-
 drivers/platform/x86/x86-android-tablets/core.c    |   64 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c      |    2 +-
 drivers/platform/x86/xo15-ebook.c                  |   91 +-
 include/linux/acpi.h                               |    7 +
 include/linux/intel_vsec.h                         |   11 +-
 include/linux/platform_data/x86/asus-wmi.h         |    7 +
 scripts/mod/file2alias.c                           |   28 +-
 tools/power/x86/intel-speed-select/isst-daemon.c   |    9 +-
 96 files changed, 5827 insertions(+), 1050 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
 create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
 create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
 create mode 100644 drivers/platform/x86/intel/pmc/nvl.c
 create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c
