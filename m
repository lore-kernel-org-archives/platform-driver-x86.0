From: Jean Delvare <khali@linux-fr.org>
Subject: [PATCH] acerhdf: Drop pointless dependency on THERMAL_HWMON
Date: Sun, 24 Apr 2011 11:00:08 +0200
Message-ID: <20110424110008.439dd333@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:15099 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755834Ab1DXJAU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 24 Apr 2011 05:00:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Feuerer <peter@piie.net>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Guenter Roeck <guenter.roeck@ericsson.com>

The THERMAL_HWMON config option simply exposes the thermal zone
temperature values and limits to user-space. It makes no sense for a
kernel driver to depend on this.

Signed-off-by: Jean Delvare <khali@linux-fr.org>
Cc: Peter Feuerer <peter@piie.net>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.39-rc4.orig/drivers/platform/x86/Kconfig	2011-04-22 18:53:05.000000000 +0200
+++ linux-2.6.39-rc4/drivers/platform/x86/Kconfig	2011-04-24 10:46:59.000000000 +0200
@@ -39,7 +39,7 @@ config ACER_WMI
 
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
-	depends on THERMAL && THERMAL_HWMON && ACPI
+	depends on THERMAL && ACPI
 	---help---
 	  This is a driver for Acer Aspire One netbooks. It allows to access
 	  the temperature sensor and to control the fan.


-- 
Jean Delvare
