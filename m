Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE830C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Dec 2021 19:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382807AbhLCT0N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Dec 2021 14:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382818AbhLCT0M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Dec 2021 14:26:12 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D524C061353
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Dec 2021 11:22:48 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id b11so3733325qvm.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Dec 2021 11:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ANF2YozXkZ/Ma7nQsyNWs6tgBsm2cwF++KgkH2V+msY=;
        b=ZYhsxXpD0mGY2oqFx+RaRUfwzl0VpP6ZV9szBbuxhq1LBtrWuKE0vhimTJzvcg+zDa
         sfzG2+TknlaqMmI6RpOlKFaRHcD9CvWDX9CHl5NgswAH0qDHxesQn6xcod7R0OA/Y4pk
         AmpAvRPS0BCX5SvzoaEiTU9R1y1gnho/Fg7yYMjBDd1N2GsccPJ9X8rYTP2tusqlGITB
         JL6+v8rdFH6Kv82rm5flzu91kB0j1PTgrya8QBdxnT1d/1drMWYwqcC/crBMLUkaT4gN
         Rzd0ev2GRbhveZdYW9DO2LwQHHIPHDTv8ftSVykwSy9AEN14h7vkbAx++KJm83Oi2dUv
         Qvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ANF2YozXkZ/Ma7nQsyNWs6tgBsm2cwF++KgkH2V+msY=;
        b=7Dv31jK+CMmZUER31OVEx2owNrps27pBXI2yBSDHNyTGXgAGdPuiG+eOgUS+R2gkJS
         7L7oCYRu424Ous6G53eYHjsNRxRWEe6jkrmy3iS4VszD7lX8wpKHCvlkuqmxXGMmppOR
         dMkzf7/X5QC1n42XvsmVlNBOfG1KTV3y1Z8ZQ86gP5iNUuaoUjqTpZkioQNlG4mkGW+p
         S8y6+1wIONsKOiSAhTzkaejGBm8n2op3dgqn4if5jIhOn6gIdhqaQbAF4wQF+F1rdCSD
         DCA/6bg1++Hch2MykLvjv5SeKXvHQSGgxxKqfNvpp1BKpZyJ2e256kdbApJcJ1qPDybe
         OtDg==
X-Gm-Message-State: AOAM533lLMMAT1NVQ+KVvP4dElJV2Elv7Ma9wi91yCd2iGVCK7b39WuB
        KTgwFBBT1vm57b2N0wPH4zL4QA==
X-Google-Smtp-Source: ABdhPJyXWkPwQVmZmqs083B9CeHPzZGK70TGRqlHMkD4evC17cikecKIZkE7Ay8fTkI7veAOIfGPoA==
X-Received: by 2002:a0c:f750:: with SMTP id e16mr21182404qvo.110.1638559367537;
        Fri, 03 Dec 2021 11:22:47 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id y10sm2701035qkp.128.2021.12.03.11.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 11:22:47 -0800 (PST)
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
Subject: [PATCH v3 0/5] x86: Show in sysfs if a memory node is able to do encryption
Date:   Fri,  3 Dec 2021 16:21:43 -0300
Message-Id: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
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
  Tag e820_entry with crypto capabilities
  x86/efi: Tag e820_entries as crypto capable from EFI memmap
  drivers/node: Show in sysfs node's crypto capabilities

 arch/x86/include/asm/e820/api.h   |  1 +
 arch/x86/include/asm/e820/types.h |  1 +
 arch/x86/kernel/e820.c            | 59 ++++++++++++++++++++++++-------
 arch/x86/platform/efi/efi.c       | 25 +++++++++++++
 drivers/base/node.c               | 10 ++++++
 include/linux/memblock.h          |  5 +++
 include/linux/mmzone.h            |  3 ++
 mm/memblock.c                     | 49 +++++++++++++++++++++++++
 mm/page_alloc.c                   |  1 +
 9 files changed, 142 insertions(+), 12 deletions(-)

-- 
2.30.2

