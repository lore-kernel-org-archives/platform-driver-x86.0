Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BC2C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Apr 2022 20:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380536AbiD2UVM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Apr 2022 16:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380490AbiD2UVL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Apr 2022 16:21:11 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6832A0BEA
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 13:17:51 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-e2fa360f6dso9235042fac.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 13:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cuoU1kSVf8VEBS5kxyG+ti9eeLYydPT4J1CXt5LwLhU=;
        b=Ca5CpkEdAGoDq4Rv1TW6+hSfJvX+bFxVgDxtp2Me/AhtkYKBKy7HDq9kO20qbFkCU/
         oD5DMChdyFmU3n3DgPNgqCCNm7kr+52q5L9Hs/atSrY+4iP2qvhY/q2YA44Z2lv4tRjd
         v+qrNTH6cIBZ9Su9FBIIHdnb4f7y2STK1hcq14DBBiSA+1dXsvH5vR9SgVQv5TpKV515
         6JTZ+l5RXQFB1Sq+ZHqkQs2djzOBE2pbg+fG2kXx5gpAKt3GP7C7mx5AJDZr8JYHBth7
         TYSaK6qQeMoDiSKDnXRZLJRvuIFFmoFjKEfYjUbHtaeI2RjnrZIYZSMrNqd1ZoT95Xiv
         ckjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cuoU1kSVf8VEBS5kxyG+ti9eeLYydPT4J1CXt5LwLhU=;
        b=k5G9a8wN0x4Bz+uTx8SZmbVFp9wOxI6IV2Sl4LQOxhETNsdUgiXzbpEwnesiEXXz6S
         Med+uUG3l3J1RcLs6MWHV8p7DZG1SNBXnJw8MPeGjq/kwkvJ8ziI0stCGW7xa9eCHIVO
         owBzCa47ME8B+TbzQ9/GV5Vdus2CfXfI4jIK+cXnZXTIgl1L9drDmhCuhlenKh4LAG/a
         FNQ0Uq7NlkfkkOzPRRwnyWUbheuqpmVTSt2z9yRo5JTf2sSfYiOKH3tTICT5vvECLAnE
         xOChd+NjD4/vufCSnR66vCVAYPjJ8KBf8AA+xNmbl//ickTX7SLXiVUzYl9bsenpGq4e
         /Lqw==
X-Gm-Message-State: AOAM533cfA+72zdGGsRDy76lembF5HU4eY20XPOAJdfR9/WiPAG4zNuI
        m/vT7RQNXR9P7/4m48grWCDY0A==
X-Google-Smtp-Source: ABdhPJxIe/y2ZbNmKFx3Owc3D12ozpXuX/TsxcZP+iWHDA2M91qfr82Tlpg84wHwV/O7VsilCNZp4w==
X-Received: by 2002:a05:6870:14d5:b0:ec:ab0e:d106 with SMTP id l21-20020a05687014d500b000ecab0ed106mr469524oab.65.1651263471218;
        Fri, 29 Apr 2022 13:17:51 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id w12-20020a4ad02c000000b0035eb4e5a6aesm1130791oor.4.2022.04.29.13.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 13:17:50 -0700 (PDT)
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
Subject: [PATCH v8 2/8] mm/mmzone: Tag pg_data_t with crypto capabilities
Date:   Fri, 29 Apr 2022 17:17:11 -0300
Message-Id: <20220429201717.1946178-3-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220429201717.1946178-1-martin.fernandez@eclypsium.com>
References: <20220429201717.1946178-1-martin.fernandez@eclypsium.com>
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

