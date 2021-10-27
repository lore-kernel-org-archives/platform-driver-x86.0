Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF7EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 19:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A473360FC0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 19:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240458AbhJ0T6f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 15:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240344AbhJ0T6f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 15:58:35 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDADC061570
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 12:56:09 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id t1so2593937qvb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxkC08Ya/onM0Zfgr9OBmgvN+l1f5cx6s4UfOynb4lM=;
        b=gL2MvQADekNF0oWYA/nHaYiSskDTD4/GFGqSLL+sU/zw0tjVfoVOdGitXjG9lVSV4R
         4IQy3vz9mRPmZe4oajS8NQMMV3p8mrv7Ng5+bckrLwDH0Sk8FHJx2ZSp+lQ4sc+eqcHV
         QOHQixCcD3mPv45+19nqwd7NNzppdNBGkHw+COxCnP5EO66fNW5gbZm4mQ7TyF895d2T
         WqndopvTOkygXXo+fVYKvNrUO/dHw/4yszp/2XxaALGoFHWoo/AhcsedGmj8wmnPR+8o
         trWznpYreSwGQMq7eHzibHYkHD70NWDctVFMOaH4J34kaQv0NpslI6edpK+D/SELnuNr
         7aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxkC08Ya/onM0Zfgr9OBmgvN+l1f5cx6s4UfOynb4lM=;
        b=wARhzyl2VfaAags1Q6mqs01tvHd9BbQHW3N/mfPSo9nlDnGGR+x4WDWeZhClc+uZ0+
         lgTd2WpByCnZrxWmsD3Vtf+hNeA7osKt44VGCQxE4soooBbUzUzNXWAld6fZWdu0VNsS
         gGHIytabVaJLpP+uLjQObr+u2TwRMHPh73OvU5jl3+2lTONO5+bZC/X+dknLcfXRIaYA
         Q2n4licUnDeslj35nItm0KelCPch8/PsVffZ5ovNYgYY+yUOM4TpT1QI/q648RGMw5i4
         nR4WadH2JZ/EiWo3uEQMpeBa6ibShrQ1DapP3wPzgj38GnzZFp8MMgTQKDJcZLJO9Kk7
         dcMg==
X-Gm-Message-State: AOAM531fHCvDmdMyD5/19EzQaBumVBELFU4bYZ+2ZRHlfkg3h9Tsihb+
        ES14x1HMsRSwDS+MUTEbUD6F0A==
X-Google-Smtp-Source: ABdhPJxehUt/tNtBSMoMFfzAS98h4RXEoiQRAuOspNlEsHA1/ZCVCGvCHKvMvsSLfk46ontQtgtW1Q==
X-Received: by 2002:a05:6214:e84:: with SMTP id hf4mr31700576qvb.38.1635364567977;
        Wed, 27 Oct 2021 12:56:07 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id c13sm594483qtc.42.2021.10.27.12.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 12:56:07 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        martin.fernandez@eclypsium.com, daniel.gutson@eclypsium.com,
        hughsient@gmail.com
Subject: [PATCH v2 0/5] [RFC] x86: Export information about hardware memory encryption to sysfs
Date:   Wed, 27 Oct 2021 16:55:06 -0300
Message-Id: <20211027195511.207552-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show for each NUMA node the value of EFI_MEMORY_CPU_CRYPTO in its
memory.

This is a serie of patches for exporting the needed information to
userspace to determine if a machine is using Intel's TME or MKTME.

In a next patch I'm going to export if TME/MKTME is activated by the
BIOS to sysfs, since right now for the user, this information is only
available in the kernel logs, and it's not appropriate for fwupd to
scan the boot logs just to parse an integer. I'm looking for
suggestions for where to store this value.

Changelog v2:

The value shown in each node now only corresponds to memory in that
node in particular

Martin Fernandez (5):
  Extend memblock to support memory encryption
  Extend pg_data_t to hold information about memory encryption
  Extend e820_table to hold information about memory encryption
  Mark e820_entries as crypto capable from EFI memmap
  Show in sysfs if a memory node is able to do memory encryption

 Documentation/ABI/testing/sysfs-devices-node |  12 +++
 arch/x86/include/asm/e820/api.h              |   2 +
 arch/x86/include/asm/e820/types.h            |   1 +
 arch/x86/include/asm/numa.h                  |   7 ++
 arch/x86/kernel/e820.c                       |  32 +++++-
 arch/x86/mm/numa.c                           |   5 +
 arch/x86/mm/numa_emulation.c                 |   2 +-
 arch/x86/platform/efi/efi.c                  | 108 +++++++++++++++++++
 drivers/base/node.c                          |  72 ++++++++++++-
 include/linux/memblock.h                     |   6 ++
 include/linux/mmzone.h                       |   2 +
 include/linux/node.h                         |   1 +
 mm/memblock.c                                |  74 +++++++++++++
 mm/page_alloc.c                              |   1 +
 14 files changed, 321 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node


base-commit: 3906fe9bb7f1a2c8667ae54e967dc8690824f4ea
--
2.30.2

