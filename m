From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] ideapad-laptop: Add Lenovo Yoga 900 to no_hw_rfkill dmi list
Date: Mon,  9 Nov 2015 17:09:05 +0100
Message-ID: <1447085345-32455-1-git-send-email-hdegoede@redhat.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>
Cc: stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

Like some of the other Yoga models the Lenovo Yoga 900 does not have a
hw rfkill switch, and trying to read the hw rfkill switch through the
ideapad module causes it to always reported blocking breaking wifi.

This commit adds the Lenovo Yoga 900 to the no_hw_rfkill dmi list, fixing
the wifi breakage.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1275490
Cc: stable@vger.kernel.org
Reported-and-tested-by: Kevin Fenzi <kevin@scrye.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index fce49f3..d4a48b4 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -873,6 +873,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
 		},
 	},
+	{
+		.ident = "Lenovo Yoga 900",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 900"),
+		},
+	},
 	{}
 };
 
-- 
2.5.0
