From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH] MAINTAINERS: intel_pmc_core: Update MAINTAINERS
Date: Wed,  3 Oct 2018 17:21:10 +0530
Message-ID: <20181003115110.25996-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, joe@perches.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This removes the entry for pmc_core.h file in the MAINTAINERS as the
file is already removed by a previous commit.
"platform/x86: intel_pmc_core: Remove unused header file"

Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ad052aeac39..60d029b65767 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7468,7 +7468,6 @@ M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
 M:	Vishwanath Somayaji <vishwanath.somayaji@intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	arch/x86/include/asm/pmc_core.h
 F:	drivers/platform/x86/intel_pmc_core*
 
 INTEL PMC/P-Unit IPC DRIVER
-- 
2.17.1
