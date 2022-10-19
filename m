Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B967EC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 Oct 2022 19:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiJSTsM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 Oct 2022 15:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiJSTsL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2022 15:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC3B19E02C
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Oct 2022 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666208890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q8LWh3QngN9OL9D2jujOS5NbJlfk+Uy+ONdBorOD2mc=;
        b=Qkilqa4KnatRjK5AevUPHZJD4prJhcAFcCX4XaHKmrFgBGWi9YjL7X+3AkgWlP9svUkOJe
        KYQN+LMySiltU5ofPqTjeVximgBdVL1iXhOHqXJNYy6/RiVjUlsDRRVhfhv75gAn3004zN
        MMIQXL1Vo2SnxJyBszQEEDvW61HLk6Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-7vzzJbKzNIywwo3yNl4o6g-1; Wed, 19 Oct 2022 15:48:08 -0400
X-MC-Unique: 7vzzJbKzNIywwo3yNl4o6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D160833A06;
        Wed, 19 Oct 2022 19:48:08 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DD40A112131B;
        Wed, 19 Oct 2022 19:48:07 +0000 (UTC)
From:   Jelle van der Waa <jvanderwaa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jelle van der Waa <jvanderwaa@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: skip invalid fan speed
Date:   Wed, 19 Oct 2022 21:47:51 +0200
Message-Id: <20221019194751.5392-1-jvanderwaa@redhat.com>
In-Reply-To: <20221014211709.6322-2-jvanderwaa@redhat.com>
References: <20221014211709.6322-2-jvanderwaa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

65535 is most likely an invalid read.

Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

---

Cc: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6a823b850a77..20e5c043a8e8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -263,6 +263,8 @@ enum tpacpi_hkey_event_t {
 #define TPACPI_DBG_BRGHT	0x0020
 #define TPACPI_DBG_MIXER	0x0040
 
+#define FAN_NOT_PRESENT		65535
+
 #define strlencmp(a, b) (strncmp((a), (b), strlen(b)))
 
 
@@ -8876,7 +8878,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 			/* Try and probe the 2nd fan */
 			tp_features.second_fan = 1; /* needed for get_speed to work */
 			res = fan2_get_speed(&speed);
-			if (res >= 0) {
+			if (res >= 0 && speed != FAN_NOT_PRESENT) {
 				/* It responded - so let's assume it's there */
 				tp_features.second_fan = 1;
 				tp_features.second_fan_ctl = 1;
-- 
2.38.1

