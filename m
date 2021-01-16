Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896FAC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:43:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48A2B22262
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPUnm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUnl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:43:41 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34920C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:43:01 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id g15so8386688pgu.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WbYcwSDBb2tKhKrqOicdx6cvMEE9jUdqIuimqhM9yic=;
        b=QVQ++bCmXpt7nwh1/QNz/dDDPNDBNwn9JXd0h8Ma5yE4dtmSQmNMlT4DTfya49R+yn
         3q19qr+7GSQaZaO8O/MvYY+ql7W+qQ7wjAsDsY7lPwad0EF23ybQ0QJOrxX4+HalCrXJ
         tPCVpucaC2CF/KqUyAkc9APeF0UNY940Ld10Abzj0cLrQNpwQYRGe8tZNH+mXx61haoH
         0mZ+l8xR6wY5bbqJGGK3dJv4lHuzlIGtGtlj4UJXq64uXuxetk22i5kcUn5RnM74Dc30
         XUor9nhjIY6PSybu1GegKdyfoC7zY0H2v2mMq2vtbnFic+jCHl8zgOzTfXn55i7kVQdd
         l+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WbYcwSDBb2tKhKrqOicdx6cvMEE9jUdqIuimqhM9yic=;
        b=rrbG+33gsQaaldSu6qcJGFmcu5bbP6gV+fWEBik0RgJ+9engGcSUYXnGUQxbTqNwAn
         E7vgCMizci2lml3QWLvOd8ECcihBkjaDISkAPrY21G2aE9dgvaJu4CG4RtaTxoTfX8xA
         zBQqX6tR8B9Nahp3cuvhwtuNhkZ8loPQZc+i36gqRLSz/qeUncCyNfEUxfzznVZvLzRR
         Vo7OpnXL7hpyeHPaQ4uhMlNKeAfCIyWzV0V/oGKtM+K8FuK/Upnh48tYy6OUpzZMpF72
         P6xxtHxM37J6gRd9gEK2lBfgzNF/zxj7cJiZs6hZL/i4od6CM28TSyKjtgtV0F2FcDmB
         ctHg==
X-Gm-Message-State: AOAM532mwSUK7BN/ieGGN2yVc3T+ztvtiXNjNcd/9IMsbGu/7q+1vlH9
        EoZ2b4tR2OiJcdxTTA8viEaB72PF+WT1u94G7NkAZRUxi/exiNjs
X-Google-Smtp-Source: ABdhPJyRG+lxKwCxzuT7UAh2sQ4nfYhL9Fvr6aXMmemAgktCnTAk6R+pwaJPqZlAHlF8VsI6FSOWHfaOs/h8WmcudqQ=
X-Received: by 2002:a65:644b:: with SMTP id s11mr2780510pgv.4.1610829780248;
 Sat, 16 Jan 2021 12:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-9-pobrn@protonmail.com>
 <CAHp75Vf-a4D0u6dmJso6jkHCXyCYGm-MFTgM08y2E_OiMr3qFg@mail.gmail.com> <NStEFinV-Kv0jDbXxLVig-6zyCjJmyjZkDDeZR29ZJrg_n4jkTBONiDde-4T1dId-t5HADf_QmVjs8LBQU601IDKwshLrQDKWiLGhAe2XFc=@protonmail.com>
In-Reply-To: <NStEFinV-Kv0jDbXxLVig-6zyCjJmyjZkDDeZR29ZJrg_n4jkTBONiDde-4T1dId-t5HADf_QmVjs8LBQU601IDKwshLrQDKWiLGhAe2XFc=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:42:44 +0200
Message-ID: <CAHp75Vfgyy_awJB2MOvM=8rju6o-ZGLmtPbfsVBC68OowQvNHg@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] platform/x86: ideapad-laptop: convert ACPI
 helpers to return -EIO in case of failure
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

On Sat, Jan 16, 2021 at 10:28 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> > On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze wrote:
> > > ACPI helpers returned -1 in case of failure. Convert these functions =
to
> > > return appropriate error codes, and convert their users to propagate
> > > these error codes accordingly.
> >
> > ...
> >
> > > -       int val;
> > > +       int val, err;
> > >         unsigned long int end_jiffies;
> >
> > Perhaps in this and other similar cases switch to reversed xmas tree
> > order at the same time?
> > [...]
>
> Thanks for the review; I intentionally tried to make as few modifications
> as possible in order to achieve what I wanted. I deemed it better to
> place all "coding style"-related changes in their own patch (19).
>
> I would prefer to keep it this way. Do you have any objections?

Yes I have. What you are doing is called ping-pong patch series style,
which means it introduces / doesn't fix the (side) problem in the code
it provides.
It has no difference in this patch where to place a line which you have cha=
nged.

 +       int val, err;
         unsigned long int end_jiffies;

is the same as

         unsigned long int end_jiffies;
 +       int val, err;

I don't understand what "few modifications" you mentioned above?

--=20
With Best Regards,
Andy Shevchenko
