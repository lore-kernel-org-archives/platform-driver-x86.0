From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 04/12] x86: define the feature control MSR's SGX launch control bit
Date: Tue, 10 Oct 2017 17:32:50 +0300
Message-ID: <20171010143258.21623-5-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:52005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932075AbdJJOdM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:12 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 31a7d1c0f204..43130f3c18a1 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -298,6 +298,7 @@
 #define X86_FEATURE_AVX512_VPOPCNTDQ (16*32+14) /* POPCNT for vectors of DW/QW */
 #define X86_FEATURE_LA57	(16*32+16) /* 5-level page tables */
 #define X86_FEATURE_RDPID	(16*32+22) /* RDPID instruction */
+#define X86_FEATURE_SGX_LC	(16*32+30) /* supports SGX launch configuration */
 
 /* AMD-defined CPU features, CPUID level 0x80000007 (ebx), word 17 */
 #define X86_FEATURE_OVERFLOW_RECOV (17*32+0) /* MCA overflow recovery support */
-- 
2.14.1
