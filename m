From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: [PATCH] ideapad-laptop: Lenovo G50-30 has no radio switch
Date: Mon,  4 May 2015 01:17:21 +0300
Message-ID: <1430691441-29975-1-git-send-email-hanipouspilot@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:33622 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbbECWRb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 18:17:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>, stable@vger.kernel.org

The quirk is needed to enable wifi
BugLink: https://bugs.launchpad.net/bugs/1397021

Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index b3d419a..4e42253 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -843,6 +843,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
 		},
 	},
+	{
+		.ident = "Lenovo G50-30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
+		},
+	},
 	{}
 };
 
-- 
1.9.1
