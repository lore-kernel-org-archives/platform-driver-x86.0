From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH v3 2/2] platform/x86: acer-wmi: add another KEY_WLAN keycode
Date: Tue,  7 Feb 2017 13:05:11 -0600
Message-ID: <20170207190511.10039-2-drake@endlessm.com>
References: <20170207190511.10039-1-drake@endlessm.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:35245 "EHLO
        mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754498AbdBGTPY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Feb 2017 14:15:24 -0500
Received: by mail-vk0-f46.google.com with SMTP id x75so84847096vke.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Feb 2017 11:15:24 -0800 (PST)
In-Reply-To: <20170207190511.10039-1-drake@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux@endlessm.com, chiu@endlessm.com

From: Chris Chiu <chiu@endlessm.com>

Now that we have informed the firmware that the RF Button driver is
active, laptops such as the Acer TravelMate P238-M will generate
a WMI key event with code 0x86 when the Fn+F3 airplane mode key is
pressed.

Add this keycode to the table so that it is converted to an appropriate
input event.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/acer-wmi.c | 1 +
 1 file changed, 1 insertion(+)

v3: split off this change from the original patch

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index fd15e7c..ecdf6f1 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -128,6 +128,7 @@ static const struct key_entry acer_wmi_keymap[] __initconst = {
 	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },
 	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
 	{KE_KEY, 0x85, {KEY_TOUCHPAD_TOGGLE} },
+	{KE_KEY, 0x86, {KEY_WLAN} },
 	{KE_END, 0}
 };
 
-- 
2.9.3
