Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC569C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFDDA61059
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241491AbhIBJiN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 05:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245055AbhIBJiL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 05:38:11 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A95BC061575
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Sep 2021 02:37:13 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id c6so968010pjv.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Sep 2021 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qkkddlitalwnd3sPtBgZTSI2C5OyiUFKprO1mHyNYrQ=;
        b=jb4vkpProQA0QNW9K1B+/W8BKlOjoUdinm+cT+MlnSW5h7NcvL7UU0rqKiBo4Tb17N
         aZ1tLcXgXNpMlJ7sA665MwlnjeEtKKFsEAQl7hnoM7lwXqcjA3fkg0nA+58WRz0pQlbT
         CvXuSejB/gEb0zGexdFtC3ZqWlzglGdu3dHRUpTYOEllPpyb3XKXdwLdLl9mOaAegxWp
         4eB3bivIRDZAvJuKUGKTXmAP9S7n8BD8lno6ga70L5jL6A35vLIUtLBl+mA/ngM6nYTv
         qin16OUrT138Qts19QgnMCK2Zvz+FV5w093gAXsRGhWnKLBjHe+WrjOg9/tfvm8dUBaf
         ev3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qkkddlitalwnd3sPtBgZTSI2C5OyiUFKprO1mHyNYrQ=;
        b=gbetceZJHFwRAzhOK8as8TOXOrqlL8MrTjSHp87neQMLpjdUnnRanf4fQQIalj5vnd
         XNJTYJljRDitrnI6mjvLcip7TQER0KGptQh7IfMYWS1HxjPXLiMOVRxU+hSmZucBqxWh
         OrpP9bSaDgKfT53pBkgRd9m58jMKALRKJtTMzZ+kIwAmant7i0ZvVmJgaajYEoT2UjTM
         g4Z215TDZrZvA+A27uYt7/L6VpFNTG7AFMLjDK4yz9kq+JEPkXli9HxXTERsD35WVkyH
         7iUZqqvaXacPAh8JzSpc0y1Yl9TWFYPgvgM+A882WjPQHVG4Rcd+wDrKiiTJQLvXW0k+
         5fEQ==
X-Gm-Message-State: AOAM530alApyeDsT4PfWinv14TVKyzUuLzc1pCteXLMVbmMiuN9Fs+mQ
        Y/ldRGQlgHvXiHnhEWGxe2DVuCVnX9PWK4aNa44=
X-Google-Smtp-Source: ABdhPJz2lfIVwtn96FoYve+xIiUM5OrQJYQhB/O0PxSt7KtdN1mv/Gw/qQgfYdL+AEPFs0EvoypuIPv6ygF2wmZkkC8=
X-Received: by 2002:a17:90a:d78d:: with SMTP id z13mr2837590pju.228.1630575433163;
 Thu, 02 Sep 2021 02:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com> <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
 <CAHp75Vf76-qf=9_tnYYnXw8C15GNcf0Up-kt3GKoe_hd=i3UcA@mail.gmail.com> <7ae1497c-958b-4027-ab47-41ff854d25cc@t-8ch.de>
In-Reply-To: <7ae1497c-958b-4027-ab47-41ff854d25cc@t-8ch.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Sep 2021 12:36:37 +0300
Message-ID: <CAHp75Vcm74nw5RF=LJHAi3+Bn0iVxc4aQqKdG_Ah2_x3o2iv_Q@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Daniel Dadap <ddadap@nvidia.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Sep 2, 2021 at 12:33 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
> On Do, 2021-09-02T12:28+0300, Andy Shevchenko wrote:
> > On Wed, Sep 1, 2021 at 12:25 PM Thomas Wei=C3=9Fschuh <linux@weissschuh=
.net> wrote:
> >
> > > > v4: Use MODULE_DEVICE_TABLE() (Thomas Wei??schuh <thomas@t-8ch.de>)
> > > >     Fix scope of internal driver state; various style fixes (Barnab=
??s
> > > >     P??cze, Andy Shevchenko)
> > > >     Use devm_backlight_device_register() (Barnab??s P??cze)
> > > >     Add kerneldoc comments for enums and structs (Andy Shevchenko)
> > >
> > > It seems your Mailsetup breaks Unicode.
> >
> > I see it properly, so, the problem is on your branch of email delivery.
>
> It's also broken on lore.kernel.org:
> https://lore.kernel.org/platform-driver-x86/20210831224906.1072-1-ddadap@=
nvidia.com/

Ah, okay then. It seems I got a direct copy through a different chain
of servers.

--=20
With Best Regards,
Andy Shevchenko
