From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 09/12] dell-laptop: Do not skip setting blocked bit rfkill_set while hw-blocked
Date: Sun, 17 Nov 2013 14:00:24 +0100
Message-ID: <1384693227-5859-10-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51040 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751958Ab3KQNAs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:48 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Instead when hw-blocked always write 1 to the blocked bit for the radio in
question. This is necessary to properly set all the blocked bits for hw-switch
controlled radios to 1 after power-on and resume.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 7f59624..b33b779 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -409,15 +409,14 @@ static int dell_rfkill_set(void *data, bool blocked)
 	dell_send_request(buffer, 17, 11);
 
 	/* If the hardware switch controls this radio, and the hardware
-	   switch is disabled, don't allow changing the software state */
+	   switch is disabled, always disable the radio */
 	if ((hwswitch_state & BIT(hwswitch_bit)) &&
 	    !(buffer->output[1] & BIT(16)))
-		goto out;
+		disable = 1;
 
 	buffer->input[0] = (1 | (radio<<8) | (disable << 16));
 	dell_send_request(buffer, 17, 11);
 
-out:
 	release_buffer();
 	return 0;
 }
-- 
1.8.4.2
