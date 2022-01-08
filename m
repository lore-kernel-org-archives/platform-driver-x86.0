Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F2CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  8 Jan 2022 15:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiAHPt5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 Jan 2022 10:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45717 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234601AbiAHPtz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Jan 2022 10:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641656991;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=xz8oASpeQpgw9iy9uVP6clRnsNye1r8H5qRWvsSCEG0=;
        b=HAFGiN5lqzAAnKP8jbgv/IaVjXtjgbTWCyaMHmGjL8GRqPzfgFIFElyDtp/IZ4lJYhZ3fc
        iNtCmzKuNdy6IupPG3wXh7eLUJHdkZCi28eGFdfPyPQKJjKyUhMPGxMc8acUh/qucUvf2b
        Yieq1onMpTI1huETFtIq2MkO8m9d/58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-FKIC41oTPamTvcM832Frpg-1; Sat, 08 Jan 2022 10:49:50 -0500
X-MC-Unique: FKIC41oTPamTvcM832Frpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95ADA1006ADC;
        Sat,  8 Jan 2022 15:49:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A02928588D;
        Sat,  8 Jan 2022 15:49:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Fix GPIO lookup leak on error-exit
Date:   Sat,  8 Jan 2022 16:49:47 +0100
Message-Id: <20220108154947.136593-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix leaking the registered gpiod_lookup tables when the kcalloc() for the
i2c_clients array fails.

Fixes: ef2ac11493e2 ("platform/x86: x86-android-tablets: Add support for registering GPIO lookup tables")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index d39da5fca6c5..3ba63ad91b28 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -815,8 +815,10 @@ static __init int x86_android_tablet_init(void)
 		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
 
 	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
-	if (!i2c_clients)
+	if (!i2c_clients) {
+		x86_android_tablet_cleanup();
 		return -ENOMEM;
+	}
 
 	i2c_client_count = dev_info->i2c_client_count;
 	for (i = 0; i < i2c_client_count; i++) {
-- 
2.33.1

