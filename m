From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 03/15] acer-wmi: Mark acer_wmi_keymap[] as __initconst
Date: Wed, 16 Jul 2014 19:43:05 +0200
Message-ID: <1405532597-28262-4-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:54091 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934736AbaGPRnj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:39 -0400
Received: by mail-we0-f181.google.com with SMTP id k48so111056wev.40
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:38 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, "Lee, Chun-Yi" <jlee@suse.com>

sparse_keymap_setup() will make a copy of the keymap, so we can release
the master copy after initialization.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 31f4da5061..fde69ee63f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -96,7 +96,7 @@ enum acer_wmi_event_ids {
 	WMID_ACCEL_EVENT = 0x5,
 };
 
-static const struct key_entry acer_wmi_keymap[] = {
+static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x04, {KEY_WLAN} },     /* WiFi */
-- 
1.7.10.4
