Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E38C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 14:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236642AbiECOH3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 10:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236617AbiECOHZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 10:07:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 07F352D1C6
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651586623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XfATmEmMWAHmUPjRPvqS2NSPYo/AxzzMejax6HO88D4=;
        b=CkvcHzE6omO0buTLjV6rAnOVzmr2WI+r7zewo/im/OXjO7bwBfzJlo/K2FAUb1pX9T1PyP
        qobkCT+F0Silw71KABGovb4/6rBt2AUqOkdmLZoxyg/2ltkFOy6eZVmuZq59WJtAlG9fVl
        gUjZNhLZAqzrElCmQFTqjg2INvy41TE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-C-iJNP-vPFmZGuuaOlOwZQ-1; Tue, 03 May 2022 10:02:51 -0400
X-MC-Unique: C-iJNP-vPFmZGuuaOlOwZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7FD1BA6EFB;
        Tue,  3 May 2022 14:02:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1F2759E6F;
        Tue,  3 May 2022 14:02:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/1] platform/x86: Drop the PMC_ATOM Kconfig option
Date:   Tue,  3 May 2022 16:02:07 +0200
Message-Id: <20220503140207.101218-2-hdegoede@redhat.com>
In-Reply-To: <20220503140207.101218-1-hdegoede@redhat.com>
References: <20220503140207.101218-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The def_bool y PMC_ATOM Kconfig option provides a couple of symbols used
by the code enabled by the X86_INTEL_LPSS option and it registers some
clocks. These clocks are only registered on Bay Trail, Cherry Trail and
Brasswell Intel SoCs and kernels targeting these SoCs must always have
the X86_INTEL_LPSS option enabled otherwise many things will not work.

Building the PMC_ATOM code on kernels which are not targeting the
mentioned SoCs and which do not have the X86_INTEL_LPSS enabled is
not useful.

This means that we can simplify things by replacing the PMC_ATOM Kconfig
option in Makefiles with X86_INTEL_LPSS and then drop the option.

Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/clk/x86/Makefile      | 4 +---
 drivers/platform/x86/Kconfig  | 5 -----
 drivers/platform/x86/Makefile | 2 +-
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/x86/Makefile b/drivers/clk/x86/Makefile
index 1244c4e568ff..c2088b3c4081 100644
--- a/drivers/clk/x86/Makefile
+++ b/drivers/clk/x86/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_PMC_ATOM)		+= clk-pmc-atom.o
 obj-$(CONFIG_X86_AMD_PLATFORM_DEVICE)	+= clk-fch.o
-clk-x86-lpss-y			:= clk-lpss-atom.o
-obj-$(CONFIG_X86_INTEL_LPSS)	+= clk-x86-lpss.o
+obj-$(CONFIG_X86_INTEL_LPSS)	+= clk-lpss-atom.o clk-pmc-atom.o
 obj-$(CONFIG_CLK_LGM_CGU)	+= clk-cgu.o clk-cgu-pll.o clk-lgm.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f08ad85683cb..85c396a43048 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1161,8 +1161,3 @@ config WINMATE_FM07_KEYS
 	  that delivers key events when these buttons are pressed.
 
 endif # X86_PLATFORM_DEVICES
-
-config PMC_ATOM
-       def_bool y
-       depends on PCI
-       select COMMON_CLK
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 4a59f47a46e2..cc2a74713313 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -126,7 +126,7 @@ obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
 obj-$(CONFIG_INTEL_SCU_PLATFORM)	+= intel_scu_pltdrv.o
 obj-$(CONFIG_INTEL_SCU_WDT)		+= intel_scu_wdt.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
-obj-$(CONFIG_PMC_ATOM)			+= pmc_atom.o
+obj-$(CONFIG_X86_INTEL_LPSS)		+= pmc_atom.o
 
 # Siemens Simatic Industrial PCs
 obj-$(CONFIG_SIEMENS_SIMATIC_IPC)	+= simatic-ipc.o
-- 
2.36.0

