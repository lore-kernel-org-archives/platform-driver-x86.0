Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B146C48BD1
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1360D611CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhFIPUn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23731 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239479AbhFIPTy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623251879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kpxJOutv7ivbPnybvKsLVkrzaA6vyzAieZgDI4Q0OOU=;
        b=RX7A9aeKVIDGN7HVXfYUm0FEviYjZLdY/MqZiUCU90pb4LF1/iZwODVzuJLBg5xaBB4Tqr
        CUgp4xvJfKkpYEsz26j64Ua9r2SxputeJ3bsXiOwGcoZVL9XoKbCROz4shdlQj1MExFkKH
        cBRcM9/Nb1f2mT027LvM2/ccXRTb5BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-WkyH5h2iP-6ULl9pJWh7HQ-1; Wed, 09 Jun 2021 11:17:57 -0400
X-MC-Unique: WkyH5h2iP-6ULl9pJWh7HQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF0C019057A8;
        Wed,  9 Jun 2021 15:17:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-55.ams2.redhat.com [10.36.113.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 82B5360BD8;
        Wed,  9 Jun 2021 15:17:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/2] platform/x86: think-lmi: Avoid potential read before start of the buffer
Date:   Wed,  9 Jun 2021 17:17:52 +0200
Message-Id: <20210609151752.156902-2-hdegoede@redhat.com>
In-Reply-To: <20210609151752.156902-1-hdegoede@redhat.com>
References: <20210609151752.156902-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If length equals 0 then reading buf[length-1] will read before the start
of the buffer.

Avoid this by moving the length == 0 check up.

Cc: Mark Pearson <markpearson@lenovo.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 4881de4e669d..7771c9359449 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -443,10 +443,13 @@ static ssize_t kbdlang_store(struct kobject *kobj,
 	int length;
 
 	length = strlen(buf);
+	if (!length)
+		return -EINVAL;
+
 	if (buf[length-1] == '\n')
 		length--;
 
-	if (!length || (length >= TLMI_LANG_MAXLEN))
+	if (length >= TLMI_LANG_MAXLEN)
 		return -EINVAL;
 
 	memcpy(setting->kbdlang, buf, length);
-- 
2.31.1

