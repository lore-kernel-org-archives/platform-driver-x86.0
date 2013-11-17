From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 06/12] dell-laptop: Don't read-back sw_state on machines with a hardware switch
Date: Sun, 17 Nov 2013 14:00:21 +0100
Message-ID: <1384693227-5859-7-git-send-email-hdegoede@redhat.com>
References: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49764 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751520Ab3KQNAm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Nov 2013 08:00:42 -0500
In-Reply-To: <1384693227-5859-1-git-send-email-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

On machines with a hardware switch, the blocking settings can not be changed
through a Fn + wireless-key combo, so there is no reason to read back the
blocking state from the BIOS.

Reading back is not only not necessary it is actually harmful, since on some
machines the blocking state will be cleared to all 0 after a wireless switch
toggle, even for radios not controlled by the hw-switch (yeah firmware bugs).

This causes "magic" changes to the sw_state. This is inconsistent with other
rfkill drivers which preserve the sw_state over a hw kill on / off.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 7f47396..80de0cc 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -428,7 +428,10 @@ out:
 static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
 					int status)
 {
-	rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
+	if (!(status & BIT(0))) {
+		/* No hw-switch, sync BIOS state to sw_state */
+		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
+	}
 }
 
 static void dell_rfkill_update_hw_state(struct rfkill *rfkill, int radio,
-- 
1.8.4.2
