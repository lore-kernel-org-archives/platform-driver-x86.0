From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [Patch v2 0/5] platform/x86: intel_pmc_core: Add CFL/CNL Support
Date: Fri,  2 Feb 2018 19:13:32 +0530
Message-ID: <1517579017-19935-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:38319 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751544AbeBBNs5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Feb 2018 08:48:57 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-acpi@vger.kernel.org, x86@kernel.org

This series contains the remaining (rebased) patches that were not applied
to the pdx tree earlier. This also includes Acked-by / Reviewed-by tags from
Rafael and Thomas.

Rebased and tested on:
http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/review-andy

Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>

Cc: linux-acpi@vger.kernel.org
Cc: x86@kernel.org

Rajneesh Bhardwaj (3):
  x86/cpu: Add Cannonlake to Intel family
  platform/x86: intel_pmc_core: Add CannonLake PCH support
  platform/x86: intel_pmc_core: Special case for Coffeelake

Srinivas Pandruvada (2):
  ACPI / LPIT: Export lpit_read_residency_count_address()
  platform/x86: intel_pmc_core: Read base address from LPIT

 arch/x86/include/asm/intel-family.h   |   6 ++
 drivers/acpi/acpi_lpit.c              |   1 +
 drivers/platform/x86/intel_pmc_core.c | 108 +++++++++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h |  13 ++++
 4 files changed, 127 insertions(+), 1 deletion(-)

-- 
2.7.4
