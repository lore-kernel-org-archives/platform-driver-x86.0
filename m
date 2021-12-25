Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A15C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Dec 2021 12:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhLYMC4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Dec 2021 07:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34622 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229828AbhLYMCz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Dec 2021 07:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640433775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=YLvsf5/EYTjCGXCQhgvSWi9mDf9tKaJ+aUABUmD+qtQ=;
        b=MMOWLa1ThuESs5YZ+1v5NpkItxK9djCkX2yk3KHMQUEXzzWsBtqABsi7t1vvZplT/Rdl62
        4mRhFmmE583IqqoM7mOZ2sGFpZSM/geMVmqeNNXdBQJ24XlchGr4CqJu6m2hXWJW81k5hT
        PQ7Pj5RCokBRLPWZoJJoC5IzSbiEOeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-nXj64PZMNEmuswQ_MHKn4Q-1; Sat, 25 Dec 2021 07:02:51 -0500
X-MC-Unique: nXj64PZMNEmuswQ_MHKn4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC860801B0C;
        Sat, 25 Dec 2021 12:02:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 83E9D7D422;
        Sat, 25 Dec 2021 12:02:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: touchscreen_dmi: Correct min/max values for Chuwi Hi10 Pro (CWI529) tablet
Date:   Sat, 25 Dec 2021 13:02:46 +0100
Message-Id: <20211225120247.95380-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The firmware distributed as part of the Windows and Android drivers uses
significantly different min and max values for the x- and y-axis,
compared to the EFI's embedded touchscreen firmware.

The difference is large enough that e.g. typing on an onscreen keyboard
results in the wrong "keys" getting pressed.

Adjust the values to match those of the firmware distributed with the
Windows and Android drivers (which is necessary for pen support) and
put the EFI-fw version's min/max values in the new "silead,efi-fw-min-max"
property. The silead driver will use these when it is using the
EFI embedded firmware, so as to not regress functionality in that case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 17dd54d4b783..92d274eb9dbe 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -124,13 +124,16 @@ static const struct ts_dmi_data chuwi_hi10_plus_data = {
 	.properties     = chuwi_hi10_plus_props,
 };
 
+static const u32 chuwi_hi10_pro_efi_min_max[] = { 8, 1911, 8, 1271 };
+
 static const struct property_entry chuwi_hi10_pro_props[] = {
-	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
-	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
-	PROPERTY_ENTRY_U32("touchscreen-size-x", 1912),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 1272),
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 80),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 26),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1962),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1254),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
+	PROPERTY_ENTRY_U32_ARRAY("silead,efi-fw-min-max", chuwi_hi10_pro_efi_min_max),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
-- 
2.33.1

