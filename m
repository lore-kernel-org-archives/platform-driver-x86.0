Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDD2C47089
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 May 2021 10:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6528D610A6
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 May 2021 10:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhE3Kt1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 May 2021 06:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56017 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229500AbhE3Kt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 May 2021 06:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622371669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qXurSr9i3cqWnNRU2VLcPEB7EjA0s1UDf2ys4EsoSOw=;
        b=GcnkD+XXeTV9PEV9H6Yr2MkiMYMNOjosUMEfIwB02njKxpNtZ835v8Fh4ktHBM6zvxtQwF
        8eKXLrf1pThrx3jNJq+rM+jxNjC1AWOlyyzpo9ZSRThDyfaNGLIVUXvqAkMDkC8q0hj8EY
        v6GDIhUw3lo1lgizhEUKjVsmtL+mC2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Lu5fgEo3Nhi4YXpPIzjmPA-1; Sun, 30 May 2021 06:47:47 -0400
X-MC-Unique: Lu5fgEo3Nhi4YXpPIzjmPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 425BB107ACCA;
        Sun, 30 May 2021 10:47:46 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1DC614FA;
        Sun, 30 May 2021 10:47:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: touchscreen_dmi: Fix Chuwi Hi10 Pro comment
Date:   Sun, 30 May 2021 12:47:44 +0200
Message-Id: <20210530104744.6720-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the comment on the entry for the Chuwi Hi10 Pro tablet:
1. Replace "Prus" type with "Pro".
2. Fix the model number, the Chuwi Hi10 Pro is the CWI529, not the CWI597.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2
- Also fix the wrong model number
---
 drivers/platform/x86/touchscreen_dmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 424cf2a84744..0e1451b1d9c6 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -971,7 +971,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 		},
 	},
 	{
-		/* Chuwi Hi10 Prus (CWI597) */
+		/* Chuwi Hi10 Pro (CWI529) */
 		.driver_data = (void *)&chuwi_hi10_pro_data,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.31.1

