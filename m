From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 10/12] dell-laptop: Wait less long before updating rfkill after an rfkill keypress
Date: Sun, 17 Nov 2013 14:00:25 +0100
Message-ID: <1384693227-5859-11-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35301 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753967Ab3KQNAt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:49 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Some time is needed for the BIOS to do its work, but 250ms should be plenty.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index b33b779..fe20f67 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -759,7 +759,7 @@ static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 		switch (data) {
 		case 0x8:
 			schedule_delayed_work(&dell_rfkill_work,
-					      round_jiffies_relative(HZ));
+					      round_jiffies_relative(HZ / 4));
 			break;
 		}
 		extended = false;
-- 
1.8.4.2
