Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181589;
	b=0el6Rt/JWCjvw+lErWQO/bsmbOuEppfLMiUu/QuNgX6hKZKGvp/fGRsFH3DF4JVoCKv8
	 zbJk6Qf47fxBGholAN0xHWEgSEX+SoDrb0+WTqNOgg1TbZOVq0aul37+e2LxhECAyKGPJ
	 MiH0kCGxoIUO//KELajdKI4yKSlqW/CeDEIvQm6fSjVOd61sdACWpEswWh0u8WkoXfJRL
	 nH52PPEU43mS8vQzx3UgVB1VJcadxpO0KFiZGhgJF0q4XUTvagBAON6gqFFOdd/gXZlYx
	 p1XeLhSxhS9T7sOr8R+hhZ0ScujujPs7618q894/bA7aTRRgKgrbGeDxEUzQw+HFveQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181589;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Date:
	 Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AB2SMbsYv6i72idDJkgR9Y+SZDlf7ptGQPzHnOi0r/0=;
	b=t0K1lZAzCZBLb1iMDa+L2bGmm7BhW7ZmymNff7R1MFBpRymNUiqMkFGgI2HG/833mo4r
	 d0nY6Clcz9RIR3lGwovZaP4x4XXTbwKK6VNu8ANwQ3ioRIgfPbBeGqBZzpq3FLvih1eD8
	 znjy+l8b9Q/6D3IYq5HDhfU0rsIEmZ6ybfryKAQa/i5ycsOs+5NqVdKDZtBByA9nUWC8P
	 guP+TYWLoXZJeHe0SwjrFm6Kvcd2ETVgQfFfRC5BaoE9dOjgf2+L0Cog/BagAhMGKDkq/
	 RFywUANKUnb75zcuXKh1Fwia+d9lu1Xw54OIFKvN+av2YZ14zZK9nLHZnzhCf1bcyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fh7ECXz9;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AFA606A325;
	Wed, 28 Oct 2026 09:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AFA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fh7ECXz9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793181588; x=1824717588;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mREQ3tT1V02u29jzcimveoBuOuWQvnzfpOY33VgE9oc=;
  b=fh7ECXz9P9aoHKGgIGw/G8VzgakeBZrX70LKD1fR8wGcgh/nBhPPMvz7
   8fin4uYT5IuoHLIJeGTzrj6z3XaaDwoG1Ye0HXh5roBTmz7rQMIijp2Jn
   7n+8p7MQOAxYqKhKvc0QB+cwWsly217Lu/BrQACCPDYK0ZhmgY0UUVUyS
   pU9hb+/sSpWzPPXXIS/yW7DjbGaRihsho6Q9SS3cDZnZf0VwlTRSWbp/v
   hrntS/dhttl4PKLnLtPpd6vrrHn+ZO0wLAYGOnOmIIu+K9U20jBHqCoGn
   w9IAWkw+wkC0BBw7L4oVN5yVva/y2w92koqdBWh13Ywk5wiyi4lTUg/eH
   Q==;
X-CSE-ConnectionGUID: TdGyLjFJSCq8GkQ9tF8pKQ==
X-CSE-MsgGUID: 1GMQsUnWQqGcBx4zha3CXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1790184"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1790184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:59:48 -0700
X-CSE-ConnectionGUID: mAjMC4obRKuYH3Y4fNtoag==
X-CSE-MsgGUID: nynyDHwKRjicjO8kCke5IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4765857"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 02:59:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Date: Wed, 28 Oct 2026 11:34:41 +0200
Subject: [GIT PULL] platform-drivers-x86 for v7.4-1
Message-ID: <pdx86-pr-20261028113441-148823082@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is the main PDx86 PR for v7.4.

The ACPI: video / WMI Kconfig dependency changes spill a bit to GPU side
but the rest is nicely contained where one would expect.

Highlights:

- acer-wmi:
  - Add HWMON support for Aspire A315-58G
  - Add platform profile, HWMON, and fan control support for Nitro
    ANV15-51
  - Add support for mode key on some models (e.g. Nitro AN16-41)

- acer-wmi-battery: Add battery control driver

- ACPI: video: Remove CONFIG_X86 dependency as WMI now supports non-X86
               archs

- alienware-wmi-wmax: Add support for Alienware Area-51 AAT2250

