From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86/toshiba_acpi.c: fix defined but not used build
 warnings
Date: Fri, 6 Jul 2018 20:53:09 -0700
Message-ID: <59774e7f-103c-70b1-11bf-b2af16947dc8@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix a build warning in toshiba_acpi.c when CONFIG_PROC_FS is not enabled
by marking the unused function as __maybe_unused.

../drivers/platform/x86/toshiba_acpi.c:1685:12: warning: 'version_proc_show' defined but not used [-Wunused-function]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
---
 drivers/platform/x86/toshiba_acpi.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20180706.orig/drivers/platform/x86/toshiba_acpi.c
+++ linux-next-20180706/drivers/platform/x86/toshiba_acpi.c
@@ -34,6 +34,7 @@
 #define TOSHIBA_ACPI_VERSION	"0.24"
 #define PROC_INTERFACE_VERSION	1
 
+#include <linux/compiler.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -1682,7 +1683,7 @@ static const struct file_operations keys
 	.write		= keys_proc_write,
 };
 
-static int version_proc_show(struct seq_file *m, void *v)
+static int __maybe_unused version_proc_show(struct seq_file *m, void *v)
 {
 	seq_printf(m, "driver:                  %s\n", TOSHIBA_ACPI_VERSION);
 	seq_printf(m, "proc_interface:          %d\n", PROC_INTERFACE_VERSION);
