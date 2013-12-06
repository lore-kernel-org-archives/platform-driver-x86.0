From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] dell-laptop: rkill whitelist Precision models
Date: Fri,  6 Dec 2013 12:17:27 +0100
Message-ID: <1386328647-7319-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56671 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753985Ab3LFLRq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Dec 2013 06:17:46 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Calum Lind <calumlind@gmail.com>, Hans de Goede <hdegoede@redhat.com>

Given that Precision mobile workstations are top of the line Dell products,
I expect the functionality of rfkill there to be as reliable as on Latitudes
so whitelist Precisions.

https://bugzilla.kernel.org/show_bug.cgi?id=65731

Reported-by: Calum Lind <calumlind@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index c608b1d..529147f 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -562,16 +562,19 @@ static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
 
 static int __init dell_setup_rfkill(void)
 {
-	int status;
-	int ret;
+	int status, ret, whitelisted;
 	const char *product;
 
 	/*
-	 * rfkill causes trouble on various non Latitudes, according to Dell
-	 * actually testing the rfkill functionality is only done on Latitudes.
+	 * rfkill support causes trouble on various models, mostly Inspirons.
+	 * So we whitelist certain series, and don't support rfkill on others.
 	 */
+	whitelisted = 0;
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (!force_rfkill && (!product || strncmp(product, "Latitude", 8)))
+	if (product &&  (strncmp(product, "Latitude", 8) == 0 ||
+			 strncmp(product, "Precision", 9) == 0))
+		whitelisted = 1;
+	if (!force_rfkill && !whitelisted)
 		return 0;
 
 	get_buffer();
-- 
1.8.4.2