- amd/hsmp: Add support for Family 1Ah client platforms

- amd/pmc:
  - Do not rely on intermediate cycle counting in the wakeup delay logic
  - Make HP Laptop 14-fq1xxxx and Thinkpad L14 Gen3 (21C5) use s2idle
    quirk
  - Make Asus ROG Flow Z13 use spurious_8042 quirk
  - Add support for AMD 1Ah Family DCh SoC

- amd/pmf:
  - Add support for AMDI0112
  - Fix compat ioctl handling

- arm64: asus-glymur-ec: Add support

- arm64: lenovo-yoga-slim7x-gen11-ec: Add support

- arm64: qcom-hamoa-ec: Disable SCI IRQ during suspend

- arm64: thinkpad-t14s-ec: Do not send KEY_KBDILLUMTOGGLE on FN + Space
                           as EC already steps keyboard backlight

- asus-armoury:
  - Add discrete GPU power state attribute
  - Add support for discrete GPU disable on ProArt H7606
  - Support tunables with more models

- asus-nw-wmi: Make ROG Flow X13 GV302X use the tablet-mode switch quirk

- asus-wmi:
  - Make ASUS ProArt PX13 use the tablet-mode switch quirk
  - Add support for mute LED
  - Fix screenpad backlight problems
  - Correct kbd_rgb_state_index description (keyboard -> shutdown)

- ayaneo-ec: Add support for AYANEO 2S

- bitland-mifs-wmi: Correct interpretation of WMI call output

- dell-dw5826e: Add support for _DSM with revision 0 (Slate PTL CS 14,
                Yukon PTL CSLW 14, Yukon PTL 360 14)

- hp-bioscfg: Many fixes

- hp-wmi:
  - Add change control support for HP Spectre x360 16-aa0xxx
  - Do not show any fan attribute when no fans are available
  - Add support for OMEN 16-am0xxx, OMEN 16-am2xxx, OMEN 17-ck1xxx, OMEN
    MAX 16-ah0xxx, OMEN Slim 16t-an000, OMEN Transcend 14-fb1xxx
  - Add HP Laptop 15-fd1xxx support
  - Add Victus 15-fb3xxx, Victus 16-d1xxx (8A26), Victus 16-e0xxx support

- huawei-wmi: Add support for Honor MagicBook camera privacy toggle key

- ideapad-laptop:
  - Add support for Mode key and Phone Link key found on some Yoga Pro
    7 models
  - Add support for camera switch on some Yoga Pro 7 and Legion Pro 7
    models

- intel/hid: Support 5-button array on HP EliteBook x360 1030 G2

- intel/pmc:
  - Add rugged Panther Lake support
  - Fix Nova Lake PCD-S telemetry constants

- intel/pmt:
  - Block mmap when read_telem() callback is present
  - Fix PCI device to device generalization

- intel/speed-select-if: Always enumerate on recent server CPUs
                         (Family 19, i.e., Diamond Rapids and onwards)

- intel/tpmi: Prepare for enumerating non-PCI devices

- intel-uncore-freq:
  - Restore limits properly also on sparse setups
  - Add rugged Panther Lake support

- intel/vsec:
  - Reset state properly before re-enumeration
  - Fix inverted logic in get features function

- lenovo-wmi-capdata: Support non-supported, stubbed WMI query method
                      for capdata device

- msi-ec:
  - Prevent out of bounds charge thresholds
  - Add support for MSI Creator Z16 A11UE, MSI GL65 Leopard 9SCXK,
    MSI Katana 15 B13VFK

- msi-wmi: Ignore key events for keys already handled by atkbd

- oxpec:
  - Add support for charge limit on OneXPlayer Apex
  - Add OneXPlayer 3 support

- panasonic-laptop:
  - Add support for FN key

- surface: aggregator_registry:
  - Remove non-existing sensors device and fix tablet-mode detection on
    Surface Pro 11
  - Add performance profile and fan support for Surface Pro 11

- thinkpad_acpi:
  - Add keyboard attachment detection and reporting found on Thinkpad
    X1 Fold
  - Add support for Thinkpad L440 fan speed reporting

- tools/power/x86/intel-speed-select:
  - Correct make clean
  - Increase wait time after SST PP level switch to prevent stale
    capability readings

