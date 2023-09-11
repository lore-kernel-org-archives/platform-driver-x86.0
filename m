Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92E8CA0ECE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355886AbjIKWCQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244216AbjIKTjq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 15:39:46 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053AD18D
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:41 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-273ca7ab3f5so3221969a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694461180; x=1695065980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3kmuOgV1MqL70eyPKBwPx+gEeRsYvUgeQvC+nXxSq0=;
        b=ajWJG9I8jbM77iPAy1T/ElAcjr6Ie3c6CY5X34nR6HzWNaL6hvVFx5wynsy+uFYJDe
         J9NXbTddDvYWnxK9w7wM+4dfSKrmJa3YNxChontaAGSxn+B+t+BLDkZnrxRaioh1wbde
         bOsrN35eQ274Fn6eXpq+sXR/v3/maILwApqIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461180; x=1695065980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3kmuOgV1MqL70eyPKBwPx+gEeRsYvUgeQvC+nXxSq0=;
        b=AJ5P4uFtRDeH6DJc6qdrBdt9BHbKlV0OPNc2/uBvyC6nbb0eA9zamb86UY980+zQN9
         mi4Ggjfv+/WUrrnoptE2b1NrnCvXa0JPsoCc/QZXtDsFioCJ2kKxSk4xciW8EU/UsuNp
         luq6FD7sPUSTtE7nGLeMz8X16X4TlXALKncOI7tS5OjngQaflzyZy2FDOiZcxA9CtZrP
         GAi+doWl+1Zb5UVAh9DtQ8sSbdFap1Tw/klsmmgPaErZ2V9F8cB6GqSF1rvwRnkwQoFQ
         30+VLZvca4o32q7aRy6kNCniOA2cEAAXYdx5ec1uxx5JAWdp5scQS8KB0qfvyx04WK+1
         KSow==
X-Gm-Message-State: AOJu0YzOUBr+oisNMjViqW6CON0b7H32fffOvmqybhJpEoHYXQgPdDZa
        k3SKbSMKdHj9Yw4eoE5QXSugAw==
X-Google-Smtp-Source: AGHT+IE1KCz2PPBtztjQa6r5F5mW8DpeJaFNItpLjTVRsOtt8Oshgk1XrqynXDOck4L9xWpjZ39/nw==
X-Received: by 2002:a17:90a:7003:b0:273:fa72:ba83 with SMTP id f3-20020a17090a700300b00273fa72ba83mr4056419pjk.47.1694461180415;
        Mon, 11 Sep 2023 12:39:40 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d487:5e33:6656:3711])
        by smtp.gmail.com with ESMTPSA id fu8-20020a17090ad18800b00262e485156esm7736543pjb.57.2023.09.11.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:39:39 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Subject: [PATCH v3 0/4] platform/x86: intel_scu_ipc: Timeout fixes
Date:   Mon, 11 Sep 2023 12:39:32 -0700
Message-ID: <20230911193937.302552-1-swboyd@chromium.org>
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

Changes from v2 (https://lore.kernel.org/r/20230906180944.2197111-1-swboyd@chromium.org):
 * Use read_poll_timeout() helper in patch #1 (again)
 * New patch #3 to fix bug pointed out by Andy
 * Consolidate more code into busy check in patch #4

Changes from v1 (https://lore.kernel.org/r/20230831011405.3246849-1-swboyd@chromium.org):
 * Don't use read_poll_timeout() helper in patch 1, just add code
 * Rewrite patch 2 to be simpler
 * Make intel_scu_ipc_busy() return -EBUSY when busy
 * Downgrade dev_err() to dev_dbg() in intel_scu_ipc_busy()

Stephen Boyd (4):
  platform/x86: intel_scu_ipc: Check status after timeout in busy_loop()
  platform/x86: intel_scu_ipc: Check status upon timeout in
    ipc_wait_for_interrupt()
  platform/x86: intel_scu_ipc: Don't override scu in
    intel_scu_ipc_dev_simple_command()
  platform/x86: intel_scu_ipc: Fail IPC send if still busy

 drivers/platform/x86/intel_scu_ipc.c | 66 +++++++++++++++++-----------
 1 file changed, 40 insertions(+), 26 deletions(-)

Cc: Prashant Malani <pmalani@chromium.org>

base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
https://chromeos.dev

