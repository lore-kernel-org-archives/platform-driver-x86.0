Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D058C636D4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 12:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjBMMrf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjBMMrK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 07:47:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC631ADC4
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676292366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UyUgDYKS+yK3FOwur5h8SS2dgbZdk4kY607ebzoiPIQ=;
        b=K7jQvfqks0Uk6Cadz7xyFgFIeUnNHk8zXEv+d+8/YGtch0r/b9iFilBNGwhvKe9gqP7h4H
        dwWjAZjELS/FAmOI63+u0QdPyGGqdoBg6wMkw8CoR+Z1guNLALbJLFThakxiNBZJ29DSWs
        BisS6fxJ9Pv4XtgONQCrXcFmOKI67Pk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-M9m7ASRLNUSnKbt8PNpr0A-1; Mon, 13 Feb 2023 07:45:59 -0500
X-MC-Unique: M9m7ASRLNUSnKbt8PNpr0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C05D2A5955E;
        Mon, 13 Feb 2023 12:45:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.132])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC67403D0C1;
        Mon, 13 Feb 2023 12:45:53 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [RESEND PATCH 2/3] include: mfd: tps68470: Add masks for LEDA and LEDB
Date:   Mon, 13 Feb 2023 20:45:19 +0800
Message-Id: <20230213124520.1635257-3-hpa@redhat.com>
In-Reply-To: <20230213124520.1635257-1-hpa@redhat.com>
References: <20230213124520.1635257-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add flags for both LEDA(TPS68470_ILEDCTL_ENA), LEDB
(TPS68470_ILEDCTL_ENB), and current control mask for LEDB
(TPS68470_ILEDCTL_CTRLB)

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 include/linux/mfd/tps68470.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index 7807fa329db0..2d2abb25b944 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -34,6 +34,7 @@
 #define TPS68470_REG_SGPO		0x22
 #define TPS68470_REG_GPDI		0x26
 #define TPS68470_REG_GPDO		0x27
+#define TPS68470_REG_ILEDCTL		0x28
 #define TPS68470_REG_VCMVAL		0x3C
 #define TPS68470_REG_VAUX1VAL		0x3D
 #define TPS68470_REG_VAUX2VAL		0x3E
@@ -94,4 +95,8 @@
 #define TPS68470_GPIO_MODE_OUT_CMOS	2
 #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
 
+#define TPS68470_ILEDCTL_ENA		BIT(2)
+#define TPS68470_ILEDCTL_ENB		BIT(6)
+#define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
+
 #endif /* __LINUX_MFD_TPS68470_H */
-- 
2.39.0