- tuxedo:
  - Fix keyboard LED map ordering
  - Correct interpreting intensity vs RGB levels

- uniwill-laptop:
  - Correct brightness handling for 3 level keyboard
  - Add keyboard backlight support for TUXEDO devices
  - Add support for PCSpecialist Recoil 16 AMD
  - Add support for screen rotation key found on PCSpecialist Recoil 16
    AMD and TUXEDO Stellaris 16 Gen7
  - Implement rainbow animation as trigger
  - Correct led labels to match LED subsystem conventions
  - Add support for LAPKC71E Intel NUC x15

- wmi:
  - Remove X86 dependency to allow supporting arm64 laptops in future
  - wmi-bmof: Move under drivers/platform/wmi/

- Miscellaneous cleanups / refactoring / improvements
    
Regards, i.


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v7.4-1

for you to fetch changes up to 9d3475065167197742b0882aff21cf8e78393277:

  platform/x86: asus-wmi: name the TUF keyboard RGB state and speed codes (2026-10-21 12:50:01 +0300)

----------------------------------------------------------------
The following is an automated shortlog grouped by driver:

acer-wmi:
 -  Add support for Acer Nitro AN16-41
 -  Add support for Acer Nitro ANV15-51
 -  Cycle platform profile on mode key 0x4
 -  enable hwmon on Aspire A315-58G
 -  Remove unused platform_profile_support variable
 -  split hwmon from platform profile quirk
 -  use bool for boolean quirk fields

ACPI: video:
 -  Remove CONFIG_X86 handling from nvidia_wmi_ec_supported()

add Acer battery control driver:
 - add Acer battery control driver

Add ACPI_COMPANION() NULL check in topstar_acpi_probe:
 - Add ACPI_COMPANION() NULL check in topstar_acpi_probe

amd: hfi:
 -  Fix a use-after-free when unloading the driver
 -  Fix out-of-bounds reads when parsing ranking data
 -  Rely on ACPI enumeration instead of a dummy device

amd/hsmp:
 -  Add HSMP client support for Family 1Ah
 -  Document and expose client telemetry table in UAPI
 -  Recognize Family 1Ah client platforms and hide server-only paths
 -  Route metric table through the client messages

amd/pmc:
 -  Add HP Laptop 14-fq1xxx to s2idle quirk list
 -  Add PMC driver support for AMD 1Ah Family DCh SoC
 -  Add spurious_8042 to ASUS ROG Flow Z13 GZ302EA
 -  Add Thinkpad L14 Gen3 (21C5) to quirk_s2idle_bug
 -  clear devm-managed pointers on remove to prevent stale reuse

amd: pmc:
 -  Drop scratch_reg from amd_1ah_m80_cpu_info
 -  Only create amd_pmc_idlemask if scratch defined

amd/pmf:
 -  Add AMDI0112 ACPI ID
 -  fix compat ioctl handling
 -  Fix power_supply refcount leak in amd_pmf_get_battery_prop()
 -  Inline !AMD_PMF_DEBUG stub
 -  Inline simple helper function of Smart PC TA interfaces
 -  Inline simple helper function of SPS Layer
 -  Inline simple helper functions of Core Layer
 -  Inline wrappers of ap{mf,ts}_if_call_store_buffer()
 -  Validate the APTS state index

amd:
 -  Stop counting intermediate cycles with metrics table

arm64:
 -  Add a driver for the EC found on ASUS Glymur machines
 -  add Lenovo Yoga Slim 7x Gen 11 EC driver

arm64: qcom-hamoa-ec:
 -  Disable the SCI IRQ during suspend

arm64:
 -  Remove redundant dev_err_probe()

arm64: thinkpad-t14s-ec:
 -  don't send KEY_KBDILLUMTOGGLE on Fn+Space

asus-armoury:
 -  add dGPU disable fallback DEVID for ProArt H7606 series
 -  Add dgpu_power_state attribute
 -  add power limits quirk for FA608PM
 -  add power limits quirk for FA608UH
 -  add power limits quirk for FA608UP
 -  add power limits quirk for G533QS
 -  add power limits quirk for G614FM
 -  add power limits quirk for G713QR
 -  Add power limits quirk for GA401IHR
 -  add power limits quirk for GA402NV
 -  add power limits quirk for GU605CM
 -  add support for GX651AR
 -  Add XBOX ROG Ally X 20 Tunables
 -  let attribute groups decide their own visibility
 -  move has_valid_limit() above the attribute declarations
 -  Prevent disabling dGPU when in use
 -  use sysfs_create_groups() and sysfs_remove_groups()

