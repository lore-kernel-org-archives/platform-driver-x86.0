Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA13EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94A882087E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbhAPUPZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAPUOm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:14:42 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F29C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:13:47 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id m5so7188664pjv.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Au7F42JgPgjD5nH0ga4bskA4ZUcpo8VyI6JMMUMsX88=;
        b=E9CXyFVWgBqkyKklcwDuj8QQhloH0hhGbb8aLaKRxnU0rv7I0g2Jnbbmyqu4+l6DCJ
         8gnRFvakHY4gUQzTYjCxt5z4R1BCaC4uQalhAsy8uiajgdZhp0v30g7sXBIQ0WKRH32a
         mlUVTUHZr5+1KrszZ3NFExsvvnFpUwcrsMqJyWZwlTZ11tkN2Rs5ci47c+zw7/uaX96h
         GIColf8Vz4sVe9yl/DzTVszG8DKrZgbrcpnSYn5oxHWH3R+ojTDhEOdyY7yNPAoMh0rh
         njqY5vIklPvQYv9CKRIi/0cZtYuN5L5SQKB7OlT/jxOQawAkkGREoXKyrXPY2p8XLwud
         Vofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Au7F42JgPgjD5nH0ga4bskA4ZUcpo8VyI6JMMUMsX88=;
        b=EurISN5ydvLZOJl4VCThzsKaCbGMMYUpA8OpouwPYs7iqdzibsns11/9dKQ+boPE07
         G4JCslAbvnX1hnYRUk8EwhHAkdeeeh1a1nz6N8wRLQn4Rot8hTzTYDSzxOpRt+KntzLI
         Lo5tP/Z96y9xd7qRaUj4vCxZsPE7/zgm530T+fJCNZIXDWhI++Cys9jrgRPCGdyjb9xX
         6NJHvsJCLZdWjqjHjtoazNzGPQP/TblGJthpZWhYc/bGlxADpO27iAkfAMPNtX/R+1ID
         Agrr50iPbso167bYsfYqNiHbnWrw0ba1EgZ1cEcuUXxZzNQfXZ84dDKs7HwERrk4GikN
         0f6g==
X-Gm-Message-State: AOAM531a0yhgUZHTlmdLMxg0j08sunnGppNoYx+JLWa0n/sDCUqNRzbI
        yRTLhSOfJ1kiP68k3efpfooNY5eW0W+NqaVtbs8=
X-Google-Smtp-Source: ABdhPJzJ8jwBp5gRVR2tXAiAAagJQK5ukNGa2M3cnoWkiGH7ZrQ50fmLyzIG++HC7so3jiVn7c1Rw3zfl+jHFysiF2A=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr17720657pjd.181.1610828025470;
 Sat, 16 Jan 2021 12:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-1-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:13:29 +0200
Message-ID: <CAHp75Vffc3h=e3F65C3JnfgmFqqZamGP4GyrER6yrtw5aR2YFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] platform/x86: ideapad-laptop: cleanup, keyboard
 backlight and "always on USB charging" control support, reenable touchpad control
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> This series contains patches that aim to bring more consistency
> to the code; add keyboard backlight control support; add
> "always on USB charging" control support.
> Furthermore, commit 7f363145992cebf4ea760447f1cfdf6f81459683
> ("platform/x86: ideapad-laptop: Switch touchpad attribute to be RO")
> is reverted since it made it impossible to disable/enable the touchpad vi=
a the
> ideapad-laptop module and on some devices the method implemented in the
> module works correctly to disable/enable the touchpad.

I like this clean up series, but it requires some work to be done.
So, for *non*-commented patches, feel free to add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
