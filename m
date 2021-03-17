Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468B3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 14:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED52A64F6C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 14:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhCQOGI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhCQOFl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 10:05:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31513C06174A
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 07:05:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k9so3111515lfo.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=r6yZM+f65zIgodvjTS777JEJuFTI/LvA7ZOpg/FRjOA=;
        b=BhP+Gkb/neU+dUNufG+jsXqZdN2afOg5luAGSX7etUiRXZSquEDRW1y0HZtYTCB+Oh
         +uXyyQ2EktpBeS+tVCoEiFggt9p6gMLJVW8DSAXvcjj45YVZrtX3kNf3i4bkelsQn8iN
         GUTocT8qclGW6VVydKRW9zOIDozFor7oDmz8y882eOuIY2o4/4pNB52E2CD75eNHQo4b
         X5hMhc6yHeVUuFljsuJ0Y4umuuM5h+FdsDXY0vSJuSAFuICRlxmsZy5cU3POKHaEQlMQ
         264AlUd8ksDaMvcAQJPcwnnmJN0oioEqmTzTd4t82c6wyIqYkp2f64vLwLvOVKpPWh/g
         F79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=r6yZM+f65zIgodvjTS777JEJuFTI/LvA7ZOpg/FRjOA=;
        b=RE8subJiW9LCbIq4Vp9fA6kXiGf6Dt/r1Vyvt4PfeXRk6H4JW4lRbMglM2K1W/tgPB
         Rr5zBoS7S+QOsRR/yUmclr/fTcw3KQUmMLEPEe9W0W+wBOXDfiVxo0jInKFw9dw8G+lw
         1brHfTG0czTqdk5ABecs9f8i3OvjWVvaOYDuJ81NZyxRXJK88LgNLSYHlileD9Cs2UEM
         bkPx/FwbKL/WTxGTjnkyzk8DLcylq2KYNRu4bLwAnMiVDTXKzBKnYxF5Cua7Flpl4rAQ
         J4nwR80ZxS/ne4npiNLU18Uo3h1Y04ANThlJ1xUC6+QrrIBL6piuq19Jfb0DZvyP6hAS
         bJ0A==
X-Gm-Message-State: AOAM531ojBWo86rNh007LcS9X+bGYZ/4GvEBrH0yiWkd9WwZ7Q4HjGgg
        ZVfIvlz4bo9znMWyoEDeVYHW8NyCyag=
X-Google-Smtp-Source: ABdhPJx/OGtxohXr1i+8TlCT6DwJfVbVHRd4KtrPqDO7AkRprSJ7fSTg3l/BWTbeF7wbVqR+NLjx1w==
X-Received: by 2002:a05:6512:108c:: with SMTP id j12mr2599867lfg.431.1615989938613;
        Wed, 17 Mar 2021 07:05:38 -0700 (PDT)
Received: from [130.238.51.50] (emp-51-50.eduroam.uu.se. [130.238.51.50])
        by smtp.gmail.com with ESMTPSA id a1sm3397803lfk.148.2021.03.17.07.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 07:05:38 -0700 (PDT)
To:     platform-driver-x86@vger.kernel.org
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com, linrunner@gmx.net
From:   Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
Subject: [PATCH 3/3] thinkpad_acpi: document force_discharge and,
 inhibit_charge
Message-ID: <05bb641c-0390-bbd6-56bf-4871e65e4f20@gmail.com>
Date:   Wed, 17 Mar 2021 15:05:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Describe the additional sysfs attributes for
forced discharging and charge inhibiting.

Improve description of charge_control_{start,end}_threshold.

Signed-off-by: Ognjen Galic <smclt30p@gmail.com>
Signed-off-by: Thomas Koch <linrunner@gmx.net>
Signed-off-by: Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 5e477869df18..e71bc74d69dc 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1493,15 +1493,35 @@ sysfs attributes:
 
 These two attributes are created for those batteries that are supported by the
 driver. They enable the user to control the battery charge thresholds of the
-given battery. Both values may be read and set. `charge_control_start_threshold`
-accepts an integer between 0 and 99 (inclusive); this value represents a battery
-percentage level, below which charging will begin. `charge_control_end_threshold`
-accepts an integer between 1 and 100 (inclusive); this value represents a battery
-percentage level, above which charging will stop.
+given battery. Both values may be read and set.
+
+`charge_control_start_threshold` accepts an integer between 0 and 99 (inclusive).
+This value represents the battery percentage level below which charging will begin.
+
+`charge_control_end_threshold` accepts an integer between 1 and 100 (inclusive).
+This value represents the battery percentage level where charging will stop.
 
 The exact semantics of the attributes may be found in
 Documentation/ABI/testing/sysfs-class-power.
 
+Battery forced discharging
+--------------------------
+
+sysfs attribute:
+/sys/class/power_supply/BATx/force_discharge
+
+Setting this attribute to 1 forces the battery to discharge while AC is attached.
+Setting it to 0 terminates forced discharging.
+
+Battery charge inhibiting
+--------------------------
+
+sysfs attribute:
+/sys/class/power_supply/BATx/inhibit_discharge
+
+Setting this attribute to 1 stops charging of the battery as a manual override
+over the threshold attributes. Setting it to 0 terminates the override.
+
 Multiple Commands, Module Parameters
 ------------------------------------
 
-- 
2.25.1