asus-laptop:
 -  Fix typo in infos_show() comment

asus-nb-wmi:
 -  add tablet mode quirk for ROG Flow X13 GV302X
 -  Fix typo in asus_nb_wmi_quirks() comment

asus-wmi:
 -  Add ASUS_WMI_DEVID_DGPU_POWER_STATE define
 -  Add mute LED support
 -  add tablet-mode switch quirk for ASUS ProArt PX13
 -  don't warn when LPS0 is unavailable
 -  fix screenpad power state detection
 -  fix TUF keyboard power state shutdown naming
 -  fix unclear usage of bd->props.power
 -  fix use-after-free unregistering kbd_led led
 -  name the TUF keyboard RGB state and speed codes
 -  Remove redundant per-device wmi_lock and duplicate rfkill ops
 -  Remove unused platform_profile_support member
 -  remove unused screenpad_brightness
 -  rename TUF RGB state DEVID to _CMD
 -  Serialize WMI method evaluations with a mutex
 -  use backlight_is_blank() for screenpad power
 -  validate custom fan curves on enable

ayaneo-ec:
 -  Add AYANEO 2S charge control

bitland-mifs-wmi:
 -  Detect failed function calls
 -  Treat WMI_FN_SYSTEM_AC_TYPE as optional

dell: alienware-wmi-wmax:
 -  add Alienware Area-51 AAT2250

dell-dw5826e:
 -  Extend _DSM support to revision 0

dell-wmi-aio:
 -  Convert to use the bus-based WMI API
 -  Use named defines for event types

docs: TPMI:
 -  use literal block for commands

gpd pocket fan:
 -  Cancel work before releasing GPIOs

hp_accel:
 -  Fix typo in lis3lv02d_acpi_write() comment

hp-bioscfg:
 -  allow clearing current_password
 -  consolidate common package-element parsing
 -  fix 16-byte heap overflow for empty auth token
 -  fix non-ASCII truncation in hp_get_string_from_buffer()
 -  fix off-by-one in password length check
 -  fix OOB reads in hp_get_string_from_buffer()
 -  fix oops on short integer attribute buffer
 -  fix slab-out-of-bounds write in hp_convert_hexstr_to_str()
 -  NUL-terminate the SPM auth token
 -  remove dead bounds check in audit_log_entries_show
 -  return -E2BIG from validate_password_input()
 -  Support allocating large number of BIOS vars
 -  validate SPM state returned by firmware
 -  zero the hex-string decode buffer in hp_convert_hexstr_to_str()

hp-wmi:
 -  Add board 8E41 (OMEN Transcend 14) to feature board list
 -  add charge_behaviour support for Spectre 8C15/8C17
 -  Add OMEN board 8A17 thermal profile support
 -  Add OMEN board 8A18 thermal profile support
 -  Add OMEN board 8D40 thermal profile support
 -  Add OMEN board 8D42 thermal profile support
 -  Add support for HP Laptop 15-fd1xxx (board 8DE1)
 -  Add support for Omen 16-am0xxx (8D3F)
 -  add support for OMEN 16-am2xxx boards
 -  Add Victus 15-fb3xxx support
 -  Add Victus 16-d1xxx board 8A26 support
 -  Add Victus 16-e0xxx board 88EE support
 -  Disable hwmon attributes when no fans are usable
 -  fix heap OOB read and memory corruption in hp_wmi_perform_query()
 -  Fix hwmon keep-alive teardown
 -  Remove unused platform_profile_support variable

huawei-wmi:
 -  add camera toggle keycode

ibm_rtl:
 -  Fix potential OOB read at signature search

ideapad-laptop:
 -  Add Yoga Pro 7 14IAH10 Mode key
 -  Map Smart Connect hotkey to KEY_LINK_PHONE
 -  Report camera switch as SW_CAMERA_LENS_COVER

int1092:
 -  Mark as orphan

