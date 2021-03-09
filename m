Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20D4C433E6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 18:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F87D65248
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 18:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhCISMo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Mar 2021 13:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbhCISMK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 13:12:10 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67855C06175F
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Mar 2021 10:12:10 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id w7so3121280wmb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Mar 2021 10:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zzBPtS1xdLZ/zOCVXNiYwDt4gKEIaEhuN64+KPrjbH8=;
        b=dRd+yptFvhY0fjHhzAmaNrZzZn25ELYdv7FJUCVlpt7EuGr82COj0XrKfSQlM7SQON
         QMDMGyi2L6yK3X23fvM8SZw7bzuBZzWQ0+uxBO1Qk1cqQ3uT/pZFXVANlQmnvMNP1faJ
         LeXPmcaa6ow7f4IJEBRn8SNku2f+lbPtN+l2W1JBwdPtHA1RpmiQG1tlYxoeyAeOI7lq
         hc7ToO2G3UgclpjqWjqnlFDnVI/e5dS0ekZ1T/WTefuQ+YNC7V1GoWHT+Us8ZuQUqb47
         jmAjBuwPNXWKjcfnkh/54Nj+ASEKZ3DDSPZedVfdPcfa8nwVPGv2qxYQuxVIZ/CrR49M
         jzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zzBPtS1xdLZ/zOCVXNiYwDt4gKEIaEhuN64+KPrjbH8=;
        b=IywhVc+yYloiWFOm34NVCaM9hD0/r7dxp+fardU/8w7jZ6K/laNAwE9/fb+g4R2TsC
         0vCyCR8grFB3cy2IytLhB1or5/Npx6SSWEQrknprgapiZh1xCSh4bxkZJyh3sneBz+E4
         KuPIphc7LkZ2hZIkfs49oX1zxz89dclctJmuZe5pXQGqHaaBBboOlLMKdJk1zNLO9nd5
         gZL8LyXfbA8CUSoyIg32pRf7Mcyj9k5Vq8c7UwbB1ORBQRdJ6zlDjAUD3NLb4oBHgHUP
         iipe3wdydPFk4y7kQzxkMBTRYzUFyoLRWzcbAG8DX7+irFNpepoLCsPr62gp7Gaic5dr
         QwLg==
X-Gm-Message-State: AOAM531gnJ9j/smQ8rXPE5ugkHhy4XFi4esEglQq08am5eU5Jyi0x4Oz
        9vses81Tj0vO30S518kkQni4sNIiOPi9mw==
X-Google-Smtp-Source: ABdhPJxL6sx99Qcv1Al5yQZTtdyL9YKsqMgoemCYmt6nyqO+AhBmIGs20BPkL5cbEajrgWKQEJwWpw==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr5375278wme.158.1615313528945;
        Tue, 09 Mar 2021 10:12:08 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id n66sm5078959wmn.25.2021.03.09.10.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 10:12:08 -0800 (PST)
Date:   Tue, 9 Mar 2021 18:12:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Platform/X86 due for the
 v5.13 merge window
Message-ID: <20210309181206.GT4931@dell>
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210224201005.1034005-1-david.e.box@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Enjoy!

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-platform-x86-v5.13

for you to fetch changes up to ccafe3126ad3f48ea1cd9ae460c69d1ba879fb65:

  mfd: intel_pmt: Add support for DG1 (2021-03-09 17:05:25 +0000)

----------------------------------------------------------------
Immutable branch between MFD and Platform/X86 due for the v5.13 merge window

----------------------------------------------------------------
David E. Box (2):
      mfd: intel_pmt: Fix nuisance messages and handling of disabled capabilities
      mfd: intel_pmt: Add support for DG1

 drivers/mfd/intel_pmt.c                    | 112 +++++++++++++++++++----------
 drivers/platform/x86/intel_pmt_class.c     |  46 ++++++++++++
 drivers/platform/x86/intel_pmt_class.h     |   1 +
 drivers/platform/x86/intel_pmt_telemetry.c |  20 ------
 4 files changed, 122 insertions(+), 57 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
