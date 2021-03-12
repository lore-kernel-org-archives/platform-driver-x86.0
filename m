Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFF4C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Mar 2021 13:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0E1164FA9
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Mar 2021 13:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhCLN5w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Mar 2021 08:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhCLN5v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Mar 2021 08:57:51 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A543CC061574
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Mar 2021 05:57:51 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 75so3565959otn.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Mar 2021 05:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AHfuJMq3vwyoBDCpgJM3KmGD2Pa3M60SW2r9HL22pz8=;
        b=Rjf8XQ0Dw01CTibeSyc80hYATpX7r/YNusQ346y14D4fdgTJC8oFBVn9kCP034LhJo
         f36wpX4iy0hMWhL57+nqiQHcQxLUk+QOEodFQYGUHEL6+iMGbkBoULTT3mKsP+RdIiRc
         QiL9dT41GQDoiH2C+qtvWAZwJa0k6KHd7cHSbm88XuhNcOJK7OGQ1nOq1VdGNYure3B6
         Wd/jiAiCQgitZ7ZoCWGOzKVWSsaUy1ZXUt2Fpo6kS+E5aOiRSehst66RTZ4qTsRu42Vr
         XxmTLXldUnvLErfmdIRBgE+Xieppn4ETd2LkR8/D1TQ+6X9bZ0vVvm5W02mDkYQ/S6VM
         hO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AHfuJMq3vwyoBDCpgJM3KmGD2Pa3M60SW2r9HL22pz8=;
        b=ph887cSqkAto7Jq62XG34u6Rz0QGYJPiz1bH0vbMm+OjmWYh/4Yb3aWl7v2dbj6Ha8
         fdcLPr+Pq1jVvYDKSIg+wtvhc4y5OK2QygYoRwk234m61v+wj+zkiEPVqTIxcuJBi6Iv
         evH+G0OYEUMjwyER6/ib3i8XWGA7ysy9E3l74i7HrADG7dCfYLFOL9hUJRs17+vEwqhV
         nAL9RypZ9cUAPD5Cj9v/f1ja37QbgABwVaGUS04HDcqY+yrMCNmhV1HADJRXI6MLidG9
         +wONJlvNWX+LDdzcr17qWKBUPDjK0RX87/2iyw2wO8HZg6YiX9AmpLSAir/gqmHrc27y
         Ci6g==
X-Gm-Message-State: AOAM533Fw+31QP7MuwccnsFO9VlqowlkjA6qNxmKy6Kg7VlcFKSomvD2
        9vN8df6zOy1RWJ85ZxFqoUsIPjlwEWlphRJi
X-Google-Smtp-Source: ABdhPJxzya4dmltdm8KZIA1P9WELxRn5aNvoLOU3kE652omBKYVRZ+tQwb7uwYc4D6SBSSF8XWLRog==
X-Received: by 2002:a9d:3a4b:: with SMTP id j69mr3414145otc.47.1615557471058;
        Fri, 12 Mar 2021 05:57:51 -0800 (PST)
Received: from winterfell.papolivre.org (winterfell.papolivre.org. [198.58.116.17])
        by smtp.gmail.com with ESMTPSA id z14sm1341908otk.30.2021.03.12.05.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 05:57:50 -0800 (PST)
Received: from localhost (unknown [IPv6:2001:1284:f016:8458:4b63:e980:6768:80b4])
        by winterfell.papolivre.org (Postfix) with ESMTPSA id 53F811C2F43;
        Fri, 12 Mar 2021 10:57:49 -0300 (-03)
From:   Antonio Terceiro <antonio.terceiro@linaro.org>
To:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: drop __DATE__ and __TIME__ macros
Date:   Fri, 12 Mar 2021 10:57:46 -0300
Message-Id: <20210312135746.1695294-1-antonio.terceiro@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These macros introduce nondeterminism in builds, and break reproducible
builds.

Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 582feb88eca3..c50c754a656e 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -2791,7 +2791,6 @@ static void usage(void)
 static void print_version(void)
 {
 	fprintf(outf, "Version %s\n", version_str);
-	fprintf(outf, "Build date %s time %s\n", __DATE__, __TIME__);
 	exit(0);
 }
 
-- 
2.30.1

