Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C0AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9193D6120E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbhIJVfr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Sep 2021 17:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhIJVfh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Sep 2021 17:35:37 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04D4C061762
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Sep 2021 14:34:20 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id s15so2786795qta.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Sep 2021 14:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=D+i2AnwxDkTLpcWnVONgSwNuAMh+694TDo7hwMxSXcw=;
        b=Wifgrll/PAir/lmfOitnGq4WqkX1FjzwWJz5yE220OkszS7zCqKt5Y74FMSTORh2q8
         PjvJHDWgt6mDfqVoYMNeZsAZP6OmZFG0MbseCFPWVU+q24KFZcpyWHkWJMt+mmrFfXr+
         C+TU6leZk0m/pM5t1CvYd5lE6/axpwTWVTjuHJ+x4FeELp0sKvx+UwoIwV/WfbVQ9/Od
         tCZRfTYUHxVfEs/MU/D+WhdCXg4j7HRdfvmmXrHGsDIr+qe+VVwOZPFcgAlsNo49uTC9
         AyVBOYeHFNmCJv2ftFu+Lh9RqeAca08HmelUso55yopE5zlFNHjox1sr4unIavT2nTfG
         o4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=D+i2AnwxDkTLpcWnVONgSwNuAMh+694TDo7hwMxSXcw=;
        b=ys7/b+VRDhMnZNHpnOhe0n4qX6IdOq0GyI9BGddKVS48JwngmW0pj8Q4s+7B8HTPvS
         5L2Pm6M1V0NKNpsAnj2Y/bDYsyQ/PF4tYVxU8eMQxTn1JZcP/7kvVn6Q5wqv9sFs4zRb
         yZupXOG3jObxXvuY5fnjYYIxhZqGPCg0sySFiIzEjfGgp9+bZT0jNFmbL2Z5j0XdTig5
         TEi6EfQurwrkscKJ2YRR5OzKzOBrnf3tdtYN7iHTOJhh6OSZuCQS8ZGEnxm4wLc1Jy5a
         trnJN4WmQJcpR0ZHpDc6Agsy2DGFpmPq8eSHzj/SjJF6bSXe9qk+XAgTvTBSSvf2Bhg1
         oVug==
X-Gm-Message-State: AOAM532olSmTslyreUvsnsFx2RLBRaMtF20WPBe2Q7WvMKGi37o31Bgj
        tykAZxMAlxymWXBw8FDOp0JV4qzItzx4oZBH4iex5xW8w2Ldd3fru51ZwXzudleUfOfxXOJ/8NI
        o9nhTwCm+3Wq8bUou31x2rmmoUt9lER9aChcjlQ==
X-Google-Smtp-Source: ABdhPJxCoGqCE+G+GSa7HwHqRzLNs+NCqRuwXnyBTsr8rbTQk2wr2+tC8tzvMHHx7QLSrjYprJILWQ==
X-Received: by 2002:ac8:60d9:: with SMTP id i25mr9889314qtm.406.1631309659565;
        Fri, 10 Sep 2021 14:34:19 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id b7sm3932191qtt.12.2021.09.10.14.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 14:34:19 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        martin.fernandez@eclypsium.com, daniel.gutson@eclypsium.com,
        hughsient@gmail.com
Subject: [PATCH 0/1] [RFC] x86: Export information about hardware memory encryption to sysfs
Date:   Fri, 10 Sep 2021 18:33:36 -0300
Message-Id: <20210910213337.48017-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show the value of EFI_MEMORY_CPU_CRYPTO of the system memory as a whole
on each memory node in sysfs.

This is a first step in a serie of patches for exporting the needed
information to userspace to determine if a machine is doing using
Intel's TME or MKTME.

In a next patch I'm going to export if TME/MKTME is activated by the
BIOS to sysfs, since right now for the user, this information is only
available in the kernel logs, and it's not appropiate for fwupd to scan
the boot logs just to parse an integer. I'm looking for suggestions
for where to store this value.

Martin Fernandez (1):
  x86: Export information about hardware memory encryption to sysfs

 Documentation/ABI/testing/sysfs-devices-node | 11 +++
 arch/x86/include/asm/numa.h                  |  2 +
 arch/x86/mm/numa.c                           |  5 ++
 arch/x86/mm/numa_emulation.c                 |  2 +-
 arch/x86/platform/efi/efi.c                  | 27 +++++++
 drivers/base/node.c                          | 80 +++++++++++++++++++-
 include/linux/efi.h                          |  7 ++
 include/linux/node.h                         |  5 ++
 8 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node


base-commit: 0bcfe68b876748762557797a940d0a82de700629
--
2.30.2

-- 


This e-mail and any attachments may contain information that is 
privileged, confidential,  and/or exempt from disclosure under applicable 
law.  If you are not the intended recipient, you are hereby notified that 
any disclosure, copying, distribution or use of any information contained 
herein is strictly prohibited. If you have received this transmission in 
error, please immediately notify the sender and destroy the original 
transmission and any attachments, whether in electronic or hard copy 
format, without reading or saving.












