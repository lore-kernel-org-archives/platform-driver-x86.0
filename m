From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 02/14] asus-nb-wmi: ignore useless keys
Date: Tue, 20 Mar 2012 09:53:02 +0100
Message-ID: <1332233594-13099-3-git-send-email-corentin.chary@gmail.com>
References: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/asus-nb-wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index b0859d4..3501127 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -70,6 +70,8 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x50, { KEY_EMAIL } },
 	{ KE_KEY, 0x51, { KEY_WWW } },
 	{ KE_KEY, 0x55, { KEY_CALC } },
+	{ KE_IGNORE, 0x57, },  /* Battery mode */
+	{ KE_IGNORE, 0x58, },  /* AC mode */
 	{ KE_KEY, 0x5C, { KEY_F15 } },  /* Power Gear key */
 	{ KE_KEY, 0x5D, { KEY_WLAN } }, /* Wireless console Toggle */
 	{ KE_KEY, 0x5E, { KEY_WLAN } }, /* Wireless console Enable */
-- 
1.7.3.4
