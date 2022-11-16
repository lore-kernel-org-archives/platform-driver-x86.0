Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E1AC43217
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 15:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbiKPP0T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234557AbiKPP0K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 10:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846D710568
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668612314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UVKYHXcO6OZEytR7jpWXBoY8RokLpP7AXiUeK319vCY=;
        b=Yj+sA7kQ+caQsoeKj9fFvTz56UiqegGNRytZQtKb09dGfPrwmF3qjzof8ineNjH87uWLDk
        2GC5v4gagG6bvmm4eKqjLAzVAeMkMuudFstR68eMyhbMjLykBvgobGWfVto0bvUoS1JfRl
        /R2PqO6z+5XmUePL2jQyetLDDTOA9t4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-Y9dVb_KPP9Ki7PGmmeAcWg-1; Wed, 16 Nov 2022 10:25:09 -0500
X-MC-Unique: Y9dVb_KPP9Ki7PGmmeAcWg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50E563C0F674;
        Wed, 16 Nov 2022 15:25:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.78])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2AFD1492B04;
        Wed, 16 Nov 2022 15:25:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: ideapad-laptop: Rework touchpad control code
Date:   Wed, 16 Nov 2022 16:24:48 +0100
Message-Id: <20221116152448.698707-4-hdegoede@redhat.com>
In-Reply-To: <20221116152448.698707-1-hdegoede@redhat.com>
References: <20221116152448.698707-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recently there have been multiple patches to disable the ideapad-laptop's
touchpad control code, because it is causing issues on various laptops,
see the Fixes tags for this commit.

The turning on/off of the ps2 aux port was added specifically for
the IdeaPad Z570, where the EC does toggle the touchpad on/off LED and
toggles the value returned by reading VPCCMD_R_TOUCHPAD, but it does not
actually turn on/off the touchpad.

The ideapad-laptop code really should not be messing with the i8042
controller on all devices just for this special case.

Drop the touchpad_ctrl_via_ec flag and add a DMI based allow-list for
devices which need this workaround, populating it with just the
Ideapad Z570 for now.

A related problem is that on recent Ideapad models the EC does not control
the touchpad at all. Check for this by checking if the value read from
VPCCMD_R_TOUCHPAD actually changes when receiving a touchpad-toggle hotkey
event; and if it does not change send KEY_TOUCHPAD_TOGGLE to userspace to
let userspace enable/disable the touchpad in software.

Fixes: d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634")
Fixes: a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_switch")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 69 ++++++++++++++-------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index eb0b1ec32c13..2654e3668c1a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -134,6 +134,7 @@ struct ideapad_private {
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
 	unsigned long cfg;
+	unsigned long r_touchpad_val;
 	struct {
 		bool conservation_mode    : 1;
 		bool dytc                 : 1;
@@ -142,8 +143,8 @@ struct ideapad_private {
 		bool set_fn_lock_led      : 1;
 		bool hw_rfkill_switch     : 1;
 		bool kbd_bl               : 1;
-		bool touchpad_ctrl_via_ec : 1;
 		bool usb_charging         : 1;
+		bool ctrl_ps2_aux_port    : 1;
 	} features;
 	struct {
 		bool initialized;
@@ -174,6 +175,12 @@ MODULE_PARM_DESC(set_fn_lock_led,
 	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
 	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
+static bool ctrl_ps2_aux_port;
+module_param(ctrl_ps2_aux_port, bool, 0444);
+MODULE_PARM_DESC(ctrl_ps2_aux_port,
+	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
 /*
  * shared data
  */
@@ -729,8 +736,6 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 		supported = priv->features.fan_mode;
 	else if (attr == &dev_attr_fn_lock.attr)
 		supported = priv->features.fn_lock;
-	else if (attr == &dev_attr_touchpad.attr)
-		supported = priv->features.touchpad_ctrl_via_ec;
 	else if (attr == &dev_attr_usb_charging.attr)
 		supported = priv->features.usb_charging;
 
@@ -1152,6 +1157,7 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,  65, { KEY_PROG4 } },
 	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
+	{ KE_KEY,  68, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY, 128, { KEY_ESC } },
 
 	/*
@@ -1493,9 +1499,6 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	unsigned char param;
 	int ret;
 
-	if (!priv->features.touchpad_ctrl_via_ec)
-		return;
-
 	/* Without reading from EC touchpad LED doesn't switch state */
 	ret = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value);
 	if (ret)
@@ -1504,15 +1507,26 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	/*
 	 * Some IdeaPads don't really turn off touchpad - they only
 	 * switch the LED state. We (de)activate KBC AUX port to turn
-	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
-	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
+	 * the touchpad on and off.
 	 */
-	i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
+	if (priv->features.ctrl_ps2_aux_port)
+		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 
 	if (send_events) {
-		ideapad_input_report(priv, value ? 67 : 66);
-		sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
+		/*
+		 * On older models the EC controls the touchpad and toggles it
+		 * on/off itself, in this case we report KEY_TOUCHPAD_ON/_OFF.
+		 * If the EC did not toggle, report KEY_TOUCHPAD_TOGGLE.
+		 */
+		if (value != priv->r_touchpad_val) {
+			ideapad_input_report(priv, value ? 67 : 66);
+			sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
+		} else {
+			ideapad_input_report(priv, 68);
+		}
 	}
+
+	priv->r_touchpad_val = value;
 }
 
 static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
@@ -1615,19 +1629,18 @@ static const struct dmi_system_id hw_rfkill_list[] = {
 	{}
 };
 
-static const struct dmi_system_id no_touchpad_switch_list[] = {
-	{
-	.ident = "Lenovo Yoga 3 Pro 1370",
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
-		},
-	},
+/*
+ * On some models the EC toggles the touchpad muted LED on touchpad toggle
+ * hotkey presses, but the EC does not actually disable the touchpad itself.
+ * On these models the driver needs to explicitly enable/disable the i8042
+ * (PS/2) aux port.
+ */
+static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
 	{
-	.ident = "ZhaoYang K4e-IML",
+	/* Lenovo Ideapad Z570 */
 	.matches = {
 		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		DMI_MATCH(DMI_PRODUCT_VERSION, "ZhaoYang K4e-IML"),
+		DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
 		},
 	},
 	{}
@@ -1642,14 +1655,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
 		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
 	priv->features.hw_rfkill_switch =
 		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
-
-	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
-	if (acpi_dev_present("ELAN0634", NULL, -1))
-		priv->features.touchpad_ctrl_via_ec = 0;
-	else if (dmi_check_system(no_touchpad_switch_list))
-		priv->features.touchpad_ctrl_via_ec = 0;
-	else
-		priv->features.touchpad_ctrl_via_ec = 1;
+	priv->features.ctrl_ps2_aux_port =
+		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
@@ -1834,10 +1841,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (!priv->features.hw_rfkill_switch)
 		write_ec_cmd(priv->adev->handle, VPCCMD_W_RF, 1);
 
-	/* The same for Touchpad */
-	if (!priv->features.touchpad_ctrl_via_ec)
-		write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, 1);
-
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 		if (test_bit(ideapad_rfk_data[i].cfgbit, &priv->cfg))
 			ideapad_register_rfkill(priv, i);
-- 
2.38.1

