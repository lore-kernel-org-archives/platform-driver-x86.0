From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] compal-laptop: depends on POWER_SUPPLY
Date: Fri, 23 Jul 2010 09:41:34 -0700
Message-ID: <20100723094134.10c86761.randy.dunlap@oracle.com>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20100723164931.7bf2160f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Matthew Garrett <mjg@redhat.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

compal-laptop uses power_supply interfaces so it should depend
on POWER_SUPPLY.

ERROR: "power_supply_register" [drivers/platform/x86/compal-laptop.ko] undefined!
ERROR: "power_supply_unregister" [drivers/platform/x86/compal-laptop.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Cezary Jackiewicz <cezary.jackiewicz@gmail.com>
Cc:	Matthew Garrett <mjg@redhat.com>
Cc:	platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100723.orig/drivers/platform/x86/Kconfig
+++ linux-next-20100723/drivers/platform/x86/Kconfig
@@ -183,6 +183,7 @@ config COMPAL_LAPTOP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL
 	depends on HWMON
+	depends on POWER_SUPPLY
 	---help---
 	  This is a driver for laptops built by Compal:
 
