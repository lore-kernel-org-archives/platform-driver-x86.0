Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2FFC43219
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 11:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239730AbiKQLGF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:06:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239546AbiKQLFw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDD16D4BD
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 03:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LRaCvczVhvVc9GdsEgzPVuSh+KVGxZZjapZg2LVnDIg=;
        b=R/q1tK/kHMHqS8axEdAqHr3RuLOjrVu0UGhCF5fjMFoF/i8KxCLzGWQfAZ06B4dmf835lW
        N1KpKpzClI/lnUVp/vmTlGBKaYinRykpOSmu93oXhEgkUknc3SNiyWjpkynMKekacq/u+U
        998h/2Fs2aLeiJ3DM4knLydkTCpDMe0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-ePRrKtaJOhOD0S6UIPG45w-1; Thu, 17 Nov 2022 06:02:57 -0500
X-MC-Unique: ePRrKtaJOhOD0S6UIPG45w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B722811E67;
        Thu, 17 Nov 2022 11:02:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0FBB8492B04;
        Thu, 17 Nov 2022 11:02:54 +0000 (UTC)
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
Subject: [PATCH v2 3/6] platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on select models
Date:   Thu, 17 Nov 2022 12:02:41 +0100
Message-Id: <20221117110244.67811-4-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
References: <20221117110244.67811-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recently there have been multiple patches to disable the ideapad-laptop's
touchpad control code, because it is causing issues on various laptops:

Commit d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634")
Commit a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_switch")

The turning on/off of the ps2 aux port was added specifically for
the IdeaPad Z570, where the EC does toggle the touchpad on/off LED and
toggles the value returned by reading VPCCMD_R_TOUCHPAD, but it does not
actually turn on/off the touchpad.

The ideapad-laptop code really should not be messing with the i8042
controller on all devices just for this special case.

Add a new ctrl_ps2_aux_port flag set based on a DMI based allow-list
for devices which need this workaround, populating it with just
the Ideapad Z570 for now.

This also adds a module parameter so that this behavior can easily
be enabled on other models which may need it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 29 ++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index eb0b1ec32c13..1d86fb988d56 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -143,6 +143,7 @@ struct ideapad_private {
 		bool hw_rfkill_switch     : 1;
 		bool kbd_bl               : 1;
 		bool touchpad_ctrl_via_ec : 1;
+		bool ctrl_ps2_aux_port    : 1;
 		bool usb_charging         : 1;
 	} features;
 	struct {
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
@@ -1507,7 +1514,8 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
 	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
 	 */
-	i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
+	if (priv->features.ctrl_ps2_aux_port)
+		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 
 	if (send_events) {
 		ideapad_input_report(priv, value ? 67 : 66);
@@ -1615,6 +1623,23 @@ static const struct dmi_system_id hw_rfkill_list[] = {
 	{}
 };
 
+/*
+ * On some models the EC toggles the touchpad muted LED on touchpad toggle
+ * hotkey presses, but the EC does not actually disable the touchpad itself.
+ * On these models the driver needs to explicitly enable/disable the i8042
+ * (PS/2) aux port.
+ */
+static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
+	{
+	/* Lenovo Ideapad Z570 */
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
+		},
+	},
+	{}
+};
+
 static const struct dmi_system_id no_touchpad_switch_list[] = {
 	{
 	.ident = "Lenovo Yoga 3 Pro 1370",
@@ -1642,6 +1667,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
 		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
 	priv->features.hw_rfkill_switch =
 		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
+	priv->features.ctrl_ps2_aux_port =
+		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
 
 	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
 	if (acpi_dev_present("ELAN0634", NULL, -1))
-- 
2.38.1

