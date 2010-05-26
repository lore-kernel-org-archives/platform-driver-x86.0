From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: [PATCH] classmate-laptop: depends on RFKILL or RFKILL=n
Date: Wed, 26 May 2010 12:00:10 -0300
Message-ID: <1274886010-6058-1-git-send-email-cascardo@holoscopio.com>
References: <20100523151540.68e67298.randy.dunlap@oracle.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:47274 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755035Ab0EZPIp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 May 2010 11:08:45 -0400
In-Reply-To: <20100523151540.68e67298.randy.dunlap@oracle.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernelorg
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Randy Dunlap <randy.dunlap@oracle.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Daniel Oliveira Nascimento <don@syst.com.br>

Randy Dunlap has reported that building classmate-laptop fails when
CONFIG_RFKILL=m and CONFIG_ACPI_CMPC=y. He suggested depending on
RFKILL, but, then, it will not be possible to select classmate-laptop
when RFKILL is off. There's no known problem with building and using
classmate-laptop with RFKILL off. So depend on RFKILL or RFKILL=n.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Daniel Oliveira Nascimento <don@syst.com.br>
---
 drivers/platform/x86/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3e1b8a2..fe7d670 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -520,6 +520,7 @@ config TOSHIBA_BT_RFKILL
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
+	depends on RFKILL || RFKILL=n
 	select INPUT
 	select BACKLIGHT_CLASS_DEVICE
 	default n
-- 
1.7.1

