Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E71C77B60
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 10:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjD2Kvz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 06:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjD2Kvy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 06:51:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8FD10D4
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682765471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=U+C8Vr7DlyqOVGhXLe2hP//wP9KYVMEUwDACAO62OZs=;
        b=i/jaHEwGlsgfSr2IKxypy2v45IJd4EDQ5OqPEZ6IvmvSgUdAw78V7qTXGP0WRtlCVXbX+W
        kHe7xecT64qycmgHzJ9E3XrXp1TU01gpfYuVaVnMCHr53Qj+rzsZqjhWOXQ4D5XlJ+OGLk
        vdhhTR3CULuwSL1xf6aK9qr3GxlLEqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-VcxEZPTqOD-9q3beLnvnyg-1; Sat, 29 Apr 2023 06:51:07 -0400
X-MC-Unique: VcxEZPTqOD-9q3beLnvnyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D42561C05EAA;
        Sat, 29 Apr 2023 10:51:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9017BC15BA0;
        Sat, 29 Apr 2023 10:51:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: x86-android-tablets: Add ALS sensor support for Yoga Tablet 2 1050/830 series
Date:   Sat, 29 Apr 2023 12:50:55 +0200
Message-Id: <20230429105057.7697-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Yoga Tablet 2 1050/830 series have an AL3320A ambient light sensor,
add this to the list of i2c_clients to instantiate on these models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 65cfccaa2894..0297b4c43d3b 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -267,6 +267,14 @@ static struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __init
 			.dev_name = "lsm303d",
 		},
 		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* AL3320A ambient light sensor */
+		.board_info = {
+			.type = "al3320a",
+			.addr = 0x1c,
+			.dev_name = "al3320a",
+		},
+		.adapter_path = "\\_SB_.I2C5",
 	}, {
 		/* bq24292i battery charger */
 		.board_info = {
-- 
2.39.2

