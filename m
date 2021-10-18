Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Oct 2021 19:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E3926112D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Oct 2021 19:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhJRTns (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Oct 2021 15:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbhJRTns (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Oct 2021 15:43:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52835C061745
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 12:41:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u21so2087685lff.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItTJzIFWSeB5rmBU+FendnKoekV76l/1a/X4v9add+Q=;
        b=H4wXr5SRERJdoNSWITjR7bS9JJ8gLITCpg+vMJXq4qXSwFNbSx+gnHK00Jms65B6jT
         6Yv6vYSSgJewe1TqJXzXQnFNcavuIwp7zfz/BmMtcec0LgF/iFtBPT749K8tZ6/mkEEz
         q4Dmw54k4oY18+0+EyRdL5k2D8dBprCxl9S4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItTJzIFWSeB5rmBU+FendnKoekV76l/1a/X4v9add+Q=;
        b=DkQ1PWQwPzburb9LOM63y4FJFvNIkQ2UWAmHZHLz2aFoU71LomaWygsZPoIA/31z02
         xn77sFongNwk3SZiR0M8qfLcq8dSf1QQdS6uT4Xc62fyJ8hqmUEs+otXar9XuNSc6N9L
         XWZEacGIO8OLMMsUsSfmPWV/SJsCfmsWp0svQiCZxkvrIfMDotO7pDvAk3alHYOFB+Jz
         ObNtqWUm80QxCKKnYFBFmlgL9fIcBTIeQ9bFgnc4d5ERgDEbXmxKJRZXfuZuNpdOpg1b
         0DMcntqTxhTd8beEIapjikEQVXrBNHiBfBhVePtLiu7R2T2h72/L+CHoJ6di13OeViO7
         35vw==
X-Gm-Message-State: AOAM533hnWvYhtln8HH5NcQIFisyB+mS8Yrz/+tXIZsRscm1o0Llzw4+
        +ggvCvg8MZaoOIz0fX1hOaSUIXH9cnC6wrH2
X-Google-Smtp-Source: ABdhPJxlGZoi+bOVYURQo38+Z1piiuAYgSdIMqBNsZstSfaMobYTCCHt6Hd6ZhdtWVaA7gSsU6Wycw==
X-Received: by 2002:ac2:4e85:: with SMTP id o5mr1655220lfr.346.1634586094126;
        Mon, 18 Oct 2021 12:41:34 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id c11sm1475729lfm.223.2021.10.18.12.41.31
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 12:41:32 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id u5so1707851ljo.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Oct 2021 12:41:31 -0700 (PDT)
X-Received: by 2002:a2e:5cc7:: with SMTP id q190mr1848523ljb.494.1634586091557;
 Mon, 18 Oct 2021 12:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211018182537.2316800-1-nathan@kernel.org> <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
In-Reply-To: <CAKwvOdn4_DrgaZoAo-v7CbYurNUpfAK5tnzT023=WCDzkmYQVg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 Oct 2021 09:41:15 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
Message-ID: <CAHk-=wi7hUsTTcmPfZCkUEw51Y3ayq3JJxzFsNgodsxxDyk9Ww@mail.gmail.com>
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

On Mon, Oct 18, 2021 at 8:34 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> LGTM, thanks for the patch! I guess this would be the first
> "interesting" case this warning has found in kernel sources?

The patch looks obviously correct (tm), but I'm not convinced that the
warning is actually all that interesting.

The thing is, using bitwise operators for booleans is _exactly_ the
same as using logical ones as long as there are no side effects. In
fact, any compiler worth its salt will already convert some cases
between the two as an optimization just as part of code generation.

Of course, that "as long as there are no side effects" is the big
thing - then the short-circuiting of the actual logical operations
clearly matters. But that wasn't actually the case in this situation
(or in the kvm situation elsewhere).

So in both of these cases, the difference between "|" and "||" ends up
purely being a hint to the compiler.

In this case, even if there are no side effects, it's clearly
pointless to do the second strlencmp() if the first one already
matched, and the "||" is unquestionably the right hint (and honestly,
most compilers probably wouldn't even be able to tell "no side
effects" because it's a fairly complex expression - but since it's
inlined and uses compiler intrinsics, the compiler _might_ actually be
able to see that the two are equivalent).

But no, I don't think that warning is very interesting. In fact, the
warning might be overall detrimental, in case the hints were
intentional (like the kvm case - although I'm not convinced the kvm
hinting was actually meaningful).

                 Linus
