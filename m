Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECD6CCA47C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 12:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243683AbiFGMZ4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243646AbiFGMZ4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 08:25:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23017CE3E
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 05:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654604754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mf4QQ8b/9HcGL5J+sznsLy7f+ZtpXa7DM56pD/5wHRY=;
        b=eXJ9N+Cg7DMxXx7emkv4BgnaqjyRPf01f3mP842tAzxcq/992S0rnbhsvpSHHvKNqXRMXa
        XDnkD/EJyopKS5N8d1bVvkAcv6g9mSwzTl99a98bve0yfzTgrVvdp/MF6CIh7gJE53UYAT
        rMxfZ0L2tjawYYOyzRiC0owdQk4YM/4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-G-8UyXehM_KaAv1WT-aYaQ-1; Tue, 07 Jun 2022 08:25:53 -0400
X-MC-Unique: G-8UyXehM_KaAv1WT-aYaQ-1
Received: by mail-wm1-f69.google.com with SMTP id j40-20020a05600c1c2800b003972dbb1066so12699548wms.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 05:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Mf4QQ8b/9HcGL5J+sznsLy7f+ZtpXa7DM56pD/5wHRY=;
        b=woJxrcuNp1x/tleCj6GNSsC24BWsOHHajrB2Xe4LpeGVtmumI5zeQ1JW5zYzZUkIIs
         lKSaYfPe+mi+PwQgQ5UKl17Hc8zwPotZD8zRfuZkR6l+ob3ve4kWDljEs4Pve/MQ88Pb
         OykWbQ9XBj6MJCc3tWui5fZjMUtwDKcyRxaVAUNpscbxkz02rUq7Vgy6XI9alMcSlhze
         +jQgfQ5JG8rzyJmmRR4pv/0kcTKmlu1MFhq2HFt0kCRqqPYJalztxUuYeneQ8/uxtukf
         b4ih6jbvLKtc02iWOZpCWzAaB/kQHbmUtHWGmtb265pNORxgPW6gaaafafM9AjyY7Hcs
         7/PQ==
X-Gm-Message-State: AOAM533W3EXKaH3RgTaZ38s2HH4XF/UifMLzSzOwRDL8cQGrqs7Reonc
        tjijSRnWVOJ28yvLc/nqdv6Y/iqFMKhkJ2iKU5AqCj05beiKS2WueafsP+iapQHhvxUBMxms3Fa
        jOa96DN1z1tMN9IbgBjcRnfHrSMAZgIPqng==
X-Received: by 2002:a05:600c:190d:b0:394:8241:6454 with SMTP id j13-20020a05600c190d00b0039482416454mr29078102wmq.198.1654604751329;
        Tue, 07 Jun 2022 05:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEuwOaCR67pR222FFFc/vDtB6DVVouzt2vgnHsRtqi2r3pc13yypWYxPfO2mRuKCd4JmPjUQ==
X-Received: by 2002:a05:600c:190d:b0:394:8241:6454 with SMTP id j13-20020a05600c190d00b0039482416454mr29078055wmq.198.1654604751070;
        Tue, 07 Jun 2022 05:25:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:500:4c8d:4886:f874:7b6f? (p200300cbc70905004c8d4886f8747b6f.dip0.t-ipconnect.de. [2003:cb:c709:500:4c8d:4886:f874:7b6f])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c4f5300b003942a244f2esm26245306wmq.7.2022.06.07.05.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:25:50 -0700 (PDT)
Message-ID: <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
Date:   Tue, 7 Jun 2022 14:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
Content-Language: en-US
To:     Wupeng Ma <mawupeng1@huawei.com>, corbet@lwn.net, will@kernel.org,
        ardb@kernel.org, catalin.marinas@arm.com
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        dvhart@infradead.org, andy@infradead.org, rppt@kernel.org,
        akpm@linux-foundation.org, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
        keescook@chromium.org, songmuchun@bytedance.com,
        rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
        swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
        anshuman.khandual@arm.com, thunder.leizhen@huawei.com,
        wangkefeng.wang@huawei.com, gpiccoli@igalia.com,
        chenhuacai@kernel.org, geert@linux-m68k.org, chenzhou10@huawei.com,
        vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220607093805.1354256-5-mawupeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 07.06.22 11:38, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> For a system only have limited mirrored memory or some numa node without
> mirrored memory, the per node vmemmap page_structs prefer to allocate
> memory from mirrored region, which will lead to vmemmap_verify() in
> vmemmap_populate_basepages() report lots of warning message.
> 
> This patch demote the "potential offnode page_structs" warning messages
> to debug level to avoid a very long print during bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  mm/sparse-vmemmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index f4fa61dbbee3..78debdb89eb1 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -528,7 +528,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>  	int actual_node = early_pfn_to_nid(pfn);
>  
>  	if (node_distance(actual_node, node) > LOCAL_DISTANCE)
> -		pr_warn("[%lx-%lx] potential offnode page_structs\n",
> +		pr_debug("[%lx-%lx] potential offnode page_structs\n",
>  			start, end - 1);
>  }
>  

This will possibly hide it in environments where this might indeed
indicate performance issues.

What about a pr_warn_once()?

-- 
Thanks,

David / dhildenb

