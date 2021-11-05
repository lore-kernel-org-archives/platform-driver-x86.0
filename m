Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C75FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 21:27:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E01C60FD7
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 21:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhKEVa2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 17:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhKEVa2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 17:30:28 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E1FC061570
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:27:48 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id az8so9983574qkb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Nov 2021 14:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PulCwB12eNyvVEFqfF1lDlnZ5ON1wVcjCswJOmxvPxI=;
        b=D0kLYLFdl4MswKTPvO4QmFGg2ItyugmtfMXGFL8069wSG+VpNbJ0pavoIxyKQZByov
         bY4/sScWY4M3Z2IVoFq7YT7VpAxcimUHFpFTLONjhlD0gHbfExesEYHL5wSJucOVNbes
         X0wBAszJil8Vdf1HfwjWDZ4e6k5pa+Ibw0z1Z6ILXBXrcbJ6uIDjpWIsOlBzHWS80nIs
         oiBLqcANcdnUncpon9MfQA7Kro7vrFH3nYS+qC3Ukd2rxEMasmR84/s11tbLK6ZjwMzA
         8vlbrA0eTw619lg8RCqHKzF+5noSyULxPNh2Rbg2YfdxvvCBbvc3KqNtdZOtxJ4cyk5V
         s+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PulCwB12eNyvVEFqfF1lDlnZ5ON1wVcjCswJOmxvPxI=;
        b=vMs/kzq4BlKwsU+TWHkuxk7qUntlDB0FHpI3zWTm92wTDHycxDCHUwsGli7fWB1u5S
         dYzQj7pq0JZNlykjO5ZdfFLgm0YJhJuk98UHImZ+tTCGB+n7+u3s+WOQ8ff/3MZkFSfd
         BoKdTkU5ABSgYgnCLHccLGcj8y4lCsWZDtCiEgZx+GU6ID+P0/8OsdmeXLLzOpfrGE4J
         xBeqFy7tVV2I4CdqnpfFCEEsW69+V1y3luBoDb5+LgM82Aa8eVwdZJXzv0a096e1AuYB
         JQmUTToL4WcQ7Whi0DxcnLf+GuQm5hWeYCifhjm9nypwEu1NjtGG7jQ2wUVfexrlgCxl
         Ui4Q==
X-Gm-Message-State: AOAM530XpxdgcPUIVwKpN6P8ncgtmyOqbSbgT5NFV8yomOl8sbvDROHn
        XY/r6URC4j3DEAY8Kv4IUdhc1A==
X-Google-Smtp-Source: ABdhPJyXQC8B9UDQtCWTq67NcoKtKWyQcGGHOwZGp8s7uPWR8ItLhtVghzJrFUdGK8jEvA73H46f4A==
X-Received: by 2002:a05:620a:199b:: with SMTP id bm27mr14183990qkb.298.1636147667359;
        Fri, 05 Nov 2021 14:27:47 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id i6sm6686469qkn.14.2021.11.05.14.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:27:46 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH 0/5] x86: Show in sysfs if a memory node is able to do encryption
Date:   Fri,  5 Nov 2021 18:27:19 -0300
Message-Id: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show for each node if every memory descriptor in that node has the
EFI_MEMORY_CPU_CRYPTO attribute.

fwupd project plans to use it as part of a check to see if the users
have properly configured memory hardware encryption capabilities. It's
planned to make it part of a specification that can be passed to
people purchasing hardware. It's called Host Security ID:
https://fwupd.github.io/libfwupdplugin/hsi.html

This also can be useful in the future if NUMA decides to prioritize
nodes that are able to do encryption.

Martin Fernandez (5):
  Extend memblock to support memory encryption
  Extend pg_data_t to hold information about memory encryption
  Extend e820_table to hold information about memory encryption
  Mark e820_entries as crypto capable from EFI memmap
  Show in sysfs if a memory node is able to do encryption

 Documentation/ABI/testing/sysfs-devices-node |  10 ++
 arch/x86/include/asm/e820/api.h              |   2 +
 arch/x86/include/asm/e820/types.h            |   1 +
 arch/x86/kernel/e820.c                       |  32 +++++-
 arch/x86/platform/efi/efi.c                  | 109 +++++++++++++++++++
 drivers/base/node.c                          |  10 ++
 include/linux/memblock.h                     |   6 +
 include/linux/mmzone.h                       |   2 +
 mm/memblock.c                                |  74 +++++++++++++
 mm/page_alloc.c                              |   1 +
 10 files changed, 245 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node


base-commit: 3906fe9bb7f1a2c8667ae54e967dc8690824f4ea
--
2.30.2

