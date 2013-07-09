From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: [PATCH] x86: ce4100: add head file for reboot type
Date: Tue, 9 Jul 2013 11:06:27 +0800 (CST)
Message-ID: <alpine.DEB.2.02.1307091053280.28371@M2420>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1625292718-1373339199=:28371"
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: tglx@linutronix.de, matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, x86@kernel.org, rui.zhang@intel.com, alan@linux.intel.com, ffainelli@freebox.fr, mingo@kernel.org, mbizon@freebox.fr
List-Id: platform-driver-x86.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1625292718-1373339199=:28371
Content-Type: TEXT/PLAIN; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT

From: Xiong Zhou <jencce.kernel@gmail.com>

Add head file for reboot type stuff to fix this:
error: ¡reboot_type¢ undeclared (first use in this function)
error: ¡BOOT_KBD¢ undeclared (first use in this function)

Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>
---
 arch/x86/platform/ce4100/ce4100.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/platform/ce4100/ce4100.c b/arch/x86/platform/ce4100/ce4100.c
index baec704..643b8b5e 100644
--- a/arch/x86/platform/ce4100/ce4100.c
+++ b/arch/x86/platform/ce4100/ce4100.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/serial_reg.h>
 #include <linux/serial_8250.h>
+#include <linux/reboot.h>
 
 #include <asm/ce4100.h>
 #include <asm/prom.h>
--8323328-1625292718-1373339199=:28371--
