From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/8] sony-laptop: add some debug printk useful for bug reports
Date: Sat, 19 Feb 2011 11:52:25 +0900
Message-ID: <1298083952-22493-2-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60583
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679Ab1BSDAQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:16 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 5e83370..3aaa92e 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -733,22 +733,30 @@ static int sony_find_snc_handle(int handle)
 
 	for (i = 0x20; i < 0x30; i++) {
 		acpi_callsetfunc(sony_nc_acpi_handle, "SN00", i, &result);
-		if (result == handle)
+		if (result == handle) {
+			dprintk("found handle 0x%.4x (offset: 0x%.2x)\n",
+					handle, i - 0x20);
 			return i-0x20;
+		}
 	}
 
+	dprintk("handle 0x%.4x not found\n", handle);
 	return -1;
 }
 
 static int sony_call_snc_handle(int handle, int argument, int *result)
 {
+	int ret = 0;
 	int offset = sony_find_snc_handle(handle);
 
 	if (offset < 0)
 		return -1;
 
-	return acpi_callsetfunc(sony_nc_acpi_handle, "SN07", offset | argument,
-				result);
+	ret = acpi_callsetfunc(sony_nc_acpi_handle, "SN07", offset | argument,
+			result);
+	dprintk("called SN07 with 0x%.4x (result: 0x%.4x)\n", offset | argument,
+			*result);
+	return ret;
 }
 
 /*
-- 
1.7.2.3
