From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 1/2] asus_acpi: fix a memory leask in asus_hotk_get_info
Date: Mon, 05 Jul 2010 08:53:01 +0800
Message-ID: <1278291181.12801.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:50434 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755016Ab0GEAxD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Jul 2010 20:53:03 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Karol Kozimor <sziwan@users.sourceforge.net>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

In the case of no match ( hotk->model == END_MODEL ), model sholud be
kfreed before return AE_OK.
This patch includes below fixes:
1. adds a missing kfree(model) before return AE_OK.
2. asus_hotk_get_info should return int, thus return 0 instead of AE_OK.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/asus_acpi.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus_acpi.c b/drivers/platform/x86/asus_acpi.c
index 92fd30c..ae0914d 100644
--- a/drivers/platform/x86/asus_acpi.c
+++ b/drivers/platform/x86/asus_acpi.c
@@ -1340,7 +1340,8 @@ static int asus_hotk_get_info(void)
 			return -ENODEV;
 		}
 		hotk->methods = &model_conf[hotk->model];
-		return AE_OK;
+		kfree(model);
+		return 0;
 	}
 	hotk->methods = &model_conf[hotk->model];
 	printk(KERN_NOTICE "  %s model detected, supported\n", string);
@@ -1374,7 +1375,7 @@ static int asus_hotk_get_info(void)
 
 	kfree(model);
 
-	return AE_OK;
+	return 0;
 }
 
 static int asus_hotk_check(void)
-- 
1.5.4.3
