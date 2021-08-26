Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10433C43216
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 14:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEF036108F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Aug 2021 14:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbhHZOJS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53026 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229832AbhHZOJR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 10:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629986909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=eDAnEiBbVGoaGe6RtYpek5YNj1wNdzibE1cy2P2y2Rs=;
        b=MMOS9tLIc2I4oWEa+1FhM4u2I4yhUmVrhlGl2pvkpZhc0hUApRRDdbYaocnC1Cw5hzYCP6
        tthiYh8rxwYCMF1/8ghEfMngQQcF2J/KzYSS4NtTMB5OHUxJnR+vBnjdeObrwog5sYkkbz
        9pbZQ+/ci+HhTabNN3G+hKpZC4YoNMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-k4psahD7OHGUHt3Fg2T0eQ-1; Thu, 26 Aug 2021 10:08:26 -0400
X-MC-Unique: k4psahD7OHGUHt3Fg2T0eQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09EBA93925;
        Thu, 26 Aug 2021 14:08:25 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.168])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C39CC60657;
        Thu, 26 Aug 2021 14:08:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dell.Client.Kernel@dell.com
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] platform/x86: dell-smbios-wmi: Add missing kfree in error-exit from run_smbios_call
Date:   Thu, 26 Aug 2021 16:08:22 +0200
Message-Id: <20210826140822.71198-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

As pointed out be Kees Cook if we return -EIO because the
obj->type != ACPI_TYPE_BUFFER, then we must kfree the
output buffer before the return.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Reported-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index 01ea4bb958af..931cc50136de 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -69,6 +69,7 @@ static int run_smbios_call(struct wmi_device *wdev)
 		if (obj->type == ACPI_TYPE_INTEGER)
 			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
 				obj->integer.value);
+		kfree(output.pointer);
 		return -EIO;
 	}
 	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
-- 
2.31.1

