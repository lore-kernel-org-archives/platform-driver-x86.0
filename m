Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86047C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Dec 2021 19:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382796AbhLCT0n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Dec 2021 14:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382856AbhLCT0l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Dec 2021 14:26:41 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954A5C061353
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Dec 2021 11:23:17 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id d2so4492606qki.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Dec 2021 11:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DOUmdW1fRYRblflWGLh6NhnBa89lC/dRK/EDmCbffkQ=;
        b=G1d14RHa7UrlkA/IF01Z8YQG4CvIyt45yX0PQY8K+JyWYPW+oyKJQIG+GRjPntQ/hP
         ou2AVnIJ1IgRAczlzMziU3OOMiPodmd7LeistE3yUrLGGUrdG0MsZUNHY2ec4a3OMePI
         ZUSzk5Q9c5bFyneacsbYNItjSA6VMgWKK1V8i4QgQM2We+x6c3KcNIF9YSJXYhb5v86q
         E5QeAPGQknmUFHd1BBh/qQnj6klqE5he80uG6ex6JsbiC864m9pjPOQtwsiK4JKs0i5S
         52jEeqJoOh1qW5AmWiGKl0w8R8P70CJC7hmAHXLx5BRs/FVnALON6i1F6khbavDI+0xS
         PIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOUmdW1fRYRblflWGLh6NhnBa89lC/dRK/EDmCbffkQ=;
        b=eZYPMcx4LpHdjv181M7z74Fb1KutQbjoxHoj5aPCwpcI+3LOUkdPDMSMsFsX/lQw/7
         VQCo77zKAsGV8rWunaOYpTZ9KWXcuI7fbikoGsTQLVIMORfxVNGpLJBXYOQEkRdylyt0
         lTlFwA7xcvOwoLgXtrRf8AKUCLzxLtIDU6gj+E9R7FCBwrZchuCNixYYzOGzTO9u7NLq
         neqH8KRKqjOHcCe1jew9bSRAerNAVVuF/zG6L1RL9/JDFAsfBMx5pxvgH0D3nE3dUBoG
         SIRHPw6XIXcR1+I8umfh9o36EsqBcFdzBr1l+1YFl1md0ty0M9iXaU8TSmwRZXhMzvmY
         Wnmw==
X-Gm-Message-State: AOAM532/bONSC0YLK7JmzB2TuMa+absjs7TY0yHxgrbF9vfj2k4jVFxv
        ajl1dHdPNPB2syAU+5ZoOK52Zw==
X-Google-Smtp-Source: ABdhPJysstuFd57Wtr4jLrbWH+YQiZ6VtuUGJ/wlAcTvALz7QAJ5g1ppNuwguIeJyGHgD44SXkp3Nw==
X-Received: by 2002:a37:9e0f:: with SMTP id h15mr18955179qke.679.1638559396809;
        Fri, 03 Dec 2021 11:23:16 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id g14sm2784281qko.55.2021.12.03.11.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 11:23:16 -0800 (PST)
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
Subject: [PATCH v3 4/5] x86/efi: Tag e820_entries as crypto capable from EFI memmap
Date:   Fri,  3 Dec 2021 16:21:47 -0300
Message-Id: <20211203192148.585399-5-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
References: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a function to iterate over the EFI Memory Map and mark the regions
tagged with EFI_MEMORY_CPU_CRYPTO in the e820_table; and call it from
efi_init if add_efi_memmap is disabled.

Also modify do_add_efi_memmap to mark the regions there.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 arch/x86/platform/efi/efi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 147c30a81f15..38744fadcb9c 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -184,6 +184,8 @@ static void __init do_add_efi_memmap(void)
 		}
 
 		e820__range_add(start, size, e820_type);
+		if (md->attribute & EFI_MEMORY_CPU_CRYPTO)
+			e820__range_mark_as_crypto_capable(start, size);
 	}
 	e820__update_table(e820_table);
 }
@@ -441,6 +443,22 @@ static int __init efi_config_init(const efi_config_table_type_t *arch_tables)
 	return ret;
 }
 
+static void __init efi_mark_e820_regions_as_crypto_capable(void)
+{
+	efi_memory_desc_t *md;
+
+	for_each_efi_memory_desc(md) {
+		if (md->attribute & EFI_MEMORY_CPU_CRYPTO)
+			e820__range_mark_as_crypto_capable(md->phys_addr, md->num_pages << EFI_PAGE_SHIFT);
+	}
+
+	/*
+	 * We added and modified regions so it's good to update the
+	 * table to merge/sort
+	 */
+	e820__update_table(e820_table);
+}
+
 void __init efi_init(void)
 {
 	if (IS_ENABLED(CONFIG_X86_32) &&
@@ -494,6 +512,13 @@ void __init efi_init(void)
 	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
 	efi_clean_memmap();
 
+	/*
+	 * If add_efi_memmap then there is no need to mark the regions
+	 * again
+	 */
+	if (!add_efi_memmap)
+		efi_mark_e820_regions_as_crypto_capable();
+
 	if (efi_enabled(EFI_DBG))
 		efi_print_memmap();
 }
-- 
2.30.2

