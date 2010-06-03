From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] classmate-laptop: fix for RFKILL=m, CMPC=y
Date: Thu, 3 Jun 2010 09:39:03 -0700
Message-ID: <20100603093903.d9378c9a.randy.dunlap@oracle.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20100603134753.710a64b3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Daniel Oliveira Nascimento <don@syst.com.br>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build error when CONFIG_RFKILL=m and CONFIG_ACPI_CMPC=y:
classmate-laptop should depend on RFKILL or RFKILL=n.

classmate-laptop.c:(.text+0x1351fc): undefined reference to `rfkill_unregister'
classmate-laptop.c:(.text+0x135204): undefined reference to `rfkill_destroy'
classmate-laptop.c:(.text+0x135237): undefined reference to `rfkill_set_sw_state'
classmate-laptop.c:(.text+0x1352b9): undefined reference to `rfkill_alloc'
classmate-laptop.c:(.text+0x1352ca): undefined reference to `rfkill_register'
classmate-laptop.c:(.text+0x1352d6): undefined reference to `rfkill_destroy'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100603.orig/drivers/platform/x86/Kconfig
+++ linux-next-20100603/drivers/platform/x86/Kconfig
@@ -520,6 +520,7 @@ config TOSHIBA_BT_RFKILL
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
+	depends on RFKILL || RFKILL=n
 	select INPUT
 	select BACKLIGHT_CLASS_DEVICE
 	default n
