From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 1/1] samsung-laptop: add N230 to supported models
Date: Fri,  2 Mar 2012 19:55:05 +0100
Message-ID: <1330714505-13170-1-git-send-email-jslaby@suse.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is a version of N230 which has only this in product and board
names. See dmidecode in the bugzilla entry.

Without this patch, one has to pass the force module parameter to have
rfkill working.

References: https://bugzilla.novell.com/show_bug.cgi?id=746695
Signed-off-by: Jiri Slaby <jslaby@suse.cz>
---
 drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index fd73ea8..7765929 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -679,6 +679,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 		.callback = dmi_check_cb,
 	},
 	{
+		.ident = "N230",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+					"SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N230"),
+			DMI_MATCH(DMI_BOARD_NAME, "N230"),
+		},
+		.callback = dmi_check_cb,
+	},
+	{
 		.ident = "N150/N210/N220/N230",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR,
-- 
1.7.9.2
