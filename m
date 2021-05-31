Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE8FC47096
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A4D661943
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbhEaODA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 10:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59716 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232724AbhEaOA4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 10:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622469556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gJrFJb/f6X+cpFk9/OZzL42YLEzapND4drL2cjHnG0c=;
        b=XxeCy5+NguuWmvRS197H5MVRymqVO3Ub3tw38aQBY+BPvXJJw/PFn44Tl19Z1KLIN8oG3A
        UErWRw21SK6yLicdGmM1TGwZoOBzaY9YKCIoA9f9bJhFauySUh0Wn3tKfkuVcZsmFimCsd
        r56sZ3wnN127hILctfZmg85Wgva+Qco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-wu9_jw8mNASqQgD2yK3E4g-1; Mon, 31 May 2021 09:59:14 -0400
X-MC-Unique: wu9_jw8mNASqQgD2yK3E4g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4B9F801107;
        Mon, 31 May 2021 13:59:13 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-151.ams2.redhat.com [10.36.113.151])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 53E5460C0F;
        Mon, 31 May 2021 13:59:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad-lmi: Remove unused display_name member from struct tlmi_pwd_setting
Date:   Mon, 31 May 2021 15:59:11 +0200
Message-Id: <20210531135911.82582-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The struct tlmi_pwd_setting display_name member is initialized,
but never read. Remove it and the TLMI_PWDTYPE_MAXLEN define.

While at it also remove some other unused [MAX]LEN defines.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 2 --
 drivers/platform/x86/think-lmi.h | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 854427fed1a9..782d8e3fe7a1 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -819,7 +819,6 @@ static int tlmi_analyze(void)
 		ret = -ENOMEM;
 		goto fail_clear_attr;
 	}
-	strscpy(tlmi_priv.pwd_admin->display_name, "admin", TLMI_PWDTYPE_MAXLEN);
 	strscpy(tlmi_priv.pwd_admin->kbdlang, "us", TLMI_LANG_MAXLEN);
 	tlmi_priv.pwd_admin->encoding = TLMI_ENCODING_ASCII;
 	tlmi_priv.pwd_admin->pwd_type = "pap";
@@ -836,7 +835,6 @@ static int tlmi_analyze(void)
 		ret = -ENOMEM;
 		goto fail_clear_attr;
 	}
-	strscpy(tlmi_priv.pwd_power->display_name, "power-on", TLMI_PWDTYPE_MAXLEN);
 	strscpy(tlmi_priv.pwd_power->kbdlang, "us", TLMI_LANG_MAXLEN);
 	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
 	tlmi_priv.pwd_power->pwd_type = "pop";
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index 6cd5325cc50e..6fa8da7af6c7 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -8,15 +8,7 @@
 #define TLMI_SETTINGS_COUNT  256
 #define TLMI_SETTINGS_MAXLEN 512
 #define TLMI_PWD_BUFSIZE     129
-#define TLMI_PWDTYPE_MAXLEN   64
-#define TLMI_ENC_MAXLEN       64
 #define TLMI_LANG_MAXLEN       4
-#define TLMI_PWDTYPE_LEN       4
-/*
- * Longest string should be in the set command: allow size of BIOS
- * option and choice
- */
-#define TLMI_GETSET_MAXLEN (TLMI_SETTINGS_MAXLEN + TLMI_SETTINGS_MAXLEN)
 
 /* Possible error values */
 struct tlmi_err_codes {
@@ -43,7 +35,6 @@ struct tlmi_pwdcfg {
 struct tlmi_pwd_setting {
 	struct kobject kobj;
 	bool valid;
-	char display_name[TLMI_PWDTYPE_MAXLEN];
 	char password[TLMI_PWD_BUFSIZE];
 	const char *pwd_type;
 	const char *role;
-- 
2.31.1

