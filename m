Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77883CCA479
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 09:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbiFTJgr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 05:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbiFTJgq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 05:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2625913D67
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655717805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oUihp6QOhBXwOLdEMNJp4UFXHvIuR5TBuHBAdenGQz4=;
        b=aru5fyjpXHYK3UdJY+S5wI3ah+RoZvzGpOYBolT8UMuY0y7//J56lIzJF0UvEiXd4PkMWg
        lIxZhayewYwuCqtUO+XSPRJbHGVbVEmOo/zoetkxavvKWICBAi04H0dvsH/pS02ooji0hE
        DOw0h2vUnRWYZKzbYa/e5VT3vTGJX1s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-UAa4uaQ6NsWERg9OERD6yQ-1; Mon, 20 Jun 2022 05:36:41 -0400
X-MC-Unique: UAa4uaQ6NsWERg9OERD6yQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37A0780013E;
        Mon, 20 Jun 2022 09:36:41 +0000 (UTC)
Received: from x1.nl (unknown [10.39.195.183])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F74CC28112;
        Mon, 20 Jun 2022 09:36:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: Kconfig: Remove unnecessary "depends on X86"
Date:   Mon, 20 Jun 2022 11:36:36 +0200
Message-Id: <20220620093637.9429-2-hdegoede@redhat.com>
In-Reply-To: <20220620093637.9429-1-hdegoede@redhat.com>
References: <20220620093637.9429-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The sourcing of drivers/platform/x86/Kconfig is protected by
a "if X86", so the "depends on X86" for X86_PLATFORM_DEVICES
is unnecessary, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 6e22ac916f7a..0f723c34a637 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -6,7 +6,6 @@
 menuconfig X86_PLATFORM_DEVICES
 	bool "X86 Platform Specific Device Drivers"
 	default y
-	depends on X86
 	help
 	  Say Y here to get to see options for device drivers for various
 	  x86 platforms, including vendor-specific laptop extension drivers.
-- 
2.36.0

