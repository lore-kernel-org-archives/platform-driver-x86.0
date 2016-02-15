From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v5 3/5] dell-wmi: Clean up hotkey table size check
Date: Mon, 15 Feb 2016 08:32:35 -0800
Message-ID: <9aaaffdc9eb56061386c8ae443d130f20131c234.1455553470.git.luto@kernel.org>
References: <cover.1455553470.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34188 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751326AbcBOQcu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 11:32:50 -0500
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
References: <cover.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>

Checking the table for a minimum size of 7 bytes makes no sense: any valid
hotkey table has a size that's a multiple of 4.

Clean this up: replace the hardcoded header length with a sizeof and
change the check to ignore an empty hotkey table.  The only behavior
change is that a 7-byte table (which is nonsensical) will now be
treated as absent instead of as valid but empty.

Reported-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Changes from v3: None

Changes from v2:
 - Total rewrite.

drivers/platform/x86/dell-wmi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index d6ae69e0a787..32808a463325 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -351,13 +351,24 @@ static void __init handle_dmi_entry(const struct dmi_header *dm,
 	if (results->err || results->keymap)
 		return;		/* We already found the hotkey table. */
 
-	if (dm->type != 0xb2 || dm->length <= 6)
+	if (dm->type != 0xb2)
 		return;
 
 	table = container_of(dm, struct dell_bios_hotkey_table, header);
 
-	hotkey_num = (table->header.length - 4) /
+	hotkey_num = (table->header.length -
+		      sizeof(struct dell_bios_hotkey_table)) /
 				sizeof(struct dell_bios_keymap_entry);
+	if (hotkey_num < 1) {
+		/*
+		 * Historically, dell-wmi would ignore a DMI entry of
+		 * fewer than 7 bytes.  Sizes between 4 and 8 bytes are
+		 * nonsensical (both the header and all entries are 4
+		 * bytes), so we approximate the old behavior by
+		 * ignoring tables with fewer than one entry.
+		 */
+		return;
+	}
 
 	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
 	if (!keymap) {
-- 
2.5.0
