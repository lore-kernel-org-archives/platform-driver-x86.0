Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28ECC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Oct 2021 22:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81F3860F9E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Oct 2021 22:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhJHWsY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Oct 2021 18:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhJHWsW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Oct 2021 18:48:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF76C061570
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Oct 2021 15:46:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v17so33942543wrv.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Oct 2021 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j5W9Vd/Njd7U1e4iVEWcG4vpB5eJt5LkQE1/nXXyzgo=;
        b=iIf+oyMt37DLQ6b1jXzJaYS4VdP0CegIzObdf8B5rjAR7YLYFQj5sU8SHl+Ccewa4b
         12GHkiUQdH99c11VM7ZvLHjxGdJtyvyPCIYmZtE3d0A6OZ1i+n1XPEWm7C4cJ2yOd9O5
         aSHY3AI4H8rQhltNlThNZDONkykk/T7U0DR0JvlJD5WT3FCXgESDag8YkuMjohLiKmvI
         DZl1Nmf+Krtgpv31vmu67QGnGG+Tehm76gN8IizyHloAvsvOeeBzGeGvckzkVaOSAfxi
         V0hJXQ5NuY6aXqxmd6l+dWAI3AbKtIgEezLW83Kyzw3k9Dd/gNkWCaYreKj3Gi5r1e2u
         Tn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j5W9Vd/Njd7U1e4iVEWcG4vpB5eJt5LkQE1/nXXyzgo=;
        b=5oGisUPUKvObYLoIptdw6/9fFJQE1kCawYyYlUA3UhzmV+j9H7dV2vuPIiIvOQ1tIN
         LBeM56d/xq8HBO+AgJKfMIolqgoUo8Vrcm3njpcRI8VMbHE70I8bOgwCYioiFVm5/4b/
         3qBhzIuXgl7J6TNERg4XVzpHK4AUMFDlFwuvPaNS5I7W0ojLb58wJUdq795BcFeiSWaG
         WZR/xW0twxkrycVWImTF18QcUzohu7srs3zMmzMIUn+xsEn8lbOgegZJs0tHJg9NJtUz
         PFQmXTDZYvH1WDzLMI5C5HOJwFd9H+AwZ8FMJLXIrpAeXHYmNPzNV8Y7V8ggWKxKXjog
         wEzQ==
X-Gm-Message-State: AOAM530yXt51GD+DZq2HYQ6ucXyd2UkMjYtI3hwFSvTuZWLVocUYU++a
        RkqiXv9gSx3SWjJ4aTXQnamtw+88Ao0=
X-Google-Smtp-Source: ABdhPJxnc1hzqaDaOQr/25yODHFQ4QUYdXX6tw3m+tusGnZnXWwTMiYy+xrdavxiPKhaDKHBrApi6w==
X-Received: by 2002:adf:a45e:: with SMTP id e30mr7363383wra.269.1633733185355;
        Fri, 08 Oct 2021 15:46:25 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k22sm582782wrd.59.2021.10.08.15.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 15:46:24 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] platform/x86: intel_skl_int3472: Correct null check
Date:   Fri,  8 Oct 2021 23:46:08 +0100
Message-Id: <20211008224608.415949-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The int3472-discrete driver can enter an error path after initialising
int3472->clock.ena_gpio, but before it has registered the clock. This will
cause a NULL pointer dereference, because clkdev_drop() is not null aware.
Instead of guarding the call to skl_int3472_unregister_clock() by checking
for .ena_gpio, check specifically for the presence of the clk_lookup, which
will guarantee clkdev_create() has already been called.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=214453
Fixes: 7540599a5ef1 ("platform/x86: intel_skl_int3472: Provide skl_int3472_unregister_clock()")
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
index 9fe0a2527e1c..e59d79c7e82f 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
+++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
@@ -401,7 +401,7 @@ int skl_int3472_discrete_remove(struct platform_device *pdev)
 
 	gpiod_remove_lookup_table(&int3472->gpios);
 
-	if (int3472->clock.ena_gpio)
+	if (int3472->clock.cl)
 		skl_int3472_unregister_clock(int3472);
 
 	gpiod_put(int3472->clock.ena_gpio);
-- 
2.25.1

