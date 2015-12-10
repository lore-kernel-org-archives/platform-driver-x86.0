From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: [PATCH] ideapad-laptop: Add Lenovo ideapad Y700-17ISK to no_hw_rfkill dmi list
Date: Wed,  9 Dec 2015 21:12:52 -0500
Message-ID: <1449713572-16670-1-git-send-email-jwboyer@fedoraproject.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

One of the newest ideapad models also lacks a physical hw rfkill switch,
and trying to read the hw rfkill switch through the ideapad module
causes it to always reported blocking breaking wifi.

Fix it by adding this model to the DMI list.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1286293
Cc: stable@vger.kernel.org
Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index a313dfc0245f..d28db0e793df 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -865,6 +865,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo ideapad Y700-17ISK",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad Y700-17ISK"),
+		},
+	},
+	{
 		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.5.0
