From: Jean Delvare <khali@linux-fr.org>
Subject: [PATCH] acerhdf: Clean up includes
Date: Sun, 24 Apr 2011 18:07:55 +0200
Message-ID: <20110424180755.7c1759ff@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:32250 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757563Ab1DXQII (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 24 Apr 2011 12:08:08 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Feuerer <peter@piie.net>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

* The acerhdf driver isn't an ACPI driver, so it needs not include
  <acpi/acpi_drivers.h>. All it uses is ec_read() and ec_write(), for
  which <linux/acpi.h> is sufficient.
* I couldn't find any reason why <linux/fs.h> and <linux/sched.h> were
  included.

This should avoid unneeded rebuilds of the acerhdf driver.

Signed-off-by: Jean Delvare <khali@linux-fr.org>
Cc: Peter Feuerer <peter@piie.net>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/acerhdf.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.39-rc4.orig/drivers/platform/x86/acerhdf.c	2011-04-24 14:06:32.000000000 +0200
+++ linux-2.6.39-rc4/drivers/platform/x86/acerhdf.c	2011-04-24 17:56:28.000000000 +0200
@@ -35,10 +35,8 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/fs.h>
 #include <linux/dmi.h>
-#include <acpi/acpi_drivers.h>
-#include <linux/sched.h>
+#include <linux/acpi.h>
 #include <linux/thermal.h>
 #include <linux/platform_device.h>
 

-- 
Jean Delvare
