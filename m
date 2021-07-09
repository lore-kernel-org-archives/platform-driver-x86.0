Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F29C07E96
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Jul 2021 02:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 868D66146B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Jul 2021 02:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhGICHe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Jul 2021 22:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhGICHe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jul 2021 22:07:34 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8039C06175F
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jul 2021 19:04:51 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id i16-20020a17090acf90b02901736d9d2218so207188pju.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jul 2021 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BVmgiSoeAePhBmCLdjFJeAKj4gM8pZI9jJIBMA1d9SE=;
        b=nOy3S+hBH8Tk3VPQtRsr4FS7vHvTjqKKF3q4j4/Iz3rEow5ZwXTSH+1Eq1Qyct6jfd
         cRwQhXijCMaDM3wTbh4tJPpjF8ze2aGBDhHTisQK6YbEsAb/eJAhaXW68YmZwp7pSPKH
         y7obz32V9TCKSYEgGN1EqCp+IuW3akLvlugdeykO+p5b9g/KGZm/BxBG1Sk5VbmVjXD5
         PDj8dOYE98hqeeCiu9Ir5q+0KS07C38eKGmFtACVM/QipVxhtXvhavsADsTRBnHvVQMM
         qxtAh8B59ycVO1ZdQLuY+kzzPslqILg8akcV4XeDYTXQTbtzFvTIRDkHsc58M+8CI/Y9
         KVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BVmgiSoeAePhBmCLdjFJeAKj4gM8pZI9jJIBMA1d9SE=;
        b=SbMiugD4N/c9gB5CUuiggtmzGNSoMnLe51+zrxMP5okgdxZcIQV5LCMvUs0P40gE6I
         e/ohA6i6aEHHYLX1/0yxuG1fHZZbMQDzUPZtRa9Zk115KgiXCz55rHnlnlsK1AbuUTG3
         fo76F4VsZ6TBX6l2os498zEz/FaC3ltAXV282ZX2KHEwwdO8G+TH5k19SeJAKMPKsHd3
         8lRtdrrmsKVyD1h8CXGDBW4B9A4yxLb8xAgYEnrfa5LClcM3eaNGk0RCMmJnipvmv66R
         dN6zmstx30cwIrjdZRMTrp2X1dypDIvMjt7WXwphDDSSTTbfOn+Dxmt2Df22sbCzpfLd
         y++g==
X-Gm-Message-State: AOAM530lT2gGiX7qNwj9Y8i61ScVJbkRvs2Fr23DjV2hpC0ipQljBLsi
        vGrfZHMSCCkwZGEz5bLk0RKKrvgz8Mj/cUxVMDI/hQ==
X-Google-Smtp-Source: ABdhPJyEz8U2pKVhGrHBoDqX+2MQUYuuhUzLeDOKRp5NApgfTOqBP5NVA74Lwy229E9/7syAydM5mL2FNAKSdTbIQpg=
X-Received: by 2002:a17:902:d88b:b029:128:cd59:ead2 with SMTP id
 b11-20020a170902d88bb0290128cd59ead2mr28421140plz.27.1625796290994; Thu, 08
 Jul 2021 19:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210707204249.3046665-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210707204249.3046665-6-sathyanarayanan.kuppuswamy@linux.intel.com>
 <CAPcyv4h8SaVL_QGLv1DT0JuoyKmSBvxJQw0aamMuzarexaU7VA@mail.gmail.com>
 <24d8fd58-36c1-0e89-4142-28f29e2c434b@linux.intel.com> <CAPcyv4heA8gps2K_ckUV1gGJdjGeB+5dOSntS=TREEX5-0rtwQ@mail.gmail.com>
 <4972fc1a-1ffb-2b6d-e764-471210df96a3@linux.intel.com> <CAPcyv4gwsT4rJzemkofk6SP5cAp9=nr5T6vtu+i6wTbU91R_Bg@mail.gmail.com>
 <ca608162-2a48-0816-4302-c2a5b2766a7a@linux.intel.com>
In-Reply-To: <ca608162-2a48-0816-4302-c2a5b2766a7a@linux.intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 8 Jul 2021 19:04:40 -0700
Message-ID: <CAPcyv4jPqv43Hh836bpDUwMYAsPHDrjUhXoJ0Ufgjbqc3h2eyQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] platform/x86: intel_tdx_attest: Add TDX Guest
 attestation interface driver
To:     Andi Kleen <ak@linux.intel.com>
Cc:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org,
        Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 8, 2021 at 6:44 PM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> > One allocation for the life of the driver that can have its direct map
> > permissions changed rather than an allocation per-file descriptor and
> > fragmenting the direct map.
>
> The vmap() approach discussed in another mail will solve that.

Ok, not my first choice for how to handle the allocation side of that,
but not broken.

I'd still feel better if there was an actual data structure assigned
to file->private_data rather than using that 'void *' pointer directly
and casting throughout the driver.
