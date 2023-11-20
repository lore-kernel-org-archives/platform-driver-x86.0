Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B6DC2BB3F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 15:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbjKTPqL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 10:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234193AbjKTPqG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 10:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5B4124
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 07:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700495161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zYkfGH+lvFJicSUirn6ZCs6LFQLpxYQLC0xruAs8y+I=;
        b=ihAxygXGcBhqtvbGmDohj0V5gLnO4Q8oqTHB91KwSQ5KwYWwVJBMR7wussuxjndI+9XnBl
        5AjJTvr4NQ/qx9squxW2zwuduNJtK29S59HmsQjHSY69xh+UXx08b7SJDXKCV3xdfdcz/r
        hT9Dzg1NLw9THTIEj/NhHNf1t9sKOTQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-WpYuqkFJPWOP6pudMBR-dQ-1; Mon,
 20 Nov 2023 10:45:58 -0500
X-MC-Unique: WpYuqkFJPWOP6pudMBR-dQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0EA12803022;
        Mon, 20 Nov 2023 15:45:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0896C492BE0;
        Mon, 20 Nov 2023 15:45:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Drop Mark Gross as maintainer for x86 platform drivers
Date:   Mon, 20 Nov 2023 16:45:45 +0100
Message-ID: <20231120154548.611041-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Mark has not really been active as maintainer for x86 platform drivers
lately, drop Mark from the MAINTAINERS entries for drivers/platform/x86,
drivers/platform/mellanox and drivers/platform/surface.

Cc: Mark Gross <markgross@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc97cdf6d682..af0ea6feb3b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13788,7 +13788,6 @@ F:	drivers/net/ethernet/mellanox/mlxfw/
 MELLANOX HARDWARE PLATFORM SUPPORT
 M:	Hans de Goede <hdegoede@redhat.com>
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
-M:	Mark Gross <markgross@kernel.org>
 M:	Vadim Pasternak <vadimp@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
@@ -14397,7 +14396,6 @@ F:	drivers/platform/surface/surface_gpe.c
 MICROSOFT SURFACE HARDWARE PLATFORM SUPPORT
 M:	Hans de Goede <hdegoede@redhat.com>
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
-M:	Mark Gross <markgross@kernel.org>
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
@@ -23674,7 +23672,6 @@ F:	drivers/platform/x86/x86-android-tablets/
 X86 PLATFORM DRIVERS
 M:	Hans de Goede <hdegoede@redhat.com>
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
-M:	Mark Gross <markgross@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
-- 
2.41.0

