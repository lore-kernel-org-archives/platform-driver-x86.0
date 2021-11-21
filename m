Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E48C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238591AbhKUTOq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26171 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238617AbhKUTOp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yG0fIRwmQl7BghyzWfIu1a+Qwb3brnBJExh0HRhDAm4=;
        b=JoB/QMGK0fH+gt7sjJMx//An/4KEimFImtQtbU/W/Zn6Ijq1PuHCUkKPpQR0zxNswxqNDQ
        YxqbIWId3h2V8N99sFHRQQZXyemgXU8vijXNynT6C2sGF9nTYf6nQ4pw510sc41Okh+LP6
        5JvwpAmTC5GoScWxbynUTBKhNa1lduY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-UhKBpLTFPcabcLrq3MYSuA-1; Sun, 21 Nov 2021 14:11:34 -0500
X-MC-Unique: UhKBpLTFPcabcLrq3MYSuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A01981006AA0;
        Sun, 21 Nov 2021 19:11:32 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 582C15DF21;
        Sun, 21 Nov 2021 19:11:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, Len Baker <len.baker@gmx.com>
Subject: [PATCH 1/7] platform/x86: thinkpad_acpi: Accept ibm_init_struct.init() returning -ENODEV
Date:   Sun, 21 Nov 2021 20:11:23 +0100
Message-Id: <20211121191129.256713-2-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 79f960e29cfc ("platform/x86: thinkpad_acpi: Convert platform driver
to use dev_groups") accidentally modified tpacpi_kbdlang_init() causing it
to return -ENODEV instead of 0 on machines without kbdlang support
(which are most of them).

ibm_init() sees this -ENODEV as an error causing the entire module to not
load, not good.

Note that technically tpacpi_kbdlang_init() was already buggy before, it
should have returned 1 instead of 0 if the feature is not present.

Rather then fixing tpacpi_kbdlang_init() though, IMHO it is bettter to
just make ibm_init() treat -ENODEV as 1 to fix the issue; and then in
a followup commit also change all the existing "return 1"s from
ibm_init_struct.init() callbacks to "return -ENODEV" as -ENODEV clearly
states what it going on where as a magic return of "1" requires a deep
dive into the code to figure out what is going on.

This will also allow removing some extra ifs to translate -ENODEV to
return 1 in a couple of init() callbacks.

Fixes: 79f960e29cfc ("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
Cc: Len Baker <len.baker@gmx.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 055930f5d9f5..62daf0109b4a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10738,8 +10738,8 @@ static int __init ibm_init(struct ibm_init_struct *iibm)
 
 	if (iibm->init) {
 		ret = iibm->init(iibm);
-		if (ret > 0)
-			return 0;	/* probe failed */
+		if (ret > 0 || ret == -ENODEV)
+			return 0; /* subdriver functionality not available */
 		if (ret)
 			return ret;
 
-- 
2.31.1

