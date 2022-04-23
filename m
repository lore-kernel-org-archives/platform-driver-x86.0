Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D524EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Apr 2022 12:31:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiDWMd7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 23 Apr 2022 08:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbiDWMd6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Apr 2022 08:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50498169E6A
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Apr 2022 05:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650717060;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BeOJYjv9Uq2XAYhQoQ5l1QOio0YQGcQSqiAKchKFN5I=;
        b=E9/ioy77zwY21eX+UcpvtdiQp7kIrGOwyLaIlUDUqof3GRr+g1vSHYf9fBDJPYeFm13/Lh
        5DmhvvO23lmQ5ScMglaT++D0RUrZ/7edi2+FCFwXFVbtucpeGMbdCJ79kW9UAFY2PZCmL4
        x6mVT9yNHg9nqeT7uKIGtJEuTVcSZJ8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-IPn56wFbNpSjsHEciaS0WA-1; Sat, 23 Apr 2022 08:30:59 -0400
X-MC-Unique: IPn56wFbNpSjsHEciaS0WA-1
Received: by mail-qv1-f71.google.com with SMTP id kk23-20020a056214509700b004542af238feso2861982qvb.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Apr 2022 05:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BeOJYjv9Uq2XAYhQoQ5l1QOio0YQGcQSqiAKchKFN5I=;
        b=H5D3V8zN+z1fQZBDzptdgG3HiXmOp/8NUquxxc8JjaRbeNEuPUjtWcDD/hK/pxoeBF
         LvZ80wjN1vQePPDW4/g1BNtW9Kn9UJNt4gnsF6euhTEqZ2cCj+K/1MORMNJoEJebZvhs
         5sxgltV60Cnfj5EQ41aeuS6sELN3ey4KrJ5YX8IJCunq68ZYO8glJmc7wLZfD/w2hO94
         y+re6N+n0nrUR0Ga+UG7yES7b55H7FQIL1b8bPx213dJaBdqKTkHpJD9ndS4O0q7qUhF
         VJL40RgTnVsQuV+qdZLI+nkPB/v2oQ3+8w7VtdIIK+RhP9cZ1fzq7m6gKuEhI5zTrz7l
         3QXg==
X-Gm-Message-State: AOAM532WGt154f0eDww5fbbT0jszuLqpomf1Psb97o1jCLVlu6AXhfz0
        p/SFflb3+CL2mIvRvyIWyt5AaQaX2QyW9ceGmiHdR7ZxC9dtziYtpQYs111jL6TJ7ygwYUgWZwl
        8BvUtC1VzQ0GCQEwu4KdfeGNsnFOflSSrMA==
X-Received: by 2002:ad4:5be1:0:b0:440:a2ec:ea99 with SMTP id k1-20020ad45be1000000b00440a2ecea99mr6617960qvc.20.1650717058479;
        Sat, 23 Apr 2022 05:30:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhVcaF6hVaQMxy2Bx+WEj0Dv5VCNN+pTO04EbmEvOcA4BOxWj6bxa7W6hRQnXKI8Wa64U7Yg==
X-Received: by 2002:ad4:5be1:0:b0:440:a2ec:ea99 with SMTP id k1-20020ad45be1000000b00440a2ecea99mr6617945qvc.20.1650717058312;
        Sat, 23 Apr 2022 05:30:58 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y15-20020a05620a09cf00b0069c80404de6sm2105323qky.31.2022.04.23.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 05:30:57 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     irenic.rajneesh@gmail.com, david.e.box@intel.com,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86/intel: pmc/core: change pmc_lpm_modes to static
Date:   Sat, 23 Apr 2022 08:30:48 -0400
Message-Id: <20220423123048.591405-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Sparse reports this issue
core.c: note: in included file:
core.h:239:12: warning: symbol 'pmc_lpm_modes' was not declared. Should it be static?

Global variables should not be defined in headers.  This only works
because core.h is only included by core.c. Single file use
variables should be static, so change its storage-class specifier
to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/intel/pmc/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index a46d3b53bf61..7a059e02c265 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -236,7 +236,7 @@ enum ppfear_regs {
 #define ADL_LPM_STATUS_LATCH_EN_OFFSET		0x1704
 #define ADL_LPM_LIVE_STATUS_OFFSET		0x1764
 
-const char *pmc_lpm_modes[] = {
+static const char *pmc_lpm_modes[] = {
 	"S0i2.0",
 	"S0i2.1",
 	"S0i2.2",
-- 
2.27.0

