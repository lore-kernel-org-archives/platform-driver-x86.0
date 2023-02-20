Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03932C64ED9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 22:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbjBTWNQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 17:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbjBTWNO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F97FF23
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LB1IfrYiKWTFv3wKasILM3M/u7uPBEpqy5sdAX+kceg=;
        b=UaPUBHLSPaBEVhCSxTxhWn5RCtg1Q9ifMpeFko2f6+1jdg1N33ZSWh826gk+IthmG9p/aH
        uSAJ+5SMppPdEKA0Lhcq/umbEnITMw4boBPxEmxDc0QvidTbdqVTjAloWLe2delaw4Vp2Y
        fhW8WObuc9jab9sXTYD2E50C6deEujk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-LOsK0yvcNWqvsntdO-a35w-1; Mon, 20 Feb 2023 17:12:27 -0500
X-MC-Unique: LOsK0yvcNWqvsntdO-a35w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E4E73806625;
        Mon, 20 Feb 2023 22:12:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C9A5C140EBF6;
        Mon, 20 Feb 2023 22:12:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 7/9] platform/x86: x86-android-tablets: Move remaining tablets to other.c
Date:   Mon, 20 Feb 2023 23:12:10 +0100
Message-Id: <20230220221212.196009-8-hdegoede@redhat.com>
In-Reply-To: <20230220221212.196009-1-hdegoede@redhat.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All that remains now in x86-android-tablets-main.c is info for other
(non Asus / Lenovo) tablets. Rename it to other.c to reflect this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/Makefile               | 2 +-
 .../x86-android-tablets/{x86-android-tablets-main.c => other.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/platform/x86/x86-android-tablets/{x86-android-tablets-main.c => other.c} (99%)

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index d0e4f0353a00..12f5eb2c9b84 100644
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
index cb8d84983503..a0f8c4bb3237 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2022 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
  */
 
 #include <linux/acpi.h>
-- 
2.39.1

