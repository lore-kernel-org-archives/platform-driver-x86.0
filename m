Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB93C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 15:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbiKPP0C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 10:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbiKPPZ7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 10:25:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874D5E7C
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668612307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pWMinRwgZ4895lXofqzv4ZFcPbMe46qqkscFBTnOW3s=;
        b=bEMeqFYhowCfvAF6worzo17kt74hRYe/sTI+EH9Yt5rH7m/evo8J3Tf9jDz1e2K8xNb2e0
        DdrlkBzQ+j+N3embno3w9AcSIg5ibTg7bwXGHh8isUjxV8Zmx5i4nnT9VLPIxmDJerSLbY
        mmWL1wSbWD6igaRv/uNKLUxIrvOAG4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-KwP7V2TwPc6_Dgf2u1h-HQ-1; Wed, 16 Nov 2022 10:25:04 -0500
X-MC-Unique: KwP7V2TwPc6_Dgf2u1h-HQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F5A0185A792;
        Wed, 16 Nov 2022 15:25:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.78])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 63951492B04;
        Wed, 16 Nov 2022 15:25:01 +0000 (UTC)
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
Subject: [PATCH 1/3] platform/x86: ideapad-laptop: Refactor ideapad_sync_touchpad_state()
Date:   Wed, 16 Nov 2022 16:24:46 +0100
Message-Id: <20221116152448.698707-2-hdegoede@redhat.com>
In-Reply-To: <20221116152448.698707-1-hdegoede@redhat.com>
References: <20221116152448.698707-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add an error exit for read_ec_data() failing instead of putting the main
body in an if (success) block.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 13e3ae731fd8..dcb3a82024da 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1490,23 +1490,26 @@ static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
 {
 	unsigned long value;
+	unsigned char param;
+	int ret;
 
 	if (!priv->features.touchpad_ctrl_via_ec)
 		return;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
-	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
-		unsigned char param;
-		/*
-		 * Some IdeaPads don't really turn off touchpad - they only
-		 * switch the LED state. We (de)activate KBC AUX port to turn
-		 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
-		 * KEY_TOUCHPAD_ON to not to get out of sync with LED
-		 */
-		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
-		ideapad_input_report(priv, value ? 67 : 66);
-		sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
-	}
+	ret = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value);
+	if (ret)
+		return;
+
+	/*
+	 * Some IdeaPads don't really turn off touchpad - they only
+	 * switch the LED state. We (de)activate KBC AUX port to turn
+	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
+	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
+	 */
+	i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
+	ideapad_input_report(priv, value ? 67 : 66);
+	sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
 }
 
 static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
-- 
2.38.1

