Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADB5C77B73
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Apr 2023 21:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjDPV33 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Apr 2023 17:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPV32 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Apr 2023 17:29:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149A31FEB
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Apr 2023 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681680525;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Qhibr03mBeDFP9ca9RO4SRahrEEpp9mzw+vf0jbvz4s=;
        b=B1geDWM5XWhifIM9Ks4hvI1zIW8yvkTlxmvC5rWSutYLc7zDFhVXyToJzVed+BJIgo1zN4
        Et/prmy2F7vPY5sJRDitcosPvrIIrv/82ajcN6OfNIKxq30ijmP0+nwvGM+xQPPQE1/wsh
        ESN+0kH1lmSC6S/n6txHt8xOIyKgmTw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-zSEXEQH9PFuGOP0VmXcreQ-1; Sun, 16 Apr 2023 17:28:43 -0400
X-MC-Unique: zSEXEQH9PFuGOP0VmXcreQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EA5F29A9CB7;
        Sun, 16 Apr 2023 21:28:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 90D2C1415304;
        Sun, 16 Apr 2023 21:28:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/4] platform/x86: x86-android-tablets: Update Yoga Book HiDeep touchscreen comment
Date:   Sun, 16 Apr 2023 23:28:38 +0200
Message-Id: <20230416212841.311152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After recent i2c-hid-of changes, the i2c-hid-of driver could be used
for the Yoga Book HiDeep touchscreen comment instead of the native hideep
driver. Update the comment to reflect this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index a571dcd11544..b5dd74bf9e8c 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -41,10 +41,13 @@ static struct lp855x_platform_data lenovo_lp8557_pdata = {
 /* Lenovo Yoga Book X90F / X90L's Android factory img has everything hardcoded */
 
 /*
- * The HiDeep IST940E touchscreen comes up in HID mode and could alternatively
- * be used in I2C-HID mode (I2C-HID descriptor reg 0x0020) if i2c-hid-of.c is
- * modified to use generic (non-OF) device-properties and thought to deal with
- * the reset GPIO. "hideep,force-native-protocol" resets it to native mode.
+ * The HiDeep IST940E touchscreen comes up in I2C-HID mode. The native protocol
+ * reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR which are not reported in HID
+ * mode, so using native mode is preferred.
+ * It could alternatively be used in HID mode by changing the properties to:
+ *	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0020),
+ *	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
+ * and changing board_info.type to "hid-over-i2c".
  */
 static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1200),
-- 
2.39.2

