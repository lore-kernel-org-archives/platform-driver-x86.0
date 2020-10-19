Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D21C433E7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35CA8223BF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZ1h9+7Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbgJSS4g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22601 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727681AbgJSS4g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mNEI/SsVg1ZSRb+yHosHyixrz1+xy27J+IyNlaCs2Nw=;
        b=aZ1h9+7Y1eKqwiYRyOajxKA37ZMcdbJ5vQBJhw1kSxQNYy51POcaD9f4WXTmgg/zDniRDT
        ds5Q7LXdc5e3a/ddsD0/xmg3K3Q8SRTdruDe4UiEu59Vstq5dbDPzcIXw8cJ++w/1+FJzX
        +70sxvjKvxOpxv3WbjthIvSym9HJFMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Z15lmP-vMUiyTGrRBYoObg-1; Mon, 19 Oct 2020 14:56:33 -0400
X-MC-Unique: Z15lmP-vMUiyTGrRBYoObg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A848CADC31;
        Mon, 19 Oct 2020 18:56:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8400360DA0;
        Mon, 19 Oct 2020 18:56:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/6] platform/x86: acer-wmi: Drop no-op set_quirks call from find_quirks
Date:   Mon, 19 Oct 2020 20:56:23 +0200
Message-Id: <20201019185628.264473-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

set_quirks has a "if (!interface) return;" check at its beginning and
interface always is NULL when set_quirks is called from find_quirks,
so it is a no-op and we can drop it.

This also allows dropping the "if (!interface) return;" from set_quirks
since set_quirks now always is called with interface != NULL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 49f4b73be513..db6167a10981 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -302,9 +302,6 @@ static struct quirk_entry *quirks;
 
 static void __init set_quirks(void)
 {
-	if (!interface)
-		return;
-
 	if (quirks->mailled)
 		interface->capability |= ACER_CAP_MAILLED;
 
@@ -648,8 +645,6 @@ static void __init find_quirks(void)
 
 	if (quirks == NULL)
 		quirks = &quirk_unknown;
-
-	set_quirks();
 }
 
 /*
-- 
2.28.0

