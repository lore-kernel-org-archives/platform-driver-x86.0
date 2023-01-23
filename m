Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFA2C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 13:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjAWN3U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbjAWN3U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 08:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0A22202E
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674480512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Dm2y8jjJLtAvoiWVSOdghsMUtICznIvuvh43SYxAC+4=;
        b=f0p/r0kTUM3AtV/9MyNBE1XI++aZBdbMJE4rQLyoeBNs5Q3y9m0OcpvkQCwFBvjp1v/e3L
        yHaOF38ZvXuUP0JyzItzSTaFgUMtkqfFXQmAlBYqSMwaZRLFMt1Pcz3Xz8Ng7ATMkc0NA3
        RkUNDLH3Ue2JJbJP9FHjc+KrK7OCWGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-ooKRr2lXNoGQldLGKWqH9g-1; Mon, 23 Jan 2023 08:28:27 -0500
X-MC-Unique: ooKRr2lXNoGQldLGKWqH9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 400D1100F935;
        Mon, 23 Jan 2023 13:28:27 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DA38C2166B32;
        Mon, 23 Jan 2023 13:28:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: hp-wmi: Fix cast to smaller integer type warning
Date:   Mon, 23 Jan 2023 14:28:24 +0100
Message-Id: <20230123132824.660062-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the following compiler warning:

drivers/platform/x86/hp/hp-wmi.c:551:24: warning: cast to smaller integer
   type 'enum hp_wmi_radio' from 'void *' [-Wvoid-pointer-to-enum-cast]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0a99058be813..9ac41950e4fc 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -548,7 +548,7 @@ static int __init hp_wmi_enable_hotkeys(void)
 
 static int hp_wmi_set_block(void *data, bool blocked)
 {
-	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
+	enum hp_wmi_radio r = (long)data;
 	int query = BIT(r + 8) | ((!blocked) << r);
 	int ret;
 
-- 
2.39.0

