From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] acer-wmi: Add wireless quirk for Lenovo 3000 N200
Date: Tue,  4 Oct 2011 14:32:58 -0500
Message-ID: <1317756778-11822-1-git-send-email-seth.forshee@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joey Lee <jlee@novell.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This quirk fixes the wlan rfkill status on this machine. Without
it, wlan is permanently soft blocked whenever acer-wmi is loaded.

BugLink: https://bugs.launchpad.net/bugs/865807
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/acer-wmi.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index af2bb20..dac286a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -464,6 +464,15 @@ static struct dmi_system_id acer_quirks[] = {
 		},
 		.driver_data = &quirk_lenovo_ideapad_s205,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Lenovo 3000 N200",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0687A31"),
+		},
+		.driver_data = &quirk_fujitsu_amilo_li_1718,
+	},
 	{}
 };
 
-- 
1.7.4.1
