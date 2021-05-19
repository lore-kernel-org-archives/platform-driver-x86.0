Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C14C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27BB9611AE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbhESN5p (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52396 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243082AbhESN5n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621432583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=v8VbEQeymFTFedgn9xKe//+evW8r8aR6eUa7WQ/H85A=;
        b=IGKBUA/atUbOBGav5lgis6tyQ85d4GdXBAiG5eXnsHxahHH+Yam6n/KJHRe2KC+LNep7pu
        FhNXSr17oEdSB1UklwjujjODWuM9kY6VclhFKe+5bm0Oey2kqGZCCCqO3QYnqUrnhG7EaZ
        G9VJlqqB43ObR7eOLAzu9dwZWxyiIkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-ieBgdIB5NrqRbVCM6OiaKw-1; Wed, 19 May 2021 09:56:21 -0400
X-MC-Unique: ieBgdIB5NrqRbVCM6OiaKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E34E9100945F;
        Wed, 19 May 2021 13:56:20 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-28.ams2.redhat.com [10.36.115.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA1731037EB9;
        Wed, 19 May 2021 13:56:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Salvatore Bonaccorso <carnil@debian.org>
Subject: [PATCH] platform/x86: toshiba_haps: Fix missing newline in pr_debug call in toshiba_haps_notify
Date:   Wed, 19 May 2021 15:56:18 +0200
Message-Id: <20210519135618.139701-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The pr_debug() call in toshiba_haps_notify() is missing a newline at the
end of the string, add this.

BugLink: https://bugs.debian.org/799193
Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/toshiba_haps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index b237bd6b1ee5..49e84095bb01 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -131,7 +131,7 @@ static const struct attribute_group haps_attr_group = {
  */
 static void toshiba_haps_notify(struct acpi_device *device, u32 event)
 {
-	pr_debug("Received event: 0x%x", event);
+	pr_debug("Received event: 0x%x\n", event);
 
 	acpi_bus_generate_netlink_event(device->pnp.device_class,
 					dev_name(&device->dev),
-- 
2.31.1

