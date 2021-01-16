Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E1C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB78721D7A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPU3N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:29:13 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:37670 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbhAPU3M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:29:12 -0500
Date:   Sat, 16 Jan 2021 20:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610828910;
        bh=XjXZ/VnWDn9/9uY3bpVB3qCT1CKJh4laGgmahIQjsJU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=yNAMe9C53jaT1UrISaUwPYOW+KBjHg+qcfclr25fuC1MnpCZmqGtyv/OPEGzC5t3Y
         GnhFD8Kj3qp99qovGOThsaplpGf0njM15sZrcRp5prZNpLjVzhLYuY9n/rBlZ5f+OY
         MqelnBlzEliRnQtEKo9mg8o4wfQJ7NJNpChSZ0Hs=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 08/24] platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in case of failure
Message-ID: <NStEFinV-Kv0jDbXxLVig-6zyCjJmyjZkDDeZR29ZJrg_n4jkTBONiDde-4T1dId-t5HADf_QmVjs8LBQU601IDKwshLrQDKWiLGhAe2XFc=@protonmail.com>
In-Reply-To: <CAHp75Vf-a4D0u6dmJso6jkHCXyCYGm-MFTgM08y2E_OiMr3qFg@mail.gmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-9-pobrn@protonmail.com> <CAHp75Vf-a4D0u6dmJso6jkHCXyCYGm-MFTgM08y2E_OiMr3qFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


> On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > ACPI helpers returned -1 in case of failure. Convert these functions to
> > return appropriate error codes, and convert their users to propagate
> > these error codes accordingly.
>
> ...
>
> > -       int val;
> > +       int val, err;
> >         unsigned long int end_jiffies;
>
> Perhaps in this and other similar cases switch to reversed xmas tree
> order at the same time?
> [...]

Thanks for the review; I intentionally tried to make as few modifications
as possible in order to achieve what I wanted. I deemed it better to
place all "coding style"-related changes in their own patch (19).

I would prefer to keep it this way. Do you have any objections?


Thanks,
Barnab=C3=A1s P=C5=91cze
