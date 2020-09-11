From: "David E. Box" <david.e.box@linux.intel.com>
Subject: [PATCH 0/3] intel_pmt: Add Alder Lake and OOB-MSM support
Date: Fri, 11 Sep 2020 12:45:46 -0700
Message-ID: <20200911194549.12780-1-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: david.e.box@linux.intel.com, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Adds Intel Platform Monitoring Technology (PMT) PCI ids for Alder Lake and
the Out Of Band Management Services Module used by Sapphire Rapdis and
other platforms.

This patchset applies on top of the patchset linked below which was
accepted and awaiting merge in mfd next.

Link: https://lore.kernel.org/lkml/20200819180255.11770-1-david.e.box@linux.intel.com/

Alexander Duyck (1):
  platform/x86: Intel PMT Crashlog capability driver

David E. Box (2):
  mfd: intel_pmt: Add OOBMSM device ID
  mfd: intel_pmt: Add Alder Lake (ADL) support

 .../ABI/testing/sysfs-class-pmt_crashlog      |  66 ++
 drivers/mfd/intel_pmt.c                       |   6 +
 drivers/platform/x86/Kconfig                  |  10 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel_pmt_crashlog.c     | 588 ++++++++++++++++++
 5 files changed, 671 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_crashlog
 create mode 100644 drivers/platform/x86/intel_pmt_crashlog.c

-- 
2.20.1
