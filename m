From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] ideapad-laptop: Add Lenovo Yoga 3 14 to no_hw_rfkill dmi list
Date: Mon, 10 Aug 2015 10:45:45 +0200
Message-ID: <1439196345-3234-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53176 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753495AbbHJIps (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Aug 2015 04:45:48 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, stable@vger.kernel.org

Like some of the other Yoga models the Lenovo Yoga 3 14 does not have a
hw rfkill switch, and trying to read the hw rfkill switch through the
ideapad module causes it to always reported blocking breaking wifi.

This commit adds the Lenovo Yoga 3 14 to the no_hw_rfkill dmi list, fixing
the wifi breakage.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1239050
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 76b5738..81c3e582 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -853,6 +853,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo Yoga 3 14",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 3 14"),
+		},
+	},
+	{
 		.ident = "Lenovo Yoga 3 Pro 1370",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.4.3
