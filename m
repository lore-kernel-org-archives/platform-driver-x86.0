From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Fix USB Sleep and Music always disabled
Date: Wed,  9 Sep 2015 11:25:44 -0600
Message-ID: <1441819545-11619-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:34087 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753371AbbIIRZu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Sep 2015 13:25:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Commit e1a949c1b988 ("toshiba_acpi: Refactor *{get, set} functions return
value") made changes on the return type of the HCI/SCI functions, but a
typo on the USB Sleep and Music code is always reporting non existent
support for such feature.

This patch corrects the typo, changing an assignment to a comparison,
making the laptops with actual support for such feature to work again.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Darren,

Hopefully this patch can go into one of the 4.3 RCs, as the changes are
there and to avoid shipping a broken feature support.

 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 6740c51..c434b53 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -938,7 +938,7 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
 
-	return result = TOS_SUCCESS ? 0 : -EIO;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
-- 
2.5.1
