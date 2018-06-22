From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] platform/x86: ideapad-laptop: Apply no_hw_rfkill to Y20-15IKBM, too
Date: Fri, 22 Jun 2018 10:59:17 +0200
Message-ID: <20180622085917.22969-1-tiwai@suse.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The commit 5d9f40b56630 ("platform/x86: ideapad-laptop: Add
Y520-15IKBN to no_hw_rfkill") added the entry for Y20-15IKBN, and it
turned out that another variant, Y20-15IKBM, also requires the
no_hw_rfkill.

Trim the last letter from the string so that it matches to both
Y20-15IKBN and Y20-15IKBM models.

Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1098626
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>

---
 drivers/platform/x86/ideapad-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 45b7cb01f410..307403decf76 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1133,10 +1133,10 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
-		.ident = "Lenovo Legion Y520-15IKBN",
+		.ident = "Lenovo Legion Y520-15IKB",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y520-15IKBN"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Y520-15IKB"),
 		},
 	},
 	{
-- 
2.17.1
