From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] dell-laptop: Add another Dell laptop to the DMI whitelist
Date: Thu, 16 Feb 2017 20:58:03 +0800
Message-ID: <1487249883-7013-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56276 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755046AbdBPM6m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2017 07:58:42 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

This is to support Latitude 7480 and many other newer Dell laptops.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/dell-laptop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 277656c..6174854 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -109,6 +109,12 @@ static const struct dmi_system_id dell_device_table[] __initconst = {
 		},
 	},
 	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /*Notebook*/
+		},
+	},
+	{
 		.ident = "Dell Computer Corporation",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
-- 
2.10.2
