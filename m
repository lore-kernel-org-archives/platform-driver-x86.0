Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0385C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 19:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350627AbiBETOI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 14:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40255 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343837AbiBETOH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 14:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644088447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gSCw7YZOqIRbAQxy8eH2/VUYt7kJ95NrdhzBZL/5/94=;
        b=BWsWzMNfkbhIuoGLXcYWkPFo25pR0lkrlGgPrxg5RvI2cSM3IRX3Z0rF5O4Z5WhM9tqZVA
        VpSPjUNwymT+lMkCfcwRQ/8d1FNhqXYc/RkaVsvtTBQtfU2HO04kUIVAO8bowxMP1wN4iU
        PW46d+j1OD3AH/xdvRqX+H1NUPe/uDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-Oe9tsuulMW6czoGNP503aQ-1; Sat, 05 Feb 2022 14:14:05 -0500
X-MC-Unique: Oe9tsuulMW6czoGNP503aQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8271835B47;
        Sat,  5 Feb 2022 19:14:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C561F5F707;
        Sat,  5 Feb 2022 19:14:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/6] platform/x86: x86-android-tablets: Add IRQ to Asus ME176C accelerometer info
Date:   Sat,  5 Feb 2022 20:13:55 +0100
Message-Id: <20220205191356.225505-5-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
References: <20220205191356.225505-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the IRQ for the accelerometer to the Asus ME176C board info.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 6174aad572bc..6d3a453d90eb 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -361,6 +361,12 @@ static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst =
 			.swnode = &asus_me176c_accel_node,
 		},
 		.adapter_path = "\\_SB_.I2C5",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x44,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
 	}, {
 		/* goodix touchscreen */
 		.board_info = {
-- 
2.33.1

