From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 22/22] x86/cpu: Cleanup the now unused CPU match macros
Date: Fri, 20 Mar 2020 14:14:07 +0100
Message-ID: <20200320131510.900226233@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Chanw
List-Id: platform-driver-x86.vger.kernel.org

No more users.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/cpu_device_id.h |    3 ---
 arch/x86/include/asm/intel-family.h  |   13 -------------
 2 files changed, 16 deletions(-)

--- a/arch/x86/include/asm/cpu_device_id.h
+++ b/arch/x86/include/asm/cpu_device_id.h
@@ -89,9 +89,6 @@
 #define X86_MATCH_FEATURE(feature, data)				\
 	X86_MATCH_VENDOR_FEATURE(ANY, feature, data)
 
-/* Transitional to keep the existing code working */
-#define X86_FEATURE_MATCH(feature)	X86_MATCH_FEATURE(feature, NULL)
-
 /**
  * X86_MATCH_VENDOR_FAM_MODEL - Match vendor, family and model
  * @vendor:	The vendor name, e.g. INTEL, AMD, HYGON, ..., ANY
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -124,17 +124,4 @@
 /* Family 5 */
 #define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
 
-/* Useful macros */
-#define INTEL_CPU_FAM_ANY(_family, _model, _driver_data)	\
-{								\
-	.vendor		= X86_VENDOR_INTEL,			\
-	.family		= _family,				\
-	.model		= _model,				\
-	.feature	= X86_FEATURE_ANY,			\
-	.driver_data	= (kernel_ulong_t)&_driver_data		\
-}
-
-#define INTEL_CPU_FAM6(_model, _driver_data)			\
-	INTEL_CPU_FAM_ANY(6, INTEL_FAM6_##_model, _driver_data)
-
 #endif /* _ASM_X86_INTEL_FAMILY_H */
