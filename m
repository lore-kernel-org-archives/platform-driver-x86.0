From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 7/7] sony-laptop: fix a couple signedness bugs
Date: Sat,  9 Jun 2012 13:18:14 +0900
Message-ID: <1339215494-4020-8-git-send-email-malattia@linux.it>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33920 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837Ab2FIESi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jun 2012 00:18:38 -0400
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Mattia Dongili <malattia@linux.it>

From: Dan Carpenter <dan.carpenter@oracle.com>

This needs to be signed to handle negative error codes.
Remove a redundant check, read_limits is always called with a valid
handle.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 6123987..3fc92fa 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2139,7 +2139,7 @@ static ssize_t sony_nc_thermal_mode_show(struct device *dev,
 		struct device_attribute *attr, char *buffer)
 {
 	ssize_t count = 0;
-	unsigned int mode = sony_nc_thermal_mode_get();
+	int mode = sony_nc_thermal_mode_get();
 
 	if (mode < 0)
 		return mode;
@@ -2507,8 +2507,6 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 	props->maxlvl = 0xff;
 
 	offset = sony_find_snc_handle(handle);
-	if (offset < 0)
-		return;
 
 	/* try to read the boundaries from ACPI tables, if we fail the above
 	 * defaults should be reasonable
-- 
1.7.10
