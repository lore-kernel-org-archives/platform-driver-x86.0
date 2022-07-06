Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D3CC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jul 2022 18:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbiGFS7Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jul 2022 14:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbiGFS7X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jul 2022 14:59:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E94275F6
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Jul 2022 11:59:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id dn9so23376703ejc.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jul 2022 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tmtXzNK0QKaLTy/xaBocgtQlDX9HlPA1KQpwpropMCo=;
        b=b+/fBPGFSwT3fTByFaFmq1vUnY1YN20ZJL4D7woKTixjp87gj2Q0XJuU092Qz2RBrM
         uX366HHMKn9HzWqBGSr2xCjzdTcY+XsULr4SDFoCsyuUkETKVtHOOifv6L3+9HlkhhJq
         pFJGyHh8w2O4IzmVKjHRLRyVfZLA/VSBI9yNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmtXzNK0QKaLTy/xaBocgtQlDX9HlPA1KQpwpropMCo=;
        b=dkOsb+MN2Yc7mxrndQU33mNoVNFtk6idajq/A/YdgGfxy7P5LyvTiwszejPWziRkym
         dw5h0qIcBDLv3nk/RhJDi3ffppxT7aBYChtHVZEbU8yq0FTO+L/ektS3hLlx8wpIxB2K
         OfHk00pOt/kcKhS0+jjpKNgl8NjZFBcH/ckVKDBqPu4Tweum5vlInBiWkbN/kzCepSg+
         daD3MzK87D0jcNMcQ3yX6nj1vywTC/J6xrz9x7yrFIuNSCydHXm0+P77SJ9FoZJdSogf
         NyTF4BWf5S31LA0IjG90yBgcsWABwTaSqEY6HeHJTTRlwdWJFcN+xexU62+h4TTd2qJb
         70Lw==
X-Gm-Message-State: AJIora8RnF56DKHlx+OnNAKFZqUUvCSW1xJbOML/Fe8fZieiMbmm/7no
        TPzfj6eNtKXF2RUhuVtfQup/YLphIJ63Q3eU
X-Google-Smtp-Source: AGRyM1tz/H4QArwCnFon5KPgMcmymDlwco0K7udMj++2UALIlVEAdTloFn3SnT2Ux60Pemeyy7/C+Q==
X-Received: by 2002:a17:906:7a0b:b0:722:dac6:a8ff with SMTP id d11-20020a1709067a0b00b00722dac6a8ffmr41003417ejo.593.1657133961366;
        Wed, 06 Jul 2022 11:59:21 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id q25-20020a17090676d900b0072ab06bf296sm6209339ejn.23.2022.07.06.11.59.20
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 11:59:20 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so9509822wmi.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jul 2022 11:59:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:3a1:68bf:d17a with SMTP id
 g12-20020a05600c4ecc00b003a168bfd17amr88108wmq.154.1657133959887; Wed, 06 Jul
 2022 11:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <272584304.305738.1657029005216@office.mailbox.org>
 <CAHk-=wivGGgs9K_TfQYTW4RzH_C-JVfLZKNA5+hKQU0eNFBeiw@mail.gmail.com>
 <MN0PR12MB61015A04C6E4202B2E8E08A9E2819@MN0PR12MB6101.namprd12.prod.outlook.com>
 <72419963.329229.1657096948079@office.mailbox.org> <8ee1bc75-3ecd-9d87-b7cc-37ba15133026@leemhuis.info>
In-Reply-To: <8ee1bc75-3ecd-9d87-b7cc-37ba15133026@leemhuis.info>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 6 Jul 2022 11:59:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfSg1FNFJXv9QfXXnWFO71YufsoTs9S8sYzonfwjm4XA@mail.gmail.com>
Message-ID: <CAHk-=whfSg1FNFJXv9QfXXnWFO71YufsoTs9S8sYzonfwjm4XA@mail.gmail.com>
Subject: Re: [Regression?] Linux 5.19-rc5 gets stuck on boot, not rc4
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Tor Vic <torvic9@mailbox.org>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jul 6, 2022 at 11:21 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Wild guess, I'm not involved at all in any of the following, I just
> noticed it and thought it might be worth mentioning:
>
> I heard Fedora rawhide added this patch to solve a boot problem that
> sounded similar to yours:
> https://patchwork.freedesktop.org/patch/489982/

Yes, this looks likely, and matches that "starts in 5.19-rc5" since
the offending commit came in as

  ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
removing conflicting FBs")

so that does look like a likely cause.

              Linus
