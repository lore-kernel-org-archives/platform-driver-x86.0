Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C742CC433C1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Mar 2021 12:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC1C61A13
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Mar 2021 12:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhCYMeW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Mar 2021 08:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52613 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229524AbhCYMd4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Mar 2021 08:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616675636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=P//RMckYCiAQ840C+DuX7DCgeFsRzSuzcMczi9FObLw=;
        b=EACxIkLUg15cLBOeXyFwONEUAO9iPWHptPbofibD+xNYHjejzZ14k6yQCMjMta94sT/2w1
        Dr2INO47EQwfnqDUG48ADeqryZdvnzY67UhQoVdsRy21wVmFLp63qO8oqfHmj1xyMlohsz
        yB3EHtvMOrXW31e2cYdUeayZhCkCWW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-XCmjV4jyN6uRsjEwASaicg-1; Thu, 25 Mar 2021 08:33:54 -0400
X-MC-Unique: XCmjV4jyN6uRsjEwASaicg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D55189E4FA;
        Thu, 25 Mar 2021 12:32:57 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B04C01378E;
        Thu, 25 Mar 2021 12:32:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Remove unused KEYMAP_LEN define
Date:   Thu, 25 Mar 2021 13:32:55 +0100
Message-Id: <20210325123255.73103-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Now that we have 2 separate input_dev-s for the buttons and thw switches,
this is no longer used, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 3fdf4cbec9ad..888a764efad1 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -63,9 +63,6 @@ static const struct key_entry intel_vbtn_switchmap[] = {
 	{ KE_END }
 };
 
-#define KEYMAP_LEN \
-	(ARRAY_SIZE(intel_vbtn_keymap) + ARRAY_SIZE(intel_vbtn_switchmap) + 1)
-
 struct intel_vbtn_priv {
 	struct input_dev *buttons_dev;
 	struct input_dev *switches_dev;
-- 
2.30.2

