Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D175FC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 11:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ABCD64F44
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 11:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbhBDLkw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 06:40:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235701AbhBDLkV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 06:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612438735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VGcrY/EXC/7CCPYbxk9hskkAw3dTv8gpYH6D12T0nd4=;
        b=XuzHroCCgRbJKW2JyX46J9e5X9/tLW25ozonpXSqLHkPwlE4HNlRt4q1Ya5GypQCbFT0yM
        9ccmgMEcsaeV4wg3FWZrFb2vHOKCKVbHQEc/aGWuBPfIOe4xRNmCecFBwcG+IvsqZ7SDUF
        zarUDk0wSX8PgXGhdZbbQqXHfEsbBW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-r1qHoi1lPt6rdSz6u6hnVQ-1; Thu, 04 Feb 2021 06:38:52 -0500
X-MC-Unique: r1qHoi1lPt6rdSz6u6hnVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B70A2192D785;
        Thu,  4 Feb 2021 11:38:50 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 734423AA2;
        Thu,  4 Feb 2021 11:38:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/surface: surface3-wmi: Fix variable 'status' set but not used compiler warning
Date:   Thu,  4 Feb 2021 12:38:48 +0100
Message-Id: <20210204113848.105994-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Explicitly check the status rather then relying on output.pointer staying
NULL on an error. This silences the following compiler warning:

drivers/platform/surface/surface3-wmi.c:60:14: warning: variable 'status' set but not used [-Wunused-but-set-variable]

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/surface/surface3-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
index 130b6f52a600..fcd1d4fb94d5 100644
--- a/drivers/platform/surface/surface3-wmi.c
+++ b/drivers/platform/surface/surface3-wmi.c
@@ -57,12 +57,16 @@ static DEFINE_MUTEX(s3_wmi_lock);
 static int s3_wmi_query_block(const char *guid, int instance, int *ret)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj = NULL;
 	acpi_status status;
-	union acpi_object *obj;
 	int error = 0;
 
 	mutex_lock(&s3_wmi_lock);
 	status = wmi_query_block(guid, instance, &output);
+	if (ACPI_FAILURE(status)) {
+		error = -EIO;
+		goto out_free_unlock;
+	}
 
 	obj = output.pointer;
 
-- 
2.29.2

