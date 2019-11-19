From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [PATCH 02/12] x86/boot: Explicitly include realmode.h to handle RM reservations
Date: Mon, 18 Nov 2019 16:21:11 -0800
Message-ID: <20191119002121.4107-3-sean.j.christopherson@intel.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119002121.4107-1-sean.j.christopherson@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <namit@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis Bossart <pierre>
List-Id: platform-driver-x86.vger.kernel.org

Explicitly include asm/realmode.h, which provides reserve_real_mode(),
instead of picking it up by an indirect include of asm/acpi.h.  acpi.h
will soon stop including realmode.h so that changing realmode.h doesn't
require a full kernel rebuild.

Fixes: c1877650f3c9 ("x86/setup: Clean up the header portion of setup.c")
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/x86/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 559764a4af5f..b6d7301b1037 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -33,6 +33,7 @@
 #include <asm/kaslr.h>
 #include <asm/mce.h>
 #include <asm/mtrr.h>
+#include <asm/realmode.h>
 #include <asm/olpc_ofw.h>
 #include <asm/pci-direct.h>
 #include <asm/prom.h>
-- 
2.24.0
