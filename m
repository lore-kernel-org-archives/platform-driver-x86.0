Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C61E4A6;
	Thu, 23 Jan 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641107; cv=none; b=lkrUU/in+HbURA52BjzE0R+/rAhAGlzfY4e6BFNDOOBOQllmLKX/98lCWr3S+Bwnu8il7iBpLeN8p51QthEUzroTaOIqEExPeHpeux6J7hbvZK8ikSRoNhZRPiUpzoxilGeJW2bTYiuGA1eim7ykYevNqn0CKkNUPU7yYLlih9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641107; c=relaxed/simple;
	bh=AuYW47RejVm7PoNFv9gz4Hk7fsSz9iyrzsjEvIOJdK0=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=N1Ou+sOiSJRI7U2J6ckDCGqIHNfZ0L++Ho9iwAAlK4nGVKr0KHoPRCH/uoTEvXcKVzYgr51/p082wwjafpnnlPDlzei+JOUcunZdhyi9Y1tZNzPHtGBww5anYjtN28H8d0x4jFUU8QWLsFvQ2X2R/Wp8blkO64zqvgRmNqG1+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFPzKNod; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFPzKNod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737641105; x=1769177105;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AuYW47RejVm7PoNFv9gz4Hk7fsSz9iyrzsjEvIOJdK0=;
  b=NFPzKNodoi0CwSMCx8IXdGm/sQmq5UlzFewJW/Xr0KoOmas83ek6uPhR
   FMwxxUK6w6LI5rj/JwWy757wxxBmo9enHsyeR/ypoQlG5Yv1SPa8pq2tA
   h0FhSbyMraTS9fHPUeJZ3upV/GfrBHJVwYnWHPfE7hzMgJiwadcnPbtQc
   t9VfRu34Ux822gw46GmoKy08q7dX+Z0IOcAeh2NQ7F7CCXMeTOgUepNuL
   a0Cz7vwt7UCSP2PxsMkr14640ebdwwsNoduDwcX05TzyAv6wrlV+rYrKe
   pFJEO0zf+H8fLGWmb54EKfR3YgtyftoFqlzEV2Hn3Rp2boKxcsJjxBj22
   g==;
X-CSE-ConnectionGUID: gh0ata2FRUahvz5S9/DOKA==
X-CSE-MsgGUID: tsXt0dzbQNa2tIBkPbYyNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38304915"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="38304915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 06:05:04 -0800
X-CSE-ConnectionGUID: 1tTnH8dhQOi2j/LY6WzwUg==
X-CSE-MsgGUID: jxEQLIFnRouqkWKIK50p1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107279635"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 06:05:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 23 Jan 2025 15:24:54 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.14-1
Message-ID: <pdx86-pr-20250123152454-321957424@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v6.14. Instead of basing on -rc1 I usually do,
I merged the few symbol import NS and .remove_new changes in early to avoid
running afoul with them during the cycle (I hopefully managed to exclude
their visibility from this PR).

There are a few cross-subsystem changes, many for ACPI/platform_profile due
major refactoring, a few input and HID changes that support pdx86 driver
changes, and move of SMO88xx quirk code from i2c to pdx86.

