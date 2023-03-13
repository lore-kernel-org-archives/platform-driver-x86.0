Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95840C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 13:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjCMNEe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 09:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjCMNEc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 09:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B78E64A8C
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678712626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cipAg2hmyoInDH8UUOANBj60WlgVdQzCxyCB+AWb8KE=;
        b=B9+Evf/5kKrLsE9RYzRk6Wel5vTnV4tZlFZDrUtrFFQijM5UPiI3laOvbPmEDjDi8dDJ0g
        SG6sOta+zY0o2gMoDG5wxAG6/hcwyUhili1qQnDRE/HPV8uBMhKSz5S+OlvMGRes+xRXVh
        x0uSWZ36S5uahqG0SrJjC1W0prjTibE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-tfXghOpVPR6VLz7sPIduMg-1; Mon, 13 Mar 2023 09:03:40 -0400
X-MC-Unique: tfXghOpVPR6VLz7sPIduMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23CA23C10151;
        Mon, 13 Mar 2023 13:02:44 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 82EF1C164E7;
        Mon, 13 Mar 2023 13:02:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Enrico Weigelt <lkml@metux.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        Ed Wildgoose <lists@wildgooses.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: pcengines-apuv2: Drop platform:pcengines-apuv2 module-alias
Date:   Mon, 13 Mar 2023 14:02:41 +0100
Message-Id: <20230313130241.778146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver auto-loads based on the DMI modaliases and this platform
modalias is not necessary and broken:

1. Not necessary since the driver itself creates the platform_device,
   so it is already loaded when the modalias might be used
2. From a quick scan of the code it does not create any platform-devices
   called "platform:pcengines-apuv2"

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/pcengines-apuv2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index d063d91db9bc..3aa63b18a2e1 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -291,5 +291,4 @@ MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
 MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
-MODULE_ALIAS("platform:pcengines-apuv2");
 MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");
-- 
2.39.1

