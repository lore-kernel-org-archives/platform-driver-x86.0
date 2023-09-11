Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30307CA0EC9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355941AbjIKWC1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244218AbjIKTjr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 15:39:47 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1CE1B6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:42 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53fa455cd94so3427719a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694461182; x=1695065982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdCNmE4TQzaUVGYBpjExxVlAWo5NcVTWN45t1mLK2Kw=;
        b=ogpttftmeuGXskkeyI7t4md+uLYnvUs0J/Pn3eJnYCUi/XytZcLFKUOVj3ijBzWBnO
         lJlDS1XHOVyvuJSBwO2U8D49Cx1zJ3IJSWBDxs2I/hGrWFvW1G+Q7AhJEaqoDt5mG7Fs
         QoHCsnruJJxVE7zckenLWst++1VoWlgJV8HGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461182; x=1695065982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdCNmE4TQzaUVGYBpjExxVlAWo5NcVTWN45t1mLK2Kw=;
        b=wB47RHeNTCPRY3zZq9FgXzCdlSzGdOb3jo0DDV/YsJ4mxpcvEUxpB47bRWen0bwzgy
         tf9Zc9stApMBU3hD8qQgjaIK+bVi2wk6nSl5YRqWgOS8dvweBFkl5URb6J/GtR8fuCK3
         XTwFzYqYcpcqL8mqUDxz3P92PCIHNPjh9FnPFbbf3rYedX54rkZ1n6CzzqBLVbs7i5vw
         zhNXLyFCvXHxUKVA9L37i7wgxKU56jYMc0K3P9xNjwmZmVk/ZKgxVDNTfY6wULDvzCSg
         9MoaNM+djqhsUrx1UI4wFzxeRWAIBBgqntXn32XT6/yxGmJgZ/sscYmFEQxIx8e8FBpm
         fW7Q==
X-Gm-Message-State: AOJu0YyX5nRHxBnaFrFmSJBVg4DLsB0q26wcAxUrOhz9+1t8zmI4XY4x
        oGpUVnuHls0PsjdZ7S/UIxTmHw==
X-Google-Smtp-Source: AGHT+IGGvlqWnCd6FgKie+c4RBzySbl2Wtfy49TuNcsKhZkbb20DCZlYeRe7ju+YlMJNU0euA/ADjA==
X-Received: by 2002:a17:90a:c246:b0:263:ebab:a152 with SMTP id d6-20020a17090ac24600b00263ebaba152mr8240717pjx.19.1694461181946;
        Mon, 11 Sep 2023 12:39:41 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d487:5e33:6656:3711])
        by smtp.gmail.com with ESMTPSA id fu8-20020a17090ad18800b00262e485156esm7736543pjb.57.2023.09.11.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:39:41 -0700 (PDT)
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
Subject: [PATCH v3 1/4] platform/x86: intel_scu_ipc: Check status after timeout in busy_loop()
Date:   Mon, 11 Sep 2023 12:39:33 -0700
Message-ID: <20230911193937.302552-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230911193937.302552-1-swboyd@chromium.org>
References: <20230911193937.302552-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It's possible for the polling loop in busy_loop() to get scheduled away
for a long time.

  status = ipc_read_status(scu); // status = IPC_STATUS_BUSY
  <long time scheduled away>
  if (!(status & IPC_STATUS_BUSY))

If this happens, then the status bit could change while the task is
scheduled away and this function would never read the status again after
timing out. Instead, the function will return -ETIMEDOUT when it's
possible that scheduling didn't work out and the status bit was cleared.
Bit polling code should always check the bit being polled one more time
after the timeout in case this happens.

Fix this by reading the status once more after the while loop breaks.
The read_poll_timeout() macro implements all of this, and it is
shorter, so use that macro here to consolidate code and fix this.

There were some concerns with using read_poll_timeout() because it uses
timekeeping, and timekeeping isn't running early on or during the late
stages of system suspend or early stages of system resume, but an audit
of the code concluded that this code isn't called during those times so
it is safe to use the macro.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Fixes: e7b7ab3847c9 ("platform/x86: intel_scu_ipc: Sleeping is fine when polling")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 6851d10d6582..5a37becc65aa 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
@@ -231,19 +232,15 @@ static inline u32 ipc_data_readl(struct intel_scu_ipc_dev *scu, u32 offset)
 /* Wait till scu status is busy */
 static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 {
-	unsigned long end = jiffies + IPC_TIMEOUT;
+	u8 status;
+	int err;
 
-	do {
-		u32 status;
+	err = read_poll_timeout(ipc_read_status, status, !(status & IPC_STATUS_BUSY),
+				100, jiffies_to_usecs(IPC_TIMEOUT), false, scu);
+	if (err)
+		return err;
 
-		status = ipc_read_status(scu);
-		if (!(status & IPC_STATUS_BUSY))
-			return (status & IPC_STATUS_ERR) ? -EIO : 0;
-
-		usleep_range(50, 100);
-	} while (time_before(jiffies, end));
-
-	return -ETIMEDOUT;
+	return (status & IPC_STATUS_ERR) ? -EIO : 0;
 }
 
 /* Wait till ipc ioc interrupt is received or timeout in 10 HZ */
-- 
https://chromeos.dev

