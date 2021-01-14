Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4A3C43381
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jan 2021 22:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B41D623977
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jan 2021 22:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730875AbhANWvn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jan 2021 17:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27705 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730834AbhANWvn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jan 2021 17:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610664616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nkKrU8HDKW+lXfhW2c96XhhEHjVqI2eSg4SI0WExWi8=;
        b=BgV8T+QapalK6sXIwG1bJSsNso8wrrg1jSa+ilNl/j0SIm7INZGIXc4zJzR29QL6tMV01o
        lPhUIerLzeSHI7uigPypDllGYO3200/KNK21+Y3GTUCaRn97838SvqltauZXfoQDa6kdbZ
        n6cOE6BPcwBRg4YD/xb3Mf64SjmTCqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-7i7pK-w1Mfa0BynQgLt2_g-1; Thu, 14 Jan 2021 17:50:14 -0500
X-MC-Unique: 7i7pK-w1Mfa0BynQgLt2_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D1A1195D560;
        Thu, 14 Jan 2021 22:50:13 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-237.ams2.redhat.com [10.36.113.237])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 784735D9C2;
        Thu, 14 Jan 2021 22:50:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNKNOWN_COMMAND errors
Date:   Thu, 14 Jan 2021 23:50:11 +0100
Message-Id: <20210114225011.128535-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The recently added thermal policy support makes a
hp_wmi_perform_query(0x4c, ...) call on older devices which do not
support thermal policies this causes the following warning to be
logged (seen on a HP Stream x360 Convertible PC 11):

[   26.805305] hp_wmi: query 0x4c returned error 0x3

Error 0x3 is HPWMI_RET_UNKNOWN_COMMAND error. This commit silences
the warning for unknown-command errors, silencing the new warning.

Cc: Elia Devito <eliadevito@gmail.com>
Fixes: 81c93798ef3e ("platform/x86: hp-wmi: add support for thermal policy
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/hp-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index ecd477964d11..be11a35a0906 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -247,7 +247,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	ret = bios_return->return_code;
 
 	if (ret) {
-		if (ret != HPWMI_RET_UNKNOWN_CMDTYPE)
+		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
+		    ret != HPWMI_RET_UNKNOWN_CMDTYPE) {
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
 		goto out_free;
 	}
-- 
2.28.0

