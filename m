From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] sony-laptop: fully enable SNY controlled modems
Date: Mon, 15 Oct 2012 06:42:38 +0900
Message-ID: <1350250958-7212-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:43186 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754209Ab2JNVxa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Oct 2012 17:53:30 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, Illya Klymov <xanf@xanf.me>

The call to handlers 0x124 and 0x135 (rfkill control) seems to take a
bitmask to control various states of the device. For our rfkill we need
a fully on/off. SVZ1311Z9R/X's LTE modem needs more bits up.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=47751
Cc: Illya Klymov <xanf@xanf.me>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---

Hi Matthew,
See bugzilla above for how "7" is better than "3". I have checked a handful of
Vaio DSDTs I have here and it looks like this new value will not harm other
models. In fact it works fine on the above SVZ, a VGN-G and a VPC-X I could
test with.

Could you see if it can be included in 3.7?

Thanks!
---
 drivers/platform/x86/sony-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index badd646..42125df 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1726,7 +1726,7 @@ static int sony_nc_rfkill_set(void *data, bool blocked)
 	int argument = sony_rfkill_address[(long) data] + 0x100;
 
 	if (!blocked)
-		argument |= 0x030000;
+		argument |= 0x070000;
 
 	return sony_call_snc_handle(sony_rfkill_handle, argument, &result);
 }
-- 
1.7.10.4
