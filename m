From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 03/10] dell-laptop: If there is no hwswitch, then clear all hw-controlled bits
Date: Sat, 28 Sep 2013 21:26:32 +0200
Message-ID: <1380396399-3889-4-git-send-email-hdegoede@redhat.com>
References: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35486 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754947Ab3I1T0s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Sep 2013 15:26:48 -0400
In-Reply-To: <1380396399-3889-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>

To ensure we don't enter any hw-switch related code paths on machines without
a hw-switch.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index bae932b..48fabf6 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -548,6 +548,9 @@ static int __init dell_setup_rfkill(void)
 	buffer->input[0] = 0x2;
 	dell_send_request(buffer, 17, 11);
 	hwswitch_state = buffer->output[1];
+	/* If there is no hwswitch, then clear all hw-controlled bits */
+	if (!(status & BIT(0)))
+		hwswitch_state &= ~7;
 	release_buffer();
 
 	if ((status & (1<<2|1<<8)) == (1<<2|1<<8)) {
-- 
1.8.3.1
