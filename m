Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5649DC433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E62D3223BF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iPiyONVr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbgJSS5Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:57:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48180 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727681AbgJSS5Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QhETTMz0tvhpYJP2zM4MHh1itzU437jGPTn75xVqPjY=;
        b=iPiyONVrdjkGoVqLCEiBnesveexTLzs8hGnrbRsQwJfygs4bq4gtv2wHlG3NoSDewQ01OE
        QTRM+eWcw8RemQkTrhT1/phbC0NJKEC5BPs+OMYujvVPZ0mWqFf0Pr4MpVwJ+N/4gjGne1
        E8a6KyGfzaX8CAn0xjqgUTcxAnjjmlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-NPZ7-QKXPUmrn65wxiA-5Q-1; Mon, 19 Oct 2020 14:57:11 -0400
X-MC-Unique: NPZ7-QKXPUmrn65wxiA-5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD749ADC44;
        Mon, 19 Oct 2020 18:56:39 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 93D8260DA0;
        Mon, 19 Oct 2020 18:56:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/6] platform/x86: acer-wmi: Add support for SW_TABLET_MODE on Switch devices
Date:   Mon, 19 Oct 2020 20:56:28 +0200
Message-Id: <20201019185628.264473-6-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-1-hdegoede@redhat.com>
References: <20201019185628.264473-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for SW_TABLET_MODE on the Acer Switch 10 (SW5-012) and the
acer Switch 10 (S1003) models.

There is no way to detect if this is supported, so this uses DMI based
quirks setting force_caps to ACER_CAP_KBD_DOCK (these devices have no
other acer-wmi based functionality).

The new SW_TABLET_MODE functionality can be tested on devices which
are not in the DMI table by passing acer_wmi.force_caps=0x40 on the
kernel commandline.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 108 +++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 8bf9e6ed38a4..68d1a0c8c205 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -30,6 +30,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <acpi/video.h>
 
+ACPI_MODULE_NAME(KBUILD_MODNAME);
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
 MODULE_LICENSE("GPL");
@@ -80,7 +81,7 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
 
 enum acer_wmi_event_ids {
 	WMID_HOTKEY_EVENT = 0x1,
-	WMID_ACCEL_EVENT = 0x5,
+	WMID_ACCEL_OR_KBD_DOCK_EVENT = 0x5,
 };
 
 static const struct key_entry acer_wmi_keymap[] __initconst = {
@@ -127,7 +128,9 @@ struct event_return_value {
 	u8 function;
 	u8 key_num;
 	u16 device_state;
-	u32 reserved;
+	u16 reserved1;
+	u8 kbd_dock_state;
+	u8 reserved2;
 } __attribute__((packed));
 
 /*
@@ -211,6 +214,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BRIGHTNESS		BIT(3)
 #define ACER_CAP_THREEG			BIT(4)
 #define ACER_CAP_SET_FUNCTION_MODE	BIT(5)
+#define ACER_CAP_KBD_DOCK		BIT(6)
 
 /*
  * Interface type flags
@@ -316,6 +320,15 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
+static int __init set_force_caps(const struct dmi_system_id *dmi)
+{
+	if (force_caps == -1) {
+		force_caps = (uintptr_t)dmi->driver_data;
+		pr_info("Found %s, set force_caps to 0x%x\n", dmi->ident, force_caps);
+	}
+	return 1;
+}
+
 static struct quirk_entry quirk_unknown = {
 };
 
@@ -494,6 +507,24 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = set_force_caps,
+		.ident = "Acer Aspire Switch 10 SW5-012",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire SW5-012"),
+		},
+		.driver_data = (void *)ACER_CAP_KBD_DOCK,
+	},
+	{
+		.callback = set_force_caps,
+		.ident = "Acer One 10 (S1003)",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
+		},
+		.driver_data = (void *)ACER_CAP_KBD_DOCK,
+	},
 	{}
 };
 
@@ -1536,6 +1567,71 @@ static int acer_gsensor_event(void)
 	return 0;
 }
 
+/*
+ * Switch series keyboard dock status
+ */
+static int acer_kbd_dock_state_to_sw_tablet_mode(u8 kbd_dock_state)
+{
+	switch (kbd_dock_state) {
+	case 0x01: /* Docked, traditional clamshell laptop mode */
+		return 0;
+	case 0x04: /* Stand-alone tablet */
+	case 0x40: /* Docked, tent mode, keyboard not usable */
+		return 1;
+	default:
+		pr_warn("Unknown kbd_dock_state 0x%02x\n", kbd_dock_state);
+	}
+
+	return 0;
+}
+
+static void acer_kbd_dock_get_initial_state(void)
+{
+	u8 *output, input[8] = { 0x05, 0x00, };
+	struct acpi_buffer input_buf = { sizeof(input), input };
+	struct acpi_buffer output_buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int sw_tablet_mode;
+
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input_buf, &output_buf);
+	if (ACPI_FAILURE(status)) {
+		ACPI_EXCEPTION((AE_INFO, status, "Error getting keyboard-dock initial status"));
+		return;
+	}
+
+	obj = output_buf.pointer;
+	if (!obj || obj->type != ACPI_TYPE_BUFFER || obj->buffer.length != 8) {
+		pr_err("Unexpected output format getting keyboard-dock initial status\n");
+		goto out_free_obj;
+	}
+
+	output = obj->buffer.pointer;
+	if (output[0] != 0x00 || (output[3] != 0x05 && output[3] != 0x45)) {
+		pr_err("Unexpected output [0]=0x%02x [3]=0x%02x getting keyboard-dock initial status\n",
+		       output[0], output[3]);
+		goto out_free_obj;
+	}
+
+	sw_tablet_mode = acer_kbd_dock_state_to_sw_tablet_mode(output[4]);
+	input_report_switch(acer_wmi_input_dev, SW_TABLET_MODE, sw_tablet_mode);
+
+out_free_obj:
+	kfree(obj);
+}
+
+static void acer_kbd_dock_event(const struct event_return_value *event)
+{
+	int sw_tablet_mode;
+
+	if (!has_cap(ACER_CAP_KBD_DOCK))
+		return;
+
+	sw_tablet_mode = acer_kbd_dock_state_to_sw_tablet_mode(event->kbd_dock_state);
+	input_report_switch(acer_wmi_input_dev, SW_TABLET_MODE, sw_tablet_mode);
+	input_sync(acer_wmi_input_dev);
+}
+
 /*
  * Rfkill devices
  */
@@ -1763,8 +1859,9 @@ static void acer_wmi_notify(u32 value, void *context)
 			sparse_keymap_report_event(acer_wmi_input_dev, scancode, 1, true);
 		}
 		break;
-	case WMID_ACCEL_EVENT:
+	case WMID_ACCEL_OR_KBD_DOCK_EVENT:
 		acer_gsensor_event();
+		acer_kbd_dock_event(&return_value);
 		break;
 	default:
 		pr_warn("Unknown function number - %d - %d\n",
@@ -1929,6 +2026,11 @@ static int __init acer_wmi_input_setup(void)
 	if (err)
 		goto err_free_dev;
 
+	if (has_cap(ACER_CAP_KBD_DOCK)) {
+		input_set_capability(acer_wmi_input_dev, EV_SW, SW_TABLET_MODE);
+		acer_kbd_dock_get_initial_state();
+	}
+
 	status = wmi_install_notify_handler(ACERWMID_EVENT_GUID,
 						acer_wmi_notify, NULL);
 	if (ACPI_FAILURE(status)) {
-- 
2.28.0

