Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95361C636CB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 14:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7314B61380
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 14:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbhGQOjM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 10:39:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24259 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230003AbhGQOjM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 10:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626532575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rp7gfNNbbPEoiekEAnwZJG6eTYP3MAc9EGQ01ITpcsI=;
        b=EYej6cLS65tZs96iMZJqeARIubrOtVXjC6UBrsubGYIB+HoRiTJRbgKi/Bqhtk18STg3ou
        JaKs9Asn/50IINp330UuhL9gyRarHf7aWLBeI/sek7GgdIXGIBm3RULDDtw92VYf9dwGnL
        zQ/KrO3Qfnmy121KQn1DwEWBzV4yYBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-ePDtgV22PlmHNq90qh9V2A-1; Sat, 17 Jul 2021 10:36:13 -0400
X-MC-Unique: ePDtgV22PlmHNq90qh9V2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B62BF800050;
        Sat, 17 Jul 2021 14:36:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-16.ams2.redhat.com [10.36.112.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1235D6D7;
        Sat, 17 Jul 2021 14:36:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: think-lmi: Fix possible mem-leaks on tlmi_analyze() error-exit
Date:   Sat, 17 Jul 2021 16:36:07 +0200
Message-Id: <20210717143607.3580-3-hdegoede@redhat.com>
In-Reply-To: <20210717143607.3580-1-hdegoede@redhat.com>
References: <20210717143607.3580-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix 2 possible memleaks on error-exits from tlmi_analyze():

1. If the kzalloc of pwd_power fails, then not only free the atributes,
   but also the allocated pwd_admin struct.

2. Freeing the attributes should also free the possible_values strings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index c22edcf26aaa..6cfed4427fb0 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -866,7 +866,7 @@ static int tlmi_analyze(void)
 	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
 	if (!tlmi_priv.pwd_power) {
 		ret = -ENOMEM;
-		goto fail_clear_attr;
+		goto fail_free_pwd_admin;
 	}
 	strscpy(tlmi_priv.pwd_power->kbdlang, "us", TLMI_LANG_MAXLEN);
 	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
@@ -882,9 +882,15 @@ static int tlmi_analyze(void)
 
 	return 0;
 
+fail_free_pwd_admin:
+	kfree(tlmi_priv.pwd_admin);
 fail_clear_attr:
-	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
-		kfree(tlmi_priv.setting[i]);
+	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
+		if (tlmi_priv.setting[i]) {
+			kfree(tlmi_priv.setting[i]->possible_values);
+			kfree(tlmi_priv.setting[i]);
+		}
+	}
 	return ret;
 }
 
-- 
2.31.1

