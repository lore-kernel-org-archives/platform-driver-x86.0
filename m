Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F419C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 15:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbiFTPLT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240247AbiFTPJ4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89DEB24968
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655736998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lKyF+z79fHYcBhESudOJe7xlGopRWYOzajO6RkvOs0E=;
        b=NreE8oOwEUKkZEfSUW6TYv1DCKp2Jgm2pMhHYeHicSdDgY/9MCugn4By4+W4z2XkiXtY83
        WHxHcAI8uYiNPxfqFCjKBoBEiZD+YqrS4G7EtQzonIxYjtMlQPOEH1rMFGbClyI/A+izyL
        qt8Qj8ozWES83O3ipwbP6GXuY6+SUOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Fg4g1VbTM46DW6nRZ-erXw-1; Mon, 20 Jun 2022 10:56:35 -0400
X-MC-Unique: Fg4g1VbTM46DW6nRZ-erXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA1FE8339A2;
        Mon, 20 Jun 2022 14:56:34 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.239])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6D1CB9D63;
        Mon, 20 Jun 2022 14:56:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 3/3] platform/x86/dell: Kconfig: Remove unnecessary "depends on X86_PLATFORM_DEVICES"
Date:   Mon, 20 Jun 2022 16:56:28 +0200
Message-Id: <20220620145628.5882-3-hdegoede@redhat.com>
In-Reply-To: <20220620145628.5882-1-hdegoede@redhat.com>
References: <20220620145628.5882-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

platform/x86/dell/Kconfig is only sourced if X86_PLATFORM_DEVICES is set,
so it does not need to depend on it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index fe224a54f24c..25421e061c47 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -5,7 +5,6 @@
 
 menuconfig X86_PLATFORM_DRIVERS_DELL
 	bool "Dell X86 Platform Specific Device Drivers"
-	depends on X86_PLATFORM_DEVICES
 	help
 	  Say Y here to get to see options for device drivers for various
 	  Dell x86 platforms, including vendor-specific laptop extension drivers.
-- 
2.36.0

