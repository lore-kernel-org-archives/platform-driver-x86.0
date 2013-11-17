From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 07/12] dell-laptop: Allow changing the sw_state while the radio is blocked by hw
Date: Sun, 17 Nov 2013 14:00:22 +0100
Message-ID: <1384693227-5859-8-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39960 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751958Ab3KQNAo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:44 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

This makes dell-laptop's rfkill code consistent with other drivers which
allow sw_state changes while hw blocked.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 80de0cc..834f499 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -404,7 +404,6 @@ static int dell_rfkill_set(void *data, bool blocked)
 	int disable = blocked ? 1 : 0;
 	unsigned long radio = (unsigned long)data;
 	int hwswitch_bit = (unsigned long)data - 1;
-	int ret = 0;
 
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
@@ -412,17 +411,15 @@ static int dell_rfkill_set(void *data, bool blocked)
 	/* If the hardware switch controls this radio, and the hardware
 	   switch is disabled, don't allow changing the software state */
 	if ((hwswitch_state & BIT(hwswitch_bit)) &&
-	    !(buffer->output[1] & BIT(16))) {
-		ret = -EINVAL;
+	    !(buffer->output[1] & BIT(16)))
 		goto out;
-	}
 
 	buffer->input[0] = (1 | (radio<<8) | (disable << 16));
 	dell_send_request(buffer, 17, 11);
 
 out:
 	release_buffer();
-	return ret;
+	return 0;
 }
 
 static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
-- 
1.8.4.2
