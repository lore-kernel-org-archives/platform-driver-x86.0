Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2654CC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C157F64F3E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 12:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235911AbhBDMVC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 07:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33235 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235780AbhBDMVB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 07:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612441175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gSJGwVZDA3DVFmE0ev3o7i9mlkMTw6fy5Tqt6G9SQPA=;
        b=JeUqI69Rjd0coapx+HB2MWRoyTixQA1JpfZSD9DaeX7b2JRHgriVlopf3pGZlVqr2zBuTO
        bQZcGfgcvjhsraU9Kh7C4QvWC753icNFYCPyL+kX3NY/C1A/7VyQvSnhCTAWLPsStTMUNw
        zPN9dxHb/f6DwX9refyPL+4c3Zlrqck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-bAfUn04tMlGJuTP8iCWDgg-1; Thu, 04 Feb 2021 07:19:34 -0500
X-MC-Unique: bAfUn04tMlGJuTP8iCWDgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FB168030B1;
        Thu,  4 Feb 2021 12:19:33 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E1BFF1042A7F;
        Thu,  4 Feb 2021 12:19:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: msi-wmi: Fix variable 'status' set but not used compiler warning
Date:   Thu,  4 Feb 2021 13:19:31 +0100
Message-Id: <20210204121931.131617-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Explicitly check the status rather then relying on output.pointer staying
NULL on an error.

Reported-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 64ee7819c9d3..fd318cdfe313 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -96,6 +96,8 @@ static int msi_wmi_query_block(int instance, int *ret)
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 
 	status = wmi_query_block(MSIWMI_BIOS_GUID, instance, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
 
 	obj = output.pointer;
 
-- 
2.29.2

