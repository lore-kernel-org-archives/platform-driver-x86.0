From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 04/11] asus-laptop: correct a touchpad hotkey mapping
Date: Thu, 29 Nov 2012 09:12:32 +0100
Message-ID: <1354176759-630-5-git-send-email-corentin.chary@gmail.com>
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
 drivers/platform/x86/asus-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 09c477a..73d0198 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -320,7 +320,7 @@ static const struct key_entry asus_keymap[] = {
 	{KE_KEY, 0x5D, { KEY_WLAN } }, /* WLAN Toggle */
 	{KE_KEY, 0x5E, { KEY_WLAN } }, /* WLAN Enable */
 	{KE_KEY, 0x5F, { KEY_WLAN } }, /* WLAN Disable */
-	{KE_KEY, 0x60, { KEY_SWITCHVIDEOMODE } },
+	{KE_KEY, 0x60, { KEY_TOUCHPAD_ON } },
 	{KE_KEY, 0x61, { KEY_SWITCHVIDEOMODE } }, /* LCD Only */
 	{KE_KEY, 0x62, { KEY_SWITCHVIDEOMODE } }, /* CRT Only */
 	{KE_KEY, 0x63, { KEY_SWITCHVIDEOMODE } }, /* LCD + CRT */
-- 
1.7.8.6
