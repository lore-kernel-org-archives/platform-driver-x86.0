From: Christian Hesse <list@eworm.de>
Subject: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Fri,  1 Apr 2016 23:02:49 +0200
Message-ID: <1459544569-29865-1-git-send-email-list@eworm.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.mylinuxtime.de ([148.251.109.235]:47764 "EHLO
	mx.mylinuxtime.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752970AbcDAVLn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Apr 2016 17:11:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>

From: Christian Hesse <mail@eworm.de>

When Lenovo Yoga 700 is flipped to tablet mode it emmits event 10. Let's
send touchpad key codes so software can disable touchpad.

Signed-off-by: Christian Hesse <mail@eworm.de>
Signed-off-by: Michael Gisbers <michael@gisbers.de>
---
 drivers/platform/x86/ideapad-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index be3bc2f..1d49db1 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 			case 6:
 				ideapad_input_report(priv, vpc_bit);
 				break;
+			case 10:
 			case 5:
 				ideapad_sync_touchpad_state(priv);
 				break;
-- 
2.8.0
