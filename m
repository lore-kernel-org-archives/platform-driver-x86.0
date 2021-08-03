Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0CAC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 18:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68A3E60F01
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 18:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238805AbhHCSbL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 14:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238797AbhHCSbK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 14:31:10 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFB8C061757;
        Tue,  3 Aug 2021 11:30:57 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso5977062pjo.1;
        Tue, 03 Aug 2021 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p5iqjTciOiC6yi4s+mjSx7ItW2TPHDqiCWQgXvzLb4E=;
        b=CuorEacKFE5HZK1zFVR8UkMmhrjl8k3iEMPr5QBr60z+j+HWX5jo5SYGXnJtsEn81u
         uGsxejzdxy4rRrfMwX/YwCSSSVrjA6OTz/UAcJGqyuM5bipSGyZSzoAUz0GKgbgVHK7x
         bk/55TQzW/nRN/+sLEZ1AQX3M/hUb8HcZs6GRXgQ9MslnAVSPDkQeCk3Q54dpR5MDMRK
         ige64fepIcc4UAiaMlKlIMaTOlzOUY15k64te6Mr96bVwdxzR82SEVipHuB6+2bMRTLR
         VLVQGB18wclKoMiKvZc4Kban8nKlszsuw9qT2WjKNJY5S52VRBxGhbB5E3Dh/U4VvSmy
         FiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5iqjTciOiC6yi4s+mjSx7ItW2TPHDqiCWQgXvzLb4E=;
        b=aJUhcX3ZVyBIQbfYpHEoi+4VerLJk3jRFnsDika0rp/c8f2bHT7kSRcXmNREQmvAH1
         8buKVk/7BOCxUJUGQSVPtPVkag8dLRANx77Fonn/WUk6WmhBRk+aPeGQBpf7vxWk/Nwj
         /aZFbusqr2eMDxuhUA+ZxDVH/ps2IBu7WHS5dDcLLJPOu3gYGL6bZPv+C5EQB+HDoUw2
         UWAjMCKulW5vtDPGUbGIOh3hBiqjXcSJktFf3lWWk6pPTroHcbu84r1/jZUR4TroDQ8O
         xyN8E2OSZFbh7/g5gbJNYH0+sdlrIE6SbVov77uXqz7mBaZN7zuIU2y+9cRyIWlvi/ZY
         YqLw==
X-Gm-Message-State: AOAM5321BZJ8cXE2UK+D9+KhJs7XlV45Gi1BnB6YP5+YM8OLlATEtrMn
        GslPqEA+6vSXM6C1H5t94z66Zc8jbBPk8nzwNGE=
X-Google-Smtp-Source: ABdhPJwmGcz7zTGVTu8e9UTD3rOBBNeMQLZtw6w4tAJYjDNHnTgb9OguJAlVIzlV5lI6xLFfhbb7XuIKNYHvIMwEwJo=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr5729155pjq.181.1628015457154;
 Tue, 03 Aug 2021 11:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210803181135.22298-1-novikov@ispras.ru> <CAHp75Vde1RAKTCTzmt0eHjNGrKUyi7r1rtNo934WW6wqi9T=ng@mail.gmail.com>
In-Reply-To: <CAHp75Vde1RAKTCTzmt0eHjNGrKUyi7r1rtNo934WW6wqi9T=ng@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 Aug 2021 21:30:17 +0300
Message-ID: <CAHp75VfVCk1ueQZiGnJqwhD=j+zpVZ3Q-GmLMKX9AfP_BFMPNA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Fix potential buffer overflows
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ldv-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 3, 2021 at 9:26 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Aug 3, 2021 at 9:21 PM Evgeny Novikov <novikov@ispras.ru> wrote:
> >
> > It looks like pmc_core_get_low_power_modes() mixes up modes and
> > priorities. In addition to invalid behavior, potentially this can
> > cause buffer overflows since the driver reads priorities from the
> > register and then it uses them as indexes for array lpm_priority
> > that can contain 8 elements at most. The patch swaps modes and
> > priorities.
> >
> > Found by Linux Driver Verification project (linuxtesting.org).
>
> Seems legit.

Hold on, but then it follows with another loop where actually it reads
modes by priority index. Can you elaborate what exactly is the problem
you think?

-- 
With Best Regards,
Andy Shevchenko