intel/hid:
 -  Enable 5 button array on HP EliteBook x360 1030 G2

intel/pmc:
 -  Add rugged Panther Lake support to intel_pmc_core
 -  Fix stale NVL PCD-S S0ix_LPM telemetry constants

intel/pmt:
 -  Add register access callbacks
 -  Block mmap when callback is present
 -  complete pcidev to device update
 -  Do not remap when using callbacks
 -  refactor rc with a return value
 -  refactor rmw with a return value

intel: power-domains:
 -  Handle failed init in tpmi_get_linux_die_id()
 -  Handle failed init in tpmi_get_power_domain_mask()

intel_telemetry:
 -  initialize default trace verbosity

intel/tpmi:
 -  Build the TPMI control words in one expression
 -  Declare the loop counters in their loops
 -  Describe a TPMI instance by its two devices
 -  Describe the device creation policy on the function
 -  Do not assume TPMI is enumerated from PCI
 -  Drop unused arg from tpmi_set_control_base()
 -  Fix typo in TPMI_FEATURE_NAME_LEN comment
 -  Get tpmi_info directly from the parent device
 -  Include the headers tpmi_common.c relies on
 -  Keep the feature resources in intel_tpmi_info
 -  Remove unused vsec_dev from intel_tpmi_pm_feature
 -  Split off the PCI VSEC enumeration
 -  Split out enumeration independent init and exit
 -  Turn TPMI_GET_SINGLE_ENTRY_SIZE() into a function
 -  Use DEFINE_RES_MEM() for the feature resources
 -  Use DEFINE_SHOW_STORE_ATTRIBUTE() for mem_write
 -  Use guard() for tpmi_dev_lock in the status read
 -  Use scnprintf() to build the debugfs names
 -  Use scope based cleanup in the memory dump
 -  Use static strings for the feature device names

intel-uncore-freq:
 -  Add support for rugged Panther Lake
 -  Continue restoring limits on resume

intel/vsec:
 -  Fix inverted walk_header() test in get_features()
 -  Pass a struct device to intel_vsec_set_mapping()
 -  reset state before re-enumerating
 -  Use bool for run_once

intel: wmi:
 -  Remove redundant callbacks
 -  Use sysfs_emit in sbl-fw-update

ISST:
 -  Avoid model check for recent servers

lenovo-wmi-capdata:
 -  Adopt new WMI API
 -  Defer mutex initialization
 -  Detect stubbed capdata device
 -  Do not match missing components
 -  Do not stop the AC notifier chain on error
 -  Only allocate sub-master info when necessary

lenovo-wmi-{capdata,other}:
 -  Only allocate capdata list when necessary

lenovo-wmi-capdata:
 -  Register component even on WMI error
 -  Store a pointer to component info

lenovo-wmi-helpers:
 -  Adopt new WMI API

lib/string_choices:
 -  Add str_supported_unsupported() helper

MAINTAINERS:
 -  Add Aaron Erhardt as maintainer of TUXEDO DRIVERS
 -  Add myself as a LENOVO drivers co-maintainer

mellanox:
 -  Remove redundant dev_err()

msi-ec:
 -  Add MSI Creator Z16 A11UE EC firmware
 -  Add MSI GL65 Leopard 9SCXK EC firmware
 -  Add MSI Katana 15 B13VFK EC firmware
 -  Report valid charge thresholds when unset

msi-laptop:
 -  Fix typo in struct quirk_entry comment

msi-wmi:
 -  Fix hotkeys dropped with vendor backlight
 -  Ignore WMI events for keys also handled by atkbd
 -  Sort scancodes numerically

olpc:
 -  Reserve space for a string terminator

oxpec:
 -  Add OneXPlayer 3 quirk
 -  Fix Apex charge limit control

panasonic-laptop:
 -  Fix typo in the file history comment
 -  register FN key up/down events

Remove redundant dev_err()/dev_err_probe():
 - Remove redundant dev_err()/dev_err_probe()

platform/x86: thinkpad_acpi:
 - Revert: Add X9-14 Gen 1 to non-standard thermal/fan quirk tables

samsung-laptop:
 -  Fix typo in sabi_configs comment

simatic-ipc:
 -  fix platform device leak on registration failure

