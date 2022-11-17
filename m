Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9F4C4167D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 11:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239518AbiKQLGH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239595AbiKQLF4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 06:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924F25C767
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 03:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668682984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1IBqqBj4ZQPYw8m5l52rqfOQ1Hw1KkO5q+akaHq+zXY=;
        b=R5HwUV/jKIG4COSnjSgUhUsVleTScF4/R5mRSjHp6UVLs++ZEjmzsAij/dwUaKQr1ojx1w
        s8GK515v2C+DHgGLqXm66Gx/zIMFbbdXhY8yDUwfAW9KXZjWbm4sT48jNYmIIazptj4WbW
        hUtGkUC7Lpnvqzgp384zcLAqGZ4j8Ss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-qUsF3QrnPEqbSYgIuRkiGw-1; Thu, 17 Nov 2022 06:03:00 -0500
X-MC-Unique: qUsF3QrnPEqbSYgIuRkiGw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95568101A54E;
        Thu, 17 Nov 2022 11:02:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 70916492B04;
        Thu, 17 Nov 2022 11:02:57 +0000 (UTC)
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
Subject: [PATCH v2 4/6] platform/x86: ideapad-laptop: Send KEY_TOUCHPAD_TOGGLE on some models
Date:   Thu, 17 Nov 2022 12:02:42 +0100
Message-Id: <20221117110244.67811-5-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
References: <20221117110244.67811-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On recent Ideapad models the EC does not control the touchpad at all,
so instead of sending KEY_TOUCHPAD_ON/ _OFF on touchpad toggle hotkey
events, ideapad-laptop should send KEY_TOUCHPAD_TOGGLE and let userspace
handle the toggling.

Check for this by checking if the value read from VPCCMD_R_TOUCHPAD
actually changes when receiving a touchpad-toggle hotkey event; and
if it does not change send KEY_TOUCHPAD_TOGGLE to userspace to let
userspace enable/disable the touchpad in software.

Note this also drops the priv->features.touchpad_ctrl_via_ec check from
ideapad_sync_touchpad_state() so that KEY_TOUCHPAD_TOGGLE will be send
on laptops where this is not set too. This can be safely dropped now
because the i8042_command(I8042_CMD_AUX_ENABLE/_DISABLE) call is now
guarded by its own feature flag.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1d86fb988d56..9b36cfddd36f 100644
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
@@ -650,6 +651,8 @@ static ssize_t touchpad_show(struct device *dev,
 	if (err)
 		return err;
 
+	priv->r_touchpad_val = result;
+
 	return sysfs_emit(buf, "%d\n", !!result);
 }
 
@@ -669,6 +672,8 @@ static ssize_t touchpad_store(struct device *dev,
 	if (err)
 		return err;
 
+	priv->r_touchpad_val = state;
+
 	return count;
 }
 
@@ -1159,6 +1164,7 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,  65, { KEY_PROG4 } },
 	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
+	{ KE_KEY,  68, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY, 128, { KEY_ESC } },
 
 	/*
@@ -1500,9 +1506,6 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	unsigned char param;
 	int ret;
 
-	if (!priv->features.touchpad_ctrl_via_ec)
-		return;
-
 	/* Without reading from EC touchpad LED doesn't switch state */
 	ret = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value);
 	if (ret)
@@ -1518,9 +1521,20 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 
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
-- 
2.38.1

