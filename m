From: Rafi Rubin <rafi@seas.upenn.edu>
Subject: [PATCH] Trivial: dell-wmi-aio Kconfig typo
Date: Sun, 15 May 2011 23:33:23 -0400
Message-ID: <1305516803-10271-1-git-send-email-rafi@seas.upenn.edu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from talbot.seas.upenn.edu ([158.130.67.217]:58045 "EHLO
	talbot.seas.upenn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756011Ab1EPDmY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 15 May 2011 23:42:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: colin.king@canonical.com, platform-driver-x86@vger.kernel.org
Cc: trivial@kernel.org, Rafi Rubin <rafi@seas.upenn.edu>

Signed-off-by: Rafi Rubin <rafi@seas.upenn.edu>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0485e39..485c09e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -111,7 +111,7 @@ config DELL_WMI_AIO
 	  All-In-One machines.
 
 	  To compile this driver as a module, choose M here: the module will
-	  be called dell-wmi.
+	  be called dell-wmi-aio.
 
 
 config FUJITSU_LAPTOP
-- 
1.7.5.1
