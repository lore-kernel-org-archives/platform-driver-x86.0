From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2 2/3] dell-wmi: Fix hotkey table size check
Date: Mon, 18 Jan 2016 12:59:39 -0800
Message-ID: <0282cf1f0c15ae9006b119dd92bfb4bad2e924a7.1453150613.git.luto@kernel.org>
References: <cover.1453150613.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:47192 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932164AbcARU7s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Jan 2016 15:59:48 -0500
In-Reply-To: <cover.1453150613.git.luto@kernel.org>
In-Reply-To: <cover.1453150613.git.luto@kernel.org>
References: <cover.1453150613.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

The minimum size of the table is 4, not 6.  Replace the hard-coded
number with a sizeof expression.  While we're at it, repace the
hard-coded 4 below as well.

Reported-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/dell-wmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 5c0d037fcd40..48838942d593 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -111,7 +111,6 @@ struct dell_bios_keymap_entry {
 struct dell_bios_hotkey_table {
 	struct dmi_header header;
 	struct dell_bios_keymap_entry keymap[];
-
 };
 
 struct dell_dmi_results {
@@ -329,12 +328,14 @@ static void __init handle_dmi_entry(const struct dmi_header *dm,
 	if (results->err || results->keymap)
 		return;		/* We already found the hotkey table. */
 
-	if (dm->type != 0xb2 || dm->length <= 6)
+	if (dm->type != 0xb2 ||
+	    dm->length <= sizeof(struct dell_bios_hotkey_table))
 		return;
 
 	table = container_of(dm, struct dell_bios_hotkey_table, header);
 
-	hotkey_num = (table->header.length - 4) /
+	hotkey_num = (table->header.length -
+		      sizeof(struct dell_bios_hotkey_table)) /
 				sizeof(struct dell_bios_keymap_entry);
 
 	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
-- 
2.5.0
