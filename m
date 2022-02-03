Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6C3C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Feb 2022 16:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352382AbiBCQo0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Feb 2022 11:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352380AbiBCQoV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 11:44:21 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F74C06173B
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 08:44:21 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id w17so2068121vko.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2VGMhr11GA+eGLRm5CsL28eo528BHkwYTiIF+ncvNsE=;
        b=IAiLk5cjQwcE3yLS3aO2GBCqcyaetSmqrMvYHWmRcTBrX/70H06j9PR2aE3QGP81gN
         G6QDkvipCsGgjSUtRGArhWJu9iDWKOYWnm+NZ0aqk4cri2wqtuUQX+b9q3EK3qLf7feX
         OImmnQkBiMNjk2/7Ue9/B8Qdinvi+e/rlfFOS1vMUliTuXgm65EiqOAZE9CaQY4tGH/U
         /17cWo3icgYBFxnClGbVhoptcy+1QRAjpqIMCkUQhjxF94o8InjEYUfRnEDRxY6mI8V3
         60dkSPCH/hnp20RoME00w3RlqarwXBsRUPrQ7hYsR3fup3yBWAysWmRuspyPg2EBrkB9
         r+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2VGMhr11GA+eGLRm5CsL28eo528BHkwYTiIF+ncvNsE=;
        b=hUAF+xg6WQL9MtSp13SkFe9apdgKBNlWrLyG7QISGMQilsbBxhw1agTfkYVVrKBEi6
         B5u2h2je62Jvmyz45oXziQ10RzDfgJCeyVRqjOuosaO40wBKjVWtrGFGokPHvGikjygH
         X0xyNLtswo2nJQ55TJItykhvUtJ4M4lcCaIfADVkOS9uCUgFKG0+UWjqh3613vZEFaj0
         4mZhGalw2ieTHN8jm2Eqataczw/D8HRiJYjkdUaw2PINuIuSXpe3p74TVqAgTF6wpOsd
         igsShwC9SvbmvPNm/V+Y9bc/g0UYWt7tba2QVLf0fIlMSCyaWtaPdwy5VfaYFFSvKPPB
         qjzA==
X-Gm-Message-State: AOAM533smFZpmXQdgBa7MWDFlCYqMb9FxS5HsQg57tLRDPzRCZRLeoxB
        6okmPSLCvdqluS1BO/ITFoFDHQ==
X-Google-Smtp-Source: ABdhPJzsOFFOqxgDzTCzuaTzUcSCoJoy32VcScNJTJMZP7zNyU9OfyuKOow2hpJD7GfcAiCruPNRVA==
X-Received: by 2002:a05:6122:c90:: with SMTP id ba16mr15282992vkb.39.1643906660499;
        Thu, 03 Feb 2022 08:44:20 -0800 (PST)
Received: from localhost (host8.190-224-49.telecom.net.ar. [190.224.49.8])
        by smtp.gmail.com with ESMTPSA id s11sm6623102vke.47.2022.02.03.08.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 08:44:20 -0800 (PST)
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
Subject: [PATCH v6 5/6] x86/efi: Tag e820_entries as crypto capable from EFI memmap
Date:   Thu,  3 Feb 2022 13:43:27 -0300
Message-Id: <20220203164328.203629-6-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
References: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
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

