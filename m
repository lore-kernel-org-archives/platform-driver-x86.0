From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v10 2/7] x86: add SGX definitions to cpufeature
Date: Sun, 24 Dec 2017 21:56:48 +0200
Message-ID: <20171224195854.2291-3-jarkko.sakkinen@linux.intel.com>
References: <20171224195854.2291-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:41944 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751039AbdLXUCP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Dec 2017 15:02:15 -0500
In-Reply-To: <20171224195854.2291-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: Kai Huang <kai.huang@linux.intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, "open list:X86 ARCHITECTURE 32-BIT AND
        64-BIT" <linux-kernel@vger.kernel.org>

From: Kai Huang <kai.huang@linux.intel.com>

Added X86_FEATURE_SGX and X86_FEATURE_SGX_LC definitions that define the
bits CPUID level 7 bits for determining whether the CPU supports SGX and
launch configuration other than the Intel proprietary key. If this the
case, IA32_SGXLEPUBKEYHASHn MSRs (0 < n < 4) are available for defining
the root key for enclaves.

Signed-off-by: Kai Huang <kai.huang@linux.intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Tested-by: Serge Ayoun <serge.ayoun@intel.com>
---
 arch/x86/include/asm/cpufeatures.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index c0b0e9e8aa66..a3fca410216e 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -223,6 +223,7 @@
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word 9 */
 #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGSBASE, WRGSBASE instructions*/
 #define X86_FEATURE_TSC_ADJUST		( 9*32+ 1) /* TSC adjustment MSR 0x3B */
+#define X86_FEATURE_SGX			( 9*32+ 2) /* Software Guard Extensions */
 #define X86_FEATURE_BMI1		( 9*32+ 3) /* 1st group bit manipulation extensions */
 #define X86_FEATURE_HLE			( 9*32+ 4) /* Hardware Lock Elision */
 #define X86_FEATURE_AVX2		( 9*32+ 5) /* AVX2 instructions */
@@ -308,6 +309,7 @@
 #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* POPCNT for vectors of DW/QW */
 #define X86_FEATURE_LA57		(16*32+16) /* 5-level page tables */
 #define X86_FEATURE_RDPID		(16*32+22) /* RDPID instruction */
+#define X86_FEATURE_SGX_LC		(16*32+30) /* supports SGX launch configuration */
 
 /* AMD-defined CPU features, CPUID level 0x80000007 (EBX), word 17 */
 #define X86_FEATURE_OVERFLOW_RECOV	(17*32+ 0) /* MCA overflow recovery support */
-- 
2.14.1
