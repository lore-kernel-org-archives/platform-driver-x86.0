From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 1/4] samsung-laptop: Samsung R410P backlight driver
Date: Fri,  8 Apr 2011 17:02:03 +0200
Message-ID: <1302274926-25985-2-git-send-email-mmarek@suse.cz>
References: <1302274926-25985-1-git-send-email-mmarek@suse.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1302274926-25985-1-git-send-email-mmarek@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg@redhat.com
Cc: gregkh@suse.de, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alberto Mardegan <mardy@users.sourceforge.net>
List-Id: platform-driver-x86.vger.kernel.org

From: Alberto Mardegan <mardy@users.sourceforge.net>

Here's a trivial patch which adds support to the backlight device found
in Samsung R410 Plus laptops.

Signed-off-by: Alberto Mardegan <mardy@users.sourceforge.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
[mmarek: cherry-picked from staging commit d542f180]
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index de434c6..f670db3 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -571,6 +571,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 		.callback = dmi_check_cb,
 	},
 	{
+		.ident = "R410 Plus",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR,
+					"SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "R410P"),
+			DMI_MATCH(DMI_BOARD_NAME, "R460"),
+		},
+		.callback = dmi_check_cb,
+	},
+	{
 		.ident = "R518",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR,
-- 
1.7.4.1
