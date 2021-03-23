Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC818C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:25:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E592619CB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 20:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhCWUZP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 16:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhCWUZJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 16:25:09 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6731C061574;
        Tue, 23 Mar 2021 13:25:08 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id 61so22124834wrm.12;
        Tue, 23 Mar 2021 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpQIupl/4ZgMIIo21s+VA9T0g3/i/FRFR9NBBUr/caU=;
        b=GhOPe826TdL3CN0Vv5EV675609NVftrBz0q8eFfWhIuwnn+Vlpsb6KZRTjri7cIMx2
         ZBCOfDi/D8eyqnHvr9SBWVQ9qLsUn0rV4Gw9LqUrPy+pVB5loR6Q9/5/tW0LTcYsxhJ8
         JQ4oI6awShy5ViYt2ObvrvgME6dwllck0ACL29iMMbwRmvmmAqE9Awn0/5VfiJfg22g8
         jKiNarCbiehpWgi9S70eY8iM9LvIW5dk/P1bQWgIAL2INAYhEzHo5gKsMXDqJoPJg1sW
         VwGdiFO/tpJLFbAzoaXxfVr/hmdqpM9WncRo7hKVgeRH9TIuyQvT+TwvQREfHhb1x4Ts
         pgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpQIupl/4ZgMIIo21s+VA9T0g3/i/FRFR9NBBUr/caU=;
        b=hLLrkx/dV1WV3YlTcs0Cn9O48j+ai8fvlCruTXPLK2jExM7NddZ6qVNh7e+Vm4NVzA
         nKXk6DsKVUcnXdygHLs7jhHce2YzIQ+G42FkpfDbkNrbhV5NxkeMebFZQhKK/ULwqVzn
         zdCjGnvEj/NRw6bGfdvxT4/dg1ugdXVpoUbaNxdIxjoFt8Fjj9j7MvSZRqK7kvDxlgM+
         OVz8VwRyi433Vz6eq167YFbL9HdlcV9rwlo/PQQVj6xXsvxcvDo1smC9AmKbSJZ0T/Cl
         ZK352Qagqa+uSxmFt+SDNcpJ/mYiUOlRLj8xzsSw03BY69rOFAZP4mOQG7A4u9H8HVM9
         qyrA==
X-Gm-Message-State: AOAM533bO9Gt7vnKzILiCN7kiBVmDhCMNVNEarfRnXzgO8O5bsSfvrFJ
        8q717VQHKRRMpErma4PrC9c=
X-Google-Smtp-Source: ABdhPJw+frJBPI+TNsYIWcXfmPUoEdRI1sYaIZjXIJO0MZUrHTCCFnor8QhzOcmPlvha+Fd9qe7Gpw==
X-Received: by 2002:a05:6000:1acd:: with SMTP id i13mr5790373wry.48.1616531107541;
        Tue, 23 Mar 2021 13:25:07 -0700 (PDT)
Received: from luca020400-laptop-arch.lan ([2001:b07:5d33:19f:ea1f:2342:ea78:219a])
        by smtp.googlemail.com with ESMTPSA id u2sm10938wmm.5.2021.03.23.13.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 13:25:07 -0700 (PDT)
From:   Luca Stefani <luca.stefani.ge1@gmail.com>
Cc:     Luca Stefani <luca.stefani.ge1@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: asus-wmi: Add param to turn fn-lock mode on by default
Date:   Tue, 23 Mar 2021 21:25:05 +0100
Message-Id: <20210323202505.141496-1-luca.stefani.ge1@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

* On recent ZenBooks the fn-lock is disabled
  by default on boot while running Windows.

* Add a module param ( fnlock_default ) that allows
  changing the default at probe time

Signed-off-by: Luca Stefani <luca.stefani.ge1@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9ca15f724343..f3ed72f01462 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -47,6 +47,9 @@ MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>, "
 MODULE_DESCRIPTION("Asus Generic WMI Driver");
 MODULE_LICENSE("GPL");
 
+static bool fnlock_default = false;
+module_param(fnlock_default, bool, 0444);
+
 #define to_asus_wmi_driver(pdrv)					\
 	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
 
@@ -2673,7 +2676,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
 
 	if (asus_wmi_has_fnlock_key(asus)) {
-		asus->fnlock_locked = true;
+		asus->fnlock_locked = fnlock_default;
 		asus_wmi_fnlock_update(asus);
 	}
 
-- 
2.31.0

