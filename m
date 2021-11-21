Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1BEC4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238756AbhKUTOv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29582 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238645AbhKUTOv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SdpoyOtRsa4gCMzC5UnkgaMazvyvd9xf0Cvuyt3ni8c=;
        b=ati4f9/EbVVgenwnZwZcG2YI7Cr+ggKVhBabvSOlsF53G+O1S/ZCZToEfpFraWpuEP4lCX
        xZq1CD5JA20kEwa/IdbIIku3K9rEvvzOSvpGCuoIGa07fvevEErRUaeDSKSwY8GmJH2ZEx
        OtVP8tdjF00pUgZmFPy+pFcYDxI0voc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-wpykQnxFNyCLk1DDlZkzDA-1; Sun, 21 Nov 2021 14:11:42 -0500
X-MC-Unique: wpykQnxFNyCLk1DDlZkzDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BC99871803;
        Sun, 21 Nov 2021 19:11:41 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3EE875DF5E;
        Sun, 21 Nov 2021 19:11:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 7/7] platform/x86: thinkpad_acpi: Fix thermal_temp_input_attr sorting
Date:   Sun, 21 Nov 2021 20:11:29 +0100
Message-Id: <20211121191129.256713-8-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix thermal_temp_input_attr sorting. Now that we use is_visible,
rather then registering only part of the thermal_temp_input_attr array,
putting attr 0-7 last is no longer needed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9f45949fb3e9..2d2d5fd11635 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6283,14 +6283,6 @@ static struct sensor_device_attribute sensor_dev_attr_thermal_temp_input[] = {
 	&sensor_dev_attr_thermal_temp_input[X].dev_attr.attr
 
 static struct attribute *thermal_temp_input_attr[] = {
-	THERMAL_ATTRS(8),
-	THERMAL_ATTRS(9),
-	THERMAL_ATTRS(10),
-	THERMAL_ATTRS(11),
-	THERMAL_ATTRS(12),
-	THERMAL_ATTRS(13),
-	THERMAL_ATTRS(14),
-	THERMAL_ATTRS(15),
 	THERMAL_ATTRS(0),
 	THERMAL_ATTRS(1),
 	THERMAL_ATTRS(2),
@@ -6299,6 +6291,14 @@ static struct attribute *thermal_temp_input_attr[] = {
 	THERMAL_ATTRS(5),
 	THERMAL_ATTRS(6),
 	THERMAL_ATTRS(7),
+	THERMAL_ATTRS(8),
+	THERMAL_ATTRS(9),
+	THERMAL_ATTRS(10),
+	THERMAL_ATTRS(11),
+	THERMAL_ATTRS(12),
+	THERMAL_ATTRS(13),
+	THERMAL_ATTRS(14),
+	THERMAL_ATTRS(15),
 	NULL
 };
 
-- 
2.31.1

