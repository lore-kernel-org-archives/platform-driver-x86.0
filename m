From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/1] toshiba_acpi: Add 0x prefix to available_kbd_modes_show funtion
Date: Wed,  9 Sep 2015 11:30:09 -0600
Message-ID: <1441819810-11762-2-git-send-email-coproscefalo@gmail.com>
References: <1441819810-11762-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33941 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbbIIRaQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Sep 2015 13:30:16 -0400
In-Reply-To: <1441819810-11762-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds the 0x prefix to the values printed by such function, the
values are already being printed in hex, but without the prefix, causing
confussion, even though the file under Documentation/ABI clearly states
that hey are hex values.

Simply add the 0x prefix to avoid such confussion.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 9f7ced1..50a2116 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1669,10 +1669,10 @@ static ssize_t available_kbd_modes_show(struct device *dev,
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 
 	if (toshiba->kbd_type == 1)
-		return sprintf(buf, "%x %x\n",
+		return sprintf(buf, "0x%x 0x%x\n",
 			       SCI_KBD_MODE_FNZ, SCI_KBD_MODE_AUTO);
 
-	return sprintf(buf, "%x %x %x\n",
+	return sprintf(buf, "0x%x 0x%x 0x%x\n",
 		       SCI_KBD_MODE_AUTO, SCI_KBD_MODE_ON, SCI_KBD_MODE_OFF);
 }
 static DEVICE_ATTR_RO(available_kbd_modes);
-- 
2.5.1
