From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: [PATCH v2 04/12] x86/kprobes: Explicitly include vmalloc.h for set_vm_flush_reset_perms()
Date: Tue, 26 Nov 2019 08:54:09 -0800
Message-ID: <20191126165417.22423-5-sean.j.christopherson@intel.com>
References: <20191126165417.22423-1-sean.j.christopherson@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191126165417.22423-1-sean.j.christopherson@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "VMware, Inc." <pv-drivers@vmware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis
List-Id: platform-driver-x86.vger.kernel.org

The inclusion of linux/vmalloc.h, which is required for its definition
of set_vm_flush_reset_perms(), is somehow dependent on asm/realmode.h
being included by asm/acpi.h.  Explicitly include linux/vmalloc.h so
that a future patch can drop the realmode.h include from asm/acpi.h
without breaking the build.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
---
 arch/x86/kernel/kprobes/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 43fc13c831af..e7d4c89c9aba 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -40,6 +40,7 @@
 #include <linux/frame.h>
 #include <linux/kasan.h>
 #include <linux/moduleloader.h>
+#include <linux/vmalloc.h>
 
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
-- 
2.24.0
