Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA355C4167B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 11:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239546AbiKQLGG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239597AbiKQLF4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208AB5D683
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LIfJxYNayf8A1p37RaYfq49FFiw1yFq2ADje3ueerQ0=;
        b=AxzJ8bidChrf5VF/sRl4HtVgRAhyxRtWCVdPu3r37eM4GhFOkNRrPiIMGrBUTCIq4X04e7
        An2vJU7ytuIPsL99q+Hrp29v/BIO9EKyEscStVu+ioXyUiTcagzYKUiO9ZOy7XeRfRNk1R
        pUrWGsshtim+eIZgXChVlGkpVnzs5eU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-kg5IcgB0PNyPn3xWa93mvQ-1; Thu, 17 Nov 2022 06:03:05 -0500
X-MC-Unique: kg5IcgB0PNyPn3xWa93mvQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62EE1101A595;
        Thu, 17 Nov 2022 11:03:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 33C68492B04;
        Thu, 17 Nov 2022 11:03:02 +0000 (UTC)
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
Subject: [PATCH v2 6/6] platform/x86: ideapad-laptop: Make touchpad_ctrl_via_ec a module option
Date:   Thu, 17 Nov 2022 12:02:44 +0100
Message-Id: <20221117110244.67811-7-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
References: <20221117110244.67811-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove the ACPI-HID + DMI-id deny-lists for touchpad_ctrl_via_ec and
instead make it a module option which defaults to false.

The touchpad sysfs attribute allowing directly writing VPCCMD_W_TOUCHPAD
from userspace has been leading to a lot of bug-reports / patches adding
both ACPI HID + dmi-id based deny-lists for it which then need to be
expanded all the time going forward leading to a high maintenance load.

At the same time the touchpad sysfs attribute is not a standard Linux
userspace API. So it is not used in standard desktop-enviroments, instead
it is only used in the following 2 rare circumstances:

1. Ideapad specific control-panel like applets
2. Custom scripts written by users

For 1. these applets need to already deal with the touchpad sysfs attr
sometimes not being there because of the existing deny lists so hiding
it be default should not cause an issue; and most desktop environments
already have a touchpad-disable option in their native control-panel,
so having an ideapad specific toggle for this is not necessary.

For 2. since these users are already customizing their systems they
can add the module option if they want to keep using the touchpad
sysfs attribute.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 33 ++++++---------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index fc3d47a75944..435d2d3d903b 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -182,6 +182,12 @@ MODULE_PARM_DESC(ctrl_ps2_aux_port,
 	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
 	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
+static bool touchpad_ctrl_via_ec;
+module_param(touchpad_ctrl_via_ec, bool, 0444);
+MODULE_PARM_DESC(touchpad_ctrl_via_ec,
+	"Enable registering a 'touchpad' sysfs-attribute which can be used to manually "
+	"tell the EC to enable/disable the touchpad. This may not work on all models.");
+
 /*
  * shared data
  */
@@ -1654,24 +1660,6 @@ static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
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
-	{
-	.ident = "ZhaoYang K4e-IML",
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		DMI_MATCH(DMI_PRODUCT_VERSION, "ZhaoYang K4e-IML"),
-		},
-	},
-	{}
-};
-
 static void ideapad_check_features(struct ideapad_private *priv)
 {
 	acpi_handle handle = priv->adev->handle;
@@ -1683,14 +1671,7 @@ static void ideapad_check_features(struct ideapad_private *priv)
 		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
 	priv->features.ctrl_ps2_aux_port =
 		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
-
-	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
-	if (acpi_dev_present("ELAN0634", NULL, -1))
-		priv->features.touchpad_ctrl_via_ec = 0;
-	else if (dmi_check_system(no_touchpad_switch_list))
-		priv->features.touchpad_ctrl_via_ec = 0;
-	else
-		priv->features.touchpad_ctrl_via_ec = 1;
+	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode = true;
-- 
2.38.1

