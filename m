From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH] ideapad-laptop: Depend on BACKLIGHT_CLASS_DEVICE instead of selecting it
Date: Mon, 25 Feb 2013 17:01:57 -0500
Message-ID: <1361829717-32058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:47200 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758606Ab3BYWCK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Feb 2013 17:02:10 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ike.pan@canonical.com, Matthew Garrett <matthew.garrett@nebula.com>

Selecting BACKLIGHT_CLASS_DEVICE doesn't guarantee that any of its
dependencies are enabled, and these are complicated. Depending isn't ideal
for configuration UI purposes, but is probably more appropriate here.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 242c524..3338437 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -299,8 +299,8 @@ config IDEAPAD_LAPTOP
 	depends on ACPI
 	depends on RFKILL && INPUT
 	depends on SERIO_I8042
+	depends on BACKLIGHT_CLASS_DEVICE
 	select INPUT_SPARSEKMAP
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
-- 
1.8.1.2
