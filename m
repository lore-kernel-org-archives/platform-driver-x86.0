Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C793C83F14
	for <platform-driver-x86@archiver.kernel.org>; Thu, 31 Aug 2023 01:14:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239825AbjHaBOP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 21:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345476AbjHaBOP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 21:14:15 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A35CD7
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 18:14:07 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c1ff5b741cso2136435ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 18:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693444447; x=1694049247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sUp2yimFnL41Syp4fRWiGYEjv3jeQXhshgUbuWCXiU=;
        b=hPACS1F46EEGmI5xV/eAzlwhcd0oqu4f2lRwcNaQFh+coaZwfqmW8GgiS1PZh7mStQ
         0+VN4FJiTSzPNrXVoqu+HJ6oXwxRcAoaZpJnfRFnq7I38x5gSrkosj4zxj5Kc9PYcUTt
         QBe5jbbp9Lco/lBkZqGm3UdplyoxN36YCPp/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693444447; x=1694049247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sUp2yimFnL41Syp4fRWiGYEjv3jeQXhshgUbuWCXiU=;
        b=A6jHQ8UR20nbhs4ENTxq0d2BCnrw9/go1OVwdmza6KoKYMgJxZMQsdIoXdgWB4URYV
         BuI6YVdIQ6bBt6wK/6SmWIgIumacIxBwm2a72HyEeiQb8D6ftRxwPn/kVXgwTJu/UM84
         GGVRhjkEbn/lNWO/V9pxQeu2xxlJZlgcZlCT32DVSJVBruAMGalNsvuYmcotFZecKWNi
         VOUJbIL1PueDOMZgTvNbdmk6R74fhcC2sYiG/zqPIfnU7HTiEPe1i6kYiYUcUvi34QSI
         TOwora9poaGjlPQ+elhathvxJj/CxI3RU0QZ2aYXJO9Jl2mZ6etHqZ3lFCdbUZc5EBcr
         IvmA==
X-Gm-Message-State: AOJu0YxQfWuF/Rt/2cpLFVErs+PMgWNzGkY9ilWDM7peo+c4WMKbFurj
        Yg5fFHSX0nk+xWMnjBUGMVIoIA==
X-Google-Smtp-Source: AGHT+IEsaxAUmzOWP3YLPRyIonJDP5ynhSyj/X3KF7NV/5+fcbROj48eTEq1IrBDZ7PjIKflMZop6Q==
X-Received: by 2002:a17:902:ea94:b0:1bc:2188:ef88 with SMTP id x20-20020a170902ea9400b001bc2188ef88mr3832312plb.3.1693444447266;
        Wed, 30 Aug 2023 18:14:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:248f:d364:b451:2bc0])
        by smtp.gmail.com with ESMTPSA id im23-20020a170902bb1700b001bbb7af4963sm132604plb.68.2023.08.30.18.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 18:14:06 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH 0/3] platform/x86: intel_scu_ipc: Timeout fixes
Date:   Wed, 30 Aug 2023 18:14:00 -0700
Message-ID: <20230831011405.3246849-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I recently looked at some crash reports on ChromeOS devices that call
into this intel_scu_ipc driver. They were hitting timeouts, and it
certainly looks possible for those timeouts to be triggering because of
scheduling issues. Once things started going south, the timeouts kept
coming. Maybe that's because the other side got seriously confused? I
don't know. I'll poke at it some more by injecting timeouts on the
kernel side.

The first two patches are only lightly tested (normal functions keep
working), while the third one is purely speculation. I was going to make
the interrupt delay for a long time to see if I could hit the timeout.

Stephen Boyd (3):
  platform/x86: intel_scu_ipc: Check status after timeouts in
    busy_loop()
  platform/x86: intel_scu_ipc: Check status upon timeout in
    ipc_wait_for_interrupt()
  platform/x86: intel_scu_ipc: Fail IPC send if still busy

 drivers/platform/x86/intel_scu_ipc.c | 59 ++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 17 deletions(-)


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
https://chromeos.dev

