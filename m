Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF113C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 22:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbiLUWI1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 17:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiLUWI0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 17:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548331A822
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 14:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671660459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=WghiOn+UacOkRZNSD+p+30/KlcKlQpDG2IXMwILxPoU=;
        b=RNdgdE45E6jsvM84faiOIQ6vnTOt9oBXZ6r4wKx9rN2YL3O2aU/uKii5sVvaqrMIeFb69t
        mbbliyj8hHulbosfq89Jn6xcg1GFsNzwrFRDpl7e8Rz4scihh1QB46Bl4lpTnoPb1/mx/r
        KwAGmZEeExgn7Xz6g3m/Uzo64kv6xtk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-lKqFJ2jhOoCKgZsUYJdf2w-1; Wed, 21 Dec 2022 17:07:33 -0500
X-MC-Unique: lKqFJ2jhOoCKgZsUYJdf2w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 734B129AA3BA;
        Wed, 21 Dec 2022 22:07:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.84])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9998C492C14;
        Wed, 21 Dec 2022 22:07:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: dell-privacy: Fix SW_CAMERA_LENS_COVER reporting
Date:   Wed, 21 Dec 2022 23:07:23 +0100
Message-Id: <20221221220724.119594-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use KE_VSW instead of KE_SW for the SW_CAMERA_LENS_COVER key_entry
and get the value of the switch from the status field when handling
SW_CAMERA_LENS_COVER events, instead of always reporting 0.

Also correctly set the initial SW_CAMERA_LENS_COVER value.

Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-privacy.c | 22 ++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
index c82b3d6867c5..915d5deeb971 100644
--- a/drivers/platform/x86/dell/dell-wmi-privacy.c
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
@@ -61,7 +61,7 @@ static const struct key_entry dell_wmi_keymap_type_0012[] = {
 	/* privacy mic mute */
 	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
 	/* privacy camera mute */
-	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
+	{ KE_VSW, 0x0002, { SW_CAMERA_LENS_COVER } },
 	{ KE_END, 0},
 };
 
@@ -115,11 +115,15 @@ bool dell_privacy_process_event(int type, int code, int status)
 
 	switch (code) {
 	case DELL_PRIVACY_AUDIO_EVENT: /* Mic mute */
-	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
 		priv->last_status = status;
 		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
 		ret = true;
 		break;
+	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
+		priv->last_status = status;
+		sparse_keymap_report_entry(priv->input_dev, key, !(status & CAMERA_STATUS), false);
+		ret = true;
+		break;
 	default:
 		dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x\n", type, code);
 	}
@@ -304,6 +308,11 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, priv);
 	priv->wdev = wdev;
+
+	ret = get_current_status(priv->wdev);
+	if (ret)
+		return ret;
+
 	/* create evdev passing interface */
 	priv->input_dev = devm_input_allocate_device(&wdev->dev);
 	if (!priv->input_dev)
@@ -331,11 +340,12 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
 	priv->input_dev->name = "Dell Privacy Driver";
 	priv->input_dev->id.bustype = BUS_HOST;
 
-	ret = input_register_device(priv->input_dev);
-	if (ret)
-		return ret;
+	/* Report initial camera-cover status */
+	if (priv->features_present & BIT(DELL_PRIVACY_TYPE_CAMERA))
+		input_report_switch(priv->input_dev, SW_CAMERA_LENS_COVER,
+				    !(priv->last_status & CAMERA_STATUS));
 
-	ret = get_current_status(priv->wdev);
+	ret = input_register_device(priv->input_dev);
 	if (ret)
 		return ret;
 
-- 
2.38.1

