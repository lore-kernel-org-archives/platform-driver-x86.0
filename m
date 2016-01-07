From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 0/5] Add Intel Telemetry Support
Date: Thu,  7 Jan 2016 14:34:42 +0530
Message-ID: <1452157482-10588-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:42585 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752397AbcAGI6a (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jan 2016 03:58:30 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com, david.ginat@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

This set of 5 patches enables PM Telemetry Support for Intel
Platforms. Intel PM Telemetry is a software mechanism via which
various SoC PM and performance related parameters like PM counters,
firmware trace verbosity, the status of different devices inside
the SoC, etc can be monitored and analyzed.
The statictics are fetched via IPC from the Punit & PMC firmware
and hence it depends on the PMC & PUNIT IPC driver. The different
samples that may be monitored can be configured at runtime via
exported APIs.

Currently it supports Intel ApolloLake platform and is intended to
be extended to future platforms as well.

ChangeLog:
*[Patch v4 1/5] platform:x86: Add Intel Telemetry Core Driver
	v4:
	- Remove redundant zero assignment for variables
	v3:
	- Clean code using checkpatch.pl from Kernel v4.3-rc4
	v2:
	- Fix issues in code style, indentation & comments
	- Follow kernel-doc sytle comments
	- Changed Banner to include "All Rights Reserved"
	- Change telemetry_plt_config.telem_in_use type to bool
	- Introduce Default empty platform specific callbacks to
	  remove NULL checks
	- Use pr_fmt in init
	- Change to MODULE_LICENSE to GPL

*[Patch v5 2/5] platform:x86: Add Intel telemetry platform driver
	v5:
	- Add Device Driver first. Device is created later for
	  better bisectibility.
	- Multiline comment formatting fixed
	- Redundant zero initialization removed
	- Optimize for loops, by removing 'evts' while
	  initializing Telemetry setup
	- Change bool value of telem_in_use to 'true' or 'false'.
	  Clean the if else loop.
	- Remove redundant telem_conf variable
	- Suppress excess error messages
	v4:
	- Patch v3 2/5 is split in 2 patches according to Device
	  and Driver addition
	- Change PUNIT CMDs according to changes in
	  intel_punit_ipc.c
	v3:
	- Clean code using checkpatch.pl from Kernel v4.3-rc4
	v2:
	- Fix issues in code style, indentation & comments
	- Follow kernel-doc sytle comments
	- Changed Banner to include "All Rights Reserved"
	- Change telemetry_plt_config.telem_in_use type to bool
	- Introduce Default empty platform specific callbacks to
	  remove NULL checks
	- Use pr_fmt in init
	- Change to MODULE_LICENSE to GPL

*[Patch v4 3/5] platform:x86: Add Intel telemetry platform device
	v4:
	- Patch v3 2/5 is split in 2 patches according to Device
	  and Driver addition.
	v3:
	- Clean code using checkpatch.pl from Kernel v4.3-rc4
	v2:
	- Fix issues in code style, indentation & comments
	- Changed Banner to include "All Rights Reserved"
	- Remove unnecessary casting between void* and
	  resource_size_t
	- Split telemetry_setup_evtconfig into two more functions
	- Use 'ret' consistently instead of 'err'
	- Change to MODULE_LICENSE to GPL

*[Patch v3 4/5] platform:x86: Add Intel Telemetry Debugfs interfaces
	v3:
	- Shorter variable names for better viewability
	- Define Macros for repeated code in for loop during
	  event parsing
	v2:
	- Fix issues in code style, indentation & comments
	- Changed Banner to include "All Rights Reserved"
	- Group all ApolloLake specific #defines under banner
	- Change to MODULE_LICENSE to GPL

*[Patch v3 5/5] platform:x86: Makefile/Kconfig/MAINTAINERS changes
	v3:
	- Rebased on top of latest files
	v2:
	- Change bool to tristate in Kconfig to enable support as
	  module
	- Remove PUNIT_IPC specific additions. These will be merged
	  separately by PUNIT_IPC patch.

Souvik Kumar Chakravarty (5):
  platform:x86: Add Intel Telemetry Core Driver
  platform:x86: Add Intel telemetry platform driver
  platform:x86: Add Intel telemetry platform device
  platform:x86: Add Intel Telemetry Debugfs interfaces
  platform:x86: Makefile/Kconfig/MAINTAINERS changes for Intel
    Telemetry

 MAINTAINERS                                    |    9 +
 arch/x86/include/asm/intel_telemetry.h         |  147 +++
 drivers/platform/x86/Kconfig                   |   11 +
 drivers/platform/x86/Makefile                  |    3 +
 drivers/platform/x86/intel_pmc_ipc.c           |   96 ++
 drivers/platform/x86/intel_telemetry_core.c    |  464 +++++++++
 drivers/platform/x86/intel_telemetry_debugfs.c | 1030 ++++++++++++++++++++
 drivers/platform/x86/intel_telemetry_pltdrv.c  | 1206 ++++++++++++++++++++++++
 8 files changed, 2966 insertions(+)
 create mode 100644 arch/x86/include/asm/intel_telemetry.h
 create mode 100644 drivers/platform/x86/intel_telemetry_core.c
 create mode 100644 drivers/platform/x86/intel_telemetry_debugfs.c
 create mode 100644 drivers/platform/x86/intel_telemetry_pltdrv.c

-- 
1.7.9.5
