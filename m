Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFD4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 20:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236535AbhKXUig (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 15:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbhKXUif (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 15:38:35 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4414C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:35:25 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id n6so7802267uak.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WWVyA9rAT+6UqFks6dTFD+XM7gB7oWrs5iYRikzxmOM=;
        b=WbV062ADcaZlzsRT9vd/XbsLpKxMq4laIhRub0+tanSWZYatiUAH62How4J6UgXjFg
         rPtzDYLvTqq9GK/SduFeKNyWsuzktleUUfnRTJjODk1n+yvHggF7Qj4leP5WZdUUeaom
         9+jA155t5D0njV65l023h2ejKQv9MMI/S811FJfMvdw9yp4pMFSIynSNxXLGI8byI1i3
         q7ANTDB+xo6j48lg3HW+/jcaIMntmdob9wRbyudnmEuukieMDHGUN6M773xj4RnpapEw
         7QydoqlalZXaszL67EqBE7Aklucyr89rxb1ppnhx9no+8u+FShiGO6C6fiIGfK+v6XtG
         laRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WWVyA9rAT+6UqFks6dTFD+XM7gB7oWrs5iYRikzxmOM=;
        b=7Jl8JK5D/H6KGr7CWUEHwcwTdGBzt1oDY78xYOYhSuGYxhEWKvqTmOr3XJVEU4WuQ5
         Z1kcqyQwhgyd4hjW1e3CG2VNrNpTElLDcA7CZzWiB7H7tvQU0xrCV6e/ypwbB0HXNbY0
         KXyC6hcpAYL0q+HODNWcP6UtLddrH5ElMEa2UCkmckXh4b32hs+YeTY39L4bFVoEqv1S
         6RzRIMWUeR4nvVdSQhqXPxSGTcS85KdokMohzy4iPCGlMG7nvdzH9+OhdvyxJDG9UOSL
         UOTfZaNvCI4Bbtgk7ehjUeXc78KoB6gY20ZtY2D+bDvpj3vDQldPu3zTvQCfbzqX8mr8
         gRVw==
X-Gm-Message-State: AOAM533rCYzeFt8yheNIi1jfaszn2CUGCpanunuTg2xB3YRSKZAWLmU/
        1i69Igy3dIl5vDAmSV79t9gAdg==
X-Google-Smtp-Source: ABdhPJwzWzaQ9o75w/vYtE+DN8W9P9ajLA82XkQlYDx1uUehhPbBdyYs/x96QMBMEwaH/tHbyOvQ1g==
X-Received: by 2002:a05:6102:497:: with SMTP id n23mr27360382vsa.36.1637786125024;
        Wed, 24 Nov 2021 12:35:25 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id y22sm501975vkn.42.2021.11.24.12.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 12:35:24 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v2 0/5] x86: Show in sysfs if a memory node is able to do encryption
Date:   Wed, 24 Nov 2021 17:34:54 -0300
Message-Id: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
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

 Documentation/ABI/testing/sysfs-devices-node | 10 ++++
 arch/x86/include/asm/e820/api.h              |  1 +
 arch/x86/include/asm/e820/types.h            |  1 +
 arch/x86/kernel/e820.c                       | 58 ++++++++++++++++----
 arch/x86/platform/efi/efi.c                  | 25 +++++++++
 drivers/base/node.c                          | 10 ++++
 include/linux/memblock.h                     |  5 ++
 include/linux/mmzone.h                       |  3 +
 mm/memblock.c                                | 49 +++++++++++++++++
 mm/page_alloc.c                              |  1 +
 10 files changed, 152 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node

-- 
2.30.2

