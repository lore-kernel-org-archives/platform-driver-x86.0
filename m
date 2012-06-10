From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 3/7 v2] sony-laptop: store battery care limits on batteries
Date: Mon, 11 Jun 2012 07:18:31 +0900
Message-ID: <1339366711-5773-1-git-send-email-malattia@linux.it>
References: <1339215494-4020-4-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:40232 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803Ab2FJWSn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Jun 2012 18:18:43 -0400
In-Reply-To: <1339215494-4020-4-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Some models offer the option to store the limits on the battery
(firmware?).

Signed-off-by: Mattia Dongili <malattia@linux.it>
---

Hi Matthew,
please ignore the previous one as it had a bug, this one is good.
Thanks!

---
 drivers/platform/x86/sony-laptop.c |   41 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 4f42e56..f045e3e 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1916,32 +1916,33 @@ static ssize_t sony_nc_battery_care_limit_store(struct device *dev,
 	 *  bits 4,5: store the limit into the EC
 	 *  bits 6,7: store the limit into the battery
 	 */
+	cmd = 0;
 
-	/*
-	 * handle 0x0115 should allow storing on battery too;
-	 * handle 0x0136 same as 0x0115 + health status;
-	 * handle 0x013f, same as 0x0136 but no storing on the battery
-	 *
-	 * Store only inside the EC for now, regardless the handle number
-	 */
-	if (value == 0)
-		/* disable limits */
-		cmd = 0x0;
+	if (value > 0) {
+		if (value <= 50)
+			cmd = 0x20;
 
-	else if (value <= 50)
-		cmd = 0x21;
+		else if (value <= 80)
+			cmd = 0x10;
 
-	else if (value <= 80)
-		cmd = 0x11;
+		else if (value <= 100)
+			cmd = 0x30;
+
+		else
+			return -EINVAL;
 
-	else if (value <= 100)
-		cmd = 0x31;
+		/*
+		 * handle 0x0115 should allow storing on battery too;
+		 * handle 0x0136 same as 0x0115 + health status;
+		 * handle 0x013f, same as 0x0136 but no storing on the battery
+		 */
+		if (bcare_ctl->handle != 0x013f)
+			cmd = cmd | (cmd << 2);
 
-	else
-		return -EINVAL;
+		cmd = (cmd | 0x1) << 0x10;
+	}
 
-	if (sony_call_snc_handle(bcare_ctl->handle, (cmd << 0x10) | 0x0100,
-				&result))
+	if (sony_call_snc_handle(bcare_ctl->handle, cmd | 0x0100, &result))
 		return -EIO;
 
 	return count;
-- 
1.7.10
