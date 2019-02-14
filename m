From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH v3 1/5] x86/cpu: Add Icelake to Intel family
Date: Thu, 14 Feb 2019 17:27:08 +0530
Message-ID: <20190214115712.19642-2-rajneesh.bhardwaj@linux.intel.com>
References: <20190214115712.19642-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214115712.19642-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, x86@kernel.org, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add CPUID of Icelake (ICL) mobile processors to Intel family list.
Icelake U/Y series uses model no 0x7E. Public documentation related to
it is not available yet but this information is correct as per my
understanding.

Cc: x86@kernel.org
Cc: Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "David E. Box" <david.e.box@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 arch/x86/include/asm/intel-family.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index 0dd6b0f4000e..058b1a1994c4 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -52,6 +52,8 @@
 
 #define INTEL_FAM6_CANNONLAKE_MOBILE	0x66
 
+#define INTEL_FAM6_ICELAKE_MOBILE	0x7E
+
 /* "Small Core" Processors (Atom) */
 
 #define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
-- 
2.17.1
