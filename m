Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29669C433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB889223BF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKGD4j0E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgJSS5M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38908 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727681AbgJSS5M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GvcPrGT4bElCjje5Tysar0Woend8nrETmG4LFobVD+Y=;
        b=NKGD4j0ECrcP+jK4kBB9GYpPLzxNhT/KMjMryei39CqTxjbt/jYB7nxnTMaUY3KTjmu/1I
        HGmRpokRRJfxmXsxpyWGEAuIcF1AZGSY7wSZbnThGn7c9gr55eqxokGCCNOA6YIuz6MnDS
        7pu2pcb4Fas1tbcM7kfZixKK4HheVQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-C4J6BttKNo-Ux0lv0q2oKw-1; Mon, 19 Oct 2020 14:57:09 -0400
X-MC-Unique: C4J6BttKNo-Ux0lv0q2oKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E43E8049D0;
        Mon, 19 Oct 2020 18:56:38 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 34F9560DA0;
        Mon, 19 Oct 2020 18:56:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/6] platform/x86: acer-wmi: Add ACER_CAP_SET_FUNCTION_MODE capability flag
Date:   Mon, 19 Oct 2020 20:56:27 +0200
Message-Id: <20201019185628.264473-5-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-1-hdegoede@redhat.com>
References: <20201019185628.264473-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Not all devices supporting WMID_GUID3 support the wmid3_set_function_mode()
call, leading to errors like these:

[   60.138358] acer_wmi: Enabling RF Button failed: 0x1 - 0xff
[   60.140036] acer_wmi: Enabling Launch Manager failed: 0x1 - 0xff

Add an ACER_CAP_SET_FUNCTION_MODE capability flag, so that these calls
can be disabled through the new force_caps mechanism.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 87f64b91d283..8bf9e6ed38a4 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -210,6 +210,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BLUETOOTH		BIT(2)
 #define ACER_CAP_BRIGHTNESS		BIT(3)
 #define ACER_CAP_THREEG			BIT(4)
+#define ACER_CAP_SET_FUNCTION_MODE	BIT(5)
 
 /*
  * Interface type flags
@@ -2196,10 +2197,14 @@ static int __init acer_wmi_init(void)
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
+	if (wmi_has_guid(WMID_GUID3))
+		interface->capability |= ACER_CAP_SET_FUNCTION_MODE;
+
 	if (force_caps != -1)
 		interface->capability = force_caps;
 
-	if (wmi_has_guid(WMID_GUID3)) {
+	if (wmi_has_guid(WMID_GUID3) &&
+	    (interface->capability & ACER_CAP_SET_FUNCTION_MODE)) {
 		if (ACPI_FAILURE(acer_wmi_enable_rf_button()))
 			pr_warn("Cannot enable RF Button Driver\n");
 
-- 
2.28.0

