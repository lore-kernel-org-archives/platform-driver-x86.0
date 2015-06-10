From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] hp_wireless: remove unused header files
Date: Wed, 10 Jun 2015 17:26:27 +0800
Message-ID: <1433928387-2818-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:59677 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933121AbbFJJ0d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 10 Jun 2015 05:26:33 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/hp-wireless.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
index 4e4cc8b..731c69b 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -18,11 +18,8 @@
  *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 
-#include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
 #include <linux/input.h>
-#include <linux/platform_device.h>
 #include <linux/acpi.h>
 #include <acpi/acpi_bus.h>
 
-- 
1.7.9.5
