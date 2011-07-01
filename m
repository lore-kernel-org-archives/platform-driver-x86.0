From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 09/16] asus-wmi: fix keyboard backlight detection
Date: Fri,  1 Jul 2011 11:34:34 +0200
Message-ID: <1309512881-2901-10-git-send-email-corentin.chary@gmail.com>
References: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2ab83d1..332103b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -395,8 +395,9 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 	retval = asus_wmi_get_devstate_bits(asus, ASUS_WMI_DEVID_KBD_BACKLIGHT,
 					    0xFFFF);
 
+	/* Unknown status is considered as off */
 	if (retval == 0x8000)
-		retval = -ENODEV;
+		retval = 0;
 
 	if (retval >= 0) {
 		if (level)
-- 
1.7.3.4
