Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5154C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Dec 2021 12:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhLYMC5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Dec 2021 07:02:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41317 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229828AbhLYMC5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Dec 2021 07:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640433776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=07Lv3dAqf4Zakd0SywdU7eTyQfmkER9NuLXnAG9eoo4=;
        b=UgztII5Eo7W+iGP3vDwX05V0RalJ9TbbZ0G+nIJHXdSFACWk6NC3MaOByY4Mq/PkGkLfz1
        WdV66RlhpTjm992B+rkP9w/elbPh8yYDin/tWKN3xyWevPyKL1pjlkggctjl5os8p5iFw8
        se7NWOUwkmokLV7ExjChnWZnFml3+do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-mq3TeZsGPXmsdTpfacO_Ww-1; Sat, 25 Dec 2021 07:02:53 -0500
X-MC-Unique: mq3TeZsGPXmsdTpfacO_Ww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D321006AA0;
        Sat, 25 Dec 2021 12:02:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 403757D442;
        Sat, 25 Dec 2021 12:02:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: touchscreen_dmi: Enable pen support on the Chuwi Hi10 Plus and Pro
Date:   Sat, 25 Dec 2021 13:02:47 +0100
Message-Id: <20211225120247.95380-2-hdegoede@redhat.com>
In-Reply-To: <20211225120247.95380-1-hdegoede@redhat.com>
References: <20211225120247.95380-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Both the Chuwi Hi10 Plus (CWI527) and the Chuwi Hi10 Pro (CWI529) tablets
support being used together with the Hi H2 pen.

Add the necessary properties to enable the new support for this in the
silead touchscreen driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 92d274eb9dbe..7acec7eaf4cb 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -107,6 +107,9 @@ static const struct property_entry chuwi_hi10_plus_props[] = {
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10plus.fw"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	PROPERTY_ENTRY_BOOL("silead,pen-supported"),
+	PROPERTY_ENTRY_U32("silead,pen-resolution-x", 8),
+	PROPERTY_ENTRY_U32("silead,pen-resolution-y", 8),
 	{ }
 };
 
@@ -136,6 +139,9 @@ static const struct property_entry chuwi_hi10_pro_props[] = {
 	PROPERTY_ENTRY_U32_ARRAY("silead,efi-fw-min-max", chuwi_hi10_pro_efi_min_max),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	PROPERTY_ENTRY_BOOL("silead,pen-supported"),
+	PROPERTY_ENTRY_U32("silead,pen-resolution-x", 8),
+	PROPERTY_ENTRY_U32("silead,pen-resolution-y", 8),
 	{ }
 };
 
-- 
2.33.1

