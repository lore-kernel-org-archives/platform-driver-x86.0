Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25617C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Dec 2022 15:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiLOPpQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Dec 2022 10:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiLOPpD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Dec 2022 10:45:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0764BEBD
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Dec 2022 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671119058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8/7DNt4nEznT0LKyS7pGOutiwZ9Ynds/frWa78MF7dU=;
        b=ivWgbJzNMxZHpc9cptKc6noKaCE3kyiZ2Vd5tPjqj+7t5htyS065rAt5SCCr+wFXFR0p7J
        mWBBt29qrAON1akw/rw/wcqiYkHpoB1gySZjLJAGjpFIuhSsm9oFq7Fq7QgfRPhhDNHgEC
        lBf2rbZdltOVsI+7x67tfvPoFXLPuWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-1hPUY-NKNvmJU79jesoo6g-1; Thu, 15 Dec 2022 10:44:09 -0500
X-MC-Unique: 1hPUY-NKNvmJU79jesoo6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C9D4100F92E;
        Thu, 15 Dec 2022 15:44:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.128])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5665040C2064;
        Thu, 15 Dec 2022 15:44:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ike Panhc <ike.pan@canonical.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Add Legion 5 15ARH05 DMI id to set_fn_lock_led_list[]
Date:   Thu, 15 Dec 2022 16:43:57 +0100
Message-Id: <20221215154357.123876-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo Legion 5 15ARH05 needs ideapad-laptop to call SALS_FNLOCK_ON /
SALS_FNLOCK_OFF on Fn-lock state change to get the LED in the Fn key to
correctly reflect the Fn-lock state.

Add a DMI match for the Legion 5 15ARH05 to the set_fn_lock_led_list[]
table for this.

Fixes: 81a5603a0f50 ("platform/x86: ideapad-laptop: Fix interrupt storm on fn-lock toggle on some Yoga laptops")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 435d2d3d903b..0eb5bfdd823a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1621,6 +1621,12 @@ static const struct dmi_system_id set_fn_lock_led_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Legion R7000P2020H"),
 		}
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Legion 5 15ARH05"),
+		}
+	},
 	{}
 };
 
-- 
2.38.1

