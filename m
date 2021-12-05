Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD4AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 22:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbhLEWGK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 17:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239561AbhLEWGK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 17:06:10 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CCFC061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 14:02:42 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id l25so35067945eda.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Dec 2021 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=zW57z/mHfDhkYIG5+O+nmTT3HcS8kaxpmLSDbRZdY6E=;
        b=JSqe6iamjxa5N5Ktr5FkCXLznL4hB3Ci4Bzekjb+FEIRm8KTuroaIdEmQaCXEIhz+I
         uukBgQsv/ItQV+fMQkn5xKnCjtLmNkXOngcXWvatveU67fizd7MsTZKgunaiHqGCdx2q
         bhqKf+SQLDEEAVEKntyi/3BQZw640Krbe25PqR9V88tuUSO5zECpWRkqKKKSaQzk4KKE
         gyqEawSMj7d6LJBm6zDOLsXMv2XtvKIkBr/OHGZE1OJJBwjnxLkpDqjHWZxQuvh5GyAr
         rlKpXeXXWWoWSXRQz7BuWffC53PtGIgNgzypSa0mH9v0pRJ2vd2mxKvTgctkm+IfVk2U
         KgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=zW57z/mHfDhkYIG5+O+nmTT3HcS8kaxpmLSDbRZdY6E=;
        b=2KCaCYz+YypssVaPEF+5kGDcC/khP+EabDKhxH1F1bWbjlw0SVDaHsVH7Rhg6Cywm/
         /FaRaGnysgKzmu/7TGCL1ciS9RnpdXfEU8kTXScmGcKnQXind2v6Ith16Kl6FXd0BeAG
         uDPPwM1iQZoQ0DM/d5cS+Iwv3JKvM6I1A8aryoiWgFTqTKw0P09EulJHNOpDUaa9bakL
         p3B5RkXhD6qwB7rOvwkLsqluAKfiW3k0GiF1gf+3LpC5V3CF2tKoi1pMn5aaV39PhgfB
         VvtWAwsOnPhlyeGJ4OCxLSuSkbNTVeZzoOGIrLoaVVz676Zs9ecghcd6WfQJYYNEjSmc
         6B4w==
X-Gm-Message-State: AOAM531eU3pj+/4yEUBaAR1gIKdteoQ1Uzel6M6io2dEzwR5A+vFqvyL
        4bUdYyWeGGHdwR6pzY8WGCw+B4avJBo=
X-Google-Smtp-Source: ABdhPJx63M99EI1O7Cc9WOJJDRSnmT/iPLhpz+o1xOW6OEO6rnkJqb1JcwdV0/3oFdYkwhw8XQ5PhQ==
X-Received: by 2002:a17:907:e8b:: with SMTP id ho11mr42503654ejc.430.1638741761167;
        Sun, 05 Dec 2021 14:02:41 -0800 (PST)
Received: from ?IPV6:2001:981:6fec:1:3b80:361e:51b3:b61d? ([2001:981:6fec:1:3b80:361e:51b3:b61d])
        by smtp.gmail.com with ESMTPSA id r11sm6806537edd.70.2021.12.05.14.02.40
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 14:02:40 -0800 (PST)
Message-ID: <51b6676b-0000-ba23-0003-1b7e53158ef4@gmail.com>
Date:   Sun, 5 Dec 2021 23:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To:     platform-driver-x86@vger.kernel.org
From:   Ferry Toth <fntoth@gmail.com>
Subject: resource sanity check, mapping multiple BARs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Between v5.15 and v5.16-rc the following (unrelated?) errors are 
appearing in kernel.log:

resource sanity check: requesting [mem 0xff200000-0xff3fffff], which 
spans more than 0000:00:0e.0 [mem 0xff298000-0xff29bfff]
caller devm_ioremap+0x45/0x80 mapping multiple BARs
pmd_set_huge: Cannot satisfy [mem 0x05e00000-0x06000000] with a 
huge-page mapping due to MTRR override.

This is on Intel Edison (Merrifield), which has (from lspci):

00:0e.0 System peripheral: Intel Corporation Device 119b (rev 01)
     Flags: fast devsel, IRQ 25
     Memory at ff298000 (32-bit, non-prefetchable) [size=16K]
     Memory at ff2a2000 (32-bit, non-prefetchable) [size=4K]
     Capabilities: [b0] Power Management version 3
     Capabilities: [b8] Vendor Specific Information: Len=08 <?>
     Capabilities: [c0] PCI-X non-bridge device
     Capabilities: [100] Vendor Specific Information: ID=0000 Rev=0 
Len=024 <?>

Any suggestions on the cause of this would be welcome.

Ferry

