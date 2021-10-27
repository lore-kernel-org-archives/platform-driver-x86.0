Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225DAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 19:56:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0552F610CA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 19:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243752AbhJ0T6w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 15:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243751AbhJ0T6t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 15:58:49 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93785C061570
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 12:56:22 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id v17so3651902qtp.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Oct 2021 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t1kBW0d9pD6seGnAQ7jq8Ieh+iAytlhqrQvM2gwdu4s=;
        b=FcVCllWOSYajhFKBudg8ug7c8zWuqjMKc4zVNLW2IXljZkVpqdxxgflWKbNUQxAxy1
         rgDvPoQiR/ugBR3TbOFWVqWwKBBECOGpL9ZMPpNvcyoW7g7cFTuaMmIRnum0N1Kaxu04
         CA2fIZulguOPahkfGKjkK+9mnHwW98feJUHA1F1zsEMDPx74NI0ZkP3n1ukzV2WHQY3n
         JV6m17rwAjIQ5N8gbqWlUYFHXoCqBItr071LPrSKiq1sMAutfni03RmtKQvnAmrydVDN
         JyLo2ASFRgVV4iIEpejzczaTuxWPqeIEUuNwzNqnmINYW2X8H3q++Pj6c8/RC1SBrgmJ
         6wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1kBW0d9pD6seGnAQ7jq8Ieh+iAytlhqrQvM2gwdu4s=;
        b=rvVX0plyvuVFit8jMIEeqKiVRFq2JGwqsk/8szdRyNJz1eMaPcJfBUO4NPLr2+SVJf
         Svaorr6ZcLSV+rwiLQ4iEnFuO3xzmywll1b7Dn2klA96qlOdhvSX1/sTTUhSMW76QgrL
         i5mHnfKr+oFDMP1OZib1BPjRcqsxoRS2DkFMDSlr4icnqFow7lCIw7JAoV2QU1o6jz12
         p4Mesmf9D5JJkMKWuKsHbYwVowrAYYTsmP0Cc7C2S+bTRJV708SA6SPQaZg4x3qQQK0e
         9pIlskQ6Ps3+GSGDKjop8mEhQiM/1gM+tJsy7md1aoyvj0L1wEdj8nrnFUS9R4z/q4oc
         KpDQ==
X-Gm-Message-State: AOAM532pTtvMGkzAPsDZy/Sd4nB0cnIHjxrGNGaj2nzlKd0uBcdXmOzn
        vFd3oi2tJszzHFbXvL/JM6gs0Q==
X-Google-Smtp-Source: ABdhPJxFnYBrRFmj8DmNEthepNjBoUGIbPrjTfa+YzWiXvfOdIPDl/puoPwtP3vXUTZtKhi380R2pQ==
X-Received: by 2002:a05:622a:1a24:: with SMTP id f36mr34135057qtb.321.1635364581856;
        Wed, 27 Oct 2021 12:56:21 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id t26sm516651qtq.77.2021.10.27.12.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 12:56:21 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        martin.fernandez@eclypsium.com, daniel.gutson@eclypsium.com,
        hughsient@gmail.com
Subject: [PATCH v2 2/5] Extend pg_data_t to hold information about memory encryption
Date:   Wed, 27 Oct 2021 16:55:08 -0300
Message-Id: <20211027195511.207552-3-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027195511.207552-1-martin.fernandez@eclypsium.com>
References: <20211027195511.207552-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new member in the pg_data_t struct tell whether the node
corresponding to that pg_data_t is able to do hardware memory encryption.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 include/linux/mmzone.h | 2 ++
 mm/page_alloc.c        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6a1d79d84675..998fbe371a81 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -869,6 +869,8 @@ typedef struct pglist_data {
 	unsigned long		min_slab_pages;
 #endif /* CONFIG_NUMA */
 
+	bool crypto_capable;
+
 	/* Write-intensive fields used by page reclaim */
 	ZONE_PADDING(_pad1_)
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b37435c274cf..a19d95bb5c0f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7575,6 +7575,7 @@ static void __init free_area_init_node(int nid)
 	pgdat->node_id = nid;
 	pgdat->node_start_pfn = start_pfn;
 	pgdat->per_cpu_nodestats = NULL;
+	pgdat->crypto_capable = memblock_node_is_crypto_capable(nid);
 
 	pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
 		(u64)start_pfn << PAGE_SHIFT,
-- 
2.30.2

