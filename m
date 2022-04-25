Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C40C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 17:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243843AbiDYRTK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 13:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242051AbiDYRTA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 13:19:00 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32294B93
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:15:55 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 12so17798641oix.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cuoU1kSVf8VEBS5kxyG+ti9eeLYydPT4J1CXt5LwLhU=;
        b=WVNRKEKob2y9lFrXgNElxa26Uxh1XvllzgMqrT+R70+SAvu/khzVJ0sFW9Kny0Qa7N
         jLVQLq9bTQ71s6VakMPFRKCHzlO8ZQ8mMVLzhNDI47Tsc6K6t3zkkwCNQe76Hs/qU+h5
         pff6FNHYBVqwtXfDT2vS4howEmhCTaodjYQw7fzcHX4fgvsmvS2MLEoXGEWf8QrHMsop
         kGxt72nAdiuqmo2bcyzM+I4DRQjwsBtp+Is15HwL9rka8zB2koeqRTkw+HAsvAlcMyfK
         u6R0LRV4pUi4IWR8NROkxZ2EmmJAi1skJ5sO/+YxWmwC+pZ4xs3as8lXszeFy8RS3TMf
         tmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cuoU1kSVf8VEBS5kxyG+ti9eeLYydPT4J1CXt5LwLhU=;
        b=Q76V8byVkHpCG9PsJKZKOPhnzg2c+9TjH1DOcfhXocqftvaLL+v51OkjZjePqm33Nx
         wLaDhISbi5Vzy7DHfDdDr++JDBgHspNptYDoZ3ufKQJgyY0o+IW0xDFRxdxo11E93dMq
         tCO5tkmpSLFOoGbcyVVn7P1QINiCUxNH+pN1vLt6rjWGRbfxq7DeN21D308S79De4Tw0
         mmwT53DrR5S36LMSBvkNEhb5DCesUI2j3kx+Ewqs2iAUyeyBVWueldRQ/I7Wrtb+BXs0
         1dClwCd9lhADkvPCi+Dsq45okyb4DZDvwOGVtUftpW4eJUrw4/0HSxz4kMhQmetVrRoi
         FVyQ==
X-Gm-Message-State: AOAM531o3bT2ud627T21MbpYke8KMYfvnmupRQOOdrkYwAZM8a9lK+nq
        ltct4h/wkFbUmpgLsuawkuL5SQ==
X-Google-Smtp-Source: ABdhPJwJqrLz4LvPdbpxTti+gZ2zpgNv7oGdv4vd7aYab8Kx1ulj4m3IkrTedE0A5L9UCyT5RbSlZA==
X-Received: by 2002:a05:6808:1805:b0:323:a81:bdff with SMTP id bh5-20020a056808180500b003230a81bdffmr8671177oib.7.1650906954532;
        Mon, 25 Apr 2022 10:15:54 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id j9-20020a056808056900b0032252797ea4sm4007238oig.6.2022.04.25.10.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 10:15:54 -0700 (PDT)
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
Subject: [PATCH v7 2/8] mm/mmzone: Tag pg_data_t with crypto capabilities
Date:   Mon, 25 Apr 2022 14:15:20 -0300
Message-Id: <20220425171526.44925-3-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
References: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new member in the pg_data_t struct to tell whether the node
corresponding to that pg_data_t is able to do hardware memory
encryption.

This will be read from sysfs.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 include/linux/mmzone.h | 3 +++
 mm/page_alloc.c        | 1 +
 2 files changed, 4 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 46ffab808f03..89054af9e599 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -886,6 +886,9 @@ typedef struct pglist_data {
 	struct task_struct *kcompactd;
 	bool proactive_compact_trigger;
 #endif
+
+	bool crypto_capable;
+
 	/*
 	 * This is a per-node reserve of pages that are not available
 	 * to userspace allocations.
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 0e42038382c1..a244151045b4 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7699,6 +7699,7 @@ static void __init free_area_init_node(int nid)
 	pgdat->node_id = nid;
 	pgdat->node_start_pfn = start_pfn;
 	pgdat->per_cpu_nodestats = NULL;
+	pgdat->crypto_capable = memblock_node_is_crypto_capable(nid);
 
 	if (start_pfn != end_pfn) {
 		pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
-- 
2.30.2

