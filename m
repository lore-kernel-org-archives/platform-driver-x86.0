From: Philippe Coval <philippe.coval@open.eurogiciel.org>
Subject: [PATCH] ideapad_laptop: Add Lenovo G40-30 to devices without radio switch
Date: Sat,  2 May 2015 15:14:08 +0200
Message-ID: <1430572448-32552-1-git-send-email-philippe.coval@open.eurogiciel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtpfb2-g21.free.fr ([212.27.42.10]:37077 "EHLO
	smtpfb2-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbbEBNOg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 2 May 2015 09:14:36 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, dvhart@infradead.org
Cc: Philippe Coval <philippe.coval@open.eurogiciel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Philippe Coval <rzr@gna.org>

Lenovo G40-30 does not provide any physical radio switch to user.
Therefore disable the rfkill switch identically to the Yoga 2 approach.
(Note for later, models ids are sorted alphabetically).

Benefit is to make wireless available again without unloading module.

It was tested successfully on 4.1.0-rc1 base with this model:
(LENOVO_MT_80FY_BU_idea_FM_Lenovo G40-30).

BugLink: https://bugs.launchpad.net/ideapad-laptop/+bug/1450946
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philippe Coval <rzr@gna.org>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index b3d419a..b496db8 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -830,6 +830,13 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
  */
 static const struct dmi_system_id no_hw_rfkill_list[] = {
 	{
+		.ident = "Lenovo G40-30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G40-30"),
+		},
+	},
+	{
 		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.1.4
