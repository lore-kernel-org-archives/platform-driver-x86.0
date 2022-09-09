Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C54ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 21:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiIIVJ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 17:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiIIVJ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 17:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2637033E1D
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662757794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zSuo3AYYgy9swN0NWNbUrHKfy/RX+9hRmzx24HINlPg=;
        b=WjQdzdxjhCExNtkHTb5bqGffEHEeIaeViN81CqvZrBgubFxD9dcwwQLkXxThIIlqnzpnfq
        DODYQEE3vvuzASfb/KvxBEOOzYZTEunHK62t9ZmvnegE9vPOx2dn4RAMXEISIJziPO1WJ/
        7WXmP/fUoxQ2u32mPmmlaRNp+zLM7DA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-bAbxj0MCNlyvtuDAxiLynw-1; Fri, 09 Sep 2022 17:09:53 -0400
X-MC-Unique: bAbxj0MCNlyvtuDAxiLynw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDDBA185A7A4;
        Fri,  9 Sep 2022 21:09:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7101E492C3B;
        Fri,  9 Sep 2022 21:09:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: asus-wmi: Make kbd_rgb_mode_groups statis
Date:   Fri,  9 Sep 2022 23:09:50 +0200
Message-Id: <20220909210950.385398-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

kbd_rgb_mode_groups is only used inside asus-wmi.c, make it static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index d95170b7dba0..ae46af731de9 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -835,7 +835,7 @@ static const struct attribute_group kbd_rgb_state_group = {
 	.attrs = kbd_rgb_state_attrs,
 };
 
-const struct attribute_group *kbd_rgb_mode_groups[] = {
+static const struct attribute_group *kbd_rgb_mode_groups[] = {
 	NULL,
 	NULL,
 	NULL,
-- 
2.36.1

