From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] firmware: dcdbas: include linux/io.h
Date: Tue,  2 Oct 2018 23:16:42 +0200
Message-ID: <20181002211651.2804717-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

memremap() is declared in linux/io.h, not in asm/io.h, so we should
include that header to avoid build errors:

drivers/platform/x86/dcdbas.c: In function 'dcdbas_check_wsmt':
drivers/platform/x86/dcdbas.c:572:15: error: implicit declaration of function 'memremap'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
  eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
               ^~~~~~~~
               ioremap
drivers/platform/x86/dcdbas.c:572:61: error: 'MEMREMAP_WB' undeclared (first use in this function)
  eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
                                                             ^~~~~~~~~~~
drivers/platform/x86/dcdbas.c:572:61: note: each undeclared identifier is reported only once for each function it appears in
drivers/platform/x86/dcdbas.c: In function 'dcdbas_exit':
drivers/platform/x86/dcdbas.c:748:3: error: implicit declaration of function 'memunmap'; did you mean 'vm_munmap'? [-Werror=implicit-function-declaration]

Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/dcdbas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dcdbas.c b/drivers/platform/x86/dcdbas.c
index ae28e48ff7dc..daa7e3574568 100644
--- a/drivers/platform/x86/dcdbas.c
+++ b/drivers/platform/x86/dcdbas.c
@@ -37,7 +37,7 @@
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/mutex.h>
-#include <asm/io.h>
+#include <linux/io.h>
 
 #include "dcdbas.h"
 
-- 
2.18.0
