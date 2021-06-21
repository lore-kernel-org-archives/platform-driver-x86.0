Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D5AC4743C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 19:36:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 149BA61353
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 19:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbhFUTjK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 15:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43141 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230076AbhFUTjJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 15:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624304214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=DvgXOVTRC88Nz2tvTWM8ZYZUnMLcsIcmeRWF9OKtNnM=;
        b=Je05c9uJposlGZGApQz7kPplyK76lrZuVaJJNeEa9lTunn0YFzCO4Dyg7froT4vG344TEu
        WpZ1HW3BrAbEwoSefoZuK/1V1/HdQAra4eRfISUAEXwm+Lvp0CYhYycimq4tzUQWj7n58+
        0rr3+XK+sogU88att1UIQz/72S/Kqvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-LN37etfkPRiwFtXlIAFJNA-1; Mon, 21 Jun 2021 15:36:53 -0400
X-MC-Unique: LN37etfkPRiwFtXlIAFJNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C6A6362F8;
        Mon, 21 Jun 2021 19:36:52 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-80.ams2.redhat.com [10.36.112.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA21D19D7C;
        Mon, 21 Jun 2021 19:36:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Juha=20Lepp=C3=A4nen?= <juha_efku@dnainternet.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] platform/x86: think-lmi: Return EINVAL when kbdlang gets set to a 0 length string
Date:   Mon, 21 Jun 2021 21:36:48 +0200
Message-Id: <20210621193648.44138-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
start of the buffer") moved the length == 0 up to before stripping the '\n'
which typically gets added when users echo a value to a sysfs-attribute
from the shell.

This avoids a potential buffer-underrun, but it also causes a behavioral
change, prior to this change "echo > kbdlang", iow writing just a single
'\n' would result in an EINVAL error, but after the change this gets
accepted setting kbdlang to an empty string.

Fix this by replacing the manual '\n' check with using strchrnul() to get
the length till '\n' or terminating 0 in one go; and then do the
length != 0 check after this.

Fixes: 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before start of the buffer")
Reported-by: Juha Leppänen <juha_efku@dnainternet.net>
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use strchrnul() to get the length and strip any trailing '\n' in one go
---
 drivers/platform/x86/think-lmi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index c6c9fbb8a53e..b57061079288 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -442,14 +442,9 @@ static ssize_t kbdlang_store(struct kobject *kobj,
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	int length;
 
-	length = strlen(buf);
-	if (!length)
-		return -EINVAL;
-
-	if (buf[length-1] == '\n')
-		length--;
-
-	if (length >= TLMI_LANG_MAXLEN)
+	/* Calculate length till '\n' or terminating 0 */
+	length = strchrnul(buf, '\n') - buf;
+	if (!length || length >= TLMI_LANG_MAXLEN)
 		return -EINVAL;
 
 	memcpy(setting->kbdlang, buf, length);
-- 
2.31.1

