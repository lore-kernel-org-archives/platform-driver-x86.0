From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] asus-laptop: fix a memory leak in asus_laptop_get_info
	error path
Date: Tue, 29 Jun 2010 11:09:47 +0800
Message-ID: <1277780987.5478.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:56384 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab0F2DHc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Jun 2010 23:07:32 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

The callers of write_acpi_int_ret() pass ACPI_ALLOCATE_BUFFER,
the caller must kfree the returned buffer if AE_OK is returned.

This patch adds a missing kfree(buffer.pointer) before return -ENOMEM
if kstrdup fail.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/asus-laptop.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 71db2ef..3d76c6a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1397,8 +1397,10 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 		}
 	}
 	asus->name = kstrdup(string, GFP_KERNEL);
-	if (!asus->name)
+	if (!asus->name) {
+		kfree(buffer.pointer);
 		return -ENOMEM;
+	}
 
 	if (*string)
 		pr_notice("  %s model detected\n", string);
-- 
1.5.4.3
