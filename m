Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAC6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 06:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B7C460FDA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 06:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbhJSG3f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 02:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhJSG3e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 02:29:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A03C06161C
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 23:27:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x192so4987603lff.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Hz18V9cmevixb6yPJp+xhm9+FmsVtQxvQp4KWS9Xn0=;
        b=MaQGIQasM+dLV7KwlcsE5Cl9HFetE/vzwFHktseUxeQcmw5PdeCbgreOiQxEbNmFt4
         dnLQIc2SvagaUe91R1lrfZl+mhDwAH/5cNO7uFEDcK1cxss/qgvbSTzqirsdRKsLf/ix
         x+1OQif8898d3tVTgUGcnvsSybigNO3qRv1Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Hz18V9cmevixb6yPJp+xhm9+FmsVtQxvQp4KWS9Xn0=;
        b=jMn/5+sAQxhHtSpxaKj6mH2hdcGaSDdm8LFmAYhUUploIqA/NcTGJQjS1eNF083kP0
         /cDmJb4j6BrqIeM2DPkacwU2J71HrM5bXZIZiGVFCH82LIygMbPA+rW0qYlrffQq3ob0
         hX6+rxhM3cDHdPdeTmAIvZetTTyhnQf7mmXK+/1B7QCrDE1iOmJJKNJuYnBUx9uP6rU0
         F2WLNm3MJYMSy6EltLtJGFshVWkAphL04kBK8WcYcAuwIBjccLxcXmoc16KI1Wpuq6Yn
         r0FgLP+xks0llyCl1hTDByxVggTrVXohY2IxdLOQJhB76VckqZwxLCpUnSCDxQzMCSdF
         bRuw==
X-Gm-Message-State: AOAM530Eva5VewJ+MXZ5BINpfDasU/nC9FjgsE8T82h46rx7omxxCWY9
        9wRkqrURBKL2PRM1bSbiVORyy64Wid2nq4Xw
X-Google-Smtp-Source: ABdhPJycyxG0p/uVAxmlCdwijzRWXqJ8TMiDNLyqlPbODfLQJVSOFRC1M5xgqaKOGdLs3wNDBZA+Rg==
X-Received: by 2002:a05:6512:2309:: with SMTP id o9mr4419023lfu.75.1634624839458;
        Mon, 18 Oct 2021 23:27:19 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 13sm1583837lfq.69.2021.10.18.23.27.18
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 23:27:18 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id s19so4087142ljj.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 23:27:18 -0700 (PDT)
X-Received: by 2002:a2e:1510:: with SMTP id s16mr4766664ljd.56.1634624838613;
 Mon, 18 Oct 2021 23:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
 <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
 <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
 <CAHk-=wjwOnrHXDSqnmhiKujk=5XieJFvfnQwc2WKOKFwzcqvaA@mail.gmail.com> <YW5Q253s0Y+zYxdi@archlinux-ax161>
In-Reply-To: <YW5Q253s0Y+zYxdi@archlinux-ax161>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 Oct 2021 20:27:02 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi-UJAGo6uwYx8XKydSEsnQ33mW4t+kUnb+CNY+Oxobjg@mail.gmail.com>
Message-ID: <CAHk-=wi-UJAGo6uwYx8XKydSEsnQ33mW4t+kUnb+CNY+Oxobjg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Tor Vic <torvic9@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 18, 2021 at 7:00 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> For what it's worth, the suggested fix is the '||' underneath the
> warning text:
>
> In file included from arch/x86/kvm/mmu/tdp_iter.c:5:
> arch/x86/kvm/mmu/spte.h:318:9: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>         return __is_bad_mt_xwr(rsvd_check, spte) |
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                  ||
> arch/x86/kvm/mmu/spte.h:318:9: note: cast one or both operands to int to silence this warning
> 1 error generated.

Hmm. That's not at all obvious.

The *much* bigger part is that

   note: cast one or both operands to int to silence this warning

which is what I'm complaining about. That note should die. It should
say "maybe you meant to use a logical or" or something like that.

> Perhaps that hint should also be added to the warning text, like:
>
> In file included from arch/x86/kvm/mmu/tdp_iter.c:5:
> arch/x86/kvm/mmu/spte.h:318:9: error: use of bitwise '|' with boolean operands; did you mean logical '||'? [-Werror,-Wbitwise-instead-of-logical]
>         return __is_bad_mt_xwr(rsvd_check, spte) |
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                  ||
> arch/x86/kvm/mmu/spte.h:318:9: note: cast one or both operands to int to silence this warning

I don't understand why you seem to continue to ignore the "note"
message, which makes a completely crazy suggestion.

                 Linus
