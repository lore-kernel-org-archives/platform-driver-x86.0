Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A05CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 17:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 030C060EE4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 17:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241475AbhIPREp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 13:04:45 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58904
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348291AbhIPRCZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 13:02:25 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1CA8E40192
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Sep 2021 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631811663;
        bh=kGvrlwC8dgj36kHCoqcN/7cctXrefdaA9zTh75o6nwc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=O5lWQNZ0vjXAAINv8zoMm998Bo76oUWH+eJ3tzSTB85IaBL5eWlEBVpB2rmA4Wsnt
         nGZBbS1rFBzaUqRMdAn13m4pzilKsB8PDNhx27B8QqiscQGQpxuCM71Eev9hBQRkev
         BePTEdFsfj4eBh3k3884kBw1Cc3o7JYhbXmTbsRHbAmZL3NXHzDIPu2uauHf4y99F7
         Hoj1jfW2X3voPTImLXCFMWhtheZp4Y6xRfN73KLSasc01st9XwduMW+Di73T2nQk5i
         hdoW8/4BZ1OYz5F6ZHhe987Ds/V79Xo4HEArI6xKBcVvThZMCV2Np5Pyu8ZxnojWd7
         edut1ymigigkg==
Received: by mail-wm1-f69.google.com with SMTP id g128-20020a1c2086000000b0030a1652fea8so297344wmg.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Sep 2021 10:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGvrlwC8dgj36kHCoqcN/7cctXrefdaA9zTh75o6nwc=;
        b=uMvrTY0vlFZ07zWRJ555W3smxQxzqgviR99xuNLl2IFgOQee4MMfJt4exFyUj4qwC9
         xHZqOdtxnYf4Jk5EILZk0BKSx/Poqg7vSmmyVwjljgiTGt+q+3i9OCEhz/M3Gae2Djvd
         ywqiFQ8+vgdKDI5BH9XtIaCMwHjWEBy0j6X6VzAqINIa91tzYxnS50JzmuFqT0jUXUXN
         bed6KCcZp8UIGX7b/fw0Z75z627tlt5MD3m/8nIzrtl34H/etzXgUWRYteVbmFUMeo5o
         xOQvculB0c5NlLXriXmX/HLrapZSsdPqpRJZfFptWp32SVeSg/iQdLsj31cZdpMVcLnn
         GlTA==
X-Gm-Message-State: AOAM532KGDRNwfkNcekIS3PV+0eSuO5dCR1jFUhoEZGRCqEet8+Rtwka
        ic22hKEz9xj/CRoTjQbPidbvjmpKZblSfnym09mXs53CH6+fitlSYZg0GijdDJq1JBBcGbwfOJE
        K45THkp16xKd7PGzkeoeedbyX2n4dF4FxN9YfIGedfixlNDo1XYE=
X-Received: by 2002:adf:f084:: with SMTP id n4mr7440211wro.362.1631811662738;
        Thu, 16 Sep 2021 10:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZv2NplR10Hi7PCHwaacjnOu8R/e6iK1WzNnokBmPAZv6ETWalQ+ItW3RvnaNG42gpPNXYng==
X-Received: by 2002:adf:f084:: with SMTP id n4mr7440176wro.362.1631811662501;
        Thu, 16 Sep 2021 10:01:02 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id q7sm4062646wrr.10.2021.09.16.10.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:01:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Matan Ziv-Av <matan@svgalib.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] platform: lg-laptop: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 19:00:53 +0200
Message-Id: <20210916170054.136790-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for ACPI driver.
Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/platform/x86/lg-laptop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 3e520d5bca07..4f3ece819f4c 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -60,7 +60,6 @@ MODULE_ALIAS("wmi:" WMI_EVENT_GUID2);
 MODULE_ALIAS("wmi:" WMI_EVENT_GUID3);
 MODULE_ALIAS("wmi:" WMI_METHOD_WMAB);
 MODULE_ALIAS("wmi:" WMI_METHOD_WMBB);
-MODULE_ALIAS("acpi*:LGEX0815:*");
 
 static struct platform_device *pf_device;
 static struct input_dev *wmi_input_dev;
-- 
2.30.2

