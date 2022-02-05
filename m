Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51112C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 11:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244118AbiBEL2r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 06:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60522 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243390AbiBEL2r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 06:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644060526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bSolepNCHBb6wfN6Pho5ZFo22Lmv76HTT5kI1Q+YJkg=;
        b=jOLmmkcAC806hoqrGe+4RNeXb/Y89+nqDRnKzD68v3R9NlXwv4HCxmQnMTnpxYT+m26wYq
        uLyo8O/R9n2zEtsEt05t2+EREJYpGhWKxJ+MjZZHe9rVnanSVSsOKPF4Qp9bJliDVZO9z/
        ZfXaZa9afX4ovYuJvZlq17pUnYhQ1J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-P8x2SEx9OKCj_oBgeFlNbA-1; Sat, 05 Feb 2022 06:28:43 -0500
X-MC-Unique: P8x2SEx9OKCj_oBgeFlNbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D6E7108087A;
        Sat,  5 Feb 2022 11:28:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 87B6B7D727;
        Sat,  5 Feb 2022 11:28:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Abhijeet V <abhijeetviswa@gmail.com>
Subject: [PATCH] platform/x86: asus-wmi: Fix regression when probing for fan curve control
Date:   Sat,  5 Feb 2022 12:28:40 +0100
Message-Id: <20220205112840.33095-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The fan curve control patches introduced a regression for at least the
TUF FX506 and possibly other TUF series laptops that do not have support
for fan curve control.

As part of the probing process, asus_wmi_evaluate_method_buf is called
to get the factory default fan curve . The WMI management function
returns 0 on certain laptops to indicate lack of fan curve control
instead of ASUS_WMI_UNSUPPORTED_METHOD. This 0 is transformed to
-ENODATA which results in failure when probing.

Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan curves")
Reported-by: Abhijeet V <abhijeetviswa@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a3b83b22a3b1..2104a2621e50 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2223,7 +2223,7 @@ static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
 
 	err = fan_curve_get_factory_default(asus, fan_dev);
 	if (err) {
-		if (err == -ENODEV)
+		if (err == -ENODEV || err == -ENODATA)
 			return 0;
 		return err;
 	}
-- 
2.33.1

