From: Jithu Joseph <jithu.joseph@intel.com>
Subject: [PATCH 0/1] platform/x86: Add Slim Bootloader firmware update support
Date: Mon, 20 Apr 2020 12:44:04 -0700
Message-ID: <20200420194405.8281-1-jithu.joseph@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, sean.v.kelley@intel.com, kuo-lang.tseng@intel.com, Jithu Joseph <jithu.joseph@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Slim Bootloader(SBL) [1] is a small open-source boot firmware,
designed for running on certain Intel platforms. SBL can be
thought-of as fulfilling the role of a minimal BIOS
implementation, i.e initializing the hardware and booting
Operating System.

This driver creates sysfs interfaces which allows user space entities
to trigger update of SBL firmware.

Acknowledgment: Initial draft of the driver code was authored by
Maurice Ma <maurice.ma@intel.com>

[1] https://slimbootloader.github.io

Jithu Joseph (1):
  platform/x86: Add Slim Bootloader firmware update signaling driver

 MAINTAINERS                        |   7 ++
 drivers/platform/x86/Kconfig       |  10 ++
 drivers/platform/x86/Makefile      |   1 +
 drivers/platform/x86/sbl_fwu_wmi.c | 143 +++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 drivers/platform/x86/sbl_fwu_wmi.c


base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
-- 
2.17.1
