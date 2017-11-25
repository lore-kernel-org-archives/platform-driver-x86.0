From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v6 02/11] x86: add SGX definition to cpufeature
Date: Sat, 25 Nov 2017 21:29:19 +0200
Message-ID: <20171125193132.24321-3-jarkko.sakkinen@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Kai Huang <kai.huang@linux.intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@suse.de>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Vikas Shivappa <vikas.shivappa@linux.intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Kai Huang <kai.huang@linux.intel.com>

Added X86_FEATURE_SGX, which identifies that CPU supports software guard
extensions (SGX).

Signed-off-by: Kai Huang <kai.huang@linux.intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
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
