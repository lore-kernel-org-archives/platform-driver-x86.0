From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 3/3] asus-laptop: fix gps rfkill
Date: Tue, 24 Aug 2010 09:30:46 +0200
Message-ID: <1282635046-6366-3-git-send-email-corentincj@iksaif.net>
References: <1282635046-6366-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:55241 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172Ab0HXHfA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Aug 2010 03:35:00 -0400
Received: from relay2-v.mail.gandi.net (relay2-v.mail.gandi.net [217.70.178.76])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id EC515867B2
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Aug 2010 09:31:17 +0200 (CEST)
In-Reply-To: <1282635046-6366-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentincj@iksaif.net>, stable@kernel.org

The GPS rfkill crappy code. The ops_data argument wasn't
set, and was totally misused. The fix have been tested
on an Asus R2H.

Cc: stable@kernel.org
Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/asus-laptop.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 27298a4..67d9228 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1066,9 +1066,9 @@ static ssize_t store_gps(struct device *dev, struct device_attribute *attr,
  */
 static int asus_gps_rfkill_set(void *data, bool blocked)
 {
-	acpi_handle handle = data;
+	struct asus_laptop *asus = data;
 
-	return asus_gps_switch(handle, !blocked);
+	return asus_gps_switch(asus, !blocked);
 }
 
 static const struct rfkill_ops asus_gps_rfkill_ops = {
@@ -1095,7 +1095,7 @@ static int asus_rfkill_init(struct asus_laptop *asus)
 
 	asus->gps_rfkill = rfkill_alloc("asus-gps", &asus->platform_device->dev,
 					RFKILL_TYPE_GPS,
-					&asus_gps_rfkill_ops, NULL);
+					&asus_gps_rfkill_ops, asus);
 	if (!asus->gps_rfkill)
 		return -EINVAL;
 
-- 
1.7.1
