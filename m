From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] platform/x86: msi-laptop depends on SERIO_I8042
Date: Sun, 23 May 2010 16:33:17 -0700
Message-ID: <20100523163317.d1224414.randy.dunlap@oracle.com>
References: <20100522170459.4c89723d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100522170459.4c89723d.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lennart Poettering <mzxreary@0pointer.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

msi-laptop uses i8042_*() interfaces, so it should depend on
SERIO_I8042.  E.g., when SERIO_I8042=m and MSI_LAPTOP=y:

msi-laptop.c:(.text+0x18a7fe): undefined reference to `i8042_install_filter'
msi-laptop.c:(.init.text+0xd69d): undefined reference to `i8042_remove_filter'
msi-laptop.c:(.exit.text+0x19c3): undefined reference to `i8042_remove_filter'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Lennart Poettering <mzxreary@0pointer.de>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100522.orig/drivers/platform/x86/Kconfig
+++ linux-next-20100522/drivers/platform/x86/Kconfig
@@ -151,6 +151,7 @@ config MSI_LAPTOP
 	depends on ACPI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
+	depends on SERIO_I8042
 	---help---
 	  This is a driver for laptops built by MSI (MICRO-STAR
 	  INTERNATIONAL):
