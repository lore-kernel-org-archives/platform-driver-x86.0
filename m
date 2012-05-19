From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 09/19] sony-laptop: adjust error handling in finding SNC handles
Date: Sat, 19 May 2012 22:35:52 +0900
Message-ID: <1337434562-12283-10-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47648 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757349Ab2ESNpN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:13 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

All handles must be greater than 0, also return more meaningful error
codes on invalid conditions.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index c3f54ad..2b72e47 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -870,8 +870,8 @@ static int sony_find_snc_handle(int handle)
 	int i;
 
 	/* not initialized yet, return early */
-	if (!handles)
-		return -1;
+	if (!handles || !handle)
+		return -EINVAL;
 
 	for (i = 0; i < 0x10; i++) {
 		if (handles->cap[i] == handle) {
@@ -881,7 +881,7 @@ static int sony_find_snc_handle(int handle)
 		}
 	}
 	dprintk("handle 0x%.4x not found\n", handle);
-	return -1;
+	return -EINVAL;
 }
 
 static int sony_call_snc_handle(int handle, int argument, int *result)
@@ -890,7 +890,7 @@ static int sony_call_snc_handle(int handle, int argument, int *result)
 	int offset = sony_find_snc_handle(handle);
 
 	if (offset < 0)
-		return -1;
+		return offset;
 
 	arg = offset | argument;
 	ret = sony_nc_int_call(sony_nc_acpi_handle, "SN07", &arg, result);
-- 
1.7.10
