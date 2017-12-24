From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v10 3/7] x86: add SGX definitions to msr-index.h
Date: Sun, 24 Dec 2017 21:56:49 +0200
Message-ID: <20171224195854.2291-4-jarkko.sakkinen@linux.intel.com>
References: <20171224195854.2291-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:61645 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751039AbdLXUCX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Dec 2017 15:02:23 -0500
In-Reply-To: <20171224195854.2291-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: Sean Christopherson <sean.j.christopherson@intel.com>, Haim Cohen <haim.cohen@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Len Brown <len.brown@intel.com>, Kyle Huey <me@kylehuey.com>, Borislav Petkov <bp@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, "open list:X86 ARCHITECTURE 32-BIT AND
        64-BIT" <linux-kernel@vger.kernel.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

ENCLS and ENCLU are usable if and only if SGX_ENABLE is set and After
SGX is activated the IA32_SGXLEPUBKEYHASHn MSRs are writable if
SGX_LC_WR is set and the feature control is locked.

SGX related bits in IA32_FEATURE_CONTROL cannot be set before SGX is
activated by the pre-boot firmware. SGX activation is triggered by
setting bit 0 in the MSR 0x7a. Until SGX is activated, the LE hash MSRs
are writable to allow pre-boot firmware to lock down the LE root key
with a non-Intel value.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Haim Cohen <haim.cohen@intel.com>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Tested-by: Serge Ayoun <serge.ayoun@intel.com>
---
 arch/x86/include/asm/msr-index.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 34c4922bbc3f..8647a2470487 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -439,6 +439,8 @@
 #define FEATURE_CONTROL_LOCKED				(1<<0)
 #define FEATURE_CONTROL_VMXON_ENABLED_INSIDE_SMX	(1<<1)
 #define FEATURE_CONTROL_VMXON_ENABLED_OUTSIDE_SMX	(1<<2)
+#define FEATURE_CONTROL_SGX_ENABLE                      (1<<18)
+#define FEATURE_CONTROL_SGX_LE_WR			(1<<17)
 #define FEATURE_CONTROL_LMCE				(1<<20)
 
 #define MSR_IA32_APICBASE		0x0000001b
@@ -505,6 +507,12 @@
 #define PACKAGE_THERM_INT_LOW_ENABLE		(1 << 1)
 #define PACKAGE_THERM_INT_PLN_ENABLE		(1 << 24)
 
+/* Intel SGX MSRs */
+#define MSR_IA32_SGXLEPUBKEYHASH0	0x0000008C
+#define MSR_IA32_SGXLEPUBKEYHASH1	0x0000008D
+#define MSR_IA32_SGXLEPUBKEYHASH2	0x0000008E
+#define MSR_IA32_SGXLEPUBKEYHASH3	0x0000008F
+
 /* Thermal Thresholds Support */
 #define THERM_INT_THRESHOLD0_ENABLE    (1 << 15)
 #define THERM_SHIFT_THRESHOLD0        8
-- 
2.14.1