The SMO88xx i2c->pdx86 move change

  cc0809b752c7 ("platform/x86: dell-smo8800: Move instantiation of
                lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d")

is expected to trigger a conflict with the simple ID addition in the
commit

  fd4e93083129 ("i2c: i801: Add lis3lv02d for Dell Precision M6800").


Highlights:

 - acer-wmi:

	- Add support for PH14-51, PH16-72, and Nitro AN515-58

	- Add proper hwmon support

	- Improve error handling when reading "gaming system info"

	- Replace direct EC reads for the current platform profile
	  with WMI calls to handle EC address variations

	- Replace custom platform_profile cycling with the generic one

 - ACPI: platform_profile: Major refactoring and improvements

	- Support registering multiple platform_profile handlers
	  concurrently to avoid the need to quirk which handler takes
	  precedence

	- Support reporting "custom" profile for cases where the current
	  profile is ambiguous or when settings tweaks are done outside
	  the pre-defined profile

	- Abstract and layer platform_profile API better using the
	  class_dev and drvdata

	- Various minor improvements

	- Add Documentation and kerneldoc

 - amd/hsmp: Add support for HSMP protocol v7

 - amd/pmc:

	- Support AMD 1Ah family 70h

	- Support STB with Ryzen desktop SoCs

 - amd/pmf:

	- Support Custom BIOS inputs for PMF TA

	- Support passing SRA sensor data from AMD SFH (HID) to PMF TA

 - dell-smo8800:

	- Move SMO88xx quirk away from the generic i2c-i801 driver

	- Add accelerometer support for Dell Latitude E6330/E6430 and
	  XPS 9550

	- Support probing accelerometer for models yet to be listed in
	  the DMI mapping table because ACPI lacks i2c-address for the
	  accelerometer (behind a module parameter because probing might
	  be dangerous)

 - HID: amd_sfh: Add support for exporting SRA sensor data

 - hp-wmi: Add fan and thermal support for Victus 16-s1000

 - input: Add key for phone linking

 - input: i8042: Add context for the i8042 filter to enable cleaning up
   the filter related global variables from pdx86 drivers

 - lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of
   KEY_CAMERA_ACCESS

 - mellanox: mlxbf-pmc:

	- Add support for monitoring cycle count

	- Add Documentation

 - thinkpad_acpi: Add support for phone link key

 - tools/power/x86/intel-speed-select: Fix Turbo Ratio Limit restore

 - x86-android-tables: Add support for Vexia EDU ATLA 10 Bluetooth and
   EC battery driver

 - Miscellaneous cleanups / refactoring / improvements


Regards, i.



The following changes since commit ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1:

  module: Convert default symbol namespace to string literal (2024-12-03 08:22:25 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.14-1

for you to fetch changes up to 0da9a3f9ac8ada83fa79579455871ec59f11db72:

  Merge branch 'fixes' into 'for-next' (2025-01-21 14:00:38 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.14-1

Highlights:

 - acer-wmi:

	- Add support for PH14-51, PH16-72, and Nitro AN515-58

	- Add proper hwmon support

	- Improve error handling when reading "gaming system info"

	- Replace direct EC reads for the current platform profile
	  with WMI calls to handle EC address variations

	- Replace custom platform_profile cycling with the generic one

 - ACPI: platform_profile: Major refactoring and improvements

	- Support registering multiple platform_profile handlers
	  concurrently to avoid the need to quirk which handler takes
	  precedence

	- Support reporting "custom" profile for cases where the current
	  profile is ambiguous or when settings tweaks are done outside
	  the pre-defined profile

	- Abstract and layer platform_profile API better using the
	  class_dev and drvdata

	- Various minor improvements

	- Add Documentation and kerneldoc

 - amd/hsmp: Add support for HSMP protocol v7

 - amd/pmc:

	- Support AMD 1Ah family 70h

	- Support STB with Ryzen desktop SoCs

 - amd/pmf:

	- Support Custom BIOS inputs for PMF TA

	- Support passing SRA sensor data from AMD SFH (HID) to PMF TA

 - dell-smo8800:

	- Move SMO88xx quirk away from the generic i2c-i801 driver

	- Add accelerometer support for Dell Latitude E6330/E6430 and
	  XPS 9550

	- Support probing accelerometer for models yet to be listed in
	  the DMI mapping table because ACPI lacks i2c-address for the
	  accelerometer (behind a module parameter because probing might
	  be dangerous)

 - HID: amd_sfh: Add support for exporting SRA sensor data

 - hp-wmi: Add fan and thermal support for Victus 16-s1000

 - input: Add key for phone linking

 - input: i8042: Add context for the i8042 filter to enable cleaning up
   the filter related global variables from pdx86 drivers

 - lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of
   KEY_CAMERA_ACCESS

 - mellanox: mlxbf-pmc:

	- Add support for monitoring cycle count

	- Add Documentation

 - thinkpad_acpi: Add support for phone link key

 - tools/power/x86/intel-speed-select: Fix Turbo Ratio Limit restore

 - x86-android-tables: Add support for Vexia EDU ATLA 10 Bluetooth and
   EC battery driver

 - Miscellaneous cleanups / refactoring / improvements

The following is an automated shortlog grouped by driver:

acer-wmi:
 -  add support for Acer Nitro AN515-58
 -  Add support for Acer PH14-51
 -  Add support for Acer Predator PH16-72
 -  Fix initialization of last_non_turbo_profile
 -  Ignore AC events
 -  Implement proper hwmon support
 -  Improve error handling when reading gaming system information
 -  Rename ACER_CAP_FAN_SPEED_READ
 -  simplify platform profile cycling
 -  use an ACPI bitmap to set the platform profile choices
 -  Use devm_platform_profile_register()
 -  use new helper function for setting overclocks
 -  use WMI calls for platform profile handling

ACPI: platform-profile:
 -  Add a name member to handlers

ACPI: platform_profile:
 -  Add a prefix to log messages
 -  Add choices attribute for class interface
 -  Add concept of a "custom" profile
 -  Add device pointer into platform profile handler
 -  Add devm_platform_profile_register()
 -  Add documentation
 -  Add name attribute to class interface
 -  Add `ops` member to handlers
 -  Add platform handler argument to platform_profile_remove()
 -  Add `probe` to platform_profile_ops
 -  Add profile attribute for class interface
 -  Allow multiple handlers
 -  Check all profile handler to calculate next
 -  Clean platform_profile_handler
 -  Create class for ACPI platform profile
 -  Let drivers set drvdata to the class device
 -  Make sure all profile handlers agree on profile
 -  Move matching string for new profile out of mutex
 -  Move platform_profile_handler
 -  Move sanity check out of the mutex
 -  Notify change events on register and unregister
 -  Notify class device from platform_profile_notify()
 -  Only show profiles common for all handlers
 -  Pass the profile handler into platform_profile_notify()
 -  Remove platform_profile_handler from callbacks
 -  Remove platform_profile_handler from exported symbols
 -  Replace *class_dev member with class_dev
 -  Use guard(mutex) for register/unregister
 -  Use `scoped_cond_guard`

alienware_wmi:
 -  General cleanup of WMAX methods

alienware-wmi:
 -  Improve hdmi_mux, amplifier and deepslp group creation
 -  Improve rgb-zones group creation
 -  Modify parse_rgb() signature
 -  Move Lighting Control State
 -  Remove unnecessary check at module exit
 -  Use devm_platform_profile_register()

amd/hsmp:
 -  Add support for HSMP protocol version 7 messages
 -  Constify 'struct bin_attribute'

amd/pmc:
 -  Add STB support for AMD Desktop variants
 -  Define enum for S2D/PMC msg_port and add helper function
 -  Isolate STB code changes to a new file
 -  Move STB block into amd_pmc_s2d_init()
 -  Move STB functionality to a new file for better code organization
 -  Update function names to align with new STB file
 -  Update IP information structure for newer SoCs
 -  Update S2D message id for 1Ah Family 70h model
 -  Use ARRAY_SIZE() to fill num_ips information

amd: pmc:
 -  Use guard(mutex)

amd: pmf:
 -  Drop all quirks

amd/pmf:
 -  Enable Custom BIOS Inputs for PMF-TA
 -  Get SRA sensor data from AMD SFH driver

amd: pmf: sps:
 -  Use devm_platform_profile_register()

amd: pmf:
 -  Switch to guard(mutex)

asus-wmi:
 -  Use devm_platform_profile_register()

dell: dcdbas:
 -  Constify 'struct bin_attribute'

dell: dell-pc:
 -  Create platform device

dell-pc:
 -  Use devm_platform_profile_register()

dell_rbu:
 -  Constify 'struct bin_attribute'

dell-smo8800:
 -  Add a couple more models to lis3lv02d_devices[]
 -  Add support for probing for the accelerometer i2c address
 -  Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
 -  Move SMO88xx acpi_device_ids to dell-smo8800-ids.h

dell-sysman:
 -  Directly use firmware_attributes_class

dell-uart-backlight:
 -  Use blacklight power constant

docs: platform/x86: wmi:
 -  mention tool for invoking WMI methods

Documentation/ABI:
 -  Add document for Mellanox PMC driver
 -  Add new sysfs field to sysfs-platform-mellanox-pmc

Documentation:
 -  Add documentation about class interface for platform profiles

firmware_attributes_class:
 -  Drop lifecycle functions
 -  Move include linux/device/class.h
 -  Simplify API

fujitsu-laptop:
 -  replace strcpy -> strscpy

HID: amd_sfh:
 -  Add support to export device operating states

hp-bioscfg:
 -  Directly use firmware_attributes_class

hp-wmi:
 -  Add fan and thermal profile support for Victus 16-s1000
 -  Use devm_platform_profile_register()

ideapad-laptop:
 -  Use devm_platform_profile_register()

Input:
 -  allocate keycode for phone linking
 -  i8042 - Add support for platform filter contexts

inspur_platform_profile:
 -  Use devm_platform_profile_register()

int3472:
 -  Check for adev == NULL
 -  Debug log the sensor name
 -  Fix skl_int3472_handle_gpio_resources() return value
 -  Make "pin number mismatch" message a debug message

intel: bytcrc_pwrsrc:
 -  fix power_supply dependency
 -  Optionally register a power_supply dev

intel: int0002_vgpio:
 -  Make the irqchip immutable

intel/pmt:
 -  Constify 'struct bin_attribute'

intel: punit_ipc:
 -  Remove unused function

intel/sdsi:
 -  Constify 'struct bin_attribute'

intel/tpmi/plr:
 -  Make char[] longer to silence warning

lenovo-wmi-camera:
 -  Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS

MAINTAINERS:
 -  Change AMD PMC driver status to "Supported"

mlxbf-bootctl:
 -  Constify 'struct bin_attribute'
 -  use sysfs_emit() instead of sprintf()

mlxbf-pmc:
 -  Add support for clock_measure performance block
 -  Add support for monitoring cycle count
 -  incorrect type in assignment

mlxreg-hotplug:
 -  use sysfs_emit() instead of sprintf()

mlxreg-io:
 -  use sysfs_emit() instead of sprintf()

quickstart:
 -  don't include 'pm_wakeup.h' directly

serdev_helpers:
 -  Add get_serdev_controller_from_parent() helper
 -  Check for serial_ctrl_uid == NULL

surface: surface_platform_profile:
 -  Use devm_platform_profile_register()

think-lmi:
 -  Directly use firmware_attributes_class

thinkpad_acpi:
 -  Add support for new phone link hotkey

thinkpad-acpi:
 -  replace strcpy with strscpy

thinkpad_acpi:
 -  Use devm_platform_profile_register()

tools/power/x86/intel-speed-select:
 -  Fix TRL restore after SST-TF disable
 -  v1.21 release

wmi-bmof:
 -  Make use of .bin_size() callback

x86-android-tablets:
 -  Add Bluetooth support for Vexia EDU ATLA 10
 -  Add missing __init to get_i2c_adap_by_*()
 -  Add support for getting serdev-controller by PCI parent
 -  Add Vexia EDU ATLA 10 EC battery driver
 -  Change x86_instantiate_serdev() prototype
 -  make platform data be static
 -  Make variables only used locally static
 -  Store serdev-controller ACPI HID + UID in a union

Merges:
 -  Merge branch 'fixes' into 'for-next'
 -  Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into review-ilpo-next
 -  Merge branch 'platform-drivers-x86-platform-profile' into for-next
 -  Merge branch 'platform-drivers-x86-platform-profile' into for-next
 -  Merge import NS conversion from 'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git' into for-next

----------------------------------------------------------------
Abdul Rahim (1):
      fujitsu-laptop: replace strcpy -> strscpy

Ai Chao (4):
      platform/x86: lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
      platform/mellanox: mlxbf-bootctl: use sysfs_emit() instead of sprintf()
      platform/mellanox: mlxreg-hotplug: use sysfs_emit() instead of sprintf()
      platform/mellanox: mlxreg-io: use sysfs_emit() instead of sprintf()

Armin Wolf (11):
      platform/x86: asus-wmi: Ignore return value when writing thermal policy
      platform/x86: asus-nb-wmi: Ignore unknown event 0xCF
      platform/x86: acer-wmi: Add support for Acer PH14-51
      platform/x86: acer-wmi: Rename ACER_CAP_FAN_SPEED_READ
      platform/x86: acer-wmi: Improve error handling when reading gaming system information
      platform/x86: acer-wmi: Implement proper hwmon support
      platform/x86: wmi-bmof: Make use of .bin_size() callback
      platform/x86: acer-wmi: Add support for Acer Predator PH16-72
      Input: i8042 - Add support for platform filter contexts
      platform/x86: acer-wmi: Ignore AC events
      platform/x86: acer-wmi: Fix initialization of last_non_turbo_profile

Arnd Bergmann (1):
      platform/x86/intel: bytcrc_pwrsrc: fix power_supply dependency

Basavaraj Natikar (1):
      HID: amd_sfh: Add support to export device operating states

Chenyuan Yang (2):
      platform/x86: dell-uart-backlight: fix serdev race
      platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix serdev race

David E. Box (1):
      platform/x86: intel/pmc: Fix ioremap() of bad address

Dr. David Alan Gilbert (1):
      platform/x86: intel: punit_ipc: Remove unused function

Hans de Goede (19):
      platform/x86: x86-android-tablets: Add missing __init to get_i2c_adap_by_*()
      platform/x86: x86-android-tablets: Make variables only used locally static
      platform/x86: serdev_helpers: Check for serial_ctrl_uid == NULL
      platform/x86: serdev_helpers: Add get_serdev_controller_from_parent() helper
      platform/x86: x86-android-tablets: Change x86_instantiate_serdev() prototype
      platform/x86: x86-android-tablets: Store serdev-controller ACPI HID + UID in a union
      platform/x86: x86-android-tablets: Add support for getting serdev-controller by PCI parent
      platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
      platform/x86/intel: bytcrc_pwrsrc: Optionally register a power_supply dev
      platform/x86: x86-android-tablets: Add Vexia EDU ATLA 10 EC battery driver
      platform/x86: intel: int0002_vgpio: Make the irqchip immutable
      platform/x86: int3472: Check for adev == NULL
      platform/x86: int3472: Make "pin number mismatch" message a debug message
      platform/x86: int3472: Fix skl_int3472_handle_gpio_resources() return value
      platform/x86: int3472: Debug log the sensor name
      platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to dell-smo8800-ids.h
      platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
      platform/x86: dell-smo8800: Add a couple more models to lis3lv02d_devices[]
      platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address

Hridesh MG (6):
      docs: platform/x86: wmi: mention tool for invoking WMI methods
      platform/x86: acer-wmi: use WMI calls for platform profile handling
      platform/x86: acer-wmi: use new helper function for setting overclocks
      platform/x86: acer-wmi: simplify platform profile cycling
      platform/x86: acer-wmi: use an ACPI bitmap to set the platform profile choices
      platform/x86: acer-wmi: add support for Acer Nitro AN515-58

Huy Minh (1):
      platform/x86: touchscreen_dmi: Add info for SARY Tab 3 tablet

Illia Ostapyshyn (2):
      Input: allocate keycode for phone linking
      platform/x86: thinkpad_acpi: Add support for new phone link hotkey

Ilpo Järvinen (6):
      Merge import NS conversion from 'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git' into for-next
      Merge branch 'platform-drivers-x86-platform-profile' into for-next
      platform/x86/intel/tpmi/plr: Make char[] longer to silence warning
      Merge branch 'platform-drivers-x86-platform-profile' into for-next
      Merge branch 'intel-sst' of https://github.com/spandruvada/linux-kernel into review-ilpo-next
      Merge branch 'fixes' into 'for-next'

Jithu Joseph (1):
      platform/x86/intel/ifs: Add Clearwater Forest to CPU support list

Joe Hattori (1):
      platform/x86: mlx-platform: call pci_dev_put() to balance the refcount

Julien ROBIN (1):
      platform/x86: hp-wmi: Add fan and thermal profile support for Victus 16-s1000

Kurt Borja (29):
      alienware-wmi: Fix X Series and G Series quirks
      alienware-wmi: Adds support to Alienware m16 R1 AMD
      ACPI: platform_profile: Add devm_platform_profile_register()
      alienware-wmi: Use devm_platform_profile_register()
      platform/x86: alienware-wmi: Remove unnecessary check at module exit
      platform/x86: alienware-wmi: Move Lighting Control State
      platform/x86: alienware-wmi: Modify parse_rgb() signature
      platform/x86: alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
      platform/x86: alienware-wmi: Improve rgb-zones group creation
      platform/x86: alienware_wmi: General cleanup of WMAX methods
      ACPI: platform_profile: Replace *class_dev member with class_dev
      ACPI: platform_profile: Let drivers set drvdata to the class device
      ACPI: platform_profile: Remove platform_profile_handler from callbacks
      ACPI: platform_profile: Add `ops` member to handlers
      ACPI: platform_profile: Add `probe` to platform_profile_ops
      platform/surface: surface_platform_profile: Use devm_platform_profile_register()
      platform/x86: acer-wmi: Use devm_platform_profile_register()
      platform/x86: amd: pmf: sps: Use devm_platform_profile_register()
      platform/x86: asus-wmi: Use devm_platform_profile_register()
      platform/x86: dell-pc: Use devm_platform_profile_register()
      platform/x86: ideapad-laptop: Use devm_platform_profile_register()
      platform/x86: hp-wmi: Use devm_platform_profile_register()
      platform/x86: inspur_platform_profile: Use devm_platform_profile_register()
      platform/x86: thinkpad_acpi: Use devm_platform_profile_register()
      ACPI: platform_profile: Remove platform_profile_handler from exported symbols
      ACPI: platform_profile: Move platform_profile_handler
      ACPI: platform_profile: Clean platform_profile_handler
      ACPI: platform_profile: Add documentation
      ACPI: platform_profile: Add a prefix to log messages

Maciej S. Szmigiero (1):
      platform/x86/amd/pmc: Only disable IRQ1 wakeup where i8042 actually enabled it

Mario Limonciello (24):
      ACPI: platform-profile: Add a name member to handlers
      platform/x86/dell: dell-pc: Create platform device
      ACPI: platform_profile: Add device pointer into platform profile handler
      ACPI: platform_profile: Add platform handler argument to platform_profile_remove()
      ACPI: platform_profile: Pass the profile handler into platform_profile_notify()
      ACPI: platform_profile: Move sanity check out of the mutex
      ACPI: platform_profile: Move matching string for new profile out of mutex
      ACPI: platform_profile: Use guard(mutex) for register/unregister
      ACPI: platform_profile: Use `scoped_cond_guard`
      ACPI: platform_profile: Create class for ACPI platform profile
      ACPI: platform_profile: Add name attribute to class interface
      ACPI: platform_profile: Add choices attribute for class interface
      ACPI: platform_profile: Add profile attribute for class interface
      ACPI: platform_profile: Notify change events on register and unregister
      ACPI: platform_profile: Only show profiles common for all handlers
      ACPI: platform_profile: Add concept of a "custom" profile
      ACPI: platform_profile: Make sure all profile handlers agree on profile
      ACPI: platform_profile: Check all profile handler to calculate next
      ACPI: platform_profile: Notify class device from platform_profile_notify()
      ACPI: platform_profile: Allow multiple handlers
      platform/x86/amd: pmf: Drop all quirks
      Documentation: Add documentation about class interface for platform profiles
      platform/x86/amd: pmc: Use guard(mutex)
      platform/x86/amd: pmf: Switch to guard(mutex)

Mingcong Bai (1):
      platform/x86: hp-wmi: mark 8A15 board for timed OMEN thermal profile

Nitin Joshi (1):
      platform/x86: thinkpad-acpi: replace strcpy with strscpy

Pei Xiao (2):
      platform/mellanox: mlxbf-pmc: incorrect type in assignment
      platform/x86: x86-android-tablets: make platform data be static

Sedat Dilek (1):
      platform/x86: samsung-laptop: Match MODULE_DESCRIPTION() to functionality

Shin'ichiro Kawasaki (4):
      p2sb: Factor out p2sb_read_from_cache()
      p2sb: Introduce the global flag p2sb_hidden_by_bios
      p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
      p2sb: Do not scan and remove the P2SB device when it is unhidden

Shravan Kumar Ramani (4):
      Documentation/ABI: Add document for Mellanox PMC driver
      platform/mellanox: mlxbf-pmc: Add support for monitoring cycle count
      platform/mellanox: mlxbf-pmc: Add support for clock_measure performance block
      Documentation/ABI: Add new sysfs field to sysfs-platform-mellanox-pmc

Shyam Sundar S K (12):
      platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
      platform/x86/amd/pmc: Move STB functionality to a new file for better code organization
      platform/x86/amd/pmc: Update function names to align with new STB file
      platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper function
      platform/x86/amd/pmc: Isolate STB code changes to a new file
      platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
      platform/x86/amd/pmc: Update IP information structure for newer SoCs
      platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
      platform/x86/amd/pmc: Add STB support for AMD Desktop variants
      MAINTAINERS: Change AMD PMC driver status to "Supported"
      platform/x86/amd/pmf: Enable Custom BIOS Inputs for PMF-TA
      platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver

Srinivas Pandruvada (4):
      tools/power/x86/intel-speed-select: Fix TRL restore after SST-TF disable
      tools/power/x86/intel-speed-select: v1.21 release
      platform/x86/intel: power-domains: Add Clearwater Forest support
      platform/x86: ISST: Add Clearwater Forest to support list

Suma Hegde (1):
      platform/x86/amd/hsmp: Add support for HSMP protocol version 7 messages

Thomas Weißschuh (12):
      platform/x86: dell: dcdbas: Constify 'struct bin_attribute'
      platform/x86: dell_rbu: Constify 'struct bin_attribute'
      platform/x86/intel/sdsi: Constify 'struct bin_attribute'
      platform/x86/intel/pmt: Constify 'struct bin_attribute'
      platform/x86/amd/hsmp: Constify 'struct bin_attribute'
      mlxbf-bootctl: Constify 'struct bin_attribute'
      platform/x86: firmware_attributes_class: Move include linux/device/class.h
      platform/x86: firmware_attributes_class: Simplify API
      platform/x86: think-lmi: Directly use firmware_attributes_class
      platform/x86: hp-bioscfg: Directly use firmware_attributes_class
      platform/x86: dell-sysman: Directly use firmware_attributes_class
      platform/x86: firmware_attributes_class: Drop lifecycle functions

Thomas Zimmermann (1):
      platform/x86: dell-uart-backlight: Use blacklight power constant

Vishnu Sankar (1):
      platform/x86: thinkpad-acpi: Add support for hotkey 0x1401

Wolfram Sang (1):
      platform/x86: quickstart: don't include 'pm_wakeup.h' directly

Xi Pardee (1):
      platform/x86/intel/vsec: Add support for Panther Lake

 .../ABI/testing/sysfs-class-platform-profile       |  48 ++
 .../ABI/testing/sysfs-platform-mellanox-pmc        |  64 ++
 Documentation/ABI/testing/sysfs-platform_profile   |   5 +
 .../admin-guide/laptops/thinkpad-acpi.rst          |  10 +-
 .../userspace-api/sysfs-platform_profile.rst       |  38 ++
 Documentation/wmi/driver-development-guide.rst     |   4 +
 MAINTAINERS                                        |   2 +-
 arch/x86/include/asm/intel_punit_ipc.h             |   7 -
 arch/x86/include/uapi/asm/amd_hsmp.h               |  64 +-
 drivers/acpi/platform_profile.c                    | 647 +++++++++++++++++----
 drivers/hid/amd-sfh-hid/amd_sfh_common.h           |   1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c      |  22 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c |  38 ++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h |  24 +-
 drivers/i2c/busses/i2c-i801.c                      | 124 ----
 drivers/input/misc/ideapad_slidebar.c              |   4 +-
 drivers/input/serio/i8042.c                        |  17 +-
 drivers/platform/mellanox/mlxbf-bootctl.c          |  20 +-
 drivers/platform/mellanox/mlxbf-pmc.c              | 113 +++-
 drivers/platform/mellanox/mlxreg-hotplug.c         |   2 +-
 drivers/platform/mellanox/mlxreg-io.c              |   2 +-
 .../platform/surface/surface_platform_profile.c    |  44 +-
 drivers/platform/x86/acer-wmi.c                    | 550 ++++++++++++------
 drivers/platform/x86/amd/hsmp/acpi.c               |  12 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               |  47 +-
 drivers/platform/x86/amd/hsmp/plat.c               |  12 +-
 drivers/platform/x86/amd/pmc/Makefile              |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c             | 332 +++++++++++
 drivers/platform/x86/amd/pmc/pmc.c                 | 399 +++----------
 drivers/platform/x86/amd/pmc/pmc.h                 |  24 +-
 drivers/platform/x86/amd/pmf/Makefile              |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c                |  30 +-
 drivers/platform/x86/amd/pmf/core.c                |  20 +-
 drivers/platform/x86/amd/pmf/pmf-quirks.c          |  66 ---
 drivers/platform/x86/amd/pmf/pmf.h                 |  39 +-
 drivers/platform/x86/amd/pmf/spc.c                 |  75 +++
 drivers/platform/x86/amd/pmf/sps.c                 |  49 +-
 drivers/platform/x86/asus-nb-wmi.c                 |   4 +-
 drivers/platform/x86/asus-wmi.c                    |  66 +--
 drivers/platform/x86/asus-wmi.h                    |   3 +-
 drivers/platform/x86/dell/Kconfig                  |   1 +
 drivers/platform/x86/dell/Makefile                 |   1 +
 drivers/platform/x86/dell/alienware-wmi.c          | 544 +++++++++--------
 drivers/platform/x86/dell/dcdbas.c                 |  10 +-
 drivers/platform/x86/dell/dcdbas.h                 |   8 -
 drivers/platform/x86/dell/dell-laptop.c            |   6 +-
 drivers/platform/x86/dell/dell-lis3lv02d.c         | 255 ++++++++
 drivers/platform/x86/dell/dell-pc.c                |  69 ++-
 drivers/platform/x86/dell/dell-smo8800-ids.h       |  27 +
 drivers/platform/x86/dell/dell-smo8800.c           |  16 +-
 drivers/platform/x86/dell/dell-uart-backlight.c    |   7 +-
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c |  17 +-
 drivers/platform/x86/dell/dell_rbu.c               |  20 +-
 drivers/platform/x86/firmware_attributes_class.c   |  42 +-
 drivers/platform/x86/firmware_attributes_class.h   |   5 +-
 drivers/platform/x86/fujitsu-laptop.c              |   8 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |  14 +-
 drivers/platform/x86/hp/hp-wmi.c                   | 453 +++++++++++++--
 drivers/platform/x86/hp/hp_accel.c                 |   4 +-
 drivers/platform/x86/ideapad-laptop.c              |  43 +-
 drivers/platform/x86/inspur_platform_profile.c     |  43 +-
 drivers/platform/x86/intel/Kconfig                 |   1 +
 drivers/platform/x86/intel/bytcrc_pwrsrc.c         |  79 ++-
 drivers/platform/x86/intel/ifs/core.c              |   1 +
 drivers/platform/x86/intel/int0002_vgpio.c         |  14 +-
 drivers/platform/x86/intel/int3472/common.c        |   2 +
 drivers/platform/x86/intel/int3472/discrete.c      |  24 +-
 drivers/platform/x86/intel/int3472/tps68470.c      |   3 +
 drivers/platform/x86/intel/plr_tpmi.c              |   2 +-
 drivers/platform/x86/intel/pmc/core_ssram.c        |   4 +
 drivers/platform/x86/intel/pmt/class.c             |   4 +-
 drivers/platform/x86/intel/punit_ipc.c             |  33 --
 drivers/platform/x86/intel/sdsi.c                  |  34 +-
 .../x86/intel/speed_select_if/isst_if_common.c     |   1 +
 drivers/platform/x86/intel/tpmi_power_domains.c    |   1 +
 drivers/platform/x86/intel/vsec.c                  |   2 +
 drivers/platform/x86/lenovo-wmi-camera.c           |  69 ++-
 .../x86/lenovo-yoga-tab2-pro-1380-fastcharger.c    |   5 +-
 drivers/platform/x86/mlx-platform.c                |   2 +
 drivers/platform/x86/msi-laptop.c                  |   6 +-
 drivers/platform/x86/p2sb.c                        |  77 ++-
 drivers/platform/x86/panasonic-laptop.c            |   4 +-
 drivers/platform/x86/quickstart.c                  |   1 -
 drivers/platform/x86/samsung-laptop.c              |   2 +-
 drivers/platform/x86/serdev_helpers.h              |  60 +-
 drivers/platform/x86/think-lmi.c                   |  13 +-
 drivers/platform/x86/thinkpad_acpi.c               |  50 +-
 drivers/platform/x86/toshiba_acpi.c                |   4 +-
 drivers/platform/x86/touchscreen_dmi.c             |  26 +
 drivers/platform/x86/wmi-bmof.c                    |  75 +--
 drivers/platform/x86/x86-android-tablets/Makefile  |   2 +-
 drivers/platform/x86/x86-android-tablets/asus.c    |   4 +-
 drivers/platform/x86/x86-android-tablets/core.c    |  31 +-
 drivers/platform/x86/x86-android-tablets/lenovo.c  |   8 +-
 drivers/platform/x86/x86-android-tablets/other.c   |  16 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c      | 261 +++++++++
 .../x86/x86-android-tablets/x86-android-tablets.h  |  13 +-
 include/linux/amd-pmf-io.h                         |  15 +
 include/linux/i8042.h                              |  28 +-
 include/linux/platform_profile.h                   |  33 +-
 include/uapi/linux/input-event-codes.h             |   1 +
 tools/power/x86/intel-speed-select/isst-config.c   |   2 +-
 .../power/x86/intel-speed-select/isst-core-tpmi.c  |   2 +-
 103 files changed, 3922 insertions(+), 1718 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-platform-profile
 create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-pmc
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c
 delete mode 100644 drivers/platform/x86/amd/pmf/pmf-quirks.c
 create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
 create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
 create mode 100644 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
