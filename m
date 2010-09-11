From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] platform: x86: throw away custom methods
Date: Sat, 11 Sep 2010 16:31:02 +0300
Message-ID: <1284211862-25553-1-git-send-email-andy.shevchenko@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:35205 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751980Ab0IKNbV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 11 Sep 2010 09:31:21 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

In 2.6.35 the hex_to_bin() was introduced.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/wmi.c |   24 ++++++------------------
 1 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index b2978a0..4980682 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -128,30 +128,18 @@ static struct acpi_driver acpi_wmi_driver = {
  */
 static int wmi_parse_hexbyte(const u8 *src)
 {
-	unsigned int x; /* For correct wrapping */
 	int h;
+	int value;
 
 	/* high part */
-	x = src[0];
-	if (x - '0' <= '9' - '0') {
-		h = x - '0';
-	} else if (x - 'a' <= 'f' - 'a') {
-		h = x - 'a' + 10;
-	} else if (x - 'A' <= 'F' - 'A') {
-		h = x - 'A' + 10;
-	} else {
+	h = value = hex_to_bin(src[0]);
+	if (value < 0)
 		return -1;
-	}
-	h <<= 4;
 
 	/* low part */
-	x = src[1];
-	if (x - '0' <= '9' - '0')
-		return h | (x - '0');
-	if (x - 'a' <= 'f' - 'a')
-		return h | (x - 'a' + 10);
-	if (x - 'A' <= 'F' - 'A')
-		return h | (x - 'A' + 10);
+	value = hex_to_bin(src[1]);
+	if (value >= 0)
+		return (h << 4) | value;
 	return -1;
 }
 
-- 
1.7.2.2
