Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C20C433E9
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 20:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4321221ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 20:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbhAQU4n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 15:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729880AbhAQU4i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 15:56:38 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF62C061575
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:55:58 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y8so7513280plp.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FW7tf7fovkxqur+gXWPbj0nZWEDTm9fWcYyDHePgTuo=;
        b=ZSsJ0iIiVNlv0C0yMqgTEO9De82n++vz3G84Dnbjtdj56xB5DrEdsFTh5PVaf0GAsK
         bAussXxLvcJZZB3lDTQ5SKNZIbQ8U03Hwbk2SMKMKaM2XP/MkFGVpGxDCXvVAr/VM42K
         9VzypeEsfHr9bMQwYvx6kknW8Y8FhWX5Wr0djjD2yvouk85r+HNxzI97G0EAb9PAyx5r
         uHx3gEzriz3Vb4v/PsqonwIYAcNjT+T0dfYHCDzzPcSJhfvXR8dxZgpWOOA5ddjKwlWB
         Ps3vpV5D2+k7p/ZO7+oG75sj1bSgEDd6zwqXh374kVifJ1WjSxwqLZz+Czf2BUWt+P1y
         dvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FW7tf7fovkxqur+gXWPbj0nZWEDTm9fWcYyDHePgTuo=;
        b=hBcP2HF4f1PPiY5YS4+zsef2zIpKdSeVM0C0jDwzXTkVxy+fHGT8+iry2hoB5C/o7+
         bpWJNnE3ENSOSfJjdqGeOxbH4a1lwwlG4eriXRIs/rtCVLzt9CzJMdELIsE2mdgx5jYq
         161a25Xr77OVsNLcONIdBZ1MUcCM3UUXGSYgIrqQbpxSZMsEoWrhhMcJEqPs8C4ps8a0
         7HMIyBqRy2qk2ErcvgxCCe5wy1Vio6LLGoYyhuMMq+kAyWFbluSfLCLgnk1rSCCTjFR5
         zlLi98sPAyE1Xmy27gnjYQaNvJ9awwVx7dHWsZQREYLKXNXj1QwrZAo4pwbLSg8FvcPn
         pfeg==
X-Gm-Message-State: AOAM53012b1K1lufY0MRgJH54lUY002z5mQwI7GdqI01Nq34qnxc0g54
        TWSMbW6W10tidxalPkRwRpOVyFQ6YWVTSgg9QBE=
X-Google-Smtp-Source: ABdhPJyjs3yIvj1i7dBIF4xdHfoLUX2pw6/Q1Ea1qH3OEqqhHNr6a796fTNea8DY/mNWu+yc3wBEgQhPTx2qQZmK0Bk=
X-Received: by 2002:a17:90a:4d83:: with SMTP id m3mr22885210pjh.228.1610916957760;
 Sun, 17 Jan 2021 12:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-22-pobrn@protonmail.com>
 <CAHp75VcSnygW5TgZePcF96uMk9et25doqxmWieMdbtaRb5hS4w@mail.gmail.com> <IsMD9D-Q_PWUoLKzhXMQ8VK3xxRZJ9KYw1N6Yx3ClQerrFdp7KaGK0EZGbIPpIBHJ5sFYoUpJGE_mY2WFtDy_st4EgJw2AuX7gOgueO_Nqw=@protonmail.com>
In-Reply-To: <IsMD9D-Q_PWUoLKzhXMQ8VK3xxRZJ9KYw1N6Yx3ClQerrFdp7KaGK0EZGbIPpIBHJ5sFYoUpJGE_mY2WFtDy_st4EgJw2AuX7gOgueO_Nqw=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 17 Jan 2021 22:55:41 +0200
Message-ID: <CAHp75VceYKFRc02gtuTLBA2bP=PDNBHKBYJrwajRdpOAhfgfMQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/24] platform/x86: ideapad-laptop: add keyboard
 backlight control support
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

On Sun, Jan 17, 2021 at 12:44 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> 2021. janu=C3=A1r 16., szombat 21:07 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:
> > On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > > +       struct {
> > > +               bool initialized;
> > > +               struct led_classdev led;
> > > +               unsigned int last_brightness;
> > > +       } kbd_bl;
> >
> > Data structure without sense.

> It makes a lot of sense to me, it groups the members which are concerned =
with
> keyboard backlight control. Do you have any specific issues with it? And
> what would you suggest instead?

Oops, I somehow misread it as similar to one with boolean bit fields.
Sorry, please,  disregard my comment.


--=20
With Best Regards,
Andy Shevchenko
