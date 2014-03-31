From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] sonypi: Simplify dependencies
Date: Mon, 31 Mar 2014 15:15:36 +0200
Message-ID: <20140331151536.1d87002e@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48365 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751887AbaCaNPj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 31 Mar 2014 09:15:39 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mattia Dongili <malattia@linux.it>

X86 && !64BIT is better expressed as X86_32.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mattia Dongili <malattia@linux.it>
---
 drivers/char/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.14-rc8.orig/drivers/char/Kconfig	2014-02-17 15:22:14.471631607 +0100
+++ linux-3.14-rc8/drivers/char/Kconfig	2014-03-31 15:07:07.151585507 +0200
@@ -408,7 +408,7 @@ config APPLICOM
 
 config SONYPI
 	tristate "Sony Vaio Programmable I/O Control Device support"
-	depends on X86 && PCI && INPUT && !64BIT
+	depends on X86_32 && PCI && INPUT
 	---help---
 	  This driver enables access to the Sony Programmable I/O Control
 	  Device which can be found in many (all ?) Sony Vaio laptops.


-- 
Jean Delvare
SUSE L3 Support
