Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11EBC07E9C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jul 2021 18:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA8FA611CB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jul 2021 18:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhGLSr2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jul 2021 14:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235629AbhGLSr1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jul 2021 14:47:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03B4C0613E8
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jul 2021 11:44:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q16so8979490lfa.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jul 2021 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PiEei4/RLF9jTsxsrsUBV60BJotPkybau7lkhBzo5/I=;
        b=s5pTurZ13T3fHlyrCaThZOVUofr0Cky2/zld5yC8l0myWNX69BvnBNc9Opj6HMkCfc
         y3CjiuyOByMOeSBVV+o4qu5xJGAw4E/i0pQADCVD/2UOoJrIHi3478hpZZLuoqg1WGst
         OcCnt2jSO0vJrOopZchNBQ9+MjglGj0qNJPE/zKAtnQq1YJa/gtnDpyh4R1JAsZBUefy
         UEn4mtsvyV/dfykaoHSxiB9rtcJ7XqsA3Zf+EHYgfdQgNtp/YlSs2jWfDZvn7iwNgCp8
         ndBvPbOGbkTvsCYluNITw35znBdI+ATFOMw1rixRW4qkI/Kx/zacoIs85goZ2XGThimw
         JBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PiEei4/RLF9jTsxsrsUBV60BJotPkybau7lkhBzo5/I=;
        b=lof4l9kKVIok/tHFZShGoT28XabSvl0mombVc5AmBNr6AVWNKU5QOIzL4YazGY9Oli
         RfFUUd1IovaWXZqE+AZ0UfRPykME16vODFUwnNsrI8UlAbhJaqs5p6Vyupet8TiJk0MH
         OwT0vtHWSpCFrWMMCsK1kOAIwP9BnuAk6hJ1Ws2kMnflGYvYhGtM+91aL/xLI+BacgbB
         n9EGRiideqOVJkmCDwcURwUjvK2+BPxaOQ+nnVYBX4bW/O1tHYeHpjIpALn8RSORbew7
         OVPB7+atESteH+OH56zQzl/clgo/8iGDBVwKjFXiuoFj0PIYPj1BPNbkavwDsAbIWZrR
         dP1g==
X-Gm-Message-State: AOAM531tI+5nQyASUNIBYuBQWjGLr9YZSBHwl00Wdo2kt7n84POWTHEt
        Ff21/G5xLsgzx0U7kprQtlh4U6RLbhKY6PBK6XyCSg==
X-Google-Smtp-Source: ABdhPJw+0tMpJcSV02e9y5OpgohRH2ByLJzW2eRxTjnkHhxkF0WhBTLMKzB5LpXi+sxeGsfF6oUSnjAO+65wVmAaEuA=
X-Received: by 2002:ac2:5b1e:: with SMTP id v30mr136916lfn.226.1626115475779;
 Mon, 12 Jul 2021 11:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210707183616.5620-1-brijesh.singh@amd.com> <20210707183616.5620-7-brijesh.singh@amd.com>
In-Reply-To: <20210707183616.5620-7-brijesh.singh@amd.com>
From:   Peter Gonda <pgonda@google.com>
Date:   Mon, 12 Jul 2021 12:44:24 -0600
Message-ID: <CAMkAt6quzRMiEJ=iYDocRvpaYuNcV5vm=swbowK+KG=j7FjyKA@mail.gmail.com>
Subject: Re: [PATCH Part2 RFC v4 06/40] x86/sev: Add helper functions for
 RMPUPDATE and PSMASH instruction
To:     Brijesh Singh <brijesh.singh@amd.com>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev,
        linux-mm@kvack.org, linux-crypto@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sergio Lopez <slp@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Michael Roth <michael.roth@amd.com>,
        Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
        Nathaniel McCallum <npmccallum@redhat.com>,
        brijesh.ksingh@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> +int psmash(struct page *page)
> +{
> +       unsigned long spa = page_to_pfn(page) << PAGE_SHIFT;
> +       int ret;
> +
> +       if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP))
> +               return -ENXIO;
> +
> +       /* Retry if another processor is modifying the RMP entry. */
> +       do {
> +               /* Binutils version 2.36 supports the PSMASH mnemonic. */
> +               asm volatile(".byte 0xF3, 0x0F, 0x01, 0xFF"
> +                             : "=a"(ret)
> +                             : "a"(spa)
> +                             : "memory", "cc");
> +       } while (ret == FAIL_INUSE);

Should there be some retry limit here for safety? Or do we know that
we'll never be stuck in this loop? Ditto for the loop in rmpupdate.

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(psmash);
>
