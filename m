From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [Patch v2 3/5] x86/cpu: Add Cannonlake to Intel family
Date: Fri,  2 Feb 2018 19:13:35 +0530
Message-ID: <1517579017-19935-4-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1517579017-19935-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:38331 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751972AbeBBNtG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Feb 2018 08:49:06 -0500
In-Reply-To: <1517579017-19935-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

Add CPUID of Cannonlake (CNL) processors to Intel family list.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Megha Dey <megha.dey@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 arch/x86/include/asm/intel-family.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index 35a6bc4da8ad..cf090e584202 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -10,6 +10,10 @@
  *
  * Things ending in "2" are usually because we have no better
  * name for them.  There's no processor called "SILVERMONT2".
+ *
+ * While adding a new CPUID for a new microarchitecture, add a new
+ * group to keep logically sorted out in chronological order. Within
+ * that group keep the CPUID for the variants sorted by model number.
  */
 
 #define INTEL_FAM6_CORE_YONAH		0x0E
@@ -49,6 +53,8 @@
 #define INTEL_FAM6_KABYLAKE_MOBILE	0x8E
 #define INTEL_FAM6_KABYLAKE_DESKTOP	0x9E
 
+#define INTEL_FAM6_CANNONLAKE_MOBILE	0x66
+
 /* "Small Core" Processors (Atom) */
 
 #define INTEL_FAM6_ATOM_PINEVIEW	0x1C
-- 
2.7.4
