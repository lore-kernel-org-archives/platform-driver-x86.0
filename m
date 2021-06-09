Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6C8C48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:00:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E82986124C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhFIPB4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:01:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45908 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231791AbhFIPBz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623250800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7YG29Uum0JUtTL/6nF6LEBQkgJelSRFaQ26ugVhrbgQ=;
        b=MirnNBU7ZQDBAXhGeEgfJyJ9QPf6ud3+DE5i62t4rWLkLFXlDuUbOi6gi8/t3Fp+crBzVI
        7mP/5i1PukLtNwsmVs+hx9grDpohZNAxjExTztike5ECheS3eHo5NJUgcfvdyqqMLzhhqS
        65U0/9/0+vpZSocTSWortt98vzxzp7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-vtkVck7CO1yqb-S8Hk8Aqw-1; Wed, 09 Jun 2021 10:59:56 -0400
X-MC-Unique: vtkVck7CO1yqb-S8Hk8Aqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BEC2100CF6B;
        Wed,  9 Jun 2021 14:59:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-55.ams2.redhat.com [10.36.113.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E1DFE60BD9;
        Wed,  9 Jun 2021 14:59:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Dell.Client.Kernel@dell.com, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] platform/x86: dell-wmi-sysman/think-lmi: Make fw_attr_class global static
Date:   Wed,  9 Jun 2021 16:59:52 +0200
Message-Id: <20210609145952.113393-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The dell-wmi-sysman and think-lmi kernel modules both have a global
struct class *fw_attr_class variable, leading to the following compile
errors when both are builtin:

ld: drivers/platform/x86/think-lmi.o:(.bss+0x0): multiple definition of `fw_attr_class'; drivers/platform/x86/dell/dell-wmi-sysman/sysman.o:(.bss+0x0): first defined here

In both cases the variable is only used in the file where it is declared.
Make both declarations static to avoid the linker error.

Cc: Mark Pearson <markpearson@lenovo.com>
Cc: Dell.Client.Kernel@dell.com
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
 drivers/platform/x86/think-lmi.c                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 1378c1878658..636bdfa83284 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -25,7 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
 /* reset bios to defaults */
 static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
 static int reset_option = -1;
-struct class *fw_attr_class;
+static struct class *fw_attr_class;
 
 
 /**
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 782d8e3fe7a1..c6413b906e4a 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -134,7 +134,7 @@ static const char * const encoding_options[] = {
 	[TLMI_ENCODING_SCANCODE] = "scancode",
 };
 static struct think_lmi tlmi_priv;
-struct class *fw_attr_class;
+static struct class *fw_attr_class;
 
 /* ------ Utility functions ------------*/
 /* Convert BIOS WMI error string to suitable error code */
-- 
2.31.1

