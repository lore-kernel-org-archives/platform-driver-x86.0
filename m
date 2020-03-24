From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH 23/22] x86/smpboot: Remove the last ICPU() macro
Date: Tue, 24 Mar 2020 19:58:36 +0100
Message-ID: <20200324185836.GI22931@zn.tnic>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200320131345.635023594@linutronix.de>
Sender: linux-crypto-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit
List-Id: platform-driver-x86.vger.kernel.org

---
From: Borislav Petkov <bp@suse.de>

Now all is using the shiny new macros.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index fe3ab9632f3b..3b9bf8c7e29d 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1849,24 +1849,25 @@ static bool slv_set_max_freq_ratio(u64 *base_freq, u64 *turbo_freq)
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 
-#define ICPU(model) \
-	{X86_VENDOR_INTEL, 6, model, X86_FEATURE_APERFMPERF, 0}
+#define X86_MATCH(model)					\
+	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6,		\
+		INTEL_FAM6_##model, X86_FEATURE_APERFMPERF, NULL)
 
 static const struct x86_cpu_id has_knl_turbo_ratio_limits[] = {
-	ICPU(INTEL_FAM6_XEON_PHI_KNL),
-	ICPU(INTEL_FAM6_XEON_PHI_KNM),
+	X86_MATCH(XEON_PHI_KNL),
+	X86_MATCH(XEON_PHI_KNM),
 	{}
 };
 
 static const struct x86_cpu_id has_skx_turbo_ratio_limits[] = {
-	ICPU(INTEL_FAM6_SKYLAKE_X),
+	X86_MATCH(SKYLAKE_X),
 	{}
 };
 
 static const struct x86_cpu_id has_glm_turbo_ratio_limits[] = {
-	ICPU(INTEL_FAM6_ATOM_GOLDMONT),
-	ICPU(INTEL_FAM6_ATOM_GOLDMONT_D),
-	ICPU(INTEL_FAM6_ATOM_GOLDMONT_PLUS),
+	X86_MATCH(ATOM_GOLDMONT),
+	X86_MATCH(ATOM_GOLDMONT_D),
+	X86_MATCH(ATOM_GOLDMONT_PLUS),
 	{}
 };
 
-- 
2.21.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
