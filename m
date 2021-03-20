Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17DAC433C1
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0A2561961
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhCTOfK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37909 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229793AbhCTOeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2d+uCEo/ztk38tJY197ngctcKJfBd7hP2nIAu6qyzg0=;
        b=Y3RvAi9YzdH/Xr9SGqePR4qxylNsvAEhiMq7q+1Fr3Pl3wsn9fIWR7p6QfcsVXtefCVNiP
        T96VJ2Rd2wIsNON3btoYcdh6A6MUP7YDr2fjboCgfru8qUizb69wTjAmVDl+AH7y4XLnkA
        flWPvu0Sx41fqBxwXuJeNl9Q1nUiaLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-cd5qepcJMnW8NigHMag4Zw-1; Sat, 20 Mar 2021 10:34:41 -0400
X-MC-Unique: cd5qepcJMnW8NigHMag4Zw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E7C5B362;
        Sat, 20 Mar 2021 14:34:40 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E5A9760C04;
        Sat, 20 Mar 2021 14:34:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/7] platform/x86: dell-wmi-sysman: Fix release_attributes_data() getting called twice on init_bios_attributes() failure
Date:   Sat, 20 Mar 2021 15:34:25 +0100
Message-Id: <20210320143429.76047-4-hdegoede@redhat.com>
In-Reply-To: <20210320143429.76047-1-hdegoede@redhat.com>
References: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All calls of init_bios_attributes() will result in a
goto fail_create_group if they fail, which calls
release_attributes_data().

So there is no need to call release_attributes_data() from
init_bios_attributes() on failure itself.

Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index a058dd7fccea..06ca579fbeaf 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -490,7 +490,6 @@ static int init_bios_attributes(int attr_type, const char *guid)
 
 err_attr_init:
 	mutex_unlock(&wmi_priv.mutex);
-	release_attributes_data();
 	kfree(obj);
 	return retval;
 }
-- 
2.30.2

