Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BA0C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CEF761352
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhD1VyY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52680 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231380AbhD1VyX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mXQb5SssYm+Qr51jjse1jKyzMXwZ7Gev3EsN+ioOyCk=;
        b=I9cFfFFQW4Hm3ADxPgXu4eaPv2+p78mRvI5SGukTsKqDUEXaepIY3cz2SJm4pBU3HPOar1
        rzRyQB1wcvLCtBmvGRK1kxvidMyGyj7Qf2F+9vzsp3ZTCogO9fb/6DJVmlq+UdMIwForfG
        kzf0ye9dbtq/4xmiFOIQ2AnkpnnGEIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-8Tldj_2ONxS-cNtv5Yq9Zg-1; Wed, 28 Apr 2021 17:53:34 -0400
X-MC-Unique: 8Tldj_2ONxS-cNtv5Yq9Zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80230803631;
        Wed, 28 Apr 2021 21:53:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C704F5C1BB;
        Wed, 28 Apr 2021 21:53:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 7/9] usb: typec: altmodes/displayport: Make dp_altmode_notify() more generic
Date:   Wed, 28 Apr 2021 23:52:55 +0200
Message-Id: <20210428215257.500088-8-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make dp_altmode_notify() handle the dp->data.conf == 0 case too,
rather then having separate code-paths for this in various places
which call it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/altmodes/displayport.c | 35 +++++++++---------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b7f094435b00..aa669b9cf70e 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -66,10 +66,17 @@ struct dp_altmode {
 
 static int dp_altmode_notify(struct dp_altmode *dp)
 {
-	u8 state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
+	unsigned long conf;
+	u8 state;
+
+	if (dp->data.conf) {
+		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
+		conf = TYPEC_MODAL_STATE(state);
+	} else {
+		conf = TYPEC_STATE_USB;
+	}
 
-	return typec_altmode_notify(dp->alt, TYPEC_MODAL_STATE(state),
-				   &dp->data);
+	return typec_altmode_notify(dp->alt, conf, &dp->data);
 }
 
 static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
@@ -137,21 +144,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 
 static int dp_altmode_configured(struct dp_altmode *dp)
 {
-	int ret;
-
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
-
-	if (!dp->data.conf)
-		return typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
-					    &dp->data);
-
-	ret = dp_altmode_notify(dp);
-	if (ret)
-		return ret;
-
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
 
-	return 0;
+	return dp_altmode_notify(dp);
 }
 
 static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
@@ -172,13 +168,8 @@ static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 	}
 
 	ret = typec_altmode_vdm(dp->alt, header, &conf, 2);
-	if (ret) {
-		if (DP_CONF_GET_PIN_ASSIGN(dp->data.conf))
-			dp_altmode_notify(dp);
-		else
-			typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
-					     &dp->data);
-	}
+	if (ret)
+		dp_altmode_notify(dp);
 
 	return ret;
 }
-- 
2.31.1

