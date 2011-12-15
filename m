From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 6/9] asus-laptop: check WLED and BLED presence before adding rfkill
Date: Thu, 15 Dec 2011 08:27:36 +0100
Message-ID: <1323934059-1221-7-git-send-email-corentincj@iksaif.net>
References: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Corentin Chary <corentin.chary@gmail.com>

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-laptop.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 0bdd966..847c8ad 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1361,14 +1361,16 @@ static int asus_rfkill_init(struct asus_laptop *asus)
 		goto exit;
 
 
-	if (asus->wled_type == TYPE_RFKILL)
+	if (!acpi_check_handle(asus->handle, METHOD_WLAN, NULL) &&
+	    asus->wled_type == TYPE_RFKILL)
 		result = asus_rfkill_setup(asus, &asus->wlan, "asus-wlan",
 					   WL_RSTS, RFKILL_TYPE_WLAN,
 					   &asus_rfkill_ops);
 	if (result)
 		goto exit;
 
-	if (asus->bled_type == TYPE_RFKILL)
+	if (!acpi_check_handle(asus->handle, METHOD_BLUETOOTH, NULL) &&
+	    asus->bled_type == TYPE_RFKILL)
 		result = asus_rfkill_setup(asus, &asus->bluetooth,
 					   "asus-bluetooth", BT_RSTS,
 					   RFKILL_TYPE_BLUETOOTH,
-- 
1.7.5.4
