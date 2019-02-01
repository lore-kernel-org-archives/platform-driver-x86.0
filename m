From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH 00/10] ICL support and other enhancements for PMC Core
Date: Fri,  1 Feb 2019 13:02:24 +0530
Message-ID: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch series provides Icelake support for PMC Core driver and while
doing so it introduces the Icelake Mobile to intel-family.h as per the
CPUID from below Coreboot link
https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
and provides some fixes and enhancements to the driver.

This series:
 -adds ICL U/Y CPUID to intel-family.h
 -enable PMC driver for ICL. 
 -introduce a new "package cstate show" feature
 -fixes a customer issue related to S0ix on latest HP laptops.
 -fixes some minor bugs  

Rajneesh Bhardwaj (10):
  platform/x86: intel_pmc_core: Handle CFL regmap properly
  platform/x86: intel_pmc_core: Fix PCH IP sts reading
  platform/x86: intel_pmc_core: Fix PCH IP name
  platform/x86: intel_pmc_core: Fix file permissions for ltr_show
  platform/x86: intel_pmc_core: Include Reserved IP for LTR
  x86/cpu: Add Icelake to Intel family
  platform/x86: intel_pmc_core: Convert to INTEL_CPU_FAM6 macro
  platform/x86: intel_pmc_core: Add ICL platform support
  platform/x86: intel_pmc_core: Add Package cstates residency info
  platform/x86: intel_pmc_core: Quirk to ignore XTAL shutdown

 arch/x86/include/asm/intel-family.h   |   2 +
 drivers/platform/x86/intel_pmc_core.c | 155 +++++++++++++++++++++-----
 drivers/platform/x86/intel_pmc_core.h |  14 ++-
 3 files changed, 145 insertions(+), 26 deletions(-)

-- 
2.17.1
