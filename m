Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB13C38142
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Jan 2023 23:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbjA0X6Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Jan 2023 18:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjA0X6Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Jan 2023 18:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4650A24D
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674863852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5Q2V3PkoqgExC/1n/FtMboXJdTAKwrfJnKPmFWK0Yrc=;
        b=QMBrBOiyH46TEpuiEkquR2RUeh64gCX+DFVPZAWRQUM5tNtuUjJ/C3LTZO3T6OzER7glDA
        N5yLIAWRmrZfwAZArcWy6+BcVyuAkiZ0Imvk9o44nqzrheBZ9kJ38WvJ6Z/w+yDDgcdBp4
        5hN43m0TACPe0FB3Vgjk3yHvacUMmvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-ARjUG1DKNKOKeYIHvAggWg-1; Fri, 27 Jan 2023 18:57:30 -0500
X-MC-Unique: ARjUG1DKNKOKeYIHvAggWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CB7C8533A2;
        Fri, 27 Jan 2023 23:57:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6330DC15BAD;
        Fri, 27 Jan 2023 23:57:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix thinklight LED brightness returning 255
Date:   Sat, 28 Jan 2023 00:57:23 +0100
Message-Id: <20230127235723.412864-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reading the thinklight LED brightnes while the LED is on returns
255 (LED_FULL) but we advertise a max_brightness of 1, so this should
be 1 (LED_ON).

Fixes: db5e2a4ca0a7 ("platform/x86: thinkpad_acpi: Fix max_brightness of thinklight")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 02860c32625e..32c10457399e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5563,7 +5563,7 @@ static int light_sysfs_set(struct led_classdev *led_cdev,
 
 static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
 {
-	return (light_get_status() == 1) ? LED_FULL : LED_OFF;
+	return (light_get_status() == 1) ? LED_ON : LED_OFF;
 }
 
 static struct tpacpi_led_classdev tpacpi_led_thinklight = {
-- 
2.39.0

