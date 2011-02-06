From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH v2 13/18] eeepc-wmi: set the right key code for 0xe9
Date: Sun,  6 Feb 2011 13:28:38 +0100
Message-ID: <1296995324-5462-14-git-send-email-corentincj@iksaif.net>
References: <1296995324-5462-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38287 "EHLO
	relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752762Ab1BFMaI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 Feb 2011 07:30:08 -0500
In-Reply-To: <1296995324-5462-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This key should power off the backlight, not the display,
it is also used in acpi/video.c to do the same thing.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 0db7009..75dd692 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -103,7 +103,7 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, 0xe0, { KEY_PROG1 } },
 	{ KE_KEY, 0xe1, { KEY_F14 } },
-	{ KE_KEY, 0xe9, { KEY_DISPLAY_OFF } },
+	{ KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
 	{ KE_END, 0},
 };
 
-- 
1.7.4.rc3
