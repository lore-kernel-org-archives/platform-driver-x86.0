Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A183AEE14C5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 18:09:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243695AbjIFSJu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 14:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbjIFSJu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 14:09:50 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED89E6A
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 11:09:47 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c337aeefbdso963375ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694023786; x=1694628586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hfge2hDwlOnuvbsvyOLoD+YvP18zPU7WvIEwehrqKHk=;
        b=jjHu8J3sfOFkRySEo5gkKEVEPohljFlVPnjWPObI9TTtXPBLwNXz3r8b/fpfTew2tE
         A52hKl9B/UY8DfMD7SQJOhPtPeShgbbVymUUZBvREdtsGn/6/a/hyuzUddrMwI3/S+Y5
         E8piKAVmBJc6oOeNIAjRL0ZGL2juWgTifoZRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694023786; x=1694628586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hfge2hDwlOnuvbsvyOLoD+YvP18zPU7WvIEwehrqKHk=;
        b=lXq5Dko7/KzKsIgvtAVv3Y75tyutDwXFyCUYtZVubAqKButQx1qdsWaPmB72rR1gVT
         vugcdk9VCQkbycgF2u5u8aM24Yy9g8jzUYg4xMSMoaJD6W5wR/P4LLVTPC/Kix88lCd2
         E3Fy+03aBZMKYGPgiJC1SFMbsYM6yY6qlZNNbXFDHKl3LCzL9lpHL7NPalRlEXP2gY/N
         bZNHPHBnvxuFKUgIrJp2pvBkBGSeBFKd2Di5YAfZVKxYvcMqWk8hdJ4BAhW58c1eCIVO
         YXanMW1rhq7ISDAw9PhNGKsfiDqW7LrZt8G6sWhKcdEMZ38dGuJMCkEsYbkzf30p4oY2
         RBmw==
X-Gm-Message-State: AOJu0YxWgAFVlTVwcPMmbiguSDvLpGLD6PcG05+Bq1ZcZ//xjbYphe3B
        afff5/2IU5zn6rklSJCwni5H71E5eTMIJ3acfyM=
X-Google-Smtp-Source: AGHT+IGEWt7kOo14wpNAeLzr6FMlgqv4mRIgD302poha4etKupnWdwTn/RcwVsCuVVT1a9ygw1DuZg==
X-Received: by 2002:a17:903:495:b0:1bb:8e13:deba with SMTP id jj21-20020a170903049500b001bb8e13debamr15183394plb.11.1694023786555;
        Wed, 06 Sep 2023 11:09:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:a404:ed4a:5a1e:3b4a])
        by smtp.gmail.com with ESMTPSA id ix5-20020a170902f80500b001bc675068e2sm11363996plb.111.2023.09.06.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 11:09:46 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [PATCH v2 0/3] platform/x86: intel_scu_ipc: Timeout fixes
Date:   Wed,  6 Sep 2023 11:09:40 -0700
Message-ID: <20230906180944.2197111-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
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
don't know.

I added some sleeps to these paths to trigger the timeout behavior to
make sure the code works. Simply sleeping for a long time in busy_loop()
hits the timeout, which could happen if the system is scheduling lots of
other things at the time.

I couldn't really test the third patch because forcing a timeout or
returning immediately wasn't fast enough to trigger the second
transaction to run into the first one being processed.

Changes from v1 (https://lore.kernel.org/r/20230831011405.3246849-1-swboyd@chromium.org):
 * Don't use read_poll_timeout() helper in patch 1, just add code
 * Rewrite patch 2 to be simpler
 * Make intel_scu_ipc_busy() return -EBUSY when busy
 * Downgrade dev_err() to dev_dbg() in intel_scu_ipc_busy()

Stephen Boyd (3):
  platform/x86: intel_scu_ipc: Check status after timeout in busy_loop()
  platform/x86: intel_scu_ipc: Check status upon timeout in
    ipc_wait_for_interrupt()
  platform/x86: intel_scu_ipc: Fail IPC send if still busy

 drivers/platform/x86/intel_scu_ipc.c | 46 ++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 6 deletions(-)


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
https://chromeos.dev

