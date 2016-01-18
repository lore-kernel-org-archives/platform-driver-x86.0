From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v2 1/3] dell-wmi: Stop storing pointers to DMI tables
Date: Mon, 18 Jan 2016 12:59:38 -0800
Message-ID: <eb210629e07df3a6295a2b3b370aff87625cfbef.1453150613.git.luto@kernel.org>
References: <cover.1453150613.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:47147 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932408AbcARU7q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Jan 2016 15:59:46 -0500
In-Reply-To: <cover.1453150613.git.luto@kernel.org>
In-Reply-To: <cover.1453150613.git.luto@kernel.org>
References: <cover.1453150613.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

The dmi_walk function maps the DMI table, walks it, and unmaps it.
This means that the dell_bios_hotkey_table that find_hk_type stores
points to unmapped memory by the time it gets read.

I've been able to trigger crashes caused by the stale pointer a
couple of times, but never on a stock kernel.

Fix it by generating the keymap in the dmi_walk callback instead of
storing a pointer.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Notes:
    Changes from v1:
     - Rename handle_dmi_table to handle_dmi_entry (Jean)
     - Remove useless assignment to results->err (Jean)

 drivers/platform/x86/dell-wmi.c | 68 +++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index b6f193b07566..5c0d037fcd40 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -114,7 +114,10 @@ struct dell_bios_hotkey_table {
 
 };
 
-static const struct dell_bios_hotkey_table *dell_bios_hotkey_table;
+struct dell_dmi_results {
+	int err;
+	struct key_entry *keymap;
+};
 
 /* Uninitialized entries here are KEY_RESERVED == 0. */
 static const u16 bios_to_linux_keycode[256] __initconst = {
@@ -315,20 +318,34 @@ static void dell_wmi_notify(u32 value, void *context)
 	kfree(obj);
 }
 
-static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
+static void __init handle_dmi_entry(const struct dmi_header *dm,
+				    void *opaque)
 {
-	int hotkey_num = (dell_bios_hotkey_table->header.length - 4) /
-				sizeof(struct dell_bios_keymap_entry);
+	struct dell_dmi_results *results = opaque;
+	struct dell_bios_hotkey_table *table;
 	struct key_entry *keymap;
-	int i;
+	int hotkey_num, i;
+
+	if (results->err || results->keymap)
+		return;		/* We already found the hotkey table. */
+
+	if (dm->type != 0xb2 || dm->length <= 6)
+		return;
+
+	table = container_of(dm, struct dell_bios_hotkey_table, header);
+
+	hotkey_num = (table->header.length - 4) /
+				sizeof(struct dell_bios_keymap_entry);
 
 	keymap = kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KERNEL);
-	if (!keymap)
-		return NULL;
+	if (!keymap) {
+		results->err = -ENOMEM;
+		return;
+	}
 
 	for (i = 0; i < hotkey_num; i++) {
 		const struct dell_bios_keymap_entry *bios_entry =
-					&dell_bios_hotkey_table->keymap[i];
+					&table->keymap[i];
 
 		/* Uninitialized entries are 0 aka KEY_RESERVED. */
 		u16 keycode = (bios_entry->keycode <
@@ -357,11 +374,12 @@ static const struct key_entry * __init dell_wmi_prepare_new_keymap(void)
 
 	keymap[hotkey_num].type = KE_END;
 
-	return keymap;
+	results->keymap = keymap;
 }
 
 static int __init dell_wmi_input_setup(void)
 {
+	struct dell_dmi_results dmi_results = {};
 	int err;
 
 	dell_wmi_input_dev = input_allocate_device();
@@ -372,20 +390,26 @@ static int __init dell_wmi_input_setup(void)
 	dell_wmi_input_dev->phys = "wmi/input0";
 	dell_wmi_input_dev->id.bustype = BUS_HOST;
 
-	if (dell_new_hk_type) {
-		const struct key_entry *keymap = dell_wmi_prepare_new_keymap();
-		if (!keymap) {
-			err = -ENOMEM;
-			goto err_free_dev;
-		}
+	err = dmi_walk(handle_dmi_entry, &dmi_results);
+	if (err)
+		goto err_free_dev;
 
-		err = sparse_keymap_setup(dell_wmi_input_dev, keymap, NULL);
+	if (dmi_results.err) {
+		err = dmi_results.err;
+		goto err_free_dev;
+	}
+
+	if (dmi_results.keymap) {
+		dell_new_hk_type = true;
+
+		err = sparse_keymap_setup(dell_wmi_input_dev,
+					  dmi_results.keymap, NULL);
 
 		/*
 		 * Sparse keymap library makes a copy of keymap so we
 		 * don't need the original one that was allocated.
 		 */
-		kfree(keymap);
+		kfree(dmi_results.keymap);
 	} else {
 		err = sparse_keymap_setup(dell_wmi_input_dev,
 					  dell_wmi_legacy_keymap, NULL);
@@ -412,15 +436,6 @@ static void dell_wmi_input_destroy(void)
 	input_unregister_device(dell_wmi_input_dev);
 }
 
-static void __init find_hk_type(const struct dmi_header *dm, void *dummy)
-{
-	if (dm->type == 0xb2 && dm->length > 6) {
-		dell_new_hk_type = true;
-		dell_bios_hotkey_table =
-			container_of(dm, struct dell_bios_hotkey_table, header);
-	}
-}
-
 static int __init dell_wmi_init(void)
 {
 	int err;
@@ -431,7 +446,6 @@ static int __init dell_wmi_init(void)
 		return -ENODEV;
 	}
 
-	dmi_walk(find_hk_type, NULL);
 
 	err = dell_wmi_input_setup();
 	if (err)
-- 
2.5.0
