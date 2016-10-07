From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 6/6] intel_pmc_core: Add KBL CPUID support
Date: Fri,  7 Oct 2016 16:01:17 +0530
Message-ID: <1475836277-4788-7-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:63784 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753292AbcJGKbd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2016 06:31:33 -0400
In-Reply-To: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

This patch adds Kabylake CPU support for pmc_core driver.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 5b867b7..45411b1 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -486,6 +486,10 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 		(kernel_ulong_t)NULL},
 	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_DESKTOP, X86_FEATURE_MWAIT,
 		(kernel_ulong_t)NULL},
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_KABYLAKE_MOBILE, X86_FEATURE_MWAIT,
+		(kernel_ulong_t)NULL},
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_KABYLAKE_DESKTOP, X86_FEATURE_MWAIT,
+		(kernel_ulong_t)NULL},
 	{}
 };
 
-- 
1.9.1
