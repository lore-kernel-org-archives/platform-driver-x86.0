From: Jithu Joseph <jithu.joseph@intel.com>
Subject: [PATCH v3 0/1] platform/x86: Add Slim Bootloader firmware update support
Date: Mon, 27 Apr 2020 16:15:13 -0700
Message-ID: <20200427231514.24777-1-jithu.joseph@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, sean.v.kelley@intel.com, kuo-lang.tseng@intel.com, Jithu Joseph <jithu.joseph@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

v3 addresses review comment from Andy Shevchenko to v2.

Changes in v3
 - Renamed the driver file to intel-wmi-sbl-fw-update.c. This resulted in
   various changes like:
    - renaming, reordering the driver entry in Makefile and Kconfig
    - renaming, reordering the MAINTAINERS file entry
    - renamed the ABI file
    - renaming few data structures and wmi_driver entries to reflect the
      new name

v2 Upstream submission is available here:
https://lore.kernel.org/lkml/20200423224222.29730-1-jithu.joseph@intel.com


From v2 submission:

v1 Upstream submission is available here:
https://lore.kernel.org/lkml/20200420194405.8281-1-jithu.joseph@intel.com

v2 primarily addresses review comments from Andy Shevchenko to v1. 

Changes in v2
 - Rebased on top of tag: v5.7-rc2
 - Added ABI documentation file
 - Changed the ordering of SBL entry in Makefile and Kconfig
 - Replaced kstrtobool() with kstrtouint() for user input processing
 - Added DocLink: tag to annottate weblink in commit message
 - Minor edits to commit message in p1/1
 - Style related changes

From v1 submission:

Slim Bootloader(SBL) [see link below] is a small open-source boot
firmware, designed for running on certain Intel platforms. SBL can be
thought-of as fulfilling the role of a minimal BIOS
implementation, i.e initializing the hardware and booting
Operating System.

This driver creates sysfs interfaces which allows user space entities
to trigger update of SBL firmware.

Acknowledgment: Initial draft of the driver code was authored by
Maurice Ma <maurice.ma@intel.com>

DocLink: https://slimbootloader.github.io

Jithu Joseph (1):
  platform/x86: Add Slim Bootloader firmware update signaling driver

 .../sysfs-platform-intel-wmi-sbl-fw-update    |  12 ++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/Kconfig                  |  10 ++
 drivers/platform/x86/Makefile                 |   1 +
 .../platform/x86/intel-wmi-sbl-fw-update.c    | 145 ++++++++++++++++++
 5 files changed, 175 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-intel-wmi-sbl-fw-update
 create mode 100644 drivers/platform/x86/intel-wmi-sbl-fw-update.c


base-commit: ae83d0b416db002fe95601e7f97f64b59514d936
-- 
2.17.1
