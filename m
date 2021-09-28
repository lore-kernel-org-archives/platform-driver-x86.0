Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0ECC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 10:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 288836113E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 10:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240116AbhI1KWN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 06:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240211AbhI1KWL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 06:22:11 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E810C061740
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:20:29 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id k17so18518810pff.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EuSs/ib19QbHGtXBHlGySgf9ofW10LCByQaBGGoV3kU=;
        b=ZBIHdNR6WRdahMMs7iY2gY8u3399vXljRvMfnIohv+VndCaVUksCHDgGG1KUioWHmp
         SqrIXNOkLUTDPrFgDa7I1fGHQwWNFEmVHzVxosLlOzr9lbv9FxggG3bhr18jfL7yegYU
         M3WdHjdbh1OmjU2tQh8VUAoUJkOj1q+VLLAp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EuSs/ib19QbHGtXBHlGySgf9ofW10LCByQaBGGoV3kU=;
        b=Gyh6z8WeemtSLW0ebLWTmvQW6Z5rrkv0SZQ7E1GwbyId3pspmqeuzp3hscOyy9KDhD
         F5RMZhdqDWZ4gE0nuz9CmM8FhTvy9P0VHWTrJlgX1Y00WIEx2dzn5HeBJ6ogYPMzTY7u
         954HDIqcL2g8CUqfTh1U7krn0B78g6JmaSWdyrO8nKUzx55BlpCFRpWzlcRxLWRjNuLS
         EU5Itkf+mS3Fm/dV27bOxSOnhZw+jfaRE6E57NoJ0XMXrNGtHg4YfrBN4vNDFzV9RISO
         C3se/lbWEB7VmkRnYGpllcX5d/XlH1Vl3mXOHESaXzIiXmZrD8HoZNvqADnbrsJlVmC0
         Ry6Q==
X-Gm-Message-State: AOAM533/DfZQIkgDeTcUE7SNUylh/NP5jzO5A+ER0FWWYbmyeYrzoMIK
        /BEZxCpaBqq/5dJDswN3y3qI0w==
X-Google-Smtp-Source: ABdhPJwnlIf7Dv/oRueMSkuPEkejdDhbUSuTPNKiglgGErWUK5pSX5ncHwaUCsu7cHNlZebHjeYObw==
X-Received: by 2002:a62:31c5:0:b0:447:b30c:9a79 with SMTP id x188-20020a6231c5000000b00447b30c9a79mr4478831pfx.67.1632824428889;
        Tue, 28 Sep 2021 03:20:28 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:f6d8:1ad1:cc75:70fb])
        by smtp.gmail.com with ESMTPSA id z9sm19734576pfr.124.2021.09.28.03.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:20:28 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 3/3] platform/x86: intel_scu_ipc: Update timeout value in comment
Date:   Tue, 28 Sep 2021 03:19:34 -0700
Message-Id: <20210928101932.2543937-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210928101932.2543937-1-pmalani@chromium.org>
References: <20210928101932.2543937-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The comment decribing the IPC timeout hadn't been updated when the
actual timeout was changed from 3 to 5 seconds in
commit a7d53dbbc70a ("platform/x86: intel_scu_ipc: Increase virtual
timeout from 3 to 5 seconds") .

Since the value is anyway updated to 10s now, take this opportunity to
update the value in the comment too.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index d71a1dce781c..7cc9089d1e14 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -247,7 +247,7 @@ static inline int busy_loop(struct intel_scu_ipc_dev *scu)
 	return -ETIMEDOUT;
 }
 
-/* Wait till ipc ioc interrupt is received or timeout in 3 HZ */
+/* Wait till ipc ioc interrupt is received or timeout in 10 HZ */
 static inline int ipc_wait_for_interrupt(struct intel_scu_ipc_dev *scu)
 {
 	int status;
-- 
2.33.0.685.g46640cef36-goog

