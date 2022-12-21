Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F2FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 22:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiLUWIZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 17:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiLUWIY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 17:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3971A38F
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 14:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671660456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ninGwoPLjB6u8dDjHaJ7uoqmUYLWyZVar3nn3buV4jI=;
        b=Est7J0hOF8cCGyS4dSjksbgfK3tlDnA/Ohl23TpFxNOy/8R9yWS83ZUNrg4f4bASfBS03K
        A8uOcoMc4cpm01mDJtjPbx7q165VXDL/cmLcbSQphzpw7vHbdWPFVo74qv8e2fFKKV8nhX
        jN71EYza/fEcjG1UkfmdrKStKKXJ2uk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462--pSh4-CDOJGA53IJoPfAVA-1; Wed, 21 Dec 2022 17:07:35 -0500
X-MC-Unique: -pSh4-CDOJGA53IJoPfAVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80BE918E0A60;
        Wed, 21 Dec 2022 22:07:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.84])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA4D5492C14;
        Wed, 21 Dec 2022 22:07:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: dell-privacy: Only register SW_CAMERA_LENS_COVER if present
Date:   Wed, 21 Dec 2022 23:07:24 +0100
Message-Id: <20221221220724.119594-2-hdegoede@redhat.com>
In-Reply-To: <20221221220724.119594-1-hdegoede@redhat.com>
References: <20221221220724.119594-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Unlike keys where userspace only reacts to keypresses, userspace may act
on switches in both (0 and 1) of their positions.

For example if a SW_TABLET_MODE switch is registered then GNOME will not
automatically show the onscreen keyboard when a text field gets focus on
touchscreen devices when SW_TABLET_MODE reports 0 and when SW_TABLET_MODE
reports 1 libinput will block (filter out) builtin keyboard and touchpad
events.

So to avoid unwanted side-effects EV_SW type inputs should only be
registered if they are actually present, only register SW_CAMERA_LENS_COVER
if it is actually there.

Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-privacy.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
index 915d5deeb971..c517bd45dd32 100644
--- a/drivers/platform/x86/dell/dell-wmi-privacy.c
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
@@ -296,7 +296,7 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct privacy_wmi_data *priv;
 	struct key_entry *keymap;
-	int ret, i;
+	int ret, i, j;
 
 	ret = wmi_has_guid(DELL_PRIVACY_GUID);
 	if (!ret)
@@ -327,9 +327,20 @@ static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
 	/* remap the keymap code with Dell privacy key type 0x12 as prefix
 	 * KEY_MICMUTE scancode will be reported as 0x120001
 	 */
-	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
-		keymap[i] = dell_wmi_keymap_type_0012[i];
-		keymap[i].code |= (0x0012 << 16);
+	for (i = 0, j = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
+		/*
+		 * Unlike keys where only presses matter, userspace may act
+		 * on switches in both of their positions. Only register
+		 * SW_CAMERA_LENS_COVER if it is actually there.
+		 */
+		if (dell_wmi_keymap_type_0012[i].type == KE_VSW &&
+		    dell_wmi_keymap_type_0012[i].sw.code == SW_CAMERA_LENS_COVER &&
+		    !(priv->features_present & BIT(DELL_PRIVACY_TYPE_CAMERA)))
+			continue;
+
+		keymap[j] = dell_wmi_keymap_type_0012[i];
+		keymap[j].code |= (0x0012 << 16);
+		j++;
 	}
 	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
 	kfree(keymap);
-- 
2.38.1

