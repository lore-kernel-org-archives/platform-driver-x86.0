Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24308C54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 18:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbjALSqi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbjALSqL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48233AC
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673547533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HpqFIr3hpny1jnZlm0LjxSll9u3GMMXnVzPWY50XKuk=;
        b=SRIs4LIV2KKmOHQCEpsmL+5XwEYCiWTl0A7/XfJgEJVuQ2huknraG+CAYLD2QKvPwqgook
        HSXiMEG1AhjHei1nz7vnaqamrgsgK45OBmDd4Ac9w535NMkCBk/ii56Rh6u8O54jMPWEiF
        cqz8h5jDbhEcQdSBuC4aGJulVdaB050=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-euMspyu4Ns2kTWoZRYLsGA-1; Thu, 12 Jan 2023 13:18:51 -0500
X-MC-Unique: euMspyu4Ns2kTWoZRYLsGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88CC23806721;
        Thu, 12 Jan 2023 18:18:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.33])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3E13A1759E;
        Thu, 12 Jan 2023 18:18:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Nemcev Aleksey <Nemcev_Aleksey@inbox.ru>
Subject: [PATCH] platform/x86: asus-nb-wmi: Add alternate mapping for KEY_SCREENLOCK
Date:   Thu, 12 Jan 2023 19:18:41 +0100
Message-Id: <20230112181841.84652-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The 0x33 keycode is emitted by Fn + F6 on a ASUS FX705GE laptop.

Reported-by: Nemcev Aleksey <Nemcev_Aleksey@inbox.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index c685a705b73d..9987bb11c6e9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -511,6 +511,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
 	{ KE_KEY, 0x32, { KEY_MUTE } },
+	{ KE_KEY, 0x33, { KEY_SCREENLOCK } },
 	{ KE_KEY, 0x35, { KEY_SCREENLOCK } },
 	{ KE_KEY, 0x38, { KEY_PROG3 } }, /* Armoury Crate */
 	{ KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
-- 
2.39.0

