From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v5 1/5] x86: stub out pmc function
Date: Fri,  7 Jul 2017 17:02:59 -0700
Message-ID: <20170708000303.21863-1-dbasehore@chromium.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Derek Basehore <dbasehore@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

This creates an inline function of intel_pmc_slp_s0_counter_read for
!CONFIG_INTEL_PMC_CORE.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 arch/x86/include/asm/pmc_core.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm/pmc_core.h
index d4855f11136d..5d142d915f30 100644
--- a/arch/x86/include/asm/pmc_core.h
+++ b/arch/x86/include/asm/pmc_core.h
@@ -22,6 +22,10 @@
 #define _ASM_PMC_CORE_H
 
 /* API to read SLP_S0_RESIDENCY counter */
-int intel_pmc_slp_s0_counter_read(u32 *data);
+#ifdef CONFIG_INTEL_PMC_CORE
+extern int intel_pmc_slp_s0_counter_read(u32 *data);
+#else
+static inline int intel_pmc_slp_s0_counter_read(u32 *data) { return -EPERM; }
+#endif
 
 #endif /* _ASM_PMC_CORE_H */
-- 
2.13.2.725.g09c95d1e9-goog