surface: aggregator_registry:
 -  Add performance profile and fan support for Surface Pro 11
 -  Add Surface Laptop 8th Edition
 -  Fix tablet-mode detection on Surface Pro 11
 -  Remove sensors device for Surface Pro 11

think-lmi:
 -  Use ARRAY_SIZE() in tlmi_errstr_to_err()
 -  Use scnprintf() in new_password_store()
 -  Use sysfs_emit() in pending_reboot_show()

thinkpad-acpi:
 -  Add X1 Fold keyboard attachment detection

thinkpad_acpi:
 -  Add X9-14 Gen 1 to non-standard thermal/fan quirk tables
 -  convert conditional mutex locks to ACQUIRE_ERR()
 -  convert mutex_lock() to guard(mutex)
 -  fix deadlock in hotkey input open/close
 -  Fix fan speed reporting on ThinkPad L440
 -  fix typos in comments
 -  Remove unreachable code in beep_read()
 -  Use bool for local is_thinkpad variable
 -  use __free(kfree) for automatic cleanup
 -  Use input_device_enabled()
 -  Use str_supported_unsupported() helper

tools/power/x86/intel-speed-select:
 -  Clean all the produced files
 -  Correct macro name in debug output
 -  Fix signed shift UB in BIT() macro
 -  Increase wait time after SST PP level switch
 -  v1.27 release

toshiba_haps:
 -  Remove unnecessary ret in toshiba_haps_resume()

tuxedo:
 -  Don't use device driver data
 -  Fix keyboard LED map ordering
 -  Set HID report ID on success
 -  Update and extend documentation
 -  Use intensity according to HID spec

uniwill-laptop:
 -  Add PCSpecialist Recoil 16 AMD
 -  Enable kb backlight and lightbar for TUXEDO
 -  Extend support for the Intel NUC x15
 -  Fix breathing animation on Intel QC
 -  Fix brightness notify for 3 level keyboards
 -  Fix typo in the kbd LED brightness comment
 -  Implement rainbow animation as trigger
 -  Label multicolor LEDs correctly
 -  Map the screen rotation key
 -  Report correct lightbar brightness

wmi-bmof:
 -  Move to generic WMI code

wmi:
 -  Introduce wmidev_exists()
 -  Remove dependency on CONFIG_X86

yogabook:
 -  use assign_bit()/change_bit() where applicable

Merges:
 -  Merge branch 'fixes' into review-ilpo-next
 -  Merge branch 'platform-drivers-x86-intel-pmt' into for-next

