From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 12/12] dell-laptop: Only enable rfkill functionality on laptops with a hw killswitch
Date: Sun, 17 Nov 2013 14:00:27 +0100
Message-ID: <1384693227-5859-13-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:29007 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753972Ab3KQNAx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:53 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

All my testing has been on laptops with a hw killswitch, so to be on the
safe side disable rfkill functionality on models without a hw killswitch for
now. Once we gather some feedback on laptops without a hw killswitch this
decision maybe reconsidered.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index bd67c89..c608b1d 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -580,11 +580,18 @@ static int __init dell_setup_rfkill(void)
 	buffer->input[0] = 0x2;
 	dell_send_request(buffer, 17, 11);
 	hwswitch_state = buffer->output[1];
-	/* If there is no hwswitch, then clear all hw-controlled bits */
-	if (!(status & BIT(0)))
-		hwswitch_state &= ~7;
 	release_buffer();
 
+	if (!(status & BIT(0))) {
+		if (force_rfkill) {
+			/* No hwsitch, clear all hw-controlled bits */
+			hwswitch_state &= ~7;
+		} else {
+			/* rfkill is only tested on laptops with a hwswitch */
+			return 0;
+		}
+	}
+
 	if ((status & (1<<2|1<<8)) == (1<<2|1<<8)) {
 		wifi_rfkill = rfkill_alloc("dell-wifi", &platform_device->dev,
 					   RFKILL_TYPE_WLAN,
-- 
1.8.4.2
