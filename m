Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C7AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 03:38:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88E0F60F9E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 03:38:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhJSDkm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Oct 2021 23:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhJSDkl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Oct 2021 23:40:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD14FC06161C
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 20:38:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id n7so3519361ljp.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 20:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/Vo8naa2pVOSCfV4UFA2BJ46wmQrSEVSsBZouXgR8Q=;
        b=TBqUPv05LF6J1Ap/h7Pz9XJiHiK0IslnX+9wn7xlIvHPKYKx/hZE2OdYd8/tUHUJiY
         5A0XsyYfcM8kS3aHiGgfpEG+nkoekDVqu2WkEHgchyxUgt84AkSR1/G59wXD3IbW6RJ1
         4qij4MWM98pZd9rp8BkYS9iuIRoGDWcJuG/YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/Vo8naa2pVOSCfV4UFA2BJ46wmQrSEVSsBZouXgR8Q=;
        b=osop6BXGWYTv+mC+Zyfh03f/cSIpZarG9b6bho+r3ic4S+FOXhE0twWdQctQNGYO8A
         8SlqhZb7BbcGXvqn0BzSqw6uq9E3qIbH17PuVnFGJyhKXdUG+SdixZcLaZo5IaDV257L
         PcnlUyn2v0/S3GR2Zc2z7sth26yvtcBYzyUJRIPyQgzSKg8qkFyaVWlomzKwHuhungoY
         97azjV/XiWYM1hv/k1dkmN3G4xalG/7N1nbB4BQxBdhnCw/le6jR7PuP/YdTL4Ae6/FR
         3+T0Ar4686BBSorE0RmPUW8FLemHaPvM2kmEhghN49sc3DybTDvO66tAbdekUzQNny+d
         L60g==
X-Gm-Message-State: AOAM530wxcRyzPYDO8RTY23SHdhsUahEAsxH03VUC8hbyCRKX7SnEC7m
        0Y1znEhXEmxZeG4TMc5j98t1YV/LUUXof1DY
X-Google-Smtp-Source: ABdhPJynF7qWlr6kIgA/pZTzhvgMHdWkaiOnSci91ompf727CS4M0Dqoesm2T88ORJwop02d2wbJoA==
X-Received: by 2002:a05:651c:12c6:: with SMTP id 6mr4047602lje.256.1634614706909;
        Mon, 18 Oct 2021 20:38:26 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id s11sm1548661lfd.95.2021.10.18.20.38.25
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 20:38:25 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id z11so4342332lfj.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 20:38:25 -0700 (PDT)
X-Received: by 2002:a05:6512:12d4:: with SMTP id p20mr3786322lfg.280.1634614705218;
 Mon, 18 Oct 2021 20:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
 <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com> <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
In-Reply-To: <CAKwvOd=wGjd_L1703Y9Kngcr9-_wTvcRLToiydXYkR=S_9xWDw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 Oct 2021 17:38:09 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjwOnrHXDSqnmhiKujk=5XieJFvfnQwc2WKOKFwzcqvaA@mail.gmail.com>
Message-ID: <CAHk-=wjwOnrHXDSqnmhiKujk=5XieJFvfnQwc2WKOKFwzcqvaA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
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

On Mon, Oct 18, 2021 at 10:14 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Right, the patch that added the warning explicitly checks for side effects.

Well, it's a bit questionable. The "side effects" are things like any
pointer dereference, because it could fault, but if you know that
isn't an issue, then clang basically ends up complaining about code
that is perfectly fine. Maybe it was written that way on purpose, like
the kvm code.

Now, it's probably not worth keeping that "bitops of booleans" logic -
if it is a noticeable optimization, it's generally something that the
compiler should do for us, but basically clang is warning about
perfectly valid code.

And what I find absolutely disgusting is the suggested "fix" that
clang gives you.

If the warning said "maybe you meant to use a logical or (||)", then
that would be one thing. But what clang suggests as the "fix" for the
warning is just bad coding practice.

If a warning fix involves making the code uglier, then the warning fix is wrong.

This is not the first time we've had compilers suggesting garbage. Gcc
used to suggest (perhaps still does) the "extra parenthesis" for
"assignment used as a truth value" situation. Which is - once again -
disgusting garbage.

Writing code like

        if (a = b) ..

is bad and error prone. But the suggestion to "fix" the warning with

        if ((a = b)) ..

is just completely unacceptably stupid, and is just BAD CODE.

The proper fix might be to write it like

        if ((a = b) != 0) ...

which at least makes the truth value part explicit - in ways that a
silly double parenthesis does not. Or, better yet, write it as

        a = b;
        if (a) ..

instead, which is legible and fine.

The clang suggestion to add a cast to 'int' to avoid the warning is
the same kind of "write bad code" suggestion. Just don't do it.

             Linus