----------------------------------------------------------------

 .../ABI/removed/sysfs-driver-uniwill-laptop        |  10 +
 Documentation/ABI/testing/debugfs-tpmi             |   8 +-
 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec       |  22 +
 .../ABI/testing/sysfs-driver-uniwill-laptop        |  15 +-
 .../admin-guide/laptops/thinkpad-acpi.rst          |  26 +-
 .../admin-guide/laptops/uniwill-laptop.rst         |   9 +-
 Documentation/arch/x86/amd_hsmp.rst                |  24 +-
 Documentation/wmi/devices/acer-wmi-battery.rst     |  70 ++
 Documentation/wmi/devices/bitland-mifs-wmi.rst     |  64 +-
 MAINTAINERS                                        |  11 +-
 arch/x86/include/uapi/asm/amd_hsmp.h               | 420 +++++++++++
 drivers/acpi/Kconfig                               |   2 +-
 drivers/acpi/video_detect.c                        |   8 -
 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   4 +-
 drivers/gpu/drm/gma500/Kconfig                     |   1 -
 drivers/gpu/drm/i915/Kconfig                       |   1 -
 drivers/gpu/drm/radeon/Kconfig                     |   4 +-
 drivers/gpu/drm/xe/Kconfig                         |   5 +-
 drivers/platform/arm64/Kconfig                     |  40 +
 drivers/platform/arm64/Makefile                    |   2 +
 drivers/platform/arm64/acer-aspire1-ec.c           |   2 +-
 drivers/platform/arm64/asus-glymur-ec.c            | 617 ++++++++++++++++
 drivers/platform/arm64/huawei-gaokun-ec.c          |   2 +-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c      |  10 +-
 drivers/platform/arm64/lenovo-yoga-c630.c          |   2 +-
 .../platform/arm64/lenovo-yoga-slim7x-gen11-ec.c   | 530 +++++++++++++
 drivers/platform/arm64/qcom-hamoa-ec.c             |  19 +-
 drivers/platform/loongarch/Kconfig                 |   1 +
 drivers/platform/mellanox/mlxbf-tmfifo.c           |   1 -
 drivers/platform/mellanox/mlxreg-hotplug.c         |   4 +-
 drivers/platform/olpc/olpc-ec.c                    |   2 +-
 .../platform/surface/surface_aggregator_registry.c |   7 +-
 drivers/platform/wmi/Kconfig                       |  14 +-
 drivers/platform/wmi/Makefile                      |   4 +
 drivers/platform/{x86/wmi-bmof.c => wmi/bmof.c}    |   0
 drivers/platform/wmi/core.c                        |  33 +-
 drivers/platform/x86/Kconfig                       |  24 +-
 drivers/platform/x86/Makefile                      |   4 +-
 drivers/platform/x86/acer-wmi-battery.c            | 450 +++++++++++
 drivers/platform/x86/acer-wmi.c                    |  94 ++-
 drivers/platform/x86/amd/hfi/hfi.c                 |  34 +-
 drivers/platform/x86/amd/hsmp/acpi.c               |  31 +-
 drivers/platform/x86/amd/hsmp/hsmp.c               | 248 +++++--
 drivers/platform/x86/amd/hsmp/hsmp.h               |  24 +
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |  26 +
 drivers/platform/x86/amd/pmc/pmc.c                 |  26 +-
 drivers/platform/x86/amd/pmc/pmc.h                 |   1 +
 drivers/platform/x86/amd/pmf/acpi.c                |  76 +-
 drivers/platform/x86/amd/pmf/core.c                |  23 +-
 drivers/platform/x86/amd/pmf/pmf.h                 | 150 +++-
 drivers/platform/x86/amd/pmf/spc.c                 |  23 +-
 drivers/platform/x86/amd/pmf/sps.c                 |  15 +-
 drivers/platform/x86/amd/pmf/util.c                |   1 +
 drivers/platform/x86/asus-armoury.c                | 309 ++++----
 drivers/platform/x86/asus-armoury.h                | 408 +++++++++-
 drivers/platform/x86/asus-laptop.c                 |   6 +-
 drivers/platform/x86/asus-nb-wmi.c                 |  25 +-
 drivers/platform/x86/asus-tf103c-dock.c            |   2 +-
 drivers/platform/x86/asus-wmi.c                    | 233 +++---
 drivers/platform/x86/asus-wmi.h                    |   1 -
 drivers/platform/x86/ayaneo-ec.c                   |   7 +
 drivers/platform/x86/bitland-mifs-wmi.c            | 146 ++--
 drivers/platform/x86/dell/alienware-wmi-wmax.c     |   8 +
 drivers/platform/x86/dell/dell-dw5826e-reset.c     |  30 +-
 drivers/platform/x86/dell/dell-wmi-aio.c           | 205 +++--
 drivers/platform/x86/gpd-pocket-fan.c              |   9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 179 +++--
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h       |   3 +
 .../platform/x86/hp/hp-bioscfg/enum-attributes.c   |  57 +-
 .../platform/x86/hp/hp-bioscfg/int-attributes.c    |  64 +-
 .../x86/hp/hp-bioscfg/order-list-attributes.c      |  69 +-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c       |  75 +-
 .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c |  12 +-
 .../platform/x86/hp/hp-bioscfg/string-attributes.c |  69 +-
 .../x86/hp/hp-bioscfg/surestart-attributes.c       |  18 +-
 drivers/platform/x86/hp/hp-wmi.c                   | 325 +++++++-
 drivers/platform/x86/hp/hp_accel.c                 |   2 +-
 drivers/platform/x86/huawei-wmi.c                  |   1 +
 drivers/platform/x86/ibm_rtl.c                     |   8 +-
 drivers/platform/x86/intel/Kconfig                 |   4 +
 drivers/platform/x86/intel/Makefile                |   1 +
 drivers/platform/x86/intel/bxtwc_tmu.c             |   5 +-
 drivers/platform/x86/intel/bytcrc_pwrsrc.c         |   2 +-
 drivers/platform/x86/intel/crystal_cove_charger.c  |   2 +-
 drivers/platform/x86/intel/hid.c                   |   7 +
 drivers/platform/x86/intel/int0002_vgpio.c         |   4 +-
 drivers/platform/x86/intel/pmc/core.c              |   1 +
 drivers/platform/x86/intel/pmc/core.h              |   2 +-
 drivers/platform/x86/intel/pmc/nvl.c               |   2 +-
 drivers/platform/x86/intel/pmt/class.c             |  35 +-
 drivers/platform/x86/intel/pmt/class.h             |   5 +-
 drivers/platform/x86/intel/pmt/crashlog.c          | 235 ++++--
 drivers/platform/x86/intel/pmt/discovery.c         |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c         |   3 +
 drivers/platform/x86/intel/punit_ipc.c             |   4 +-
 .../x86/intel/speed_select_if/isst_if_common.c     |  57 +-
 drivers/platform/x86/intel/telemetry/core.c        |   4 +
 drivers/platform/x86/intel/tpmi_common.c           | 822 +++++++++++++++++++++
 drivers/platform/x86/intel/tpmi_common.h           |  52 ++
 drivers/platform/x86/intel/tpmi_power_domains.c    |  18 +
 .../x86/intel/uncore-frequency/uncore-frequency.c  |   3 +-
 drivers/platform/x86/intel/vsec.c                  |  28 +-
 drivers/platform/x86/intel/vsec_tpmi.c             | 822 +--------------------
 drivers/platform/x86/intel/wmi/sbl-fw-update.c     |  16 +-
 drivers/platform/x86/lenovo/ideapad-laptop.c       |  16 +
 drivers/platform/x86/lenovo/think-lmi.c            |  14 +-
 drivers/platform/x86/lenovo/thinkpad_acpi.c        | 499 +++++++------
 drivers/platform/x86/lenovo/wmi-capdata.c          | 458 ++++++++----
 drivers/platform/x86/lenovo/wmi-helpers.c          |  61 +-
 drivers/platform/x86/lenovo/wmi-other.c            |  24 +-
 drivers/platform/x86/lenovo/yogabook.c             |  11 +-
 drivers/platform/x86/msi-ec.c                      |  12 +
 drivers/platform/x86/msi-laptop.c                  |   2 +-
 drivers/platform/x86/msi-wmi.c                     |  41 +-
 drivers/platform/x86/oxpec.c                       |  75 +-
 drivers/platform/x86/panasonic-laptop.c            |  14 +-
 drivers/platform/x86/samsung-laptop.c              |   2 +-
 drivers/platform/x86/siemens/simatic-ipc.c         |  21 +-
 drivers/platform/x86/topstar-laptop.c              |   6 +-
 drivers/platform/x86/toshiba_haps.c                |  11 +-
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c          | 122 +--
 drivers/platform/x86/uniwill/Kconfig               |   1 +
 drivers/platform/x86/uniwill/uniwill-acpi.c        | 573 ++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.h         |   3 +
 drivers/platform/x86/x86-android-tablets/core.c    |  44 +-
 drivers/platform/x86/x86-android-tablets/lenovo.c  |  37 +-
 .../x86/x86-android-tablets/x86-android-tablets.h  |   2 +
 include/linux/intel_vsec.h                         |  19 +-
 include/linux/platform_data/x86/asus-wmi.h         |   9 +-
 include/linux/string_choices.h                     |   6 +
 include/linux/wmi.h                                |   3 +
 include/uapi/linux/amd-pmf.h                       |   3 +
 tools/power/x86/intel-speed-select/Makefile        |   4 +-
 tools/power/x86/intel-speed-select/isst-config.c   |   4 +-
 .../power/x86/intel-speed-select/isst-core-mbox.c  |   2 +-
 tools/power/x86/intel-speed-select/isst.h          |   2 +-
 136 files changed, 6857 insertions(+), 2895 deletions(-)
 create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-laptop
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
 create mode 100644 drivers/platform/arm64/asus-glymur-ec.c
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
 rename drivers/platform/{x86/wmi-bmof.c => wmi/bmof.c} (100%)
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c
 create mode 100644 drivers/platform/x86/intel/tpmi_common.c
 create mode 100644 drivers/platform/x86/intel/tpmi_common.h
