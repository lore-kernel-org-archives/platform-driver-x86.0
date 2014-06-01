From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] platform/x86: Fix run-time dependencies of OLPC drivers
Date: Sun, 1 Jun 2014 22:02:48 +0200
Message-ID: <20140601220248.40e05438@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60540 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752560AbaFAUCx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 16:02:53 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <matthew.garrett@nebula.com>

Let the xo15-ebook driver depend on OLPC as all other OLPC drivers
already do. Add COMPILE_TEST as an alternative for both xo1-rfkill
and xo15-ebook, to increase the build testing coverage.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-3.15-rc7.orig/drivers/platform/x86/Kconfig	2014-06-01 14:51:20.764590550 +0200
+++ linux-3.15-rc7/drivers/platform/x86/Kconfig	2014-06-01 15:39:41.048869044 +0200
@@ -724,7 +724,7 @@ config IBM_RTL
 
 config XO1_RFKILL
 	tristate "OLPC XO-1 software RF kill switch"
-	depends on OLPC
+	depends on OLPC || COMPILE_TEST
 	depends on RFKILL
 	---help---
 	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
@@ -732,6 +732,7 @@ config XO1_RFKILL
 
 config XO15_EBOOK
 	tristate "OLPC XO-1.5 ebook switch"
+	depends on OLPC || COMPILE_TEST
 	depends on ACPI && INPUT
 	---help---
 	  Support for the ebook switch on the OLPC XO-1.5 laptop.


-- 
Jean Delvare
SUSE L3 Support
