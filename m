From: Jan Engelhardt <jengelh@medozas.de>
Subject: [PATCH] x86 plat: limit x86 platform driver menu to X86
Date: Tue,  3 Aug 2010 00:40:10 +0200
Message-ID: <1280788811-10348-1-git-send-email-jengelh@medozas.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from borg.medozas.de ([188.40.89.202]:38317 "EHLO borg.medozas.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753586Ab0HBWkM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 Aug 2010 18:40:12 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: len.brown@intel.com
Cc: platform-driver-x86@vger.kernel.org

My .config contains ACER_WMI=m. On SPARC. That does not make sense.
Restrict the x86 platform driver menu to x86.

Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
---
 drivers/platform/x86/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3e1b8a2..0f3d37a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -5,6 +5,7 @@
 menuconfig X86_PLATFORM_DEVICES
 	bool "X86 Platform Specific Device Drivers"
 	default y
+	depends on X86
 	---help---
 	  Say Y here to get to see options for device drivers for various
 	  x86 platforms, including vendor-specific laptop extension drivers.
-- 
1.7.1
