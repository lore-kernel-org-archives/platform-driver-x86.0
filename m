Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA3BC07E98
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 09:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A36613C2
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 09:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhGEJGP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Jul 2021 05:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhGEJGP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Jul 2021 05:06:15 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EEF0C061574
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jul 2021 02:03:38 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id m1so22810355edq.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Jul 2021 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4IBVSwu5GomtKJRSCgsvXFvZd61ehj48dOdrbBGoQkI=;
        b=Iw5UyVuiT7T2SjC4qNDSYnI2kvyQmEgiMDvaIdmuIuqETt1QQCvJA5r5rxTfpJe1GH
         1lK8SJKtFd7YyWAtkd1dEAyNAFXAxzLdld41BB1cS86zdvOGAHLf6vKd/BPnEmGD7RN1
         VtgaOmY6t3uC7HeKGgj5QHAV2Kc9sPZi0M37HzU9u5wBMDxrpRvTZqwQQB2YMK9qGkN/
         Q7+Yopjedy+ZecY784XOCGp1hTeAT2tITcjMEStG4HLtHr0YV+gmKa0tOE5VJLT08LLk
         Itb2EnnzJcMDVwrJ19moKF/SzTzxeUZeT7OBojPRl9+qxP16o9xEsKV9USwrKm8SvXH5
         MmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4IBVSwu5GomtKJRSCgsvXFvZd61ehj48dOdrbBGoQkI=;
        b=SPOlhj8VbzkAyJ1TcaK5lAeGKZ9oEN966p6tF2UqLKg5U7gLjoe/n0k27gQKCdTrUz
         Ha5Dd02IjQYpMKU7gcIKkEN0nA9sA1b1NIK3XIDDJ2Q6UOclz5bmZzBJHd6fYPCBplTY
         E96kP56mAF9T1vI1A8mPYeNxBW8sJvbAOwFGf3nYhxzMGxtol3Nf4JeYYZsjqivTSP8z
         6qMn0vaPsA7fjyZuNyWYlVd8ESo2lp4f/JoHzeBy5wT9VBe8WEpLg+3Ksqy5Ob5sSDh2
         LQ+qBbCbfV/u/PrOua9ji7AMwP/RljMCOLga4TQfeGzW/2qjjnl0/dgG8dG51sDKaKBY
         8IDQ==
X-Gm-Message-State: AOAM5338YuwqxvcWxQNj5gf6otSAKQdlwxw7pcSutvSZzZDQoODegoH/
        FFxiZfnEHAxQy+Vs3nAwNJppiMorw2RRrgLFoMtlFQ==
X-Google-Smtp-Source: ABdhPJzI4o7DR7HHYlcIPJSNkB3+ccsaO+zAIBEfCuedleNNnkuXHg5/ZOBvalxkeIrnb/TgJCGHyTDQdp8E53c5Ccg=
X-Received: by 2002:aa7:cf93:: with SMTP id z19mr12462002edx.214.1625475817209;
 Mon, 05 Jul 2021 02:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <YL43SrZ8N8H+ZHE9@black.fi.intel.com> <YMdw6WdEQdGATBNJ@smile.fi.intel.com>
In-Reply-To: <YMdw6WdEQdGATBNJ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Jul 2021 11:03:26 +0200
Message-ID: <CAMRc=MfphPFqCaBRG6jLUFUwOB3_HTA73WXoCBg5S9GagTDeaw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.14-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 14, 2021 at 5:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jun 07, 2021 at 06:12:10PM +0300, Andy Shevchenko wrote:
> > Hi Linux GPIO and TWIMC maintainers,
> >
> > This is GPIO material for v5.14 cycle. It contains some stuff that other
> > subsystems may take due to dependencies. Consider this tag immutable.
>
> Bart, any comments on this? Can you, please, pull?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Hi Andy,

I was looking for you PR for this cycle and couldn't find it in my
inbox. Somehow this went into spam. I'll make sure your email never
goes to spam again. Sorry. I'm seeing Hand pulled it, is that right?

Hans: did you take the entire thing?

Bart
