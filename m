Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7363AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 11:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbiKQLFo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239598AbiKQLFh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 090A36DCC2
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 03:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNWk5ErpnHfassHKJwUWcI+cotxFKTYyCdMYilzgRkQ=;
        b=hmmpbU6FFzr3ITSt13dqxWfzEqQT5cLhYP1ia/UzO3Z6if1yw+MqiE+xfT3WBWGlW5t+l+
        2UOPenasZyn8b0KxsZu1j0CoAxCWlywV4LEKmA1k+vxdLOPCsSAUzEHk3no5SwcBxu03od
        0ek6WzdxkwEZTQSKPcpErEv8wEjKtRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-e2-5Q_EiNq2k3hzJNYXUQg-1; Thu, 17 Nov 2022 06:02:55 -0500
X-MC-Unique: e2-5Q_EiNq2k3hzJNYXUQg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD649811E75;
        Thu, 17 Nov 2022 11:02:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A970B492B04;
        Thu, 17 Nov 2022 11:02:52 +0000 (UTC)
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
Subject: [PATCH v2 2/6] platform/x86: ideapad-laptop: Do not send KEY_TOUCHPAD* events on probe / resume
Date:   Thu, 17 Nov 2022 12:02:40 +0100
Message-Id: <20221117110244.67811-3-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
References: <20221117110244.67811-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The sending of KEY_TOUCHPAD* events is causing spurious touchpad OSD
showing on resume.

Disable the sending of events on probe / resume to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index dcb3a82024da..eb0b1ec32c13 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1487,7 +1487,7 @@ static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
 /*
  * module init/exit
  */
-static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
+static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
 	unsigned char param;
@@ -1508,8 +1508,11 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
 	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
 	 */
 	i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
-	ideapad_input_report(priv, value ? 67 : 66);
-	sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
+
+	if (send_events) {
+		ideapad_input_report(priv, value ? 67 : 66);
+		sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
+	}
 }
 
 static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
@@ -1550,7 +1553,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 			ideapad_sync_rfk_state(priv);
 			break;
 		case 5:
-			ideapad_sync_touchpad_state(priv);
+			ideapad_sync_touchpad_state(priv, true);
 			break;
 		case 4:
 			ideapad_backlight_notify_brightness(priv);
@@ -1840,7 +1843,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 			ideapad_register_rfkill(priv, i);
 
 	ideapad_sync_rfk_state(priv);
-	ideapad_sync_touchpad_state(priv);
+	ideapad_sync_touchpad_state(priv, false);
 
 	err = ideapad_dytc_profile_init(priv);
 	if (err) {
@@ -1925,7 +1928,7 @@ static int ideapad_acpi_resume(struct device *dev)
 	struct ideapad_private *priv = dev_get_drvdata(dev);
 
 	ideapad_sync_rfk_state(priv);
-	ideapad_sync_touchpad_state(priv);
+	ideapad_sync_touchpad_state(priv, false);
 
 	if (priv->dytc)
 		dytc_profile_refresh(priv);
-- 
2.38.1

