Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 15:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6622860F90
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 15:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhKBPfi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 11:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53286 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231725AbhKBPfi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 11:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635867182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=unMbCUNrJ9IE2DBhH/hvSeGaYfKH5Lkp4eOebusIPsU=;
        b=CmD0Oh4YZ3pjcTNvUfPx67dCz5OGp8VHO10oUuXP9vkT7JprnIesUy1pBRy180db56bDOr
        Hm+FVUon+n8FBQSbaVe5HsyITCEnm1hqlrtdyGfZvcaSSbLsXdpNXKdv2D2lVelF5RBfC/
        /vtPdBv9myH2pFOCkwKTC/4qKnMW7IQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-shyPlqodN4CIrswHWQbLjg-1; Tue, 02 Nov 2021 11:32:59 -0400
X-MC-Unique: shyPlqodN4CIrswHWQbLjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F8919200C0;
        Tue,  2 Nov 2021 15:32:58 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.91])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8B660FB8;
        Tue,  2 Nov 2021 15:32:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: amd-pmc: Make CONFIG_AMD_PMC depend on RTC_CLASS
Date:   Tue,  2 Nov 2021 16:32:56 +0100
Message-Id: <20211102153256.76956-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since the "Add special handling for timer based S0i3 wakeup" changes
the amd-pmc code now relies on symbols from the RTC-class code,
add a dependency for this to Kconfig.

Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup")
Cc: Mario Limonciello <mario.limonciello@amd.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d4c079f4afc6..7400bc5da5be 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -185,7 +185,7 @@ config ACER_WMI
 
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
-	depends on ACPI && PCI
+	depends on ACPI && PCI && RTC_CLASS
 	help
 	  The driver provides support for AMD Power Management Controller
 	  primarily responsible for S2Idle transactions that are driven from
-- 
2.31.1

