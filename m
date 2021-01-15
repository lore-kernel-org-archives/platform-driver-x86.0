Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBB2C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DC9C238EB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727679AbhAOQU0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20402 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725818AbhAOQUY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 11:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610727536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xeYu7O/WG3ASZ/NoUK2sFogKJnJnG93QniEAjxTgej4=;
        b=epTOh+cfSrNWpc2mFHwkfp2dm85QCtSbUjPuTW1k2ZeDBDDptTys9XxJDCmJu0uV8JZwwP
        OMpaUmAxu6eKc88obLC9w9rctL+Q6PFoz2nq3BPh3YLvEmF5CIwYQRe0cinD92klsAL8M7
        2GtcPJEMsY9amfsK6XZQ4f83dnn1HgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-AJWA6FfgMgeH18JmkBPU5Q-1; Fri, 15 Jan 2021 11:18:55 -0500
X-MC-Unique: AJWA6FfgMgeH18JmkBPU5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0095802B46;
        Fri, 15 Jan 2021 16:18:53 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-172.ams2.redhat.com [10.36.112.172])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DAD125C276;
        Fri, 15 Jan 2021 16:18:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
Subject: [PATCH 2/4] platform/x86: intel-vbtn: Create 2 separate input-devs for buttons and switches
Date:   Fri, 15 Jan 2021 17:18:48 +0100
Message-Id: <20210115161850.117614-2-hdegoede@redhat.com>
In-Reply-To: <20210115161850.117614-1-hdegoede@redhat.com>
References: <20210115161850.117614-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Create 2 separate input-devs for buttons and switches, this is a
preparation for dynamically registering the switches-input device
for devices which are not on the switches allow-list, but do make
Notify() calls with an event value from the switches sparse-keymap.

This also brings the intel-vbtn driver inline with the intel-hid
driver which is doing the same thing.

