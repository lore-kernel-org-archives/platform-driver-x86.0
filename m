From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Add Ideapad 530S-14ARR to no_hw_rfkill list
Date: Tue,  5 Mar 2019 16:55:21 +0800
Message-ID: <20190305085521.25304-1-kai.heng.feng@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ike.pan@canonical.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

This platform doesn't have hardware switch for rfkill, so add it to
no_hw_rfkill list to prevent wireless gets hard-blocked.

https://bugs.launchpad.net/bugs/1818204
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1589dffab9fa..037970a1800a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1090,6 +1090,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 310-15ISK"),
 		},
 	},
+	{
+		.ident = "Lenovo ideapad 530S-14ARR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad 530S-14ARR"),
+		},
+	},
 	{
 		.ident = "Lenovo ideapad Y700-14ISK",
 		.matches = {
-- 
2.17.1
