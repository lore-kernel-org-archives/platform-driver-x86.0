Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144D9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 10:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237692AbiAKKHP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:07:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52941 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237384AbiAKKHO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 05:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641895634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=UZv+TI7fJBjT1YOpRQZcJlCds9actz3gZotoNHWOKSU=;
        b=EpgnBYFgpzBmvvKywCp0ohAsk+0P5dHQh535FUTHVuIgRhYkQPz3aqBgZfvWmycjBbUkQl
        wNVIgxhQP8F0lSWRyG/RYnGuK5VL+1qpDdZsYusVfudzP24nw08h9va/xON2rD00G2ooZB
        PYlslj3X1FaBCNu4c7iGbpRfjxgRbwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-41kqYHwXMweE50Mvxa3O1A-1; Tue, 11 Jan 2022 05:07:11 -0500
X-MC-Unique: 41kqYHwXMweE50Mvxa3O1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E5D41018720;
        Tue, 11 Jan 2022 10:07:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.151])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2A61F431;
        Tue, 11 Jan 2022 10:07:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Correct crystal_cove_charger module name
Date:   Tue, 11 Jan 2022 11:07:08 +0100
Message-Id: <20220111100708.38585-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The module was renamed to intel_crystal_cove_charger before it was
merged, updated bq24190_modules to match.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 7dac9edc74bf..a044b1a27055 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -206,8 +206,8 @@ static struct bq24190_platform_data bq24190_pdata = {
 };
 
 static const char * const bq24190_modules[] __initconst = {
-	"crystal_cove_charger", /* For the bq24190 IRQ */
-	"bq24190_charger",      /* For the Vbus regulator for intel-int3496 */
+	"intel_crystal_cove_charger", /* For the bq24190 IRQ */
+	"bq24190_charger",            /* For the Vbus regulator for intel-int3496 */
 	NULL
 };
 
-- 
2.33.1

