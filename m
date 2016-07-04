From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Mon, 4 Jul 2016 17:05:18 +0530
Message-ID: <20160704113518.GC1177@rajaneesh-OptiPlex-9010>
References: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160628090504.GA2169@rajaneesh-OptiPlex-9010>
 <1467108307.30123.303.camel@linux.intel.com>
 <20160629080325.GA11318@rajaneesh-OptiPlex-9010>
 <1467200985.30123.320.camel@linux.intel.com>
 <20160629121604.GA26750@rajaneesh-OptiPlex-9010>
 <1467204505.30123.326.camel@linux.intel.com>
 <20160629132038.GB26750@rajaneesh-OptiPlex-9010>
 <1467207230.30123.329.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:2206 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753558AbcGDLfW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2016 07:35:22 -0400
Content-Disposition: inline
In-Reply-To: <1467207230.30123.329.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

> 
> So, if there is no objections (taking into consideration minors you
> mentioned) I think the patch can be applied.
>

I think we still need to address a couple of minor issues and might need a
version 2 of this patch. In case we want to apply this one here is one patch
that can applied on top of this one. Please see the proposed changes below.

From 42d899968c8c07f103390fcaebdaf2ba54cb3363 Mon Sep 17 00:00:00 2001
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Date: Mon, 4 Jul 2016 16:22:31 +0530
Subject: [PATCH] platform/x86/intel_pmc_core: Enhances debugfs attribute
patch

Refines "convert to DEFINE_DEBUGFS_ATTRIBUTE" patch for PMC Core.

This change can be applied over the Convert to DEFINE_DEBUGFS_ATTRIBUTE
patch sent by Andy Shevchenko to the platform drivers mailing list. This
helps preserve usage of seq_file.h in the pmc_core driver. This also caters
to some minor cosmetic changes suggested during the code review process.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 4 +++-
 drivers/platform/x86/intel_pmc_core.h | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c
b/drivers/platform/x86/intel_pmc_core.c
index c29f59b..18af49f 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/pci.h>
+#include <linux/seq_file.h>

 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
@@ -88,7 +89,8 @@ static int pmc_core_dev_state_get(void *data, u64 *val)
        return 0;
 }

-DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL,
"%llu");
+DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL,
+                       "%llu\n");

 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
diff --git a/drivers/platform/x86/intel_pmc_core.h
b/drivers/platform/x86/intel_pmc_core.h
index 9689b92..6265480 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -29,7 +29,6 @@
 #define SPT_PMC_MMIO_REG_LEN                   0x100
 #define SPT_PMC_SLP_S0_RES_COUNTER_STEP                0x64

-struct dentry;

 /**
  * struct pmc_dev - pmc device structure
--
1.9.1


> -- 
> 
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Intel Finland Oy

-- 
Best Regards,
Rajneesh
