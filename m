From: Sebastian Krzyszkowiak <dos@dosowisko.net>
Subject: [PATCH] ideapad-laptop: add alternative representation for Yoga 2 to DMI table
Date: Sun, 19 Jul 2015 01:10:21 +0200
Message-ID: <1437261021-25632-1-git-send-email-dos@dosowisko.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:34927 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917AbbGRXLA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 18 Jul 2015 19:11:00 -0400
Received: by lahh5 with SMTP id h5so78254692lah.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2015 16:10:59 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Sebastian Krzyszkowiak <dos@dosowisko.net>

There is at least one (mine) Yoga 2 Pro in existence that has incorrect
product version stored in DMI (reading as "INVALID"), causing it to not be
recognized as Yoga 2 by ideapad-laptop module, which in turn causes
non-existent hardware rfkills to be always reported as blocked.

This change adds a second check by board name, which is "Yoga2".
Looks like it also happens to be "INVALID" on some other Yoga 2 machines
where product version is correct instead, so the original check is left
intact to catch both cases.

Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>
---
 drivers/platform/x86/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 76b5738..4241262 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -853,6 +853,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		},
 	},
 	{
+		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
+		},
+	},
+	{
 		.ident = "Lenovo Yoga 3 Pro 1370",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-- 
2.4.6
