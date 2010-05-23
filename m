From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] x86/platform: classmate-laptop depends on RFKILL
Date: Sun, 23 May 2010 15:15:40 -0700
Message-ID: <20100523151540.68e67298.randy.dunlap@oracle.com>
References: <20100522170459.4c89723d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20100522170459.4c89723d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, platform-driver-x86@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Daniel Oliveira Nascimento <don@syst.com.br>, Matthew Garrett <mjg@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

classmate-laptop uses rfkill interfaces, so it should depend on
RFKILL.  Otherwise, when CONFIG_RFKILL=m, these build errors happen:

classmate-laptop.c:(.text+0x54b4f2): undefined reference to `rfkill_unregister'
classmate-laptop.c:(.text+0x54b508): undefined reference to `rfkill_destroy'
classmate-laptop.c:(.text+0x54b71a): undefined reference to `rfkill_alloc'
classmate-laptop.c:(.text+0x54b739): undefined reference to `rfkill_register'
classmate-laptop.c:(.text+0x54b761): undefined reference to `rfkill_destroy'
classmate-laptop.c:(.text+0x54b841): undefined reference to `rfkill_set_sw_state'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc:	Daniel Oliveira Nascimento <don@syst.com.br>
Cc:	platform-driver-x86@vger.kernel.org
Cc:	Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100522.orig/drivers/platform/x86/Kconfig
+++ linux-next-20100522/drivers/platform/x86/Kconfig
@@ -520,6 +520,7 @@ config TOSHIBA_BT_RFKILL
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
+	depends on RFKILL
 	select INPUT
 	select BACKLIGHT_CLASS_DEVICE
 	default n
