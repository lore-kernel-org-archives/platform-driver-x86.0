From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 06/11] asus-nb-wmi: correct a touchpad hotkey mapping
Date: Thu, 29 Nov 2012 09:12:34 +0100
Message-ID: <1354176759-630-7-git-send-email-corentin.chary@gmail.com>
References: <1354176759-630-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354176759-630-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, AceLan Kao <acelan.kao@canonical.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: AceLan Kao <acelan.kao@canonical.com>

0x60 is touchpad enable key, but is misdefined in the keymap.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 9f1caa7..75ce18c 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -180,7 +180,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
 	{ KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
 	{ KE_KEY, 0x5F, { KEY_WLAN } }, /* Wireless console Disable */
-	{ KE_KEY, 0x60, { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
 	{ KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } }, /* LCD Only */
 	{ KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } }, /* CRT Only */
 	{ KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } }, /* LCD + CRT */
-- 
1.7.8.6
