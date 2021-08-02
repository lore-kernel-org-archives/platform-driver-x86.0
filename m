Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CD9C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 14:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6248C60E09
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 14:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbhHBONf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Aug 2021 10:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56038 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237894AbhHBOKS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 10:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627913405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=kDQ0zfqZGGUAfCce4VZbCAMDVLFfXQ4aeFFDqAGeWe0=;
        b=jVUDoXImxTvNsTZLR8UcKyQ1nmrmxXe4qnlqwpBFN2DZKlKlYPa/hswLNpoReQsisqVBZl
        X20IrhSM3Bpdet7yj7BMC115obqNR47PODcJ9n4FpKzVbRGqQq6biErVkXDUm+lx+hxh8S
        n1UUpbYyWJ2hoI/urQFNKplWWeypqAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-OSzsRk_iPqmryJK8w7ck-w-1; Mon, 02 Aug 2021 10:10:03 -0400
X-MC-Unique: OSzsRk_iPqmryJK8w7ck-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ADBE1006C82;
        Mon,  2 Aug 2021 14:10:02 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4240A608BA;
        Mon,  2 Aug 2021 14:10:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: Make dual_accel_detect() KIOX010A + KIOX020A detect more robust
Date:   Mon,  2 Aug 2021 16:10:00 +0200
Message-Id: <20210802141000.978035-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

360 degree hinges devices with dual KIOX010A + KIOX020A accelerometers
always have both a KIOX010A and a KIOX020A ACPI device (one for each
accel).

Theoretical some vendor may re-use some DSDT for a non-convertible
stripping out just the KIOX020A ACPI device from the DSDT. Check that
both ACPI devices are present to make the check more robust.

Fixes: 153cca9caa81 ("platform/x86: Add and use a dual_accel_detect() helper")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dual_accel_detect.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dual_accel_detect.h b/drivers/platform/x86/dual_accel_detect.h
index 1a069159da91..a9eae17cc43d 100644
--- a/drivers/platform/x86/dual_accel_detect.h
+++ b/drivers/platform/x86/dual_accel_detect.h
@@ -60,7 +60,8 @@ static bool dual_accel_detect_bosc0200(void)
 static bool dual_accel_detect(void)
 {
 	/* Systems which use a pair of accels with KIOX010A / KIOX020A ACPI ids */
-	if (acpi_dev_present("KIOX010A", NULL, -1))
+	if (acpi_dev_present("KIOX010A", NULL, -1) &&
+	    acpi_dev_present("KIOX020A", NULL, -1))
 		return true;
 
 	/* Systems which use a single DUAL250E ACPI device to model 2 accels */
-- 
2.31.1

