From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v6 03/11] x86: define IA32_FEATURE_CONTROL.SGX_ENABLE
Date: Sat, 25 Nov 2017 21:29:20 +0200
Message-ID: <20171125193132.24321-4-jarkko.sakkinen@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Sean Christopherson <sean.j.christopherson@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Len Brown <len.brown@intel.com>, Kyle Huey <me@kylehuey.com>, Haim Cohen <haim.cohen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Jim Mattson <jmattson@google.com>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Sean Christopherson <sean.j.christopherson@intel.com>

When IA32_FEATURE_CONTROL.SGX_ENABLE and IA32_FEATURE_CONTROL.LOCK are
set by the pre-boot firmware, SGX is usable by the OS.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 arch/x86/include/asm/msr-index.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 17f5c12e1afd..b35cb98b5d60 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -435,6 +435,7 @@
 #define FEATURE_CONTROL_LOCKED				(1<<0)
 #define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX	(1<<1)
 #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX	(1<<2)
+#define FEATURE_CONTROL_SGX_ENABLE                      (1<<18)
 #define FEATURE_CONTROL_LMCE				(1<<20)
 
 #define MSR_IA32_APICBASE		0x0000001b
-- 
2.14.1
