From: Viktar Vauchkevich <victorenator@gmail.com>
Subject: [PATCH 1/1] asus-nb-wmi: ignore ALS notification key code
Date: Thu, 23 May 2013 07:17:11 +0300
Message-ID: <3187019.OJTtjt5AeY@vs>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:47832 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750916Ab3EWEQo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 May 2013 00:16:44 -0400
Received: by mail-ee0-f46.google.com with SMTP id e49so1509690eek.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2013 21:16:43 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Ignore Ambient Light Sensor notification key code 0xC6 found in ASUS UX31a.
When the illuminance changes dmesg shows:
[10814.939979] asus_wmi: Unknown key c6 pressed

Signed-off-by: Viktar Vauchkevich <victorenator@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-
wmi.c
index 8fcb41e..7340566 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -256,6 +256,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0xB5, { KEY_CALC } },
 	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
 	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
+	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_END, 0},
 };
 
-- 
1.8.2.1
