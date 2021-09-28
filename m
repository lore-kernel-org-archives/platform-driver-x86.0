Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C5FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 10:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1221B61153
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 10:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240191AbhI1KV2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 06:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240193AbhI1KVX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 06:21:23 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344A2C061740
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:19:43 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id r2so20670778pgl.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACQMAQ2ulH/5Q17RB32jjiGPW2/pxtJ2WgZ5l3NEtj0=;
        b=iHBMZUmK4E2NGOJAley17BgD2/LKGG1tTs5Lz+RIW9dLEcNAt+IgMpfsO8ioVZSdX3
         kLQEXzFY5v6Oy8dhDxxgVatIXc+S2+9PJV9ZfkyczdZcjDI/V3a/fZfsoMk6wX3fUcYB
         wo9C/Z3NOfaTY0T9CHNadMp3pKDxPRxQch9sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACQMAQ2ulH/5Q17RB32jjiGPW2/pxtJ2WgZ5l3NEtj0=;
        b=kCpmGLpVWUiqmqUPquCZyGqGaRigHo/5RZqP71ae4NVbFqkIdkbmmHdrDTOg4ZABSM
         iD8AgC8eoyEpUxMoKKQDldZ8aG9ugKj2dQEF/7ZF7DS78yWt2s2/OBjDtwmF3Vvacz27
         BSm/Xqyx1fDKUx9lcS46cahMmBIgTjx6V4P7Es1YzEGwnh++NaVExlEgr1jlT652tI90
         WOG6drLBqGpxxCbIzYgTv4pt0vBaXJxKu3oIgJUlS1ZS2Bd3ZROBA62g2lprW6sxmNlU
         v1KbcB1jkgmPD9fUSI2aLnAsD5rM32AIPyJ/ShRC9jUihOVeAGIAGws+eQwohtvf9cbg
         ducA==
X-Gm-Message-State: AOAM5315Bq9qcNPVPKgkYmZXEDmadC7AAOB6FjtO9dwfyzxBPM7/C25e
        Ke6SySB9MOY+EVlAdcC2hLu28A==
X-Google-Smtp-Source: ABdhPJzmNL6vayKpA3EjzqxYCckmp1kx1YWIxyFG6UfBbHEEu0x0y0XdKU2nLhKarjqO/3pSYjwLlw==
X-Received: by 2002:a62:2f81:0:b0:44b:b390:956b with SMTP id v123-20020a622f81000000b0044bb390956bmr1194571pfv.30.1632824382687;
        Tue, 28 Sep 2021 03:19:42 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:f6d8:1ad1:cc75:70fb])
        by smtp.gmail.com with ESMTPSA id z9sm19734576pfr.124.2021.09.28.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:19:42 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 0/3] platform/x86: intel_scu_ipc: timeout fixes and cleanup
Date:   Tue, 28 Sep 2021 03:19:28 -0700
Message-Id: <20210928101932.2543937-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a short series to make some fixes and timeout value
modifications to the SCU IPC driver timeout handling.

Prashant Malani (3):
  platform/x86: intel_scu_ipc: Fix busy loop expiry time
  platform/x86: intel_scu_ipc: Increase virtual timeout to 10s
  platform/x86: intel_scu_ipc: Update timeout value in comment

 drivers/platform/x86/intel_scu_ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.33.0.685.g46640cef36-goog

