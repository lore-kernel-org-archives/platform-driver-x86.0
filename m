Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E37CC43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 17:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiGJRhO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 13:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGJRhN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 13:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B130EB491
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657474630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9jy0b2i2Y+T54tT6SJacS4JsnRKguB8Ll5vtJHfq6ZQ=;
        b=WKcViAk2q43FV9vG3juEmYIbERp+1NGddnxui7qymzlbMaFyKLMlPUotTmukQZzcWn0D8T
        qAgV8Oyzft6RW645krxklbqdJfiyfs6FQYNpWDcUC/SlLNTPN39FmsZvcEVcoID4u8ok3I
        Uf0mA8Mti3lekzzi2LgOyNHGchwMuhI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-IjZIj9p0MUykshQCV54umw-1; Sun, 10 Jul 2022 13:37:05 -0400
X-MC-Unique: IjZIj9p0MUykshQCV54umw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082483C025B5;
        Sun, 10 Jul 2022 17:37:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45E33492CA2;
        Sun, 10 Jul 2022 17:37:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel_atomisp2_led: Also turn off the always-on camera LED on the Asus T100TAF
Date:   Sun, 10 Jul 2022 19:36:58 +0200
Message-Id: <20220710173658.221528-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Like the Asus T100TA the Asus T100TAF has a camera LED which is always
on by default and both also use the same GPIO for the LED.

Relax the DMI match for the Asus T100TA so that it also matches
the T100TAF.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/atomisp2/led.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/atomisp2/led.c b/drivers/platform/x86/intel/atomisp2/led.c
index 5935dfca166f..10077a61d8c5 100644
--- a/drivers/platform/x86/intel/atomisp2/led.c
+++ b/drivers/platform/x86/intel/atomisp2/led.c
@@ -50,7 +50,8 @@ static const struct dmi_system_id atomisp2_led_systems[] __initconst = {
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
+			/* Non exact match to also match T100TAF */
+			DMI_MATCH(DMI_PRODUCT_NAME, "T100TA"),
 		},
 		.driver_data = &asus_t100ta_lookup,
 	},
-- 
2.36.0

