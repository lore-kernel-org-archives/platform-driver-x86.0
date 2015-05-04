From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: [PATCH 0/2] x86/quark: Add eSRAM driver and test code
Date: Mon,  4 May 2015 03:17:53 +0100
Message-ID: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, pure.logic@nexus-software.ie, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

Quark X1000 SoC contains a 512 KiB embedded SRAM (eSRAM) memory that can
be mapped onto an area of DRAM in block or on per-page overlay mode where a
4 KiB aligned region can be overlayed - allowing for broken up mappings
with a 4 KiB individual granularity.

eSRAM has access times similar to an L1 cache. The following patchset
adds a gen_pool driver and automatic test routine to exercise eSRAM. The
intent of the eSRAM driver is to allow other drivers to allocate SRAM
buffers. In contrast to the original BSP code no attempt will be made to
map kernel .data section code, this is a simple SRAM buffer allocation/free
mechanism and a sanity test to ensure it's ongoing correctness.

Bryan O'Donoghue (2):
  x86/quark: Add Quark embedded SRAM support
  x86/quark: Add Quark embedded SRAM self-test

 arch/x86/Kconfig.debug                         |  13 +
 arch/x86/include/asm/esram.h                   |  66 ++++
 arch/x86/platform/intel-quark/Makefile         |   2 +
 arch/x86/platform/intel-quark/esram.c          | 502 +++++++++++++++++++++++++
 arch/x86/platform/intel-quark/esram_selftest.c | 159 ++++++++
 drivers/platform/x86/Kconfig                   |  17 +-
 6 files changed, 758 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/include/asm/esram.h
 create mode 100644 arch/x86/platform/intel-quark/esram.c
 create mode 100644 arch/x86/platform/intel-quark/esram_selftest.c

-- 
1.9.1
