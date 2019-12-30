From: Jian-Hong Pan <jian-hong@endlessm.com>
Subject: [PATCH] platform/x86: asus-wmi: Fix keyboard brightness cannot be set to 0
Date: Mon, 30 Dec 2019 16:30:45 +0800
Message-ID: <20191230083044.11582-1-jian-hong@endlessm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com, Jian-Hong Pan <jian-hong@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some of ASUS laptops like UX431FL keyboard backlight cannot be set to
brightness 0. According to ASUS' information, the brightness should be
0x80 ~ 0x83. This patch fixes it by following the logic.

Fixes: e9809c0b9670 ("asus-wmi: add keyboard backlight support")
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 821b08e01635..982f0cc8270c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -512,13 +512,7 @@ static void kbd_led_update(struct asus_wmi *asus)
 {
 	int ctrl_param = 0;
 
-	/*
-	 * bits 0-2: level
-	 * bit 7: light on/off
-	 */
-	if (asus->kbd_led_wk > 0)
-		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
-
+	ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
 	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
 }
 
-- 
2.20.1
