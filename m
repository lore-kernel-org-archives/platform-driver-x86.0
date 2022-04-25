Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E81C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 17:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243884AbiDYRUA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 13:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243844AbiDYRTp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 13:19:45 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593732AE0C
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:16:31 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id g30-20020a4a251e000000b0033a39d8340aso2907879ooa.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2VGMhr11GA+eGLRm5CsL28eo528BHkwYTiIF+ncvNsE=;
        b=hzdDmfKq8Bk9MII6db84BuRQTA/8rrlJsMn81H+8Z6fmZowtvXXor0jrWgoYGoELCw
         IsIzz074TMbE9AtUH2hfNN9cl4+cL2kALjO15QlLwx+J7IiSpWMDUQXN1ky+b6TyHLgV
         g8ZcTwU6ddQZlGfTw3ZExEZZIipHXbZS7hfXg/PZIIxAaplsyeLYNZu3Ph7olpJmw70s
         T5p5+74Sg002Z8SZlFK2U93bEY/7rC/66iOkS3hLBRCcIohkPQmE2rwS/StCBweQD5LG
         fGpr/YgqwEmPUoDwJp0CpaEWHLvQxyCttWiqadb6WN/2/2KYX9p/eIOXN7IoM+YLhNc3
         l0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2VGMhr11GA+eGLRm5CsL28eo528BHkwYTiIF+ncvNsE=;
        b=Gq2vxT00wD9HLqrWbG2lFjpqQWejr0uoLVy8f1+jwypHa0DTHlpPjQAi7VNpyaX0H4
         UL4cnDvB0U/6pSkUeqYEnbpUqYaUpNG6nZFCXwUwuqRVv3SoGEUCQVfN/M94FiHx7AJC
         cOioQVyQ9hlmblPYj0fd1Ff7iOzjHlHr5JCzkUgWQkSl+E9+a0D2AOUXjyLzDB+nGMEF
         5wvoszidtRuZmJ3u/tZT48/bnW64kYjFhvusLEReWT5VJ4AJjg0YXmRsuaSvIiMz/ard
         twnFrtSgRoQ+L+j9jE1DIVc3Lv0uMUMDNlb2YBZKiFmjHmzlJpsUHLbw4TCGcAGC82SG
         bEow==
X-Gm-Message-State: AOAM533T//y/RfkHwcIV4YSSRRrfvyRRiRpIHnX9WvSdxH8OS1mPrMpK
        wD40/VyNObTCiVJJmLdNEoGlxg==
X-Google-Smtp-Source: ABdhPJw+qg0OrSQnHpLZqEEKRtsnl5QwBjo+IrjHQ4B0lUJPMGV26uBWO99+0KzzBzURpIrWg8ExmQ==
X-Received: by 2002:a4a:92d4:0:b0:33a:3d7d:fe5 with SMTP id j20-20020a4a92d4000000b0033a3d7d0fe5mr6747103ooh.83.1650906990628;
        Mon, 25 Apr 2022 10:16:30 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id w8-20020a056830410800b00605b48122eesm1191834ott.14.2022.04.25.10.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 10:16:30 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v7 7/8] x86/efi: Mark e820_entries as crypto capable from EFI memmap
Date:   Mon, 25 Apr 2022 14:15:25 -0300
Message-Id: <20220425171526.44925-8-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
References: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a function to iterate over the EFI Memory Map and mark the regions
tagged with EFI_MEMORY_CPU_CRYPTO in the e820_table; and call it from
efi_init if add_efi_memmap is disabled.

Also modify do_add_efi_memmap to mark the regions there.

If add_efi_memmap is false, also check that the e820_table has enough
size to (possibly) store also the EFI memmap.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 arch/x86/platform/efi/efi.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
index 147c30a81f15..3efa1c620c75 100644
--- a/arch/x86/platform/efi/efi.c
+++ b/arch/x86/platform/efi/efi.c
@@ -184,6 +184,8 @@ static void __init do_add_efi_memmap(void)
 		}
 
 		e820__range_add(start, size, e820_type);
+		if (md->attribute & EFI_MEMORY_CPU_CRYPTO)
+			e820__range_set_crypto_capable(start, size);
 	}
 	e820__update_table(e820_table);
 }
@@ -441,6 +443,34 @@ static int __init efi_config_init(const efi_config_table_type_t *arch_tables)
 	return ret;
 }
 
+static void __init efi_mark_e820_regions_as_crypto_capable(void)
+{
+	efi_memory_desc_t *md;
+
+	/*
+	 * Calling e820__range_set_crypto_capable several times
+	 * creates a bunch of entries in the E820 table. They probably
+	 * will get merged when calling update_table but we need the
+	 * space there anyway
+	 */
+	if (efi.memmap.nr_map + e820_table->nr_entries >= E820_MAX_ENTRIES) {
+		pr_err_once("E820 table is not large enough to fit EFI memmap; not marking entries as crypto capable\n");
+		return;
+	}
+
+	for_each_efi_memory_desc(md) {
+		if (md->attribute & EFI_MEMORY_CPU_CRYPTO)
+			e820__range_set_crypto_capable(md->phys_addr,
+						       md->num_pages << EFI_PAGE_SHIFT);
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
@@ -494,6 +524,13 @@ void __init efi_init(void)
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

