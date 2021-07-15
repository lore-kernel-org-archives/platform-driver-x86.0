Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F52C636C8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 18:39:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70D1861396
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Jul 2021 18:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhGOSmT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Jul 2021 14:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhGOSmL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jul 2021 14:42:11 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880ABC06175F
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jul 2021 11:39:17 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id s18so7422259pgg.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jul 2021 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f3Y0+ogDVT6wqAQ9ZQs2NyHc5pJHUCbPNwTdIK9PvNA=;
        b=Qv3S59LCo5Nmv9xeE85vyXWs0GZOA6KpAsz49t1UEOxMwgH2P9Y4ljAK74msMmTt2O
         UNWvggYks0hDjPx8QyMfkCWn1CjZq5S9eiunJ77QL6TXq8rwRbAtkjCrdhgbFBYUHgxn
         L09H6z5RM3mwM5tX1LZl0rsd/lRhtL/FHHzGNIW6VhH3AJY+KQQ3s+h2yPt5segk0grk
         8v5UWFkaC2eF83kmN+zNi9f9KERgDwDm+RB+yjbQirrVge0ZjGQhKibLQ48L41+LPY+j
         7ZDohtKMPav2yX+ZJlS4XbJ63NiCsEP02INCQtD+ISzPHyO6hXsIkY+T4rbRtxzv5vb1
         fVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f3Y0+ogDVT6wqAQ9ZQs2NyHc5pJHUCbPNwTdIK9PvNA=;
        b=s5K04/qiT4cr+ZNe0oet/iqza1uZIm6H0YWPqzIA8WfqdAuUoMs6/SMNdzRX+qCAnV
         l+uVoSWDFT314XSFHm0gZL5k4LyHFGkQzYYZ/PcRfGVF/OFdr+znAIEz58jUISjIKaKe
         FEcBnlNSp5f6vfSKUm7NMjmyy7HFCU7Ti64jmIii4O43LcdIJCuy7kxfEtNt1joL9GwS
         w3tIoYtnTKG2KxT0k4NTj/GNsBoHirfRyO0DD/HTuw4RQF5WuJuXwr/XoMWpgWZjhJa4
         4zPsKhoFutRyuqbtYNPDg/1MHcnyJxI1xvmoFJfVIOjCOY6UFEFi4Shjsh4xET48qT5R
         uSMA==
X-Gm-Message-State: AOAM532wNYG1mNRd9F5Yl1HFa3itcNf4JTkOgS9670vythktnqo3fwx4
        MshOwPvB9mGDgb76SQbeK//AGA==
X-Google-Smtp-Source: ABdhPJz+1iaVBL+ABO/O1tBChzrqhVRnDYERNo2Clv19fhDRGqCjbjbdtc1OIE70QPX9w7Agiv3K8Q==
X-Received: by 2002:a62:19c9:0:b029:32a:129f:542d with SMTP id 192-20020a6219c90000b029032a129f542dmr5859523pfz.8.1626374356838;
        Thu, 15 Jul 2021 11:39:16 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 73sm6267842pjz.24.2021.07.15.11.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 11:39:16 -0700 (PDT)
Date:   Thu, 15 Jul 2021 18:39:12 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Brijesh Singh <brijesh.singh@amd.com>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-coco@lists.linux.dev, linux-mm@kvack.org,
        linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Michael Roth <michael.roth@amd.com>,
        Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
        npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 07/40] x86/sev: Split the physmap when
 adding the page in RMP table
Message-ID: <YPCA0A+Z3RKfdsa3@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-8-brijesh.singh@amd.com>
 <YO9kP1v0TAFXISHD@google.com>
 <d486a008-8340-66b0-9667-11c8a50974e4@amd.com>
 <YPB1n0+G+0EoyEvE@google.com>
 <41f83ddf-a8a5-daf3-dc77-15fc164f77c6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f83ddf-a8a5-daf3-dc77-15fc164f77c6@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 15, 2021, Brijesh Singh wrote:
> The memfd_secrets uses the set_direct_map_{invalid,default}_noflush() and it
> is designed to remove/add the present bit in the direct map. We can't use
> them, because in our case the page may get accessed by the KVM (e.g
> kvm_guest_write, kvm_guest_map etc).

But KVM should never access a guest private page, i.e. the direct map should
always be restored to PRESENT before KVM attempts to access the page.
