From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 0/6] platform/x86: intel_pmc_core: PMC Driver cleanup
Date: Thu, 11 Jan 2018 17:05:28 +0530
Message-ID: <1515670528-4116-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:44229 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752294AbeAKLkw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 06:40:52 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

This patch series aims to cleanup the PMC Core driver and convert it to a
module.

Subsequent patch series will add support for newer Intel SoC like Coffeelake
and Cannonlake, this series builds a foundation for them.

Rajneesh Bhardwaj (5):
  platform/x86: intel_pmc_core: Remove unused EXPORTED API
  platform/x86: intel_pmc_core: Remove unused variable
  platform/x86: intel_pmc_core: Fix kernel doc for pmc_dev
  platform/x86: intel_pmc_core: Fix file permission warnings
  platform/x86: intel_pmc_core: Update Kconfig

Srinivas Pandruvada (1):
  platform/x86: intel_pmc_core: Change driver to a module

 drivers/platform/x86/Kconfig          |  7 ++--
 drivers/platform/x86/intel_pmc_core.c | 65 +++++++++++------------------------
 drivers/platform/x86/intel_pmc_core.h | 15 ++++----
 3 files changed, 32 insertions(+), 55 deletions(-)

-- 
2.7.4
