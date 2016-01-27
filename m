From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] intel-hid: fix incorrect entries in intel_hid_keymap
Date: Wed, 27 Jan 2016 21:35:00 +0800
Message-ID: <1453901700-20418-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:38649 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932145AbcA0NfL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jan 2016 08:35:11 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com
Cc: luto@amacapital.net, pbludov@gmail.com

intel_hid_keymap contains a duplicate entry for KEY_HOME and an
incorrect HID index for KEY_PAGEDOWN

Reported-by: Pavel Bludov <pbludov@gmail.com>
Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 20f0ad9..e20f23e 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -41,8 +41,7 @@ static const struct key_entry intel_hid_keymap[] = {
 	{ KE_KEY, 4, { KEY_HOME } },
 	{ KE_KEY, 5, { KEY_END } },
 	{ KE_KEY, 6, { KEY_PAGEUP } },
-	{ KE_KEY, 4, { KEY_PAGEDOWN } },
-	{ KE_KEY, 4, { KEY_HOME } },
+	{ KE_KEY, 7, { KEY_PAGEDOWN } },
 	{ KE_KEY, 8, { KEY_RFKILL } },
 	{ KE_KEY, 9, { KEY_POWER } },
 	{ KE_KEY, 11, { KEY_SLEEP } },
-- 
2.5.0
