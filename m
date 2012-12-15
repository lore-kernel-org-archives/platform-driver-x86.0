From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v4 01/12] msi-laptop: Use proper return codes instead of -1
Date: Sat, 15 Dec 2012 19:31:25 +0200
Message-ID: <1355592696-15454-2-git-send-email-maxtram95@gmail.com>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:62133 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750995Ab2LORcG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Dec 2012 12:32:06 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so1773782eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Dec 2012 09:32:05 -0800 (PST)
In-Reply-To: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Use proper function return codes instead of -1

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/msi-laptop.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 2111dbb..063113c 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -198,7 +198,7 @@ static ssize_t set_device_state(const char *buf, size_t count, u8 mask)
 	/* read current device state */
 	result = ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
 	if (result < 0)
-		return -EINVAL;
+		return result;
 
 	if (!!(rdata & mask) != status) {
 		/* reverse device bit */
@@ -209,7 +209,7 @@ static ssize_t set_device_state(const char *buf, size_t count, u8 mask)
 
 		result = ec_write(MSI_STANDARD_EC_COMMAND_ADDRESS, wdata);
 		if (result < 0)
-			return -EINVAL;
+			return result;
 	}
 
 	return count;
@@ -222,7 +222,7 @@ static int get_wireless_state(int *wlan, int *bluetooth)
 
 	result = ec_transaction(MSI_EC_COMMAND_WIRELESS, &wdata, 1, &rdata, 1);
 	if (result < 0)
-		return -1;
+		return result;
 
 	if (wlan)
 		*wlan = !!(rdata & 8);
@@ -240,7 +240,7 @@ static int get_wireless_state_ec_standard(void)
 
 	result = ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
 	if (result < 0)
-		return -1;
+		return result;
 
 	wlan_s = !!(rdata & MSI_STANDARD_EC_WLAN_MASK);
 
@@ -258,7 +258,7 @@ static int get_threeg_exists(void)
 
 	result = ec_read(MSI_STANDARD_EC_DEVICES_EXISTS_ADDRESS, &rdata);
 	if (result < 0)
-		return -1;
+		return result;
 
 	threeg_exists = !!(rdata & MSI_STANDARD_EC_3G_MASK);
 
@@ -343,7 +343,7 @@ static ssize_t show_threeg(struct device *dev,
 
 	/* old msi ec not support 3G */
 	if (old_ec_model)
-		return -1;
+		return -ENODEV;
 
 	ret = get_wireless_state_ec_standard();
 	if (ret < 0)
-- 
1.8.0.1
