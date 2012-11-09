From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/2] sony-laptop: fully enable SNY controlled modems
Date: Sat, 10 Nov 2012 07:56:00 +0900
Message-ID: <1352501761-7299-2-git-send-email-malattia@linux.it>
References: <1352501761-7299-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:53241 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756088Ab2KIW4F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Nov 2012 17:56:05 -0500
In-Reply-To: <1352501761-7299-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

The call to handlers 0x124 and 0x135 (rfkill control) seems to take a
bitmask to control various states of the device. For our rfkill we need
a fully on/off. SVZ1311Z9R/X's LTE modem needs more bits up.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=47751
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index daaddec..b0e1180 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1533,7 +1533,7 @@ static int sony_nc_rfkill_set(void *data, bool blocked)
 	int argument = sony_rfkill_address[(long) data] + 0x100;
 
 	if (!blocked)
-		argument |= 0x030000;
+		argument |= 0x070000;
 
 	return sony_call_snc_handle(sony_rfkill_handle, argument, &result);
 }
-- 
1.7.10.4
