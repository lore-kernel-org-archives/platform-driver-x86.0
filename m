Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D891C4743C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 13:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1403960725
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 13:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhFUN0O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 09:26:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55069 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229707AbhFUN0O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 09:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624281839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=44Wzss9Chv9ly4RM+cQICMs+4bnVGrqSZuTdMB9MmxM=;
        b=J2eedt9nLd0ICqiFsp5em0hLbX/VQQNEInV3L0ihxBNLX0ISqbykbrLB2/1eRXv2myiBoE
        aeHstQEbsn9eH2ppMIUanTAdd7CvjPaGj4KdJlhtw3Sg/LdWT+jtjGFAZ+KknWi6XYXdwa
        AqoVraAc1/2JoTm7fuJ+Q9D218F+hq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-rZ_t2hRoMfeXTU1WoPtIYA-1; Mon, 21 Jun 2021 09:23:58 -0400
X-MC-Unique: rZ_t2hRoMfeXTU1WoPtIYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06BAE100CEC2;
        Mon, 21 Jun 2021 13:23:57 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-247.ams2.redhat.com [10.36.115.247])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB16D60871;
        Mon, 21 Jun 2021 13:23:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Return EINVAL when kbdlang gets set to a 0 length string
Date:   Mon, 21 Jun 2021 15:23:54 +0200
Message-Id: <20210621132354.57127-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
start of the buffer") moved the lengt == 0 up to before stripping the '\n'
which typically gets added when users echo a value to a sysfs-attribute
from the shell.

This avoids a potential buffer-underrun, but it also causes a behavioral
change, prior to this change "echo > kbdlang", iow writing just a single
'\n' would result in an EINVAL error, but after the change this gets
accepted setting kbdlang to an empty string.

Re-add the length != 0 check after stripping the '\n' to reject this
again, as before the change.

Fixes: 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before start of the buffer")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index c6c9fbb8a53e..c22435acebbe 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -449,7 +449,7 @@ static ssize_t kbdlang_store(struct kobject *kobj,
 	if (buf[length-1] == '\n')
 		length--;
 
-	if (length >= TLMI_LANG_MAXLEN)
+	if (!length || length >= TLMI_LANG_MAXLEN)
 		return -EINVAL;
 
 	memcpy(setting->kbdlang, buf, length);
-- 
2.31.1

