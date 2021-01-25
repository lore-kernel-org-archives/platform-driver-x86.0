Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42B2C433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACD35225AB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732129AbhAYUzg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30577 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732314AbhAYUys (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 15:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611607993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vjoWV7tJIzyXQRV9AQ/IOKKuwORBooXhU8VxlFyMESU=;
        b=SSMpjMbVXeLcwQvPGZVG5qM3e3QEcK76EBs+XW0UxWyiylszkxFUS6fyUXJEzL48acnVD3
        4msnICGMrVEuCeep25nEBcTPYcANMWflYVHI5xSIqxIw7GCwrEnQb8BsQ6r7GhvHXKoF7a
        3+4Jb1R3ysYDCHNZN9a8/FxoPfVdqts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-F-FSzdkWOEWYzcMy2RI2eQ-1; Mon, 25 Jan 2021 15:53:09 -0500
X-MC-Unique: F-FSzdkWOEWYzcMy2RI2eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53B4B190B2A3;
        Mon, 25 Jan 2021 20:53:00 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-56.ams2.redhat.com [10.36.112.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7DD75D6AB;
        Mon, 25 Jan 2021 20:52:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <mpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Don't register keyboard_lang unnecessarily
Date:   Mon, 25 Jan 2021 21:52:58 +0100
Message-Id: <20210125205258.135664-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All recent ThinkPad BIOS-es support the GSKL method used to query the
keyboard-layout used by the ECFW for the SHIFT + other-key key-press
emulation for special keys such as e.g. the '=', '(' and ')' keys
above the numpad on 15" models.

So just checking for the method is not a good indicator of the
model supporting getting/setting the keyboard_lang.

On models where this is not supported GSKL succeeds, but it returns
METHOD_ERR in the returned integer to indicate that this is not
supported on this model.

Add a check for METHOD_ERR and return -ENODEV if it is set to
avoid registering a non-working keyboard_lang sysfs-attr on models
where this is not supported.

Cc: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index df2506974106..0b268e17cb7b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10356,6 +10356,13 @@ static int get_keyboard_lang(int *output)
 	if (!acpi_evalf(gskl_handle, &kbd_lang, NULL, "dd", 0x02000000))
 		return -EIO;
 
+	/*
+	 * METHOD_ERR gets returned on devices where there are no special (e.g. '=',
+	 * '(' and ')') keys which use layout dependent key-press emulation.
+	 */
+	if (kbd_lang & METHOD_ERR)
+		return -ENODEV;
+
 	*output = kbd_lang;
 
 	return 0;
-- 
2.29.2

