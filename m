Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E07BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Sep 2021 04:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33A1061212
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Sep 2021 04:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhIREt4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Sep 2021 00:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhIREt4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Sep 2021 00:49:56 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD9AC061574;
        Fri, 17 Sep 2021 21:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=ZSyq6dnNtLRF9BLAbdspJ2ImLg9O5ADHvg8kEWnVbi8=; b=qkw+szn3Bvs0HqwRZu0JeKrT6c
        lulMJVjfKr/voIixGdJkZfXxDNhG68FC+r+MpwWK4OjMt6eUr4fSPRKs7wtxYFKS5T0N+nCtJ+X0Y
        ABtUhN2fvpC+CozsUvg/ZwI2kiZVhlf5OscIHMWrEFM5cIrJTHC2oy26S4E9eLAIsK0O4F24xeHKE
        cZErJKDqJR51wNuLWRP47/I1uX1DeKFn+VniY2yND4xcWe+XgvrzU4JUDJWFdYdS13dCf9Pp+/EeU
        c6DaG8EsWIprKLS6GMDADHqr17YYhi7CxAp3Ws5Hmfx26PI7e9DUGvts6/znl9s52qDZvKOpBnw7g
        ruMpqsvg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mRSH8-00FOCC-JI; Sat, 18 Sep 2021 04:48:30 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Perry Yuan <Perry.Yuan@dell.com>, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Subject: [PATCH] platform/x86: dell: fix DELL_WMI_PRIVACY dependencies & build error
Date:   Fri, 17 Sep 2021 21:48:29 -0700
Message-Id: <20210918044829.19222-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When DELL_WMI=y, DELL_WMI_PRIVACY=y, and LEDS_TRIGGER_AUDIO=m, there
is a linker error since the LEDS trigger code is built as a loadable
module. This happens because DELL_WMI_PRIVACY is a bool that depends
on a tristate (LEDS_TRIGGER_AUDIO=m), which can be dangerous.

ld: drivers/platform/x86/dell/dell-wmi-privacy.o: in function `dell_privacy_wmi_probe':
dell-wmi-privacy.c:(.text+0x3df): undefined reference to `ledtrig_audio_get'

Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell hardware privacy")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Perry Yuan <Perry.Yuan@dell.com>
Cc: Dell.Client.Kernel@dell.com
Cc: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <mgross@linux.intel.com>
---
 drivers/platform/x86/dell/Kconfig |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20210917.orig/drivers/platform/x86/dell/Kconfig
+++ linux-next-20210917/drivers/platform/x86/dell/Kconfig
@@ -166,8 +166,7 @@ config DELL_WMI
 
 config DELL_WMI_PRIVACY
 	bool "Dell WMI Hardware Privacy Support"
-	depends on DELL_WMI
-	depends on LEDS_TRIGGER_AUDIO
+	depends on LEDS_TRIGGER_AUDIO = y || DELL_WMI = LEDS_TRIGGER_AUDIO
 	help
 	  This option adds integration with the "Dell Hardware Privacy"
 	  feature of Dell laptops to the dell-wmi driver.