Cc: Elia Devito <eliadevito@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note that checkpatch will complain about the 2 assignments of ke
inside if-s. I know those are generally something to be avoided
but in this case using them leads to much cleaner code.
---
 drivers/platform/x86/intel-vbtn.c | 98 +++++++++++++++++++------------
 1 file changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index e1bb37a03ba3..04725173d087 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -44,6 +44,7 @@ static const struct key_entry intel_vbtn_keymap[] = {
 	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
 	{ KE_KEY,    0xC8, { KEY_ROTATE_LOCK_TOGGLE } },	/* rotate-lock key press */
 	{ KE_KEY,    0xC9, { KEY_ROTATE_LOCK_TOGGLE } },	/* rotate-lock key release */
+	{ KE_END }
 };
 
 static const struct key_entry intel_vbtn_switchmap[] = {
@@ -51,14 +52,15 @@ static const struct key_entry intel_vbtn_switchmap[] = {
 	{ KE_SW,     0xCB, { .sw = { SW_DOCK, 0 } } },		/* Undocked */
 	{ KE_SW,     0xCC, { .sw = { SW_TABLET_MODE, 1 } } },	/* Tablet */
 	{ KE_SW,     0xCD, { .sw = { SW_TABLET_MODE, 0 } } },	/* Laptop */
+	{ KE_END }
 };
 
 #define KEYMAP_LEN \
 	(ARRAY_SIZE(intel_vbtn_keymap) + ARRAY_SIZE(intel_vbtn_switchmap) + 1)
 
 struct intel_vbtn_priv {
-	struct key_entry keymap[KEYMAP_LEN];
-	struct input_dev *input_dev;
+	struct input_dev *buttons_dev;
+	struct input_dev *switches_dev;
 	bool has_buttons;
 	bool has_switches;
 	bool wakeup_mode;
@@ -77,48 +79,62 @@ static void detect_tablet_mode(struct platform_device *device)
 		return;
 
 	m = !(vgbs & VGBS_TABLET_MODE_FLAGS);
-	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
+	input_report_switch(priv->switches_dev, SW_TABLET_MODE, m);
 	m = (vgbs & VGBS_DOCK_MODE_FLAG) ? 1 : 0;
-	input_report_switch(priv->input_dev, SW_DOCK, m);
+	input_report_switch(priv->switches_dev, SW_DOCK, m);
 }
 
+/*
+ * Note this unconditionally creates the 2 input_dev-s and sets up
+ * the sparse-keymaps. Only the registration is conditional on
+ * have_buttons / have_switches. This is done so that the notify
+ * handler can always call sparse_keymap_entry_from_scancode()
+ * on the input_dev-s do determine the event type.
+ */
 static int intel_vbtn_input_setup(struct platform_device *device)
 {
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
-	int ret, keymap_len = 0;
+	int ret;
 
-	if (priv->has_buttons) {
-		memcpy(&priv->keymap[keymap_len], intel_vbtn_keymap,
-		       ARRAY_SIZE(intel_vbtn_keymap) *
-		       sizeof(struct key_entry));
-		keymap_len += ARRAY_SIZE(intel_vbtn_keymap);
-	}
+	priv->buttons_dev = devm_input_allocate_device(&device->dev);
+	if (!priv->buttons_dev)
+		return -ENOMEM;
 
-	if (priv->has_switches) {
-		memcpy(&priv->keymap[keymap_len], intel_vbtn_switchmap,
-		       ARRAY_SIZE(intel_vbtn_switchmap) *
-		       sizeof(struct key_entry));
-		keymap_len += ARRAY_SIZE(intel_vbtn_switchmap);
-	}
+	ret = sparse_keymap_setup(priv->buttons_dev, intel_vbtn_keymap, NULL);
+	if (ret)
+		return ret;
 
-	priv->keymap[keymap_len].type = KE_END;
+	priv->buttons_dev->dev.parent = &device->dev;
+	priv->buttons_dev->name = "Intel Virtual Buttons";
+	priv->buttons_dev->id.bustype = BUS_HOST;
+
+	if (priv->has_buttons) {
+		ret = input_register_device(priv->buttons_dev);
+		if (ret)
+			return ret;
+	}
 
-	priv->input_dev = devm_input_allocate_device(&device->dev);
-	if (!priv->input_dev)
+	priv->switches_dev = devm_input_allocate_device(&device->dev);
+	if (!priv->switches_dev)
 		return -ENOMEM;
 
-	ret = sparse_keymap_setup(priv->input_dev, priv->keymap, NULL);
+	ret = sparse_keymap_setup(priv->switches_dev, intel_vbtn_switchmap, NULL);
 	if (ret)
 		return ret;
 
-	priv->input_dev->dev.parent = &device->dev;
-	priv->input_dev->name = "Intel Virtual Button driver";
-	priv->input_dev->id.bustype = BUS_HOST;
+	priv->switches_dev->dev.parent = &device->dev;
+	priv->switches_dev->name = "Intel Virtual Switches";
+	priv->switches_dev->id.bustype = BUS_HOST;
 
-	if (priv->has_switches)
+	if (priv->has_switches) {
 		detect_tablet_mode(device);
 
-	return input_register_device(priv->input_dev);
+		ret = input_register_device(priv->switches_dev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static void notify_handler(acpi_handle handle, u32 event, void *context)
@@ -127,13 +143,27 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
 	unsigned int val = !(event & 1); /* Even=press, Odd=release */
 	const struct key_entry *ke, *ke_rel;
+	struct input_dev *input_dev;
 	bool autorelease;
 
-	if (priv->wakeup_mode) {
-		ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
-		if (!ke)
-			goto out_unknown;
+	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
+		if (!priv->has_buttons) {
+			dev_warn(&device->dev, "Warning: received a button event on a device without buttons, please report this.\n");
+			return;
+		}
+		input_dev = priv->buttons_dev;
+	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
+		if (!priv->has_switches) {
+			dev_warn(&device->dev, "Warning: received a switches event on a device without switchess, please report this.\n");
+			return;
+		}
+		input_dev = priv->switches_dev;
+	} else {
+		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
+		return;
+	}
 
+	if (priv->wakeup_mode) {
 		pm_wakeup_hard_event(&device->dev);
 
 		/*
@@ -148,14 +178,10 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	 * Even press events are autorelease if there is no corresponding odd
 	 * release event, or if the odd event is KE_IGNORE.
 	 */
-	ke_rel = sparse_keymap_entry_from_scancode(priv->input_dev, event | 1);
+	ke_rel = sparse_keymap_entry_from_scancode(input_dev, event | 1);
 	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
 
-	if (sparse_keymap_report_event(priv->input_dev, event, val, autorelease))
-		return;
-
-out_unknown:
-	dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
+	sparse_keymap_report_event(input_dev, event, val, autorelease);
 }
 
 static bool intel_vbtn_has_buttons(acpi_handle handle)
-- 
2.28.0

