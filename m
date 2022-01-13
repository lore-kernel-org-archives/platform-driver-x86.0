Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C55C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Jan 2022 21:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbiAMVal (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 Jan 2022 16:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbiAMVal (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Jan 2022 16:30:41 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0724C06161C
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jan 2022 13:30:40 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id w188so9598321oiw.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jan 2022 13:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3+Fd7rp5Rw8E6vOhlPr2SanZQN2IlO+HYowr2SyJ/Xw=;
        b=W8SaOj8iTNTqE5QdYYhRGj3tb+pFzJyNeZHbkn+yaacsD4KKm9rsVpHbD+GZqOrdgF
         qznRMrzhjbzQUPKhuBVWYXGTN/Y1Gc9Wih9yFcFxROtXWUtd/y7fsdCGTZz3TygFZllm
         0KhcKGJtY8NJtgDE0jBVYcKluVVFJfZfK9p6zjmYPaJE6jaP2VsZ91X+iZL5vbeiVond
         mJBeTg6ZmYksXGHIDBz5y7+wxb4eBCmBkuRhWgX3+c1/Mn0URdeGXyfq8bQsarQz3Pnp
         Aym3bDz/tsRfwygihqgSJImm+P8y8hLhOJT8UDlDnCSjny2rcw6sE+L+LeUrbR2f8BWx
         +F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3+Fd7rp5Rw8E6vOhlPr2SanZQN2IlO+HYowr2SyJ/Xw=;
        b=dWEOwLTYGorKrg2uFzSYvpwLgeLEz+TzGR+0tVTJZHG/npYc5I6y+AwXnBJ/skydh+
         j1dnIqk0y+5NTEDtyKgKqtBYlScyor+xSn8LxZWHiEg9jLj8DGUv2RUsaEDoe/Gmw25S
         0PzYMs/sgG2t1sEr8msjENEaf01QniW/tLqh8MJvgxvT9+UDwVFkQIfxjBPB1llNjWsM
         ANdrBzOdDcRk+aP61egRlwtfoN//YXTWzLjOuwiExTksE8xC6KMUD+rX44daQYvT2Bt8
         jHiOAFfQ7zFwlVo5zYhbXCqn/hv1aHGWnZ6MDwnEMPLwBj7tl6v8in/HMuBgt5tTeck2
         WZ1w==
X-Gm-Message-State: AOAM532I2X+e1+ER8fgAQrlL+lPcG9+C/PkikUGN2Po5v0vs0O491LwA
        tv+Amz1RsmFVaQ7fgCNi+PhqLQ==
X-Google-Smtp-Source: ABdhPJxIdnb8HNddOnTxQtJlBHkZ84/nUreBjj84aywl09w8wKLzUlG6D1R3Eng+/IKirEHSCeShWQ==
X-Received: by 2002:aca:62d7:: with SMTP id w206mr10567069oib.90.1642109440190;
        Thu, 13 Jan 2022 13:30:40 -0800 (PST)
Received: from localhost (115-127-16-190.fibertel.com.ar. [190.16.127.115])
        by smtp.gmail.com with ESMTPSA id bf15sm1145713oib.38.2022.01.13.13.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 13:30:39 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v5 0/5] x86: Show in sysfs if a memory node is able to do encryption
Date:   Thu, 13 Jan 2022 18:30:22 -0300
Message-Id: <20220113213027.457282-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show for each node if every memory descriptor in that node has the
EFI_MEMORY_CPU_CRYPTO attribute.

fwupd project plans to use it as part of a check to see if the users
have properly configured memory hardware encryption
capabilities. fwupd's people have seen cases where it seems like there
is memory encryption because all the hardware is capable of doing it,
but on a closer look there is not, either because of system firmware
or because some component requires updating to enable the feature.

It's planned to make it part of a specification that can be passed to
people purchasing hardware

These checks will run at every boot. The specification is called Host
Security ID: https://fwupd.github.io/libfwupdplugin/hsi.html.

We choosed to do it a per-node basis because although an ABI that
shows that the whole system memory is capable of encryption would be
useful for the fwupd use case, doing it in a per-node basis gives also
the capability to the user to target allocations from applications to
NUMA nodes which have encryption capabilities.


Changes since v4:

Add enum to represent the cryptographic capabilities in e820:
e820_crypto_capabilities.

Revert __e820__range_update, only adding the new argument for
__e820__range_add about crypto capabilities.

Add a function __e820__range_update_crypto similar to
__e820__range_update but to only update this new field.


Changes since v3:

Update date in Doc/ABI file.

More information about the fwupd usecase and the rationale behind
doing it in a per-NUMA-node.


Changes since v2:

e820__range_mark_crypto -> e820__range_mark_crypto_capable.

In e820__range_remove: Create a region with crypto capabilities
instead of creating one without it and then mark it.


Changes since v1:

Modify __e820__range_update to update the crypto capabilities of a
range; now this function will change the crypto capability of a range
if it's called with the same old_type and new_type. Rework
efi_mark_e820_regions_as_crypto_capable based on this.

Update do_add_efi_memmap to mark the regions as it creates them.

Change the type of crypto_capable in e820_entry from bool to u8.

Fix e820__update_table changes.

Remove memblock_add_crypto_capable. Now you have to add the region and
mark it then.

Better place for crypto_capable in pglist_data.


Martin Fernandez (5):
  mm/memblock: Tag memblocks with crypto capabilities
  mm/mmzone: Tag pg_data_t with crypto capabilities
  x86/e820: Tag e820_entry with crypto capabilities
  x86/efi: Tag e820_entries as crypto capable from EFI memmap
  drivers/node: Show in sysfs node's crypto capabilities

 Documentation/ABI/testing/sysfs-devices-node |  10 ++
 arch/x86/include/asm/e820/api.h              |   1 +
 arch/x86/include/asm/e820/types.h            |  12 +-
 arch/x86/kernel/e820.c                       | 112 +++++++++++++++++--
 arch/x86/platform/efi/efi.c                  |  26 +++++
 drivers/base/node.c                          |  10 ++
 include/linux/memblock.h                     |   5 +
 include/linux/mmzone.h                       |   3 +
 mm/memblock.c                                |  49 ++++++++
 mm/page_alloc.c                              |   1 +
 10 files changed, 219 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node

-- 
2.30.2

