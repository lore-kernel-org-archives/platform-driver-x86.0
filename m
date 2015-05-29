From: Philippe Coval <philippe.coval@open.eurogiciel.org>
Subject: [PATCH] ideapad_laptop: Add Lenovo G50-30 to devices without radio switch
Date: Fri, 29 May 2015 15:20:01 +0200
Message-ID: <1432905601-25381-1-git-send-email-philippe.coval@open.eurogiciel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:38276 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755260AbbE2NUM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 May 2015 09:20:12 -0400
Received: by wizo1 with SMTP id o1so23542873wiz.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 May 2015 06:20:11 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, dvhart@infradead.org
Cc: Dmitry Tunin <hanipouspilot@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Coval <philippe.coval@open.eurogiciel.org>

From: Dmitry Tunin <hanipouspilot@gmail.com>

Lenovo G50-30 rfkill always reports wireless blocked fix.

BugLink: https://bugs.launchpad.net/bugs/1397021
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
Signed-off-by: Philippe Coval <philippe.coval@open.eurogiciel.org>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index b496db8..6e82520 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -837,6 +837,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo G50-30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
+		},
+	},
+	{
 		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
1.9.1
