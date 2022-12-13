Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD96C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Dec 2022 12:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbiLMMao (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Dec 2022 07:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiLMMan (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 07:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829C71EC4E
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 04:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670934590;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TBGFcZQZJdHP+Sjrs28zDcRr9lSzrDG5ICjgGtDdAA0=;
        b=OFBxy8Mt5jF7RRTARBc0dQnI5Q3JFsNssoVlDuUi/CnR8f9jgpFKuQEhIF0eB9piM/DJUJ
        QEyCA4120Sm3nx/be8z93+tByXejc6xgbu6fPgTYt4MbFo5YjhDUFhLEs14ff1Fyq+hxQR
        OaqRxhc1bYcpZPEKFa/7QdAVfuTmRDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-kSdJF9ebNpi1_veIuibWMA-1; Tue, 13 Dec 2022 07:29:47 -0500
X-MC-Unique: kSdJF9ebNpi1_veIuibWMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 092B28027EC;
        Tue, 13 Dec 2022 12:29:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.225])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1B5D040ED784;
        Tue, 13 Dec 2022 12:29:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mattia Dongili <malattia@linux.it>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: sony-laptop: Don't turn off 0x153 keyboard backlight during probe
Date:   Tue, 13 Dec 2022 13:29:43 +0100
Message-Id: <20221213122943.11123-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The 0x153 version of the kbd backlight control SNC handle has no separate
address to probe if the backlight is there.

This turns the probe call into a set keyboard backlight call with a value
of 0 turning off the keyboard backlight.

Skip probing when there is no separate probe address to avoid this.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=1583752
Fixes: 800f20170dcf ("Keyboard backlight control for some Vaio Fit models")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/sony-laptop.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 765fcaba4d12..5ff5aaf92b56 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1888,14 +1888,21 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
 		break;
 	}
 
-	ret = sony_call_snc_handle(handle, probe_base, &result);
-	if (ret)
-		return ret;
+	/*
+	 * Only probe if there is a separate probe_base, otherwise the probe call
+	 * is equivalent to __sony_nc_kbd_backlight_mode_set(0), resulting in
+	 * the keyboard backlight being turned off.
+	 */
+	if (probe_base) {
+		ret = sony_call_snc_handle(handle, probe_base, &result);
+		if (ret)
+			return ret;
 
-	if ((handle == 0x0137 && !(result & 0x02)) ||
-			!(result & 0x01)) {
-		dprintk("no backlight keyboard found\n");
-		return 0;
+		if ((handle == 0x0137 && !(result & 0x02)) ||
+				!(result & 0x01)) {
+			dprintk("no backlight keyboard found\n");
+			return 0;
+		}
 	}
 
 	kbdbl_ctl = kzalloc(sizeof(*kbdbl_ctl), GFP_KERNEL);
-- 
2.38.1

