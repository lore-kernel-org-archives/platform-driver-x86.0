Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9033EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 16:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382103AbiEFQEy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 12:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443307AbiEFQEw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 12:04:52 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FEB69CC6
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 09:01:09 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id i1so7841618plg.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJQuHSIAlHGIpor5c5dPdkEnVxEx8DbE7jmudCub3d4=;
        b=jQ7xZaZTB7N7rBpIHs/0CElGn01l9AQXdNaX6k8jXrAaJqQ25NEB9BM5bbodgfv0cZ
         o8v4laiuonAI3gk+YGqelG0OD+DVySSMRg63uSIqREDRrPhJMR3KSuT35wwaUS8YFYch
         rOrxpkfD5RuaAn4QY/2lg91WF1zOptOKzMP2JKXphcGymjOcFefW0nQQh9kP7UJMY1GG
         OiLAM9wX+KmK/RtQGaobXp58jVCwVZnXJF4OhYZCQMkQfwBS7mr1AOvo0j7jY7pfCkbU
         dUVjbhAvhfetI4VuQjiWvUUR2qZuZOW3KhYQrFs63jjEkTtnpgJAig8xUxU2zRQZBPk2
         my1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJQuHSIAlHGIpor5c5dPdkEnVxEx8DbE7jmudCub3d4=;
        b=6l1O4mmfgMvgYcNHLw+e60lSWEnZ4iMQRy4BuY3zRLltd8teUUzndhmA+8HFx2yOmz
         OE5G+Hpnj9vRlTy26XyDO18NbmeREp1TvJv/fnZi6KIbnAVTiSGSYHMCa7cErtVOIdF+
         2BTQUeYxXIRZEGZUKnvRG3iN9eSAFvsYfh2RrOp5ENbOVAduNLXhAT5b5vGjz6XkTEf1
         675tw7fdOLUctlzydcj7DjXFeoDPWVpE03L7Kmv7Qd/kyAzaHUH9y8BS6LF67heqj25m
         9X2vZC0yMJ+gjvnCPOIkZoYWiFFQZcMr2uowePNZ//7CvOn4T/XOcacWrDywMHda/Qy3
         ewLA==
X-Gm-Message-State: AOAM532IJAvCxXs+Glol241Pz7+xS1pSBdCe8lYKrio+X9hmulyNv6Ii
        OZ2Fpcdk4mgfbFV+6Kb2yeYRoNUaFEbSObEVoBbA7Q==
X-Google-Smtp-Source: ABdhPJzetNCcmtdzsuA7MVysj4PUmFLJT04ZeXbzfGR3fv4T/RqwwNln8yT470KW1ll1x94sH07JlabaHewBC2MmUDk=
X-Received: by 2002:a17:902:da8b:b0:15e:c0e8:d846 with SMTP id
 j11-20020a170902da8b00b0015ec0e8d846mr4360481plx.34.1651852868602; Fri, 06
 May 2022 09:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220429201717.1946178-1-martin.fernandez@eclypsium.com>
 <YnKr+aMf4PspDpHZ@zn.tnic> <CAKgze5YDD02AsrF0yESv2sptZ4qxyTMgCDmnOKcbQWjKQsJRsw@mail.gmail.com>
 <YnUYLDjIThbIz/Uf@zn.tnic> <6d90c832-af4a-7ed6-4f72-dae08bb69c37@intel.com>
In-Reply-To: <6d90c832-af4a-7ed6-4f72-dae08bb69c37@intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 6 May 2022 09:00:57 -0700
Message-ID: <CAPcyv4i73m6iPPfJE9CBdxf-OWGXahvGqvh6G-pqVO=3LB6ktQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] x86: Show in sysfs if a memory node is able to do encryption
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Martin Fernandez <martin.fernandez@eclypsium.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alex.bazhaniuk@eclypsium.com,
        "Schofield, Alison" <alison.schofield@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Ben Widawsky <ben.widawsky@intel.com>,
        "Huang, Kai" <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, May 6, 2022 at 8:32 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 5/6/22 05:44, Borislav Petkov wrote:
> >> Dave Hansen pointed those out in a previuos patch serie, here is the
> >> quote:
> >>
> >>> CXL devices will have normal RAM on them, be exposed as "System RAM" and
> >>> they won't have encryption capabilities.  I think these devices were
> >>> probably the main motivation for EFI_MEMORY_CPU_CRYPTO.
> > So this would mean that if a system doesn't have CXL devices and has
> > TME/SME/SEV-* enabled, then it is running with encrypted memory.
> >
> > Which would then also mean, you don't need any of that code - you only
> > need to enumerate CXL devices which, it seems, do not support memory
> > encryption, and then state that memory encryption is enabled on the
> > whole system, except for the memory of those devices.
>
> CXL devices are just the easiest example to explain, but they are not
> the only problem.
>
> For example, Intel NVDIMMs don't support TDX (or MKTME with integrity)
> since TDX requires integrity protection and NVDIMMs don't have metadata
> space available.
>
> Also, if this were purely a CXL problem, I would have expected this to
> have been dealt with in the CXL spec alone.  But, this series is
> actually driven by an ACPI spec.  That tells me that we'll see these
> mismatched encryption capabilities in many more places than just CXL
> devices.

Yes, the problem is that encryption capabilities cut across multiple
specifications. For example, you might need to consult a CPU
vendor-specific manual, ACPI, EFI, PCI, and CXL specifications for a
single security feature.
