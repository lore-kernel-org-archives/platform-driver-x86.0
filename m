From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v2 0/4] Add Intel Telemetry Support
Date: Tue, 12 Jan 2016 16:00:13 +0530
Message-ID: <1452594613-20409-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com, david.ginat@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This set of 4 patches enables PM Telemetry Support for Intel
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
*[Patch v5 1/4] platform:x86: Add Intel Telemetry Core Driver
	v5:
	- Add MAINTAINERS, Kconfig and Makefile changes per patch
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

*[Patch v6 2/4] platform:x86: Add Intel telemetry platform driver
	v6:
	- Add MAINTAINERS, Kconfig and Makefile changes per patch
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

*[Patch v5 3/4] platform:x86: Add Intel telemetry platform device
	v5:
	- Add MAINTAINERS, Kconfig and Makefile changes per patch
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

*[Patch v4 4/4] platform:x86: Add Intel Telemetry Debugfs interfaces
	v4:
	- Add MAINTAINERS, Kconfig and Makefile changes per patch
        v3:
        - Shorter variable names for better viewability
        - Define Macros for repeated code in for loop during
          event parsing
        v2:
        - Fix issues in code style, indentation & comments
        - Changed Banner to include "All Rights Reserved"
        - Group all ApolloLake specific #defines under banner
        - Change to MODULE_LICENSE to GPL

Souvik Kumar Chakravarty (4):
  platform:x86: Add Intel Telemetry Core Driver
  platform:x86: Add Intel telemetry platform driver
  platform:x86: Add Intel telemetry platform device
  platform:x86: Add Intel Telemetry Debugfs interfaces

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
