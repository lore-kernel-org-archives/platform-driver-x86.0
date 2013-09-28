From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 07/10] dell-laptop: Allow changing the sw_state while the radio is blocked by hw
Date: Sat, 28 Sep 2013 21:26:36 +0200
Message-ID: <1380396399-3889-8-git-send-email-hdegoede@redhat.com>
References: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:21679 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754991Ab3I1T0y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Sep 2013 15:26:54 -0400
In-Reply-To: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>

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
1.8.3.1
