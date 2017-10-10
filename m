From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 02/12] x86: add SGX definition to cpufeature
Date: Tue, 10 Oct 2017 17:32:48 +0300
Message-ID: <20171010143258.21623-3-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:52005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932075AbdJJOdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:07 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Kai Huang <kai.huang@linux.intel.com>

From: Kai Huang <kai.huang@linux.intel.com>

Signed-off-by: Kai Huang <kai.huang@linux.intel.com>
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 2519c6c801c9..31a7d1c0f204 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -219,6 +219,7 @@
 /* Intel-defined CPU features, CPUID level 0x00000007:0 (ebx), word 9 */
 #define X86_FEATURE_FSGSBASE	( 9*32+ 0) /* {RD/WR}{FS/GS}BASE instructions*/
 #define X86_FEATURE_TSC_ADJUST	( 9*32+ 1) /* TSC adjustment MSR 0x3b */
+#define X86_FEATURE_SGX		( 9*32+ 2) /* Software Guard Extensions */
 #define X86_FEATURE_BMI1	( 9*32+ 3) /* 1st group bit manipulation extensions */
 #define X86_FEATURE_HLE		( 9*32+ 4) /* Hardware Lock Elision */
 #define X86_FEATURE_AVX2	( 9*32+ 5) /* AVX2 instructions */
-- 
2.14.1
