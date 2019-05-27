From: Harry Pan <harry.pan@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_core: transform Pkg C-state residency from TSC ticks into microseconds
Date: Mon, 27 May 2019 21:08:10 +0800
Message-ID: <20190527130811.450-1-harry.pan@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: gs0622@gmail.com, Harry Pan <harry.pan@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Refer to the Intel SDM Vol.4, the package C-state residency counters
of modern IA micro-architecture are all ticking in TSC frequency,
hence we can apply simple math to transform the ticks into microseconds.
i.e.,
residency (ms) = count / tsc_khz
residency (us) = count / tsc_khz * 1000

This also aligns to other sysfs debug entries of residency counter in
the same metric in microseconds, benefits reading and scripting.

Signed-off-by: Harry Pan <harry.pan@intel.com>

---

 drivers/platform/x86/intel_pmc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index f2c621b55f49..20e0843ebfb4 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -24,6 +24,7 @@
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/msr.h>
+#include <asm/tsc.h>
 
 #include "intel_pmc_core.h"
 
@@ -726,7 +727,6 @@ static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_ltr);
-
 static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
@@ -738,8 +738,8 @@ static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
 		if (rdmsrl_safe(map[index].bit_mask, &pcstate_count))
 			continue;
 
-		seq_printf(s, "%-8s : 0x%llx\n", map[index].name,
-			   pcstate_count);
+		seq_printf(s, "%-8s : %llu\n", map[index].name,
+			   pcstate_count * 1000 / tsc_khz);
 	}
 
 	return 0;
-- 
2.20.1
