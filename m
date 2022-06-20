Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88897C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 09:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbiFTJgq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 05:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbiFTJgp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 05:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3000113D67
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655717804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ae6sUXNuVa/1lfdAU7Pb5QcbGSCYndjvjrdGNKPcnm4=;
        b=Ekw5gkpoxxkZDuwkz9/GqPKiiNfV7Qs48llWM/SlQdwdJlHY0ThnScTxfBiEzLeHsCtUIy
        z22Pqbp/w8m5v8hgR+5+MIqMEo9gYZSRXU/MaUOXnT8zQWOrL8aU4LzkH1oiiKf4ZIiDBm
        QQwRhCay3HsB5a4TFtXR8+OQRmULhhU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-Q6_SoCXXPb6xWhrZcL2VMA-1; Mon, 20 Jun 2022 05:36:42 -0400
X-MC-Unique: Q6_SoCXXPb6xWhrZcL2VMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98A01299E741;
        Mon, 20 Jun 2022 09:36:42 +0000 (UTC)
Received: from x1.nl (unknown [10.39.195.183])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 91821C28115;
        Mon, 20 Jun 2022 09:36:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86/dell: Kconfig: Remove unnecessary "depends on X86_PLATFORM_DEVICES"
Date:   Mon, 20 Jun 2022 11:36:37 +0200
Message-Id: <20220620093637.9429-3-hdegoede@redhat.com>
In-Reply-To: <20220620093637.9429-1-hdegoede@redhat.com>
References: <20220620093637.9429-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

platform/x86/dell/Kconfig is only sourced if X86_PLATFORM_DEVICES is set,
so it does not need to depend on it.

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

