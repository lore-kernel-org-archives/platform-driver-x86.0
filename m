From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [PATCH v2 12/12] x86/ACPI/sleep: Move acpi_get_wakeup_address() into sleep.c, remove <asm/realmode.h> from <asm/acpi.h>
Date: Tue, 26 Nov 2019 08:54:17 -0800
Message-ID: <20191126165417.22423-13-sean.j.christopherson@intel.com>
References: <20191126165417.22423-1-sean.j.christopherson@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191126165417.22423-1-sean.j.christopherson@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "VMware, Inc." <pv-drivers@vmware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis
List-Id: platform-driver-x86.vger.kernel.org

Move the definition of acpi_get_wakeup_address() into sleep.c to break
linux/acpi.h's dependency (by way of asm/acpi.h) on asm/realmode.h.
Everyone and their mother includes linux/acpi.h, i.e. modifying
realmode.h results in a full kernel rebuild, which makes the already
inscrutable real mode boot code even more difficult to understand and is
positively rage inducing when trying to make changes to x86's boot flow.

No functional change intended.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/x86/include/asm/acpi.h  |  6 +-----
 arch/x86/kernel/acpi/sleep.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index 23ffafd927a1..ca0976456a6b 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -13,7 +13,6 @@
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mpspec.h>
-#include <asm/realmode.h>
 #include <asm/x86_init.h>
 
 #ifdef CONFIG_ACPI_APEI
@@ -62,10 +61,7 @@ static inline void acpi_disable_pci(void)
 extern int (*acpi_suspend_lowlevel)(void);
 
 /* Physical address to resume after wakeup */
-static inline unsigned long acpi_get_wakeup_address(void)
-{
-	return ((unsigned long)(real_mode_header->wakeup_start));
-}
+unsigned long acpi_get_wakeup_address(void);
 
 /*
  * Check if the CPU can handle C2 and deeper
diff --git a/arch/x86/kernel/acpi/sleep.c b/arch/x86/kernel/acpi/sleep.c
index ca13851f0570..26b7256f590f 100644
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -26,6 +26,17 @@ unsigned long acpi_realmode_flags;
 static char temp_stack[4096];
 #endif
 
+/**
+ * acpi_get_wakeup_address - provide physical address for S3 wakeup
+ *
+ * Returns the physical address where the kernel should be resumed after the
+ * system awakes from S3, e.g. for programming into the firmware waking vector.
+ */
+unsigned long acpi_get_wakeup_address(void)
+{
+	return ((unsigned long)(real_mode_header->wakeup_start));
+}
+
 /**
  * x86_acpi_enter_sleep_state - enter sleep state
  * @state: Sleep state to enter.
-- 
2.24.0
