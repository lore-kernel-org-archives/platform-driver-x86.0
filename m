From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] asus-laptop: return proper error for store_ledd if
	write_acpi_int fail
Date: Thu, 08 Jul 2010 13:55:35 +0800
Message-ID: <1278568535.7162.18.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:41733 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873Ab0GHFzX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Jul 2010 01:55:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

In current implementation, store_ledd() does not return error if write_acpi_int
fail.
This patch fixes it by return -ENODEV if write_acpi_int fail.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/asus-laptop.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 93487eb..975751d 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -796,10 +796,11 @@ static ssize_t store_ledd(struct device *dev, struct device_attribute *attr,
 
 	rv = parse_arg(buf, count, &value);
 	if (rv > 0) {
-		if (write_acpi_int(asus->handle, METHOD_LEDD, value))
+		if (write_acpi_int(asus->handle, METHOD_LEDD, value)) {
 			pr_warning("LED display write failed\n");
-		else
-			asus->ledd_status = (u32) value;
+			return -ENODEV;
+		}
+		asus->ledd_status = (u32) value;
 	}
 	return rv;
 }
-- 
1.5.4.3
