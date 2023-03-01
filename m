Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30866C7EE31
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjCAJZl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjCAJZL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A601734303
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ozQI7hCps9q4yGxEYOr7Z235D2uyyvMCbk5XPYg0OiY=;
        b=ZWUGBWqu2nuLyLjQ2NbS/Fc3IJuvgQgqn2Dy4JsYcNUq4YTSQj2yg7D3F9jWif7b47tnoC
        cT5VzZpf8kYW34nh3/+NMi04a4p+IBmwBV73csXVU3k5wH52VJTBCITA+5rYri1yYbFF54
        xXoIsDD0zMOTEMiMiKry7/np+P6RHEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-Qfwm9Z4XNRm1T1Hm0NOitw-1; Wed, 01 Mar 2023 04:23:45 -0500
X-MC-Unique: Qfwm9Z4XNRm1T1Hm0NOitw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83CBD280A328;
        Wed,  1 Mar 2023 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7085400D796;
        Wed,  1 Mar 2023 09:23:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 08/14] platform/x86: x86-android-tablets: Move remaining tablets to other.c
Date:   Wed,  1 Mar 2023 10:23:25 +0100
Message-Id: <20230301092331.7038-9-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All that remains now in x86-android-tablets-main.c is info for other
(non Asus / Lenovo) tablets. Rename it to other.c to reflect this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
---
 drivers/platform/x86/x86-android-tablets/Makefile             | 2 +-
 .../{x86-android-tablets-main.c => other.c}                   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/platform/x86/x86-android-tablets/{x86-android-tablets-main.c => other.c} (99%)

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index d881a824fa3d..41ece5a37137 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -6,4 +6,4 @@
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
 x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
-			 asus.o lenovo.o x86-android-tablets-main.o
+			 asus.o lenovo.o other.o
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/other.c
similarity index 99%
rename from drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
rename to drivers/platform/x86/x86-android-tablets/other.c
index 0362194e225c..83b30b24d57f 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -1,11 +1,11 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * DMI based code to deal with broken DSDTs on X86 tablets which ship with
  * Android as (part of) the factory image. The factory kernels shipped on these
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2022 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
  */
 
 #include <linux/acpi.h>
-- 
2.39.1

