Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC197C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 14:55:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D3236108C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 14:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235613AbhHLOzp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50065 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237335AbhHLOzo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Aug 2021 10:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628780119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r2nmC45r4YqfZ+TpZWC0ZdZOoMt0x0bHHE18jp3WfNk=;
        b=AaSr2U6sVj3ykpAAv/HPVO0yhFztQpBNjutEZe4WIDuPQW40rIizZ7JPEpJJZerAoowSDv
        LxaxKrvYwx6cIVf9CPr0YRbcYX1ttdcyfwjL16UooKzNyTDGbLMpygcexvxQmQ0CfBg8sN
        kcOHqVMpcsncQXTJWicsPxGyIS4DKQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-LSvTWuUdN3CsSNO4NOhEDg-1; Thu, 12 Aug 2021 10:55:17 -0400
X-MC-Unique: LSvTWuUdN3CsSNO4NOhEDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B0FCC7412;
        Thu, 12 Aug 2021 14:55:16 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0CC760BF1;
        Thu, 12 Aug 2021 14:55:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: asus-nb-wmi: Add tablet_mode_sw=lid-flip quirk for the TP200s
Date:   Thu, 12 Aug 2021 16:55:13 +0200
Message-Id: <20210812145513.39117-2-hdegoede@redhat.com>
In-Reply-To: <20210812145513.39117-1-hdegoede@redhat.com>
References: <20210812145513.39117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Asus TP200s / E205SA 360 degree hinges 2-in-1 supports reporting
SW_TABLET_MODE info through the ASUS_WMI_DEVID_LID_FLIP WMI device-id.
Add a quirk to enable this.

BugLink: https://gitlab.freedesktop.org/libinput/libinput/-/issues/639
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 9929eedf7dd8..a81dc4b191b7 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -462,6 +462,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_use_lid_flip_devid,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS TP200s / E205SA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "E205SA"),
+		},
+		.driver_data = &quirk_asus_use_lid_flip_devid,
+	},
 	{},
 };
 
-- 
2.31.1

