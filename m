From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 19/22] ASoC: Intel: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:14:04 +0100
Message-ID: <20200320131510.594671507@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Get rid the of the local macro wrappers for consistency.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/intel/common/soc-intel-quirks.h |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -15,13 +15,11 @@
 #include <asm/intel-family.h>
 #include <asm/iosf_mbi.h>
 
-#define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
-
 #define SOC_INTEL_IS_CPU(soc, type)				\
 static inline bool soc_intel_is_##soc(void)			\
 {								\
 	static const struct x86_cpu_id soc##_cpu_ids[] = {	\
-		ICPU(type),					\
+		X86_MATCH_INTEL_FAM6_MODEL(type, NULL),		\
 		{}						\
 	};							\
 	const struct x86_cpu_id *id;				\
@@ -32,11 +30,11 @@ static inline bool soc_intel_is_##soc(vo
 	return false;						\
 }
 
-SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
-SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
-SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
-SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
-SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_L);
+SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
+SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
+SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
+SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
+SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
 
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
